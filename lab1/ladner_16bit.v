`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 08:32:27 PM
// Design Name: 
// Module Name: ladner_16bit
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


module ladner_16bit(input [15:0]g,p,
output [15:0]go,po
    );
    wire [15:0]gi,pi;
   ladner_8bit u1(g[7:0],p[7:0],gi[7:0],pi[7:0]); 
   ladner_8bit u2(g[15:8],p[15:8],gi[15:8],pi[15:8]); 
 
   assign  go[0]=gi[0];
   assign  go[1]= gi[1];
   assign  go[2]= gi[2];
   assign  go[3]= gi[3];
   assign  go[4]= gi[4];
   assign  go[5]= gi[5];   
   assign  go[6]= gi[6];   
   assign  go[7]= gi[7];
   
   //assign go[7:0]=gi[7:0];
   assign  go[8]= gi[8]|(g[7]&p[8]); 
   assign  go[9]= gi[9]|(g[7]&p[9]); 
   assign  go[10]= gi[10]|(g[7]&p[10]); 
   assign  go[11]= gi[11]|(g[7]&p[11]); 
   assign  go[12]= gi[12]|(g[7]&p[12]); 
   assign  go[13]= gi[13]|(g[7]&p[13]); 
   assign  go[14]= gi[14]|(g[7]&p[14]); 
   assign  go[15]= gi[15]|(g[7]&p[15]); 

   
   assign po[0]=pi[0];
   assign po[1]=pi[1];
   assign po[2]=pi[2];
   assign po[3]=pi[3];
   assign po[4]=pi[4];
   assign po[5]=pi[5];
   assign po[6]=pi[6];
   assign po[7]=pi[7];
   assign po[8]=pi[7]&pi[8];
   assign po[9]=pi[7]&pi[9]; 
   assign po[10]=pi[7]&pi[10]; 
   assign po[11]=pi[7]&pi[11]; 
   assign po[12]=pi[7]&pi[12]; 
   assign po[13]=pi[7]&pi[13]; 
   assign po[14]=pi[7]&pi[14]; 
   assign po[15]=pi[7]&pi[15];       
endmodule
