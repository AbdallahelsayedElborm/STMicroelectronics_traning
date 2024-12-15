`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 11:17:35 PM
// Design Name: 
// Module Name: top_module_ladner64
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_module_ladner64(
input [63:0]a1,a2,
input c_in,
output c_out,

output [63:0]s  
    );
  wire [63:0]g,p,po,go; 
  wire [64:0]c;
  assign c[0]=c_in;
  
  assign g= a1&a2;  
  assign p=a1^a2;
   
   ladner64bit uu(g[63:0],p[63:0],go[63:0],po[63:0]);
   //assign s[0]=p[0];
   
   assign c[64:1]=go[63:0]|(c[0]&p[63:0]);

assign s[63:0]=p[63:0]^c[63:0]; 
   
     assign c_out =c[64]; 
endmodule
