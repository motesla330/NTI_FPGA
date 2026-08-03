module bin_to_gray #(parameter WIDTH = 3)(
    input  [WIDTH-1:0] A,
    output [WIDTH-1:0] B
);

    assign B = A ^ (A >> 1);

endmodule