//2M hz
`timescale 1ns/1ps
module light_div_tb(
   
);

reg clk;
reg rst;
reg hold;
wire [3:0] out;

light_div_top light_div_top_inst(
    .clk(clk),
    .rst(rst),
    .hold(hold),
    .out(out)
);
always #500 clk = ~clk;

initial begin
    clk = 1'b0;
    rst = 1'b1;
    hold = 1'b0;
    #2000 rst = 1'b0;
    #10000000 hold = 1'b1;
    #10000000 hold = 1'b0;
    #10000000 $finish;
end

endmodule
    