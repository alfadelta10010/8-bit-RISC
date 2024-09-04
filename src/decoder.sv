module decoder(instIn, opcode, rs1, rs2, instOut, fn);
  input logic [7:0] instIn;
  output logic [1:0] rs1;
  output logic [1:0] rs2;
  output logic [7:0] instOut;
  output logic [1:0] opcode;
  output logic [1:0] fn;
  always_comb
    begin
      opcode = instIn[1:0];
      instOut = instIn;
      case(opcode)
				2'b00: //Logic AND, OR, SRL, SLL
          begin
            rs1 = {instIn[4], instIn[6]};
						rs2 = {instIn[5], instIn[7]};
            fn = {instIn[3], instIn[2]};
          end
        2'b01: //Branches BLT and BEQ
          begin
            rs1 = {1'b0, instIn[6]};
            rs2 = {1'b0, instIn[7]};
            fn = {1'bX, instIn[2]};
            //immediate = instIn[5:3];
          end
				2'b10: //Load-Store-PCE??????
           begin
            fn = {1'bX, instIn[2]};
            if (fn == 2'bX0)
              begin
                rs1 = {1'b0, instIn[7]};
                rs2 = 2'bX;
                //immediate = instIn[6:3];
              end
            else
              begin
                rs1 = {1'b0, instIn[6]};
                rs2 = {1'b0, instIn[7]};
                //immediate = instIn[5:3];
              end
            if (????) 
              begin
                rs1 = 2'bX;
                rs2 = 2'bX;
                //immediate = instIn[7:4];
              end
          end
				2'b11: //Arithmetic-Jump-Halt
          begin
            fn = instIn[3:2];
            if (fn == 2'bX0)
              begin
                rs1 = {instIn[4], instIn[6]};
						    rs2 = {instIn[5], instIn[7]};
              end
            else
              begin
                rs1 = 2'bX;
                rs2 = 2'bX;
                //immediate = instIn[7:4];
              end
          end
        default:
          begin
						rs1 = 2'bX;
						rs2 = 2'bX;
						fn = 2'bX;
            end
      endcase
    end
endmodule