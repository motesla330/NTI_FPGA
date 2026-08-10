//2M HZ TO 2 HZ
module clk_div(
    input clk,
    input rst,
    output reg clk_out
);
    reg [20:0] count;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 21'b0;
            clk_out <= 1'b0;
        end else begin
            if (count == 21'd999_999) begin
                count <= 21'b0;
                clk_out <= ~clk_out;
            end else begin
                count <= count + 1'b1;
            end
        end
    end
    endmodule