
// ## AUTOGENERATED; DO NOT MODIFY
// ## num_rows_p = 8
// ## num_cols_p = 8
// ## num_dly_p = 16


  module bsg_rp_dly_line_ctl_reg
    (input clk_i
     , input async_reset_neg
     , input async_set_neg
     , input shift_right
     , input shift_left
     , input counter_en
     , input ctl_m1
     , input ctl_p1
     , output ctl_o
     );

    wire set_left, set_right, set;
    wire ctl_n, ctl_r;

    AN2D1BWP7T30P140ULVT A0 (.A1(shift_right), .A2(ctl_m1), .Z(set_right));
    AN2D1BWP7T30P140ULVT A1 (.A1(shift_left), .A2(ctl_p1), .Z(set_left));
    OR2D1BWP7T30P140ULVT O0 (.A1(set_left), .A2(set_right), .Z(set));
    MUX2D1BWP7T30P140ULVT M0 (.Z(ctl_n), .S(counter_en), .I0(ctl_r), .I1(set));
    DFCSNQD1BWP7T30P140ULVT D0 (.Q(ctl_r), .CP(clk_i), .D(ctl_n), .CDN(async_reset_neg), .SDN(async_set_neg));

    assign ctl_o = ctl_r;

endmodule



  module bsg_rp_dly_line_unit_v3
      (input async_reset_i
      , input trigger_i
      , input [63:0] ctl_one_hot_i
      , input  clk_i
      , output clk_o
      );
      wire lobit;
      TIELBWP7T30P140ULVT T0 (.ZN(lobit));
      wire hibit;
      TIEHBWP7T30P140ULVT T1 (.Z(hibit));
  

  wire fb_inv;
  CKND1BWP7T30P140ULVT I0 (.ZN(fb_inv), .I(clk_i));
  wire gate_en_sync_1_r, gate_en_sync_2_r;
  DFQD1BWP7T30P140ULVT S1 (.D(trigger_i), .CP(clk_i), .Q(gate_en_sync_1_r));
  DFQD1BWP7T30P140ULVT S2 (.D(gate_en_sync_1_r), .CP(clk_i), .Q(gate_en_sync_2_r));
  wire fb_gated;
  CKLNQD20BWP7T30P140ULVT CG0 (.Q(fb_gated), .CP(clk_i), .E(gate_en_sync_2_r), .TE(lobit));
  wire [8:0] fb_col;
  assign fb_col[0] = 1'b0;


      bsg_rp_clk_gen_osc_v3_col col_0_BSG_DONT_TOUCH
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_inv)
        ,.clkfb_i(fb_col[0])
        ,.ctl_one_hot_i(ctl_one_hot_i[7:0])
        ,.clk_o(fb_col[1])
        );


      bsg_rp_clk_gen_osc_v3_col col_1_BSG_DONT_TOUCH
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_inv)
        ,.clkfb_i(fb_col[1])
        ,.ctl_one_hot_i(ctl_one_hot_i[15:8])
        ,.clk_o(fb_col[2])
        );


      bsg_rp_clk_gen_osc_v3_col col_2_BSG_DONT_TOUCH
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_inv)
        ,.clkfb_i(fb_col[2])
        ,.ctl_one_hot_i(ctl_one_hot_i[23:16])
        ,.clk_o(fb_col[3])
        );


      bsg_rp_clk_gen_osc_v3_col col_3_BSG_DONT_TOUCH
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_inv)
        ,.clkfb_i(fb_col[3])
        ,.ctl_one_hot_i(ctl_one_hot_i[31:24])
        ,.clk_o(fb_col[4])
        );


      bsg_rp_clk_gen_osc_v3_col col_4_BSG_DONT_TOUCH
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_inv)
        ,.clkfb_i(fb_col[4])
        ,.ctl_one_hot_i(ctl_one_hot_i[39:32])
        ,.clk_o(fb_col[5])
        );


      bsg_rp_clk_gen_osc_v3_col col_5_BSG_DONT_TOUCH
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_inv)
        ,.clkfb_i(fb_col[5])
        ,.ctl_one_hot_i(ctl_one_hot_i[47:40])
        ,.clk_o(fb_col[6])
        );


      bsg_rp_clk_gen_osc_v3_col col_6_BSG_DONT_TOUCH
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_inv)
        ,.clkfb_i(fb_col[6])
        ,.ctl_one_hot_i(ctl_one_hot_i[55:48])
        ,.clk_o(fb_col[7])
        );


      bsg_rp_clk_gen_osc_v3_col col_7_BSG_DONT_TOUCH
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_inv)
        ,.clkfb_i(fb_col[7])
        ,.ctl_one_hot_i(ctl_one_hot_i[63:56])
        ,.clk_o(fb_col[8])
        );


  CKBD4BWP7T30P140ULVT B0 (.Z(clk_o), .I(fb_col[8]));
