`timescale 1ns / 1ps

module alu(
           input [7:0] InReg1, InReg2,
           input [2:0] CtrlSig,
           input Flag,
           output [7:0] OutReg
           );
           
logic Carry;
logic [7:0] Inv;
assign Inv = ~InReg2 + 8'b00000001;
adder_8 add_sub_instance (
    .OutReg(OutReg),
    .Carry(Carry),
    .A(A),
    .B(B)
);
always @(*) 
begin
    if (CtrlSig == 3'b000 )
        if (Flag == 1)
            OutReg = ~(InReg1 & InReg2);  // NAND
        else 
            OutReg = ~(InReg1 | InReg2);  // NOR
    else if (CtrlSig == 3'b011)
    begin
        if (Flag == 1)
        begin
            A = InReg1;
            B = InReg2;     // Add 
        end 
        else 
        begin
            A = InReg1;
            B = Inv;  
        end      // Sub
    end
    else if (CtrlSig == 3'b100)
        if (Flag == 1)
            OutReg = InReg1 >> InReg2;    // SRL
        else
            OutReg = InReg1 << InReg2;    //SLL
    else 
        OutReg = 8'b00000000;
end

endmodule
