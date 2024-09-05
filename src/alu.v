module alu(rs1, rs2, ctrl, out, overflow)
  input wire [7:0] rs1, rs2;
  input wire [2:0] ctrl;
  output reg [7:0] out;
  reg [7:0] a_temp, b_temp;
  reg [0:0] cin;
  reg [0:0] overflow;
  adder_8 adder (
    .cin(cin), 
    .A(a_temp), 
    .B(b_temp),
    .S(out), 
    .Cout(overflow)
  );
  
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
        3'b010:
          out = rs1 >> rs2[2:0];
        3'b011: out = ~(rs1 | rs2);
        3'b100: out = ~(rs1 & rs2);
        3'b011:
          out = rs1 << rs2[2:0];
        default: out = 7'bX;
      endcase
    end
endmodule