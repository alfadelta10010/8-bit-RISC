`timescale 1ns / 1ps

module alu_tb();

  reg [7:0] a, b;
  reg [2:0] control;
  wire [7:0] c;
  wire f;

  alu dut(
    .rs1(a), 
    .rs2(b), 
    .ctrl(control), 
    .overflow(f), 
    .out(c)
  );

  initial begin

    a = 8'b00000101;  
    b = 8'b00000001;  
    $display("Initial: a=%b, b=%b", a, b);
    
    #10;
    
    control = 3'b100;
    #10;
    $display("NAND: a=%b, b=%b, out=%b, overflow=%b", a, b, c, f);
    
    control = 3'b011;
    #10;
    $display("NOR: a=%b, b=%b, out=%b, overflow=%b", a, b, c, f);
    
    control = 3'b000;
    #10;
    $display("Addition: a=%b, b=%b, out=%b, overflow=%b", a, b, c, f);
    
    control = 3'b001;
    #10;
    $display("Subtraction: a=%b, b=%b, out=%b, overflow=%b", a, b, c, f);
    
    control = 3'b010;
    #10;
    $display("Shift Right Logical: a=%b, b=%b, out=%b, overflow=%b", a, b, c, f);
    
    control = 3'b110;
    #10;
    $display("Shift Left Logical: a=%b, b=%b, out=%b, overflow=%b", a, b, c, f);
    
    $finish;
  end
endmodule
