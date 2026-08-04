// ============================================================
// MUX4X1_BEHAVIORAL
// Behavioral modeling style: describes WHAT the circuit does
// using a procedural always block + case statement.
// SEL = 00 -> I0 | 01 -> I1 | 10 -> I2 | 11 -> I3
// ============================================================
module MUX4X1_BEHAVIORAL (
    input   wire        I0,
    input   wire        I1,
    input   wire        I2,
    input   wire        I3,
    input   wire [1:0]  SEL,
    output  reg         Y
);

always @(*) begin
    case (SEL)
        2'b00: Y = I0;
        2'b01: Y = I1;
        2'b10: Y = I2;
        2'b11: Y = I3;
        default: Y = 1'bx;
    endcase
end

endmodule
