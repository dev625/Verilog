/*Simple Implementation of CMOS Inverter in Verilog*/

module cmos1(out,in);
  input in;
  output out;
  supply1 vdd;
  supply0 gnd;
  wire out;
  pmos(out,vdd,in);
  nmos(out,gnd,in);
endmodule

/*Now writing a simple test bench for the above code*/

module cmos1_test;
  reg in;
  wire out;
  cmos1 uut(.out(out),.in(in));
  
  initial begin
    in = 1'b0;
    #100;
    in = 1'b1;
    #100;
    #10 $stop;
  end
endmodule