`timescale 1ns / 1ps

module alu(
  input wire [7:0] rs1, rs2,
  input wire [2:0] ctrl,
  output reg [7:0] out,
  output reg overflow
);

  reg [7:0] a_temp, b_temp;
  reg cin;
  wire [7:0] add_out;
  wire add_overflow;

  adder_8 adder (
    .cin(cin), 
    .A(a_temp), 
    .B(b_temp), 
    .S(add_out), 
    .Cout(add_overflow)
  );

  always @(*) begin
    case(ctrl)
      3'b000: 
        begin 
          a_temp = rs1;
          b_temp = rs2;
          cin = 1'b0; 
          out = add_out;
          overflow = add_overflow;
        end
      3'b001: 
        begin 
          a_temp = rs1;
          b_temp = ~rs2;
          cin = 1'b1; 
          out = add_out;
          overflow = add_overflow;
        end
      3'b010: 
        begin
          out = rs1 >> rs2[2:0]; 
          overflow = 1'b0; 
        end
      3'b011: 
        begin
          out = ~(rs1 | rs2);
          overflow = 1'b0;
        end
      3'b100: 
        begin
          out = ~(rs1 & rs2); 
          overflow = 1'b0;
        end
      3'b110: 
        begin
          out = rs1 << rs2[2:0];
          overflow = 1'b0;
        end
      default: 
        begin
          out = 8'bX;
          overflow = 1'bX;
        end
    endcase
  end

endmodule
