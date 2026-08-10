module light_div_top (
    input clk,
    input rst,
    input hold,
    output [3:0] out
);
    wire clk_out;
    
    clk_div clk_div_inst (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );
    
    light light_inst (
        .clk(clk_out),
        .rst(rst),
        .hold(hold),
        .out(out)
    );
    endmodule