module controller (
    input  wire [2:0] opcode,
    input  wire [2:0] phase,
    input  wire       zero,
    output reg         sel,
    output reg         rd,
    output reg         ld_ir,
    output reg         inc_pc,
    output reg         halt,
    output reg         ld_pc,
    output reg         data_e,
    output reg         ld_ac,
    output reg         wr
);

    // same opcode numbering as controller_test.v, so they line up 1:1
    localparam HLT=0, SKZ=1, ADD=2, AND=3, XOR=4, LDA=5, STO=6, JMP=7;
    localparam INST_ADDR=0, INST_FETCH=1, INST_LOAD=2, IDLE=3,
               OP_ADDR=4, OP_FETCH=5, ALU_OP=6, STORE=7;

    reg HALT_FLAG, ALUOP_FLAG, JMP_FLAG, STO_FLAG;

    always @(*) begin
  
        HALT_FLAG  = (opcode == HLT);
        ALUOP_FLAG = (opcode == ADD) || (opcode == AND) ||
                     (opcode == XOR) || (opcode == LDA);
        JMP_FLAG   = (opcode == JMP);
        STO_FLAG   = (opcode == STO);

       
        sel    = 1'b0;
        rd     = 1'b0;
        ld_ir  = 1'b0;
        inc_pc = 1'b0;
        halt   = 1'b0;
        ld_pc  = 1'b0;
        data_e = 1'b0;
        ld_ac  = 1'b0;
        wr     = 1'b0;


        case (phase)
            INST_ADDR: begin
                sel = 1'b1;
            end

            INST_FETCH: begin
                sel = 1'b1;
                rd  = 1'b1;
            end

            INST_LOAD: begin
                sel   = 1'b1;
                rd    = 1'b1;
                ld_ir = 1'b1;
            end

            IDLE: begin
                sel   = 1'b1;
                rd    = 1'b1;
                ld_ir = 1'b1;
            end

            OP_ADDR: begin
                halt   = HALT_FLAG;
                inc_pc = 1'b1;
            end

            OP_FETCH: begin
                rd = ALUOP_FLAG;
            end

            ALU_OP: begin
                rd     = ALUOP_FLAG;
                inc_pc = (opcode == SKZ) && zero;
                ld_pc  = JMP_FLAG;
                data_e = STO_FLAG;
            end

            STORE: begin
                rd     = ALUOP_FLAG;
                ld_ac  = ALUOP_FLAG;
                ld_pc  = JMP_FLAG;
                wr     = STO_FLAG;
                data_e = STO_FLAG;
            end

           
        endcase
    end

endmodule