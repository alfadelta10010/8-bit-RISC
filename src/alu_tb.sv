`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2024 12:33:18
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();

logic[7:0] a, b;
logic[2:0] control;
logic f;
logic[7:0] c;

alu dut(a, b, control, f, c);
initial begin
        // Initialize inputs
        InReg1 = 8'b00001111;  // 15 in decimal
        InReg2 = 8'b00000101;  // 5 in decimal
        Flag = 0;
        CtrlSig = 3'b000;
        
        // Wait 10ns between test cases
        #10;
        
        // Test NAND and NOR with Flag = 1 and Flag = 0
        Flag = 1; CtrlSig = 3'b000; #10;   // NAND operation
        Flag = 0; CtrlSig = 3'b000; #10;   // NOR operation
        
        // Test addition and subtraction (CtrlSig = 3'b011)
        Flag = 1; CtrlSig = 3'b011; #10;   // Addition (InReg1 + InReg2)
        Flag = 0; CtrlSig = 3'b011; #10;   // Subtraction (InReg1 - InReg2)
        
        // Test logical shifts (CtrlSig = 3'b100)
        Flag = 1; CtrlSig = 3'b100; #10;   // SRL (Shift Right Logical)
        Flag = 0; CtrlSig = 3'b100; #10;   // SLL (Shift Left Logical)
        
        // Add any additional test cases here if needed
        InReg1 = 8'b10101010;  // Test with different inputs
        InReg2 = 8'b00000011;  // Test with different inputs
        Flag = 1; CtrlSig = 3'b011; #10;   // Add with new inputs
        
        // End simulation
        $finish;
    end
endmodule
    