endmodule


  module bsg_rp_dly_line_v3
   (input async_reset_i
    , input clk_i
    , output clk_o
    );

  wire lobit;
  TIELBWP7T30P140ULVT T0 (.ZN(lobit));
  wire hibit;
  TIEHBWP7T30P140ULVT T1 (.Z(hibit));
  wire async_reset_neg;
  INVD1BWP7T30P140ULVT I0 (.ZN(async_reset_neg), .I(async_reset_i));
  // State machine
  // Trigger off
  wire trigger_off, trigger_on;
  DFSNQD1BWP7T30P140ULVT D0 (.Q(trigger_off), .CP(clk_i), .D(trigger_on), .SDN(async_reset_neg));
  // Change counter
  wire counter_en;
  DFCNQD1BWP7T30P140ULVT D1 (.Q(counter_en), .CP(clk_i), .D(trigger_off), .CDN(async_reset_neg));
  // Pause
  wire pause;
  DFCNQD1BWP7T30P140ULVT D2 (.Q(pause), .CP(clk_i), .D(counter_en), .CDN(async_reset_neg));
  // Trigger on
  DFCNQD1BWP7T30P140ULVT D3 (.Q(trigger_on), .CP(clk_i), .D(pause), .CDN(async_reset_neg));
  wire [64-1:0] ctl_n, ctl_r;
  wire clk_90;
  bsg_rp_dly_line_unit_v3 d90_BSG_DONT_TOUCH
   (.async_reset_i(async_reset_i)
    ,.trigger_i(trigger_on)
    ,.ctl_one_hot_i(ctl_r[63:0])
    ,.clk_i(clk_i)
    ,.clk_o(clk_90)
    );
  bsg_rp_dly_line_unit_v3 d180_BSG_DONT_TOUCH
   (.async_reset_i(async_reset_i)
    ,.trigger_i(trigger_on)
    ,.ctl_one_hot_i(ctl_r[63:0])
    ,.clk_i(clk_90)
    ,.clk_o(clk_180)
    );
  wire [16:0] n;
  assign n[0] = clk_180;


    CKBD4BWP7T30P140ULVT B0 (.Z(n[1]), .I(n[0]));


    CKBD4BWP7T30P140ULVT B1 (.Z(n[2]), .I(n[1]));


    CKBD4BWP7T30P140ULVT B2 (.Z(n[3]), .I(n[2]));


    CKBD4BWP7T30P140ULVT B3 (.Z(n[4]), .I(n[3]));


    CKBD4BWP7T30P140ULVT B4 (.Z(n[5]), .I(n[4]));


    CKBD4BWP7T30P140ULVT B5 (.Z(n[6]), .I(n[5]));


    CKBD4BWP7T30P140ULVT B6 (.Z(n[7]), .I(n[6]));


    CKBD4BWP7T30P140ULVT B7 (.Z(n[8]), .I(n[7]));


    CKBD4BWP7T30P140ULVT B8 (.Z(n[9]), .I(n[8]));


    CKBD4BWP7T30P140ULVT B9 (.Z(n[10]), .I(n[9]));


    CKBD4BWP7T30P140ULVT B10 (.Z(n[11]), .I(n[10]));


    CKBD4BWP7T30P140ULVT B11 (.Z(n[12]), .I(n[11]));


    CKBD4BWP7T30P140ULVT B12 (.Z(n[13]), .I(n[12]));


    CKBD4BWP7T30P140ULVT B13 (.Z(n[14]), .I(n[13]));


    CKBD4BWP7T30P140ULVT B14 (.Z(n[15]), .I(n[14]));


    CKBD4BWP7T30P140ULVT B15 (.Z(n[16]), .I(n[15]));


  // Delay value ignored in synthesis
  wire #100 clk_dly = n[16];

  wire meta;
  DFNCND1BWP7T30P140ULVT meta_r (.Q(meta), .QN(), .CPN(clk_i), .CDN(async_reset_neg), .D(clk_dly));
  wire meta_sync, meta_sync_sync, meta_sync_sync_inv;
  DFCND1BWP7T30P140ULVT bsg_SYNC_1_r (.Q(meta_sync), .QN(), .CP(clk_i), .D(meta), .CDN(async_reset_neg));
  DFCND1BWP7T30P140ULVT bsg_SYNC_2_r (.Q(meta_sync_sync), .QN(meta_sync_sync_inv), .CP(clk_i), .D(meta_sync), .CDN(async_reset_neg));
  wire shift_left = meta_sync_sync;
  wire shift_right = meta_sync_sync_inv;
  wire [64-1:0] set_right, set_left, set;


    bsg_rp_dly_line_ctl_reg ctl_0
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_left)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[0])
      ,.ctl_p1(ctl_r[1])
      ,.ctl_o(ctl_r[0])
      );


    bsg_rp_dly_line_ctl_reg ctl_1
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[0])
      ,.ctl_p1(ctl_r[2])
      ,.ctl_o(ctl_r[1])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_2
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[1])
      ,.ctl_p1(ctl_r[3])
      ,.ctl_o(ctl_r[2])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_3
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[2])
      ,.ctl_p1(ctl_r[4])
      ,.ctl_o(ctl_r[3])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_4
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[3])
      ,.ctl_p1(ctl_r[5])
      ,.ctl_o(ctl_r[4])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_5
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[4])
      ,.ctl_p1(ctl_r[6])
      ,.ctl_o(ctl_r[5])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_6
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[5])
      ,.ctl_p1(ctl_r[7])
      ,.ctl_o(ctl_r[6])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_7
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[6])
      ,.ctl_p1(ctl_r[8])
      ,.ctl_o(ctl_r[7])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_8
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[7])
      ,.ctl_p1(ctl_r[9])
      ,.ctl_o(ctl_r[8])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_9
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[8])
      ,.ctl_p1(ctl_r[10])
      ,.ctl_o(ctl_r[9])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_10
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[9])
      ,.ctl_p1(ctl_r[11])
      ,.ctl_o(ctl_r[10])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_11
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[10])
      ,.ctl_p1(ctl_r[12])
      ,.ctl_o(ctl_r[11])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_12
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[11])
      ,.ctl_p1(ctl_r[13])
      ,.ctl_o(ctl_r[12])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_13
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[12])
      ,.ctl_p1(ctl_r[14])
      ,.ctl_o(ctl_r[13])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_14
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[13])
      ,.ctl_p1(ctl_r[15])
      ,.ctl_o(ctl_r[14])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_15
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[14])
      ,.ctl_p1(ctl_r[16])
      ,.ctl_o(ctl_r[15])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_16
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[15])
      ,.ctl_p1(ctl_r[17])
      ,.ctl_o(ctl_r[16])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_17
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[16])
      ,.ctl_p1(ctl_r[18])
      ,.ctl_o(ctl_r[17])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_18
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[17])
      ,.ctl_p1(ctl_r[19])
      ,.ctl_o(ctl_r[18])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_19
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[18])
      ,.ctl_p1(ctl_r[20])
      ,.ctl_o(ctl_r[19])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_20
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[19])
      ,.ctl_p1(ctl_r[21])
      ,.ctl_o(ctl_r[20])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_21
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[20])
      ,.ctl_p1(ctl_r[22])
      ,.ctl_o(ctl_r[21])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_22
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[21])
      ,.ctl_p1(ctl_r[23])
      ,.ctl_o(ctl_r[22])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_23
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[22])
      ,.ctl_p1(ctl_r[24])
      ,.ctl_o(ctl_r[23])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_24
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[23])
      ,.ctl_p1(ctl_r[25])
      ,.ctl_o(ctl_r[24])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_25
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[24])
      ,.ctl_p1(ctl_r[26])
      ,.ctl_o(ctl_r[25])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_26
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[25])
      ,.ctl_p1(ctl_r[27])
      ,.ctl_o(ctl_r[26])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_27
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[26])
      ,.ctl_p1(ctl_r[28])
      ,.ctl_o(ctl_r[27])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_28
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[27])
      ,.ctl_p1(ctl_r[29])
      ,.ctl_o(ctl_r[28])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_29
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[28])
      ,.ctl_p1(ctl_r[30])
      ,.ctl_o(ctl_r[29])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_30
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[29])
      ,.ctl_p1(ctl_r[31])
      ,.ctl_o(ctl_r[30])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_31
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[30])
      ,.ctl_p1(ctl_r[32])
      ,.ctl_o(ctl_r[31])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_32
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[31])
      ,.ctl_p1(ctl_r[33])
      ,.ctl_o(ctl_r[32])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_33
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[32])
      ,.ctl_p1(ctl_r[34])
      ,.ctl_o(ctl_r[33])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_34
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[33])
      ,.ctl_p1(ctl_r[35])
      ,.ctl_o(ctl_r[34])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_35
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[34])
      ,.ctl_p1(ctl_r[36])
      ,.ctl_o(ctl_r[35])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_36
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[35])
      ,.ctl_p1(ctl_r[37])
      ,.ctl_o(ctl_r[36])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_37
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[36])
      ,.ctl_p1(ctl_r[38])
      ,.ctl_o(ctl_r[37])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_38
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[37])
      ,.ctl_p1(ctl_r[39])
      ,.ctl_o(ctl_r[38])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_39
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[38])
      ,.ctl_p1(ctl_r[40])
      ,.ctl_o(ctl_r[39])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_40
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[39])
      ,.ctl_p1(ctl_r[41])
      ,.ctl_o(ctl_r[40])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_41
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[40])
      ,.ctl_p1(ctl_r[42])
      ,.ctl_o(ctl_r[41])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_42
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[41])
      ,.ctl_p1(ctl_r[43])
      ,.ctl_o(ctl_r[42])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_43
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[42])
      ,.ctl_p1(ctl_r[44])
      ,.ctl_o(ctl_r[43])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_44
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[43])
      ,.ctl_p1(ctl_r[45])
      ,.ctl_o(ctl_r[44])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_45
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[44])
      ,.ctl_p1(ctl_r[46])
      ,.ctl_o(ctl_r[45])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_46
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[45])
      ,.ctl_p1(ctl_r[47])
      ,.ctl_o(ctl_r[46])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_47
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[46])
      ,.ctl_p1(ctl_r[48])
      ,.ctl_o(ctl_r[47])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_48
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[47])
      ,.ctl_p1(ctl_r[49])
      ,.ctl_o(ctl_r[48])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_49
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[48])
      ,.ctl_p1(ctl_r[50])
      ,.ctl_o(ctl_r[49])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_50
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[49])
      ,.ctl_p1(ctl_r[51])
      ,.ctl_o(ctl_r[50])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_51
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[50])
      ,.ctl_p1(ctl_r[52])
      ,.ctl_o(ctl_r[51])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_52
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[51])
      ,.ctl_p1(ctl_r[53])
      ,.ctl_o(ctl_r[52])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_53
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[52])
      ,.ctl_p1(ctl_r[54])
      ,.ctl_o(ctl_r[53])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_54
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[53])
      ,.ctl_p1(ctl_r[55])
      ,.ctl_o(ctl_r[54])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_55
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[54])
      ,.ctl_p1(ctl_r[56])
      ,.ctl_o(ctl_r[55])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_56
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[55])
      ,.ctl_p1(ctl_r[57])
      ,.ctl_o(ctl_r[56])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_57
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[56])
      ,.ctl_p1(ctl_r[58])
      ,.ctl_o(ctl_r[57])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_58
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[57])
      ,.ctl_p1(ctl_r[59])
      ,.ctl_o(ctl_r[58])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_59
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[58])
      ,.ctl_p1(ctl_r[60])
      ,.ctl_o(ctl_r[59])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_60
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[59])
      ,.ctl_p1(ctl_r[61])
      ,.ctl_o(ctl_r[60])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_61
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[60])
      ,.ctl_p1(ctl_r[62])
      ,.ctl_o(ctl_r[61])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_62
     (.clk_i(clk_i)
      ,.async_reset_neg(async_reset_neg)
      ,.async_set_neg(hibit)
      ,.shift_right(shift_right)
      ,.shift_left(shift_left)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[61])
      ,.ctl_p1(ctl_r[63])
      ,.ctl_o(ctl_r[62])
      );
  

    bsg_rp_dly_line_ctl_reg ctl_63
     (.clk_i(clk_i)
      ,.async_reset_neg(hibit)
      ,.async_set_neg(async_reset_neg)
      ,.shift_right(shift_right)
      ,.shift_left(shift_right)
      ,.counter_en(counter_en)

      ,.ctl_m1(ctl_r[62])
      ,.ctl_p1(ctl_r[63])
      ,.ctl_o(ctl_r[63])
      );


    assign clk_o = clk_90;

  endmodule

