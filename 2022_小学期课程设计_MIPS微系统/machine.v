module mach(clk,reset,in);
  input clk,reset;
  input [31:0]in;
  
  wire [31:0]rdd,wdin,praddr,wdout,rd1,rd2,rd3,cp0rd,pc4,epcin;
  wire [5:0]hwintout;
  wire [1:0]outaddr;
  wire [4:0]cp0addr;
  wire wecpu,cp0we,exlset,exlclr,intreq,outwe,tcwe,intr;
  
  mips m1(clk,reset,rdd,wdin,praddr,wecpu,cp0rd,cp0addr,cp0we,exlset,exlclr,pc4,epcin,intreq);
  bridge b1(praddr,rdd,wdin,wdout,wecpu,{5'b0,intr},hwintout,outaddr,outwe,tcwe,rd1,rd2,rd3);
  CP0 c1(clk,reset,wdin,cp0rd,cp0addr,cp0we,exlset,exlclr,pc4,epcin,intreq,hwintout);
  outDev devout(clk,outwe,outaddr,wdout,rd2);
  inDev devin(in,rd1);
  timer devtc(clk,tcwe,outaddr,wdout,rd3,intr);
endmodule
