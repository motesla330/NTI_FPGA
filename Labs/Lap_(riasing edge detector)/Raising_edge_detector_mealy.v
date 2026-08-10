module Raising_edge_detector #(parameter FALL=1) // FALL =1 --> FALLING EDGE DETECTOR, FALL =0 --> RISING EDGE DETECTOR
(
    input clk,
    input rst,
    input level,
    output reg tick
);  

reg  state ;

localparam  zero = 1'b0, one = 1'b1;

assign clk_in = FALL ^ clk;

always @(posedge clk_in or posedge rst) begin
    if(rst)
        state <= zero;
    else
        case (state)
            zero: begin 
                if (level) begin
                    tick <= 1'b1;
                    state <= one;
                end 
                else begin
                    tick <= 1'b0;
                    state <= zero;
                end
                tick <= 1'b0;
                state <= (level) ? one : zero;
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