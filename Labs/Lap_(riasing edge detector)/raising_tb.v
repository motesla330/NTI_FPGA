`timescale 1ns / 1ps
module raising_tb;

reg clk;
reg rst;    
reg level;
wire tick;

Raising_edge_detector #(.FALL(0)) dut(
    .clk(clk),
    .rst(rst),
    .level(level),
    .tick(tick)
);

always #5 clk = ~clk;

initial begin
    clk = 1'b0;
    rst = 1'b1;
    level = 1'b0;
    #10 rst = 1'b0;
    #12 level = 1'b1;
    #10 level = 1'b0;
  
    #10 $stop;

end 




endmodule