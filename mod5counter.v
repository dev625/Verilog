module mod5_vlog(out,clk,reset);
 output [2:0] out;
 input clk, reset;
 reg [2:0] out;
  always @(posedge clk)
 if (reset)
  begin // active high reset
   out <= 3'b0 ;
  end
 else if (out<4)
  begin
   out <= out + 1;
  end
 else
  begin
   out <= 3'b0 ;
  end
  endmodule
