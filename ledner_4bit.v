`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 05:51:04 PM
// Design Name: 
// Module Name: ledner_4bit
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


module ladner_4bit(
input [3:0]g,p,
output [3:0]go,po
    );
    wire [3:0]gi,pi;
   ladner_2bit u1(g[1:0],p[1:0],gi[1:0],pi[1:0]); 
   ladner_2bit u2(g[3:2],p[3:2],gi[3:2],pi[3:2]); 
 
   assign  go[0]=gi[0];
   assign  go[1]= gi[1];
   assign  go[2]= gi[2]|(gi[1]&pi[2]);
   assign  go[3]= gi[3]|(gi[1]&pi[3]);
       
   assign po[0]=pi[0];
   assign po[1]=pi[1];
   assign po[2]=pi[1]&pi[2];
   assign po[3]=pi[3]&pi[1];

    
  
endmodule
