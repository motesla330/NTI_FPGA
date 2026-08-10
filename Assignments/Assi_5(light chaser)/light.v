module light (
    input clk,
    input rst,
    input hold,
  
    output reg [3:0] out
);
    // Give a defined power-up value to avoid X's in simulation
    //initial out = 4'b0111;

    always @(posedge clk) begin
        if (rst) begin
            out <= 4'b0111;
        end else if (!hold) begin
            case (out)
                4'b0111: out <= 4'b1011;
                4'b1011: out <= 4'b1101;
                4'b1101: out <= 4'b1110;
                4'b1110: out <= 4'b0111;
                default: out <= 4'b0111;
            endcase
        end else begin
            out <= out; // hold current value
        end
    end

endmodule