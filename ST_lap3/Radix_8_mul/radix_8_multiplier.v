
module radix_8_multiplier_CSA(
 //define input and output
    input clk,rst,
    input signed [31:0]a,x,
    output signed [63:0]p  
);
reg [31:0]sum_reg;
reg[32:0]carry_reg;
reg [63:0]p_reg;
reg c_ff;
reg [3:0]count;

wire  [2:0]out_small_ad_sum;//3bit small adder sum output 
wire out_small_ad_carry;//1bit small adder carry 
wire  [31:0]out_big_ad_sum;//31 bit big adder sum output 
wire out_big_ad_carry; //1bit big adder(carry adder propagat)
wire [33:0]a_x0_mux=p_reg[0]?{{2{a[31]}},a}:0; //mux to select if we add a or zero
wire [33:0]a_x1_mux=p_reg[1]?(count==10?-({a[31],a,1'b0}):({a[31],a,1'b0})):0;//mux to select if we add 2a or zero
wire [33:0]a_x2_mux=p_reg[2]?{a,2'b0}:0;//mux to select if we add 3a or zero

wire [33:0]s_csa1,c_csa1,s_csa2,c_csa2;
wire [34:0]s_csa3,c_csa3;
CSA #(.N(34)) csa1(a_x0_mux ,a_x1_mux ,a_x2_mux,s_csa1,c_csa1 );
CSA #(.N(34)) csa2({{2{sum_reg[31]}},sum_reg},s_csa1,{{carry_reg[32]},carry_reg},s_csa2,c_csa2 );
CSA #(.N(35)) csa3({s_csa2[33],s_csa2},{c_csa2,1'b0},{c_csa1,1'b0},s_csa3,c_csa3);

adder #(.N(3)) small_adder(s_csa3[2:0],{c_csa3[1:0],c_ff},1'b0,out_small_ad_sum,out_small_ad_carry);
adder #(.N(33)) big_adder({sum_reg[31], sum_reg },carry_reg,c_ff,out_big_ad_sum,out_big_ad_carry);
//////////////////////////////////////////////////////////////
/*counter*/always @(posedge clk or posedge rst) begin
    if (rst) begin
      count<=4'd0;
    end
    else begin
      count<=count+1;
    end
end
/*c_ff*/always @(posedge clk or posedge rst) begin
    if (rst) begin
        c_ff<=0;
    end
    else begin
        c_ff<=out_small_ad_carry;
    end
end
/*sum_reg*/always @(posedge clk or posedge rst) begin
    if (rst) begin
        sum_reg<=0;
    end
    else begin
        sum_reg<=s_csa3[34:3];
    end
end
/*carry_reg*/always @(posedge clk or posedge rst) begin
    if (rst) begin
        carry_reg<=0;
    end
    else begin
        carry_reg<=c_csa3[34:2];
    end
end
/*p_reg*/always @(posedge clk or posedge rst) begin
    if (rst) begin
      p_reg<=  {32'b0,x};
    end 
    else begin
        if (count ==4'b1011) begin
            p_reg<={out_big_ad_sum,p_reg[32:0]};
        end
        else begin
            p_reg[32:0]<={out_small_ad_sum,p_reg[32:3]};
            
        end
    end
end
assign p=p_reg;
endmodule //CSA radix 8 multiplier
