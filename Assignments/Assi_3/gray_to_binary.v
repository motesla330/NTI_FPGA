module gray_to_bin #(parameter WIDTH = 4)(
    input  [WIDTH-1:0] G,
    output [WIDTH-1:0] B
);

    assign B[WIDTH-1] = G[WIDTH-1];

    genvar i;
    generate
        for (i = WIDTH-2; i >= 0; i = i - 1) begin : gen_bin
            assign B[i] = B[i+1] ^ G[i];
        end
    endgenerate

endmodule