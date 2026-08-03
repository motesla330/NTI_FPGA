
module MUX4X1_GATE (
    input   wire        I0,
    input   wire        I1,
    input   wire        I2,
    input   wire        I3,
    input   wire [1:0]  SEL,
    output  wire        Y
);

wire S0n, S1n;      
wire w0, w1, w2, w3; 

// invert select lines
not (S0n, SEL[0]);
not (S1n, SEL[1]);


and (w0, I0, S1n,    S0n);    // SEL = 00
and (w1, I1, S1n,    SEL[0]); // SEL = 01
and (w2, I2, SEL[1], S0n);    // SEL = 10
and (w3, I3, SEL[1], SEL[0]); // SEL = 11


or (Y, w0, w1, w2, w3);

endmodule
