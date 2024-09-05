module decoder(instIn, rs1, rs2, fn, imm);
  input logic [7:0] instIn;
  output logic [1:0] rs1;
  output logic [1:0] rs2;
  logic [2:0] opcode;
  output logic [0:0] fn;
  output logic [3:0] imm;
  always_comb
    begin
      opcode = instIn[2:0];
      case(opcode)
        3'b000: // Logic NAND, NOR
          begin
            rs1 = {instIn[4], instIn[6]};
            rs2 = {instIn[5], instIn[7]};
            fn = instIn[3];
            imm = 4'bX;
          end
        3'b001: // Branches BLT
          begin
            rs1 = {1'b0, instIn[6]};
            rs2 = {1'b0, instIn[7]};
            fn = 1'bX;
            imm = instIn[5:3];
          end
        3'b101: // Branches BEQ
          begin
            rs1 = {1'b0, instIn[6]};
            rs2 = {1'b0, instIn[7]};
            fn = 1'bX;
            imm = instIn[5:3];
          end
        3'b010: // Load
          begin
            fn = 1'bX;
            rs1 = {1'b0, instIn[7]};
            rs2 = 2'bX;
            imm = instIn[6:3];
          end
        3'b010: // Store
          begin
            fn = 1'bX;
            rs1 = {1'b0, instIn[6]};
            rs2 = {1'b0, instIn[7]};
            imm = instIn[5:3];
          end
        3'b011: // Arithmetic ADD SUB
          begin
            fn = instIn[3];
            rs1 = {instIn[4], instIn[6]};
            rs2 = {instIn[5], instIn[7]};
            imm = 4'bX;
          end
        3'b100: // Logic SRL SLL
          begin
            fn = instIn[3];
            rs1 = {instIn[4], instIn[6]};
            rs2 = {instIn[5], instIn[7]};
            imm = 4'bX;
          end
        3'b111: // Jump + New Inst
          begin
            fn = instIn[3];
            if(fn == 1'b1) 
              begin
                rs1 = 2'bX;
                rs2 = 2'bX;
                imm = instIn[7:4];
              end
            else
              begin
                // New instruction - undefined
                rs1 = 2'bX;
                rs2 = 2'bX;
                imm = 4'bX;
              end
          end
        default:
          begin
            rs1 = 2'bX;
            rs2 = 2'bX;
            fn = 1'bX;
            imm = 4'bX;
          end
      endcase
    end
endmodule