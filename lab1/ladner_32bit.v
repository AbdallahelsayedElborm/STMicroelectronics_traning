`timescale 1ns /1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 09:29:44 PM
// Design Name: 
// Module Name: ladner_32bit
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


module ladner_32bit(input [31:0]g,p,
output [31:0]go,po
    );
    wire [31:0]gi,pi;
   ladner_16bit u1(g[15:0],p[15:0],gi[15:0],pi[15:0]); 
   ladner_16bit u2(g[31:16],p[31:16],gi[31:16],pi[31:16]); 
 
   assign  go[0]=gi[0];
   assign  go[1]= gi[1];
   assign  go[2]= gi[2];
   assign  go[3]= gi[3];
   assign  go[4]= gi[4];
   assign  go[5]= gi[5];   
   assign  go[6]= gi[6];   
   assign  go[7]= gi[7];
   assign  go[8]= gi[8]; 
   assign  go[9]= gi[9]; 
   assign  go[10]= gi[10]; 
   assign  go[11]= gi[11]; 
   assign  go[12]= gi[12]; 
   assign  go[13]= gi[13]; 
   assign  go[14]= gi[14]; 
   assign  go[15]= gi[15]; 
   assign go[16]=gi[16]|(gi[15]&pi[16]);
   assign go[17]=gi[17]|(gi[15]&pi[17]);
   assign go[18]=gi[18]|(gi[15]&pi[18]);
   assign go[19]=gi[19]|(gi[15]&pi[19]);
   assign go[20]=gi[20]|(gi[15]&pi[20]);
   assign go[21]=gi[21]|(gi[15]&pi[21]);
   assign go[22]=gi[22]|(gi[15]&pi[22]);
   assign go[23]=gi[23]|(gi[15]&pi[23]);
   assign go[24]=gi[24]|(gi[15]&pi[24]);
   assign go[25]=gi[25]|(gi[15]&pi[25]);
   assign go[26]=gi[26]|(gi[15]&pi[26]);
   assign go[27]=gi[27]|(gi[15]&pi[27]);
   assign go[28]=gi[28]|(gi[15]&pi[28]);
   assign go[29]=gi[29]|(gi[15]&pi[29]);
   assign go[30]=gi[30]|(gi[15]&pi[30]);
   assign go[31]=gi[31]|(gi[15]&pi[31]);
   
   
   assign po[0]=pi[0];
   assign po[1]=pi[1];
   assign po[2]=pi[2];
   assign po[3]=pi[3];
   assign po[4]=pi[4];
   assign po[5]=pi[5];
   assign po[6]=pi[6];
   assign po[7]=pi[7];
    assign po[8]=pi[8];
    assign po[9]=pi[9]; 
   assign po[10]=pi[10]; 
   assign po[11]=pi[11]; 
   assign po[12]=pi[12]; 
   assign po[13]=pi[13]; 
   assign po[14]=pi[14]; 
   assign po[15]=pi[15];       
   assign po[16]=pi[16]&pi[15];       
   assign po[17]=pi[17]&pi[15];       
   assign po[18]=pi[18]&pi[15];       
   assign po[19]=pi[19]&pi[15];       
   assign po[20]=pi[20]&pi[15];       
   assign po[21]=pi[21]&pi[15];       
   assign po[22]=pi[22]&pi[15];       
   assign po[23]=pi[23]&pi[15];       
   assign po[24]=pi[24]&pi[15];       
   assign po[25]=pi[25]&pi[15];       
   assign po[26]=pi[26]&pi[15];       
   assign po[27]=pi[27]&pi[15];       
   assign po[28]=pi[28]&pi[15];       
   assign po[29]=pi[29]&pi[15];       
   assign po[30]=pi[30]&pi[15];       
   assign po[31]=pi[31]&pi[15];
     

endmodule
