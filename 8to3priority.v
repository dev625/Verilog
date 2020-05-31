module encoder(D,Q,E);
  input [7:0]D;
  input E;
  output [2:0] Q;
  reg [2:0] Q;
  always @(D or E) begin
  if (E == 1)
  casez (D)  
  8'b00000001: Q=3'b000;
  8'b0000001?: Q=3'b001;
  8'b000001??: Q=3'b010;
  8'b00001???: Q=3'b011;
  8'b0001????: Q=3'b100;
  8'b001?????: Q=3'b101;
  8'b01??????: Q=3'b110;
  8'b1???????: Q=3'b111;
  endcase
  else
  Q=3'bX;
end
endmodule

