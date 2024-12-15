`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2024 12:37:40 AM
// Design Name: 
// Module Name: tb_top_module_ladner64
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


module tb_top_module_ladner64();
// Parameters

// Inputs
reg [63:0] a1;
reg [63:0] a2;
reg c_in;
// Outputs
wire [63:0] s;
wire c_out;
// Instantiate the Unit Under Test (UUT)
 top_module_ladner64  uut (
.a1(a1),
.a2(a2),
.s(s),
.c_in(c_in),
.c_out(c_out)
);
initial begin
// Initialize Inputs
a1 = 0;
a2 = 0;
c_in=0;
// Apply test vectors
#10 a1 = 64'b00000101; a2=  64'b00000101; 
#10 a1 = 64'b00001111; a2 = 64'b00000001;
#10 a1 = 64'b11111111000000000; a2 = 64'b111111100000001;
#10 a1 = 64'b101010101111; a2 = 64'b010101011111; 
#10 a1 = 64'b00011111; a2 = 64'b000000001; 
#10 a1 = 64'b1111111111111111111111111111111111111111111111111111111111111111;         
    a2 = 64'b1111111111111111111111111111111111111111111111111111111111111111;
// Add more test cases as needed
#10 $stop; // Stop the simulation
end
initial begin
$monitor("At time %t, a1 = %b, a2 = %b, s = %b, c_out = %b",
$time, a1,a2, s, c_out);
end
endmodule
