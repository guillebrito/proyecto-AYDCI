module mult_comb_nbits
  (input  [3:0] mplier,
   input  [3:0] mcand,
   output [7:0] product);
  wire [7:0] n1_o;
  wire [7:0] n2_o;
  wire [7:0] n3_o;
  assign product = n3_o;
  /* src/mult_comb_nbits.vhdl:15:50  */
  assign n1_o = {4'b0, mplier};  //  uext
  /* src/mult_comb_nbits.vhdl:15:50  */
  assign n2_o = {4'b0, mcand};  //  uext
  /* src/mult_comb_nbits.vhdl:15:50  */
  assign n3_o = n1_o * n2_o; // umul
endmodule

