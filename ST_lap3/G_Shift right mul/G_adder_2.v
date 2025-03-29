
module adder #(parameter N=32)
(
    input [N-1:0]a,b,
    input c_in,
    output [N-1:0]s,
    output c_out
);
assign {c_out,s}=a+b+c_in;

endmodule