module cla(input [3:0] A, input [3:0] B, input Cin, output [3:0] S, output Cout);

wire [3:0] P;
wire [3:0] G;
wire [3:1] C;

assign P = A ^ B;
assign G = A & B;

assign C[1] = G[0] | (P[0] & Cin);
assign C[2] = G[1] | (P[1] & C[1]);
assign C[3] = G[2] | (P[2] & C[2]);
assign Cout = G[3] | (P[3] & C[3]);

assign S[0] = P[0] ^ Cin;
assign S[1] = P[1] ^ C[1];
assign S[2] = P[2] ^ C[2];
assign S[3] = P[3] ^ C[3];

endmodule
