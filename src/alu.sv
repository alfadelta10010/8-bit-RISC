`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// CompanOutReg: 
// Engineer: 
// 
// Create Date: 05.09.2024 10:02:49
// Design Name: 
// Module Name: alu
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


module alu(
           input [7:0] InReg1, InReg2,
           input [2:0] CtrlSig,
           input Flag,
           output [7:0] OutReg
           );

logic [7:0] Inv;
assign Inv = ~InReg2 + 8'b00000001;

always @(*) 
begin
    if (CtrlSig == 3'b000 )
        if (Flag == 1)
            OutReg = ~(InReg1 & InReg2);  // NAND
        else 
            OutReg = ~(InReg1 | InReg2);  // NOR
    else if (CtrlSig == 3'b011)
        if (Flag == 1)
            OutReg = InReg1 + InReg2;     // Add 
        else
            OutReg = InReg1 + Inv;        // Sub
    else if (CtrlSig == 3'b100)
        if (Flag == 1)
            OutReg = InReg1 >> InReg2;    // SRL
        else
            OutReg = InReg1 << InReg2;    //SLL
end

endmodule
