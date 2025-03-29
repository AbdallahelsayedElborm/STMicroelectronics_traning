



module right_shift (
    input clk, rst,
    input signed [31:0] a,
    input signed [31:0] x,
    output reg signed [63:0] p
);
    
    // Internal signals
    wire signed [31:0] sum;
    wire c_out;
    reg [5:0] count; 
    wire signed [31:0] A;
    wire cc;
    
    // Determine A based on the least significant bit of P and count value
    assign A = p[0] ? (count == 32 ? ~a : a) : 0;
    //assign cc = (count == 32 )? 1 : 0;
     wire msb = count[5] ? (~a[31]) : a[31];
    // Instantiate the adder module to perform addition of P and A
    adder_1 Ab (p[63:32], A, count[5], sum, c_out);
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin   
            // Reset the registers
            p <= {32'b0, x};
            count <= 1;
        end else begin
            if (p[0]) begin 
                // If the least significant bit of P is 1, add A to the upper part of P
                p <= {a?msb:0, sum, p[31:1]};  
            end else begin
                // If LSB = 0, shift P
                p <= {p[63], p[63:1]}; 
            end
            count <= count + 1;
        end
    end
    
endmodule




