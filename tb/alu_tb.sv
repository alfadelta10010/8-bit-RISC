`timescale 1ns / 1ps

module alu_tb();

logic[7:0] a, b;
logic[2:0] control;
logic f;
logic[7:0] c;

alu dut(a, b, control, f, c);
initial begin
        // Initialize inputs
        a = 8'b00001111;  // 15 in decimal
        b = 8'b00000101;  // 5 in decimal
        
        
        // Wait 10ns between test cases
        #10;
        
        // Test NAND and NOR with f = 1 and f = 0
        control = 3'b100; #10;   // NAND operation
        control = 3'b011; #10;   // NOR operation
        
        // Test addition and subtraction (control = 3'b011)
        control = 3'b000; #10;   // Addition (a + b)
        control = 3'b001; #10;   // Subtraction (a - b)
        
        // Test logical shifts (control = 3'b100)
        control = 3'b010; #10;   // SRL (Shift Right Logical)
        control = 3'b110; #10;   // SLL (Shift Left Logical)
        
        // End simulation
        $finish;
    end
endmodule
    


    


