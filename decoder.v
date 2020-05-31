/*Implementation of 2 to 4 decoder with 
active low inputs and active low outputs*/

module decoder(input A,B,E, output D0,D1,D2,D3);
  assign D0 = A|B|E;
  assign D1 = A|~B|E;
  assign D2 = ~A|B|E;
  assign D3 = ~A|~B|E;
endmodule 