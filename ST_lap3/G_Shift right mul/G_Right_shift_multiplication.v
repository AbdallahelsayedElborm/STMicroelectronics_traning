
module G_right_shift #(parameter N=32)(
    input clk, rst,
    input signed [(N-1):0] a,
    input signed [(N-1):0] x,
    output reg signed [((2*N)-1):0] p
);
    
    // Internal signals
    wire signed [(N-1):0] sum;
    wire c_out;
    reg [$clog2(N):0] count; 
    wire signed [(N-1):0] A;
    wire cc;
    
    // Determine A based on the least significant bit of P and count value
    assign A = p[0] ? (count == N ? ~a : a) : 0;
    assign cc = (count == N && x[(N-1)]) ? 1 : 0;
     wire msb = count[5] ? (~a[(N-1)]) : a[N-1];
    // Instantiate the adder module to perform addition of P and A
   G_adder_1  Ab (p[((2*N)-1):N], A, cc, sum, c_out);
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin   
            // Reset the registers
            p <= {{N{1'b0}}, x};
            count <= 1;
        end else begin
            if (p[0]) begin 
                // If the least significant bit of P is 1, add A to the upper part of P
                p <= {a?msb:0, sum, p[(N-1):1]};  
            end else begin
                // If LSB = 0, shift P
                p <= {p[((2*N)-1)], p[((2*N)-1):1]}; 
            end
            count <= count + 1;
        end
    end
    
endmodule
