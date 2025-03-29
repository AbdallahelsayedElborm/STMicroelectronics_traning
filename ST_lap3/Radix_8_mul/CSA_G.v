
module CSA  #(parameter N=32) 
(
    input [N-1:0]x,y,z,
    output [N-1:0]s,c  
);

assign s=x^y^z;
assign c=(x&y)| (y&z)| (x&z); 

endmodule //csa and adder
