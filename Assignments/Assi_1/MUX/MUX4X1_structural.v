
module MUX2X1_STRUCT (
    input   wire    A,
    input   wire    B,
    input   wire    S,
    output  wire    Y
);
    assign Y = S ? B : A;
endmodule


module MUX4X1_STRUCTURAL (
    input   wire        I0,
    input   wire        I1,
    input   wire        I2,
    input   wire        I3,
    input   wire [1:0]  SEL,
    output  wire        Y
);

wire m_low, m_high;

MUX2X1_STRUCT U_LOW  (.A(I0),    .B(I1),    .S(SEL[0]), .Y(m_low));
MUX2X1_STRUCT U_HIGH (.A(I2),    .B(I3),    .S(SEL[0]), .Y(m_high));
MUX2X1_STRUCT U_OUT  (.A(m_low), .B(m_high),.S(SEL[1]), .Y(Y));

endmodule
