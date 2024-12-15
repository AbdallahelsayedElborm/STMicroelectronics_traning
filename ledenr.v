`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 05:38:48 PM
// Design Name: 
// Module Name: ledenr
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


module ladner_2bit(
input [1:0]g,p,
output [1:0]go,po
    );
    
    assign go[0]=g[0];
    assign go[1]=g[1]|(g[0]&p[1]);
    
    assign po[0]=p[0];
    assign po[1]=p[0]&p[1];
    
endmodule
