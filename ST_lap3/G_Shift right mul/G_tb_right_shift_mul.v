
module G_tb_R_shift_mul_32bitT();
parameter N=32;
  reg clk, rst;
  reg signed [(N-1):0] a, x;
  wire signed [((2*N)-1):0] p;
  
  reg signed [((2*N)-1):0] expected;

   G_right_shift #(.N(N)) uut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .x(x),
    .p(p)
  );

  // Clock generation (100 MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
 
  // Main test sequence
  initial begin
    
    // Test various cases with signed numbers
    
    // Test Case 1: Positive * Negative
    rst = 1;
    a = 32'h12345678;
    x = 32'h12345678;
    expected = a * x;
    #5;
    rst = 0;
    #320;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 2: Negative * Positive
    rst = 1;
    a = 32'h1A2B3C4D;
    x = 32'h11223344;
    expected = a * x;
    #5;
    rst = 0;
    #320;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 3: Positive * Positive
    rst = 1;
    a = 32'h7FFFFFFF;
    x = 32'h00000002;
    expected = a * x;
    #5;
    rst = 0;
    #320;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 4: Negative * Negative
    rst = 1;
    a = 32'h40000000;
    x = 32'h00000002;
    expected = a * x;
    #5;
    rst = 0;
    #320;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 5: Zero * Any number
    rst = 1;
    a = 32'h00000000;
    x = 32'h12;
    expected = a * x;
    #5;
    rst = 0;
    #320;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 6: Maximum Negative * -1 (Check overflow behavior)
    rst = 1;
    a = 32'h80000000;
    x = -32'h00000001;
    expected = a * x;
    #5;
    rst = 0;
    #320;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 7: Large numbers multiplication
    rst = 1;
    a = 32'h76543210;
    x = 32'h12345678;
    expected = a * x;
    #5;
    rst = 0;
    #320;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 8: Small numbers multiplication
    rst = 1;
    a = 32'h00000002;
    x = -32'h00000003;
    expected = a * x;
    #5;
    rst = 0;
    #320;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 9: Negative small numbers multiplication
    rst = 1;
    a = -32'h00000002;
    x =  32'h00000003;
    expected = a * x;
    #5;
    rst = 0;
    #320;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 10: One operand as one
    rst = 1;
    a = 32'h00000001;
    x = -32'h76543210;
    expected = a * x;
    #5;
    rst = 0;
    #320;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    $stop;
  end
endmodule
