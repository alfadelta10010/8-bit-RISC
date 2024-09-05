module alu(rs1, rs2, ctrl, out, overflow)
  input logic [7:0] rs1, rs2;
  input logic [2:0] ctrl;
  output logic [7:0] out;
  logic [7:0] a_temp, b_temp;
  logic [0:0] cin;
  logic [0:0] overflow;
  adder_8 adder (
    .cin(cin), 
    .A(a_temp), 
    .B(b_temp),
    .S(out), 
    .Cout(overflow)
  );
  
  /*
  000 - Add
  001 - Sub
  010 - SRL
  011 - NOR
  100 - NAND
  110 - SLL
  */
  
  always_comb 
    begin
      case(ctrl)
        3'b000: 
          begin 
            a_temp = rs1;
            b_temp = rs2;
            cin = 1'b0;
          end
        3'b001: 
          begin 
            a_temp = rs1;
            b_temp = ~rs2;
            cin = 1'b1;
          end
        3'b010: //SRL
          waga waga;
        3'b011: out = ~(rs1 | rs2);
        3'b100: out = ~(rs1 & rs2);
        3'b011: //SLL
          waga waga;
        default: out = 7'bX;
      endcase
    end
endmodule