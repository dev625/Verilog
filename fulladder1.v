/*Implmentation of Half Adder Using Task and Hence 
Implementation of Full Adder using Half Adder*/
module fulladder_task(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
reg sum,carry;
reg s1,s2,s3,s4,s5,s6,s7;
always@(a or b or cin)
begin
s4=a;
s5=b;
s6=cin;
halfadder_task(s4,s5,s1,s2);
halfadder_task(s1,s6,s7,s3);
carry=s2|s3;
sum=s7;
$display("sum=%b carry=%b",sum,carry);
end

task halfadder_task;
input l,m;
output y,z;
begin
y=l^m;
z=l&m;
end
endtask

endmodule