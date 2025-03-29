

module tb_CSA_radix8_mul();
  reg clk, rst;
  reg signed [31:0] a, x;
  reg signed [63:0] expected;
  wire signed [63:0] p;
  

  radix_8_multiplier_CSA uut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .x(x),
    .p(p)
  );


  // Clock generation (100 MHz -> 10ns period -> 5ns half-period)
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle clock every 5ns
  end

  // Main test sequence
  initial begin
    // Apply reset
    rst = 1;
    a = 32'hFFFFFFFF; // -1 in signed 32-bit
    x = 32'hFFFFFFFF; // -1 in signed 32-bit
    expected = a * x;
    #5;
    rst = 0;
    #120;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 2: Maximum positive numbers
    rst = 1;
    a = 32'h7FFFFFFF; // 2147483647 in signed 32-bit
    x = 32'h7FFFFFFF; // 2147483647 in signed 32-bit
    expected = a * x;
    #5;
    rst = 0;
    #120;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 3: Mixed sign multiplication
    rst = 1;
    a = -12345678;
    x = 98765432;
    expected = a * x;
    #5;
    rst = 0;
    #120;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 4: Zero multiplication
    rst = 1;
    a = 0;
    x = 123456;
    expected = a * x;
    #5;
    rst = 0;
    #120;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 5: One operand as one
    rst = 1;
    a = 1;
    x = -98765;
    expected = a * x;
    #5;
    rst = 0;
    #120;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Additional Test Cases
    // Test Case 6: Small positive numbers
    rst = 1;
    a = 12;
    x = 34;
    expected = a * x;
    #5;
    rst = 0;
    #120;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 7: Large negative and positive number
    rst = 1;
    a = -2147483647;
    x = 2;
    expected = a * x;
    #5;
    rst = 0;
    #120;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 8: Power of two multiplication
    rst = 1;
    a = 1024;
    x = 2048;
    expected = a * x;
    #5;
    rst = 0;
    #120;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 9: Small negative numbers
    rst = 1;
    a = -3;
    x = -7;
    expected = a * x;
    #5;
    rst = 0;
    #120;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Test Case 10: Random large values
    rst = 1;
    a = 987654;
    x = 123456;
    expected = a * x;
    #5;
    rst = 0;
    #120;
    $display("%d * %d = %d (expected %d)", a, x, p, expected);
    
    // Stop simulation
    $stop;
  end

endmodule