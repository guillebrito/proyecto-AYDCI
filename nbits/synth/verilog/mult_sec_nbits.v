module mult_sec_nbits
  (input  clk,
   input  st,
   input  [3:0] mplier,
   input  [3:0] mcand,
   output done,
   output [7:0] product);
  wire [1:0] estado_act;
  wire [1:0] estado_sig;
  wire [2:0] cnt_act;
  wire [2:0] cnt_sig;
  wire k;
  wire m;
  wire [8:0] acu_act;
  wire [8:0] acu_sig;
  wire load;
  wire ad;
  wire sh;
  wire [4:0] suma;
  wire [3:0] acu_suma;
  wire n2_o;
  wire [3:0] n3_o;
  wire [7:0] n4_o;
  wire [4:0] n6_o;
  wire [4:0] n8_o;
  wire [4:0] n9_o;
  wire [31:0] n11_o;
  wire n13_o;
  wire n14_o;
  wire [2:0] n17_o;
  wire [31:0] n18_o;
  wire [31:0] n20_o;
  wire [2:0] n21_o;
  wire n22_o;
  wire n23_o;
  wire [2:0] n24_o;
  wire [1:0] n35_o;
  wire n38_o;
  wire n40_o;
  wire n41_o;
  wire n42_o;
  wire n43_o;
  wire n44_o;
  wire n45_o;
  wire [1:0] n47_o;
  wire n50_o;
  wire [1:0] n52_o;
  wire n55_o;
  wire n57_o;
  wire [1:0] n59_o;
  wire n61_o;
  wire n63_o;
  wire n65_o;
  wire n66_o;
  wire [1:0] n69_o;
  wire n71_o;
  wire n73_o;
  wire [3:0] n74_o;
  reg n78_o;
  reg [1:0] n82_o;
  reg n85_o;
  reg n89_o;
  reg n94_o;
  localparam [8:0] n99_o = 9'b000000000;
  wire [4:0] n100_o;
  wire [3:0] n101_o;
  wire [8:0] n102_o;
  wire [7:0] n103_o;
  wire [8:0] n105_o;
  wire [8:0] n106_o;
  wire [8:0] n107_o;
  wire [8:0] n108_o;
  wire [8:0] n109_o;
  reg [1:0] n111_q;
  reg [2:0] n112_q;
  reg [8:0] n113_q;
  assign done = n78_o;
  assign product = n4_o;
  /* src/mult_sec_nbits.vhdl:18:12  */
  assign estado_act = n111_q; // (signal)
  /* src/mult_sec_nbits.vhdl:18:24  */
  assign estado_sig = n82_o; // (signal)
  /* src/mult_sec_nbits.vhdl:19:12  */
  assign cnt_act = n112_q; // (signal)
  /* src/mult_sec_nbits.vhdl:19:21  */
  assign cnt_sig = n17_o; // (signal)
  /* src/mult_sec_nbits.vhdl:20:12  */
  assign k = n14_o; // (signal)
  /* src/mult_sec_nbits.vhdl:20:15  */
  assign m = n2_o; // (signal)
  /* src/mult_sec_nbits.vhdl:21:12  */
  assign acu_act = n113_q; // (signal)
  /* src/mult_sec_nbits.vhdl:21:21  */
  assign acu_sig = n109_o; // (signal)
  /* src/mult_sec_nbits.vhdl:22:12  */
  assign load = n85_o; // (signal)
  /* src/mult_sec_nbits.vhdl:22:18  */
  assign ad = n89_o; // (signal)
  /* src/mult_sec_nbits.vhdl:22:22  */
  assign sh = n94_o; // (signal)
  /* src/mult_sec_nbits.vhdl:23:12  */
  assign suma = n9_o; // (signal)
  /* src/mult_sec_nbits.vhdl:24:12  */
  assign acu_suma = n3_o; // (signal)
  /* src/mult_sec_nbits.vhdl:26:17  */
  assign n2_o = acu_act[0];
  /* src/mult_sec_nbits.vhdl:27:24  */
  assign n3_o = acu_act[7:4];
  /* src/mult_sec_nbits.vhdl:28:23  */
  assign n4_o = acu_act[7:0];
  /* src/mult_sec_nbits.vhdl:29:35  */
  assign n6_o = {1'b0, mcand};
  /* src/mult_sec_nbits.vhdl:29:61  */
  assign n8_o = {1'b0, acu_suma};
  /* src/mult_sec_nbits.vhdl:29:54  */
  assign n9_o = n6_o + n8_o;
  /* src/mult_sec_nbits.vhdl:32:28  */
  assign n11_o = {29'b0, cnt_act};  //  uext
  /* src/mult_sec_nbits.vhdl:32:28  */
  assign n13_o = n11_o == 32'b00000000000000000000000000000011;
  /* src/mult_sec_nbits.vhdl:32:14  */
  assign n14_o = n13_o ? 1'b1 : 1'b0;
  /* src/mult_sec_nbits.vhdl:33:18  */
  assign n17_o = st ? 3'b000 : n24_o;
  /* src/mult_sec_nbits.vhdl:34:25  */
  assign n18_o = {29'b0, cnt_act};  //  uext
  /* src/mult_sec_nbits.vhdl:34:25  */
  assign n20_o = n18_o + 32'b00000000000000000000000000000001;
  /* src/mult_sec_nbits.vhdl:34:16  */
  assign n21_o = n20_o[2:0];  // trunc
  /* src/mult_sec_nbits.vhdl:34:51  */
  assign n22_o = ~k;
  /* src/mult_sec_nbits.vhdl:34:45  */
  assign n23_o = n22_o & sh;
  /* src/mult_sec_nbits.vhdl:33:34  */
  assign n24_o = n23_o ? n21_o : cnt_act;
  /* src/mult_sec_nbits.vhdl:59:17  */
  assign n35_o = st ? 2'b01 : estado_act;
  /* src/mult_sec_nbits.vhdl:59:17  */
  assign n38_o = st ? 1'b1 : 1'b0;
  /* src/mult_sec_nbits.vhdl:58:13  */
  assign n40_o = estado_act == 2'b00;
  /* src/mult_sec_nbits.vhdl:64:22  */
  assign n41_o = ~k;
  /* src/mult_sec_nbits.vhdl:64:34  */
  assign n42_o = ~m;
  /* src/mult_sec_nbits.vhdl:64:28  */
  assign n43_o = n42_o & n41_o;
  /* src/mult_sec_nbits.vhdl:70:37  */
  assign n44_o = ~m;
  /* src/mult_sec_nbits.vhdl:70:31  */
  assign n45_o = n44_o & k;
  /* src/mult_sec_nbits.vhdl:70:17  */
  assign n47_o = n45_o ? 2'b11 : estado_act;
  /* src/mult_sec_nbits.vhdl:70:17  */
  assign n50_o = n45_o ? 1'b1 : 1'b0;
  /* src/mult_sec_nbits.vhdl:67:17  */
  assign n52_o = m ? 2'b10 : n47_o;
  /* src/mult_sec_nbits.vhdl:67:17  */
  assign n55_o = m ? 1'b1 : 1'b0;
  /* src/mult_sec_nbits.vhdl:67:17  */
  assign n57_o = m ? 1'b0 : n50_o;
  /* src/mult_sec_nbits.vhdl:64:17  */
  assign n59_o = n43_o ? 2'b01 : n52_o;
  /* src/mult_sec_nbits.vhdl:64:17  */
  assign n61_o = n43_o ? 1'b0 : n55_o;
  /* src/mult_sec_nbits.vhdl:64:17  */
  assign n63_o = n43_o ? 1'b1 : n57_o;
  /* src/mult_sec_nbits.vhdl:63:13  */
  assign n65_o = estado_act == 2'b01;
  /* src/mult_sec_nbits.vhdl:76:22  */
  assign n66_o = ~k;
  /* src/mult_sec_nbits.vhdl:76:17  */
  assign n69_o = n66_o ? 2'b01 : 2'b11;
  /* src/mult_sec_nbits.vhdl:74:13  */
  assign n71_o = estado_act == 2'b10;
  /* src/mult_sec_nbits.vhdl:81:13  */
  assign n73_o = estado_act == 2'b11;
  assign n74_o = {n73_o, n71_o, n65_o, n40_o};
  /* src/mult_sec_nbits.vhdl:57:9  */
  always @*
    case (n74_o)
      4'b1000: n78_o = 1'b1;
      4'b0100: n78_o = 1'b0;
      4'b0010: n78_o = 1'b0;
      4'b0001: n78_o = 1'b0;
      default: n78_o = 1'bX;
    endcase
  /* src/mult_sec_nbits.vhdl:57:9  */
  always @*
    case (n74_o)
      4'b1000: n82_o = 2'b00;
      4'b0100: n82_o = n69_o;
      4'b0010: n82_o = n59_o;
      4'b0001: n82_o = n35_o;
      default: n82_o = 2'bX;
    endcase
  /* src/mult_sec_nbits.vhdl:57:9  */
  always @*
    case (n74_o)
      4'b1000: n85_o = 1'b0;
      4'b0100: n85_o = 1'b0;
      4'b0010: n85_o = 1'b0;
      4'b0001: n85_o = n38_o;
      default: n85_o = 1'bX;
    endcase
  /* src/mult_sec_nbits.vhdl:57:9  */
  always @*
    case (n74_o)
      4'b1000: n89_o = 1'b0;
      4'b0100: n89_o = 1'b0;
      4'b0010: n89_o = n61_o;
      4'b0001: n89_o = 1'b0;
      default: n89_o = 1'bX;
    endcase
  /* src/mult_sec_nbits.vhdl:57:9  */
  always @*
    case (n74_o)
      4'b1000: n94_o = 1'b0;
      4'b0100: n94_o = 1'b1;
      4'b0010: n94_o = n63_o;
      4'b0001: n94_o = 1'b0;
      default: n94_o = 1'bX;
    endcase
  assign n100_o = n99_o[8:4];
  /* src/mult_sec_nbits.vhdl:94:38  */
  assign n101_o = acu_act[3:0];
  /* src/mult_sec_nbits.vhdl:94:29  */
  assign n102_o = {suma, n101_o};
  /* src/mult_sec_nbits.vhdl:96:37  */
  assign n103_o = acu_act[8:1];
  /* src/mult_sec_nbits.vhdl:96:28  */
  assign n105_o = {1'b0, n103_o};
  /* src/mult_sec_nbits.vhdl:95:9  */
  assign n106_o = sh ? n105_o : acu_act;
  /* src/mult_sec_nbits.vhdl:93:9  */
  assign n107_o = ad ? n102_o : n106_o;
  assign n108_o = {n100_o, mplier};
  /* src/mult_sec_nbits.vhdl:90:9  */
  assign n109_o = load ? n108_o : n107_o;
  /* src/mult_sec_nbits.vhdl:40:9  */
  always @(posedge clk)
    n111_q <= estado_sig;
  /* src/mult_sec_nbits.vhdl:40:9  */
  always @(posedge clk)
    n112_q <= cnt_sig;
  /* src/mult_sec_nbits.vhdl:40:9  */
  always @(posedge clk)
    n113_q <= acu_sig;
endmodule

