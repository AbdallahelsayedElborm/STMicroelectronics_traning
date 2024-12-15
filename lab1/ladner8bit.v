`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 08:14:33 PM
// Design Name: 
// Module Name: ladner8bit
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


module ladner_8bit(input [7:0]g,p,
output [7:0]go,po
    );
    wire [7:0]gi,pi;
   ladner_4bit u1(g[3:0],p[3:0],gi[3:0],pi[3:0]); 
   ladner_4bit u2(g[7:4],p[7:4],gi[7:4],pi[7:4]); 
 
   assign  go[0]=gi[0];
   assign  go[1]= gi[1];
   assign  go[2]= gi[2];
   assign  go[3]= gi[3];
   assign  go[4]= gi[4]|(gi[3]&pi[4]);
   assign  go[5]= gi[5]|(gi[3]&pi[5]);   
   assign  go[6]= gi[6]|(gi[3]&pi[6]);   
   assign  go[7]= gi[7]|(gi[3]&pi[7]);   
   
   assign po[0]=pi[0];
   assign po[1]=pi[1];
   assign po[2]=pi[2];
   assign po[3]=pi[3];
   assign po[4]=pi[3]&pi[4];
   assign po[5]=pi[3]&pi[5];
   assign po[6]=pi[3]&pi[6];
   assign po[7]=pi[3]&pi[7];
   
endmodule
