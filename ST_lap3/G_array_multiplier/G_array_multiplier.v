
module G_array_multiplier #(parameter N=64) (
    input signed [(N-1):0] a, x,
    output signed [((2*N)-1):0] P
);
    wire [(N-1):0] S [(N-1):0];
    wire [(N-2):0] C [(N-1):0];
    
    assign S[0] = {(~x[0] & a[(N-1)]), {(N-1){x[0]}} & a[(N-2):0]};
    assign C[0] = {(N-1){1'b0}};
    
    genvar i, j;
    //to generata the end colum
    generate
        for (i = 1; i < (N-1); i = i + 1) begin
            assign S[i][(N-1)] = (a[(N-1)] & ~x[i]);
        end
    endgenerate
    
    generate
        for (i = 0; i < (N-1); i = i + 1) begin
            for (j = 0; j < (N-1); j = j + 1) begin
             if (i<(N-2))begin

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
    
    wire [(N-1):0] C_final;
    wire [(N-2):0] S_final;
    
    full_adder f_fa (
        .a(S[(N-1)][0]),
        .b(a[(N-1)]),
        .c_in(x[(N-1)]),
        .sum(P[(N-1)]),
        .carry(C_final[0])
    );
    
    wire sign_carry;
    full_adder fa_sign (
        .a(a[(N-1)] & x[(N-1)]),
        .b(~a[(N-1)]),
        .c_in(~x[(N-1)]),
        .sum(S[(N-1)][(N-1)]),
        .carry(sign_carry)
    );
    
    generate
        for (i = 0; i < (N-1); i = i + 1) begin
            full_adder fa_final (
                .a(C[(N-1)][i]),
                .b(S[(N-1)][i+1]),
                .c_in(C_final[i]),
                .sum(S_final[i]),
                .carry(C_final[i+1])
            );
        end
    endgenerate
    
    full_adder fa_sign_final (
        .a(1'b1),
        .b(sign_carry),
        .c_in(C_final[(N-1)]),
        .sum(P[((2*N)-1)]),
        .carry()
    );
    
    assign P[((2*N)-2):N] = S_final;
    
    generate
        for (i = 0; i < (N-1); i = i + 1) begin
            assign P[i] = S[i][0];
        end
    endgenerate
endmodule