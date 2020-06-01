module cmosshift(data,pcontrol,ncontrol,out);
  input data,pcontrol,ncontrol;
  output out;
  pmos(out,data,pcontrol);
  nmos(out,data,ncontrol);
endmodule


module cmosshifttest;
  reg data,pcontrol,ncontrol;
  wire out;
  cmosshift uut(.data(data),.pcontrol(pcontrol),.ncontrol(ncontrol),.out(out));
  initial begin
    pcontrol = 0;
    ncontrol = 1;
    data = 0;
    #100
    pcontrol = 0;
    ncontrol = 1;
    data = 1;
    #100 $stop;
  end
endmodule