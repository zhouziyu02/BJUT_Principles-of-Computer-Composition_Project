module EXT(imma,extop, out, luisel);
  input luisel;
  input extop;
  input [15:0]imma;
  output reg[31:0]out;
  always@(luisel or imma or extop)
  begin
    if(~extop)
      out = {{16{1'b0}},imma};
    else
      out = {{16{imma[15]}},imma};
    if(luisel)
      out = {imma,{16{1'b0}}};
  end
endmodule

