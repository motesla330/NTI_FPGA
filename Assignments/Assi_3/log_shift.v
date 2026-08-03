module log2_shift #(
    parameter WIDTH = 32
)(
    input  [WIDTH-1:0] A,
    output reg [$clog2(WIDTH):0] log2
);

    reg [WIDTH-1:0] temp;

    always @(*) begin
        temp = A;
        log2 = 0;

        while (temp > 1) begin
            temp = temp >> 1;
            log2 = log2 + 1;
        end
    end

endmodule