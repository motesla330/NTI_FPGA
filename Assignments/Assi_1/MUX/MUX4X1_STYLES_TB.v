`timescale 1ns/1ps


module MUX4X1_STYLES_TB();

reg         I0, I1, I2, I3;
reg  [1:0]  SEL;
wire        Y_beh, Y_gate, Y_struct;


integer i;
reg     expected;

MUX4X1_BEHAVIORAL  DUT_BEH  (.I0(I0), .I1(I1), .I2(I2), .I3(I3), .SEL(SEL), .Y(Y_beh));
MUX4X1_GATE        DUT_GATE (.I0(I0), .I1(I1), .I2(I2), .I3(I3), .SEL(SEL), .Y(Y_gate));
MUX4X1_STRUCTURAL  DUT_STR  (.I0(I0), .I1(I1), .I2(I2), .I3(I3), .SEL(SEL), .Y(Y_struct));

initial begin
    for (i = 0; i < 64; i = i + 1) begin
        {I3, I2, I1, I0, SEL} = i[5:0];
        #5;

        case (SEL)
            2'b00: expected = I0;
            2'b01: expected = I1;
            2'b10: expected = I2;
            2'b11: expected = I3;
        endcase

        if (Y_beh !== expected) begin
            $display("FAIL BEHAVIORAL : SEL=%b I3I2I1I0=%b%b%b%b expected=%b got=%b",
                       SEL, I3, I2, I1, I0, expected, Y_beh);
            
        end

        if (Y_gate !== expected) begin
            $display("FAIL GATE       : SEL=%b I3I2I1I0=%b%b%b%b expected=%b got=%b",
                       SEL, I3, I2, I1, I0, expected, Y_gate);
           
        end

        if (Y_struct !== expected) begin
            $display("FAIL STRUCTURAL : SEL=%b I3I2I1I0=%b%b%b%b expected=%b got=%b",
                       SEL, I3, I2, I1, I0, expected, Y_struct);
            
        end
    end


end

endmodule
