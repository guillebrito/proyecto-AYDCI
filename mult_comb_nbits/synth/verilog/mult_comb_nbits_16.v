module mult_comb_nbits
  (input  [15:0] mplier,
   input  [15:0] mcand,
   output [31:0] product);
  wire [31:0] n1_o;
  wire [31:0] n2_o;
  wire [31:0] n3_o;
  assign product = n3_o;
  /* src/mult_comb_nbits.vhdl:15:50  */
  assign n1_o = {16'b0, mplier};  //  uext
  /* src/mult_comb_nbits.vhdl:15:50  */
  assign n2_o = {16'b0, mcand};  //  uext
  /* src/mult_comb_nbits.vhdl:15:50  */
  assign n3_o = n1_o * n2_o; // umul
endmodule

