
module array_multiplier (
    input signed [31:0] a, x,
    output signed [63:0] P
);
    wire [31:0] S [31:0];
    wire [30:0] C [31:0];
    
    assign S[0] = {(~x[0] & a[31]), {31{x[0]}} & a[30:0]};
    assign C[0] = 31'b0;
    
    genvar i, j;
    //to generata the end colum
    generate
        for (i = 1; i < 31; i = i + 1) begin
            assign S[i][31] = (a[31] & ~x[i]);
        end
    endgenerate
    
    generate
        for (i = 0; i < 31; i = i + 1) begin
            for (j = 0; j < 31; j = j + 1) begin
             if (i<30)begin

                full_adder fa (
                    .a(C[i][j]),
                    .b(S[i][j+1]),
                    .c_in(x[i+1] & a[j]),
                    .sum(S[i+1][j]),
                    .carry(C[i+1][j])
                );
            end else begin

                full_adder fa (
                    .a(C[i][j]),
                    .b(S[i][j+1]),
                    .c_in(x[i+1] & ~a[j]),
                    .sum(S[i+1][j]),
                    .carry(C[i+1][j])
                ); 
       end
      end
        end
    endgenerate
    
    wire [31:0] C_final;
    wire [30:0] S_final;
    
    full_adder f_fa (
        .a(S[31][0]),
        .b(a[31]),
        .c_in(x[31]),
        .sum(P[31]),
        .carry(C_final[0])
    );
    
    wire sign_carry;
    full_adder fa_sign (
        .a(a[31] & x[31]),
        .b(~a[31]),
        .c_in(~x[31]),
        .sum(S[31][31]),
        .carry(sign_carry)
    );
    
    generate
        for (i = 0; i < 31; i = i + 1) begin
            full_adder fa_final (
                .a(C[31][i]),
                .b(S[31][i+1]),
                .c_in(C_final[i]),
                .sum(S_final[i]),
                .carry(C_final[i+1])
            );
        end
    endgenerate
    
    full_adder fa_sign_final (
        .a(1'b1),
        .b(sign_carry),
        .c_in(C_final[31]),
        .sum(P[63]),
        .carry()
    );
    
    assign P[62:32] = S_final;
    
    generate
        for (i = 0; i < 31; i = i + 1) begin
            assign P[i] = S[i][0];
        end
    endgenerate
endmodule
