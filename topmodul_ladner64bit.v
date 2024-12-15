`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 09:50:16 PM
// Design Name: 
// Module Name: topmodul_ladner64bit
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


module ladner64bit(input [63:0]g,p,
output [63:0]go,po
    );
    wire [63:0]gi,pi;
   ladner_32bit u1(g[31:0],p[31:0],gi[31:0],pi[31:0]); 
   ladner_32bit u2(g[63:32],p[63:32],gi[63:32],pi[63:32]); 
 
   assign  go[0]= gi[0];
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
   assign go[16]=gi[16];
   assign go[17]=gi[17];
   assign go[18]=gi[18];
   assign go[19]=gi[19];
   assign go[20]=gi[20];
   assign go[21]=gi[21];
   assign go[22]=gi[22];
   assign go[23]=gi[23];
   assign go[24]=gi[24];
   assign go[25]=gi[25];
   assign go[26]=gi[26];
   assign go[27]=gi[27];
   assign go[28]=gi[28];
   assign go[29]=gi[29];
   assign go[30]=gi[30];
   assign go[31]=gi[31];
   //assign go[63:32]=gi[63:32]|(pi[63:32]&gi[31]);
    assign go[32]=gi[32]|(pi[32]&gi[31]);
    assign go[33]=gi[33]|(pi[33]&gi[31]);
    assign go[34]=gi[34]|(pi[34]&gi[31]);
    assign go[35]=gi[35]|(pi[35]&gi[31]);
    assign go[36]=gi[36]|(pi[36]&gi[31]);
    assign go[37]=gi[37]|(pi[37]&gi[31]);
    assign go[38]=gi[38]|(pi[38]&gi[31]);
    assign go[39]=gi[39]|(pi[39]&gi[31]);
    assign go[40]=gi[40]|(pi[40]&gi[31]);
    assign go[41]=gi[41]|(pi[41]&gi[31]);
    assign go[42]=gi[42]|(pi[42]&gi[31]);
    assign go[43]=gi[43]|(pi[43]&gi[31]);
    assign go[44]=gi[44]|(pi[44]&gi[31]);
    assign go[45]=gi[45]|(pi[45]&gi[31]);
    assign go[46]=gi[46]|(pi[46]&gi[31]);
    assign go[47]=gi[47]|(pi[47]&gi[31]);
    assign go[48]=gi[48]|(pi[48]&gi[31]);
    assign go[49]=gi[49]|(pi[49]&gi[31]);
    assign go[50]=gi[50]|(pi[50]&gi[31]);
    assign go[51]=gi[51]|(pi[51]&gi[31]);
    assign go[52]=gi[52]|(pi[52]&gi[31]);
    assign go[53]=gi[53]|(pi[53]&gi[31]);
    assign go[54]=gi[54]|(pi[54]&gi[31]);
    assign go[55]=gi[55]|(pi[55]&gi[31]);
    assign go[56]=gi[56]|(pi[56]&gi[31]);
    assign go[57]=gi[57]|(pi[57]&gi[31]);
    assign go[58]=gi[58]|(pi[58]&gi[31]);
    assign go[59]=gi[59]|(pi[59]&gi[31]);
    assign go[60]=gi[60]|(pi[60]&gi[31]);
    assign go[61]=gi[61]|(pi[61]&gi[31]);
    assign go[62]=gi[62]|(pi[62]&gi[31]);
    assign go[63]=gi[63]|(pi[63]&gi[31]);
    
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
   assign po[16]=pi[16];       
   assign po[17]=pi[17];       
   assign po[18]=pi[18];       
   assign po[19]=pi[19];       
   assign po[20]=pi[20];       
   assign po[21]=pi[21];       
   assign po[22]=pi[22];       
   assign po[23]=pi[23];       
   assign po[24]=pi[24];       
   assign po[25]=pi[25];       
   assign po[26]=pi[26];       
   assign po[27]=pi[27];       
   assign po[28]=pi[28];       
   assign po[29]=pi[29];       
   assign po[30]=pi[30];       
   assign po[31]=pi[31];
  // assign po[63:32]=pi[31]&pi[63:32];
   assign po[32]=pi[31]&pi[32];      
   assign po[33]=pi[31]&pi[33];      
   assign po[34]=pi[31]&pi[34];      
   assign po[35]=pi[31]&pi[35];      
   assign po[36]=pi[31]&pi[36];      
   assign po[37]=pi[31]&pi[37];      
   assign po[38]=pi[31]&pi[38];      
   assign po[39]=pi[31]&pi[39];      
   assign po[40]=pi[31]&pi[40];      
   assign po[41]=pi[31]&pi[41];      
   assign po[42]=pi[31]&pi[42];      
   assign po[43]=pi[31]&pi[43];      
   assign po[44]=pi[31]&pi[44];      
   assign po[45]=pi[31]&pi[45];      
   assign po[46]=pi[31]&pi[46];      
   assign po[47]=pi[31]&pi[47];      
   assign po[48]=pi[31]&pi[48];      
   assign po[49]=pi[31]&pi[49];      
   assign po[50]=pi[31]&pi[50];      
   assign po[51]=pi[31]&pi[51];      
   assign po[52]=pi[31]&pi[52];      
   assign po[53]=pi[31]&pi[53];      
   assign po[54]=pi[31]&pi[54];      
   assign po[55]=pi[31]&pi[55];      
   assign po[56]=pi[31]&pi[56];      
   assign po[57]=pi[31]&pi[57];      
   assign po[58]=pi[31]&pi[58];      
   assign po[59]=pi[31]&pi[59];      
   assign po[60]=pi[31]&pi[60];      
   assign po[61]=pi[31]&pi[61];
   assign po[62]=pi[31]&pi[62];
      
   assign po[63]=pi[31]&pi[63];      
       


endmodule


    
