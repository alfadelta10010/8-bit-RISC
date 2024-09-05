`timescale 1ns / 1ps


module adder_8(
               input [7:0] A, B, 
               output [7:0] S, 
               output Cout
               );

  logic [7:0] G;    // Generate
  logic [7:0] P;    // Propagate
  logic [7:0] C;    // Carry

  logic [7:1] g1, p1;
  logic [7:2] g2, p2;
  logic [7:4] g3, p3;
  logic [7:6] g4, p4;

  // Step 1: Generate and Propagate signals
  assign G = A & B;  // G = A AND B
  assign P = A ^ B;  // P = A XOR B

  // Step 2: Brent-Kung tree for Carry Generation

  // Level 1
  assign g1[1] = G[1] | (P[1] & G[0]);
  assign p1[1] = P[1] & P[0];

  assign g1[3] = G[3] | (P[3] & G[2]);
  assign p1[3] = P[3] & P[2];

  assign g1[5] = G[5] | (P[5] & G[4]);
  assign p1[5] = P[5] & P[4];

  assign g1[7] = G[7] | (P[7] & G[6]);
  assign p1[7] = P[7] & P[6];

  // Level 2
  assign g2[2] = G[2] | (P[2] & g1[1]);
  assign p2[2] = P[2] & p1[1];

  assign g2[6] = g1[5] | (p1[5] & g1[3]);
  assign p2[6] = p1[5] & p1[3];

  // Level 3
  assign g3[4] = G[4] | (P[4] & g2[2]);
  assign p3[4] = P[4] & p2[2];

  assign g3[6] = g2[6] | (p2[6] & g2[2]);
  assign p3[6] = p2[6] & p2[2];

  // Level 4
  assign g4[6] = g3[6] | (p3[6] & g3[4]);

  // Step 3: Compute final carries
  assign C[0] = 0;
  assign C[1] = G[0];
  assign C[2] = g1[1];
  assign C[3] = g2[2];
  assign C[4] = g3[4];
  assign C[5] = g1[3];
  assign C[6] = g4[6];
  assign C[7] = g1[5];
  assign Cout = g1[7];

  // Step 4: Sum computation
  assign Sum = P ^ C;

endmodule
