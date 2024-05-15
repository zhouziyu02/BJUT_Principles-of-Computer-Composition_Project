module dm( clk, din,we, addr, dout);
    input   [13:0]  addr;   // address bus
    input   [31:0]  din;   // 32-bit input data
    input           we;    // memory write enable
    input           clk;   // clock
    output  [31:0]  dout;  // 32-bit memory output
    reg     [7:0]  dm[12288:0];
    integer i;
    initial
      begin
        for(i=0;i<12288;i=i+1)dm[i]<=0;
      end
    assign dout = {dm[addr+3],dm[addr+2],dm[addr+1],dm[addr]};
    always @(posedge clk)
    begin
      if(we == 1)
        {dm[addr+3],dm[addr+2],dm[addr+1],dm[addr]}<=din;
    end
endmodule