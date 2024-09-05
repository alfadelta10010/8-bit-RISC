module pc(clk, reset, pc_out, branch_in, branch_sel);
  input bit clk;
  input bit reset;
  output reg [4:0] pc_out;
  input wire [0:0] branch_sel;
  input wire [4:0] branch_in;
  assign pc_out = 32'b0;
  always_ff @(posedge clk, posedge reset) 
    begin
      if (reset) 
        pc_out <= 32'b0;
      if (branch_sel)
        pc_out <= pc_out + branch_in;
      else
        pc_out <= pc_out + 1;
    end
endmodule