
module G_TB_array_multiplier;
parameter N=64;
    reg signed [(N-1):0] a, x;
    wire signed [((2*N)-1):0] P;
    reg signed [((2*N)-1):0] expected;
    
    G_array_multiplier uut (
        .a(a),
        .x(x),
        .P(P)
    );
    
    initial begin
        $monitor("Time = %0t | a = %d | x = %d | P = %d | Expected = %d", 
                 $time, a, x, P, expected);
        
       a=64'd10;            x = 64 'd85; expected =           a * x; #10;
       a=-64 'd10;          x = -64 'd25; expected =          a * x; #10;
       a=64'd10;            x = -64 'd5; expected =          a * x; #10;
       a=64 'd100;           x = 64 'd5; expected =         a * x; #10;
       a=64 'd235;         x = 64'd62589; expected =    a * x; #10;
       a=-64 'd125;       x = 64'd6789; expected =   a * x; #10;
       a=64 'd0;            x = 64'd1234; expected =        a * x; #10;
       a=64'd5678;          x = -64'd0; expected =        a * x; #10;
       a=-64'd2147483647;   x = 64'd2; expected =  a * x; #10;
       a=-64 'h1ffffffffffffff;  x = -64 'd1; expected =a * x; #10;
        $stop;
    end
endmodule