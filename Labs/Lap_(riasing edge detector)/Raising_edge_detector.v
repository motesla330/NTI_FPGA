module Raising_edge_detector #(parameter FALL=1) // FALL =1 --> FALLING EDGE DETECTOR, FALL =0 --> RISING EDGE DETECTOR
(
    input clk,
    input rst,
    input level,
    output reg tick
);  

reg [1:0] state ;

localparam [1:0] zero = 2'b00, edg = 2'b01, one = 2'b10;

assign clk_in = FALL ^ clk;

always @(posedge clk_in or posedge rst) begin
    if(rst)
        state <= zero;
    else
        case (state)
            zero: begin 
                tick <= (level) ? 1'b1 : 1'b0;
                state <= (level) ? edg : zero;
            end 
            edg: begin 
                tick <= 1'b1;
                state <=  one ;
            end
            one: begin 
                tick <= 1'b0;
                state <= (level) ? one : zero;
            end
            default: begin 
                tick <= 1'b0;
                state <= zero;
            end
endcase

end 







endmodule 