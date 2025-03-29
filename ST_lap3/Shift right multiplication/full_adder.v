
module adder_1(
input  signed[31:0]A,B,
input c_in,
output signed [31:0]s,
output c_out    );
assign {c_out,s}=A+B+c_in;
endmodule