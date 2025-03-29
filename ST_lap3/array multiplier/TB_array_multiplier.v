
module TB_array_multiplier;
    reg signed [31:0] a, x;
    wire signed [63:0] P;
    reg signed [63:0] expected;
    
    array_multiplier uut (
        .a(a),
        .x(x),
        .P(P)
    );
    
    initial begin
        $monitor("Time = %0t | a = %d | x = %d | P = %d | Expected = %d", 
                 $time, a, x, P, expected);
         a = 32'd0; x = 32'd0; expected = a * x; #10;
        a = 32'hffffffff; x = 32'hffffffff; expected = a * x; #10;
        a = -32'd10; x = 32'd5; expected = a * x; #10;
        a = 32'h7fffffff; x = 32'h7fffffff; expected = a * x; #10;
        a = 32'd10; x = -32'd10; expected = a* x; #10;
        a = -32'd150; x = -32'd5; expected = a * x; #10;
        a = 32'd543; x = 32'd9889; expected = a * x; #10;
        a= -32'd45; x = 32'd569; expected = a * x; #10;
        a = 32'd0; x = 32'd33234; expected = a * x; #10;
        a = 32'd5678; x = 32'd0; expected = a* x; #10;
        a = 32'd2147483647; x = 32'd2; expected = a * x; #10;
        a = -32'd2147483648; x = -32'd1; expected = a * x; #10;
        
        $stop;
    end
endmodule
