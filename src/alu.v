`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2024 00:33:30
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
        if (Flag == 1)
            OutReg = ~(InReg1 & InReg2);  // NAND
        else 
            OutReg = ~(InReg1 | InReg2);  // NOR
      3'b011: 
        if (Flag == 1)
        begin 
          a_temp = rs1;
          b_temp = ~rs2;
          cin = 1'b1; 
          out = add_out;
          overflow = add_overflow;
        end
        else begin
          a_temp = rs1;
          b_temp = rs2;
          cin = 1'b0; 
          out = add_out;
          overflow = add_overflow;
        end
      3'b100: 
        if (Flag == 1) 
        begin
          out = rs1 << rs2[2:0]; 
          overflow = 1'b0; 
        end
        else 
        begin
          out = rs1 >> rs2[2:0];
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
