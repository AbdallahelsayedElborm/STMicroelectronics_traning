
module G_adder_1 #(parameter N=32)(
input  signed[(N-1):0]A,B,
input c_in,
output signed [(N-1):0]s,
output c_out    );
assign {c_out,s}=A+B+c_in;
endmodule