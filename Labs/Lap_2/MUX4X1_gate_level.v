// ============================================================
// MUX4X1_GATE
// Gate-level modeling style: built directly from Verilog
// primitive gates (not/and/or), implementing the sum-of-
// products (SOP) equation for a 4x1 mux:
//
//   Y = (SEL1'.SEL0'.I0) + (SEL1'.SEL0.I1)
//     + (SEL1.SEL0'.I2)  + (SEL1.SEL0.I3)
// ============================================================
module MUX4X1_GATE (
    input   wire        I0,
    input   wire        I1,
    input   wire        I2,
    input   wire        I3,
    input   wire [1:0]  SEL,
    output  wire        Y
);

wire S0n, S1n;      // inverted select lines
wire w0, w1, w2, w3; // one AND term per input

// invert select lines
not (S0n, SEL[0]);
not (S1n, SEL[1]);

// AND terms: one product term per data input, active for its SEL code
and (w0, I0, S1n,    S0n);    // SEL = 00
and (w1, I1, S1n,    SEL[0]); // SEL = 01
and (w2, I2, SEL[1], S0n);    // SEL = 10
and (w3, I3, SEL[1], SEL[0]); // SEL = 11

// sum the product terms
or (Y, w0, w1, w2, w3);

endmodule
