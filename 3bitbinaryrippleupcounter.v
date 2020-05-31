module counter(clk,count);
  input clk;
  output [2:0]count;
  reg [2:0]count;
  wire clk;
  initial 
  count = 3'b0;
  always @(negedge clk)
  count[0] <= ~count[0];
  always @(negedge count[0])
  count[1] <= ~count[1];
  always @(negedge count[1])
  count[2] <= ~count[2];
endmodule 
  
