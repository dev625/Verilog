primitive udp_dff_edge1 (q, d, clk, rst_n);
input d, clk, rst_n;
output q;
reg q; //q is internal storage
//initialize q to 0
initial q = 0;
 //define state table
table //inputs are in the same order as the input list
 // d clk   rst_n : q   : q+; q+ is the next state      
 0 (01)  1      : ?   : 0;          //(01) is rising edge
 1 (01)  1      : ?   : 1; //rst_n = 1 means no rst       
 1 (0x)  1      : 1   : 1; //(0x) is no change       
 0 (0x)  1      : 0   : 0;       
 ? (?0)  1      : ?   : -; //ignore negative edge  
 //reset case when rst_n is 0 and clk has any transition      
 ? (??)  0      : ?  : 0; //rst_n = 0 means reset 
 //reset case when rst_n is 0. d & clk can be anything, q+=0       \
 ?   ?    0      : ?  : 0; 
 //reset case when 0 --> 1 transition on rst_n. Hold q+ state     
 ?   ?    (01)  : ?  : -; //non-reset case when d has any trans, but clk has no trans 
 (??) ?     1     : ?   : -; //clk = ?, means no edge
 endtable
 endprimitive
 
 //test bench for the positive-edge-triggered D flip-flop
module udp_dff_edge1_tb;
reg d, clk, rst_n;
wire q;
//display variables
initial
$monitor ("rst_n=%b, d=%b, clk=%b, q=%b", rst_n, d, clk, q);
//apply input vectors
 initial begin
 #0 rst_n=1'b0; d=1'b0; clk=1'b0;
 #10 rst_n=1'b1; d=1'b1; #2 clk=1'b1;
 #10 rst_n=1'b1; d=1'b1; #2 clk=1'b0;
 #10 rst_n=1'b1; d=1'b0; #2 clk=1'b1;
 #10 rst_n=1'b1; d=1'b1; #2 clk=1'b0;
 #10 rst_n=1'b1; d=1'b1; #2 clk=1'b1;
 #10 rst_n=1'b1; d=1'b0; #2 clk=1'b0;
 #10 $stop;
 end //instantiation must be done by position, not by name
 udp_dff_edge1 inst1 (q, d, clk, rst_n);
 endmodule