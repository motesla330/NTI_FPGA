module alu #(parameter WIDTH = 8)(
    input [2:0] opcode,
    input [WIDTH-1:0] in_a,
    input [WIDTH-1:0] in_b,
    output reg a_is_zero,
    output reg [WIDTH-1:0] alu_out
);

always @(*) begin
    case (opcode)
        3'b000: alu_out = in_a;          // PASS0
        3'b001: alu_out = in_a;          // PASS1
        3'b010: alu_out = in_a + in_b;   // ADD
        3'b011: alu_out = in_a & in_b;   // AND
        3'b100: alu_out = in_a ^ in_b;   // XOR
        3'b101: alu_out = in_b;          // PASSB
        3'b110: alu_out = in_a;          // PASS6
        3'b111: alu_out = in_a;          // PASS7
        default: alu_out = {WIDTH{1'b0}};
    endcase
    if (in_a == {WIDTH{1'b0}}) begin
        a_is_zero = 1'b1;
    end else begin
        a_is_zero = 1'b0;
    end
end

endmodule