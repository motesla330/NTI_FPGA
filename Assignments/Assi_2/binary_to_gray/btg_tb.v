
`timescale 1ns/1ps

module tb_bin_to_gray;

    parameter WIDTH = 4;

    reg  [WIDTH-1:0] A;
    wire [WIDTH-1:0] B;

    // Instantiate the DUT
    bin_to_gray #(WIDTH) dut (
        .A(A),
        .B(B)
    );

    initial begin
        $display(" Time\tBinary\tGray");
        $monitor("%4t\t%b\t%b", $time, A, B);

        A = 4'b0000; #10;
        A = 4'b0001; #10;
        A = 4'b0010; #10;
        A = 4'b0011; #10;
        A = 4'b0100; #10;
        A = 4'b0101; #10;
        A = 4'b0110; #10;
        A = 4'b0111; #10;
        A = 4'b1000; #10;
        A = 4'b1001; #10;
        A = 4'b1010; #10;
        A = 4'b1011; #10;
        A = 4'b1100; #10;
        A = 4'b1101; #10;
        A = 4'b1110; #10;
        A = 4'b1111; #10;

        $finish;
    end

endmodule