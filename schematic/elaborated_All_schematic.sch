# File saved with Nlview 6.8.5  2018-01-30 bk=1.4354 VDI=40 GEI=35 GUI=JA:1.6 non-TLS-threadsafe
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 12
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new cnn_accelerator_top work:cnn_accelerator_top:NOFILE -nosplit
load symbol IBUF hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol clk_gen_6x work:clk_gen_6x:NOFILE HIERBOX pin clk_fast output.right pin clk_in input.left pin clk_sys output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol line_buffer work:line_buffer:NOFILE HIERBOX pin clk input.left pin pixel_valid_in input.left pin pixel_valid_out output.right pinBus curr_row_pixel output.right [7:0] pinBus pixel_in input.left [7:0] pinBus prev_row1_pixel output.right [7:0] pinBus prev_row2_pixel output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol window_generator work:window_generator:NOFILE HIERBOX pin clk input.left pin pass_reset input.left pin pixel_valid_in input.left pin rst input.left pin window_valid output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol M3 work:M3:NOFILE HIERBOX pin clk input.left pin clk_fast input.left pin mac_result_valid output.right pin pixel_valid input.left pin rst input.left pin tap_valid input.left pin window_valid input.left pinBus col_row0 input.left [7:0] pinBus col_row1 input.left [7:0] pinBus col_row2 input.left [7:0] pinBus mac_result output.right [19:0] pinBus tap_data input.left [7:0] pinBus tap_idx input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol kernel_storage work:kernel_storage:NOFILE HIERBOX pin clk input.left pin kernel_wr_en input.left pin tap_valid output.right pinBus kernel_select input.left [0:0] pinBus kernel_wr_addr input.left [3:0] pinBus kernel_wr_bank input.left [0:0] pinBus kernel_wr_data input.left [7:0] pinBus tap_data output.right [7:0] pinBus tap_idx output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol output_handling work:output_handling:NOFILE HIERBOX pin clk input.left pin final_output_valid output.right pin mac_result_valid input.left pin relu_enable input.left pin rst input.left pinBus final_output output.right [15:0] pinBus mac_result input.left [19:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol control_fsm work:control_fsm:NOFILE HIERBOX pin busy output.right pin clk input.left pin done output.right pin fifo_all_outputs_done input.left pin pass_reset output.right pin pixel_in_valid input.left pin pixel_req output.right pin pixel_valid_in output.right pin rst input.left pin start input.left boxcolor 1 fillcolor 2 minwidth 13%
load symbol FIFO work:FIFO:NOFILE HIERBOX pin clk input.left pin fifo_all_outputs_done output.right pin fifo_pass_reset input.left pin final_output_valid input.left pin output_valid output.right pin rst input.left pinBus final_output input.left [15:0] pinBus output_pixel output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol BUFG hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol BUFR hdi_primitives BOX pin O output.right pin CE input.left pin CLR input.left pin I input.left fillcolor 1
load symbol RTL_REG__BREG_4 work[7:0]ssww GEN pin C input.clk.left pin CE input.left pinBus D input.left [7:0] pinBus Q output.right [7:0] fillcolor 1 sandwich 3 prop @bundle 8
load symbol RTL_OR1 work OR pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_MUX4 work MUX pin S input.bot pinBus I0 input.left [1:0] pinBus I1 input.left [1:0] pinBus O output.right [1:0] fillcolor 1
load symbol RTL_AND2 work AND pin I0 input pin I1 input pin O output fillcolor 1
load symbol lfsr_counter__parameterized0 work:lfsr_counter__parameterized0:NOFILE HIERBOX pin advance input.left pin at_count output.right pin clear input.left pin clk input.left boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_REG_SYNC__BREG_2 work[1:0]swwwsw GEN pin C input.clk.left pinBus CE input.left [1:0] pinBus D input.left [1:0] pinBus Q output.right [1:0] pin RST input.top pinBus SET input.bot [1:0] fillcolor 1 sandwich 3 prop @bundle 2
load symbol RTL_MUX6 work MUX pin S input.bot pinBus I0 input.left [4:0] pinBus I1 input.left [4:0] pinBus O output.right [4:0] fillcolor 1
load symbol RTL_NEQ2 work RTL(!=) pin I0 input.left pin I1 input.left pin O output.right fillcolor 1
load symbol RTL_RAM work GEN pin WCLK input.clk.left pin WE2 input.left pinBus RA1 input.left [4:0] pinBus RO1 output.right [7:0] pinBus WA2 input.left [4:0] pinBus WD2 input.left [7:0] fillcolor 1
load symbol RTL_MUX7 work MUX pinBus I0 input.left [3:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] pinBus S input.bot [3:0] fillcolor 1
load symbol RTL_ADD work RTL(+) pin I1 input.left pinBus I0 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol RTL_MUX8 work MUX pin I0 input.left pin I1 input.left pin O output.right pin S input.bot fillcolor 1
load symbol RTL_REG__BREG_71 work GEN pin C input.clk.left pin D input.left pin Q output.right fillcolor 1
load symbol RTL_INV work INV pin I0 input pin O output fillcolor 1
load symbol RTL_REG__BREG_76 work GEN pin C input.clk.left pin D input.left pin Q output.right fillcolor 1
load symbol RTL_LT0 work RTL(<) pin O output.right pinBus I0 input.left [1:0] pinBus I1 input.left [1:0] fillcolor 1
load symbol RTL_LT work RTL(<) pin O output.right pinBus I0 input.left [3:0] pinBus I1 input.left [3:0] fillcolor 1
load symbol RTL_REG__BREG_4 work[3:0]ssww GEN pin C input.clk.left pin CE input.left pinBus D input.left [3:0] pinBus Q output.right [3:0] fillcolor 1 sandwich 3 prop @bundle 4
load symbol RTL_REG_SYNC__BREG_72 work[9:0]sswws GEN pin C input.clk.left pin CE input.left pinBus D input.left [9:0] pinBus Q output.right [9:0] pin SET input.bot fillcolor 1 sandwich 3 prop @bundle 10
load symbol RTL_EQ0 work RTL(=) pin O output.right pinBus I0 input.left [5:0] pinBus I1 input.left [5:0] fillcolor 1
load symbol RTL_REDUCTION_XNOR0 work XNOR pin O output pinBus I0 input [5:0] fillcolor 1
load symbol RTL_AND5 work AND pinBus I0 input [5:0] pinBus I1 input [5:0] pinBus O output [5:0] fillcolor 1
load symbol RTL_REG_SYNC__BREG_1 work[5:0]sswws GEN pin C input.clk.left pin CE input.left pinBus D input.left [5:0] pinBus Q output.right [5:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 6
load symbol RTL_ADD4 work RTL(+) pinBus I0 input.left [17:0] pinBus I1 input.left [17:0] pinBus O output.right [17:0] fillcolor 1
load symbol RTL_ADD8 work RTL(+) pinBus I0 input.left [19:0] pinBus I1 input.left [19:0] pinBus O output.right [19:0] fillcolor 1
load symbol RTL_MUX13 work MUX pinBus I0 input.left [7:0] pinBus I1 input.left [7:0] pinBus I2 input.left [7:0] pinBus O output.right [7:0] pinBus S input.bot [2:0] fillcolor 1
load symbol RTL_MUX12 work MUX pinBus I0 input.left [17:0] pinBus I1 input.left [17:0] pinBus O output.right [17:0] pinBus S input.bot [2:0] fillcolor 1
load symbol RTL_ROM work GEN pin O output.right pinBus A input.left [2:0] fillcolor 1
load symbol RTL_SUB work RTL(-) pinBus I0 input.left [8:0] pinBus I1 input.left [8:0] pinBus O output.right [8:0] fillcolor 1
load symbol RTL_MUX9 work MUX pinBus I0 input.left [7:0] pinBus I1 input.left [7:0] pinBus O output.right [7:0] pinBus S input.bot [1:0] fillcolor 1
load symbol RTL_ADD3 work RTL(+) pin I1 input.left pinBus I0 input.left [2:0] pinBus O output.right [2:0] fillcolor 1
load symbol RTL_EQ3 work RTL(=) pin O output.right pinBus I0 input.left [2:0] pinBus I1 input.left [2:0] fillcolor 1
load symbol RTL_NEQ1 work RTL(!=) pin O output.right pinBus I0 input.left [1:0] pinBus I1 input.left [1:0] fillcolor 1
load symbol RTL_MUX10 work MUX pinBus I0 input.left [2:0] pinBus I1 input.left [2:0] pinBus O output.right [2:0] pinBus S input.bot [2:0] fillcolor 1
load symbol RTL_XOR work XOR pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_MUX14 work MUX pinBus I0 input.left [5:0] pinBus I1 input.left [5:0] pinBus I2 input.left [5:0] pinBus I3 input.left [5:0] pinBus I4 input.left [5:0] pinBus I5 input.left [5:0] pinBus O output.right [5:0] pinBus S input.bot [2:0] fillcolor 1
load symbol RTL_EQ1 work RTL(=) pin O output.right pinBus I0 input.left [1:0] pinBus I1 input.left [1:0] fillcolor 1
load symbol RTL_MUX11 work MUX pin S input.bot pinBus I0 input.left [24:0] pinBus I1 input.left [24:0] pinBus O output.right [24:0] fillcolor 1
load symbol RTL_ADD2 work RTL(+) pinBus I0 input.left [2:0] pinBus I1 input.left [2:0] pinBus O output.right [2:0] fillcolor 1
load symbol RTL_ADD7 work RTL(+) pinBus I0 input.left [18:0] pinBus I1 input.left [18:0] pinBus O output.right [18:0] fillcolor 1
load symbol RTL_MOD work RTL(%) pinBus I0 input.left [3:0] pinBus I1 input.left [1:0] pinBus O output.right [1:0] fillcolor 1
load symbol RTL_DIV work RTL(/) pinBus I0 input.left [3:0] pinBus I1 input.left [1:0] pinBus O output.right [1:0] fillcolor 1
load symbol RTL_REG_SYNC__BREG_81 work GEN pin C input.clk.left pin D input.left pin Q output.right pin RST input.top fillcolor 1
load symbol pumped_dsp work:pumped_dsp:NOFILE HIERBOX pin clk_fast input.left pinBus a input.left [24:0] pinBus b input.left [7:0] pinBus p output.right [33:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_REG__BREG_4 work[17:0]ssww GEN pin C input.clk.left pin CE input.left pinBus D input.left [17:0] pinBus Q output.right [17:0] fillcolor 1 sandwich 3 prop @bundle 18
load symbol RTL_REG__BREG_76 work[24:0]sww GEN pin C input.clk.left pinBus D input.left [24:0] pinBus Q output.right [24:0] fillcolor 1 sandwich 3 prop @bundle 25
load symbol RTL_REG__BREG_76 work[2:0]sww GEN pin C input.clk.left pinBus D input.left [2:0] pinBus Q output.right [2:0] fillcolor 1 sandwich 3 prop @bundle 3
load symbol RTL_REG__BREG_4 work[19:0]ssww GEN pin C input.clk.left pin CE input.left pinBus D input.left [19:0] pinBus Q output.right [19:0] fillcolor 1 sandwich 3 prop @bundle 20
load symbol RTL_REG_SYNC__BREG_81 work[6:1]swws GEN pin C input.clk.left pinBus D input.left [6:1] pinBus Q output.right [6:1] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 6
load symbol RTL_REG_SYNC__BREG_81 work[2:0]swws GEN pin C input.clk.left pinBus D input.left [2:0] pinBus Q output.right [2:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 3
load symbol RTL_REG__BREG_76 work[7:0]sww GEN pin C input.clk.left pinBus D input.left [7:0] pinBus Q output.right [7:0] fillcolor 1 sandwich 3 prop @bundle 8
load symbol RTL_REG_SYNC__BREG_81 work[5:1]swws GEN pin C input.clk.left pinBus D input.left [5:1] pinBus Q output.right [5:1] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 5
load symbol RTL_REG__BREG_4 work[18:0]ssww GEN pin C input.clk.left pin CE input.left pinBus D input.left [18:0] pinBus Q output.right [18:0] fillcolor 1 sandwich 3 prop @bundle 19
load symbol RTL_REG_SYNC__BREG_84 work[2:0]swwww GEN pin C input.clk.left pinBus D input.left [2:0] pinBus Q output.right [2:0] pinBus RST input.top [2:0] pinBus SET input.bot [2:0] fillcolor 1 sandwich 3 prop @bundle 3
load symbol RTL_REG__BREG_76 work[17:0]sww GEN pin C input.clk.left pinBus D input.left [17:0] pinBus Q output.right [17:0] fillcolor 1 sandwich 3 prop @bundle 18
load symbol RTL_MULT work RTL(*) pinBus I0 input.left [24:0] pinBus I1 input.left [8:0] pinBus O output.right [33:0] fillcolor 1
load symbol RTL_ADD0 work RTL(+) pinBus I0 input.left [33:0] pinBus I1 input.left [33:0] pinBus O output.right [33:0] fillcolor 1
load symbol RTL_REG__BREG_76 work[33:0]sww GEN pin C input.clk.left pinBus D input.left [33:0] pinBus Q output.right [33:0] fillcolor 1 sandwich 3 prop @bundle 34
load symbol RTL_REG__BREG_4 work[16:0]ssww GEN pin C input.clk.left pin CE input.left pinBus D input.left [16:0] pinBus Q output.right [16:0] fillcolor 1 sandwich 3 prop @bundle 17
load symbol RTL_REG_SYNC__BREG_1 work[15:0]sswws GEN pin C input.clk.left pin CE input.left pinBus D input.left [15:0] pinBus Q output.right [15:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 16
load symbol RTL_REG_SYNC__BREG_134 work GEN pin C input.clk.left pin CE input.left pin D input.left pin Q output.right pin RST input.top pin SET input.bot fillcolor 1
load symbol RTL_RAM0 work GEN pin WCLK input.clk.left pin WE2 input.left pinBus RA1 input.left [5:0] pinBus RO1 output.right [15:0] pinBus WA2 input.left [5:0] pinBus WD2 input.left [15:0] fillcolor 1
load symbol RTL_NEQ4 work RTL(!=) pin O output.right pinBus I0 input.left [5:0] pinBus I1 input.left [5:0] fillcolor 1
load symbol RTL_ADD9 work RTL(+) pin I1 input.left pinBus I0 input.left [5:0] pinBus O output.right [5:0] fillcolor 1
load symbol lfsr_counter__parameterized1 work:lfsr_counter__parameterized1:NOFILE HIERBOX pin advance input.left pin at_count output.right pin clear input.left pin clk input.left boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_REG__BREG_4 work[15:0]ssww GEN pin C input.clk.left pin CE input.left pinBus D input.left [15:0] pinBus Q output.right [15:0] fillcolor 1 sandwich 3 prop @bundle 16
load symbol RTL_MUX work MUX pinBus I0 input.left [2:0] pinBus I1 input.left [2:0] pinBus I2 input.left [2:0] pinBus O output.right [2:0] pinBus S input.bot [1:0] fillcolor 1
load symbol RTL_MUX0 work MUX pinBus I0 input.left [1:0] pinBus I1 input.left [1:0] pinBus I2 input.left [1:0] pinBus I3 input.left [1:0] pinBus O output.right [1:0] pinBus S input.bot [1:0] fillcolor 1
load symbol RTL_MUX1 work MUX pin I0 input.left pin I1 input.left pin I2 input.left pin I3 input.left pin O output.right pinBus S input.bot [1:0] fillcolor 1
load symbol lfsr_counter work:lfsr_counter:NOFILE HIERBOX pin advance input.left pin at_count output.right pin clear input.left pin clk input.left boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_REG_SYNC__BREG_1 work[1:0]sswws GEN pin C input.clk.left pin CE input.left pinBus D input.left [1:0] pinBus Q output.right [1:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 2
load symbol RTL_REG_SYNC__BREG_2 work[6:0]swwwsw GEN pin C input.clk.left pinBus CE input.left [6:0] pinBus D input.left [6:0] pinBus Q output.right [6:0] pin RST input.top pinBus SET input.bot [6:0] fillcolor 1 sandwich 3 prop @bundle 7
load port pixel_req output -pg 1 -y 430
load port busy output -pg 1 -y 370
load port kernel_wr_en input -pg 1 -y 590
load port pixel_in_valid input -pg 1 -y 410
load port relu_enable input -pg 1 -y 390
load port start input -pg 1 -y 430
load port rst input -pg 1 -y 210
load port output_valid output -pg 1 -y 230
load port done output -pg 1 -y 390
load port clk input -pg 1 -y 80
load port frame_done output -pg 1 -y 190
load portBus kernel_wr_bank input [0:0] -attr @name kernel_wr_bank[0:0] -pg 1 -y 550
load portBus pixel_in input [7:0] -attr @name pixel_in[7:0] -pg 1 -y 20
load portBus kernel_wr_addr input [3:0] -attr @name kernel_wr_addr[3:0] -pg 1 -y 530
load portBus kernel_wr_data input [7:0] -attr @name kernel_wr_data[7:0] -pg 1 -y 570
load portBus kernel_select input [0:0] -attr @name kernel_select[0:0] -pg 1 -y 510
load portBus output_pixel output [15:0] -attr @name output_pixel[15:0] -pg 1 -y 210
load inst u_m2_window_generator window_generator work:window_generator:NOFILE -autohide -attr @cell(#000000) window_generator -attr @fillcolor #fafafa -pg 1 -lvl 4 -y 282
load inst u_m2_window_generator|col_ge_reg[1:0] RTL_REG_SYNC__BREG_2 work[1:0]swwwsw -hier u_m2_window_generator -attr @cell(#000000) RTL_REG_SYNC -attr @name col_ge_reg[1:0] -pinBusAttr SET @attr n/c -pg 1 -lvl 7 -y 512
load inst u_m2_window_generator|window_valid_i RTL_AND2 work -hier u_m2_window_generator -attr @cell(#000000) RTL_AND -attr @name window_valid_i -pg 1 -lvl 8 -y 402
load inst u_m1_line_buffer line_buffer work:line_buffer:NOFILE -fold -autohide -attr @cell(#000000) line_buffer -attr @fillcolor #dfebf8 -pinBusAttr curr_row_pixel @name curr_row_pixel[7:0] -pinBusAttr pixel_in @name pixel_in[7:0] -pinBusAttr prev_row1_pixel @name prev_row1_pixel[7:0] -pinBusAttr prev_row2_pixel @name prev_row2_pixel[7:0] -pg 1 -lvl 3 -y 60
load inst u_m1_line_buffer|line_buf1_reg[3][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[3][7:0] -pg 1 -lvl 4 -y 128
load inst u_m3_mac M3 work:M3:NOFILE -autohide -attr @cell(#000000) M3 -attr @fillcolor #fafafa -pinBusAttr col_row0 @name col_row0[7:0] -pinBusAttr col_row1 @name col_row1[7:0] -pinBusAttr col_row2 @name col_row2[7:0] -pinBusAttr mac_result @name mac_result[19:0] -pinBusAttr tap_data @name tap_data[7:0] -pinBusAttr tap_idx @name tap_idx[3:0] -pg 1 -lvl 5 -y 88
load inst u_m1_line_buffer|line_buf1_reg[11][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[11][7:0] -pg 1 -lvl 12 -y 108
load inst u_m3_mac|ring_50_i RTL_MUX11 work -hier u_m3_mac -attr @cell(#000000) RTL_MUX -attr @name ring_50_i -pinBusAttr I0 @name I0[24:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[24:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[24:0] -pg 1 -lvl 9 -y 778
load inst u_m3_mac|p_lo0_i RTL_INV work -hier u_m3_mac -attr @cell(#000000) RTL_INV -attr @name p_lo0_i -pg 1 -lvl 17 -y 858
load inst u_m1_line_buffer|line_buf1_reg[29][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[29][7:0] -pg 1 -lvl 30 -y 108
load inst u_m4_kernel_storage kernel_storage work:kernel_storage:NOFILE -autohide -attr @cell(#000000) kernel_storage -attr @fillcolor #fafafa -pinBusAttr kernel_select @name kernel_select -pinBusAttr kernel_wr_addr @name kernel_wr_addr[3:0] -pinBusAttr kernel_wr_bank @name kernel_wr_bank -pinBusAttr kernel_wr_data @name kernel_wr_data[7:0] -pinBusAttr tap_data @name tap_data[7:0] -pinBusAttr tap_idx @name tap_idx[3:0] -pg 1 -lvl 4 -y 1152
load inst u_m4_kernel_storage|rd_tap_reg[3:0] RTL_REG__BREG_4 work[3:0]ssww -hier u_m4_kernel_storage -attr @cell(#000000) RTL_REG -attr @name rd_tap_reg[3:0] -pg 1 -lvl 8 -y 1502
load inst u_m3_mac|ph0_i__0 RTL_XOR work -hier u_m3_mac -attr @cell(#000000) RTL_XOR -attr @name ph0_i__0 -pg 1 -lvl 5 -y 188
load inst u_m7_fifo FIFO work:FIFO:NOFILE -autohide -attr @cell(#000000) FIFO -attr @fillcolor #fafafa -pinBusAttr final_output @name final_output[15:0] -pinBusAttr output_pixel @name output_pixel[15:0] -pg 1 -lvl 7 -y 168
load inst u_m7_fifo|output_valid_reg RTL_REG_SYNC__BREG_81 work -hier u_m7_fifo -attr @cell(#000000) RTL_REG_SYNC -attr @name output_valid_reg -pg 1 -lvl 10 -y 378
load inst u_m3_mac|u_dsp pumped_dsp work:pumped_dsp:NOFILE -hier u_m3_mac -autohide -attr @cell(#000000) pumped_dsp -attr @name u_dsp -attr @fillcolor #fafafa -pinBusAttr a @name a[24:0] -pinBusAttr b @name b[7:0] -pinBusAttr p @name p[33:0] -pg 1 -lvl 16 -y 716
load inst u_m3_mac|acc_c_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name acc_c_reg[17:0] -pg 1 -lvl 21 -y 618
load inst u_m3_mac|insph_f_reg[2:0] RTL_REG__BREG_76 work[2:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name insph_f_reg[2:0] -pg 1 -lvl 6 -y 528
load inst u_m3_mac|ring_53_i RTL_EQ3 work -hier u_m3_mac -attr @cell(#000000) RTL_EQ -attr @name ring_53_i -pinBusAttr I0 @name I0[2:0] -pinBusAttr I1 @name I1[2:0] -pg 1 -lvl 7 -y 518
load inst u_m7_fifo|output_pixel_i RTL_MUX8 work -hier u_m7_fifo -attr @cell(#000000) RTL_MUX -attr @name output_pixel_i -pinAttr I0 @attr S=1'b1 -pinAttr I1 @attr S=default -pg 1 -lvl 9 -y 388
load inst u_m3_mac|t1_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name t1_reg[17:0] -pg 1 -lvl 23 -y 258
load inst u_m3_mac|frame_a_i RTL_ROM work -hier u_m3_mac -attr @cell(#000000) RTL_ROM -attr @name frame_a_i -pinBusAttr A @name A[2:0] -pg 1 -lvl 18 -y 688
load inst u_m6_control_fsm control_fsm work:control_fsm:NOFILE -autohide -attr @cell(#000000) control_fsm -attr @fillcolor #fafafa -pg 1 -lvl 8 -y 368
load inst u_m6_control_fsm|drain_sr_reg[6:0] RTL_REG_SYNC__BREG_2 work[6:0]swwwsw -hier u_m6_control_fsm -attr @cell(#000000) RTL_REG_SYNC -attr @name drain_sr_reg[6:0] -pinBusAttr SET @attr n/c -pg 1 -lvl 4 -y 428
load inst u_m3_mac|u_dsp|m_r0_i RTL_MULT work -hier u_m3_mac|u_dsp -attr @cell(#000000) RTL_MULT -attr @name m_r0_i -pinBusAttr I0 @name I0[24:0] -pinBusAttr I1 @name I1[8:0] -pinBusAttr O @name O[33:0] -pg 1 -lvl 2 -y 866
load inst u_m2_window_generator|u_col lfsr_counter__parameterized0 work:lfsr_counter__parameterized0:NOFILE -hier u_m2_window_generator -autohide -attr @cell(#000000) lfsr_counter__parameterized0 -attr @name u_col -attr @fillcolor #fafafa -pg 1 -lvl 3 -y 766
load inst u_m2_window_generator|u_col|lfsr_step2076_return1_i RTL_AND5 work -hier u_m2_window_generator|u_col -attr @cell(#000000) RTL_AND -attr @name lfsr_step2076_return1_i -pinBusAttr I0 @name I0[5:0] -pinBusAttr I1 @name I1[5:0] -pinBusAttr I1 @attr V=B\"110000\" -pinBusAttr O @name O[5:0] -pg 1 -lvl 1 -y 876
load inst u_m3_mac|tog_s_reg RTL_REG_SYNC__BREG_81 work -hier u_m3_mac -attr @cell(#000000) RTL_REG_SYNC -attr @name tog_s_reg -pg 1 -lvl 2 -y 218
load inst u_m3_mac|acc_c0_i__0 RTL_OR1 work -hier u_m3_mac -attr @cell(#000000) RTL_OR -attr @name acc_c0_i__0 -pg 1 -lvl 20 -y 378
load inst u_m3_mac|acc_c0_i RTL_ADD4 work -hier u_m3_mac -attr @cell(#000000) RTL_ADD -attr @name acc_c0_i -pinBusAttr I0 @name I0[17:0] -pinBusAttr I1 @name I1[17:0] -pinBusAttr O @name O[17:0] -pg 1 -lvl 20 -y 708
load inst u_m3_mac|ev_reg[5:1] RTL_REG_SYNC__BREG_81 work[5:1]swws -hier u_m3_mac -attr @cell(#000000) RTL_REG_SYNC -attr @name ev_reg[5:1] -pg 1 -lvl 20 -y 128
load inst u_m1_line_buffer|line_buf2_reg[26][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[26][7:0] -pg 1 -lvl 27 -y 318
load inst u_m3_mac|ld_s1_i RTL_NEQ1 work -hier u_m3_mac -attr @cell(#000000) RTL_NEQ -attr @name ld_s1_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I1 @name I1[1:0] -pg 1 -lvl 4 -y 928
load inst u_m6_control_fsm|state_next_i RTL_MUX0 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_MUX -attr @name state_next_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I0 @attr V=B\"01\",\ S=2'b00 -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr V=B\"10\",\ S=2'b01 -pinBusAttr I2 @name I2[1:0] -pinBusAttr I2 @attr S=2'b10 -pinBusAttr I3 @name I3[1:0] -pinBusAttr I3 @attr V=B\"01\",\ S=2'b11 -pinBusAttr O @name O[1:0] -pinBusAttr S @name S[1:0] -pg 1 -lvl 5 -y 688
load inst u_m1_line_buffer|line_buf2_reg[5][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[5][7:0] -pg 1 -lvl 6 -y 318
load inst u_m2_window_generator|row_ge_i__0 RTL_MUX4 work -hier u_m2_window_generator -attr @cell(#000000) RTL_MUX -attr @name row_ge_i__0 -pinBusAttr I0 @name I0[1:0] -pinBusAttr I0 @attr V=B\"01\",\ S=1'b1 -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[1:0] -pg 1 -lvl 5 -y 722
load inst u_m1_line_buffer|line_buf1_reg[27][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[27][7:0] -pg 1 -lvl 28 -y 108
load inst u_m4_kernel_storage|changed0_i RTL_NEQ2 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_NEQ -attr @name changed0_i -pg 1 -lvl 3 -y 1252
load inst u_m4_kernel_storage|sweep_left_reg[9:0] RTL_REG_SYNC__BREG_72 work[9:0]sswws -hier u_m4_kernel_storage -attr @cell(#000000) RTL_REG_SYNC -attr @name sweep_left_reg[9:0] -pg 1 -lvl 5 -y 1532
load inst u_m4_kernel_storage|streaming_i RTL_AND2 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_AND -attr @name streaming_i -pg 1 -lvl 6 -y 1432
load inst u_m2_window_generator|pass_clear_i RTL_OR1 work -hier u_m2_window_generator -attr @cell(#000000) RTL_OR -attr @name pass_clear_i -pg 1 -lvl 1 -y 782
load inst u_m1_line_buffer|line_buf1_reg[23][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[23][7:0] -pg 1 -lvl 24 -y 108
load inst u_m7_fifo|mem_i RTL_MUX8 work -hier u_m7_fifo -attr @cell(#000000) RTL_MUX -attr @name mem_i -pinAttr I0 @attr S=1'b1 -pinAttr I1 @attr S=default -pg 1 -lvl 7 -y 338
load inst u_m7_fifo|release_start0_i RTL_AND2 work -hier u_m7_fifo -attr @cell(#000000) RTL_AND -attr @name release_start0_i -pg 1 -lvl 4 -y 518
load inst u_m3_mac|ld_s_reg RTL_REG__BREG_76 work -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name ld_s_reg -pg 1 -lvl 6 -y 678
load inst u_m3_mac|s4_c_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name s4_c_reg[17:0] -pg 1 -lvl 24 -y 258
load inst u_m3_mac|acc_c1_i RTL_OR1 work -hier u_m3_mac -attr @cell(#000000) RTL_OR -attr @name acc_c1_i -pg 1 -lvl 19 -y 338
load inst u_m3_mac|sum_c1_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name sum_c1_reg[17:0] -pg 1 -lvl 23 -y 408
load inst u_clk_gen clk_gen_6x work:clk_gen_6x:NOFILE -autohide -attr @cell(#000000) clk_gen_6x -attr @fillcolor #fafafa -pg 1 -lvl 2 -y 78
load inst u_clk_gen|u_bufg_fast BUFG hdi_primitives -hier u_clk_gen -attr @cell(#000000) BUFG -attr @name u_bufg_fast -pg 1 -lvl 1 -y 88
load inst u_m3_mac|s3_c_reg[17:0] RTL_REG__BREG_76 work[17:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name s3_c_reg[17:0] -pg 1 -lvl 23 -y 548
load inst u_m4_kernel_storage|wr_enable0_i__0 RTL_LT0 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_LT -attr @name wr_enable0_i__0 -pinBusAttr I0 @name I0[1:0] -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr V=B\"10\" -pg 1 -lvl 2 -y 1492
load inst u_m1_line_buffer|line_buf2_reg[16][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[16][7:0] -pg 1 -lvl 17 -y 318
load inst u_m7_fifo|wr_ptr0_i RTL_OR1 work -hier u_m7_fifo -attr @cell(#000000) RTL_OR -attr @name wr_ptr0_i -pg 1 -lvl 1 -y 438
load inst u_m1_line_buffer|line_buf2_reg[18][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[18][7:0] -pg 1 -lvl 19 -y 318
load inst u_m1_line_buffer|line_buf1_reg[18][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[18][7:0] -pg 1 -lvl 19 -y 108
load inst u_m3_mac|slot0_i RTL_EQ1 work -hier u_m3_mac -attr @cell(#000000) RTL_EQ -attr @name slot0_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr V=B\"10\" -pg 1 -lvl 2 -y 678
load inst u_m2_window_generator|col_ge_i RTL_MUX4 work -hier u_m2_window_generator -attr @cell(#000000) RTL_MUX -attr @name col_ge_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I0 @attr V=B\"10\",\ S=1'b1 -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[1:0] -pg 1 -lvl 6 -y 322
load inst u_m1_line_buffer|line_buf2_reg[27][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[27][7:0] -pg 1 -lvl 28 -y 318
load inst u_m6_control_fsm|drain_sr0_i RTL_OR1 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_OR -attr @name drain_sr0_i -pg 1 -lvl 3 -y 518
load inst u_m2_window_generator|row_ge_reg[1:0] RTL_REG_SYNC__BREG_2 work[1:0]swwwsw -hier u_m2_window_generator -attr @cell(#000000) RTL_REG_SYNC -attr @name row_ge_reg[1:0] -pinBusAttr SET @attr n/c -pg 1 -lvl 6 -y 622
load inst u_m1_line_buffer|line_buf1_reg[10][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[10][7:0] -pg 1 -lvl 11 -y 108
load inst u_m1_line_buffer|line_buf1_reg[21][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[21][7:0] -pg 1 -lvl 22 -y 108
load inst u_m6_control_fsm|state_next0_i RTL_AND2 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_AND -attr @name state_next0_i -pg 1 -lvl 4 -y 728
load inst u_m4_kernel_storage|rd_tap0_i RTL_MUX7 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_MUX -attr @name rd_tap0_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=4'b1000 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pinBusAttr S @name S[3:0] -pg 1 -lvl 7 -y 1522
load inst u_m4_kernel_storage|tap_idx_reg[3:0] RTL_REG__BREG_4 work[3:0]ssww -hier u_m4_kernel_storage -attr @cell(#000000) RTL_REG -attr @name tap_idx_reg[3:0] -pg 1 -lvl 11 -y 1562
load inst u_m1_line_buffer|line_buf2_reg[23][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[23][7:0] -pg 1 -lvl 24 -y 318
load inst u_m5_output_handling output_handling work:output_handling:NOFILE -autohide -attr @cell(#000000) output_handling -attr @fillcolor #fafafa -pinBusAttr final_output @name final_output[15:0] -pinBusAttr mac_result @name mac_result[19:0] -pg 1 -lvl 6 -y 164
load inst u_m5_output_handling|final_output_reg[15:0] RTL_REG_SYNC__BREG_1 work[15:0]sswws -hier u_m5_output_handling -attr @cell(#000000) RTL_REG_SYNC -attr @name final_output_reg[15:0] -pg 1 -lvl 3 -y 344
load inst u_m1_line_buffer|line_buf2_reg[2][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[2][7:0] -pg 1 -lvl 3 -y 358
load inst u_m7_fifo|pop0_i__0 RTL_NEQ4 work -hier u_m7_fifo -attr @cell(#000000) RTL_NEQ -attr @name pop0_i__0 -pinBusAttr I0 @name I0[5:0] -pinBusAttr I1 @name I1[5:0] -pg 1 -lvl 6 -y 518
load inst u_m3_mac|base_b_i RTL_MUX12 work -hier u_m3_mac -attr @cell(#000000) RTL_MUX -attr @name base_b_i -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=3'b100 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 17 -y 688
load inst u_m4_kernel_storage|tap_valid_reg RTL_REG__BREG_76 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_REG -attr @name tap_valid_reg -pg 1 -lvl 11 -y 1692
load inst u_m3_mac|tog_f1_reg RTL_REG__BREG_76 work -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name tog_f1_reg -pg 1 -lvl 3 -y 228
load inst u_m1_line_buffer|line_buf2_reg[7][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[7][7:0] -pg 1 -lvl 8 -y 318
load inst u_m3_mac|tog_s0_i RTL_INV work -hier u_m3_mac -attr @cell(#000000) RTL_INV -attr @name tog_s0_i -pg 1 -lvl 1 -y 228
load inst u_m6_control_fsm|busy0_i__0 RTL_INV work -hier u_m6_control_fsm -attr @cell(#000000) RTL_INV -attr @name busy0_i__0 -pg 1 -lvl 7 -y 448
load inst u_m1_line_buffer|line_buf1_reg[14][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[14][7:0] -pg 1 -lvl 15 -y 108
load inst u_m7_fifo|release_start_i RTL_AND2 work -hier u_m7_fifo -attr @cell(#000000) RTL_AND -attr @name release_start_i -pg 1 -lvl 5 -y 648
load inst u_m4_kernel_storage|streaming0_i RTL_INV work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_INV -attr @name streaming0_i -pg 1 -lvl 5 -y 1422
load inst u_m3_mac|acc_r_reg[19:0] RTL_REG__BREG_4 work[19:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name acc_r_reg[19:0] -pg 1 -lvl 27 -y 348
load inst u_m5_output_handling|rounded_val_r_reg[16:0] RTL_REG__BREG_4 work[16:0]ssww -hier u_m5_output_handling -attr @cell(#000000) RTL_REG -attr @name rounded_val_r_reg[16:0] -pg 1 -lvl 1 -y 214
load inst u_m7_fifo|mem_reg RTL_RAM0 work -hier u_m7_fifo -attr @cell(#000000) RTL_RAM -attr @name mem_reg -pinBusAttr RA1 @name RA1[5:0] -pinBusAttr RO1 @name RO1[15:0] -pinBusAttr WA2 @name WA2[5:0] -pinBusAttr WD2 @name WD2[15:0] -pg 1 -lvl 9 -y 568
load inst u_m3_mac|q_f1_reg[7:0] RTL_REG__BREG_76 work[7:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name q_f1_reg[7:0] -pg 1 -lvl 14 -y 418
load inst u_m3_mac|base_c_i RTL_MUX12 work -hier u_m3_mac -attr @cell(#000000) RTL_MUX -attr @name base_c_i -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr V=X\"00008\",\ S=3'b101 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 19 -y 698
load inst u_m4_kernel_storage|mem_reg RTL_RAM work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_RAM -attr @name mem_reg -pinBusAttr RA1 @name RA1[4:0] -pinBusAttr RO1 @name RO1[7:0] -pinBusAttr WA2 @name WA2[4:0] -pinBusAttr WD2 @name WD2[7:0] -pg 1 -lvl 10 -y 1292
load inst u_m3_mac|ld_f_reg RTL_REG__BREG_76 work -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name ld_f_reg -pg 1 -lvl 7 -y 618
load inst u_m3_mac|ld_s0_i RTL_AND2 work -hier u_m3_mac -attr @cell(#000000) RTL_AND -attr @name ld_s0_i -pg 1 -lvl 5 -y 908
load inst u_m1_line_buffer|line_buf2_reg[17][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[17][7:0] -pg 1 -lvl 18 -y 318
load inst u_m3_mac|ph_i RTL_MUX14 work -hier u_m3_mac -attr @cell(#000000) RTL_MUX -attr @name ph_i -pinBusAttr I0 @name I0[5:0] -pinBusAttr I0 @attr V=B\"000001\",\ S=3'b100 -pinBusAttr I1 @name I1[5:0] -pinBusAttr I1 @attr V=B\"000010\",\ S=3'b000 -pinBusAttr I2 @name I2[5:0] -pinBusAttr I2 @attr V=B\"000100\",\ S=3'b010 -pinBusAttr I3 @name I3[5:0] -pinBusAttr I3 @attr V=B\"001000\",\ S=3'b101 -pinBusAttr I4 @name I4[5:0] -pinBusAttr I4 @attr V=B\"010000\",\ S=3'b001 -pinBusAttr I5 @name I5[5:0] -pinBusAttr I5 @attr V=B\"100000\",\ S=3'b011 -pinBusAttr O @name O[5:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 15 -y 588
load inst u_m5_output_handling|final_output0_i RTL_AND2 work -hier u_m5_output_handling -attr @cell(#000000) RTL_AND -attr @name final_output0_i -pg 1 -lvl 2 -y 324
load inst u_m4_kernel_storage|rd_tap1_i RTL_ADD work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_ADD -attr @name rd_tap1_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr O @name O[3:0] -pg 1 -lvl 6 -y 1532
load inst u_m3_mac|q_s0_reg[7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name q_s0_reg[7:0] -pg 1 -lvl 13 -y 138
load inst u_m1_line_buffer|line_buf1_reg[26][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[26][7:0] -pg 1 -lvl 27 -y 108
load inst u_m1_line_buffer|line_buf2_reg[3][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[3][7:0] -pg 1 -lvl 4 -y 358
load inst u_m3_mac|prev_c01_i RTL_EQ1 work -hier u_m3_mac -attr @cell(#000000) RTL_EQ -attr @name prev_c01_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I1 @name I1[1:0] -pg 1 -lvl 2 -y 958
load inst u_m3_mac|frame_a_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name frame_a_reg[17:0] -pg 1 -lvl 19 -y 458
load inst u_m3_mac|frame_b_i RTL_ROM work -hier u_m3_mac -attr @cell(#000000) RTL_ROM -attr @name frame_b_i -pinBusAttr A @name A[2:0] -pg 1 -lvl 19 -y 588
load inst u_m6_control_fsm|busy_i RTL_AND2 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_AND -attr @name busy_i -pg 1 -lvl 8 -y 438
load inst u_m1_line_buffer|line_buf1_reg[1][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[1][7:0] -pg 1 -lvl 2 -y 148
load inst u_m3_mac|frame_b_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name frame_b_reg[17:0] -pg 1 -lvl 20 -y 588
load inst u_m3_mac|tog_f2_reg RTL_REG__BREG_76 work -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name tog_f2_reg -pg 1 -lvl 4 -y 198
load inst u_m7_fifo|rd_ptr0_i RTL_ADD9 work -hier u_m7_fifo -attr @cell(#000000) RTL_ADD -attr @name rd_ptr0_i -pinBusAttr I0 @name I0[5:0] -pinBusAttr O @name O[5:0] -pg 1 -lvl 4 -y 368
load inst u_m7_fifo|release_start0_i__0 RTL_EQ0 work -hier u_m7_fifo -attr @cell(#000000) RTL_EQ -attr @name release_start0_i__0 -pinBusAttr I0 @name I0[5:0] -pinBusAttr I1 @name I1[5:0] -pinBusAttr I1 @attr V=B\"111001\" -pg 1 -lvl 4 -y 658
load inst u_m3_mac|ph1_i RTL_ADD3 work -hier u_m3_mac -attr @cell(#000000) RTL_ADD -attr @name ph1_i -pinBusAttr I0 @name I0[2:0] -pinBusAttr O @name O[2:0] -pg 1 -lvl 4 -y 308
load inst u_m1_line_buffer|line_buf1_reg[15][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[15][7:0] -pg 1 -lvl 16 -y 108
load inst u_m4_kernel_storage|wr_enable1_i RTL_LT work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_LT -attr @name wr_enable1_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"1001\" -pg 1 -lvl 1 -y 1252
load inst u_m3_mac|base_a_i RTL_MUX12 work -hier u_m3_mac -attr @cell(#000000) RTL_MUX -attr @name base_a_i -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=3'b100 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 16 -y 578
load inst u_m7_fifo|wr_ptr_reg[5:0] RTL_REG_SYNC__BREG_1 work[5:0]sswws -hier u_m7_fifo -attr @cell(#000000) RTL_REG_SYNC -attr @name wr_ptr_reg[5:0] -pg 1 -lvl 3 -y 368
load inst u_m1_line_buffer|line_buf2_reg[21][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[21][7:0] -pg 1 -lvl 22 -y 318
load inst u_m4_kernel_storage|addr_i RTL_MUX6 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_MUX -attr @name addr_i -pinBusAttr I0 @name I0[4:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[4:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[4:0] -pg 1 -lvl 9 -y 1212
load inst u_m3_mac|prev_c00_i RTL_AND2 work -hier u_m3_mac -attr @cell(#000000) RTL_AND -attr @name prev_c00_i -pg 1 -lvl 3 -y 948
load inst u_m5_output_handling|valid_stage1_reg RTL_REG_SYNC__BREG_81 work -hier u_m5_output_handling -attr @cell(#000000) RTL_REG_SYNC -attr @name valid_stage1_reg -pg 1 -lvl 2 -y 214
load inst u_m1_line_buffer|line_buf1_reg[8][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[8][7:0] -pg 1 -lvl 9 -y 108
load inst u_m2_window_generator|window_valid0_i RTL_AND2 work -hier u_m2_window_generator -attr @cell(#000000) RTL_AND -attr @name window_valid0_i -pg 1 -lvl 7 -y 392
load inst u_m1_line_buffer|line_buf1_reg[16][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[16][7:0] -pg 1 -lvl 17 -y 108
load inst u_m7_fifo|pop0_i RTL_OR1 work -hier u_m7_fifo -attr @cell(#000000) RTL_OR -attr @name pop0_i -pg 1 -lvl 6 -y 638
load inst u_m3_mac|word_s_reg[24:0] RTL_REG__BREG_76 work[24:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name word_s_reg[24:0] -pg 1 -lvl 7 -y 778
load inst u_m6_control_fsm|clear0_i RTL_OR1 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_OR -attr @name clear0_i -pg 1 -lvl 2 -y 728
load inst u_m3_mac|ph_reg[2:0] RTL_REG_SYNC__BREG_84 work[2:0]swwww -hier u_m3_mac -attr @cell(#000000) RTL_REG_SYNC -attr @name ph_reg[2:0] -pinBusAttr SET @attr n/c -pg 1 -lvl 6 -y 288
load inst u_m1_line_buffer|line_buf1_reg[22][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[22][7:0] -pg 1 -lvl 23 -y 108
load inst u_m1_line_buffer|line_buf2_reg[30][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[30][7:0] -pg 1 -lvl 31 -y 318
load inst u_m3_mac|t20_i RTL_ADD7 work -hier u_m3_mac -attr @cell(#000000) RTL_ADD -attr @name t20_i -pinBusAttr I0 @name I0[18:0] -pinBusAttr I1 @name I1[18:0] -pinBusAttr O @name O[18:0] -pg 1 -lvl 24 -y 398
load inst u_m1_line_buffer|line_buf2_reg[24][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[24][7:0] -pg 1 -lvl 25 -y 318
load inst u_m3_mac|acc_a0_i RTL_ADD4 work -hier u_m3_mac -attr @cell(#000000) RTL_ADD -attr @name acc_a0_i -pinBusAttr I0 @name I0[17:0] -pinBusAttr I1 @name I1[17:0] -pinBusAttr O @name O[17:0] -pg 1 -lvl 17 -y 588
load inst u_m3_mac|u_dsp|p0_i RTL_ADD0 work -hier u_m3_mac|u_dsp -attr @cell(#000000) RTL_ADD -attr @name p0_i -pinBusAttr I0 @name I0[33:0] -pinBusAttr I1 @name I1[33:0] -pinBusAttr I1 @attr V=X\"000008000\" -pinBusAttr O @name O[33:0] -pg 1 -lvl 4 -y 866
load inst u_m6_control_fsm|state_reg[1:0] RTL_REG_SYNC__BREG_1 work[1:0]sswws -hier u_m6_control_fsm -attr @cell(#000000) RTL_REG_SYNC -attr @name state_reg[1:0] -pg 1 -lvl 6 -y 608
load inst u_m3_mac|s3_b_reg[17:0] RTL_REG__BREG_76 work[17:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name s3_b_reg[17:0] -pg 1 -lvl 21 -y 478
load inst u_m3_mac|acc_a0_i__0 RTL_OR1 work -hier u_m3_mac -attr @cell(#000000) RTL_OR -attr @name acc_a0_i__0 -pg 1 -lvl 17 -y 438
load inst u_m3_mac|q_f2_reg[7:0] RTL_REG__BREG_76 work[7:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name q_f2_reg[7:0] -pg 1 -lvl 14 -y 538
load inst u_m1_line_buffer|line_buf2_reg[1][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[1][7:0] -pg 1 -lvl 2 -y 358
load inst u_m1_line_buffer|line_buf1_reg[30][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[30][7:0] -pg 1 -lvl 31 -y 108
load inst u_m6_control_fsm|start_pass_i RTL_AND2 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_AND -attr @name start_pass_i -pg 1 -lvl 8 -y 998
load inst u_m1_line_buffer|line_buf2_reg[14][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[14][7:0] -pg 1 -lvl 15 -y 318
load inst u_m3_mac|u_dsp|m_r_reg[33:0] RTL_REG__BREG_76 work[33:0]sww -hier u_m3_mac|u_dsp -attr @cell(#000000) RTL_REG -attr @name m_r_reg[33:0] -pg 1 -lvl 3 -y 856
load inst clk_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 1 -y 80
load inst u_m7_fifo|output_pixel_reg[15:0] RTL_REG__BREG_4 work[15:0]ssww -hier u_m7_fifo -attr @cell(#000000) RTL_REG -attr @name output_pixel_reg[15:0] -pg 1 -lvl 10 -y 498
load inst u_m1_line_buffer|line_buf1_reg[31][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[31][7:0] -pg 1 -lvl 32 -y 128
load inst u_m1_line_buffer|line_buf2_reg[22][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[22][7:0] -pg 1 -lvl 23 -y 318
load inst u_m7_fifo|rd_ptr_reg[5:0] RTL_REG_SYNC__BREG_1 work[5:0]sswws -hier u_m7_fifo -attr @cell(#000000) RTL_REG_SYNC -attr @name rd_ptr_reg[5:0] -pg 1 -lvl 5 -y 348
load inst u_m7_fifo|pop_i RTL_AND2 work -hier u_m7_fifo -attr @cell(#000000) RTL_AND -attr @name pop_i -pg 1 -lvl 7 -y 518
load inst u_m3_mac|frame_c_i RTL_ROM work -hier u_m3_mac -attr @cell(#000000) RTL_ROM -attr @name frame_c_i -pinBusAttr A @name A[2:0] -pg 1 -lvl 21 -y 738
load inst u_m1_line_buffer|line_buf2_reg[8][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[8][7:0] -pg 1 -lvl 9 -y 318
load inst u_m3_mac|prev_c0_reg[7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name prev_c0_reg[7:0] -pg 1 -lvl 4 -y 778
load inst u_m3_mac|hi_src_i RTL_MUX9 work -hier u_m3_mac -attr @cell(#000000) RTL_MUX -attr @name hi_src_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=2'b01 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pinBusAttr S @name S[1:0] -pg 1 -lvl 5 -y 788
load inst u_m1_line_buffer|line_buf1_reg[17][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[17][7:0] -pg 1 -lvl 18 -y 108
load inst u_m3_mac|ph0_i RTL_MUX10 work -hier u_m3_mac -attr @cell(#000000) RTL_MUX -attr @name ph0_i -pinBusAttr I0 @name I0[2:0] -pinBusAttr I0 @attr S=3'b101 -pinBusAttr I1 @name I1[2:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[2:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 5 -y 298
load inst u_m3_mac|wv_reg[6:1] RTL_REG_SYNC__BREG_81 work[6:1]swws -hier u_m3_mac -attr @cell(#000000) RTL_REG_SYNC -attr @name wv_reg[6:1] -pg 1 -lvl 27 -y 548
load inst u_m2_window_generator|row_wrap_i RTL_AND2 work -hier u_m2_window_generator -attr @cell(#000000) RTL_AND -attr @name row_wrap_i -pg 1 -lvl 4 -y 762
load inst u_m1_line_buffer|line_buf1_reg[7][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[7][7:0] -pg 1 -lvl 8 -y 108
load inst u_m1_line_buffer|line_buf1_reg[28][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[28][7:0] -pg 1 -lvl 29 -y 108
load inst u_m3_mac|ring_0_reg[24:0] RTL_REG__BREG_76 work[24:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name ring_0_reg[24:0] -pg 1 -lvl 15 -y 798
load inst u_m2_window_generator|col_ge0_i RTL_OR1 work -hier u_m2_window_generator -attr @cell(#000000) RTL_OR -attr @name col_ge0_i -pg 1 -lvl 2 -y 792
load inst u_m3_mac|acc_b_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name acc_b_reg[17:0] -pg 1 -lvl 19 -y 918
load inst u_m3_mac|acc_b0_i RTL_ADD4 work -hier u_m3_mac -attr @cell(#000000) RTL_ADD -attr @name acc_b0_i -pinBusAttr I0 @name I0[17:0] -pinBusAttr I1 @name I1[17:0] -pinBusAttr O @name O[17:0] -pg 1 -lvl 18 -y 848
load inst u_m7_fifo|wr_ptr0_i__0 RTL_ADD9 work -hier u_m7_fifo -attr @cell(#000000) RTL_ADD -attr @name wr_ptr0_i__0 -pinBusAttr I0 @name I0[5:0] -pinBusAttr O @name O[5:0] -pg 1 -lvl 2 -y 388
load inst u_m3_mac|u_dsp|p_reg[33:0] RTL_REG__BREG_76 work[33:0]sww -hier u_m3_mac|u_dsp -attr @cell(#000000) RTL_REG -attr @name p_reg[33:0] -pg 1 -lvl 5 -y 806
load inst u_m1_line_buffer|line_buf2_reg[13][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[13][7:0] -pg 1 -lvl 14 -y 318
load inst u_m3_mac|hi_lane_i RTL_SUB work -hier u_m3_mac -attr @cell(#000000) RTL_SUB -attr @name hi_lane_i -pinBusAttr I0 @name I0[8:0] -pinBusAttr I1 @name I1[8:0] -pinBusAttr O @name O[8:0] -pg 1 -lvl 6 -y 778
load inst u_m1_line_buffer|line_buf1_reg[0][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[0][7:0] -pg 1 -lvl 1 -y 128
load inst u_m2_window_generator|u_col|state_reg[5:0] RTL_REG_SYNC__BREG_1 work[5:0]sswws -hier u_m2_window_generator|u_col -attr @cell(#000000) RTL_REG_SYNC -attr @name state_reg[5:0] -pg 1 -lvl 3 -y 846
load inst u_m4_kernel_storage|sel_prev_reg[0] RTL_REG__BREG_71 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_REG -attr @name sel_prev_reg[0] -pg 1 -lvl 2 -y 1382
load inst u_m3_mac|insph_s_reg[2:0] RTL_REG_SYNC__BREG_81 work[2:0]swws -hier u_m3_mac -attr @cell(#000000) RTL_REG_SYNC -attr @name insph_s_reg[2:0] -pg 1 -lvl 5 -y 598
load inst u_m4_kernel_storage|wr_enable_i RTL_AND2 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_AND -attr @name wr_enable_i -pg 1 -lvl 3 -y 1482
load inst u_m3_mac|insph_s0_i__0 RTL_EQ3 work -hier u_m3_mac -attr @cell(#000000) RTL_EQ -attr @name insph_s0_i__0 -pinBusAttr I0 @name I0[2:0] -pinBusAttr I1 @name I1[2:0] -pinBusAttr I1 @attr V=B\"101\" -pg 1 -lvl 4 -y 538
load inst u_m1_line_buffer|line_buf1_reg[4][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[4][7:0] -pg 1 -lvl 5 -y 108
load inst u_m3_mac|q_s1_reg[7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name q_s1_reg[7:0] -pg 1 -lvl 13 -y 408
load inst u_m1_line_buffer|line_buf2_reg[20][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[20][7:0] -pg 1 -lvl 21 -y 318
load inst u_m7_fifo|RTL_AND RTL_AND2 work -hier u_m7_fifo -attr @cell(#000000) RTL_AND -attr @name RTL_AND -pg 1 -lvl 8 -y 478
load inst u_m3_mac|frame_c_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name frame_c_reg[17:0] -pg 1 -lvl 22 -y 568
load inst u_m4_kernel_storage|tap_data_reg[7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m4_kernel_storage -attr @cell(#000000) RTL_REG -attr @name tap_data_reg[7:0] -pg 1 -lvl 11 -y 1422
load inst u_m1_line_buffer|line_buf2_reg[29][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[29][7:0] -pg 1 -lvl 30 -y 318
load inst u_m3_mac|s3_a_reg[17:0] RTL_REG__BREG_76 work[17:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name s3_a_reg[17:0] -pg 1 -lvl 20 -y 278
load inst u_m3_mac|sum_c2_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name sum_c2_reg[17:0] -pg 1 -lvl 25 -y 238
load inst u_m7_fifo|release_start1_i RTL_INV work -hier u_m7_fifo -attr @cell(#000000) RTL_INV -attr @name release_start1_i -pg 1 -lvl 3 -y 508
load inst u_m3_mac|s4_b_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name s4_b_reg[17:0] -pg 1 -lvl 22 -y 408
load inst u_m3_mac|t2_reg[18:0] RTL_REG__BREG_4 work[18:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name t2_reg[18:0] -pg 1 -lvl 25 -y 408
load inst u_m3_mac|slot_i RTL_ADD2 work -hier u_m3_mac -attr @cell(#000000) RTL_ADD -attr @name slot_i -pinBusAttr I0 @name I0[2:0] -pinBusAttr I1 @name I1[2:0] -pinBusAttr O @name O[2:0] -pg 1 -lvl 3 -y 668
load inst u_m7_fifo|release_mode_reg RTL_REG_SYNC__BREG_81 work -hier u_m7_fifo -attr @cell(#000000) RTL_REG_SYNC -attr @name release_mode_reg -pg 1 -lvl 2 -y 498
load inst u_m7_fifo|fifo_all_outputs_done0_i RTL_AND2 work -hier u_m7_fifo -attr @cell(#000000) RTL_AND -attr @name fifo_all_outputs_done0_i -pg 1 -lvl 9 -y 278
load inst u_m1_line_buffer|line_buf1_reg[25][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[25][7:0] -pg 1 -lvl 26 -y 108
load inst u_m3_mac|ring_5_reg[24:0] RTL_REG__BREG_76 work[24:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name ring_5_reg[24:0] -pg 1 -lvl 10 -y 818
load inst u_m4_kernel_storage|changed_i RTL_OR1 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_OR -attr @name changed_i -pg 1 -lvl 4 -y 1372
load inst u_m7_fifo|fifo_all_outputs_done_reg RTL_REG_SYNC__BREG_134 work -hier u_m7_fifo -attr @cell(#000000) RTL_REG_SYNC -attr @name fifo_all_outputs_done_reg -pg 1 -lvl 10 -y 218
load inst u_m2_window_generator|row_ge_i RTL_MUX4 work -hier u_m2_window_generator -attr @cell(#000000) RTL_MUX -attr @name row_ge_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I0 @attr V=B\"10\",\ S=1'b1 -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[1:0] -pg 1 -lvl 5 -y 602
load inst u_m3_mac|b_mux_i RTL_MUX13 work -hier u_m3_mac -attr @cell(#000000) RTL_MUX -attr @name b_mux_i -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=3'b001;3'b010 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=3'b011;3'b100 -pinBusAttr I2 @name I2[7:0] -pinBusAttr I2 @attr S=default -pinBusAttr O @name O[7:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 15 -y 398
load inst u_m3_mac|t_col_i RTL_MOD work -hier u_m3_mac -attr @cell(#000000) RTL_MOD -attr @name t_col_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I1 @name I1[1:0] -pinBusAttr O @name O[1:0] -pg 1 -lvl 1 -y 858
load inst u_m1_line_buffer|line_buf2_reg[31][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[31][7:0] -pg 1 -lvl 32 -y 318
load inst u_m5_output_handling|final_output_valid_reg RTL_REG_SYNC__BREG_81 work -hier u_m5_output_handling -attr @cell(#000000) RTL_REG_SYNC -attr @name final_output_valid_reg -pg 1 -lvl 3 -y 214
load inst u_m1_line_buffer|line_buf1_reg[6][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[6][7:0] -pg 1 -lvl 7 -y 108
load inst u_m3_mac|ring_52_i RTL_AND2 work -hier u_m3_mac -attr @cell(#000000) RTL_AND -attr @name ring_52_i -pg 1 -lvl 8 -y 628
load inst u_m1_line_buffer|line_buf1_reg[19][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[19][7:0] -pg 1 -lvl 20 -y 108
load inst u_m6_control_fsm|start_pass0_i RTL_OR1 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_OR -attr @name start_pass0_i -pg 1 -lvl 7 -y 868
load inst u_m3_mac|acc_a1_i RTL_OR1 work -hier u_m3_mac -attr @cell(#000000) RTL_OR -attr @name acc_a1_i -pinAttr I0 @attr n/c -pg 1 -lvl 16 -y 428
load inst u_m4_kernel_storage|rd_tap_i RTL_MUX8 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_MUX -attr @name rd_tap_i -pinAttr I0 @attr S=1'b1 -pinAttr I1 @attr S=default -pg 1 -lvl 7 -y 1402
load inst u_m3_mac|acc_a_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name acc_a_reg[17:0] -pg 1 -lvl 18 -y 568
load inst u_m1_line_buffer|line_buf1_reg[2][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[2][7:0] -pg 1 -lvl 3 -y 148
load inst u_m1_line_buffer|line_buf1_reg[20][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[20][7:0] -pg 1 -lvl 21 -y 108
load inst u_m6_control_fsm|drain_sr1_i RTL_NEQ1 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_NEQ -attr @name drain_sr1_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr V=B\"10\" -pg 1 -lvl 2 -y 528
load inst u_m3_mac|ring_1_reg[24:0] RTL_REG__BREG_76 work[24:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name ring_1_reg[24:0] -pg 1 -lvl 14 -y 778
load inst u_m1_line_buffer|line_buf2_reg[10][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[10][7:0] -pg 1 -lvl 11 -y 318
load inst u_m2_window_generator|u_col|lfsr_step2076_return0_i RTL_REDUCTION_XNOR0 work -hier u_m2_window_generator|u_col -attr @cell(#000000) RTL_REDUCTION_XNOR -attr @name lfsr_step2076_return0_i -pinBusAttr I0 @name I0[5:0] -pg 1 -lvl 2 -y 866
load inst u_m6_control_fsm|u_pixel_count lfsr_counter work:lfsr_counter:NOFILE -hier u_m6_control_fsm -autohide -attr @cell(#000000) lfsr_counter -attr @name u_pixel_count -pg 1 -lvl 3 -y 708
load inst u_m3_mac|u_dsp|b_r_reg[7:0] RTL_REG__BREG_76 work[7:0]sww -hier u_m3_mac|u_dsp -attr @cell(#000000) RTL_REG -attr @name b_r_reg[7:0] -pg 1 -lvl 1 -y 876
load inst u_m1_line_buffer|line_buf1_reg[5][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[5][7:0] -pg 1 -lvl 6 -y 108
load inst u_m1_line_buffer|line_buf2_reg[19][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[19][7:0] -pg 1 -lvl 20 -y 318
load inst u_m4_kernel_storage|wr_enable0_i RTL_AND2 work -hier u_m4_kernel_storage -attr @cell(#000000) RTL_AND -attr @name wr_enable0_i -pg 1 -lvl 2 -y 1252
load inst u_m1_line_buffer|line_buf2_reg[6][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[6][7:0] -pg 1 -lvl 7 -y 318
load inst u_m6_control_fsm|busy0_i RTL_NEQ1 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_NEQ -attr @name busy0_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I1 @name I1[1:0] -pg 1 -lvl 7 -y 528
load inst u_m3_mac|sum_c0_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name sum_c0_reg[17:0] -pg 1 -lvl 22 -y 238
load inst u_m1_line_buffer|line_buf2_reg[0][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[0][7:0] -pg 1 -lvl 1 -y 338
load inst u_m1_line_buffer|line_buf2_reg[11][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[11][7:0] -pg 1 -lvl 12 -y 318
load inst u_m3_mac|q_f0_reg[7:0] RTL_REG__BREG_76 work[7:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name q_f0_reg[7:0] -pg 1 -lvl 14 -y 298
load inst u_m6_control_fsm|state_next_i__0 RTL_MUX1 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_MUX -attr @name state_next_i__0 -pinAttr I0 @attr S=2'b00 -pinAttr I1 @attr S=2'b01 -pinAttr I2 @attr S=2'b10 -pinAttr I3 @attr S=2'b11 -pinBusAttr S @name S[1:0] -pg 1 -lvl 5 -y 468
load inst u_m3_mac|word_f_reg[24:0] RTL_REG__BREG_76 work[24:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name word_f_reg[24:0] -pg 1 -lvl 8 -y 768
load inst u_m3_mac|u_dsp|a_r_reg[24:0] RTL_REG__BREG_76 work[24:0]sww -hier u_m3_mac|u_dsp -attr @cell(#000000) RTL_REG -attr @name a_r_reg[24:0] -pg 1 -lvl 1 -y 746
load inst u_m1_line_buffer|line_buf1_reg[24][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[24][7:0] -pg 1 -lvl 25 -y 108
load inst u_m3_mac|acc_r0_i RTL_ADD8 work -hier u_m3_mac -attr @cell(#000000) RTL_ADD -attr @name acc_r0_i -pinBusAttr I0 @name I0[19:0] -pinBusAttr I1 @name I1[19:0] -pinBusAttr O @name O[19:0] -pg 1 -lvl 26 -y 368
load inst u_m1_line_buffer|line_buf2_reg[9][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[9][7:0] -pg 1 -lvl 10 -y 318
load inst u_m2_window_generator|u_col|at_count_i RTL_EQ0 work -hier u_m2_window_generator|u_col -attr @cell(#000000) RTL_EQ -attr @name at_count_i -pinBusAttr I0 @name I0[5:0] -pinBusAttr I1 @name I1[5:0] -pinBusAttr I1 @attr V=B\"011100\" -pg 1 -lvl 4 -y 856
load inst u_m3_mac|ring_4_reg[24:0] RTL_REG__BREG_76 work[24:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name ring_4_reg[24:0] -pg 1 -lvl 11 -y 808
load inst u_m3_mac|ring_2_reg[24:0] RTL_REG__BREG_76 work[24:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name ring_2_reg[24:0] -pg 1 -lvl 13 -y 788
load inst u_clk_gen|u_bufr_sys BUFR hdi_primitives -hier u_clk_gen -attr @cell(#000000) BUFR -attr @name u_bufr_sys -pg 1 -lvl 1 -y 158
load inst u_m1_line_buffer|line_buf2_reg[25][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[25][7:0] -pg 1 -lvl 26 -y 318
load inst u_m1_line_buffer|line_buf2_reg[28][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[28][7:0] -pg 1 -lvl 29 -y 318
load inst u_m7_fifo|u_release_count lfsr_counter__parameterized1 work:lfsr_counter__parameterized1:NOFILE -hier u_m7_fifo -autohide -attr @cell(#000000) lfsr_counter__parameterized1 -attr @name u_release_count -pg 1 -lvl 8 -y 318
load inst u_m1_line_buffer|line_buf2_reg[15][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[15][7:0] -pg 1 -lvl 16 -y 318
load inst u_m3_mac|t_row_i RTL_DIV work -hier u_m3_mac -attr @cell(#000000) RTL_DIV -attr @name t_row_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I1 @name I1[1:0] -pinBusAttr O @name O[1:0] -pg 1 -lvl 2 -y 798
load inst u_m3_mac|insph_s0_i RTL_ADD3 work -hier u_m3_mac -attr @cell(#000000) RTL_ADD -attr @name insph_s0_i -pinBusAttr I0 @name I0[2:0] -pinBusAttr O @name O[2:0] -pg 1 -lvl 4 -y 658
load inst u_m1_line_buffer|line_buf2_reg[12][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[12][7:0] -pg 1 -lvl 13 -y 318
load inst u_m6_control_fsm|done_i RTL_AND2 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_AND -attr @name done_i -pg 1 -lvl 8 -y 798
load inst u_m3_mac|ring_3_reg[24:0] RTL_REG__BREG_76 work[24:0]sww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name ring_3_reg[24:0] -pg 1 -lvl 12 -y 798
load inst u_m3_mac|s4_a_reg[17:0] RTL_REG__BREG_4 work[17:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name s4_a_reg[17:0] -pg 1 -lvl 21 -y 258
load inst u_m6_control_fsm|pixel_valid_in_i RTL_AND2 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_AND -attr @name pixel_valid_in_i -pg 1 -lvl 8 -y 898
load inst u_m1_line_buffer|line_buf1_reg[12][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[12][7:0] -pg 1 -lvl 13 -y 108
load inst u_m2_window_generator|col_ge_i__0 RTL_MUX4 work -hier u_m2_window_generator -attr @cell(#000000) RTL_MUX -attr @name col_ge_i__0 -pinBusAttr I0 @name I0[1:0] -pinBusAttr I0 @attr V=B\"01\",\ S=1'b1 -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[1:0] -pg 1 -lvl 6 -y 442
load inst u_m6_control_fsm|state_i RTL_MUX work -hier u_m6_control_fsm -attr @cell(#000000) RTL_MUX -attr @name state_i -pinBusAttr I0 @name I0[2:0] -pinBusAttr I0 @attr V=B\"001\",\ S=2'b00 -pinBusAttr I1 @name I1[2:0] -pinBusAttr I1 @attr V=B\"010\",\ S=2'b11 -pinBusAttr I2 @name I2[2:0] -pinBusAttr I2 @attr V=B\"100\",\ S=2'b01 -pinBusAttr O @name O[2:0] -pinBusAttr S @name S[1:0] -pg 1 -lvl 7 -y 648
load inst u_m1_line_buffer|line_buf2_reg[4][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf2_reg[4][7:0] -pg 1 -lvl 5 -y 338
load inst u_m1_line_buffer|line_buf1_reg[13][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[13][7:0] -pg 1 -lvl 14 -y 108
load inst u_m3_mac|q_s2_reg[7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m3_mac -attr @cell(#000000) RTL_REG -attr @name q_s2_reg[7:0] -pg 1 -lvl 13 -y 548
load inst u_m6_control_fsm|clear1_i RTL_NEQ1 work -hier u_m6_control_fsm -attr @cell(#000000) RTL_NEQ -attr @name clear1_i -pinBusAttr I0 @name I0[1:0] -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr V=B\"01\" -pg 1 -lvl 1 -y 738
load inst u_m1_line_buffer|line_buf1_reg[9][7:0] RTL_REG__BREG_4 work[7:0]ssww -hier u_m1_line_buffer -attr @cell(#000000) RTL_REG -attr @name line_buf1_reg[9][7:0] -pg 1 -lvl 10 -y 108
load net u_m1_line_buffer|line_buf1_reg[20]__0[3] -attr @name line_buf1_reg[20]__0[3] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] D[3]
load net u_m3_mac|sum_c2[11] -attr @rip(#000000) 11 -attr @name sum_c2[11] -pin u_m3_mac|acc_r0_i I1[11] -pin u_m3_mac|sum_c2_reg[17:0] Q[11]
load net u_m6_control_fsm|last_pixel -attr @name last_pixel -pin u_m6_control_fsm|state_next0_i I1 -pin u_m6_control_fsm|u_pixel_count at_count
netloc u_m6_control_fsm|last_pixel 1 3 1 N
load net u_m1_line_buffer|line_buf2_reg[22]__0[4] -attr @name line_buf2_reg[22]__0[4] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] D[4]
load net u_m3_mac|base_a[13] -attr @rip(#000000) O[13] -attr @name base_a[13] -pin u_m3_mac|acc_a0_i I0[13] -pin u_m3_mac|base_a_i O[13]
load net u_m3_mac|u_dsp|b[1] -attr @rip(#000000) b[1] -attr @name b[1] -hierPin u_m3_mac|u_dsp b[1] -pin u_m3_mac|u_dsp|b_r_reg[7:0] D[1]
load net u_m3_mac|u_dsp|p[20] -attr @rip(#000000) 20 -attr @name p[20] -hierPin u_m3_mac|u_dsp p[20] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[20]
load net u_m5_output_handling|out_val[9] -attr @name out_val[9] -pin u_m5_output_handling|final_output_reg[15:0] D[9] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[9]
load net u_m1_line_buffer|line_buf2_reg[21]__0[3] -attr @name line_buf2_reg[21]__0[3] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[10]__0[4] -attr @name line_buf2_reg[10]__0[4] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] D[4]
load net u_m3_mac|ring_0[23] -attr @rip(#000000) 23 -attr @name ring_0[23] -pin u_m3_mac|ring_0_reg[24:0] Q[23] -pin u_m3_mac|ring_50_i I1[23] -pin u_m3_mac|u_dsp a[23]
load net u_m7_fifo|fifo_pass_reset -attr @name fifo_pass_reset -hierPin u_m7_fifo fifo_pass_reset -pin u_m7_fifo|wr_ptr0_i I1
netloc u_m7_fifo|fifo_pass_reset 1 0 1 N
load net pixel_in[0] -attr @rip(#000000) pixel_in[0] -port pixel_in[0] -pin u_m1_line_buffer pixel_in[0]
load net u_m3_mac|s3_c[6] -attr @name s3_c[6] -pin u_m3_mac|s3_c_reg[17:0] Q[6] -pin u_m3_mac|s4_c_reg[17:0] D[6]
load net u_m7_fifo|final_output[4] -attr @rip(#000000) final_output[4] -attr @name final_output[4] -hierPin u_m7_fifo final_output[4] -pin u_m7_fifo|mem_reg WD2[4]
load net mac_result[2] -attr @rip(#000000) mac_result[2] -pin u_m3_mac mac_result[2] -pin u_m5_output_handling mac_result[2]
load net u_m1_line_buffer|line_buf2_reg[16]__0[4] -attr @name line_buf2_reg[16]__0[4] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] D[4]
load net u_m3_mac|ring_2[5] -attr @name ring_2[5] -pin u_m3_mac|ring_1_reg[24:0] D[5] -pin u_m3_mac|ring_2_reg[24:0] Q[5]
load net u_m3_mac|u_dsp|a[13] -attr @rip(#000000) a[13] -attr @name a[13] -hierPin u_m3_mac|u_dsp a[13] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[13]
load net u_m3_mac|u_dsp|p0[1] -attr @rip(#000000) O[1] -attr @name p0[1] -pin u_m3_mac|u_dsp|p0_i O[1] -pin u_m3_mac|u_dsp|p_reg[33:0] D[1]
load net u_m6_control_fsm|state[1] -attr @rip 1 -attr @name state[1] -pin u_m6_control_fsm|busy0_i I0[1] -pin u_m6_control_fsm|clear1_i I0[1] -pin u_m6_control_fsm|drain_sr1_i I0[1] -pin u_m6_control_fsm|state_i S[1] -pin u_m6_control_fsm|state_next_i S[1] -pin u_m6_control_fsm|state_next_i__0 S[1] -pin u_m6_control_fsm|state_reg[1:0] Q[1]
load net u_m7_fifo|rd_ptr[3] -attr @rip(#000000) 3 -attr @name rd_ptr[3] -pin u_m7_fifo|mem_reg RA1[3] -pin u_m7_fifo|pop0_i__0 I1[3] -pin u_m7_fifo|rd_ptr0_i I0[3] -pin u_m7_fifo|rd_ptr_reg[5:0] Q[3]
load net u_m1_line_buffer|line_buf2_reg[17]__0[1] -attr @name line_buf2_reg[17]__0[1] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] D[1]
load net u_m4_kernel_storage|tap_data[5] -attr @rip(#000000) 5 -attr @name tap_data[5] -hierPin u_m4_kernel_storage tap_data[5] -pin u_m4_kernel_storage|tap_data_reg[7:0] Q[5]
load net u_m1_line_buffer|line_buf2_reg[8]__0[1] -attr @name line_buf2_reg[8]__0[1] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] D[1]
load net u_m3_mac|s4_a[15] -attr @name s4_a[15] -pin u_m3_mac|s4_a_reg[17:0] Q[15] -pin u_m3_mac|sum_c0_reg[17:0] D[15]
load net u_m5_output_handling|mac_result[16] -attr @rip(#000000) mac_result[16] -attr @name mac_result[16] -hierPin u_m5_output_handling mac_result[16] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[12]
load net u_m2_window_generator|col_ge0 -attr @name col_ge0 -pin u_m2_window_generator|col_ge0_i O -pin u_m2_window_generator|col_ge_reg[1:0] RST -pin u_m2_window_generator|u_col clear
netloc u_m2_window_generator|col_ge0 1 2 5 1930 966 3370J 832 NJ 832 NJ 832 4340
load net u_m1_line_buffer|line_buf2_reg[12]__0[3] -attr @name line_buf2_reg[12]__0[3] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[25]__0[3] -attr @name line_buf2_reg[25]__0[3] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] D[3]
load net u_m3_mac|u_dsp|m_r0[31] -attr @rip(#000000) O[31] -attr @name m_r0[31] -pin u_m3_mac|u_dsp|m_r0_i O[31] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[31]
load net u_m3_mac|u_dsp|p[0] -attr @rip(#000000) 0 -attr @name p[0] -hierPin u_m3_mac|u_dsp p[0] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[0]
load net u_m6_control_fsm|busy0 -attr @name busy0 -pin u_m6_control_fsm|busy0_i__0 O -pin u_m6_control_fsm|busy_i I1
netloc u_m6_control_fsm|busy0 1 7 1 NJ
load net u_m1_line_buffer|pixel_in[1] -attr @rip(#000000) pixel_in[1] -attr @name pixel_in[1] -hierPin u_m1_line_buffer curr_row_pixel[1] -hierPin u_m1_line_buffer pixel_in[1] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[4]__0[0] -attr @name line_buf1_reg[4]__0[0] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] D[0]
load net u_m3_mac|u_dsp|m_r[9] -attr @rip(#000000) 9 -attr @name m_r[9] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[9] -pin u_m3_mac|u_dsp|p0_i I0[9]
load net u_m7_fifo|<const0> -ground -attr @name <const0> -pin u_m7_fifo|fifo_all_outputs_done_reg CE -pin u_m7_fifo|fifo_all_outputs_done_reg D -pin u_m7_fifo|mem_i I0 -pin u_m7_fifo|output_pixel_i I0 -pin u_m7_fifo|release_start0_i__0 I1[2] -pin u_m7_fifo|release_start0_i__0 I1[1]
load net u_m3_mac|q_f2[5] -attr @rip(#000000) 5 -attr @name q_f2[5] -pin u_m3_mac|b_mux_i I2[5] -pin u_m3_mac|q_f2_reg[7:0] Q[5]
load net u_m3_mac|q_f1[7] -attr @rip(#000000) 7 -attr @name q_f1[7] -pin u_m3_mac|b_mux_i I1[7] -pin u_m3_mac|q_f1_reg[7:0] Q[7]
load net u_m3_mac|word_f[20] -attr @rip(#000000) 20 -attr @name word_f[20] -pin u_m3_mac|ring_50_i I0[20] -pin u_m3_mac|word_f_reg[24:0] Q[20]
load net u_m3_mac|u_dsp|a[1] -attr @rip(#000000) a[1] -attr @name a[1] -hierPin u_m3_mac|u_dsp a[1] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[1]
load net u_m3_mac|u_dsp|a_r[12] -attr @rip(#000000) 12 -attr @name a_r[12] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[12] -pin u_m3_mac|u_dsp|m_r0_i I0[12]
load net u_m3_mac|s4_c[5] -attr @name s4_c[5] -pin u_m3_mac|s4_c_reg[17:0] Q[5] -pin u_m3_mac|sum_c2_reg[17:0] D[5]
load net u_m3_mac|acc_c0_i_n_0 -attr @rip(#000000) O[17] -attr @name acc_c0_i_n_0 -pin u_m3_mac|acc_c0_i O[17] -pin u_m3_mac|acc_c_reg[17:0] D[17]
load net u_m3_mac|ring_50[23] -attr @rip(#000000) O[23] -attr @name ring_50[23] -pin u_m3_mac|ring_50_i O[23] -pin u_m3_mac|ring_5_reg[24:0] D[23]
load net u_m3_mac|sum_c2[10] -attr @rip(#000000) 10 -attr @name sum_c2[10] -pin u_m3_mac|acc_r0_i I1[10] -pin u_m3_mac|sum_c2_reg[17:0] Q[10]
load net output_pixel[9] -attr @rip(#000000) output_pixel[9] -port output_pixel[9] -pin u_m7_fifo output_pixel[9]
load net u_m1_line_buffer|line_buf2_reg[22]__0[3] -attr @name line_buf2_reg[22]__0[3] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] D[3]
load net u_m3_mac|acc_c0_i_n_1 -attr @rip(#000000) O[16] -attr @name acc_c0_i_n_1 -pin u_m3_mac|acc_c0_i O[16] -pin u_m3_mac|acc_c_reg[17:0] D[16]
load net u_m3_mac|base_a[12] -attr @rip(#000000) O[12] -attr @name base_a[12] -pin u_m3_mac|acc_a0_i I0[12] -pin u_m3_mac|base_a_i O[12]
load net u_m3_mac|col_row0[2] -attr @rip(#000000) col_row0[2] -attr @name col_row0[2] -hierPin u_m3_mac col_row0[2] -pin u_m3_mac|q_s0_reg[7:0] D[2]
load net u_m3_mac|u_dsp|b[0] -attr @rip(#000000) b[0] -attr @name b[0] -hierPin u_m3_mac|u_dsp b[0] -pin u_m3_mac|u_dsp|b_r_reg[7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[20]__0[4] -attr @name line_buf1_reg[20]__0[4] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] D[4]
load net u_m3_mac|acc_c0_i_n_2 -attr @rip(#000000) O[15] -attr @name acc_c0_i_n_2 -pin u_m3_mac|acc_c0_i O[15] -pin u_m3_mac|acc_c_reg[17:0] D[15]
load net u_m1_line_buffer|line_buf2_reg[16]__0[1] -attr @name line_buf2_reg[16]__0[1] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] D[1]
load net u_m3_mac|mac_result[19] -attr @rip(#000000) 19 -attr @name mac_result[19] -hierPin u_m3_mac mac_result[19] -pin u_m3_mac|acc_r_reg[19:0] Q[19]
load net u_m3_mac|q_f0[7] -attr @rip(#000000) 7 -attr @name q_f0[7] -pin u_m3_mac|b_mux_i I0[7] -pin u_m3_mac|q_f0_reg[7:0] Q[7]
load net u_m3_mac|ring_0[22] -attr @rip(#000000) 22 -attr @name ring_0[22] -pin u_m3_mac|ring_0_reg[24:0] Q[22] -pin u_m3_mac|ring_50_i I1[22] -pin u_m3_mac|u_dsp a[22]
load net u_m3_mac|u_dsp|a[10] -attr @rip(#000000) a[10] -attr @name a[10] -hierPin u_m3_mac|u_dsp a[10] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[10]
load net u_m3_mac|acc_c0_i_n_3 -attr @rip(#000000) O[14] -attr @name acc_c0_i_n_3 -pin u_m3_mac|acc_c0_i O[14] -pin u_m3_mac|acc_c_reg[17:0] D[14]
load net u_m3_mac|acc_c0_i_n_4 -attr @rip(#000000) O[13] -attr @name acc_c0_i_n_4 -pin u_m3_mac|acc_c0_i O[13] -pin u_m3_mac|acc_c_reg[17:0] D[13]
load net u_m3_mac|ring_2[4] -attr @name ring_2[4] -pin u_m3_mac|ring_1_reg[24:0] D[4] -pin u_m3_mac|ring_2_reg[24:0] Q[4]
load net u_m3_mac|acc_c0_i_n_5 -attr @rip(#000000) O[12] -attr @name acc_c0_i_n_5 -pin u_m3_mac|acc_c0_i O[12] -pin u_m3_mac|acc_c_reg[17:0] D[12]
load net pixel_in[1] -attr @rip(#000000) pixel_in[1] -port pixel_in[1] -pin u_m1_line_buffer pixel_in[1]
load net u_m3_mac|s4_c[15] -attr @name s4_c[15] -pin u_m3_mac|s4_c_reg[17:0] Q[15] -pin u_m3_mac|sum_c2_reg[17:0] D[15]
load net u_m7_fifo|final_output[5] -attr @rip(#000000) final_output[5] -attr @name final_output[5] -hierPin u_m7_fifo final_output[5] -pin u_m7_fifo|mem_reg WD2[5]
load net u_m1_line_buffer|line_buf2_reg[5]__0[0] -attr @name line_buf2_reg[5]__0[0] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] D[0]
load net u_m3_mac|acc_c0_i_n_6 -attr @rip(#000000) O[11] -attr @name acc_c0_i_n_6 -pin u_m3_mac|acc_c0_i O[11] -pin u_m3_mac|acc_c_reg[17:0] D[11]
load net u_m1_line_buffer|line_buf2_reg[21]__0[6] -attr @name line_buf2_reg[21]__0[6] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] D[6]
load net u_m3_mac|acc_c0_i_n_7 -attr @rip(#000000) O[10] -attr @name acc_c0_i_n_7 -pin u_m3_mac|acc_c0_i O[10] -pin u_m3_mac|acc_c_reg[17:0] D[10]
load net u_m1_line_buffer|line_buf1_reg[27]__0[0] -attr @name line_buf1_reg[27]__0[0] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] D[0]
load net u_m3_mac|acc_c0_i_n_8 -attr @rip(#000000) O[9] -attr @name acc_c0_i_n_8 -pin u_m3_mac|acc_c0_i O[9] -pin u_m3_mac|acc_c_reg[17:0] D[9]
load net u_m3_mac|u_dsp|a_r[7] -attr @rip(#000000) 7 -attr @name a_r[7] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[7] -pin u_m3_mac|u_dsp|m_r0_i I0[7]
load net u_m7_fifo|rd_ptr[4] -attr @rip(#000000) 4 -attr @name rd_ptr[4] -pin u_m7_fifo|mem_reg RA1[4] -pin u_m7_fifo|pop0_i__0 I1[4] -pin u_m7_fifo|rd_ptr0_i I0[4] -pin u_m7_fifo|rd_ptr_reg[5:0] Q[4]
load net u_m1_line_buffer|line_buf2_reg[25]__0[2] -attr @name line_buf2_reg[25]__0[2] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] D[2]
load net u_m3_mac|acc_c0_i_n_9 -attr @rip(#000000) O[8] -attr @name acc_c0_i_n_9 -pin u_m3_mac|acc_c0_i O[8] -pin u_m3_mac|acc_c_reg[17:0] D[8]
load net u_m1_line_buffer|line_buf1_reg[19]__0[4] -attr @name line_buf1_reg[19]__0[4] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] D[4]
load net u_m4_kernel_storage|tap_data[6] -attr @rip(#000000) 6 -attr @name tap_data[6] -hierPin u_m4_kernel_storage tap_data[6] -pin u_m4_kernel_storage|tap_data_reg[7:0] Q[6]
load net u_m3_mac|s4_a[16] -attr @name s4_a[16] -pin u_m3_mac|s4_a_reg[17:0] Q[16] -pin u_m3_mac|sum_c0_reg[17:0] D[16]
load net u_m5_output_handling|valid_stage1 -attr @name valid_stage1 -pin u_m5_output_handling|final_output_reg[15:0] CE -pin u_m5_output_handling|final_output_valid_reg D -pin u_m5_output_handling|valid_stage1_reg Q
netloc u_m5_output_handling|valid_stage1 1 2 1 14150
load net u_m3_mac|acc_a[8] -attr @rip(#000000) 8 -attr @name acc_a[8] -pin u_m3_mac|acc_a_reg[17:0] Q[8] -pin u_m3_mac|base_a_i I1[8] -pin u_m3_mac|frame_a_reg[17:0] D[8]
load net u_m1_line_buffer|line_buf2_reg[29]__0[7] -attr @name line_buf2_reg[29]__0[7] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] D[7]
load net u_m1_line_buffer|line_buf2_reg[12]__0[4] -attr @name line_buf2_reg[12]__0[4] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] D[4]
load net u_m3_mac|t_col[0] -attr @rip(#000000) O[0] -attr @name t_col[0] -pin u_m3_mac|hi_src_i S[0] -pin u_m3_mac|ld_s1_i I0[0] -pin u_m3_mac|prev_c01_i I0[0] -pin u_m3_mac|slot0_i I0[0] -pin u_m3_mac|t_col_i O[0]
load net u_m3_mac|u_dsp|m_r0[32] -attr @rip(#000000) O[32] -attr @name m_r0[32] -pin u_m3_mac|u_dsp|m_r0_i O[32] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[32]
load net u_m3_mac|u_dsp|p[1] -attr @rip(#000000) 1 -attr @name p[1] -hierPin u_m3_mac|u_dsp p[1] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[1]
load net u_m3_mac|u_dsp|a[22] -attr @rip(#000000) a[22] -attr @name a[22] -hierPin u_m3_mac|u_dsp a[22] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[22]
load net u_m1_line_buffer|line_buf1_reg[22]__0[0] -attr @name line_buf1_reg[22]__0[0] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[28]__0[1] -attr @name line_buf2_reg[28]__0[1] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] D[1]
load net u_m3_mac|q_f1[6] -attr @rip(#000000) 6 -attr @name q_f1[6] -pin u_m3_mac|b_mux_i I1[6] -pin u_m3_mac|q_f1_reg[7:0] Q[6]
load net u_m3_mac|u_dsp|a[0] -attr @rip(#000000) a[0] -attr @name a[0] -hierPin u_m3_mac|u_dsp a[0] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[0]
load net u_m3_mac|u_dsp|a_r[11] -attr @rip(#000000) 11 -attr @name a_r[11] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[11] -pin u_m3_mac|u_dsp|m_r0_i I0[11]
load net u_m6_control_fsm|<const1> -power -attr @name <const1> -pin u_m6_control_fsm|clear1_i I1[0] -pin u_m6_control_fsm|drain_sr1_i I1[1] -pin u_m6_control_fsm|drain_sr_reg[6:0] CE[6] -pin u_m6_control_fsm|drain_sr_reg[6:0] CE[5] -pin u_m6_control_fsm|drain_sr_reg[6:0] CE[4] -pin u_m6_control_fsm|drain_sr_reg[6:0] CE[3] -pin u_m6_control_fsm|drain_sr_reg[6:0] CE[2] -pin u_m6_control_fsm|drain_sr_reg[6:0] CE[1] -pin u_m6_control_fsm|drain_sr_reg[6:0] SET[0] -pin u_m6_control_fsm|state_i I0[0] -pin u_m6_control_fsm|state_i I1[1] -pin u_m6_control_fsm|state_i I2[2] -pin u_m6_control_fsm|state_next_i I0[0] -pin u_m6_control_fsm|state_next_i I1[1] -pin u_m6_control_fsm|state_next_i I3[0]
load net u_m1_line_buffer|pixel_in[4] -attr @rip(#000000) pixel_in[4] -attr @name pixel_in[4] -hierPin u_m1_line_buffer curr_row_pixel[4] -hierPin u_m1_line_buffer pixel_in[4] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] D[4]
load net pixel_in_valid -port pixel_in_valid -pin u_m6_control_fsm pixel_in_valid
netloc pixel_in_valid 1 0 8 NJ 410 290J 568 700J 410 1260J 1052 4960J 1328 13460J 594 14630J 888 18160J
load net u_m5_output_handling|final_output[12] -attr @rip(#000000) 12 -attr @name final_output[12] -hierPin u_m5_output_handling final_output[12] -pin u_m5_output_handling|final_output_reg[15:0] Q[12]
load net u_m7_fifo|final_output_valid -attr @name final_output_valid -hierPin u_m7_fifo final_output_valid -pin u_m7_fifo|RTL_AND I0 -pin u_m7_fifo|release_start0_i I1 -pin u_m7_fifo|wr_ptr_reg[5:0] CE
netloc u_m7_fifo|final_output_valid 1 0 8 NJ 708 NJ 708 15420 548 15670 468 NJ 468 NJ 468 NJ 468 N
load net u_m3_mac|word_f[21] -attr @rip(#000000) 21 -attr @name word_f[21] -pin u_m3_mac|ring_50_i I0[21] -pin u_m3_mac|word_f_reg[24:0] Q[21]
load net u_m1_line_buffer|line_buf2_reg[22]__0[2] -attr @name line_buf2_reg[22]__0[2] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[4]__0[5] -attr @name line_buf1_reg[4]__0[5] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] D[5]
load net u_m3_mac|base_a[11] -attr @rip(#000000) O[11] -attr @name base_a[11] -pin u_m3_mac|acc_a0_i I0[11] -pin u_m3_mac|base_a_i O[11]
load net u_m2_window_generator|p_1_in -attr @name p_1_in -pin u_m2_window_generator|col_ge_reg[1:0] Q[1] -pin u_m2_window_generator|window_valid_i I1
load net u_m3_mac|ring_0[21] -attr @rip(#000000) 21 -attr @name ring_0[21] -pin u_m3_mac|ring_0_reg[24:0] Q[21] -pin u_m3_mac|ring_50_i I1[21] -pin u_m3_mac|u_dsp a[21]
load net u_m3_mac|ring_50[24] -attr @rip(#000000) O[24] -attr @name ring_50[24] -pin u_m3_mac|ring_50_i O[24] -pin u_m3_mac|ring_5_reg[24:0] D[24]
load net final_output[4] -attr @rip(#000000) final_output[4] -pin u_m5_output_handling final_output[4] -pin u_m7_fifo final_output[4]
load net u_m3_mac|col_row0[3] -attr @rip(#000000) col_row0[3] -attr @name col_row0[3] -hierPin u_m3_mac col_row0[3] -pin u_m3_mac|q_s0_reg[7:0] D[3]
load net u_m6_control_fsm|drain_sr_reg_n_1 -attr @name drain_sr_reg_n_1 -pin u_m6_control_fsm|drain_sr_reg[6:0] D[6] -pin u_m6_control_fsm|drain_sr_reg[6:0] Q[5]
load net u_m1_line_buffer|line_buf2_reg[16]__0[2] -attr @name line_buf2_reg[16]__0[2] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] D[2]
load net u_m3_mac|u_dsp|a[11] -attr @rip(#000000) a[11] -attr @name a[11] -hierPin u_m3_mac|u_dsp a[11] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[11]
load net u_m6_control_fsm|drain_sr_reg_n_2 -attr @name drain_sr_reg_n_2 -pin u_m6_control_fsm|drain_sr_reg[6:0] D[5] -pin u_m6_control_fsm|drain_sr_reg[6:0] Q[4]
load net u_m3_mac|u_dsp|b[3] -attr @rip(#000000) b[3] -attr @name b[3] -hierPin u_m3_mac|u_dsp b[3] -pin u_m3_mac|u_dsp|b_r_reg[7:0] D[3]
load net u_m6_control_fsm|drain_sr_reg_n_3 -attr @name drain_sr_reg_n_3 -pin u_m6_control_fsm|drain_sr_reg[6:0] D[4] -pin u_m6_control_fsm|drain_sr_reg[6:0] Q[3]
load net u_m1_line_buffer|line_buf2_reg[21]__0[5] -attr @name line_buf2_reg[21]__0[5] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] D[5]
load net u_m7_fifo|wr_ptr[0] -attr @rip(#000000) 0 -attr @name wr_ptr[0] -pin u_m7_fifo|mem_reg WA2[0] -pin u_m7_fifo|pop0_i__0 I0[0] -pin u_m7_fifo|release_start0_i__0 I0[0] -pin u_m7_fifo|wr_ptr0_i__0 I0[0] -pin u_m7_fifo|wr_ptr_reg[5:0] Q[0]
load net u_m6_control_fsm|drain_sr_reg_n_4 -attr @name drain_sr_reg_n_4 -pin u_m6_control_fsm|drain_sr_reg[6:0] D[3] -pin u_m6_control_fsm|drain_sr_reg[6:0] Q[2]
load net pixel_in[2] -attr @rip(#000000) pixel_in[2] -port pixel_in[2] -pin u_m1_line_buffer pixel_in[2]
load net u_m3_mac|acc_c0 -attr @name acc_c0 -pin u_m3_mac|acc_c0_i__0 O -pin u_m3_mac|acc_c_reg[17:0] CE
netloc u_m3_mac|acc_c0 1 20 1 11610
load net u_m3_mac|s4_c[16] -attr @name s4_c[16] -pin u_m3_mac|s4_c_reg[17:0] Q[16] -pin u_m3_mac|sum_c2_reg[17:0] D[16]
load net u_m7_fifo|final_output[6] -attr @rip(#000000) final_output[6] -attr @name final_output[6] -hierPin u_m7_fifo final_output[6] -pin u_m7_fifo|mem_reg WD2[6]
load net u_m6_control_fsm|drain_sr_reg_n_5 -attr @name drain_sr_reg_n_5 -pin u_m6_control_fsm|drain_sr_reg[6:0] D[2] -pin u_m6_control_fsm|drain_sr_reg[6:0] Q[1]
load net u_m1_line_buffer|line_buf2_reg[20]__0[3] -attr @name line_buf2_reg[20]__0[3] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] D[3]
load net u_m3_mac|acc_c1 -attr @name acc_c1 -pin u_m3_mac|acc_c0_i__0 I0 -pin u_m3_mac|acc_c1_i O
netloc u_m3_mac|acc_c1 1 19 1 11330J
load net u_m3_mac|u_dsp|a_r[6] -attr @rip(#000000) 6 -attr @name a_r[6] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[6] -pin u_m3_mac|u_dsp|m_r0_i I0[6]
load net u_m6_control_fsm|drain_sr_reg_n_6 -attr @name drain_sr_reg_n_6 -pin u_m6_control_fsm|drain_sr_reg[6:0] D[1] -pin u_m6_control_fsm|drain_sr_reg[6:0] Q[0]
load net u_m1_line_buffer|line_buf2_reg[25]__0[1] -attr @name line_buf2_reg[25]__0[1] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[27]__0[1] -attr @name line_buf1_reg[27]__0[1] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[19]__0[3] -attr @name line_buf1_reg[19]__0[3] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[4]__0[0] -attr @name line_buf2_reg[4]__0[0] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] D[0]
load net u_m7_fifo|rd_ptr[5] -attr @rip(#000000) 5 -attr @name rd_ptr[5] -pin u_m7_fifo|mem_reg RA1[5] -pin u_m7_fifo|pop0_i__0 I1[5] -pin u_m7_fifo|rd_ptr0_i I0[5] -pin u_m7_fifo|rd_ptr_reg[5:0] Q[5]
load net u_m2_window_generator|rst -attr @name rst -hierPin u_m2_window_generator rst -pin u_m2_window_generator|pass_clear_i I0
netloc u_m2_window_generator|rst 1 0 1 N
load net u_m4_kernel_storage|tap_data[7] -attr @rip(#000000) 7 -attr @name tap_data[7] -hierPin u_m4_kernel_storage tap_data[7] -pin u_m4_kernel_storage|tap_data_reg[7:0] Q[7]
load net u_m3_mac|s4_a[17] -attr @name s4_a[17] -pin u_m3_mac|s4_a_reg[17:0] Q[17] -pin u_m3_mac|sum_c0_reg[17:0] D[17]
load net u_m3_mac|u_dsp|a[21] -attr @rip(#000000) a[21] -attr @name a[21] -hierPin u_m3_mac|u_dsp a[21] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[21]
load net u_m3_mac|acc_a[9] -attr @rip(#000000) 9 -attr @name acc_a[9] -pin u_m3_mac|acc_a_reg[17:0] Q[9] -pin u_m3_mac|base_a_i I1[9] -pin u_m3_mac|frame_a_reg[17:0] D[9]
load net u_m1_line_buffer|line_buf2_reg[12]__0[5] -attr @name line_buf2_reg[12]__0[5] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] D[5]
load net u_m1_line_buffer|line_buf2_reg[28]__0[0] -attr @name line_buf2_reg[28]__0[0] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] D[0]
load net u_m3_mac|t_col[1] -attr @rip(#000000) O[1] -attr @name t_col[1] -pin u_m3_mac|hi_src_i S[1] -pin u_m3_mac|ld_s1_i I0[1] -pin u_m3_mac|prev_c01_i I0[1] -pin u_m3_mac|slot0_i I0[1] -pin u_m3_mac|t_col_i O[1]
load net u_m1_line_buffer|pixel_in[3] -attr @rip(#000000) pixel_in[3] -attr @name pixel_in[3] -hierPin u_m1_line_buffer curr_row_pixel[3] -hierPin u_m1_line_buffer pixel_in[3] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[19]__0[5] -attr @name line_buf1_reg[19]__0[5] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[22]__0[1] -attr @name line_buf1_reg[22]__0[1] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] D[1]
load net u_m3_mac|acc_r0[1] -attr @rip(#000000) O[1] -attr @name acc_r0[1] -pin u_m3_mac|acc_r0_i O[1] -pin u_m3_mac|acc_r_reg[19:0] D[1]
load net output_pixel[7] -attr @rip(#000000) output_pixel[7] -port output_pixel[7] -pin u_m7_fifo output_pixel[7]
load net u_m3_mac|acc_b[5] -attr @rip(#000000) 5 -attr @name acc_b[5] -pin u_m3_mac|acc_b_reg[17:0] Q[5] -pin u_m3_mac|base_b_i I1[5] -pin u_m3_mac|frame_b_reg[17:0] D[5]
load net u_m3_mac|base_a[10] -attr @rip(#000000) O[10] -attr @name base_a[10] -pin u_m3_mac|acc_a0_i I0[10] -pin u_m3_mac|base_a_i O[10]
load net u_m5_output_handling|final_output[13] -attr @rip(#000000) 13 -attr @name final_output[13] -hierPin u_m5_output_handling final_output[13] -pin u_m5_output_handling|final_output_reg[15:0] Q[13]
load net kernel_wr_addr[1] -attr @rip(#000000) kernel_wr_addr[1] -port kernel_wr_addr[1] -pin u_m4_kernel_storage kernel_wr_addr[1]
load net u_m1_line_buffer|line_buf2_reg[21]__0[0] -attr @name line_buf2_reg[21]__0[0] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] D[0]
load net u_m3_mac|ring_0[20] -attr @rip(#000000) 20 -attr @name ring_0[20] -pin u_m3_mac|ring_0_reg[24:0] Q[20] -pin u_m3_mac|ring_50_i I1[20] -pin u_m3_mac|u_dsp a[20]
load net u_m3_mac|u_dsp|a_r[14] -attr @rip(#000000) 14 -attr @name a_r[14] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[14] -pin u_m3_mac|u_dsp|m_r0_i I0[14]
load net u_m1_line_buffer|line_buf1_reg[4]__0[6] -attr @name line_buf1_reg[4]__0[6] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] D[6]
load net final_output[3] -attr @rip(#000000) final_output[3] -pin u_m5_output_handling final_output[3] -pin u_m7_fifo final_output[3]
load net u_m3_mac|ring_1[8] -attr @name ring_1[8] -pin u_m3_mac|ring_0_reg[24:0] D[8] -pin u_m3_mac|ring_1_reg[24:0] Q[8]
load net u_m4_kernel_storage|p_0_in__0 -attr @name p_0_in__0 -pin u_m4_kernel_storage|streaming_i I1 -pin u_m4_kernel_storage|sweep_left_reg[9:0] Q[0]
load net u_m3_mac|u_dsp|p[19] -attr @rip(#000000) 19 -attr @name p[19] -hierPin u_m3_mac|u_dsp p[19] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[19]
load net u_m3_mac|col_row0[4] -attr @rip(#000000) col_row0[4] -attr @name col_row0[4] -hierPin u_m3_mac col_row0[4] -pin u_m3_mac|q_s0_reg[7:0] D[4]
load net u_m3_mac|s4_c[13] -attr @name s4_c[13] -pin u_m3_mac|s4_c_reg[17:0] Q[13] -pin u_m3_mac|sum_c2_reg[17:0] D[13]
load net u_m3_mac|u_dsp|b[2] -attr @rip(#000000) b[2] -attr @name b[2] -hierPin u_m3_mac|u_dsp b[2] -pin u_m3_mac|u_dsp|b_r_reg[7:0] D[2]
load net u_m7_fifo|release_start0_i__0_n_0 -attr @name release_start0_i__0_n_0 -pin u_m7_fifo|release_start0_i__0 O -pin u_m7_fifo|release_start_i I1
netloc u_m7_fifo|release_start0_i__0_n_0 1 4 1 NJ
load net u_m3_mac|acc_b0[14] -attr @rip(#000000) O[14] -attr @name acc_b0[14] -pin u_m3_mac|acc_b0_i O[14] -pin u_m3_mac|acc_b_reg[17:0] D[14]
load net u_m1_line_buffer|line_buf2_reg[20]__0[2] -attr @name line_buf2_reg[20]__0[2] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[25]__0[6] -attr @name line_buf1_reg[25]__0[6] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] D[6]
load net u_m3_mac|u_dsp|a_r[5] -attr @rip(#000000) 5 -attr @name a_r[5] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[5] -pin u_m3_mac|u_dsp|m_r0_i I0[5]
load net u_m3_mac|u_dsp|m_r[4] -attr @rip(#000000) 4 -attr @name m_r[4] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[4] -pin u_m3_mac|u_dsp|p0_i I0[4]
load net u_m7_fifo|wr_ptr[1] -attr @rip(#000000) 1 -attr @name wr_ptr[1] -pin u_m7_fifo|mem_reg WA2[1] -pin u_m7_fifo|pop0_i__0 I0[1] -pin u_m7_fifo|release_start0_i__0 I0[1] -pin u_m7_fifo|wr_ptr0_i__0 I0[1] -pin u_m7_fifo|wr_ptr_reg[5:0] Q[1]
load net pixel_in[3] -attr @rip(#000000) pixel_in[3] -port pixel_in[3] -pin u_m1_line_buffer pixel_in[3]
load net u_m1_line_buffer|line_buf2_reg[25]__0[0] -attr @name line_buf2_reg[25]__0[0] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[19]__0[2] -attr @name line_buf1_reg[19]__0[2] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] D[2]
load net u_m7_fifo|final_output[7] -attr @rip(#000000) final_output[7] -attr @name final_output[7] -hierPin u_m7_fifo final_output[7] -pin u_m7_fifo|mem_reg WD2[7]
load net u_m3_mac|ph[0] -attr @rip(#000000) 0 -attr @name ph[0] -pin u_m3_mac|b_mux_i S[0] -pin u_m3_mac|base_a_i S[0] -pin u_m3_mac|base_b_i S[0] -pin u_m3_mac|base_c_i S[0] -pin u_m3_mac|frame_a_i A[0] -pin u_m3_mac|frame_b_i A[0] -pin u_m3_mac|frame_c_i A[0] -pin u_m3_mac|ph0_i S[0] -pin u_m3_mac|ph1_i I0[0] -pin u_m3_mac|ph_i S[0] -pin u_m3_mac|ph_reg[2:0] Q[0] -pin u_m3_mac|ring_53_i I0[0]
load net u_m3_mac|acc_a[6] -attr @rip(#000000) 6 -attr @name acc_a[6] -pin u_m3_mac|acc_a_reg[17:0] Q[6] -pin u_m3_mac|base_a_i I1[6] -pin u_m3_mac|frame_a_reg[17:0] D[6]
load net u_m1_line_buffer|line_buf1_reg[27]__0[2] -attr @name line_buf1_reg[27]__0[2] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] D[2]
load net u_m3_mac|u_dsp|p0[4] -attr @rip(#000000) O[4] -attr @name p0[4] -pin u_m3_mac|u_dsp|p0_i O[4] -pin u_m3_mac|u_dsp|p_reg[33:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[4]__0[1] -attr @name line_buf2_reg[4]__0[1] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] D[1]
load net u_m7_fifo|final_output[10] -attr @rip(#000000) final_output[10] -attr @name final_output[10] -hierPin u_m7_fifo final_output[10] -pin u_m7_fifo|mem_reg WD2[10]
load net u_m1_line_buffer|line_buf2_reg[8]__0[4] -attr @name line_buf2_reg[8]__0[4] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] D[4]
load net u_m5_output_handling|final_output[10] -attr @rip(#000000) 10 -attr @name final_output[10] -hierPin u_m5_output_handling final_output[10] -pin u_m5_output_handling|final_output_reg[15:0] Q[10]
load net u_m4_kernel_storage|wr_enable0_i__0_n_0 -attr @name wr_enable0_i__0_n_0 -pin u_m4_kernel_storage|wr_enable0_i__0 O -pin u_m4_kernel_storage|wr_enable_i I1
netloc u_m4_kernel_storage|wr_enable0_i__0_n_0 1 2 1 NJ
load net u_m1_line_buffer|line_buf2_reg[12]__0[6] -attr @name line_buf2_reg[12]__0[6] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] D[6]
load net u_m1_line_buffer|line_buf1_reg[19]__0[6] -attr @name line_buf1_reg[19]__0[6] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] D[6]
load net u_m1_line_buffer|line_buf1_reg[17]__0[7] -attr @name line_buf1_reg[17]__0[7] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[4]__0[3] -attr @name line_buf1_reg[4]__0[3] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[6]__0[0] -attr @name line_buf1_reg[6]__0[0] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[22]__0[2] -attr @name line_buf1_reg[22]__0[2] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] D[2]
load net kernel_wr_addr[0] -attr @rip(#000000) kernel_wr_addr[0] -port kernel_wr_addr[0] -pin u_m4_kernel_storage kernel_wr_addr[0]
load net u_m3_mac|acc_r0[2] -attr @rip(#000000) O[2] -attr @name acc_r0[2] -pin u_m3_mac|acc_r0_i O[2] -pin u_m3_mac|acc_r_reg[19:0] D[2]
load net u_m1_line_buffer|line_buf2_reg[28]__0[3] -attr @name line_buf2_reg[28]__0[3] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] D[3]
load net u_m3_mac|window_valid -attr @name window_valid -hierPin u_m3_mac window_valid -pin u_m3_mac|wv_reg[6:1] D[1]
netloc u_m3_mac|window_valid 1 0 27 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 9100J 1206 10370J 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 12970
load net u_m3_mac|u_dsp|a_r[13] -attr @rip(#000000) 13 -attr @name a_r[13] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[13] -pin u_m3_mac|u_dsp|m_r0_i I0[13]
load net u_m3_mac|u_dsp|m_r[30] -attr @rip(#000000) 30 -attr @name m_r[30] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[30] -pin u_m3_mac|u_dsp|p0_i I0[30]
load net output_pixel[8] -attr @rip(#000000) output_pixel[8] -port output_pixel[8] -pin u_m7_fifo output_pixel[8]
load net u_m3_mac|acc_b[6] -attr @rip(#000000) 6 -attr @name acc_b[6] -pin u_m3_mac|acc_b_reg[17:0] Q[6] -pin u_m3_mac|base_b_i I1[6] -pin u_m3_mac|frame_b_reg[17:0] D[6]
load net u_m1_line_buffer|pixel_in[6] -attr @rip(#000000) pixel_in[6] -attr @name pixel_in[6] -hierPin u_m1_line_buffer curr_row_pixel[6] -hierPin u_m1_line_buffer pixel_in[6] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] D[6]
load net u_m3_mac|dsp_p[10] -attr @rip(#000000) p[10] -attr @name dsp_p[10] -pin u_m3_mac|acc_b0_i I1[10] -pin u_m3_mac|acc_c0_i I1[10] -pin u_m3_mac|u_dsp p[10]
load net u_m3_mac|ring_1[7] -attr @name ring_1[7] -pin u_m3_mac|ring_0_reg[24:0] D[7] -pin u_m3_mac|ring_1_reg[24:0] Q[7]
load net u_m1_line_buffer|line_buf2_reg[16]__0[0] -attr @name line_buf2_reg[16]__0[0] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] D[0]
load net u_m3_mac|s4_c[8] -attr @name s4_c[8] -pin u_m3_mac|s4_c_reg[17:0] Q[8] -pin u_m3_mac|sum_c2_reg[17:0] D[8]
load net u_m7_fifo|output_valid -attr @name output_valid -hierPin u_m7_fifo output_valid -pin u_m7_fifo|output_valid_reg Q
netloc u_m7_fifo|output_valid 1 10 1 N
load net final_output[6] -attr @rip(#000000) final_output[6] -pin u_m5_output_handling final_output[6] -pin u_m7_fifo final_output[6]
load net u_m3_mac|col_row0[5] -attr @rip(#000000) col_row0[5] -attr @name col_row0[5] -hierPin u_m3_mac col_row0[5] -pin u_m3_mac|q_s0_reg[7:0] D[5]
load net u_m3_mac|s4_c[14] -attr @name s4_c[14] -pin u_m3_mac|s4_c_reg[17:0] Q[14] -pin u_m3_mac|sum_c2_reg[17:0] D[14]
load net u_m1_line_buffer|line_buf2_reg[20]__0[1] -attr @name line_buf2_reg[20]__0[1] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] D[1]
load net u_m1_line_buffer|pixel_valid_in -attr @name pixel_valid_in -hierPin u_m1_line_buffer pixel_valid_in -hierPin u_m1_line_buffer pixel_valid_out -pin u_m1_line_buffer|line_buf1_reg[0][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[10][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[11][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[12][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[13][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[14][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[15][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[16][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[17][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[18][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[19][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[1][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[20][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[21][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[22][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[23][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[24][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[25][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[26][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[27][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[28][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[29][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[2][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[30][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[31][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[3][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[4][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[5][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[6][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[7][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[8][7:0] CE -pin u_m1_line_buffer|line_buf1_reg[9][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[0][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[10][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[11][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[12][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[13][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[14][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[15][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[16][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[17][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[18][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[19][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[1][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[20][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[21][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[22][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[23][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[24][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[25][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[26][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[27][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[28][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[29][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[2][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[30][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[31][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[3][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[4][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[5][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[6][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[7][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[8][7:0] CE -pin u_m1_line_buffer|line_buf2_reg[9][7:0] CE
netloc u_m1_line_buffer|pixel_valid_in 1 0 33 1000 248 1240 288 1520 288 1740 288 1960 208 2200 208 2440 208 2680 208 2920 208 3160 208 3400 208 3640 208 3880 208 4120 208 4360 208 4600 208 4840 208 5080 208 5320 208 5560 208 5800 208 6040 208 6280 208 6520 208 6760 208 7000 208 7240 208 7480 208 7720 208 7960 208 8200 208 8420 228 NJ
load net u_m3_mac|u_dsp|a_r[4] -attr @rip(#000000) 4 -attr @name a_r[4] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[4] -pin u_m3_mac|u_dsp|m_r0_i I0[4]
load net u_m1_line_buffer|line_buf1_reg[19]__0[1] -attr @name line_buf1_reg[19]__0[1] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] D[1]
load net u_m3_mac|acc_b0[15] -attr @rip(#000000) O[15] -attr @name acc_b0[15] -pin u_m3_mac|acc_b0_i O[15] -pin u_m3_mac|acc_b_reg[17:0] D[15]
load net u_m1_line_buffer|line_buf1_reg[25]__0[7] -attr @name line_buf1_reg[25]__0[7] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] D[7]
load net u_m3_mac|u_dsp|m_r[5] -attr @rip(#000000) 5 -attr @name m_r[5] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[5] -pin u_m3_mac|u_dsp|p0_i I0[5]
load net u_m7_fifo|wr_ptr[2] -attr @rip(#000000) 2 -attr @name wr_ptr[2] -pin u_m7_fifo|mem_reg WA2[2] -pin u_m7_fifo|pop0_i__0 I0[2] -pin u_m7_fifo|release_start0_i__0 I0[2] -pin u_m7_fifo|wr_ptr0_i__0 I0[2] -pin u_m7_fifo|wr_ptr_reg[5:0] Q[2]
load net pixel_in[4] -attr @rip(#000000) pixel_in[4] -port pixel_in[4] -pin u_m1_line_buffer pixel_in[4]
load net u_m3_mac|word_f[12] -attr @rip(#000000) 12 -attr @name word_f[12] -pin u_m3_mac|ring_50_i I0[12] -pin u_m3_mac|word_f_reg[24:0] Q[12]
load net u_m3_mac|ring_2[9] -attr @name ring_2[9] -pin u_m3_mac|ring_1_reg[24:0] D[9] -pin u_m3_mac|ring_2_reg[24:0] Q[9]
load net u_m3_mac|acc_a[7] -attr @rip(#000000) 7 -attr @name acc_a[7] -pin u_m3_mac|acc_a_reg[17:0] Q[7] -pin u_m3_mac|base_a_i I1[7] -pin u_m3_mac|frame_a_reg[17:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[27]__0[3] -attr @name line_buf1_reg[27]__0[3] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] D[3]
load net u_m3_mac|u_dsp|p0[5] -attr @rip(#000000) O[5] -attr @name p0[5] -pin u_m3_mac|u_dsp|p0_i O[5] -pin u_m3_mac|u_dsp|p_reg[33:0] D[5]
load net u_m3_mac|base_c[17] -attr @rip(#000000) O[17] -attr @name base_c[17] -pin u_m3_mac|acc_c0_i I0[17] -pin u_m3_mac|base_c_i O[17]
load net output_pixel[5] -attr @rip(#000000) output_pixel[5] -port output_pixel[5] -pin u_m7_fifo output_pixel[5]
load net u_m1_line_buffer|line_buf2_reg[8]__0[5] -attr @name line_buf2_reg[8]__0[5] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] D[5]
load net u_m5_output_handling|final_output[11] -attr @rip(#000000) 11 -attr @name final_output[11] -hierPin u_m5_output_handling final_output[11] -pin u_m5_output_handling|final_output_reg[15:0] Q[11]
load net u_m1_line_buffer|line_buf1_reg[20]__0[0] -attr @name line_buf1_reg[20]__0[0] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[28]__0[2] -attr @name line_buf2_reg[28]__0[2] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] D[2]
load net u_m3_mac|b_mux[3] -attr @rip(#000000) O[3] -attr @name b_mux[3] -pin u_m3_mac|b_mux_i O[3] -pin u_m3_mac|u_dsp b[3]
load net u_m1_line_buffer|line_buf1_reg[19]__0[7] -attr @name line_buf1_reg[19]__0[7] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] D[7]
load net u_m1_line_buffer|pixel_in[5] -attr @rip(#000000) pixel_in[5] -attr @name pixel_in[5] -hierPin u_m1_line_buffer curr_row_pixel[5] -hierPin u_m1_line_buffer pixel_in[5] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] D[5]
load net u_m1_line_buffer|line_buf2_reg[17]__0[7] -attr @name line_buf2_reg[17]__0[7] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] D[7]
load net u_m2_window_generator|row_ge_i_n_0 -attr @rip O[1] -attr @name row_ge_i_n_0 -pin u_m2_window_generator|row_ge_i O[1] -pin u_m2_window_generator|row_ge_reg[1:0] CE[1]
load net u_m1_line_buffer|line_buf1_reg[4]__0[4] -attr @name line_buf1_reg[4]__0[4] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] D[4]
load net u_m3_mac|dsp_p[8] -attr @rip(#000000) p[8] -attr @name dsp_p[8] -pin u_m3_mac|acc_b0_i I1[8] -pin u_m3_mac|acc_c0_i I1[8] -pin u_m3_mac|u_dsp p[8]
load net u_m3_mac|ring_1[6] -attr @name ring_1[6] -pin u_m3_mac|ring_0_reg[24:0] D[6] -pin u_m3_mac|ring_1_reg[24:0] Q[6]
load net u_m1_line_buffer|line_buf1_reg[6]__0[1] -attr @name line_buf1_reg[6]__0[1] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[22]__0[3] -attr @name line_buf1_reg[22]__0[3] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] D[3]
load net u_m3_mac|acc_r0[3] -attr @rip(#000000) O[3] -attr @name acc_r0[3] -pin u_m3_mac|acc_r0_i O[3] -pin u_m3_mac|acc_r_reg[19:0] D[3]
load net u_m2_window_generator|row_ge_i_n_1 -attr @rip O[0] -attr @name row_ge_i_n_1 -pin u_m2_window_generator|row_ge_i O[0] -pin u_m2_window_generator|row_ge_reg[1:0] CE[0]
load net u_m3_mac|acc_b[7] -attr @rip(#000000) 7 -attr @name acc_b[7] -pin u_m3_mac|acc_b_reg[17:0] Q[7] -pin u_m3_mac|base_b_i I1[7] -pin u_m3_mac|frame_b_reg[17:0] D[7]
load net u_m2_window_generator|u_col|lfsr_step2076_return1[0] -attr @rip(#000000) O[0] -attr @name lfsr_step2076_return1[0] -pin u_m2_window_generator|u_col|lfsr_step2076_return0_i I0[0] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i O[0]
load net u_m3_mac|dsp_p[11] -attr @rip(#000000) p[11] -attr @name dsp_p[11] -pin u_m3_mac|acc_b0_i I1[11] -pin u_m3_mac|acc_c0_i I1[11] -pin u_m3_mac|u_dsp p[11]
load net u_m1_line_buffer|line_buf2_reg[21]__0[2] -attr @name line_buf2_reg[21]__0[2] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[0]__0[7] -attr @name line_buf1_reg[0]__0[7] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] D[7]
load net u_m3_mac|ld_f -attr @name ld_f -pin u_m3_mac|ld_f_reg Q -pin u_m3_mac|ring_52_i I0
netloc u_m3_mac|ld_f 1 7 1 N
load net u_m3_mac|mac_result[10] -attr @rip(#000000) 10 -attr @name mac_result[10] -hierPin u_m3_mac mac_result[10] -pin u_m3_mac|acc_r_reg[19:0] Q[10]
load net u_m3_mac|u_dsp|a_r[16] -attr @rip(#000000) 16 -attr @name a_r[16] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[16] -pin u_m3_mac|u_dsp|m_r0_i I0[16]
load net final_output[5] -attr @rip(#000000) final_output[5] -pin u_m5_output_handling final_output[5] -pin u_m7_fifo final_output[5]
load net u_m3_mac|s4_c[9] -attr @name s4_c[9] -pin u_m3_mac|s4_c_reg[17:0] Q[9] -pin u_m3_mac|sum_c2_reg[17:0] D[9]
load net u_m1_line_buffer|line_buf2_reg[20]__0[0] -attr @name line_buf2_reg[20]__0[0] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[25]__0[4] -attr @name line_buf1_reg[25]__0[4] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] D[4]
load net u_m1_line_buffer|line_buf1_reg[19]__0[0] -attr @name line_buf1_reg[19]__0[0] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[9]__0[7] -attr @name line_buf1_reg[9]__0[7] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] D[7] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] Q[7]
load net u_m1_line_buffer|line_buf2_reg[22]__0[7] -attr @name line_buf2_reg[22]__0[7] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] D[7]
load net u_m3_mac|col_row0[6] -attr @rip(#000000) col_row0[6] -attr @name col_row0[6] -hierPin u_m3_mac col_row0[6] -pin u_m3_mac|q_s0_reg[7:0] D[6]
load net u_m3_mac|t1[6] -attr @rip(#000000) 6 -attr @name t1[6] -pin u_m3_mac|t1_reg[17:0] Q[6] -pin u_m3_mac|t20_i I0[6]
load net u_m3_mac|u_dsp|m_r[21] -attr @rip(#000000) 21 -attr @name m_r[21] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[21] -pin u_m3_mac|u_dsp|p0_i I0[21]
load net u_m3_mac|acc_b0[16] -attr @rip(#000000) O[16] -attr @name acc_b0[16] -pin u_m3_mac|acc_b0_i O[16] -pin u_m3_mac|acc_b_reg[17:0] D[16]
load net u_m3_mac|q_f2[0] -attr @rip(#000000) 0 -attr @name q_f2[0] -pin u_m3_mac|b_mux_i I2[0] -pin u_m3_mac|q_f2_reg[7:0] Q[0]
load net u_m3_mac|word_f[11] -attr @rip(#000000) 11 -attr @name word_f[11] -pin u_m3_mac|ring_50_i I0[11] -pin u_m3_mac|word_f_reg[24:0] Q[11]
load net u_m3_mac|u_dsp|p0[2] -attr @rip(#000000) O[2] -attr @name p0[2] -pin u_m3_mac|u_dsp|p0_i O[2] -pin u_m3_mac|u_dsp|p_reg[33:0] D[2]
load net u_m3_mac|ring_2[8] -attr @name ring_2[8] -pin u_m3_mac|ring_1_reg[24:0] D[8] -pin u_m3_mac|ring_2_reg[24:0] Q[8]
load net u_m3_mac|u_dsp|m_r[6] -attr @rip(#000000) 6 -attr @name m_r[6] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[6] -pin u_m3_mac|u_dsp|p0_i I0[6]
load net u_m7_fifo|wr_ptr[3] -attr @rip(#000000) 3 -attr @name wr_ptr[3] -pin u_m7_fifo|mem_reg WA2[3] -pin u_m7_fifo|pop0_i__0 I0[3] -pin u_m7_fifo|release_start0_i__0 I0[3] -pin u_m7_fifo|wr_ptr0_i__0 I0[3] -pin u_m7_fifo|wr_ptr_reg[5:0] Q[3]
load net u_m3_mac|q_s1[2] -attr @name q_s1[2] -pin u_m3_mac|q_f1_reg[7:0] D[2] -pin u_m3_mac|q_s1_reg[7:0] Q[2]
load net u_m1_line_buffer|line_buf2_reg[8]__0[2] -attr @name line_buf2_reg[8]__0[2] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] D[2]
load net u_m3_mac|dsp_p[20] -attr @rip(#000000) p[20] -attr @name dsp_p[20] -pin u_m3_mac|acc_a0_i I1[4] -pin u_m3_mac|u_dsp p[20]
load net u_m3_mac|ph[2] -attr @rip(#000000) 2 -attr @name ph[2] -pin u_m3_mac|b_mux_i S[2] -pin u_m3_mac|base_a_i S[2] -pin u_m3_mac|base_b_i S[2] -pin u_m3_mac|base_c_i S[2] -pin u_m3_mac|frame_a_i A[2] -pin u_m3_mac|frame_b_i A[2] -pin u_m3_mac|frame_c_i A[2] -pin u_m3_mac|ph0_i S[2] -pin u_m3_mac|ph1_i I0[2] -pin u_m3_mac|ph_i S[2] -pin u_m3_mac|ph_reg[2:0] Q[2] -pin u_m3_mac|ring_53_i I0[2]
load net output_pixel[10] -attr @rip(#000000) output_pixel[10] -port output_pixel[10] -pin u_m7_fifo output_pixel[10]
load net u_m1_line_buffer|line_buf1_reg[27]__0[4] -attr @name line_buf1_reg[27]__0[4] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] D[4]
load net u_m7_fifo|final_output[12] -attr @rip(#000000) final_output[12] -attr @name final_output[12] -hierPin u_m7_fifo final_output[12] -pin u_m7_fifo|mem_reg WD2[12]
load net u_m3_mac|b_mux[2] -attr @rip(#000000) O[2] -attr @name b_mux[2] -pin u_m3_mac|b_mux_i O[2] -pin u_m3_mac|u_dsp b[2]
load net output_pixel[6] -attr @rip(#000000) output_pixel[6] -port output_pixel[6] -pin u_m7_fifo output_pixel[6]
load net u_m1_line_buffer|line_buf2_reg[17]__0[6] -attr @name line_buf2_reg[17]__0[6] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] D[6]
load net u_m3_mac|dsp_p[7] -attr @rip(#000000) p[7] -attr @name dsp_p[7] -pin u_m3_mac|acc_b0_i I1[7] -pin u_m3_mac|acc_c0_i I1[7] -pin u_m3_mac|u_dsp p[7]
load net u_m3_mac|ring_1[5] -attr @name ring_1[5] -pin u_m3_mac|ring_0_reg[24:0] D[5] -pin u_m3_mac|ring_1_reg[24:0] Q[5]
load net u_m3_mac|hi_lane[4] -attr @rip(#000000) O[4] -attr @name hi_lane[4] -pin u_m3_mac|hi_lane_i O[4] -pin u_m3_mac|word_s_reg[24:0] D[20]
load net u_m3_mac|ld_s -attr @name ld_s -pin u_m3_mac|ld_f_reg D -pin u_m3_mac|ld_s_reg Q
netloc u_m3_mac|ld_s 1 6 1 7090
load net u_m1_line_buffer|line_buf2_reg[21]__0[1] -attr @name line_buf2_reg[21]__0[1] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[6]__0[2] -attr @name line_buf1_reg[6]__0[2] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[22]__0[4] -attr @name line_buf1_reg[22]__0[4] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] D[4]
load net u_m3_mac|acc_r0[4] -attr @rip(#000000) O[4] -attr @name acc_r0[4] -pin u_m3_mac|acc_r0_i O[4] -pin u_m3_mac|acc_r_reg[19:0] D[4]
load net u_m3_mac|u_dsp|a_r[15] -attr @rip(#000000) 15 -attr @name a_r[15] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[15] -pin u_m3_mac|u_dsp|m_r0_i I0[15]
load net u_m2_window_generator|u_col|lfsr_step2076_return1[1] -attr @rip(#000000) O[1] -attr @name lfsr_step2076_return1[1] -pin u_m2_window_generator|u_col|lfsr_step2076_return0_i I0[1] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i O[1]
load net u_m3_mac|acc_b[8] -attr @rip(#000000) 8 -attr @name acc_b[8] -pin u_m3_mac|acc_b_reg[17:0] Q[8] -pin u_m3_mac|base_b_i I1[8] -pin u_m3_mac|frame_b_reg[17:0] D[8]
load net u_m1_line_buffer|line_buf2_reg[6]__0[0] -attr @name line_buf2_reg[6]__0[0] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[9]__0[6] -attr @name line_buf1_reg[9]__0[6] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] D[6] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] Q[6]
load net u_m1_line_buffer|line_buf2_reg[22]__0[6] -attr @name line_buf2_reg[22]__0[6] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[27]__0[0] -attr @name line_buf2_reg[27]__0[0] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] D[0]
load net u_m7_fifo|output_pixel[15] -attr @rip(#000000) 15 -attr @name output_pixel[15] -hierPin u_m7_fifo output_pixel[15] -pin u_m7_fifo|output_pixel_reg[15:0] Q[15]
load net u_m1_line_buffer|line_buf1_reg[25]__0[5] -attr @name line_buf1_reg[25]__0[5] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] D[5]
load net u_m3_mac|u_dsp|m_r[20] -attr @rip(#000000) 20 -attr @name m_r[20] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[20] -pin u_m3_mac|u_dsp|p0_i I0[20]
load net u_m7_fifo|last_pop -attr @name last_pop -pin u_m7_fifo|fifo_all_outputs_done0_i I1 -pin u_m7_fifo|u_release_count at_count
netloc u_m7_fifo|last_pop 1 8 1 17120
load net final_output[8] -attr @rip(#000000) final_output[8] -pin u_m5_output_handling final_output[8] -pin u_m7_fifo final_output[8]
load net u_m3_mac|col_row0[7] -attr @rip(#000000) col_row0[7] -attr @name col_row0[7] -hierPin u_m3_mac col_row0[7] -pin u_m3_mac|q_s0_reg[7:0] D[7]
load net u_m3_mac|t1[7] -attr @rip(#000000) 7 -attr @name t1[7] -pin u_m3_mac|t1_reg[17:0] Q[7] -pin u_m3_mac|t20_i I0[7]
load net u_m3_mac|word_f[10] -attr @rip(#000000) 10 -attr @name word_f[10] -pin u_m3_mac|ring_50_i I0[10] -pin u_m3_mac|word_f_reg[24:0] Q[10]
load net u_m3_mac|acc_b0[17] -attr @rip(#000000) O[17] -attr @name acc_b0[17] -pin u_m3_mac|acc_b0_i O[17] -pin u_m3_mac|acc_b_reg[17:0] D[17]
load net u_m3_mac|q_s1[1] -attr @name q_s1[1] -pin u_m3_mac|q_f1_reg[7:0] D[1] -pin u_m3_mac|q_s1_reg[7:0] Q[1]
load net u_m3_mac|u_dsp|p0[3] -attr @rip(#000000) O[3] -attr @name p0[3] -pin u_m3_mac|u_dsp|p0_i O[3] -pin u_m3_mac|u_dsp|p_reg[33:0] D[3]
load net u_m3_mac|ph[1] -attr @rip(#000000) 1 -attr @name ph[1] -pin u_m3_mac|b_mux_i S[1] -pin u_m3_mac|base_a_i S[1] -pin u_m3_mac|base_b_i S[1] -pin u_m3_mac|base_c_i S[1] -pin u_m3_mac|frame_a_i A[1] -pin u_m3_mac|frame_b_i A[1] -pin u_m3_mac|frame_c_i A[1] -pin u_m3_mac|ph0_i S[1] -pin u_m3_mac|ph1_i I0[1] -pin u_m3_mac|ph_i S[1] -pin u_m3_mac|ph_reg[2:0] Q[1] -pin u_m3_mac|ring_53_i I0[1]
load net u_m3_mac|u_dsp|m_r[7] -attr @rip(#000000) 7 -attr @name m_r[7] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[7] -pin u_m3_mac|u_dsp|p0_i I0[7]
load net u_m7_fifo|wr_ptr[4] -attr @rip(#000000) 4 -attr @name wr_ptr[4] -pin u_m7_fifo|mem_reg WA2[4] -pin u_m7_fifo|pop0_i__0 I0[4] -pin u_m7_fifo|release_start0_i__0 I0[4] -pin u_m7_fifo|wr_ptr0_i__0 I0[4] -pin u_m7_fifo|wr_ptr_reg[5:0] Q[4]
load net u_m1_line_buffer|line_buf1_reg[8]__0[3] -attr @name line_buf1_reg[8]__0[3] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] D[3]
load net output_pixel[3] -attr @rip(#000000) output_pixel[3] -port output_pixel[3] -pin u_m7_fifo output_pixel[3]
load net u_m1_line_buffer|line_buf2_reg[8]__0[3] -attr @name line_buf2_reg[8]__0[3] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] D[3]
load net u_m7_fifo|final_output[11] -attr @rip(#000000) final_output[11] -attr @name final_output[11] -hierPin u_m7_fifo final_output[11] -pin u_m7_fifo|mem_reg WD2[11]
load net output_pixel[11] -attr @rip(#000000) output_pixel[11] -port output_pixel[11] -pin u_m7_fifo output_pixel[11]
load net u_m1_line_buffer|line_buf1_reg[1]__0[0] -attr @name line_buf1_reg[1]__0[0] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[27]__0[5] -attr @name line_buf1_reg[27]__0[5] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] D[5]
load net u_m3_mac|t2[7] -attr @rip(#000000) 7 -attr @name t2[7] -pin u_m3_mac|acc_r0_i I0[7] -pin u_m3_mac|t2_reg[18:0] Q[7]
load net u_m1_line_buffer|line_buf1_reg[12]__0[5] -attr @name line_buf1_reg[12]__0[5] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] D[5]
load net u_m3_mac|hi_lane[3] -attr @rip(#000000) O[3] -attr @name hi_lane[3] -pin u_m3_mac|hi_lane_i O[3] -pin u_m3_mac|word_s_reg[24:0] D[19]
load net u_m3_mac|ring_50[0] -attr @rip(#000000) O[0] -attr @name ring_50[0] -pin u_m3_mac|ring_50_i O[0] -pin u_m3_mac|ring_5_reg[24:0] D[0]
load net u_m3_mac|b_mux[5] -attr @rip(#000000) O[5] -attr @name b_mux[5] -pin u_m3_mac|b_mux_i O[5] -pin u_m3_mac|u_dsp b[5]
load net u_m1_line_buffer|pixel_in[7] -attr @rip(#000000) pixel_in[7] -attr @name pixel_in[7] -hierPin u_m1_line_buffer curr_row_pixel[7] -hierPin u_m1_line_buffer pixel_in[7] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[25]__0[2] -attr @name line_buf1_reg[25]__0[2] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[6]__0[3] -attr @name line_buf1_reg[6]__0[3] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[22]__0[5] -attr @name line_buf1_reg[22]__0[5] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] D[5]
load net u_m3_mac|frame_a[8] -attr @name frame_a[8] -pin u_m3_mac|frame_a_reg[17:0] Q[8] -pin u_m3_mac|s3_a_reg[17:0] D[8]
load net u_m3_mac|ring_5[9] -attr @name ring_5[9] -pin u_m3_mac|ring_4_reg[24:0] D[9] -pin u_m3_mac|ring_5_reg[24:0] Q[9]
load net u_m3_mac|s3_a[17] -attr @name s3_a[17] -pin u_m3_mac|s3_a_reg[17:0] Q[17] -pin u_m3_mac|s4_a_reg[17:0] D[17]
load net u_m3_mac|u_dsp|m_r[0] -attr @rip(#000000) 0 -attr @name m_r[0] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[0] -pin u_m3_mac|u_dsp|p0_i I0[0]
load net u_m3_mac|u_dsp|m_r[33] -attr @rip(#000000) 33 -attr @name m_r[33] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[33] -pin u_m3_mac|u_dsp|p0_i I0[33]
load net u_m2_window_generator|u_col|lfsr_step2076_return1[2] -attr @rip(#000000) O[2] -attr @name lfsr_step2076_return1[2] -pin u_m2_window_generator|u_col|lfsr_step2076_return0_i I0[2] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i O[2]
load net u_m3_mac|acc_r0[13] -attr @rip(#000000) O[13] -attr @name acc_r0[13] -pin u_m3_mac|acc_r0_i O[13] -pin u_m3_mac|acc_r_reg[19:0] D[13]
load net u_m3_mac|acc_b[9] -attr @rip(#000000) 9 -attr @name acc_b[9] -pin u_m3_mac|acc_b_reg[17:0] Q[9] -pin u_m3_mac|base_b_i I1[9] -pin u_m3_mac|frame_b_reg[17:0] D[9]
load net u_m3_mac|t1[17] -attr @name t1[17] -pin u_m3_mac|t1_reg[17:0] Q[17] -pin u_m3_mac|t20_i I0[18] -pin u_m3_mac|t20_i I0[17]
load net u_m3_mac|t1[4] -attr @rip(#000000) 4 -attr @name t1[4] -pin u_m3_mac|t1_reg[17:0] Q[4] -pin u_m3_mac|t20_i I0[4]
load net u_m1_line_buffer|line_buf2_reg[6]__0[1] -attr @name line_buf2_reg[6]__0[1] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] D[1]
load net u_m3_mac|frame_b[17] -attr @name frame_b[17] -pin u_m3_mac|frame_b_reg[17:0] Q[17] -pin u_m3_mac|s3_b_reg[17:0] D[17]
load net u_m3_mac|mac_result[12] -attr @rip(#000000) 12 -attr @name mac_result[12] -hierPin u_m3_mac mac_result[12] -pin u_m3_mac|acc_r_reg[19:0] Q[12]
load net u_m3_mac|u_dsp|a_r[18] -attr @rip(#000000) 18 -attr @name a_r[18] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[18] -pin u_m3_mac|u_dsp|m_r0_i I0[18]
load net final_output[7] -attr @rip(#000000) final_output[7] -pin u_m5_output_handling final_output[7] -pin u_m7_fifo final_output[7]
load net u_m3_mac|ring_3[20] -attr @name ring_3[20] -pin u_m3_mac|ring_2_reg[24:0] D[20] -pin u_m3_mac|ring_3_reg[24:0] Q[20]
load net u_m3_mac|acc_c[11] -attr @rip(#000000) 11 -attr @name acc_c[11] -pin u_m3_mac|acc_c_reg[17:0] Q[11] -pin u_m3_mac|base_c_i I1[11] -pin u_m3_mac|frame_c_reg[17:0] D[11]
load net u_m3_mac|ring_3[12] -attr @name ring_3[12] -pin u_m3_mac|ring_2_reg[24:0] D[12] -pin u_m3_mac|ring_3_reg[24:0] Q[12]
load net kernel_wr_bank[0] -attr @rip(#000000) kernel_wr_bank[0] -port kernel_wr_bank[0] -pin u_m4_kernel_storage kernel_wr_bank[0]
netloc kernel_wr_bank[0] 1 0 4 NJ 550 210J 708 780J 550 1180J
load net u_m3_mac|s4_c[17] -attr @name s4_c[17] -pin u_m3_mac|s4_c_reg[17:0] Q[17] -pin u_m3_mac|sum_c2_reg[17:0] D[17]
load net u_m3_mac|u_dsp|m_r[23] -attr @rip(#000000) 23 -attr @name m_r[23] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[23] -pin u_m3_mac|u_dsp|p0_i I0[23]
load net u_m3_mac|u_dsp|a_r[9] -attr @rip(#000000) 9 -attr @name a_r[9] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[9] -pin u_m3_mac|u_dsp|m_r0_i I0[9]
load net u_m7_fifo|wr_ptr[5] -attr @rip(#000000) 5 -attr @name wr_ptr[5] -pin u_m7_fifo|mem_reg WA2[5] -pin u_m7_fifo|pop0_i__0 I0[5] -pin u_m7_fifo|release_start0_i__0 I0[5] -pin u_m7_fifo|wr_ptr0_i__0 I0[5] -pin u_m7_fifo|wr_ptr_reg[5:0] Q[5]
load net u_m1_line_buffer|line_buf1_reg[8]__0[4] -attr @name line_buf1_reg[8]__0[4] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[3]__0[7] -attr @name line_buf2_reg[3]__0[7] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] D[7]
load net u_m3_mac|q_s1[4] -attr @name q_s1[4] -pin u_m3_mac|q_f1_reg[7:0] D[4] -pin u_m3_mac|q_s1_reg[7:0] Q[4]
load net u_m1_line_buffer|line_buf1_reg[12]__0[4] -attr @name line_buf1_reg[12]__0[4] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] D[4]
load net output_pixel[4] -attr @rip(#000000) output_pixel[4] -port output_pixel[4] -pin u_m7_fifo output_pixel[4]
load net u_m3_mac|dsp_p[22] -attr @rip(#000000) p[22] -attr @name dsp_p[22] -pin u_m3_mac|acc_a0_i I1[6] -pin u_m3_mac|u_dsp p[22]
load net u_m3_mac|sum_c1[12] -attr @rip(#000000) 12 -attr @name sum_c1[12] -pin u_m3_mac|sum_c1_reg[17:0] Q[12] -pin u_m3_mac|t20_i I1[12]
load net u_m1_line_buffer|line_buf1_reg[1]__0[1] -attr @name line_buf1_reg[1]__0[1] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] D[1]
load net u_m1_line_buffer|line_buf2_reg[19]__0[0] -attr @name line_buf2_reg[19]__0[0] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] D[0]
load net u_m3_mac|hi_lane[2] -attr @rip(#000000) O[2] -attr @name hi_lane[2] -pin u_m3_mac|hi_lane_i O[2] -pin u_m3_mac|word_s_reg[24:0] D[18]
load net u_m3_mac|t2[8] -attr @rip(#000000) 8 -attr @name t2[8] -pin u_m3_mac|acc_r0_i I0[8] -pin u_m3_mac|t2_reg[18:0] Q[8]
load net u_m3_mac|word_f[17] -attr @rip(#000000) 17 -attr @name word_f[17] -pin u_m3_mac|ring_50_i I0[17] -pin u_m3_mac|word_f_reg[24:0] Q[17]
load net u_m3_mac|b_mux[4] -attr @rip(#000000) O[4] -attr @name b_mux[4] -pin u_m3_mac|b_mux_i O[4] -pin u_m3_mac|u_dsp b[4]
load net u_m3_mac|dsp_p[9] -attr @rip(#000000) p[9] -attr @name dsp_p[9] -pin u_m3_mac|acc_b0_i I1[9] -pin u_m3_mac|acc_c0_i I1[9] -pin u_m3_mac|u_dsp p[9]
load net u_m3_mac|s3_a[16] -attr @name s3_a[16] -pin u_m3_mac|s3_a_reg[17:0] Q[16] -pin u_m3_mac|s4_a_reg[17:0] D[16]
load net u_m1_line_buffer|line_buf1_reg[4]__0[7] -attr @name line_buf1_reg[4]__0[7] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] D[7]
load net u_m3_mac|acc_r0[12] -attr @rip(#000000) O[12] -attr @name acc_r0[12] -pin u_m3_mac|acc_r0_i O[12] -pin u_m3_mac|acc_r_reg[19:0] D[12]
load net u_m3_mac|acc_b0[2] -attr @rip(#000000) O[2] -attr @name acc_b0[2] -pin u_m3_mac|acc_b0_i O[2] -pin u_m3_mac|acc_b_reg[17:0] D[2]
load net u_m7_fifo|output_pixel[13] -attr @rip(#000000) 13 -attr @name output_pixel[13] -hierPin u_m7_fifo output_pixel[13] -pin u_m7_fifo|output_pixel_reg[15:0] Q[13]
load net u_m1_line_buffer|line_buf1_reg[25]__0[3] -attr @name line_buf1_reg[25]__0[3] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[6]__0[4] -attr @name line_buf1_reg[6]__0[4] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] D[4]
load net u_m1_line_buffer|line_buf1_reg[22]__0[6] -attr @name line_buf1_reg[22]__0[6] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] D[6]
load net u_m3_mac|frame_a[9] -attr @name frame_a[9] -pin u_m3_mac|frame_a_reg[17:0] Q[9] -pin u_m3_mac|s3_a_reg[17:0] D[9]
load net u_m3_mac|frame_b[16] -attr @name frame_b[16] -pin u_m3_mac|frame_b_reg[17:0] Q[16] -pin u_m3_mac|s3_b_reg[17:0] D[16]
load net u_m3_mac|mac_result[11] -attr @rip(#000000) 11 -attr @name mac_result[11] -hierPin u_m3_mac mac_result[11] -pin u_m3_mac|acc_r_reg[19:0] Q[11]
load net u_m3_mac|ring_4[10] -attr @name ring_4[10] -pin u_m3_mac|ring_3_reg[24:0] D[10] -pin u_m3_mac|ring_4_reg[24:0] Q[10]
load net u_m3_mac|u_dsp|a_r[17] -attr @rip(#000000) 17 -attr @name a_r[17] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[17] -pin u_m3_mac|u_dsp|m_r0_i I0[17]
load net u_m3_mac|u_dsp|m_r[1] -attr @rip(#000000) 1 -attr @name m_r[1] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[1] -pin u_m3_mac|u_dsp|p0_i I0[1]
load net u_m1_line_buffer|line_buf2_reg[29]__0[0] -attr @name line_buf2_reg[29]__0[0] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] D[0]
load net u_m2_window_generator|u_col|lfsr_step2076_return1[3] -attr @rip(#000000) O[3] -attr @name lfsr_step2076_return1[3] -pin u_m2_window_generator|u_col|lfsr_step2076_return0_i I0[3] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i O[3]
load net u_m3_mac|dsp_p[14] -attr @rip(#000000) p[14] -attr @name dsp_p[14] -pin u_m3_mac|acc_b0_i I1[14] -pin u_m3_mac|acc_c0_i I1[14] -pin u_m3_mac|u_dsp p[14]
load net u_m3_mac|t1[5] -attr @rip(#000000) 5 -attr @name t1[5] -pin u_m3_mac|t1_reg[17:0] Q[5] -pin u_m3_mac|t20_i I0[5]
load net u_m6_control_fsm|state_next[1] -attr @rip O[1] -attr @name state_next[1] -pin u_m6_control_fsm|state_next_i O[1] -pin u_m6_control_fsm|state_reg[1:0] D[1]
load net u_m1_line_buffer|line_buf2_reg[6]__0[2] -attr @name line_buf2_reg[6]__0[2] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] D[2]
load net u_m1_line_buffer|line_buf2_reg[27]__0[2] -attr @name line_buf2_reg[27]__0[2] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] D[2]
load net u_m3_mac|acc_c[12] -attr @rip(#000000) 12 -attr @name acc_c[12] -pin u_m3_mac|acc_c_reg[17:0] Q[12] -pin u_m3_mac|base_c_i I1[12] -pin u_m3_mac|frame_c_reg[17:0] D[12]
load net u_m3_mac|ring_3[13] -attr @name ring_3[13] -pin u_m3_mac|ring_2_reg[24:0] D[13] -pin u_m3_mac|ring_3_reg[24:0] Q[13]
load net u_m3_mac|u_dsp|m_r[22] -attr @rip(#000000) 22 -attr @name m_r[22] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[22] -pin u_m3_mac|u_dsp|p0_i I0[22]
load net u_m1_line_buffer|line_buf2_reg[11]__0[6] -attr @name line_buf2_reg[11]__0[6] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] D[6]
load net u_m3_mac|u_dsp|a_r[8] -attr @rip(#000000) 8 -attr @name a_r[8] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[8] -pin u_m3_mac|u_dsp|m_r0_i I0[8]
load net u_m7_fifo|fifo_all_outputs_done0 -attr @name fifo_all_outputs_done0 -pin u_m7_fifo|fifo_all_outputs_done0_i O -pin u_m7_fifo|fifo_all_outputs_done_reg SET
netloc u_m7_fifo|fifo_all_outputs_done0 1 9 1 17540
load net u_m3_mac|q_s1[3] -attr @name q_s1[3] -pin u_m3_mac|q_f1_reg[7:0] D[3] -pin u_m3_mac|q_s1_reg[7:0] Q[3]
load net u_m3_mac|dsp_p[21] -attr @rip(#000000) p[21] -attr @name dsp_p[21] -pin u_m3_mac|acc_a0_i I1[5] -pin u_m3_mac|u_dsp p[21]
load net u_m3_mac|dsp_p[4] -attr @rip(#000000) p[4] -attr @name dsp_p[4] -pin u_m3_mac|acc_b0_i I1[4] -pin u_m3_mac|acc_c0_i I1[4] -pin u_m3_mac|u_dsp p[4]
load net u_m1_line_buffer|line_buf1_reg[8]__0[5] -attr @name line_buf1_reg[8]__0[5] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] D[5]
load net u_m3_mac|hi_lane[1] -attr @rip(#000000) O[1] -attr @name hi_lane[1] -pin u_m3_mac|hi_lane_i O[1] -pin u_m3_mac|word_s_reg[24:0] D[17]
load net u_m6_control_fsm|<const0> -ground -attr @name <const0> -pin u_m6_control_fsm|busy0_i I1[1] -pin u_m6_control_fsm|busy0_i I1[0] -pin u_m6_control_fsm|clear1_i I1[1] -pin u_m6_control_fsm|drain_sr1_i I1[0] -pin u_m6_control_fsm|drain_sr_reg[6:0] CE[0] -pin u_m6_control_fsm|drain_sr_reg[6:0] D[0] -pin u_m6_control_fsm|state_i I0[2] -pin u_m6_control_fsm|state_i I0[1] -pin u_m6_control_fsm|state_i I1[2] -pin u_m6_control_fsm|state_i I1[0] -pin u_m6_control_fsm|state_i I2[1] -pin u_m6_control_fsm|state_i I2[0] -pin u_m6_control_fsm|state_next_i I0[1] -pin u_m6_control_fsm|state_next_i I1[0] -pin u_m6_control_fsm|state_next_i I3[1]
load net u_m3_mac|sum_c1[13] -attr @rip(#000000) 13 -attr @name sum_c1[13] -pin u_m3_mac|sum_c1_reg[17:0] Q[13] -pin u_m3_mac|t20_i I1[13]
load net u_m1_line_buffer|line_buf2_reg[19]__0[1] -attr @name line_buf2_reg[19]__0[1] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[1]__0[2] -attr @name line_buf1_reg[1]__0[2] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] D[2]
load net u_m3_mac|t2[9] -attr @rip(#000000) 9 -attr @name t2[9] -pin u_m3_mac|acc_r0_i I0[9] -pin u_m3_mac|t2_reg[18:0] Q[9]
load net u_m3_mac|word_f[18] -attr @rip(#000000) 18 -attr @name word_f[18] -pin u_m3_mac|ring_50_i I0[18] -pin u_m3_mac|word_f_reg[24:0] Q[18]
load net u_m1_line_buffer|line_buf2_reg[4]__0[6] -attr @name line_buf2_reg[4]__0[6] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] D[6]
load net u_m1_line_buffer|line_buf1_reg[12]__0[7] -attr @name line_buf1_reg[12]__0[7] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[25]__0[0] -attr @name line_buf1_reg[25]__0[0] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] D[0]
load net u_m3_mac|frame_a[6] -attr @name frame_a[6] -pin u_m3_mac|frame_a_reg[17:0] Q[6] -pin u_m3_mac|s3_a_reg[17:0] D[6]
load net u_m3_mac|s3_a[15] -attr @name s3_a[15] -pin u_m3_mac|s3_a_reg[17:0] Q[15] -pin u_m3_mac|s4_a_reg[17:0] D[15]
load net u_m3_mac|u_dsp|m_r[31] -attr @rip(#000000) 31 -attr @name m_r[31] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[31] -pin u_m3_mac|u_dsp|p0_i I0[31]
load net u_m3_mac|acc_r0[11] -attr @rip(#000000) O[11] -attr @name acc_r0[11] -pin u_m3_mac|acc_r0_i O[11] -pin u_m3_mac|acc_r_reg[19:0] D[11]
load net u_m3_mac|acc_b0[1] -attr @rip(#000000) O[1] -attr @name acc_b0[1] -pin u_m3_mac|acc_b0_i O[1] -pin u_m3_mac|acc_b_reg[17:0] D[1]
load net u_m3_mac|pixel_valid -attr @name pixel_valid -hierPin u_m3_mac pixel_valid -pin u_m3_mac|ev_reg[5:1] D[1] -pin u_m3_mac|q_s0_reg[7:0] CE -pin u_m3_mac|q_s1_reg[7:0] CE -pin u_m3_mac|q_s2_reg[7:0] CE
netloc u_m3_mac|pixel_valid 1 0 20 5300 408 NJ 408 NJ 408 NJ 408 NJ 408 NJ 408 NJ 408 NJ 408 NJ 408 NJ 408 NJ 408 NJ 408 8280 218 NJ 218 NJ 218 NJ 218 NJ 218 NJ 218 NJ 218 11310
load net u_m3_mac|t1[2] -attr @rip(#000000) 2 -attr @name t1[2] -pin u_m3_mac|t1_reg[17:0] Q[2] -pin u_m3_mac|t20_i I0[2]
load net u_m3_mac|b_mux[7] -attr @rip(#000000) O[7] -attr @name b_mux[7] -pin u_m3_mac|b_mux_i O[7] -pin u_m3_mac|u_dsp b[7]
load net u_m3_mac|frame_b[15] -attr @name frame_b[15] -pin u_m3_mac|frame_b_reg[17:0] Q[15] -pin u_m3_mac|s3_b_reg[17:0] D[15]
load net u_m3_mac|acc_a[0] -attr @rip(#000000) 0 -attr @name acc_a[0] -pin u_m3_mac|acc_a_reg[17:0] Q[0] -pin u_m3_mac|base_a_i I1[0] -pin u_m3_mac|frame_a_reg[17:0] D[0]
load net u_m2_window_generator|<const1> -power -attr @name <const1> -pin u_m2_window_generator|col_ge_i I0[1] -pin u_m2_window_generator|col_ge_i__0 I0[0] -pin u_m2_window_generator|row_ge_i I0[1] -pin u_m2_window_generator|row_ge_i__0 I0[0]
load net u_m7_fifo|output_pixel[14] -attr @rip(#000000) 14 -attr @name output_pixel[14] -hierPin u_m7_fifo output_pixel[14] -pin u_m7_fifo|output_pixel_reg[15:0] Q[14]
load net u_m6_control_fsm|state_next[0] -attr @rip O[0] -attr @name state_next[0] -pin u_m6_control_fsm|state_next_i O[0] -pin u_m6_control_fsm|state_reg[1:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[22]__0[7] -attr @name line_buf1_reg[22]__0[7] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[6]__0[5] -attr @name line_buf1_reg[6]__0[5] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] D[5]
load net u_m3_mac|sum_c0[3] -attr @name sum_c0[3] -pin u_m3_mac|sum_c0_reg[17:0] Q[3] -pin u_m3_mac|t1_reg[17:0] D[3]
load net u_m3_mac|u_dsp|m_r[2] -attr @rip(#000000) 2 -attr @name m_r[2] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[2] -pin u_m3_mac|u_dsp|p0_i I0[2]
load net u_m1_line_buffer|line_buf2_reg[27]__0[1] -attr @name line_buf2_reg[27]__0[1] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] D[1]
load net u_m2_window_generator|u_col|lfsr_step2076_return1[4] -attr @rip(#000000) O[4] -attr @name lfsr_step2076_return1[4] -pin u_m2_window_generator|u_col|lfsr_step2076_return0_i I0[4] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i O[4]
load net u_m3_mac|dsp_p[15] -attr @rip(#000000) p[15] -attr @name dsp_p[15] -pin u_m3_mac|p_lo0_i I0 -pin u_m3_mac|u_dsp p[15]
load net u_m1_line_buffer|line_buf2_reg[6]__0[3] -attr @name line_buf2_reg[6]__0[3] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] D[3]
load net u_m3_mac|mac_result[14] -attr @rip(#000000) 14 -attr @name mac_result[14] -hierPin u_m3_mac mac_result[14] -pin u_m3_mac|acc_r_reg[19:0] Q[14]
load net u_m1_line_buffer|line_buf2_reg[9]__0[3] -attr @name line_buf2_reg[9]__0[3] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] D[3] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] Q[3]
load net final_output[9] -attr @rip(#000000) final_output[9] -pin u_m5_output_handling final_output[9] -pin u_m7_fifo final_output[9]
load net u_m3_mac|ring_1[21] -attr @name ring_1[21] -pin u_m3_mac|ring_0_reg[24:0] D[21] -pin u_m3_mac|ring_1_reg[24:0] Q[21]
load net u_m3_mac|ring_3[14] -attr @name ring_3[14] -pin u_m3_mac|ring_2_reg[24:0] D[14] -pin u_m3_mac|ring_3_reg[24:0] Q[14]
load net u_m1_line_buffer|line_buf2_reg[11]__0[7] -attr @name line_buf2_reg[11]__0[7] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] D[7]
load net u_m1_line_buffer|line_buf2_reg[3]__0[5] -attr @name line_buf2_reg[3]__0[5] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] D[5]
load net u_m3_mac|dsp_p[3] -attr @rip(#000000) p[3] -attr @name dsp_p[3] -pin u_m3_mac|acc_b0_i I1[3] -pin u_m3_mac|acc_c0_i I1[3] -pin u_m3_mac|u_dsp p[3]
load net u_m3_mac|sum_c1[10] -attr @rip(#000000) 10 -attr @name sum_c1[10] -pin u_m3_mac|sum_c1_reg[17:0] Q[10] -pin u_m3_mac|t20_i I1[10]
load net u_m3_mac|u_dsp|m_r[25] -attr @rip(#000000) 25 -attr @name m_r[25] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[25] -pin u_m3_mac|u_dsp|p0_i I0[25]
load net u_m1_line_buffer|line_buf2_reg[0]__0[2] -attr @name line_buf2_reg[0]__0[2] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] D[2]
load net u_m3_mac|hi_lane[0] -attr @rip(#000000) O[0] -attr @name hi_lane[0] -pin u_m3_mac|hi_lane_i O[0] -pin u_m3_mac|word_s_reg[24:0] D[16]
load net u_m3_mac|q_f2[4] -attr @rip(#000000) 4 -attr @name q_f2[4] -pin u_m3_mac|b_mux_i I2[4] -pin u_m3_mac|q_f2_reg[7:0] Q[4]
load net u_m3_mac|wv[1] -attr @name wv[1] -pin u_m3_mac|wv_reg[6:1] D[2] -pin u_m3_mac|wv_reg[6:1] Q[1]
load net u_m3_mac|s4_c[2] -attr @name s4_c[2] -pin u_m3_mac|s4_c_reg[17:0] Q[2] -pin u_m3_mac|sum_c2_reg[17:0] D[2]
load net u_m3_mac|acc_r0[0] -attr @rip(#000000) O[0] -attr @name acc_r0[0] -pin u_m3_mac|acc_r0_i O[0] -pin u_m3_mac|acc_r_reg[19:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[8]__0[6] -attr @name line_buf1_reg[8]__0[6] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] D[6]
load net u_m3_mac|q_s1[6] -attr @name q_s1[6] -pin u_m3_mac|q_f1_reg[7:0] D[6] -pin u_m3_mac|q_s1_reg[7:0] Q[6]
load net u_m1_line_buffer|line_buf1_reg[12]__0[6] -attr @name line_buf1_reg[12]__0[6] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] D[6]
load net u_m3_mac|dsp_p[24] -attr @rip(#000000) p[24] -attr @name dsp_p[24] -pin u_m3_mac|acc_a0_i I1[8] -pin u_m3_mac|u_dsp p[24]
load net u_m3_mac|frame_c[9] -attr @name frame_c[9] -pin u_m3_mac|frame_c_reg[17:0] Q[9] -pin u_m3_mac|s3_c_reg[17:0] D[9]
load net u_m6_control_fsm|p_0_in -attr @rip O[1] -attr @name p_0_in -pin u_m6_control_fsm|done_i I0 -pin u_m6_control_fsm|state_i O[1]
load net u_m1_line_buffer|line_buf2_reg[19]__0[2] -attr @name line_buf2_reg[19]__0[2] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[1]__0[3] -attr @name line_buf1_reg[1]__0[3] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] D[3]
load net u_m3_mac|s3_a[14] -attr @name s3_a[14] -pin u_m3_mac|s3_a_reg[17:0] Q[14] -pin u_m3_mac|s4_a_reg[17:0] D[14]
load net u_m3_mac|word_f[19] -attr @rip(#000000) 19 -attr @name word_f[19] -pin u_m3_mac|ring_50_i I0[19] -pin u_m3_mac|word_f_reg[24:0] Q[19]
load net u_m1_line_buffer|line_buf2_reg[4]__0[7] -attr @name line_buf2_reg[4]__0[7] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] D[7]
load net u_m3_mac|acc_r0[10] -attr @rip(#000000) O[10] -attr @name acc_r0[10] -pin u_m3_mac|acc_r0_i O[10] -pin u_m3_mac|acc_r_reg[19:0] D[10]
load net u_m3_mac|s3_c[11] -attr @name s3_c[11] -pin u_m3_mac|s3_c_reg[17:0] Q[11] -pin u_m3_mac|s4_c_reg[17:0] D[11]
load net u_m4_kernel_storage|streaming0 -attr @name streaming0 -pin u_m4_kernel_storage|streaming0_i O -pin u_m4_kernel_storage|streaming_i I0
netloc u_m4_kernel_storage|streaming0 1 5 1 NJ
load net u_m1_line_buffer|line_buf1_reg[25]__0[1] -attr @name line_buf1_reg[25]__0[1] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] D[1]
load net u_m3_mac|b_mux[6] -attr @rip(#000000) O[6] -attr @name b_mux[6] -pin u_m3_mac|b_mux_i O[6] -pin u_m3_mac|u_dsp b[6]
load net u_m3_mac|frame_a[7] -attr @name frame_a[7] -pin u_m3_mac|frame_a_reg[17:0] Q[7] -pin u_m3_mac|s3_a_reg[17:0] D[7]
load net u_m3_mac|frame_b[14] -attr @name frame_b[14] -pin u_m3_mac|frame_b_reg[17:0] Q[14] -pin u_m3_mac|s3_b_reg[17:0] D[14]
load net u_m3_mac|u_dsp|m_r[32] -attr @rip(#000000) 32 -attr @name m_r[32] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[32] -pin u_m3_mac|u_dsp|p0_i I0[32]
load net u_m3_mac|dsp_p[12] -attr @rip(#000000) p[12] -attr @name dsp_p[12] -pin u_m3_mac|acc_b0_i I1[12] -pin u_m3_mac|acc_c0_i I1[12] -pin u_m3_mac|u_dsp p[12]
load net u_m3_mac|ring_1[9] -attr @name ring_1[9] -pin u_m3_mac|ring_0_reg[24:0] D[9] -pin u_m3_mac|ring_1_reg[24:0] Q[9]
load net u_m3_mac|t1[3] -attr @rip(#000000) 3 -attr @name t1[3] -pin u_m3_mac|t1_reg[17:0] Q[3] -pin u_m3_mac|t20_i I0[3]
load net u_m2_window_generator|row_end -attr @name row_end -pin u_m2_window_generator|row_wrap_i I1 -pin u_m2_window_generator|u_col at_count
netloc u_m2_window_generator|row_end 1 3 1 3350
load net u_m1_line_buffer|line_buf1_reg[20]__0[5] -attr @name line_buf1_reg[20]__0[5] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] D[5]
load net u_m3_mac|sum_c0[2] -attr @name sum_c0[2] -pin u_m3_mac|sum_c0_reg[17:0] Q[2] -pin u_m3_mac|t1_reg[17:0] D[2]
load net u_m3_mac|acc_b0[4] -attr @rip(#000000) O[4] -attr @name acc_b0[4] -pin u_m3_mac|acc_b0_i O[4] -pin u_m3_mac|acc_b_reg[17:0] D[4]
load net u_m3_mac|acc_a[1] -attr @rip(#000000) 1 -attr @name acc_a[1] -pin u_m3_mac|acc_a_reg[17:0] Q[1] -pin u_m3_mac|base_a_i I1[1] -pin u_m3_mac|frame_a_reg[17:0] D[1]
load net u_m3_mac|acc_c[10] -attr @rip(#000000) 10 -attr @name acc_c[10] -pin u_m3_mac|acc_c_reg[17:0] Q[10] -pin u_m3_mac|base_c_i I1[10] -pin u_m3_mac|frame_c_reg[17:0] D[10]
load net u_m1_line_buffer|line_buf1_reg[6]__0[6] -attr @name line_buf1_reg[6]__0[6] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] D[6]
load net u_m3_mac|mac_result[13] -attr @rip(#000000) 13 -attr @name mac_result[13] -hierPin u_m3_mac mac_result[13] -pin u_m3_mac|acc_r_reg[19:0] Q[13]
load net u_m3_mac|u_dsp|a_r[19] -attr @rip(#000000) 19 -attr @name a_r[19] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[19] -pin u_m3_mac|u_dsp|m_r0_i I0[19]
load net u_m3_mac|u_dsp|m_r[3] -attr @rip(#000000) 3 -attr @name m_r[3] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[3] -pin u_m3_mac|u_dsp|p0_i I0[3]
load net u_m1_line_buffer|line_buf2_reg[11]__0[4] -attr @name line_buf2_reg[11]__0[4] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[14]__0[0] -attr @name line_buf2_reg[14]__0[0] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[29]__0[2] -attr @name line_buf2_reg[29]__0[2] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] D[2]
load net u_m2_window_generator|u_col|lfsr_step2076_return1[5] -attr @rip(#000000) O[5] -attr @name lfsr_step2076_return1[5] -pin u_m2_window_generator|u_col|lfsr_step2076_return0_i I0[5] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i O[5]
load net u_m1_line_buffer|line_buf2_reg[6]__0[4] -attr @name line_buf2_reg[6]__0[4] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] D[4]
load net u_m3_mac|sum_c2[17] -attr @name sum_c2[17] -pin u_m3_mac|acc_r0_i I1[19] -pin u_m3_mac|acc_r0_i I1[18] -pin u_m3_mac|acc_r0_i I1[17] -pin u_m3_mac|sum_c2_reg[17:0] Q[17]
load net u_m1_line_buffer|line_buf2_reg[27]__0[4] -attr @name line_buf2_reg[27]__0[4] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[9]__0[4] -attr @name line_buf2_reg[9]__0[4] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] D[4] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] Q[4]
load net u_m3_mac|insph_s[0] -attr @name insph_s[0] -pin u_m3_mac|insph_f_reg[2:0] D[0] -pin u_m3_mac|insph_s_reg[2:0] Q[0]
load net u_m3_mac|ring_1[22] -attr @name ring_1[22] -pin u_m3_mac|ring_0_reg[24:0] D[22] -pin u_m3_mac|ring_1_reg[24:0] Q[22]
load net u_m7_fifo|output_pixel[2] -attr @rip(#000000) 2 -attr @name output_pixel[2] -hierPin u_m7_fifo output_pixel[2] -pin u_m7_fifo|output_pixel_reg[15:0] Q[2]
load net u_m1_line_buffer|line_buf1_reg[12]__0[1] -attr @name line_buf1_reg[12]__0[1] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] D[1]
load net u_m3_mac|ring_3[15] -attr @name ring_3[15] -pin u_m3_mac|ring_2_reg[24:0] D[15] -pin u_m3_mac|ring_3_reg[24:0] Q[15]
load net u_m3_mac|u_dsp|m_r[24] -attr @rip(#000000) 24 -attr @name m_r[24] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[24] -pin u_m3_mac|u_dsp|p0_i I0[24]
load net u_m1_line_buffer|line_buf2_reg[3]__0[6] -attr @name line_buf2_reg[3]__0[6] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] D[6]
load net u_m3_mac|q_f2[3] -attr @rip(#000000) 3 -attr @name q_f2[3] -pin u_m3_mac|b_mux_i I2[3] -pin u_m3_mac|q_f2_reg[7:0] Q[3]
load net u_m3_mac|sum_c1[11] -attr @rip(#000000) 11 -attr @name sum_c1[11] -pin u_m3_mac|sum_c1_reg[17:0] Q[11] -pin u_m3_mac|t20_i I1[11]
load net u_m1_line_buffer|line_buf2_reg[0]__0[3] -attr @name line_buf2_reg[0]__0[3] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[0]__0[1] -attr @name line_buf1_reg[0]__0[1] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] D[1]
load net u_m3_mac|q_s1[5] -attr @name q_s1[5] -pin u_m3_mac|q_f1_reg[7:0] D[5] -pin u_m3_mac|q_s1_reg[7:0] Q[5]
load net u_m3_mac|col_row1[5] -attr @rip(#000000) col_row1[5] -attr @name col_row1[5] -hierPin u_m3_mac col_row1[5] -pin u_m3_mac|q_s1_reg[7:0] D[5]
load net u_m3_mac|dsp_p[23] -attr @rip(#000000) p[23] -attr @name dsp_p[23] -pin u_m3_mac|acc_a0_i I1[7] -pin u_m3_mac|u_dsp p[23]
load net u_m3_mac|dsp_p[6] -attr @rip(#000000) p[6] -attr @name dsp_p[6] -pin u_m3_mac|acc_b0_i I1[6] -pin u_m3_mac|acc_c0_i I1[6] -pin u_m3_mac|u_dsp p[6]
load net u_m3_mac|frame_c[8] -attr @name frame_c[8] -pin u_m3_mac|frame_c_reg[17:0] Q[8] -pin u_m3_mac|s3_c_reg[17:0] D[8]
load net u_m3_mac|s4_c[3] -attr @name s4_c[3] -pin u_m3_mac|s4_c_reg[17:0] Q[3] -pin u_m3_mac|sum_c2_reg[17:0] D[3]
load net u_m3_mac|frame_a[4] -attr @name frame_a[4] -pin u_m3_mac|frame_a_reg[17:0] Q[4] -pin u_m3_mac|s3_a_reg[17:0] D[4]
load net u_m3_mac|q_s0[0] -attr @name q_s0[0] -pin u_m3_mac|q_f0_reg[7:0] D[0] -pin u_m3_mac|q_s0_reg[7:0] Q[0]
load net u_m3_mac|s3_a[13] -attr @name s3_a[13] -pin u_m3_mac|s3_a_reg[17:0] Q[13] -pin u_m3_mac|s4_a_reg[17:0] D[13]
load net prev_row1_pixel[5] -attr @rip(#000000) prev_row1_pixel[5] -pin u_m1_line_buffer prev_row1_pixel[5] -pin u_m3_mac col_row1[5]
load net u_m3_mac|s3_c[10] -attr @name s3_c[10] -pin u_m3_mac|s3_c_reg[17:0] Q[10] -pin u_m3_mac|s4_c_reg[17:0] D[10]
load net u_m3_mac|t1[0] -attr @rip(#000000) 0 -attr @name t1[0] -pin u_m3_mac|t1_reg[17:0] Q[0] -pin u_m3_mac|t20_i I0[0]
load net u_m1_line_buffer|line_buf2_reg[19]__0[3] -attr @name line_buf2_reg[19]__0[3] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] D[3]
load net u_m4_kernel_storage|rd_tap1[0] -attr @rip(#000000) O[0] -attr @name rd_tap1[0] -pin u_m4_kernel_storage|rd_tap0_i I1[0] -pin u_m4_kernel_storage|rd_tap1_i O[0]
load net u_m1_line_buffer|line_buf1_reg[1]__0[4] -attr @name line_buf1_reg[1]__0[4] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] D[4]
load net u_m3_mac|frame_b[13] -attr @name frame_b[13] -pin u_m3_mac|frame_b_reg[17:0] Q[13] -pin u_m3_mac|s3_b_reg[17:0] D[13]
load net u_m3_mac|u_dsp|m_r0[10] -attr @rip(#000000) O[10] -attr @name m_r0[10] -pin u_m3_mac|u_dsp|m_r0_i O[10] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[10]
load net u_m3_mac|ph_i_n_1 -attr @rip(#000000) O[4] -attr @name ph_i_n_1 -pin u_m3_mac|acc_c1_i I1 -pin u_m3_mac|ph_i O[4]
load net u_m3_mac|ph_i_n_2 -attr @rip(#000000) O[3] -attr @name ph_i_n_2 -pin u_m3_mac|acc_c1_i I0 -pin u_m3_mac|ph_i O[3]
load net u_m3_mac|ring_2[2] -attr @name ring_2[2] -pin u_m3_mac|ring_1_reg[24:0] D[2] -pin u_m3_mac|ring_2_reg[24:0] Q[2]
load net u_m3_mac|acc_b0[3] -attr @rip(#000000) O[3] -attr @name acc_b0[3] -pin u_m3_mac|acc_b0_i O[3] -pin u_m3_mac|acc_b_reg[17:0] D[3]
load net u_m3_mac|dsp_p[13] -attr @rip(#000000) p[13] -attr @name dsp_p[13] -pin u_m3_mac|acc_b0_i I1[13] -pin u_m3_mac|acc_c0_i I1[13] -pin u_m3_mac|u_dsp p[13]
load net u_m3_mac|ph_i_n_3 -attr @rip(#000000) O[2] -attr @name ph_i_n_3 -pin u_m3_mac|acc_a0_i__0 I1 -pin u_m3_mac|ph_i O[2]
load net u_m1_line_buffer|line_buf1_reg[20]__0[6] -attr @name line_buf1_reg[20]__0[6] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] D[6]
load net u_m1_line_buffer|line_buf1_reg[14]__0[7] -attr @name line_buf1_reg[14]__0[7] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] D[7]
load net u_m1_line_buffer|line_buf2_reg[18]__0[6] -attr @name line_buf2_reg[18]__0[6] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] D[6]
load net u_m2_window_generator|u_col|state_reg_n_0 -attr @rip(#000000) 5 -attr @name state_reg_n_0 -pin u_m2_window_generator|u_col|at_count_i I0[5] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I0[5] -pin u_m2_window_generator|u_col|state_reg[5:0] Q[5]
load net u_m3_mac|ph_i_n_4 -attr @rip(#000000) O[1] -attr @name ph_i_n_4 -pin u_m3_mac|acc_a1_i I1 -pin u_m3_mac|ph_i O[1]
load net u_m6_control_fsm|rst -attr @name rst -hierPin u_m6_control_fsm rst -pin u_m6_control_fsm|clear0_i I0 -pin u_m6_control_fsm|drain_sr0_i I0 -pin u_m6_control_fsm|state_reg[1:0] RST
netloc u_m6_control_fsm|rst 1 0 6 NJ 808 18660 678 18940 568 NJ 568 NJ 568 19900
load net u_m1_line_buffer|line_buf2_reg[9]__0[1] -attr @name line_buf2_reg[9]__0[1] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] D[1] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] Q[1]
load net u_m1_line_buffer|line_buf2_reg[29]__0[1] -attr @name line_buf2_reg[29]__0[1] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] D[1]
load net u_m3_mac|base_c[10] -attr @rip(#000000) O[10] -attr @name base_c[10] -pin u_m3_mac|acc_c0_i I0[10] -pin u_m3_mac|base_c_i O[10]
load net u_m3_mac|ph_i_n_5 -attr @rip(#000000) O[0] -attr @name ph_i_n_5 -pin u_m3_mac|ph_i O[0]
load net u_m1_line_buffer|line_buf1_reg[6]__0[7] -attr @name line_buf1_reg[6]__0[7] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] D[7]
load net u_m3_mac|acc_r0[9] -attr @rip(#000000) O[9] -attr @name acc_r0[9] -pin u_m3_mac|acc_r0_i O[9] -pin u_m3_mac|acc_r_reg[19:0] D[9]
load net u_m3_mac|sum_c0[5] -attr @name sum_c0[5] -pin u_m3_mac|sum_c0_reg[17:0] Q[5] -pin u_m3_mac|t1_reg[17:0] D[5]
load net u_m3_mac|sum_c2[16] -attr @rip(#000000) 16 -attr @name sum_c2[16] -pin u_m3_mac|acc_r0_i I1[16] -pin u_m3_mac|sum_c2_reg[17:0] Q[16]
load net u_m1_line_buffer|line_buf2_reg[11]__0[5] -attr @name line_buf2_reg[11]__0[5] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] D[5]
load net u_m1_line_buffer|line_buf2_reg[27]__0[3] -attr @name line_buf2_reg[27]__0[3] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[8]__0[0] -attr @name line_buf1_reg[8]__0[0] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[3]__0[3] -attr @name line_buf2_reg[3]__0[3] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] D[3]
load net u_m3_mac|acc_r0[17] -attr @rip(#000000) O[17] -attr @name acc_r0[17] -pin u_m3_mac|acc_r0_i O[17] -pin u_m3_mac|acc_r_reg[19:0] D[17]
load net u_m1_line_buffer|line_buf2_reg[6]__0[5] -attr @name line_buf2_reg[6]__0[5] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[12]__0[0] -attr @name line_buf1_reg[12]__0[0] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] D[0]
load net u_m3_mac|slot[0] -attr @rip(#000000) O[0] -attr @name slot[0] -pin u_m3_mac|insph_s0_i I0[0] -pin u_m3_mac|insph_s0_i__0 I0[0] -pin u_m3_mac|slot_i O[0]
load net u_m1_line_buffer|line_buf1_reg[24]__0[7] -attr @name line_buf1_reg[24]__0[7] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] D[7]
load net u_m3_mac|q_f2[2] -attr @rip(#000000) 2 -attr @name q_f2[2] -pin u_m3_mac|b_mux_i I2[2] -pin u_m3_mac|q_f2_reg[7:0] Q[2]
load net u_m3_mac|word_f[13] -attr @rip(#000000) 13 -attr @name word_f[13] -pin u_m3_mac|ring_50_i I0[13] -pin u_m3_mac|word_f_reg[24:0] Q[13]
load net u_m7_fifo|output_pixel[3] -attr @rip(#000000) 3 -attr @name output_pixel[3] -hierPin u_m7_fifo output_pixel[3] -pin u_m7_fifo|output_pixel_reg[15:0] Q[3]
load net u_m3_mac|ring_3[16] -attr @name ring_3[16] -pin u_m3_mac|ring_2_reg[24:0] D[16] -pin u_m3_mac|ring_3_reg[24:0] Q[16]
load net u_m3_mac|s4_c[0] -attr @name s4_c[0] -pin u_m3_mac|s4_c_reg[17:0] Q[0] -pin u_m3_mac|sum_c2_reg[17:0] D[0]
load net u_m3_mac|dsp_p[5] -attr @rip(#000000) p[5] -attr @name dsp_p[5] -pin u_m3_mac|acc_b0_i I1[5] -pin u_m3_mac|acc_c0_i I1[5] -pin u_m3_mac|u_dsp p[5]
load net u_m3_mac|t20[10] -attr @rip(#000000) O[10] -attr @name t20[10] -pin u_m3_mac|t20_i O[10] -pin u_m3_mac|t2_reg[18:0] D[10]
load net u_m3_mac|u_dsp|m_r[27] -attr @rip(#000000) 27 -attr @name m_r[27] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[27] -pin u_m3_mac|u_dsp|p0_i I0[27]
load net u_m1_line_buffer|line_buf1_reg[0]__0[2] -attr @name line_buf1_reg[0]__0[2] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] D[2]
load net u_m1_line_buffer|line_buf2_reg[0]__0[4] -attr @name line_buf2_reg[0]__0[4] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] D[4]
load net u_m3_mac|ring_5[4] -attr @name ring_5[4] -pin u_m3_mac|ring_4_reg[24:0] D[4] -pin u_m3_mac|ring_5_reg[24:0] Q[4]
load net u_m3_mac|s3_a[12] -attr @name s3_a[12] -pin u_m3_mac|s3_a_reg[17:0] Q[12] -pin u_m3_mac|s4_a_reg[17:0] D[12]
load net u_m3_mac|wv[3] -attr @name wv[3] -pin u_m3_mac|wv_reg[6:1] D[4] -pin u_m3_mac|wv_reg[6:1] Q[3]
load net u_m1_line_buffer|line_buf2_reg[1]__0[0] -attr @name line_buf2_reg[1]__0[0] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] D[0]
load net u_m3_mac|col_row1[6] -attr @rip(#000000) col_row1[6] -attr @name col_row1[6] -hierPin u_m3_mac col_row1[6] -pin u_m3_mac|q_s1_reg[7:0] D[6]
load net u_m3_mac|frame_a[5] -attr @name frame_a[5] -pin u_m3_mac|frame_a_reg[17:0] Q[5] -pin u_m3_mac|s3_a_reg[17:0] D[5]
load net u_m3_mac|frame_b[12] -attr @name frame_b[12] -pin u_m3_mac|frame_b_reg[17:0] Q[12] -pin u_m3_mac|s3_b_reg[17:0] D[12]
load net u_m3_mac|q_s0[1] -attr @name q_s0[1] -pin u_m3_mac|q_f0_reg[7:0] D[1] -pin u_m3_mac|q_s0_reg[7:0] Q[1]
load net prev_row1_pixel[6] -attr @rip(#000000) prev_row1_pixel[6] -pin u_m1_line_buffer prev_row1_pixel[6] -pin u_m3_mac col_row1[6]
load net u_m3_mac|dsp_p[26] -attr @rip(#000000) p[26] -attr @name dsp_p[26] -pin u_m3_mac|acc_a0_i I1[10] -pin u_m3_mac|u_dsp p[26]
load net u_m3_mac|sum_c1[16] -attr @rip(#000000) 16 -attr @name sum_c1[16] -pin u_m3_mac|sum_c1_reg[17:0] Q[16] -pin u_m3_mac|t20_i I1[16]
load net u_m3_mac|t1[1] -attr @rip(#000000) 1 -attr @name t1[1] -pin u_m3_mac|t1_reg[17:0] Q[1] -pin u_m3_mac|t20_i I0[1]
load net u_m3_mac|tog_s -attr @name tog_s -pin u_m3_mac|tog_f1_reg D -pin u_m3_mac|tog_s0_i I0 -pin u_m3_mac|tog_s_reg Q
netloc u_m3_mac|tog_s 1 0 3 5320 138 NJ 138 5820
load net output_valid -port output_valid -pin u_m7_fifo output_valid
netloc output_valid 1 7 2 18080J 230 NJ
load net u_m4_kernel_storage|tap_idx[3] -attr @rip(#000000) 3 -attr @name tap_idx[3] -hierPin u_m4_kernel_storage tap_idx[3] -pin u_m4_kernel_storage|tap_idx_reg[3:0] Q[3]
load net u_m1_line_buffer|line_buf1_reg[1]__0[5] -attr @name line_buf1_reg[1]__0[5] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] D[5]
load net u_m3_mac|mac_result[8] -attr @rip(#000000) 8 -attr @name mac_result[8] -hierPin u_m3_mac mac_result[8] -pin u_m3_mac|acc_r_reg[19:0] Q[8]
load net u_m3_mac|u_dsp|m_r0[11] -attr @rip(#000000) O[11] -attr @name m_r0[11] -pin u_m3_mac|u_dsp|m_r0_i O[11] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[11]
load net u_m2_window_generator|<const0> -ground -attr @name <const0> -pin u_m2_window_generator|col_ge_i I0[0] -pin u_m2_window_generator|col_ge_i I1[1] -pin u_m2_window_generator|col_ge_i I1[0] -pin u_m2_window_generator|col_ge_i__0 I0[1] -pin u_m2_window_generator|col_ge_i__0 I1[1] -pin u_m2_window_generator|col_ge_i__0 I1[0] -pin u_m2_window_generator|col_ge_reg[1:0] D[0] -pin u_m2_window_generator|row_ge_i I0[0] -pin u_m2_window_generator|row_ge_i I1[1] -pin u_m2_window_generator|row_ge_i I1[0] -pin u_m2_window_generator|row_ge_i__0 I0[1] -pin u_m2_window_generator|row_ge_i__0 I1[1] -pin u_m2_window_generator|row_ge_i__0 I1[0] -pin u_m2_window_generator|row_ge_reg[1:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[27]__0[7] -attr @name line_buf2_reg[27]__0[7] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] D[7]
load net u_m3_mac|s3_c[13] -attr @name s3_c[13] -pin u_m3_mac|s3_c_reg[17:0] Q[13] -pin u_m3_mac|s4_c_reg[17:0] D[13]
load net u_m1_line_buffer|line_buf1_reg[14]__0[6] -attr @name line_buf1_reg[14]__0[6] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[18]__0[5] -attr @name line_buf2_reg[18]__0[5] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] D[5]
load net u_m3_mac|ring_2[3] -attr @name ring_2[3] -pin u_m3_mac|ring_1_reg[24:0] D[3] -pin u_m3_mac|ring_2_reg[24:0] Q[3]
load net u_m1_line_buffer|line_buf2_reg[11]__0[2] -attr @name line_buf2_reg[11]__0[2] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] D[2]
load net u_m3_mac|t2[17] -attr @rip(#000000) 17 -attr @name t2[17] -pin u_m3_mac|acc_r0_i I0[17] -pin u_m3_mac|t2_reg[18:0] Q[17]
load net u_m1_line_buffer|line_buf1_reg[20]__0[7] -attr @name line_buf1_reg[20]__0[7] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] D[7]
load net u_m3_mac|sum_c0[4] -attr @name sum_c0[4] -pin u_m3_mac|sum_c0_reg[17:0] Q[4] -pin u_m3_mac|t1_reg[17:0] D[4]
load net u_m3_mac|sum_c2[15] -attr @rip(#000000) 15 -attr @name sum_c2[15] -pin u_m3_mac|acc_r0_i I1[15] -pin u_m3_mac|sum_c2_reg[17:0] Q[15]
load net u_m3_mac|acc_r0[16] -attr @rip(#000000) O[16] -attr @name acc_r0[16] -pin u_m3_mac|acc_r0_i O[16] -pin u_m3_mac|acc_r_reg[19:0] D[16]
load net u_m1_line_buffer|line_buf2_reg[9]__0[2] -attr @name line_buf2_reg[9]__0[2] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] D[2] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] Q[2]
load net u_m3_mac|ring_1[20] -attr @name ring_1[20] -pin u_m3_mac|ring_0_reg[24:0] D[20] -pin u_m3_mac|ring_1_reg[24:0] Q[20]
load net u_m7_fifo|output_pixel[0] -attr @rip(#000000) 0 -attr @name output_pixel[0] -hierPin u_m7_fifo output_pixel[0] -pin u_m7_fifo|output_pixel_reg[15:0] Q[0]
load net u_m6_control_fsm|drain_sr0 -attr @name drain_sr0 -pin u_m6_control_fsm|drain_sr0_i O -pin u_m6_control_fsm|drain_sr_reg[6:0] RST
netloc u_m6_control_fsm|drain_sr0 1 3 1 19180
load net u_m3_mac|dsp_p[0] -attr @rip(#000000) p[0] -attr @name dsp_p[0] -pin u_m3_mac|acc_b0_i I1[0] -pin u_m3_mac|acc_c0_i I1[0] -pin u_m3_mac|u_dsp p[0]
load net u_m6_control_fsm|drain_sr1 -attr @name drain_sr1 -pin u_m6_control_fsm|drain_sr0_i I1 -pin u_m6_control_fsm|drain_sr1_i O
netloc u_m6_control_fsm|drain_sr1 1 2 1 NJ
load net u_m1_line_buffer|line_buf1_reg[8]__0[1] -attr @name line_buf1_reg[8]__0[1] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] D[1]
load net u_m1_line_buffer|line_buf2_reg[3]__0[4] -attr @name line_buf2_reg[3]__0[4] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] D[4]
load net u_m3_mac|dsp_p[18] -attr @rip(#000000) p[18] -attr @name dsp_p[18] -pin u_m3_mac|acc_a0_i I1[2] -pin u_m3_mac|u_dsp p[18]
load net u_m3_mac|q_f2[1] -attr @rip(#000000) 1 -attr @name q_f2[1] -pin u_m3_mac|b_mux_i I2[1] -pin u_m3_mac|q_f2_reg[7:0] Q[1]
load net u_m1_line_buffer|line_buf2_reg[6]__0[6] -attr @name line_buf2_reg[6]__0[6] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[2]__0[0] -attr @name line_buf2_reg[2]__0[0] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] D[0]
load net u_m3_mac|word_f[14] -attr @rip(#000000) 14 -attr @name word_f[14] -pin u_m3_mac|ring_50_i I0[14] -pin u_m3_mac|word_f_reg[24:0] Q[14]
load net u_m1_line_buffer|line_buf2_reg[4]__0[2] -attr @name line_buf2_reg[4]__0[2] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[12]__0[3] -attr @name line_buf1_reg[12]__0[3] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] D[3]
load net u_m3_mac|col_row1[3] -attr @rip(#000000) col_row1[3] -attr @name col_row1[3] -hierPin u_m3_mac col_row1[3] -pin u_m3_mac|q_s1_reg[7:0] D[3]
load net u_m3_mac|ring_1[16] -attr @name ring_1[16] -pin u_m3_mac|ring_0_reg[24:0] D[16] -pin u_m3_mac|ring_1_reg[24:0] Q[16]
load net u_m3_mac|ring_3[17] -attr @name ring_3[17] -pin u_m3_mac|ring_2_reg[24:0] D[17] -pin u_m3_mac|ring_3_reg[24:0] Q[17]
load net u_m3_mac|s4_c[1] -attr @name s4_c[1] -pin u_m3_mac|s4_c_reg[17:0] Q[1] -pin u_m3_mac|sum_c2_reg[17:0] D[1]
load net u_m3_mac|u_dsp|m_r[26] -attr @rip(#000000) 26 -attr @name m_r[26] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[26] -pin u_m3_mac|u_dsp|p0_i I0[26]
load net u_m3_mac|frame_a[2] -attr @name frame_a[2] -pin u_m3_mac|frame_a_reg[17:0] Q[2] -pin u_m3_mac|s3_a_reg[17:0] D[2]
load net u_m3_mac|ring_5[3] -attr @name ring_5[3] -pin u_m3_mac|ring_4_reg[24:0] D[3] -pin u_m3_mac|ring_5_reg[24:0] Q[3]
load net u_m3_mac|s3_a[11] -attr @name s3_a[11] -pin u_m3_mac|s3_a_reg[17:0] Q[11] -pin u_m3_mac|s4_a_reg[17:0] D[11]
load net u_m3_mac|wv[2] -attr @name wv[2] -pin u_m3_mac|wv_reg[6:1] D[3] -pin u_m3_mac|wv_reg[6:1] Q[2]
load net prev_row1_pixel[3] -attr @rip(#000000) prev_row1_pixel[3] -pin u_m1_line_buffer prev_row1_pixel[3] -pin u_m3_mac col_row1[3]
load net u_m3_mac|t1[11] -attr @rip(#000000) 11 -attr @name t1[11] -pin u_m3_mac|t1_reg[17:0] Q[11] -pin u_m3_mac|t20_i I0[11]
load net u_m3_mac|t20[11] -attr @rip(#000000) O[11] -attr @name t20[11] -pin u_m3_mac|t20_i O[11] -pin u_m3_mac|t2_reg[18:0] D[11]
load net u_m1_line_buffer|line_buf2_reg[0]__0[5] -attr @name line_buf2_reg[0]__0[5] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] D[5]
load net u_m3_mac|frame_b[11] -attr @name frame_b[11] -pin u_m3_mac|frame_b_reg[17:0] Q[11] -pin u_m3_mac|s3_b_reg[17:0] D[11]
load net u_m3_mac|q_s1[7] -attr @name q_s1[7] -pin u_m3_mac|q_f1_reg[7:0] D[7] -pin u_m3_mac|q_s1_reg[7:0] Q[7]
load net u_m3_mac|dsp_p[25] -attr @rip(#000000) p[25] -attr @name dsp_p[25] -pin u_m3_mac|acc_a0_i I1[9] -pin u_m3_mac|u_dsp p[25]
load net u_m3_mac|frame_c[17] -attr @name frame_c[17] -pin u_m3_mac|frame_c_reg[17:0] Q[17] -pin u_m3_mac|s3_c_reg[17:0] D[17]
load net u_m4_kernel_storage|tap_idx[2] -attr @rip(#000000) 2 -attr @name tap_idx[2] -hierPin u_m4_kernel_storage tap_idx[2] -pin u_m4_kernel_storage|tap_idx_reg[3:0] Q[2]
load net u_m3_mac|ring_2[0] -attr @name ring_2[0] -pin u_m3_mac|ring_1_reg[24:0] D[0] -pin u_m3_mac|ring_2_reg[24:0] Q[0]
load net u_m4_kernel_storage|addr[1] -attr @rip(#000000) O[1] -attr @name addr[1] -pin u_m4_kernel_storage|addr_i O[1] -pin u_m4_kernel_storage|mem_reg RA1[1] -pin u_m4_kernel_storage|mem_reg WA2[1]
load net u_m3_mac|s3_c[12] -attr @name s3_c[12] -pin u_m3_mac|s3_c_reg[17:0] Q[12] -pin u_m3_mac|s4_c_reg[17:0] D[12]
load net u_m3_mac|sum_c1[17] -attr @name sum_c1[17] -pin u_m3_mac|sum_c1_reg[17:0] Q[17] -pin u_m3_mac|t20_i I1[18] -pin u_m3_mac|t20_i I1[17]
load net u_m5_output_handling|relu_enable -attr @name relu_enable -hierPin u_m5_output_handling relu_enable -pin u_m5_output_handling|final_output0_i I0
netloc u_m5_output_handling|relu_enable 1 0 2 NJ 314 N
load net u_m3_mac|mac_result[9] -attr @rip(#000000) 9 -attr @name mac_result[9] -hierPin u_m3_mac mac_result[9] -pin u_m3_mac|acc_r_reg[19:0] Q[9]
load net u_m3_mac|word_f[24] -attr @rip(#000000) 24 -attr @name word_f[24] -pin u_m3_mac|ring_50_i I0[24] -pin u_m3_mac|word_f_reg[24:0] Q[24]
load net u_m3_mac|u_dsp|m_r0[12] -attr @rip(#000000) O[12] -attr @name m_r0[12] -pin u_m3_mac|u_dsp|m_r0_i O[12] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[12]
load net u_m1_line_buffer|prev_row1_pixel[0] -attr @rip(#000000) 0 -attr @name prev_row1_pixel[0] -hierPin u_m1_line_buffer prev_row1_pixel[0] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] D[0]
load net u_m3_mac|t2[16] -attr @rip(#000000) 16 -attr @name t2[16] -pin u_m3_mac|acc_r0_i I0[16] -pin u_m3_mac|t2_reg[18:0] Q[16]
load net u_m2_window_generator|col_ge_i__0_n_0 -attr @rip O[1] -attr @name col_ge_i__0_n_0 -pin u_m2_window_generator|col_ge_i__0 O[1]
load net u_m3_mac|sum_c2[14] -attr @rip(#000000) 14 -attr @name sum_c2[14] -pin u_m3_mac|acc_r0_i I1[14] -pin u_m3_mac|sum_c2_reg[17:0] Q[14]
load net u_m3_mac|u_dsp|a_r[3] -attr @rip(#000000) 3 -attr @name a_r[3] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[3] -pin u_m3_mac|u_dsp|m_r0_i I0[3]
load net u_m1_line_buffer|line_buf2_reg[3]__0[1] -attr @name line_buf2_reg[3]__0[1] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] D[1]
load net u_m3_mac|acc_r0[15] -attr @rip(#000000) O[15] -attr @name acc_r0[15] -pin u_m3_mac|acc_r0_i O[15] -pin u_m3_mac|acc_r_reg[19:0] D[15]
load net u_m4_kernel_storage|kernel_wr_data[7] -attr @rip(#000000) kernel_wr_data[7] -attr @name kernel_wr_data[7] -hierPin u_m4_kernel_storage kernel_wr_data[7] -pin u_m4_kernel_storage|mem_reg WD2[7]
load net u_m1_line_buffer|line_buf2_reg[11]__0[3] -attr @name line_buf2_reg[11]__0[3] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] D[3]
load net u_m2_window_generator|col_ge_i__0_n_1 -attr @rip O[0] -attr @name col_ge_i__0_n_1 -pin u_m2_window_generator|col_ge_i__0 O[0] -pin u_m2_window_generator|col_ge_reg[1:0] SET[0]
load net u_m3_mac|ring_3[1] -attr @name ring_3[1] -pin u_m3_mac|ring_2_reg[24:0] D[1] -pin u_m3_mac|ring_3_reg[24:0] Q[1]
load net u_m4_kernel_storage|tap_valid -attr @name tap_valid -hierPin u_m4_kernel_storage tap_valid -pin u_m4_kernel_storage|tap_valid_reg Q
netloc u_m4_kernel_storage|tap_valid 1 11 1 N
load net u_m3_mac|acc_a[4] -attr @rip(#000000) 4 -attr @name acc_a[4] -pin u_m3_mac|acc_a_reg[17:0] Q[4] -pin u_m3_mac|base_a_i I1[4] -pin u_m3_mac|frame_a_reg[17:0] D[4]
load net u_m1_line_buffer|line_buf1_reg[24]__0[5] -attr @name line_buf1_reg[24]__0[5] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] D[5]
load net u_m3_mac|base_c[12] -attr @rip(#000000) O[12] -attr @name base_c[12] -pin u_m3_mac|acc_c0_i I0[12] -pin u_m3_mac|base_c_i O[12]
load net u_m3_mac|ring_52 -attr @name ring_52 -pin u_m3_mac|ring_50_i S -pin u_m3_mac|ring_52_i O
netloc u_m3_mac|ring_52 1 8 1 7460
load net u_m7_fifo|output_pixel[1] -attr @rip(#000000) 1 -attr @name output_pixel[1] -hierPin u_m7_fifo output_pixel[1] -pin u_m7_fifo|output_pixel_reg[15:0] Q[1]
load net u_m3_mac|base_c[8] -attr @rip(#000000) O[8] -attr @name base_c[8] -pin u_m3_mac|acc_c0_i I0[8] -pin u_m3_mac|base_c_i O[8]
load net u_m3_mac|ring_53 -attr @name ring_53 -pin u_m3_mac|ring_52_i I1 -pin u_m3_mac|ring_53_i O
netloc u_m3_mac|ring_53 1 7 1 7300
load net u_m1_line_buffer|line_buf2_reg[14]__0[3] -attr @name line_buf2_reg[14]__0[3] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[8]__0[2] -attr @name line_buf1_reg[8]__0[2] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] D[2]
load net u_m1_line_buffer|line_buf2_reg[28]__0[6] -attr @name line_buf2_reg[28]__0[6] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] D[6]
load net u_m3_mac|dsp_p[19] -attr @rip(#000000) p[19] -attr @name dsp_p[19] -pin u_m3_mac|acc_a0_i I1[3] -pin u_m3_mac|u_dsp p[19]
load net u_m1_line_buffer|line_buf1_reg[12]__0[2] -attr @name line_buf1_reg[12]__0[2] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] D[2]
load net u_m3_mac|acc_b[0] -attr @rip(#000000) 0 -attr @name acc_b[0] -pin u_m3_mac|acc_b_reg[17:0] Q[0] -pin u_m3_mac|base_b_i I1[0] -pin u_m3_mac|frame_b_reg[17:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[6]__0[7] -attr @name line_buf2_reg[6]__0[7] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] D[7]
load net u_m3_mac|slot[2] -attr @rip(#000000) O[2] -attr @name slot[2] -pin u_m3_mac|insph_s0_i I0[2] -pin u_m3_mac|insph_s0_i__0 I0[2] -pin u_m3_mac|slot_i O[2]
load net u_m1_line_buffer|line_buf1_reg[0]__0[0] -attr @name line_buf1_reg[0]__0[0] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[2]__0[1] -attr @name line_buf2_reg[2]__0[1] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] D[1]
load net u_m3_mac|ring_5[2] -attr @name ring_5[2] -pin u_m3_mac|ring_4_reg[24:0] D[2] -pin u_m3_mac|ring_5_reg[24:0] Q[2]
load net u_m3_mac|s3_a[10] -attr @name s3_a[10] -pin u_m3_mac|s3_a_reg[17:0] Q[10] -pin u_m3_mac|s4_a_reg[17:0] D[10]
load net u_m3_mac|word_f[15] -attr @rip(#000000) 15 -attr @name word_f[15] -pin u_m3_mac|ring_50_i I0[15] -pin u_m3_mac|word_f_reg[24:0] Q[15]
load net u_m1_line_buffer|line_buf1_reg[18]__0[6] -attr @name line_buf1_reg[18]__0[6] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[4]__0[3] -attr @name line_buf2_reg[4]__0[3] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] D[3]
load net u_m3_mac|col_row1[4] -attr @rip(#000000) col_row1[4] -attr @name col_row1[4] -hierPin u_m3_mac col_row1[4] -pin u_m3_mac|q_s1_reg[7:0] D[4]
load net u_m3_mac|ring_1[17] -attr @name ring_1[17] -pin u_m3_mac|ring_0_reg[24:0] D[17] -pin u_m3_mac|ring_1_reg[24:0] Q[17]
load net u_m3_mac|ring_3[18] -attr @name ring_3[18] -pin u_m3_mac|ring_2_reg[24:0] D[18] -pin u_m3_mac|ring_3_reg[24:0] Q[18]
load net u_m3_mac|frame_a[3] -attr @name frame_a[3] -pin u_m3_mac|frame_a_reg[17:0] Q[3] -pin u_m3_mac|s3_a_reg[17:0] D[3]
load net u_m3_mac|frame_b[10] -attr @name frame_b[10] -pin u_m3_mac|frame_b_reg[17:0] Q[10] -pin u_m3_mac|s3_b_reg[17:0] D[10]
load net u_m4_kernel_storage|kernel_wr_en -attr @name kernel_wr_en -hierPin u_m4_kernel_storage kernel_wr_en -pin u_m4_kernel_storage|wr_enable0_i I0
netloc u_m4_kernel_storage|kernel_wr_en 1 0 2 NJ 1362 1900
load net u_m1_line_buffer|line_buf1_reg[29]__0[5] -attr @name line_buf1_reg[29]__0[5] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] D[5]
load net prev_row1_pixel[4] -attr @rip(#000000) prev_row1_pixel[4] -pin u_m1_line_buffer prev_row1_pixel[4] -pin u_m3_mac col_row1[4]
load net final_output[0] -attr @rip(#000000) final_output[0] -pin u_m5_output_handling final_output[0] -pin u_m7_fifo final_output[0]
load net u_m3_mac|sum_c1[14] -attr @rip(#000000) 14 -attr @name sum_c1[14] -pin u_m3_mac|sum_c1_reg[17:0] Q[14] -pin u_m3_mac|t20_i I1[14]
load net u_m3_mac|t1[12] -attr @rip(#000000) 12 -attr @name t1[12] -pin u_m3_mac|t1_reg[17:0] Q[12] -pin u_m3_mac|t20_i I0[12]
load net u_m3_mac|t20[12] -attr @rip(#000000) O[12] -attr @name t20[12] -pin u_m3_mac|t20_i O[12] -pin u_m3_mac|t2_reg[18:0] D[12]
load net u_m3_mac|u_dsp|m_r[29] -attr @rip(#000000) 29 -attr @name m_r[29] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[29] -pin u_m3_mac|u_dsp|p0_i I0[29]
load net u_m4_kernel_storage|tap_idx[1] -attr @rip(#000000) 1 -attr @name tap_idx[1] -hierPin u_m4_kernel_storage tap_idx[1] -pin u_m4_kernel_storage|tap_idx_reg[3:0] Q[1]
load net u_m3_mac|mac_result[6] -attr @rip(#000000) 6 -attr @name mac_result[6] -hierPin u_m3_mac mac_result[6] -pin u_m3_mac|acc_r_reg[19:0] Q[6]
load net u_m3_mac|wv[5] -attr @name wv[5] -pin u_m3_mac|wv_reg[6:1] D[6] -pin u_m3_mac|wv_reg[6:1] Q[5]
load net u_m3_mac|acc_b0[0] -attr @rip(#000000) O[0] -attr @name acc_b0[0] -pin u_m3_mac|acc_b0_i O[0] -pin u_m3_mac|acc_b_reg[17:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[27]__0[5] -attr @name line_buf2_reg[27]__0[5] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] D[5]
load net u_m3_mac|ring_2[1] -attr @name ring_2[1] -pin u_m3_mac|ring_1_reg[24:0] D[1] -pin u_m3_mac|ring_2_reg[24:0] Q[1]
load net u_m3_mac|word_f[23] -attr @rip(#000000) 23 -attr @name word_f[23] -pin u_m3_mac|ring_50_i I0[23] -pin u_m3_mac|word_f_reg[24:0] Q[23]
load net u_m1_line_buffer|line_buf2_reg[11]__0[0] -attr @name line_buf2_reg[11]__0[0] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] D[0]
load net u_m4_kernel_storage|addr[2] -attr @rip(#000000) O[2] -attr @name addr[2] -pin u_m4_kernel_storage|addr_i O[2] -pin u_m4_kernel_storage|mem_reg RA1[2] -pin u_m4_kernel_storage|mem_reg WA2[2]
load net u_m3_mac|dsp_p[28] -attr @rip(#000000) p[28] -attr @name dsp_p[28] -pin u_m3_mac|acc_a0_i I1[12] -pin u_m3_mac|u_dsp p[28]
load net u_m3_mac|sum_c2[13] -attr @rip(#000000) 13 -attr @name sum_c2[13] -pin u_m3_mac|acc_r0_i I1[13] -pin u_m3_mac|sum_c2_reg[17:0] Q[13]
load net u_m3_mac|u_dsp|<const1> -power -attr @rip(#000000) 15 -attr @name <const1> -pin u_m3_mac|u_dsp|p0_i I1[15]
load net u_m3_mac|u_dsp|a_r[2] -attr @rip(#000000) 2 -attr @name a_r[2] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[2] -pin u_m3_mac|u_dsp|m_r0_i I0[2]
load net u_m3_mac|u_dsp|m_r0[13] -attr @rip(#000000) O[13] -attr @name m_r0[13] -pin u_m3_mac|u_dsp|m_r0_i O[13] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[13]
load net u_m3_mac|acc_r0[14] -attr @rip(#000000) O[14] -attr @name acc_r0[14] -pin u_m3_mac|acc_r0_i O[14] -pin u_m3_mac|acc_r_reg[19:0] D[14]
load net u_m4_kernel_storage|kernel_wr_data[6] -attr @rip(#000000) kernel_wr_data[6] -attr @name kernel_wr_data[6] -hierPin u_m4_kernel_storage kernel_wr_data[6] -pin u_m4_kernel_storage|mem_reg WD2[6]
load net u_m1_line_buffer|line_buf2_reg[9]__0[0] -attr @name line_buf2_reg[9]__0[0] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] D[0] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] Q[0]
load net u_m1_line_buffer|line_buf2_reg[18]__0[7] -attr @name line_buf2_reg[18]__0[7] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] D[7]
load net u_m1_line_buffer|line_buf2_reg[3]__0[2] -attr @name line_buf2_reg[3]__0[2] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] D[2]
load net u_m3_mac|base_c[11] -attr @rip(#000000) O[11] -attr @name base_c[11] -pin u_m3_mac|acc_c0_i I0[11] -pin u_m3_mac|base_c_i O[11]
load net u_m3_mac|dsp_p[16] -attr @rip(#000000) p[16] -attr @name dsp_p[16] -pin u_m3_mac|acc_a0_i I1[0] -pin u_m3_mac|u_dsp p[16]
load net u_m3_mac|frame_b[5] -attr @name frame_b[5] -pin u_m3_mac|frame_b_reg[17:0] Q[5] -pin u_m3_mac|s3_b_reg[17:0] D[5]
load net u_m3_mac|ring_3[2] -attr @name ring_3[2] -pin u_m3_mac|ring_2_reg[24:0] D[2] -pin u_m3_mac|ring_3_reg[24:0] Q[2]
load net u_m3_mac|acc_a[5] -attr @rip(#000000) 5 -attr @name acc_a[5] -pin u_m3_mac|acc_a_reg[17:0] Q[5] -pin u_m3_mac|base_a_i I1[5] -pin u_m3_mac|frame_a_reg[17:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[24]__0[6] -attr @name line_buf1_reg[24]__0[6] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] D[6]
load net u_m4_kernel_storage|changed -attr @name changed -pin u_m4_kernel_storage|changed_i O -pin u_m4_kernel_storage|sweep_left_reg[9:0] SET
netloc u_m4_kernel_storage|changed 1 4 1 2700
load net u_m3_mac|base_c[9] -attr @rip(#000000) O[9] -attr @name base_c[9] -pin u_m3_mac|acc_c0_i I0[9] -pin u_m3_mac|base_c_i O[9]
load net u_m3_mac|col_row1[1] -attr @rip(#000000) col_row1[1] -attr @name col_row1[1] -hierPin u_m3_mac col_row1[1] -pin u_m3_mac|q_s1_reg[7:0] D[1]
load net u_m3_mac|dsp_p[2] -attr @rip(#000000) p[2] -attr @name dsp_p[2] -pin u_m3_mac|acc_b0_i I1[2] -pin u_m3_mac|acc_c0_i I1[2] -pin u_m3_mac|u_dsp p[2]
load net u_m3_mac|ring_1[14] -attr @name ring_1[14] -pin u_m3_mac|ring_0_reg[24:0] D[14] -pin u_m3_mac|ring_1_reg[24:0] Q[14]
load net u_m3_mac|slot[1] -attr @rip(#000000) O[1] -attr @name slot[1] -pin u_m3_mac|insph_s0_i I0[1] -pin u_m3_mac|insph_s0_i__0 I0[1] -pin u_m3_mac|slot_i O[1]
load net u_m1_line_buffer|line_buf2_reg[28]__0[7] -attr @name line_buf2_reg[28]__0[7] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] D[7]
load net u_m1_line_buffer|line_buf2_reg[14]__0[4] -attr @name line_buf2_reg[14]__0[4] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] D[4]
load net u_m3_mac|ring_5[1] -attr @name ring_5[1] -pin u_m3_mac|ring_4_reg[24:0] D[1] -pin u_m3_mac|ring_5_reg[24:0] Q[1]
load net u_m3_mac|acc_b[1] -attr @rip(#000000) 1 -attr @name acc_b[1] -pin u_m3_mac|acc_b_reg[17:0] Q[1] -pin u_m3_mac|base_b_i I1[1] -pin u_m3_mac|frame_b_reg[17:0] D[1]
load net prev_row1_pixel[1] -attr @rip(#000000) prev_row1_pixel[1] -pin u_m1_line_buffer prev_row1_pixel[1] -pin u_m3_mac col_row1[1]
load net u_m1_line_buffer|line_buf2_reg[2]__0[2] -attr @name line_buf2_reg[2]__0[2] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] D[2]
load net u_m3_mac|word_f[16] -attr @rip(#000000) 16 -attr @name word_f[16] -pin u_m3_mac|ring_50_i I0[16] -pin u_m3_mac|word_f_reg[24:0] Q[16]
load net u_m7_fifo|output_pixel[6] -attr @rip(#000000) 6 -attr @name output_pixel[6] -hierPin u_m7_fifo output_pixel[6] -pin u_m7_fifo|output_pixel_reg[15:0] Q[6]
load net u_m1_line_buffer|line_buf1_reg[18]__0[7] -attr @name line_buf1_reg[18]__0[7] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[29]__0[4] -attr @name line_buf1_reg[29]__0[4] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[4]__0[4] -attr @name line_buf2_reg[4]__0[4] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] D[4]
load net u_m3_mac|ring_3[19] -attr @name ring_3[19] -pin u_m3_mac|ring_2_reg[24:0] D[19] -pin u_m3_mac|ring_3_reg[24:0] Q[19]
load net u_m3_mac|u_dsp|m_r[28] -attr @rip(#000000) 28 -attr @name m_r[28] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[28] -pin u_m3_mac|u_dsp|p0_i I0[28]
load net u_m4_kernel_storage|tap_idx[0] -attr @rip(#000000) 0 -attr @name tap_idx[0] -hierPin u_m4_kernel_storage tap_idx[0] -pin u_m4_kernel_storage|tap_idx_reg[3:0] Q[0]
load net u_m3_mac|prev_c0[5] -attr @rip(#000000) 5 -attr @name prev_c0[5] -pin u_m3_mac|hi_src_i I0[5] -pin u_m3_mac|prev_c0_reg[7:0] Q[5]
load net u_m3_mac|wv[4] -attr @name wv[4] -pin u_m3_mac|wv_reg[6:1] D[5] -pin u_m3_mac|wv_reg[6:1] Q[4]
load net tap_valid -pin u_m3_mac tap_valid -pin u_m4_kernel_storage tap_valid
netloc tap_valid 1 4 1 5120
load net u_m3_mac|sum_c1[15] -attr @rip(#000000) 15 -attr @name sum_c1[15] -pin u_m3_mac|sum_c1_reg[17:0] Q[15] -pin u_m3_mac|t20_i I1[15]
load net u_m3_mac|t20[13] -attr @rip(#000000) O[13] -attr @name t20[13] -pin u_m3_mac|t20_i O[13] -pin u_m3_mac|t2_reg[18:0] D[13]
load net u_m1_line_buffer|line_buf1_reg[0]__0[5] -attr @name line_buf1_reg[0]__0[5] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] D[5]
load net pixel_valid_in -pin u_m1_line_buffer pixel_valid_in -pin u_m6_control_fsm pixel_valid_in
netloc pixel_valid_in 1 2 7 760 170 1360J 142 5060J 28 13380J 494 14670J 768 18100J 288 20920
load net u_m1_line_buffer|line_buf1_reg[14]__0[3] -attr @name line_buf1_reg[14]__0[3] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] D[3]
load net u_m3_mac|mac_result[7] -attr @rip(#000000) 7 -attr @name mac_result[7] -hierPin u_m3_mac mac_result[7] -pin u_m3_mac|acc_r_reg[19:0] Q[7]
load net u_m3_mac|word_f[22] -attr @rip(#000000) 22 -attr @name word_f[22] -pin u_m3_mac|ring_50_i I0[22] -pin u_m3_mac|word_f_reg[24:0] Q[22]
load net u_m1_line_buffer|line_buf2_reg[1]__0[3] -attr @name line_buf2_reg[1]__0[3] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[27]__0[6] -attr @name line_buf2_reg[27]__0[6] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] D[6]
load net u_m3_mac|dsp_p[27] -attr @rip(#000000) p[27] -attr @name dsp_p[27] -pin u_m3_mac|acc_a0_i I1[11] -pin u_m3_mac|u_dsp p[27]
load net u_m3_mac|acc_r0[5] -attr @rip(#000000) O[5] -attr @name acc_r0[5] -pin u_m3_mac|acc_r0_i O[5] -pin u_m3_mac|acc_r_reg[19:0] D[5]
load net u_m3_mac|sum_c0[1] -attr @name sum_c0[1] -pin u_m3_mac|sum_c0_reg[17:0] Q[1] -pin u_m3_mac|t1_reg[17:0] D[1]
load net u_m3_mac|u_dsp|<const0> -ground -attr @name <const0> -pin u_m3_mac|u_dsp|m_r0_i I1[8] -pin u_m3_mac|u_dsp|p0_i I1[33] -pin u_m3_mac|u_dsp|p0_i I1[32] -pin u_m3_mac|u_dsp|p0_i I1[31] -pin u_m3_mac|u_dsp|p0_i I1[30] -pin u_m3_mac|u_dsp|p0_i I1[29] -pin u_m3_mac|u_dsp|p0_i I1[28] -pin u_m3_mac|u_dsp|p0_i I1[27] -pin u_m3_mac|u_dsp|p0_i I1[26] -pin u_m3_mac|u_dsp|p0_i I1[25] -pin u_m3_mac|u_dsp|p0_i I1[24] -pin u_m3_mac|u_dsp|p0_i I1[23] -pin u_m3_mac|u_dsp|p0_i I1[22] -pin u_m3_mac|u_dsp|p0_i I1[21] -pin u_m3_mac|u_dsp|p0_i I1[20] -pin u_m3_mac|u_dsp|p0_i I1[19] -pin u_m3_mac|u_dsp|p0_i I1[18] -pin u_m3_mac|u_dsp|p0_i I1[17] -pin u_m3_mac|u_dsp|p0_i I1[16] -pin u_m3_mac|u_dsp|p0_i I1[14] -pin u_m3_mac|u_dsp|p0_i I1[13] -pin u_m3_mac|u_dsp|p0_i I1[12] -pin u_m3_mac|u_dsp|p0_i I1[11] -pin u_m3_mac|u_dsp|p0_i I1[10] -pin u_m3_mac|u_dsp|p0_i I1[9] -pin u_m3_mac|u_dsp|p0_i I1[8] -pin u_m3_mac|u_dsp|p0_i I1[7] -pin u_m3_mac|u_dsp|p0_i I1[6] -pin u_m3_mac|u_dsp|p0_i I1[5] -pin u_m3_mac|u_dsp|p0_i I1[4] -pin u_m3_mac|u_dsp|p0_i I1[3] -pin u_m3_mac|u_dsp|p0_i I1[2] -pin u_m3_mac|u_dsp|p0_i I1[1] -pin u_m3_mac|u_dsp|p0_i I1[0]
load net u_m3_mac|u_dsp|a_r[1] -attr @rip(#000000) 1 -attr @name a_r[1] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[1] -pin u_m3_mac|u_dsp|m_r0_i I0[1]
load net u_m1_line_buffer|line_buf2_reg[11]__0[1] -attr @name line_buf2_reg[11]__0[1] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] D[1]
load net u_m4_kernel_storage|addr[3] -attr @rip(#000000) O[3] -attr @name addr[3] -pin u_m4_kernel_storage|addr_i O[3] -pin u_m4_kernel_storage|mem_reg RA1[3] -pin u_m4_kernel_storage|mem_reg WA2[3]
load net u_m3_mac|tap_valid -attr @name tap_valid -hierPin u_m3_mac tap_valid -pin u_m3_mac|ld_s0_i I0 -pin u_m3_mac|prev_c00_i I0
netloc u_m3_mac|tap_valid 1 0 5 NJ 908 NJ 908 5840 878 NJ 878 6410J
load net u_m3_mac|u_dsp|m_r0[14] -attr @rip(#000000) O[14] -attr @name m_r0[14] -pin u_m3_mac|u_dsp|m_r0_i O[14] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[14]
load net u_m3_mac|acc_a[2] -attr @rip(#000000) 2 -attr @name acc_a[2] -pin u_m3_mac|acc_a_reg[17:0] Q[2] -pin u_m3_mac|base_a_i I1[2] -pin u_m3_mac|frame_a_reg[17:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[24]__0[3] -attr @name line_buf1_reg[24]__0[3] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] D[3]
load net u_m3_mac|t2[0] -attr @rip(#000000) 0 -attr @name t2[0] -pin u_m3_mac|acc_r0_i I0[0] -pin u_m3_mac|t2_reg[18:0] Q[0]
load net u_m3_mac|t2[18] -attr @name t2[18] -pin u_m3_mac|acc_r0_i I0[19] -pin u_m3_mac|acc_r0_i I0[18] -pin u_m3_mac|t2_reg[18:0] Q[18]
load net u_m1_line_buffer|line_buf2_reg[28]__0[4] -attr @name line_buf2_reg[28]__0[4] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[14]__0[1] -attr @name line_buf2_reg[14]__0[1] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] D[1]
load net u_m3_mac|dsp_p[17] -attr @rip(#000000) p[17] -attr @name dsp_p[17] -pin u_m3_mac|acc_a0_i I1[1] -pin u_m3_mac|u_dsp p[17]
load net u_m3_mac|frame_b[6] -attr @name frame_b[6] -pin u_m3_mac|frame_b_reg[17:0] Q[6] -pin u_m3_mac|s3_b_reg[17:0] D[6]
load net u_m3_mac|dsp_p[1] -attr @rip(#000000) p[1] -attr @name dsp_p[1] -pin u_m3_mac|acc_b0_i I1[1] -pin u_m3_mac|acc_c0_i I1[1] -pin u_m3_mac|u_dsp p[1]
load net u_m3_mac|ring_0[7] -attr @rip(#000000) 7 -attr @name ring_0[7] -pin u_m3_mac|ring_0_reg[24:0] Q[7] -pin u_m3_mac|ring_50_i I1[7] -pin u_m3_mac|u_dsp a[7]
load net u_m1_line_buffer|line_buf1_reg[2]__0[3] -attr @name line_buf1_reg[2]__0[3] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[0]__0[0] -attr @name line_buf2_reg[0]__0[0] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[15]__0[0] -attr @name line_buf1_reg[15]__0[0] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] D[0]
load net curr_row_pixel[0] -attr @rip(#000000) curr_row_pixel[0] -pin u_m1_line_buffer curr_row_pixel[0] -pin u_m3_mac col_row2[0]
load net u_m3_mac|base_c[14] -attr @rip(#000000) O[14] -attr @name base_c[14] -pin u_m3_mac|acc_c0_i I0[14] -pin u_m3_mac|base_c_i O[14]
load net u_m3_mac|col_row1[2] -attr @rip(#000000) col_row1[2] -attr @name col_row1[2] -hierPin u_m3_mac col_row1[2] -pin u_m3_mac|q_s1_reg[7:0] D[2]
load net u_m3_mac|ring_1[15] -attr @name ring_1[15] -pin u_m3_mac|ring_0_reg[24:0] D[15] -pin u_m3_mac|ring_1_reg[24:0] Q[15]
load net u_m3_mac|acc_b[2] -attr @rip(#000000) 2 -attr @name acc_b[2] -pin u_m3_mac|acc_b_reg[17:0] Q[2] -pin u_m3_mac|base_b_i I1[2] -pin u_m3_mac|frame_b_reg[17:0] D[2]
load net prev_row1_pixel[2] -attr @rip(#000000) prev_row1_pixel[2] -pin u_m1_line_buffer prev_row1_pixel[2] -pin u_m3_mac col_row1[2]
load net u_m3_mac|t1[10] -attr @rip(#000000) 10 -attr @name t1[10] -pin u_m3_mac|t1_reg[17:0] Q[10] -pin u_m3_mac|t20_i I0[10]
load net u_m1_line_buffer|line_buf2_reg[2]__0[3] -attr @name line_buf2_reg[2]__0[3] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] D[3]
load net u_m3_mac|prev_c0[4] -attr @rip(#000000) 4 -attr @name prev_c0[4] -pin u_m3_mac|hi_src_i I0[4] -pin u_m3_mac|prev_c0_reg[7:0] Q[4]
load net u_m7_fifo|output_pixel[7] -attr @rip(#000000) 7 -attr @name output_pixel[7] -hierPin u_m7_fifo output_pixel[7] -pin u_m7_fifo|output_pixel_reg[15:0] Q[7]
load net u_m1_line_buffer|line_buf2_reg[4]__0[5] -attr @name line_buf2_reg[4]__0[5] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[14]__0[2] -attr @name line_buf1_reg[14]__0[2] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[29]__0[7] -attr @name line_buf1_reg[29]__0[7] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] D[7]
load net final_output[2] -attr @rip(#000000) final_output[2] -pin u_m5_output_handling final_output[2] -pin u_m7_fifo final_output[2]
load net u_m3_mac|t20[14] -attr @rip(#000000) O[14] -attr @name t20[14] -pin u_m3_mac|t20_i O[14] -pin u_m3_mac|t2_reg[18:0] D[14]
load net u_m3_mac|t2[13] -attr @rip(#000000) 13 -attr @name t2[13] -pin u_m3_mac|acc_r0_i I0[13] -pin u_m3_mac|t2_reg[18:0] Q[13]
load net u_m1_line_buffer|line_buf1_reg[0]__0[6] -attr @name line_buf1_reg[0]__0[6] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] D[6]
load net u_m3_mac|ring_5[8] -attr @name ring_5[8] -pin u_m3_mac|ring_4_reg[24:0] D[8] -pin u_m3_mac|ring_5_reg[24:0] Q[8]
load net u_m3_mac|sum_c0[0] -attr @name sum_c0[0] -pin u_m3_mac|sum_c0_reg[17:0] Q[0] -pin u_m3_mac|t1_reg[17:0] D[0]
load net u_m3_mac|u_dsp|a_r[0] -attr @rip(#000000) 0 -attr @name a_r[0] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[0] -pin u_m3_mac|u_dsp|m_r0_i I0[0]
load net u_m1_line_buffer|line_buf2_reg[1]__0[4] -attr @name line_buf2_reg[1]__0[4] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] D[4]
load net u_m3_mac|acc_c[2] -attr @rip(#000000) 2 -attr @name acc_c[2] -pin u_m3_mac|acc_c_reg[17:0] Q[2] -pin u_m3_mac|base_c_i I1[2] -pin u_m3_mac|frame_c_reg[17:0] D[2]
load net u_m4_kernel_storage|rd_tap1[3] -attr @rip(#000000) O[3] -attr @name rd_tap1[3] -pin u_m4_kernel_storage|rd_tap0_i I1[3] -pin u_m4_kernel_storage|rd_tap1_i O[3]
load net u_m3_mac|acc_r0[6] -attr @rip(#000000) O[6] -attr @name acc_r0[6] -pin u_m3_mac|acc_r0_i O[6] -pin u_m3_mac|acc_r_reg[19:0] D[6]
load net u_m3_mac|p_2_in -attr @rip(#000000) O[5] -attr @name p_2_in -pin u_m3_mac|acc_c0_i__0 I1 -pin u_m3_mac|ph_i O[5]
load net u_m3_mac|t20[9] -attr @rip(#000000) O[9] -attr @name t20[9] -pin u_m3_mac|t20_i O[9] -pin u_m3_mac|t2_reg[18:0] D[9]
load net u_m4_kernel_storage|addr[4] -attr @rip(#000000) O[4] -attr @name addr[4] -pin u_m4_kernel_storage|addr_i O[4] -pin u_m4_kernel_storage|mem_reg RA1[4] -pin u_m4_kernel_storage|mem_reg WA2[4]
load net u_m1_line_buffer|line_buf1_reg[30]__0[7] -attr @name line_buf1_reg[30]__0[7] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] D[7]
load net u_m1_line_buffer|line_buf2_reg[3]__0[0] -attr @name line_buf2_reg[3]__0[0] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[4][7:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[15]__0[2] -attr @name line_buf2_reg[15]__0[2] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] D[2]
load net u_m3_mac|acc_a0 -attr @name acc_a0 -pin u_m3_mac|acc_a0_i__0 O -pin u_m3_mac|acc_a_reg[17:0] CE -pin u_m3_mac|acc_b_reg[17:0] CE
netloc u_m3_mac|acc_a0 1 17 2 10650 918 NJ
load net u_m3_mac|ring_3[0] -attr @name ring_3[0] -pin u_m3_mac|ring_2_reg[24:0] D[0] -pin u_m3_mac|ring_3_reg[24:0] Q[0]
load net u_m3_mac|acc_c0_i_n_10 -attr @rip(#000000) O[7] -attr @name acc_c0_i_n_10 -pin u_m3_mac|acc_c0_i O[7] -pin u_m3_mac|acc_c_reg[17:0] D[7]
load net u_m3_mac|acc_a1 -attr @name acc_a1 -pin u_m3_mac|acc_a0_i__0 I0 -pin u_m3_mac|acc_a1_i O
netloc u_m3_mac|acc_a1 1 16 1 NJ
load net u_m3_mac|mac_result[3] -attr @rip(#000000) 3 -attr @name mac_result[3] -hierPin u_m3_mac mac_result[3] -pin u_m3_mac|acc_r_reg[19:0] Q[3]
load net u_m3_mac|u_dsp|m_r0[15] -attr @rip(#000000) O[15] -attr @name m_r0[15] -pin u_m3_mac|u_dsp|m_r0_i O[15] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[15]
load net u_m5_output_handling|clk -attr @name clk -hierPin u_m5_output_handling clk -pin u_m5_output_handling|final_output_reg[15:0] C -pin u_m5_output_handling|final_output_valid_reg C -pin u_m5_output_handling|rounded_val_r_reg[16:0] C -pin u_m5_output_handling|valid_stage1_reg C
netloc u_m5_output_handling|clk 1 0 3 13640 144 13880 274 14170
load net u_m3_mac|acc_c0_i_n_11 -attr @rip(#000000) O[6] -attr @name acc_c0_i_n_11 -pin u_m3_mac|acc_c0_i O[6] -pin u_m3_mac|acc_c_reg[17:0] D[6]
load net u_m3_mac|acc_a[3] -attr @rip(#000000) 3 -attr @name acc_a[3] -pin u_m3_mac|acc_a_reg[17:0] Q[3] -pin u_m3_mac|base_a_i I1[3] -pin u_m3_mac|frame_a_reg[17:0] D[3]
load net u_clk_gen|clk_fast -attr @name clk_fast -hierPin u_clk_gen clk_fast -pin u_clk_gen|u_bufg_fast O
netloc u_clk_gen|clk_fast 1 1 1 NJ
load net u_m1_line_buffer|line_buf1_reg[24]__0[4] -attr @name line_buf1_reg[24]__0[4] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] D[4]
load net u_m3_mac|base_b[0] -attr @rip(#000000) O[0] -attr @name base_b[0] -pin u_m3_mac|acc_b0_i I0[0] -pin u_m3_mac|base_b_i O[0]
load net u_m3_mac|t2[1] -attr @rip(#000000) 1 -attr @name t2[1] -pin u_m3_mac|acc_r0_i I0[1] -pin u_m3_mac|t2_reg[18:0] Q[1]
load net u_m3_mac|u_dsp|p0[19] -attr @rip(#000000) O[19] -attr @name p0[19] -pin u_m3_mac|u_dsp|p0_i O[19] -pin u_m3_mac|u_dsp|p_reg[33:0] D[19]
load net u_m3_mac|acc_c0_i_n_12 -attr @rip(#000000) O[5] -attr @name acc_c0_i_n_12 -pin u_m3_mac|acc_c0_i O[5] -pin u_m3_mac|acc_c_reg[17:0] D[5]
load net u_m3_mac|frame_c[2] -attr @name frame_c[2] -pin u_m3_mac|frame_c_reg[17:0] Q[2] -pin u_m3_mac|s3_c_reg[17:0] D[2]
load net u_m3_mac|ring_0[6] -attr @rip(#000000) 6 -attr @name ring_0[6] -pin u_m3_mac|ring_0_reg[24:0] Q[6] -pin u_m3_mac|ring_50_i I1[6] -pin u_m3_mac|u_dsp a[6]
load net u_m3_mac|word_f[1] -attr @rip(#000000) 1 -attr @name word_f[1] -pin u_m3_mac|ring_50_i I0[1] -pin u_m3_mac|word_f_reg[24:0] Q[1]
load net u_m7_fifo|pop -attr @name pop -pin u_m7_fifo|fifo_all_outputs_done0_i I0 -pin u_m7_fifo|output_pixel_i I1 -pin u_m7_fifo|output_valid_reg D -pin u_m7_fifo|pop_i O -pin u_m7_fifo|rd_ptr_reg[5:0] CE -pin u_m7_fifo|u_release_count advance
netloc u_m7_fifo|pop 1 4 6 16050 258 NJ 258 NJ 258 16780 268 17140 328 17480
load net u_m1_line_buffer|line_buf2_reg[28]__0[5] -attr @name line_buf2_reg[28]__0[5] -pin u_m1_line_buffer|line_buf2_reg[28][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] D[5]
load net u_m3_mac|acc_c0_i_n_13 -attr @rip(#000000) O[4] -attr @name acc_c0_i_n_13 -pin u_m3_mac|acc_c0_i O[4] -pin u_m3_mac|acc_c_reg[17:0] D[4]
load net u_m4_kernel_storage|mem_reg_n_0 -attr @rip(#000000) RO1[7] -attr @name mem_reg_n_0 -pin u_m4_kernel_storage|mem_reg RO1[7] -pin u_m4_kernel_storage|tap_data_reg[7:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[28]__0[6] -attr @name line_buf1_reg[28]__0[6] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[14]__0[2] -attr @name line_buf2_reg[14]__0[2] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] D[2]
load net u_m3_mac|base_c[13] -attr @rip(#000000) O[13] -attr @name base_c[13] -pin u_m3_mac|acc_c0_i I0[13] -pin u_m3_mac|base_c_i O[13]
load net u_m3_mac|frame_b[7] -attr @name frame_b[7] -pin u_m3_mac|frame_b_reg[17:0] Q[7] -pin u_m3_mac|s3_b_reg[17:0] D[7]
load net u_m3_mac|acc_c0_i_n_14 -attr @rip(#000000) O[3] -attr @name acc_c0_i_n_14 -pin u_m3_mac|acc_c0_i O[3] -pin u_m3_mac|acc_c_reg[17:0] D[3]
load net u_m4_kernel_storage|mem_reg_n_1 -attr @rip(#000000) RO1[6] -attr @name mem_reg_n_1 -pin u_m4_kernel_storage|mem_reg RO1[6] -pin u_m4_kernel_storage|tap_data_reg[7:0] D[6]
load net u_m7_fifo|release_start -attr @name release_start -pin u_m7_fifo|pop0_i I1 -pin u_m7_fifo|release_start_i O
netloc u_m7_fifo|release_start 1 5 1 N
load net u_m3_mac|acc_c0_i_n_15 -attr @rip(#000000) O[2] -attr @name acc_c0_i_n_15 -pin u_m3_mac|acc_c0_i O[2] -pin u_m3_mac|acc_c_reg[17:0] D[2]
load net u_m4_kernel_storage|mem_reg_n_2 -attr @rip(#000000) RO1[5] -attr @name mem_reg_n_2 -pin u_m4_kernel_storage|mem_reg RO1[5] -pin u_m4_kernel_storage|tap_data_reg[7:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[2]__0[4] -attr @name line_buf1_reg[2]__0[4] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[0]__0[1] -attr @name line_buf2_reg[0]__0[1] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] D[1]
load net u_m7_fifo|output_pixel[4] -attr @rip(#000000) 4 -attr @name output_pixel[4] -hierPin u_m7_fifo output_pixel[4] -pin u_m7_fifo|output_pixel_reg[15:0] Q[4]
load net u_m3_mac|acc_c0_i_n_16 -attr @rip(#000000) O[1] -attr @name acc_c0_i_n_16 -pin u_m3_mac|acc_c0_i O[1] -pin u_m3_mac|acc_c_reg[17:0] D[1]
load net u_m4_kernel_storage|mem_reg_n_3 -attr @rip(#000000) RO1[4] -attr @name mem_reg_n_3 -pin u_m4_kernel_storage|mem_reg RO1[4] -pin u_m4_kernel_storage|tap_data_reg[7:0] D[4]
load net u_m3_mac|acc_c0_i_n_17 -attr @rip(#000000) O[0] -attr @name acc_c0_i_n_17 -pin u_m3_mac|acc_c0_i O[0] -pin u_m3_mac|acc_c_reg[17:0] D[0]
load net u_m4_kernel_storage|mem_reg_n_4 -attr @rip(#000000) RO1[3] -attr @name mem_reg_n_4 -pin u_m4_kernel_storage|mem_reg RO1[3] -pin u_m4_kernel_storage|tap_data_reg[7:0] D[3]
load net u_m3_mac|prev_c0[3] -attr @rip(#000000) 3 -attr @name prev_c0[3] -pin u_m3_mac|hi_src_i I0[3] -pin u_m3_mac|prev_c0_reg[7:0] Q[3]
load net u_m3_mac|acc_b[3] -attr @rip(#000000) 3 -attr @name acc_b[3] -pin u_m3_mac|acc_b_reg[17:0] Q[3] -pin u_m3_mac|base_b_i I1[3] -pin u_m3_mac|frame_b_reg[17:0] D[3]
load net u_m4_kernel_storage|mem_reg_n_5 -attr @rip(#000000) RO1[2] -attr @name mem_reg_n_5 -pin u_m4_kernel_storage|mem_reg RO1[2] -pin u_m4_kernel_storage|tap_data_reg[7:0] D[2]
load net u_m4_kernel_storage|mem_reg_n_6 -attr @rip(#000000) RO1[1] -attr @name mem_reg_n_6 -pin u_m4_kernel_storage|mem_reg RO1[1] -pin u_m4_kernel_storage|tap_data_reg[7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[0]__0[3] -attr @name line_buf1_reg[0]__0[3] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] D[3]
load net final_output[1] -attr @rip(#000000) final_output[1] -pin u_m5_output_handling final_output[1] -pin u_m7_fifo final_output[1]
load net u_m1_line_buffer|line_buf2_reg[1]__0[1] -attr @name line_buf2_reg[1]__0[1] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] D[1]
load net u_m4_kernel_storage|mem_reg_n_7 -attr @rip(#000000) RO1[0] -attr @name mem_reg_n_7 -pin u_m4_kernel_storage|mem_reg RO1[0] -pin u_m4_kernel_storage|tap_data_reg[7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[29]__0[6] -attr @name line_buf1_reg[29]__0[6] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] D[6]
load net u_m3_mac|t2[12] -attr @rip(#000000) 12 -attr @name t2[12] -pin u_m3_mac|acc_r0_i I0[12] -pin u_m3_mac|t2_reg[18:0] Q[12]
load net u_m4_kernel_storage|clk -attr @name clk -hierPin u_m4_kernel_storage clk -pin u_m4_kernel_storage|mem_reg WCLK -pin u_m4_kernel_storage|rd_tap_reg[3:0] C -pin u_m4_kernel_storage|sel_prev_reg[0] C -pin u_m4_kernel_storage|sweep_left_reg[9:0] C -pin u_m4_kernel_storage|tap_data_reg[7:0] C -pin u_m4_kernel_storage|tap_idx_reg[3:0] C -pin u_m4_kernel_storage|tap_valid_reg C
netloc u_m4_kernel_storage|clk 1 0 11 NJ 1142 1920 1562 NJ 1562 NJ 1562 2680 1342 NJ 1342 NJ 1342 3550 1282 3730J 1312 4120 1562 4380
load net u_m3_mac|ring_5[7] -attr @name ring_5[7] -pin u_m3_mac|ring_4_reg[24:0] D[7] -pin u_m3_mac|ring_5_reg[24:0] Q[7]
load net u_m3_mac|t1[15] -attr @rip(#000000) 15 -attr @name t1[15] -pin u_m3_mac|t1_reg[17:0] Q[15] -pin u_m3_mac|t20_i I0[15]
load net u_m3_mac|t20[15] -attr @rip(#000000) O[15] -attr @name t20[15] -pin u_m3_mac|t20_i O[15] -pin u_m3_mac|t2_reg[18:0] D[15]
load net u_m4_kernel_storage|rd_tap1[2] -attr @rip(#000000) O[2] -attr @name rd_tap1[2] -pin u_m4_kernel_storage|rd_tap0_i I1[2] -pin u_m4_kernel_storage|rd_tap1_i O[2]
load net u_m1_line_buffer|line_buf1_reg[14]__0[5] -attr @name line_buf1_reg[14]__0[5] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] D[5]
load net u_m3_mac|t20[8] -attr @rip(#000000) O[8] -attr @name t20[8] -pin u_m3_mac|t20_i O[8] -pin u_m3_mac|t2_reg[18:0] D[8]
load net u_m1_line_buffer|line_buf1_reg[30]__0[6] -attr @name line_buf1_reg[30]__0[6] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] D[6]
load net kernel_wr_data[1] -attr @rip(#000000) kernel_wr_data[1] -port kernel_wr_data[1] -pin u_m4_kernel_storage kernel_wr_data[1]
load net u_m1_line_buffer|line_buf1_reg[24]__0[1] -attr @name line_buf1_reg[24]__0[1] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] D[1]
load net u_m3_mac|dsp_p[29] -attr @rip(#000000) p[29] -attr @name dsp_p[29] -pin u_m3_mac|acc_a0_i I1[13] -pin u_m3_mac|u_dsp p[29]
load net u_m1_line_buffer|line_buf1_reg[11]__0[4] -attr @name line_buf1_reg[11]__0[4] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] D[4]
load net u_m3_mac|acc_c[3] -attr @rip(#000000) 3 -attr @name acc_c[3] -pin u_m3_mac|acc_c_reg[17:0] Q[3] -pin u_m3_mac|base_c_i I1[3] -pin u_m3_mac|frame_c_reg[17:0] D[3]
load net u_m3_mac|acc_r0[7] -attr @rip(#000000) O[7] -attr @name acc_r0[7] -pin u_m3_mac|acc_r0_i O[7] -pin u_m3_mac|acc_r_reg[19:0] D[7]
load net u_m3_mac|mac_result[2] -attr @rip(#000000) 2 -attr @name mac_result[2] -hierPin u_m3_mac mac_result[2] -pin u_m3_mac|acc_r_reg[19:0] Q[2]
load net u_m1_line_buffer|line_buf2_reg[15]__0[3] -attr @name line_buf2_reg[15]__0[3] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[18]__0[5] -attr @name line_buf1_reg[18]__0[5] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] D[5]
load net u_m3_mac|word_f[0] -attr @rip(#000000) 0 -attr @name word_f[0] -pin u_m3_mac|ring_50_i I0[0] -pin u_m3_mac|word_f_reg[24:0] Q[0]
load net u_m3_mac|u_dsp|m_r0[16] -attr @rip(#000000) O[16] -attr @name m_r0[16] -pin u_m3_mac|u_dsp|m_r0_i O[16] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[16]
load net u_m1_line_buffer|line_buf1_reg[2]__0[1] -attr @name line_buf1_reg[2]__0[1] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[28]__0[5] -attr @name line_buf1_reg[28]__0[5] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] D[5]
load net u_m3_mac|t2[2] -attr @rip(#000000) 2 -attr @name t2[2] -pin u_m3_mac|acc_r0_i I0[2] -pin u_m3_mac|t2_reg[18:0] Q[2]
load net u_m5_output_handling|rst -attr @name rst -hierPin u_m5_output_handling rst -pin u_m5_output_handling|final_output_valid_reg RST -pin u_m5_output_handling|valid_stage1_reg RST
netloc u_m5_output_handling|rst 1 0 3 NJ 334 13900 N N
load net u_m3_mac|col_row1[0] -attr @rip(#000000) col_row1[0] -attr @name col_row1[0] -hierPin u_m3_mac col_row1[0] -pin u_m3_mac|q_s1_reg[7:0] D[0]
load net u_m3_mac|frame_c[3] -attr @name frame_c[3] -pin u_m3_mac|frame_c_reg[17:0] Q[3] -pin u_m3_mac|s3_c_reg[17:0] D[3]
load net u_m3_mac|acc_r0[19] -attr @rip(#000000) O[19] -attr @name acc_r0[19] -pin u_m3_mac|acc_r0_i O[19] -pin u_m3_mac|acc_r_reg[19:0] D[19]
load net u_m1_line_buffer|prev_row1_pixel[6] -attr @rip(#000000) 6 -attr @name prev_row1_pixel[6] -hierPin u_m1_line_buffer prev_row1_pixel[6] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] D[6]
load net u_m3_mac|acc_b0[9] -attr @rip(#000000) O[9] -attr @name acc_b0[9] -pin u_m3_mac|acc_b0_i O[9] -pin u_m3_mac|acc_b_reg[17:0] D[9]
load net u_m3_mac|frame_b[8] -attr @name frame_b[8] -pin u_m3_mac|frame_b_reg[17:0] Q[8] -pin u_m3_mac|s3_b_reg[17:0] D[8]
load net prev_row1_pixel[0] -attr @rip(#000000) prev_row1_pixel[0] -pin u_m1_line_buffer prev_row1_pixel[0] -pin u_m3_mac col_row1[0]
load net u_m3_mac|ring_0[9] -attr @rip(#000000) 9 -attr @name ring_0[9] -pin u_m3_mac|ring_0_reg[24:0] Q[9] -pin u_m3_mac|ring_50_i I1[9] -pin u_m3_mac|u_dsp a[9]
load net u_m3_mac|base_c[16] -attr @rip(#000000) O[16] -attr @name base_c[16] -pin u_m3_mac|acc_c0_i I0[16] -pin u_m3_mac|base_c_i O[16]
load net u_m3_mac|prev_c0[2] -attr @rip(#000000) 2 -attr @name prev_c0[2] -pin u_m3_mac|hi_src_i I0[2] -pin u_m3_mac|prev_c0_reg[7:0] Q[2]
load net u_m7_fifo|output_pixel[5] -attr @rip(#000000) 5 -attr @name output_pixel[5] -hierPin u_m7_fifo output_pixel[5] -pin u_m7_fifo|output_pixel_reg[15:0] Q[5]
load net u_m3_mac|acc_c[17] -attr @rip(#000000) 17 -attr @name acc_c[17] -pin u_m3_mac|acc_c_reg[17:0] Q[17] -pin u_m3_mac|base_c_i I1[17] -pin u_m3_mac|frame_c_reg[17:0] D[17]
load net u_m1_line_buffer|line_buf2_reg[14]__0[7] -attr @name line_buf2_reg[14]__0[7] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] D[7]
load net u_m3_mac|acc_b[4] -attr @rip(#000000) 4 -attr @name acc_b[4] -pin u_m3_mac|acc_b_reg[17:0] Q[4] -pin u_m3_mac|base_b_i I1[4] -pin u_m3_mac|frame_b_reg[17:0] D[4]
load net u_m1_line_buffer|line_buf1_reg[0]__0[4] -attr @name line_buf1_reg[0]__0[4] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] D[4]
load net u_m3_mac|ring_5[6] -attr @name ring_5[6] -pin u_m3_mac|ring_4_reg[24:0] D[6] -pin u_m3_mac|ring_5_reg[24:0] Q[6]
load net u_m1_line_buffer|line_buf2_reg[1]__0[2] -attr @name line_buf2_reg[1]__0[2] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] D[2]
load net u_m3_mac|s4_b[1] -attr @name s4_b[1] -pin u_m3_mac|s4_b_reg[17:0] Q[1] -pin u_m3_mac|sum_c1_reg[17:0] D[1]
load net u_m7_fifo|output_pixel[11] -attr @rip(#000000) 11 -attr @name output_pixel[11] -hierPin u_m7_fifo output_pixel[11] -pin u_m7_fifo|output_pixel_reg[15:0] Q[11]
load net u_m4_kernel_storage|rd_tap1[1] -attr @rip(#000000) O[1] -attr @name rd_tap1[1] -pin u_m4_kernel_storage|rd_tap0_i I1[1] -pin u_m4_kernel_storage|rd_tap1_i O[1]
load net u_m3_mac|acc_c[0] -attr @rip(#000000) 0 -attr @name acc_c[0] -pin u_m3_mac|acc_c_reg[17:0] Q[0] -pin u_m3_mac|base_c_i I1[0] -pin u_m3_mac|frame_c_reg[17:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[14]__0[4] -attr @name line_buf1_reg[14]__0[4] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] D[4]
load net u_m3_mac|t20[7] -attr @rip(#000000) O[7] -attr @name t20[7] -pin u_m3_mac|t20_i O[7] -pin u_m3_mac|t2_reg[18:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[30]__0[5] -attr @name line_buf1_reg[30]__0[5] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] D[5]
load net u_m1_line_buffer|line_buf2_reg[15]__0[0] -attr @name line_buf2_reg[15]__0[0] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] D[0]
load net pixel_req -port pixel_req -pin u_m6_control_fsm pixel_req
netloc pixel_req 1 8 1 20980J
load net u_m3_mac|frame_b[1] -attr @name frame_b[1] -pin u_m3_mac|frame_b_reg[17:0] Q[1] -pin u_m3_mac|s3_b_reg[17:0] D[1]
load net u_m3_mac|t1[16] -attr @rip(#000000) 16 -attr @name t1[16] -pin u_m3_mac|t1_reg[17:0] Q[16] -pin u_m3_mac|t20_i I0[16]
load net u_m3_mac|t20[16] -attr @rip(#000000) O[16] -attr @name t20[16] -pin u_m3_mac|t20_i O[16] -pin u_m3_mac|t2_reg[18:0] D[16]
load net u_m3_mac|t2[15] -attr @rip(#000000) 15 -attr @name t2[15] -pin u_m3_mac|acc_r0_i I0[15] -pin u_m3_mac|t2_reg[18:0] Q[15]
load net u_m5_output_handling|out_val[0] -attr @name out_val[0] -pin u_m5_output_handling|final_output_reg[15:0] D[0] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[0]
load net u_m1_line_buffer|line_buf1_reg[11]__0[3] -attr @name line_buf1_reg[11]__0[3] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] D[3]
load net pass_reset -pin u_m2_window_generator pass_reset -pin u_m6_control_fsm pass_reset -pin u_m7_fifo fifo_pass_reset
netloc pass_reset 1 3 6 1420 222 5000J 1268 13440J 534 14730 788 18120J 308 20900
load net u_m1_line_buffer|line_buf1_reg[24]__0[2] -attr @name line_buf1_reg[24]__0[2] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] D[2]
load net kernel_wr_data[2] -attr @rip(#000000) kernel_wr_data[2] -port kernel_wr_data[2] -pin u_m4_kernel_storage kernel_wr_data[2]
load net u_m1_line_buffer|line_buf1_reg[18]__0[4] -attr @name line_buf1_reg[18]__0[4] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] D[4]
load net u_m6_control_fsm|state_next_i__0_n_0 -attr @name state_next_i__0_n_0 -pin u_m6_control_fsm|state_next_i__0 O -pin u_m6_control_fsm|state_reg[1:0] CE
netloc u_m6_control_fsm|state_next_i__0_n_0 1 5 1 19920
load net u_m3_mac|acc_r0[8] -attr @rip(#000000) O[8] -attr @name acc_r0[8] -pin u_m3_mac|acc_r0_i O[8] -pin u_m3_mac|acc_r_reg[19:0] D[8]
load net u_m3_mac|frame_c[0] -attr @name frame_c[0] -pin u_m3_mac|frame_c_reg[17:0] Q[0] -pin u_m3_mac|s3_c_reg[17:0] D[0]
load net u_m3_mac|word_s[0] -attr @name word_s[0] -pin u_m3_mac|word_f_reg[24:0] D[0] -pin u_m3_mac|word_s_reg[24:0] Q[0]
load net u_m3_mac|mac_result[5] -attr @rip(#000000) 5 -attr @name mac_result[5] -hierPin u_m3_mac mac_result[5] -pin u_m3_mac|acc_r_reg[19:0] Q[5]
load net u_m3_mac|u_dsp|m_r0[17] -attr @rip(#000000) O[17] -attr @name m_r0[17] -pin u_m3_mac|u_dsp|m_r0_i O[17] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[17]
load net u_m3_mac|acc_r0[18] -attr @rip(#000000) O[18] -attr @name acc_r0[18] -pin u_m3_mac|acc_r0_i O[18] -pin u_m3_mac|acc_r_reg[19:0] D[18]
load net u_m1_line_buffer|prev_row1_pixel[5] -attr @rip(#000000) 5 -attr @name prev_row1_pixel[5] -hierPin u_m1_line_buffer prev_row1_pixel[5] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[2]__0[2] -attr @name line_buf1_reg[2]__0[2] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] D[2]
load net u_m3_mac|t2[3] -attr @rip(#000000) 3 -attr @name t2[3] -pin u_m3_mac|acc_r0_i I0[3] -pin u_m3_mac|t2_reg[18:0] Q[3]
load net u_m3_mac|ring_0[8] -attr @rip(#000000) 8 -attr @name ring_0[8] -pin u_m3_mac|ring_0_reg[24:0] Q[8] -pin u_m3_mac|ring_50_i I1[8] -pin u_m3_mac|u_dsp a[8]
load net u_m3_mac|word_f[3] -attr @rip(#000000) 3 -attr @name word_f[3] -pin u_m3_mac|ring_50_i I0[3] -pin u_m3_mac|word_f_reg[24:0] Q[3]
load net u_m3_mac|base_c[15] -attr @rip(#000000) O[15] -attr @name base_c[15] -pin u_m3_mac|acc_c0_i I0[15] -pin u_m3_mac|base_c_i O[15]
load net u_m3_mac|prev_c0[1] -attr @rip(#000000) 1 -attr @name prev_c0[1] -pin u_m3_mac|hi_src_i I0[1] -pin u_m3_mac|prev_c0_reg[7:0] Q[1]
load net u_m3_mac|b_mux[1] -attr @rip(#000000) O[1] -attr @name b_mux[1] -pin u_m3_mac|b_mux_i O[1] -pin u_m3_mac|u_dsp b[1]
load net u_m3_mac|base_c[7] -attr @rip(#000000) O[7] -attr @name base_c[7] -pin u_m3_mac|acc_c0_i I0[7] -pin u_m3_mac|base_c_i O[7]
load net u_m3_mac|ring_1[18] -attr @name ring_1[18] -pin u_m3_mac|ring_0_reg[24:0] D[18] -pin u_m3_mac|ring_1_reg[24:0] Q[18]
load net u_m3_mac|ring_5[5] -attr @name ring_5[5] -pin u_m3_mac|ring_4_reg[24:0] D[5] -pin u_m3_mac|ring_5_reg[24:0] Q[5]
load net u_m4_kernel_storage|kernel_wr_data[1] -attr @rip(#000000) kernel_wr_data[1] -attr @name kernel_wr_data[1] -hierPin u_m4_kernel_storage kernel_wr_data[1] -pin u_m4_kernel_storage|mem_reg WD2[1]
load net u_m3_mac|t1[13] -attr @rip(#000000) 13 -attr @name t1[13] -pin u_m3_mac|t1_reg[17:0] Q[13] -pin u_m3_mac|t20_i I0[13]
load net u_m3_mac|t20[6] -attr @rip(#000000) O[6] -attr @name t20[6] -pin u_m3_mac|t20_i O[6] -pin u_m3_mac|t2_reg[18:0] D[6]
load net u_m1_line_buffer|line_buf1_reg[30]__0[4] -attr @name line_buf1_reg[30]__0[4] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] D[4]
load net u_m3_mac|s4_b[2] -attr @name s4_b[2] -pin u_m3_mac|s4_b_reg[17:0] Q[2] -pin u_m3_mac|sum_c1_reg[17:0] D[2]
load net u_m3_mac|t2[14] -attr @rip(#000000) 14 -attr @name t2[14] -pin u_m3_mac|acc_r0_i I0[14] -pin u_m3_mac|t2_reg[18:0] Q[14]
load net u_m7_fifo|output_pixel[12] -attr @rip(#000000) 12 -attr @name output_pixel[12] -hierPin u_m7_fifo output_pixel[12] -pin u_m7_fifo|output_pixel_reg[15:0] Q[12]
load net u_m1_line_buffer|line_buf1_reg[11]__0[2] -attr @name line_buf1_reg[11]__0[2] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] D[2]
load net u_m3_mac|acc_c[1] -attr @rip(#000000) 1 -attr @name acc_c[1] -pin u_m3_mac|acc_c_reg[17:0] Q[1] -pin u_m3_mac|base_c_i I1[1] -pin u_m3_mac|frame_c_reg[17:0] D[1]
load net u_m1_line_buffer|line_buf2_reg[15]__0[1] -attr @name line_buf2_reg[15]__0[1] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[18]__0[3] -attr @name line_buf1_reg[18]__0[3] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] D[3]
load net u_m3_mac|frame_b[2] -attr @name frame_b[2] -pin u_m3_mac|frame_b_reg[17:0] Q[2] -pin u_m3_mac|s3_b_reg[17:0] D[2]
load net u_m3_mac|t20[17] -attr @rip(#000000) O[17] -attr @name t20[17] -pin u_m3_mac|t20_i O[17] -pin u_m3_mac|t2_reg[18:0] D[17]
load net u_m1_line_buffer|line_buf2_reg[1]__0[7] -attr @name line_buf2_reg[1]__0[7] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] D[7]
load net u_m6_control_fsm|state_i_n_2 -attr @rip O[0] -attr @name state_i_n_2 -pin u_m6_control_fsm|start_pass0_i I0 -pin u_m6_control_fsm|state_i O[0]
load net u_m3_mac|frame_c[1] -attr @name frame_c[1] -pin u_m3_mac|frame_c_reg[17:0] Q[1] -pin u_m3_mac|s3_c_reg[17:0] D[1]
load net u_m3_mac|mac_result[4] -attr @rip(#000000) 4 -attr @name mac_result[4] -hierPin u_m3_mac mac_result[4] -pin u_m3_mac|acc_r_reg[19:0] Q[4]
load net u_m3_mac|word_s[1] -attr @name word_s[1] -pin u_m3_mac|word_f_reg[24:0] D[1] -pin u_m3_mac|word_s_reg[24:0] Q[1]
load net u_m3_mac|t1[8] -attr @rip(#000000) 8 -attr @name t1[8] -pin u_m3_mac|t1_reg[17:0] Q[8] -pin u_m3_mac|t20_i I0[8]
load net u_m3_mac|word_f[2] -attr @rip(#000000) 2 -attr @name word_f[2] -pin u_m3_mac|ring_50_i I0[2] -pin u_m3_mac|word_f_reg[24:0] Q[2]
load net u_m3_mac|u_dsp|m_r0[18] -attr @rip(#000000) O[18] -attr @name m_r0[18] -pin u_m3_mac|u_dsp|m_r0_i O[18] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[18]
load net u_m5_output_handling|final_output0 -attr @name final_output0 -pin u_m5_output_handling|final_output0_i O -pin u_m5_output_handling|final_output_reg[15:0] RST
netloc u_m5_output_handling|final_output0 1 2 1 14190
load net u_m1_line_buffer|line_buf1_reg[28]__0[7] -attr @name line_buf1_reg[28]__0[7] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] D[7]
load net u_m3_mac|prev_c0[0] -attr @rip(#000000) 0 -attr @name prev_c0[0] -pin u_m3_mac|hi_src_i I0[0] -pin u_m3_mac|prev_c0_reg[7:0] Q[0]
load net u_m3_mac|t2[4] -attr @rip(#000000) 4 -attr @name t2[4] -pin u_m3_mac|acc_r0_i I0[4] -pin u_m3_mac|t2_reg[18:0] Q[4]
load net u_m7_fifo|fifo_all_outputs_done -attr @name fifo_all_outputs_done -hierPin u_m7_fifo fifo_all_outputs_done -pin u_m7_fifo|fifo_all_outputs_done_reg Q
netloc u_m7_fifo|fifo_all_outputs_done 1 10 1 N
load net u_m3_mac|acc_c[15] -attr @rip(#000000) 15 -attr @name acc_c[15] -pin u_m3_mac|acc_c_reg[17:0] Q[15] -pin u_m3_mac|base_c_i I1[15] -pin u_m3_mac|frame_c_reg[17:0] D[15]
load net u_m3_mac|p_0_in[0] -attr @rip(#000000) 0 -attr @name p_0_in[0] -pin u_m3_mac|slot0_i O -pin u_m3_mac|slot_i I1[0]
netloc u_m3_mac|p_0_in[0] 1 2 1 5820J
load net u_m1_line_buffer|line_buf2_reg[14]__0[5] -attr @name line_buf2_reg[14]__0[5] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] D[5]
load net mac_result[6] -attr @rip(#000000) mac_result[6] -pin u_m3_mac mac_result[6] -pin u_m5_output_handling mac_result[6]
load net u_m3_mac|b_mux[0] -attr @rip(#000000) O[0] -attr @name b_mux[0] -pin u_m3_mac|b_mux_i O[0] -pin u_m3_mac|u_dsp b[0]
load net u_m3_mac|frame_a[10] -attr @name frame_a[10] -pin u_m3_mac|frame_a_reg[17:0] Q[10] -pin u_m3_mac|s3_a_reg[17:0] D[10]
load net u_m3_mac|base_c[6] -attr @rip(#000000) O[6] -attr @name base_c[6] -pin u_m3_mac|acc_c0_i I0[6] -pin u_m3_mac|base_c_i O[6]
load net u_m3_mac|s3_b[6] -attr @name s3_b[6] -pin u_m3_mac|s3_b_reg[17:0] Q[6] -pin u_m3_mac|s4_b_reg[17:0] D[6]
load net u_m6_control_fsm|drain_done -attr @name drain_done -pin u_m6_control_fsm|drain_sr_reg[6:0] Q[6] -pin u_m6_control_fsm|state_next_i I2[1] -pin u_m6_control_fsm|state_next_i I2[0] -pin u_m6_control_fsm|state_next_i__0 I2
load net u_m4_kernel_storage|kernel_wr_data[0] -attr @rip(#000000) kernel_wr_data[0] -attr @name kernel_wr_data[0] -hierPin u_m4_kernel_storage kernel_wr_data[0] -pin u_m4_kernel_storage|mem_reg WD2[0]
load net u_m3_mac|mac_result_valid -attr @name mac_result_valid -hierPin u_m3_mac mac_result_valid -pin u_m3_mac|wv_reg[6:1] Q[6]
load net u_m3_mac|ring_1[19] -attr @name ring_1[19] -pin u_m3_mac|ring_0_reg[24:0] D[19] -pin u_m3_mac|ring_1_reg[24:0] Q[19]
load net u_m3_mac|t20[5] -attr @rip(#000000) O[5] -attr @name t20[5] -pin u_m3_mac|t20_i O[5] -pin u_m3_mac|t2_reg[18:0] D[5]
load net u_m1_line_buffer|line_buf2_reg[24]__0[3] -attr @name line_buf2_reg[24]__0[3] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] D[3]
load net u_m4_kernel_storage|addr[0] -attr @rip(#000000) O[0] -attr @name addr[0] -pin u_m4_kernel_storage|addr_i O[0] -pin u_m4_kernel_storage|mem_reg RA1[0] -pin u_m4_kernel_storage|mem_reg WA2[0]
load net u_m1_line_buffer|line_buf1_reg[30]__0[3] -attr @name line_buf1_reg[30]__0[3] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] D[3]
load net u_m3_mac|t1[14] -attr @rip(#000000) 14 -attr @name t1[14] -pin u_m3_mac|t1_reg[17:0] Q[14] -pin u_m3_mac|t20_i I0[14]
load net u_m1_line_buffer|line_buf1_reg[11]__0[1] -attr @name line_buf1_reg[11]__0[1] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] D[1]
load net u_m7_fifo|pop0 -attr @name pop0 -pin u_m7_fifo|pop0_i O -pin u_m7_fifo|pop_i I0 -pin u_m7_fifo|release_mode_reg D
netloc u_m7_fifo|pop0 1 1 6 15120 558 15380J 468 15630J 448 NJ 448 NJ 448 16530
load net u_m6_control_fsm|pixel_valid_in -attr @name pixel_valid_in -hierPin u_m6_control_fsm pixel_valid_in -pin u_m6_control_fsm|pixel_valid_in_i O
netloc u_m6_control_fsm|pixel_valid_in 1 8 1 N
load net kernel_wr_en -port kernel_wr_en -pin u_m4_kernel_storage kernel_wr_en
netloc kernel_wr_en 1 0 4 NJ 590 170J 748 820J 590 1140J
load net u_m1_line_buffer|line_buf1_reg[24]__0[0] -attr @name line_buf1_reg[24]__0[0] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[25][7:0] D[0]
load net kernel_wr_data[0] -attr @rip(#000000) kernel_wr_data[0] -port kernel_wr_data[0] -pin u_m4_kernel_storage kernel_wr_data[0]
load net u_m1_line_buffer|line_buf1_reg[18]__0[2] -attr @name line_buf1_reg[18]__0[2] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] D[2]
load net u_m3_mac|base_a[5] -attr @rip(#000000) O[5] -attr @name base_a[5] -pin u_m3_mac|acc_a0_i I0[5] -pin u_m3_mac|base_a_i O[5]
load net u_m3_mac|s4_b[3] -attr @name s4_b[3] -pin u_m3_mac|s4_b_reg[17:0] Q[3] -pin u_m3_mac|sum_c1_reg[17:0] D[3]
load net u_m3_mac|u_dsp|p0[15] -attr @rip(#000000) O[15] -attr @name p0[15] -pin u_m3_mac|u_dsp|p0_i O[15] -pin u_m3_mac|u_dsp|p_reg[33:0] D[15]
load net u_m3_mac|frame_b[3] -attr @name frame_b[3] -pin u_m3_mac|frame_b_reg[17:0] Q[3] -pin u_m3_mac|s3_b_reg[17:0] D[3]
load net u_m3_mac|t20[18] -attr @rip(#000000) O[18] -attr @name t20[18] -pin u_m3_mac|t20_i O[18] -pin u_m3_mac|t2_reg[18:0] D[18]
load net u_m1_line_buffer|line_buf1_reg[2]__0[0] -attr @name line_buf1_reg[2]__0[0] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] D[0]
load net u_m3_mac|acc_b0[6] -attr @rip(#000000) O[6] -attr @name acc_b0[6] -pin u_m3_mac|acc_b0_i O[6] -pin u_m3_mac|acc_b_reg[17:0] D[6]
load net u_m3_mac|base_b[9] -attr @rip(#000000) O[9] -attr @name base_b[9] -pin u_m3_mac|acc_b0_i I0[9] -pin u_m3_mac|base_b_i O[9]
load net u_m6_control_fsm|pass_reset -attr @name pass_reset -hierPin u_m6_control_fsm pass_reset -pin u_m6_control_fsm|start_pass_i O -pin u_m6_control_fsm|state_next_i__0 I0 -pin u_m6_control_fsm|state_next_i__0 I3
netloc u_m6_control_fsm|pass_reset 1 4 5 19570 948 NJ 948 NJ 948 NJ 948 20740
load net tap_idx[0] -attr @rip(#000000) tap_idx[0] -pin u_m3_mac tap_idx[0] -pin u_m4_kernel_storage tap_idx[0]
load net u_m3_mac|word_s[2] -attr @name word_s[2] -pin u_m3_mac|word_f_reg[24:0] D[2] -pin u_m3_mac|word_s_reg[24:0] Q[2]
load net u_m1_line_buffer|line_buf2_reg[15]__0[6] -attr @name line_buf2_reg[15]__0[6] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] D[6]
load net u_m3_mac|t1[9] -attr @rip(#000000) 9 -attr @name t1[9] -pin u_m3_mac|t1_reg[17:0] Q[9] -pin u_m3_mac|t20_i I0[9]
load net u_m3_mac|u_dsp|m_r0[19] -attr @rip(#000000) O[19] -attr @name m_r0[19] -pin u_m3_mac|u_dsp|m_r0_i O[19] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[19]
load net u_m1_line_buffer|prev_row1_pixel[7] -attr @rip(#000000) 7 -attr @name prev_row1_pixel[7] -hierPin u_m1_line_buffer prev_row1_pixel[7] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] D[7]
load net u_m3_mac|t2[5] -attr @rip(#000000) 5 -attr @name t2[5] -pin u_m3_mac|acc_r0_i I0[5] -pin u_m3_mac|t2_reg[18:0] Q[5]
load net u_m3_mac|acc_c[16] -attr @rip(#000000) 16 -attr @name acc_c[16] -pin u_m3_mac|acc_c_reg[17:0] Q[16] -pin u_m3_mac|base_c_i I1[16] -pin u_m3_mac|frame_c_reg[17:0] D[16]
load net u_m3_mac|base_c[5] -attr @rip(#000000) O[5] -attr @name base_c[5] -pin u_m3_mac|acc_c0_i I0[5] -pin u_m3_mac|base_c_i O[5]
load net u_m3_mac|frame_c[6] -attr @name frame_c[6] -pin u_m3_mac|frame_c_reg[17:0] Q[6] -pin u_m3_mac|s3_c_reg[17:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[14]__0[6] -attr @name line_buf2_reg[14]__0[6] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] D[6]
load net mac_result[7] -attr @rip(#000000) mac_result[7] -pin u_m3_mac mac_result[7] -pin u_m5_output_handling mac_result[7]
load net u_m1_line_buffer|line_buf1_reg[3]__0[0] -attr @name line_buf1_reg[3]__0[0] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] D[0]
load net u_m3_mac|s3_b[7] -attr @name s3_b[7] -pin u_m3_mac|s3_b_reg[17:0] Q[7] -pin u_m3_mac|s4_b_reg[17:0] D[7]
load net u_m5_output_handling|mac_result_valid -attr @name mac_result_valid -hierPin u_m5_output_handling mac_result_valid -pin u_m5_output_handling|rounded_val_r_reg[16:0] CE -pin u_m5_output_handling|valid_stage1_reg D
netloc u_m5_output_handling|mac_result_valid 1 0 2 13640 294 13920
load net u_m1_line_buffer|line_buf1_reg[14]__0[1] -attr @name line_buf1_reg[14]__0[1] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] D[1]
load net u_m3_mac|t20[4] -attr @rip(#000000) O[4] -attr @name t20[4] -pin u_m3_mac|t20_i O[4] -pin u_m3_mac|t2_reg[18:0] D[4]
load net u_m7_fifo|output_pixel[8] -attr @rip(#000000) 8 -attr @name output_pixel[8] -hierPin u_m7_fifo output_pixel[8] -pin u_m7_fifo|output_pixel_reg[15:0] Q[8]
load net u_m1_line_buffer|line_buf2_reg[24]__0[2] -attr @name line_buf2_reg[24]__0[2] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] D[2]
load net kernel_select[0] -attr @rip(#000000) kernel_select[0] -port kernel_select[0] -pin u_m4_kernel_storage kernel_select[0]
netloc kernel_select[0] 1 0 4 NJ 510 250J 668 740J 510 1220J
load net u_m1_line_buffer|line_buf1_reg[30]__0[2] -attr @name line_buf1_reg[30]__0[2] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] D[2]
load net u_m7_fifo|output_pixel[10] -attr @rip(#000000) 10 -attr @name output_pixel[10] -hierPin u_m7_fifo output_pixel[10] -pin u_m7_fifo|output_pixel_reg[15:0] Q[10]
load net u_m1_line_buffer|line_buf1_reg[11]__0[0] -attr @name line_buf1_reg[11]__0[0] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] D[0]
load net mac_result[19] -attr @rip(#000000) mac_result[19] -pin u_m3_mac mac_result[19] -pin u_m5_output_handling mac_result[19]
load net u_m1_line_buffer|line_buf1_reg[18]__0[1] -attr @name line_buf1_reg[18]__0[1] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] D[1]
load net u_m3_mac|base_a[4] -attr @rip(#000000) O[4] -attr @name base_a[4] -pin u_m3_mac|acc_a0_i I0[4] -pin u_m3_mac|base_a_i O[4]
load net u_m1_line_buffer|line_buf2_reg[1]__0[5] -attr @name line_buf2_reg[1]__0[5] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] D[5]
load net u_m3_mac|s4_b[4] -attr @name s4_b[4] -pin u_m3_mac|s4_b_reg[17:0] Q[4] -pin u_m3_mac|sum_c1_reg[17:0] D[4]
load net u_m3_mac|u_dsp|p0[16] -attr @rip(#000000) O[16] -attr @name p0[16] -pin u_m3_mac|u_dsp|p0_i O[16] -pin u_m3_mac|u_dsp|p_reg[33:0] D[16]
load net u_m7_fifo|mem -attr @name mem -pin u_m7_fifo|RTL_AND I1 -pin u_m7_fifo|mem_i O
netloc u_m7_fifo|mem 1 7 1 16760
load net u_m6_control_fsm|pixel_req -attr @rip O[2] -attr @name pixel_req -hierPin u_m6_control_fsm pixel_req -pin u_m6_control_fsm|pixel_valid_in_i I0 -pin u_m6_control_fsm|state_i O[2]
load net u_m3_mac|acc_b0[5] -attr @rip(#000000) O[5] -attr @name acc_b0[5] -pin u_m3_mac|acc_b0_i O[5] -pin u_m3_mac|acc_b_reg[17:0] D[5]
load net u_m1_line_buffer|prev_row1_pixel[2] -attr @rip(#000000) 2 -attr @name prev_row1_pixel[2] -hierPin u_m1_line_buffer prev_row1_pixel[2] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] D[2]
load net u_m3_mac|frame_b[4] -attr @name frame_b[4] -pin u_m3_mac|frame_b_reg[17:0] Q[4] -pin u_m3_mac|s3_b_reg[17:0] D[4]
load net u_m5_output_handling|out_val[3] -attr @name out_val[3] -pin u_m5_output_handling|final_output_reg[15:0] D[3] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[3]
load net u_m3_mac|q_s1[0] -attr @name q_s1[0] -pin u_m3_mac|q_f1_reg[7:0] D[0] -pin u_m3_mac|q_s1_reg[7:0] Q[0]
load net u_m3_mac|acc_c[13] -attr @rip(#000000) 13 -attr @name acc_c[13] -pin u_m3_mac|acc_c_reg[17:0] Q[13] -pin u_m3_mac|base_c_i I1[13] -pin u_m3_mac|frame_c_reg[17:0] D[13]
load net tap_idx[1] -attr @rip(#000000) tap_idx[1] -pin u_m3_mac tap_idx[1] -pin u_m4_kernel_storage tap_idx[1]
load net u_m3_mac|sum_c0[7] -attr @name sum_c0[7] -pin u_m3_mac|sum_c0_reg[17:0] Q[7] -pin u_m3_mac|t1_reg[17:0] D[7]
load net u_m3_mac|word_s[3] -attr @name word_s[3] -pin u_m3_mac|word_f_reg[24:0] D[3] -pin u_m3_mac|word_s_reg[24:0] Q[3]
load net u_m7_fifo|clk -attr @name clk -hierPin u_m7_fifo clk -pin u_m7_fifo|fifo_all_outputs_done_reg C -pin u_m7_fifo|mem_reg WCLK -pin u_m7_fifo|output_pixel_reg[15:0] C -pin u_m7_fifo|output_valid_reg C -pin u_m7_fifo|rd_ptr_reg[5:0] C -pin u_m7_fifo|release_mode_reg C -pin u_m7_fifo|u_release_count clk -pin u_m7_fifo|wr_ptr_reg[5:0] C
netloc u_m7_fifo|clk 1 0 10 NJ 318 15080 318 15420 258 NJ 258 16030 238 NJ 238 NJ 238 16800 428 17100 478 17520
load net u_m1_line_buffer|line_buf2_reg[15]__0[7] -attr @name line_buf2_reg[15]__0[7] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] D[7]
load net u_m3_mac|base_c[4] -attr @rip(#000000) O[4] -attr @name base_c[4] -pin u_m3_mac|acc_c0_i I0[4] -pin u_m3_mac|base_c_i O[4]
load net u_m4_kernel_storage|<const1> -power -attr @name <const1> -pin u_m4_kernel_storage|rd_tap1_i I1 -pin u_m4_kernel_storage|wr_enable0_i__0 I1[1] -pin u_m4_kernel_storage|wr_enable1_i I1[3] -pin u_m4_kernel_storage|wr_enable1_i I1[0]
load net u_m3_mac|t2[6] -attr @rip(#000000) 6 -attr @name t2[6] -pin u_m3_mac|acc_r0_i I0[6] -pin u_m3_mac|t2_reg[18:0] Q[6]
load net u_m3_mac|frame_c[7] -attr @name frame_c[7] -pin u_m3_mac|frame_c_reg[17:0] Q[7] -pin u_m3_mac|s3_c_reg[17:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[14]__0[0] -attr @name line_buf1_reg[14]__0[0] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] D[0]
load net u_m4_kernel_storage|kernel_wr_addr[3] -attr @rip(#000000) kernel_wr_addr[3] -attr @name kernel_wr_addr[3] -hierPin u_m4_kernel_storage kernel_wr_addr[3] -pin u_m4_kernel_storage|addr_i I0[3] -pin u_m4_kernel_storage|wr_enable1_i I0[3]
load net u_m1_line_buffer|line_buf1_reg[3]__0[1] -attr @name line_buf1_reg[3]__0[1] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] D[1]
load net mac_result[8] -attr @rip(#000000) mac_result[8] -pin u_m3_mac mac_result[8] -pin u_m5_output_handling mac_result[8]
load net u_m3_mac|t20[3] -attr @rip(#000000) O[3] -attr @name t20[3] -pin u_m3_mac|t20_i O[3] -pin u_m3_mac|t2_reg[18:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[24]__0[1] -attr @name line_buf2_reg[24]__0[1] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[30]__0[1] -attr @name line_buf1_reg[30]__0[1] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] D[1]
load net u_m3_mac|s3_b[8] -attr @name s3_b[8] -pin u_m3_mac|s3_b_reg[17:0] Q[8] -pin u_m3_mac|s4_b_reg[17:0] D[8]
load net u_m3_mac|t2[11] -attr @rip(#000000) 11 -attr @name t2[11] -pin u_m3_mac|acc_r0_i I0[11] -pin u_m3_mac|t2_reg[18:0] Q[11]
load net u_m1_line_buffer|line_buf2_reg[0]__0[6] -attr @name line_buf2_reg[0]__0[6] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] D[6]
load net u_m1_line_buffer|line_buf1_reg[15]__0[6] -attr @name line_buf1_reg[15]__0[6] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] D[6]
load net u_m3_mac|prev_c00 -attr @name prev_c00 -pin u_m3_mac|prev_c00_i O -pin u_m3_mac|prev_c0_reg[7:0] CE
netloc u_m3_mac|prev_c00 1 3 1 6030
load net u_m7_fifo|output_pixel[9] -attr @rip(#000000) 9 -attr @name output_pixel[9] -hierPin u_m7_fifo output_pixel[9] -pin u_m7_fifo|output_pixel_reg[15:0] Q[9]
load net u_m1_line_buffer|line_buf1_reg[18]__0[0] -attr @name line_buf1_reg[18]__0[0] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[19][7:0] D[0]
load net u_m3_mac|base_a[3] -attr @rip(#000000) O[3] -attr @name base_a[3] -pin u_m3_mac|acc_a0_i I0[3] -pin u_m3_mac|base_a_i O[3]
load net u_m3_mac|prev_c01 -attr @name prev_c01 -pin u_m3_mac|prev_c00_i I1 -pin u_m3_mac|prev_c01_i O
netloc u_m3_mac|prev_c01 1 2 1 NJ
load net u_m3_mac|tap_idx[2] -attr @rip(#000000) tap_idx[2] -attr @name tap_idx[2] -hierPin u_m3_mac tap_idx[2] -pin u_m3_mac|t_col_i I0[2] -pin u_m3_mac|t_row_i I0[2]
load net u_m6_control_fsm|fifo_all_outputs_done -attr @name fifo_all_outputs_done -hierPin u_m6_control_fsm fifo_all_outputs_done -pin u_m6_control_fsm|done_i I1
netloc u_m6_control_fsm|fifo_all_outputs_done 1 0 8 NJ 638 NJ 638 NJ 638 NJ 638 19490J 798 NJ 798 NJ 798 20530
load net tap_data[0] -attr @rip(#000000) tap_data[0] -pin u_m3_mac tap_data[0] -pin u_m4_kernel_storage tap_data[0]
load net u_m3_mac|insph_s0_i_n_0 -attr @rip(#000000) O[2] -attr @name insph_s0_i_n_0 -pin u_m3_mac|insph_s0_i O[2] -pin u_m3_mac|insph_s_reg[2:0] D[2]
load net u_m3_mac|insph_s0_i_n_1 -attr @rip(#000000) O[1] -attr @name insph_s0_i_n_1 -pin u_m3_mac|insph_s0_i O[1] -pin u_m3_mac|insph_s_reg[2:0] D[1]
load net u_m3_mac|mac_result[1] -attr @rip(#000000) 1 -attr @name mac_result[1] -hierPin u_m3_mac mac_result[1] -pin u_m3_mac|acc_r_reg[19:0] Q[1]
load net u_m1_line_buffer|line_buf2_reg[1]__0[6] -attr @name line_buf2_reg[1]__0[6] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] D[6]
load net u_m1_line_buffer|prev_row1_pixel[1] -attr @rip(#000000) 1 -attr @name prev_row1_pixel[1] -hierPin u_m1_line_buffer prev_row1_pixel[1] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] D[1]
load net u_m3_mac|insph_s0_i_n_2 -attr @rip(#000000) O[0] -attr @name insph_s0_i_n_2 -pin u_m3_mac|insph_s0_i O[0] -pin u_m3_mac|insph_s_reg[2:0] D[0]
load net u_m3_mac|s3_c[15] -attr @name s3_c[15] -pin u_m3_mac|s3_c_reg[17:0] Q[15] -pin u_m3_mac|s4_c_reg[17:0] D[15]
load net u_m3_mac|u_dsp|p0[17] -attr @rip(#000000) O[17] -attr @name p0[17] -pin u_m3_mac|u_dsp|p0_i O[17] -pin u_m3_mac|u_dsp|p_reg[33:0] D[17]
load net u_m1_line_buffer|line_buf1_reg[5]__0[2] -attr @name line_buf1_reg[5]__0[2] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] D[2]
load net u_m1_line_buffer|line_buf2_reg[15]__0[4] -attr @name line_buf2_reg[15]__0[4] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] D[4]
load net u_m3_mac|u_dsp|clk_fast -attr @name clk_fast -hierPin u_m3_mac|u_dsp clk_fast -pin u_m3_mac|u_dsp|a_r_reg[24:0] C -pin u_m3_mac|u_dsp|b_r_reg[7:0] C -pin u_m3_mac|u_dsp|m_r_reg[33:0] C -pin u_m3_mac|u_dsp|p_reg[33:0] C
netloc u_m3_mac|u_dsp|clk_fast 1 0 5 9300 816 NJ 816 9670 796 NJ 796 NJ
load net u_m5_output_handling|out_val[4] -attr @name out_val[4] -pin u_m5_output_handling|final_output_reg[15:0] D[4] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[4]
load net u_m1_line_buffer|line_buf1_reg[27]__0[7] -attr @name line_buf1_reg[27]__0[7] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] D[7]
load net u_m3_mac|frame_b_i_n_0 -attr @name frame_b_i_n_0 -pin u_m3_mac|frame_b_i O -pin u_m3_mac|frame_b_reg[17:0] CE
netloc u_m3_mac|frame_b_i_n_0 1 19 1 NJ
load net u_m3_mac|s3_b[10] -attr @name s3_b[10] -pin u_m3_mac|s3_b_reg[17:0] Q[10] -pin u_m3_mac|s4_b_reg[17:0] D[10]
load net u_m3_mac|sum_c0[6] -attr @name sum_c0[6] -pin u_m3_mac|sum_c0_reg[17:0] Q[6] -pin u_m3_mac|t1_reg[17:0] D[6]
load net u_m3_mac|acc_b0[8] -attr @rip(#000000) O[8] -attr @name acc_b0[8] -pin u_m3_mac|acc_b0_i O[8] -pin u_m3_mac|acc_b_reg[17:0] D[8]
load net u_m3_mac|acc_c[14] -attr @rip(#000000) 14 -attr @name acc_c[14] -pin u_m3_mac|acc_c_reg[17:0] Q[14] -pin u_m3_mac|base_c_i I1[14] -pin u_m3_mac|frame_c_reg[17:0] D[14]
load net tap_idx[2] -attr @rip(#000000) tap_idx[2] -pin u_m3_mac tap_idx[2] -pin u_m4_kernel_storage tap_idx[2]
load net u_m3_mac|base_c[3] -attr @rip(#000000) O[3] -attr @name base_c[3] -pin u_m3_mac|acc_c0_i I0[3] -pin u_m3_mac|base_c_i O[3]
load net u_m3_mac|frame_c[4] -attr @name frame_c[4] -pin u_m3_mac|frame_c_reg[17:0] Q[4] -pin u_m3_mac|s3_c_reg[17:0] D[4]
load net u_m3_mac|word_s[4] -attr @name word_s[4] -pin u_m3_mac|word_f_reg[24:0] D[4] -pin u_m3_mac|word_s_reg[24:0] Q[4]
load net u_m4_kernel_storage|<const0> -ground -attr @name <const0> -pin u_m4_kernel_storage|rd_tap0_i I0[3] -pin u_m4_kernel_storage|rd_tap0_i I0[2] -pin u_m4_kernel_storage|rd_tap0_i I0[1] -pin u_m4_kernel_storage|rd_tap0_i I0[0] -pin u_m4_kernel_storage|rd_tap_i I0 -pin u_m4_kernel_storage|sweep_left_reg[9:0] D[9] -pin u_m4_kernel_storage|wr_enable0_i__0 I0[1] -pin u_m4_kernel_storage|wr_enable0_i__0 I1[0] -pin u_m4_kernel_storage|wr_enable1_i I1[2] -pin u_m4_kernel_storage|wr_enable1_i I1[1]
load net u_m2_window_generator|u_col|clk -attr @name clk -hierPin u_m2_window_generator|u_col clk -pin u_m2_window_generator|u_col|state_reg[5:0] C
netloc u_m2_window_generator|u_col|clk 1 0 3 NJ 796 NJ 796 2750
load net u_m1_line_buffer|line_buf1_reg[17]__0[4] -attr @name line_buf1_reg[17]__0[4] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[23]__0[0] -attr @name line_buf2_reg[23]__0[0] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] D[0]
load net u_m3_mac|base_b[6] -attr @rip(#000000) O[6] -attr @name base_b[6] -pin u_m3_mac|acc_b0_i I0[6] -pin u_m3_mac|base_b_i O[6]
load net u_m3_mac|hi_lane[5] -attr @rip(#000000) O[5] -attr @name hi_lane[5] -pin u_m3_mac|hi_lane_i O[5] -pin u_m3_mac|word_s_reg[24:0] D[21]
load net u_m3_mac|t20[2] -attr @rip(#000000) O[2] -attr @name t20[2] -pin u_m3_mac|t20_i O[2] -pin u_m3_mac|t2_reg[18:0] D[2]
load net u_m1_line_buffer|line_buf2_reg[24]__0[0] -attr @name line_buf2_reg[24]__0[0] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[30]__0[0] -attr @name line_buf1_reg[30]__0[0] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] D[0]
load net u_m3_mac|t2[10] -attr @rip(#000000) 10 -attr @name t2[10] -pin u_m3_mac|acc_r0_i I0[10] -pin u_m3_mac|t2_reg[18:0] Q[10]
load net u_m1_line_buffer|line_buf1_reg[3]__0[2] -attr @name line_buf1_reg[3]__0[2] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[15]__0[5] -attr @name line_buf1_reg[15]__0[5] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] D[5]
load net mac_result[9] -attr @rip(#000000) mac_result[9] -pin u_m3_mac mac_result[9] -pin u_m5_output_handling mac_result[9]
load net u_m3_mac|base_a[2] -attr @rip(#000000) O[2] -attr @name base_a[2] -pin u_m3_mac|acc_a0_i I0[2] -pin u_m3_mac|base_a_i O[2]
load net u_m3_mac|s3_b[9] -attr @name s3_b[9] -pin u_m3_mac|s3_b_reg[17:0] Q[9] -pin u_m3_mac|s4_b_reg[17:0] D[9]
load net u_m7_fifo|final_output[15] -attr @rip(#000000) final_output[15] -attr @name final_output[15] -hierPin u_m7_fifo final_output[15] -pin u_m7_fifo|mem_reg WD2[15]
load net u_m1_line_buffer|line_buf2_reg[0]__0[7] -attr @name line_buf2_reg[0]__0[7] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[1][7:0] D[7]
load net u_m2_window_generator|clk -attr @name clk -hierPin u_m2_window_generator clk -pin u_m2_window_generator|col_ge_reg[1:0] C -pin u_m2_window_generator|row_ge_reg[1:0] C -pin u_m2_window_generator|u_col clk
netloc u_m2_window_generator|clk 1 0 7 NJ 692 NJ 692 1950 686 3370J 812 NJ 812 3900 742 4360
load net u_m3_mac|tap_idx[3] -attr @rip(#000000) tap_idx[3] -attr @name tap_idx[3] -hierPin u_m3_mac tap_idx[3] -pin u_m3_mac|t_col_i I0[3] -pin u_m3_mac|t_row_i I0[3]
load net u_m5_output_handling|final_output[15] -attr @rip(#000000) 15 -attr @name final_output[15] -hierPin u_m5_output_handling final_output[15] -pin u_m5_output_handling|final_output_reg[15:0] Q[15]
load net u_m2_window_generator|window_valid0 -attr @name window_valid0 -pin u_m2_window_generator|window_valid0_i O -pin u_m2_window_generator|window_valid_i I0
netloc u_m2_window_generator|window_valid0 1 7 1 N
load net u_m3_mac|mac_result[0] -attr @rip(#000000) 0 -attr @name mac_result[0] -hierPin u_m3_mac mac_result[0] -pin u_m3_mac|acc_r_reg[19:0] Q[0]
load net u_m4_kernel_storage|kernel_wr_data[5] -attr @rip(#000000) kernel_wr_data[5] -attr @name kernel_wr_data[5] -hierPin u_m4_kernel_storage kernel_wr_data[5] -pin u_m4_kernel_storage|mem_reg WD2[5]
load net u_m3_mac|s3_c[14] -attr @name s3_c[14] -pin u_m3_mac|s3_c_reg[17:0] Q[14] -pin u_m3_mac|s4_c_reg[17:0] D[14]
load net u_m5_output_handling|out_val[1] -attr @name out_val[1] -pin u_m5_output_handling|final_output_reg[15:0] D[1] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[1]
load net u_m4_kernel_storage|wr_enable0 -attr @name wr_enable0 -pin u_m4_kernel_storage|wr_enable0_i O -pin u_m4_kernel_storage|wr_enable_i I0
netloc u_m4_kernel_storage|wr_enable0 1 2 1 2280
load net u_m3_mac|u_dsp|p0[18] -attr @rip(#000000) O[18] -attr @name p0[18] -pin u_m3_mac|u_dsp|p0_i O[18] -pin u_m3_mac|u_dsp|p_reg[33:0] D[18]
load net u_m3_mac|u_dsp|p_0_in[0] -attr @rip(#000000) 0 -attr @name p_0_in[0] -pin u_m3_mac|u_dsp|b_r_reg[7:0] Q[0] -pin u_m3_mac|u_dsp|m_r0_i I1[0]
load net u_m1_line_buffer|line_buf1_reg[27]__0[6] -attr @name line_buf1_reg[27]__0[6] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] D[6]
load net u_m4_kernel_storage|wr_enable1 -attr @name wr_enable1 -pin u_m4_kernel_storage|wr_enable0_i I1 -pin u_m4_kernel_storage|wr_enable1_i O
netloc u_m4_kernel_storage|wr_enable1 1 1 1 1880
load net u_m3_mac|ring_50[9] -attr @rip(#000000) O[9] -attr @name ring_50[9] -pin u_m3_mac|ring_50_i O[9] -pin u_m3_mac|ring_5_reg[24:0] D[9]
load net u_m6_control_fsm|pixel_in_valid -attr @name pixel_in_valid -hierPin u_m6_control_fsm pixel_in_valid -pin u_m6_control_fsm|pixel_valid_in_i I1 -pin u_m6_control_fsm|state_next0_i I0 -pin u_m6_control_fsm|u_pixel_count advance
netloc u_m6_control_fsm|pixel_in_valid 1 0 8 NJ 658 NJ 658 18960 658 19220 918 NJ 918 NJ 918 NJ 918 20550J
load net u_m1_line_buffer|prev_row1_pixel[4] -attr @rip(#000000) 4 -attr @name prev_row1_pixel[4] -hierPin u_m1_line_buffer prev_row1_pixel[4] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] D[4]
load net u_m3_mac|acc_b0[7] -attr @rip(#000000) O[7] -attr @name acc_b0[7] -pin u_m3_mac|acc_b0_i O[7] -pin u_m3_mac|acc_b_reg[17:0] D[7]
load net u_m1_line_buffer|line_buf2_reg[26]__0[3] -attr @name line_buf2_reg[26]__0[3] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[5]__0[3] -attr @name line_buf1_reg[5]__0[3] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[15]__0[5] -attr @name line_buf2_reg[15]__0[5] -pin u_m1_line_buffer|line_buf2_reg[15][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] D[5]
load net u_m3_mac|ring_3[22] -attr @name ring_3[22] -pin u_m3_mac|ring_2_reg[24:0] D[22] -pin u_m3_mac|ring_3_reg[24:0] Q[22]
load net u_m3_mac|base_c[2] -attr @rip(#000000) O[2] -attr @name base_c[2] -pin u_m3_mac|acc_c0_i I0[2] -pin u_m3_mac|base_c_i O[2]
load net u_m3_mac|s3_b[2] -attr @name s3_b[2] -pin u_m3_mac|s3_b_reg[17:0] Q[2] -pin u_m3_mac|s4_b_reg[17:0] D[2]
load net u_m7_fifo|release_mode -attr @name release_mode -pin u_m7_fifo|pop0_i I0 -pin u_m7_fifo|release_mode_reg Q -pin u_m7_fifo|release_start1_i I0
netloc u_m7_fifo|release_mode 1 2 4 15400 568 NJ 568 NJ 568 16260
load net tap_idx[3] -attr @rip(#000000) tap_idx[3] -pin u_m3_mac tap_idx[3] -pin u_m4_kernel_storage tap_idx[3]
load net u_m1_line_buffer|line_buf1_reg[17]__0[3] -attr @name line_buf1_reg[17]__0[3] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] D[3]
load net u_m3_mac|frame_c[5] -attr @name frame_c[5] -pin u_m3_mac|frame_c_reg[17:0] Q[5] -pin u_m3_mac|s3_c_reg[17:0] D[5]
load net u_m3_mac|sum_c0[9] -attr @name sum_c0[9] -pin u_m3_mac|sum_c0_reg[17:0] Q[9] -pin u_m3_mac|t1_reg[17:0] D[9]
load net u_m3_mac|word_s[5] -attr @name word_s[5] -pin u_m3_mac|word_f_reg[24:0] D[5] -pin u_m3_mac|word_s_reg[24:0] Q[5]
load net u_m4_kernel_storage|kernel_wr_addr[1] -attr @rip(#000000) kernel_wr_addr[1] -attr @name kernel_wr_addr[1] -hierPin u_m4_kernel_storage kernel_wr_addr[1] -pin u_m4_kernel_storage|addr_i I0[1] -pin u_m4_kernel_storage|wr_enable1_i I0[1]
load net u_m3_mac|base_b[5] -attr @rip(#000000) O[5] -attr @name base_b[5] -pin u_m3_mac|acc_b0_i I0[5] -pin u_m3_mac|base_b_i O[5]
load net u_m3_mac|t20[1] -attr @rip(#000000) O[1] -attr @name t20[1] -pin u_m3_mac|t20_i O[1] -pin u_m3_mac|t2_reg[18:0] D[1]
load net u_m3_mac|hi_lane[6] -attr @rip(#000000) O[6] -attr @name hi_lane[6] -pin u_m3_mac|hi_lane_i O[6] -pin u_m3_mac|word_s_reg[24:0] D[22]
load net u_m3_mac|tap_idx[0] -attr @rip(#000000) tap_idx[0] -attr @name tap_idx[0] -hierPin u_m3_mac tap_idx[0] -pin u_m3_mac|t_col_i I0[0] -pin u_m3_mac|t_row_i I0[0]
load net u_m3_mac|u_dsp|p0[11] -attr @rip(#000000) O[11] -attr @name p0[11] -pin u_m3_mac|u_dsp|p0_i O[11] -pin u_m3_mac|u_dsp|p_reg[33:0] D[11]
load net u_m7_fifo|final_output[3] -attr @rip(#000000) final_output[3] -attr @name final_output[3] -hierPin u_m7_fifo final_output[3] -pin u_m7_fifo|mem_reg WD2[3]
load net u_m1_line_buffer|line_buf1_reg[3]__0[3] -attr @name line_buf1_reg[3]__0[3] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] D[3]
load net busy -port busy -pin u_m6_control_fsm busy
netloc busy 1 8 1 20940J
load net u_m1_line_buffer|line_buf1_reg[13]__0[2] -attr @name line_buf1_reg[13]__0[2] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] D[2]
load net u_m5_output_handling|final_output[14] -attr @rip(#000000) 14 -attr @name final_output[14] -hierPin u_m5_output_handling final_output[14] -pin u_m5_output_handling|final_output_reg[15:0] Q[14]
load net u_m4_kernel_storage|kernel_wr_data[4] -attr @rip(#000000) kernel_wr_data[4] -attr @name kernel_wr_data[4] -hierPin u_m4_kernel_storage kernel_wr_data[4] -pin u_m4_kernel_storage|mem_reg WD2[4]
load net u_m1_line_buffer|line_buf2_reg[24]__0[7] -attr @name line_buf2_reg[24]__0[7] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] D[7]
load net tap_data[2] -attr @rip(#000000) tap_data[2] -pin u_m3_mac tap_data[2] -pin u_m4_kernel_storage tap_data[2]
load net u_m5_output_handling|out_val[2] -attr @name out_val[2] -pin u_m5_output_handling|final_output_reg[15:0] D[2] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[2]
load net u_m3_mac|frame_c_i_n_0 -attr @name frame_c_i_n_0 -pin u_m3_mac|frame_c_i O -pin u_m3_mac|frame_c_reg[17:0] CE
netloc u_m3_mac|frame_c_i_n_0 1 21 1 11830
load net u_m1_line_buffer|prev_row1_pixel[3] -attr @rip(#000000) 3 -attr @name prev_row1_pixel[3] -hierPin u_m1_line_buffer prev_row1_pixel[3] -pin u_m1_line_buffer|line_buf1_reg[31][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[0][7:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[26]__0[2] -attr @name line_buf2_reg[26]__0[2] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] D[2]
load net u_m3_mac|base_a[9] -attr @rip(#000000) O[9] -attr @name base_a[9] -pin u_m3_mac|acc_a0_i I0[9] -pin u_m3_mac|base_a_i O[9]
load net u_m3_mac|ring_3[21] -attr @name ring_3[21] -pin u_m3_mac|ring_2_reg[24:0] D[21] -pin u_m3_mac|ring_3_reg[24:0] Q[21]
load net u_m3_mac|s3_c[17] -attr @name s3_c[17] -pin u_m3_mac|s3_c_reg[17:0] Q[17] -pin u_m3_mac|s4_c_reg[17:0] D[17]
load net u_m3_mac|u_dsp|p_0_in[1] -attr @rip(#000000) 1 -attr @name p_0_in[1] -pin u_m3_mac|u_dsp|b_r_reg[7:0] Q[1] -pin u_m3_mac|u_dsp|m_r0_i I1[1]
load net u_m3_mac|base_c[1] -attr @rip(#000000) O[1] -attr @name base_c[1] -pin u_m3_mac|acc_c0_i I0[1] -pin u_m3_mac|base_c_i O[1]
load net u_m1_line_buffer|line_buf2_reg[8]__0[7] -attr @name line_buf2_reg[8]__0[7] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[5]__0[4] -attr @name line_buf1_reg[5]__0[4] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] D[4]
load net u_m3_mac|s3_b[3] -attr @name s3_b[3] -pin u_m3_mac|s3_b_reg[17:0] Q[3] -pin u_m3_mac|s4_b_reg[17:0] D[3]
load net u_m3_mac|sum_c0[8] -attr @name sum_c0[8] -pin u_m3_mac|sum_c0_reg[17:0] Q[8] -pin u_m3_mac|t1_reg[17:0] D[8]
load net prev_row2_pixel[0] -attr @rip(#000000) prev_row2_pixel[0] -pin u_m1_line_buffer prev_row2_pixel[0] -pin u_m3_mac col_row0[0]
load net u_m3_mac|t20[0] -attr @rip(#000000) O[0] -attr @name t20[0] -pin u_m3_mac|t20_i O[0] -pin u_m3_mac|t2_reg[18:0] D[0]
load net u_m3_mac|word_s[6] -attr @name word_s[6] -pin u_m3_mac|word_f_reg[24:0] D[6] -pin u_m3_mac|word_s_reg[24:0] Q[6]
load net mac_result[15] -attr @rip(#000000) mac_result[15] -pin u_m3_mac mac_result[15] -pin u_m5_output_handling mac_result[15]
load net u_m4_kernel_storage|kernel_wr_addr[2] -attr @rip(#000000) kernel_wr_addr[2] -attr @name kernel_wr_addr[2] -hierPin u_m4_kernel_storage kernel_wr_addr[2] -pin u_m4_kernel_storage|addr_i I0[2] -pin u_m4_kernel_storage|wr_enable1_i I0[2]
load net u_m3_mac|ring_4[24] -attr @name ring_4[24] -pin u_m3_mac|ring_3_reg[24:0] D[24] -pin u_m3_mac|ring_4_reg[24:0] Q[24]
load net u_m6_control_fsm|busy0_i_n_0 -attr @name busy0_i_n_0 -pin u_m6_control_fsm|busy0_i O -pin u_m6_control_fsm|busy_i I0
netloc u_m6_control_fsm|busy0_i_n_0 1 7 1 20550
load net u_m1_line_buffer|line_buf1_reg[17]__0[6] -attr @name line_buf1_reg[17]__0[6] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] D[6]
load net u_m7_fifo|final_output[13] -attr @rip(#000000) final_output[13] -attr @name final_output[13] -hierPin u_m7_fifo final_output[13] -pin u_m7_fifo|mem_reg WD2[13]
load net u_m7_fifo|final_output[2] -attr @rip(#000000) final_output[2] -attr @name final_output[2] -hierPin u_m7_fifo final_output[2] -pin u_m7_fifo|mem_reg WD2[2]
load net u_m1_line_buffer|line_buf2_reg[2]__0[4] -attr @name line_buf2_reg[2]__0[4] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] D[4]
load net u_m3_mac|base_b[8] -attr @rip(#000000) O[8] -attr @name base_b[8] -pin u_m3_mac|acc_b0_i I0[8] -pin u_m3_mac|base_b_i O[8]
load net u_m3_mac|hi_lane[7] -attr @rip(#000000) O[7] -attr @name hi_lane[7] -pin u_m3_mac|hi_lane_i O[7] -pin u_m3_mac|word_s_reg[24:0] D[23]
load net u_m1_line_buffer|line_buf1_reg[13]__0[1] -attr @name line_buf1_reg[13]__0[1] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] D[1]
load net u_m3_mac|col_row1[7] -attr @rip(#000000) col_row1[7] -attr @name col_row1[7] -hierPin u_m3_mac col_row1[7] -pin u_m3_mac|q_s1_reg[7:0] D[7]
load net u_m3_mac|s4_b[0] -attr @name s4_b[0] -pin u_m3_mac|s4_b_reg[17:0] Q[0] -pin u_m3_mac|sum_c1_reg[17:0] D[0]
load net u_m3_mac|tap_idx[1] -attr @rip(#000000) tap_idx[1] -attr @name tap_idx[1] -hierPin u_m3_mac tap_idx[1] -pin u_m3_mac|t_col_i I0[1] -pin u_m3_mac|t_row_i I0[1]
load net u_m3_mac|u_dsp|p0[12] -attr @rip(#000000) O[12] -attr @name p0[12] -pin u_m3_mac|u_dsp|p0_i O[12] -pin u_m3_mac|u_dsp|p_reg[33:0] D[12]
load net u_m2_window_generator|pixel_valid_in -attr @name pixel_valid_in -hierPin u_m2_window_generator pixel_valid_in -pin u_m2_window_generator|col_ge_i S -pin u_m2_window_generator|col_ge_i__0 S -pin u_m2_window_generator|row_wrap_i I0 -pin u_m2_window_generator|u_col advance -pin u_m2_window_generator|window_valid0_i I0
netloc u_m2_window_generator|pixel_valid_in 1 0 7 NJ 732 NJ 732 1930 666 3390 502 NJ 502 3880 N N
load net u_m1_line_buffer|line_buf1_reg[3]__0[4] -attr @name line_buf1_reg[3]__0[4] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] D[4]
load net u_m1_line_buffer|line_buf1_reg[15]__0[7] -attr @name line_buf1_reg[15]__0[7] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] D[7]
load net u_m3_mac|frame_a[15] -attr @name frame_a[15] -pin u_m3_mac|frame_a_reg[17:0] Q[15] -pin u_m3_mac|s3_a_reg[17:0] D[15]
load net u_m4_kernel_storage|kernel_wr_data[3] -attr @rip(#000000) kernel_wr_data[3] -attr @name kernel_wr_data[3] -hierPin u_m4_kernel_storage kernel_wr_data[3] -pin u_m4_kernel_storage|mem_reg WD2[3]
load net prev_row1_pixel[7] -attr @rip(#000000) prev_row1_pixel[7] -pin u_m1_line_buffer prev_row1_pixel[7] -pin u_m3_mac col_row1[7]
load net u_m3_mac|frame_b[0] -attr @name frame_b[0] -pin u_m3_mac|frame_b_reg[17:0] Q[0] -pin u_m3_mac|s3_b_reg[17:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[24]__0[6] -attr @name line_buf2_reg[24]__0[6] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] D[6]
load net tap_data[1] -attr @rip(#000000) tap_data[1] -pin u_m3_mac tap_data[1] -pin u_m4_kernel_storage tap_data[1]
load net u_m3_mac|ring_4[5] -attr @name ring_4[5] -pin u_m3_mac|ring_3_reg[24:0] D[5] -pin u_m3_mac|ring_4_reg[24:0] Q[5]
load net u_m3_mac|base_a[8] -attr @rip(#000000) O[8] -attr @name base_a[8] -pin u_m3_mac|acc_a0_i I0[8] -pin u_m3_mac|base_a_i O[8]
load net u_m3_mac|s3_c[16] -attr @name s3_c[16] -pin u_m3_mac|s3_c_reg[17:0] Q[16] -pin u_m3_mac|s4_c_reg[17:0] D[16]
load net u_m3_mac|base_c[0] -attr @rip(#000000) O[0] -attr @name base_c[0] -pin u_m3_mac|acc_c0_i I0[0] -pin u_m3_mac|base_c_i O[0]
load net u_m1_line_buffer|line_buf2_reg[8]__0[6] -attr @name line_buf2_reg[8]__0[6] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] D[6]
load net u_m3_mac|u_dsp|p_0_in[2] -attr @rip(#000000) 2 -attr @name p_0_in[2] -pin u_m3_mac|u_dsp|b_r_reg[7:0] Q[2] -pin u_m3_mac|u_dsp|m_r0_i I1[2]
load net output_pixel[0] -attr @rip(#000000) output_pixel[0] -port output_pixel[0] -pin u_m7_fifo output_pixel[0]
load net u_m1_line_buffer|line_buf1_reg[16]__0[5] -attr @name line_buf1_reg[16]__0[5] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] D[5]
load net u_m3_mac|ld_s0 -attr @name ld_s0 -pin u_m3_mac|ld_s0_i O -pin u_m3_mac|ld_s_reg D
netloc u_m3_mac|ld_s0 1 5 1 6760
load net final_output[10] -attr @rip(#000000) final_output[10] -pin u_m5_output_handling final_output[10] -pin u_m7_fifo final_output[10]
load net u_m1_line_buffer|line_buf2_reg[26]__0[5] -attr @name line_buf2_reg[26]__0[5] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[5]__0[5] -attr @name line_buf1_reg[5]__0[5] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] D[5]
load net u_m3_mac|ld_s1 -attr @name ld_s1 -pin u_m3_mac|ld_s0_i I1 -pin u_m3_mac|ld_s1_i O
netloc u_m3_mac|ld_s1 1 4 1 6390J
load net u_m3_mac|ring_3[24] -attr @name ring_3[24] -pin u_m3_mac|ring_2_reg[24:0] D[24] -pin u_m3_mac|ring_3_reg[24:0] Q[24]
load net u_m5_output_handling|mac_result[4] -attr @rip(#000000) mac_result[4] -attr @name mac_result[4] -hierPin u_m5_output_handling mac_result[4] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[0]
load net u_m3_mac|s3_b[13] -attr @name s3_b[13] -pin u_m3_mac|s3_b_reg[17:0] Q[13] -pin u_m3_mac|s4_b_reg[17:0] D[13]
load net u_m3_mac|s3_b[4] -attr @name s3_b[4] -pin u_m3_mac|s3_b_reg[17:0] Q[4] -pin u_m3_mac|s4_b_reg[17:0] D[4]
load net prev_row2_pixel[1] -attr @rip(#000000) prev_row2_pixel[1] -pin u_m1_line_buffer prev_row2_pixel[1] -pin u_m3_mac col_row0[1]
load net u_m1_line_buffer|line_buf1_reg[15]__0[2] -attr @name line_buf1_reg[15]__0[2] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[17]__0[5] -attr @name line_buf1_reg[17]__0[5] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] D[5]
load net u_m7_fifo|final_output[1] -attr @rip(#000000) final_output[1] -attr @name final_output[1] -hierPin u_m7_fifo final_output[1] -pin u_m7_fifo|mem_reg WD2[1]
load net mac_result[16] -attr @rip(#000000) mac_result[16] -pin u_m3_mac mac_result[16] -pin u_m5_output_handling mac_result[16]
load net u_m3_mac|base_b[7] -attr @rip(#000000) O[7] -attr @name base_b[7] -pin u_m3_mac|acc_b0_i I0[7] -pin u_m3_mac|base_b_i O[7]
load net u_m7_fifo|rd_ptr[2] -attr @rip(#000000) 2 -attr @name rd_ptr[2] -pin u_m7_fifo|mem_reg RA1[2] -pin u_m7_fifo|pop0_i__0 I1[2] -pin u_m7_fifo|rd_ptr0_i I0[2] -pin u_m7_fifo|rd_ptr_reg[5:0] Q[2]
load net u_m1_line_buffer|line_buf1_reg[13]__0[0] -attr @name line_buf1_reg[13]__0[0] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] D[0]
load net u_m7_fifo|final_output[14] -attr @rip(#000000) final_output[14] -attr @name final_output[14] -hierPin u_m7_fifo final_output[14] -pin u_m7_fifo|mem_reg WD2[14]
load net u_m1_line_buffer|line_buf2_reg[2]__0[5] -attr @name line_buf2_reg[2]__0[5] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] D[5]
load net u_m3_mac|hi_lane[8] -attr @rip(#000000) O[8] -attr @name hi_lane[8] -pin u_m3_mac|hi_lane_i O[8] -pin u_m3_mac|word_s_reg[24:0] D[24]
load net u_m4_kernel_storage|kernel_wr_data[2] -attr @rip(#000000) kernel_wr_data[2] -attr @name kernel_wr_data[2] -hierPin u_m4_kernel_storage kernel_wr_data[2] -pin u_m4_kernel_storage|mem_reg WD2[2]
load net u_m3_mac|u_dsp|p0[13] -attr @rip(#000000) O[13] -attr @name p0[13] -pin u_m3_mac|u_dsp|p0_i O[13] -pin u_m3_mac|u_dsp|p_reg[33:0] D[13]
load net u_m4_kernel_storage|kernel_wr_bank[0] -attr @rip(#000000) kernel_wr_bank[0] -attr @name kernel_wr_bank[0] -hierPin u_m4_kernel_storage kernel_wr_bank[0] -pin u_m4_kernel_storage|addr_i I0[4] -pin u_m4_kernel_storage|wr_enable0_i__0 I0[0]
netloc u_m4_kernel_storage|kernel_wr_bank[0] 1 0 9 NJ 1322 1940 1202 NJ 1202 NJ 1202 NJ 1202 NJ 1202 NJ 1202 NJ 1202 3710J
load net u_m1_line_buffer|line_buf1_reg[3]__0[5] -attr @name line_buf1_reg[3]__0[5] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] D[5]
load net u_m3_mac|frame_a[16] -attr @name frame_a[16] -pin u_m3_mac|frame_a_reg[17:0] Q[16] -pin u_m3_mac|s3_a_reg[17:0] D[16]
load net u_m1_line_buffer|line_buf2_reg[24]__0[5] -attr @name line_buf2_reg[24]__0[5] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] D[5]
load net u_m3_mac|ring_4[4] -attr @name ring_4[4] -pin u_m3_mac|ring_3_reg[24:0] D[4] -pin u_m3_mac|ring_4_reg[24:0] Q[4]
load net u_m3_mac|ev[4] -attr @name ev[4] -pin u_m3_mac|ev_reg[5:1] D[5] -pin u_m3_mac|ev_reg[5:1] Q[4] -pin u_m3_mac|sum_c0_reg[17:0] CE -pin u_m3_mac|sum_c1_reg[17:0] CE -pin u_m3_mac|sum_c2_reg[17:0] CE
load net u_m3_mac|base_a[7] -attr @rip(#000000) O[7] -attr @name base_a[7] -pin u_m3_mac|acc_a0_i I0[7] -pin u_m3_mac|base_a_i O[7]
load net u_m3_mac|word_f[8] -attr @rip(#000000) 8 -attr @name word_f[8] -pin u_m3_mac|ring_50_i I0[8] -pin u_m3_mac|word_f_reg[24:0] Q[8]
load net tap_data[4] -attr @rip(#000000) tap_data[4] -pin u_m3_mac tap_data[4] -pin u_m4_kernel_storage tap_data[4]
load net u_m1_line_buffer|line_buf1_reg[17]__0[0] -attr @name line_buf1_reg[17]__0[0] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[16]__0[4] -attr @name line_buf1_reg[16]__0[4] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[26]__0[4] -attr @name line_buf2_reg[26]__0[4] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] D[4]
load net u_m3_mac|base_b[2] -attr @rip(#000000) O[2] -attr @name base_b[2] -pin u_m3_mac|acc_b0_i I0[2] -pin u_m3_mac|base_b_i O[2]
load net u_m3_mac|ring_3[23] -attr @name ring_3[23] -pin u_m3_mac|ring_2_reg[24:0] D[23] -pin u_m3_mac|ring_3_reg[24:0] Q[23]
load net u_m3_mac|s4_b[9] -attr @name s4_b[9] -pin u_m3_mac|s4_b_reg[17:0] Q[9] -pin u_m3_mac|sum_c1_reg[17:0] D[9]
load net u_m3_mac|u_dsp|p_0_in[3] -attr @rip(#000000) 3 -attr @name p_0_in[3] -pin u_m3_mac|u_dsp|b_r_reg[7:0] Q[3] -pin u_m3_mac|u_dsp|m_r0_i I1[3]
load net u_m3_mac|acc_c[8] -attr @rip(#000000) 8 -attr @name acc_c[8] -pin u_m3_mac|acc_c_reg[17:0] Q[8] -pin u_m3_mac|base_c_i I1[8] -pin u_m3_mac|frame_c_reg[17:0] D[8]
load net final_output[11] -attr @rip(#000000) final_output[11] -pin u_m5_output_handling final_output[11] -pin u_m7_fifo final_output[11]
load net u_m4_kernel_storage|kernel_wr_addr[0] -attr @rip(#000000) kernel_wr_addr[0] -attr @name kernel_wr_addr[0] -hierPin u_m4_kernel_storage kernel_wr_addr[0] -pin u_m4_kernel_storage|addr_i I0[0] -pin u_m4_kernel_storage|wr_enable1_i I0[0]
load net u_m1_line_buffer|line_buf1_reg[15]__0[1] -attr @name line_buf1_reg[15]__0[1] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[5]__0[6] -attr @name line_buf1_reg[5]__0[6] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] D[6]
load net u_m3_mac|ring_4[22] -attr @name ring_4[22] -pin u_m3_mac|ring_3_reg[24:0] D[22] -pin u_m3_mac|ring_4_reg[24:0] Q[22]
load net u_m5_output_handling|mac_result[5] -attr @rip(#000000) mac_result[5] -attr @name mac_result[5] -hierPin u_m5_output_handling mac_result[5] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[1]
load net u_m3_mac|s3_b[14] -attr @name s3_b[14] -pin u_m3_mac|s3_b_reg[17:0] Q[14] -pin u_m3_mac|s4_b_reg[17:0] D[14]
load net u_m3_mac|s3_b[5] -attr @name s3_b[5] -pin u_m3_mac|s3_b_reg[17:0] Q[5] -pin u_m3_mac|s4_b_reg[17:0] D[5]
load net u_m7_fifo|final_output[0] -attr @rip(#000000) final_output[0] -attr @name final_output[0] -hierPin u_m7_fifo final_output[0] -pin u_m7_fifo|mem_reg WD2[0]
load net u_clk_gen|clk_sys -attr @name clk_sys -hierPin u_clk_gen clk_sys -pin u_clk_gen|u_bufr_sys O
netloc u_clk_gen|clk_sys 1 1 1 NJ
load net u_m7_fifo|rd_ptr[1] -attr @rip(#000000) 1 -attr @name rd_ptr[1] -pin u_m7_fifo|mem_reg RA1[1] -pin u_m7_fifo|pop0_i__0 I1[1] -pin u_m7_fifo|rd_ptr0_i I0[1] -pin u_m7_fifo|rd_ptr_reg[5:0] Q[1]
load net u_m4_kernel_storage|changed0 -attr @name changed0 -pin u_m4_kernel_storage|changed0_i O -pin u_m4_kernel_storage|changed_i I1
netloc u_m4_kernel_storage|changed0 1 3 1 2500
load net mac_result[17] -attr @rip(#000000) mac_result[17] -pin u_m3_mac mac_result[17] -pin u_m5_output_handling mac_result[17]
load net u_m2_window_generator|u_col|lfsr_step2076_return[2] -attr @rip(#000000) 1 -attr @name lfsr_step2076_return[2] -pin u_m2_window_generator|u_col|at_count_i I0[1] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I0[1] -pin u_m2_window_generator|u_col|state_reg[5:0] D[2] -pin u_m2_window_generator|u_col|state_reg[5:0] Q[1]
load net u_m1_line_buffer|line_buf2_reg[2]__0[6] -attr @name line_buf2_reg[2]__0[6] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] D[6]
load net final_output_valid -pin u_m5_output_handling final_output_valid -pin u_m7_fifo final_output_valid
netloc final_output_valid 1 6 1 14710
load net u_m1_line_buffer|line_buf2_reg[24]__0[4] -attr @name line_buf2_reg[24]__0[4] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[16]__0[7] -attr @name line_buf2_reg[16]__0[7] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] D[7]
load net u_m3_mac|ring_4[3] -attr @name ring_4[3] -pin u_m3_mac|ring_3_reg[24:0] D[3] -pin u_m3_mac|ring_4_reg[24:0] Q[3]
load net u_m3_mac|u_dsp|p0[14] -attr @rip(#000000) O[14] -attr @name p0[14] -pin u_m3_mac|u_dsp|p0_i O[14] -pin u_m3_mac|u_dsp|p_reg[33:0] D[14]
load net u_m1_line_buffer|line_buf1_reg[3]__0[6] -attr @name line_buf1_reg[3]__0[6] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[19]__0[5] -attr @name line_buf2_reg[19]__0[5] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] D[5]
load net u_m3_mac|frame_a[17] -attr @name frame_a[17] -pin u_m3_mac|frame_a_reg[17:0] Q[17] -pin u_m3_mac|s3_a_reg[17:0] D[17]
load net u_m3_mac|ring_50[5] -attr @rip(#000000) O[5] -attr @name ring_50[5] -pin u_m3_mac|ring_50_i O[5] -pin u_m3_mac|ring_5_reg[24:0] D[5]
load net u_m3_mac|tog_s0 -attr @name tog_s0 -pin u_m3_mac|tog_s0_i O -pin u_m3_mac|tog_s_reg D
netloc u_m3_mac|tog_s0 1 1 1 NJ
load net u_m3_mac|base_a[6] -attr @rip(#000000) O[6] -attr @name base_a[6] -pin u_m3_mac|acc_a0_i I0[6] -pin u_m3_mac|base_a_i O[6]
load net u_m3_mac|ev[5] -attr @name ev[5] -pin u_m3_mac|acc_r_reg[19:0] CE -pin u_m3_mac|ev_reg[5:1] Q[5] -pin u_m3_mac|t1_reg[17:0] CE -pin u_m3_mac|t2_reg[18:0] CE
load net tap_data[3] -attr @rip(#000000) tap_data[3] -pin u_m3_mac tap_data[3] -pin u_m4_kernel_storage tap_data[3]
load net u_m3_mac|word_f[9] -attr @rip(#000000) 9 -attr @name word_f[9] -pin u_m3_mac|ring_50_i I0[9] -pin u_m3_mac|word_f_reg[24:0] Q[9]
load net u_m3_mac|base_b[1] -attr @rip(#000000) O[1] -attr @name base_b[1] -pin u_m3_mac|acc_b0_i I0[1] -pin u_m3_mac|base_b_i O[1]
load net u_m3_mac|s3_b[11] -attr @name s3_b[11] -pin u_m3_mac|s3_b_reg[17:0] Q[11] -pin u_m3_mac|s4_b_reg[17:0] D[11]
load net u_m3_mac|u_dsp|p_0_in[4] -attr @rip(#000000) 4 -attr @name p_0_in[4] -pin u_m3_mac|u_dsp|b_r_reg[7:0] Q[4] -pin u_m3_mac|u_dsp|m_r0_i I1[4]
load net u_m3_mac|acc_c[9] -attr @rip(#000000) 9 -attr @name acc_c[9] -pin u_m3_mac|acc_c_reg[17:0] Q[9] -pin u_m3_mac|base_c_i I1[9] -pin u_m3_mac|frame_c_reg[17:0] D[9]
load net output_pixel[2] -attr @rip(#000000) output_pixel[2] -port output_pixel[2] -pin u_m7_fifo output_pixel[2]
load net u_m1_line_buffer|line_buf1_reg[16]__0[7] -attr @name line_buf1_reg[16]__0[7] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] D[7]
load net u_m1_line_buffer|line_buf1_reg[5]__0[7] -attr @name line_buf1_reg[5]__0[7] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] D[7]
load net u_m3_mac|ring_4[23] -attr @name ring_4[23] -pin u_m3_mac|ring_3_reg[24:0] D[23] -pin u_m3_mac|ring_4_reg[24:0] Q[23]
load net u_m5_output_handling|mac_result[6] -attr @rip(#000000) mac_result[6] -attr @name mac_result[6] -hierPin u_m5_output_handling mac_result[6] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[2]
load net u_m7_fifo|rd_ptr[0] -attr @rip(#000000) 0 -attr @name rd_ptr[0] -pin u_m7_fifo|mem_reg RA1[0] -pin u_m7_fifo|pop0_i__0 I1[0] -pin u_m7_fifo|rd_ptr0_i I0[0] -pin u_m7_fifo|rd_ptr_reg[5:0] Q[0]
load net u_m1_line_buffer|line_buf1_reg[2]__0[7] -attr @name line_buf1_reg[2]__0[7] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] D[7]
load net u_m2_window_generator|u_col|lfsr_step2076_return[1] -attr @rip(#000000) 0 -attr @name lfsr_step2076_return[1] -pin u_m2_window_generator|u_col|at_count_i I0[0] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I0[0] -pin u_m2_window_generator|u_col|state_reg[5:0] D[1] -pin u_m2_window_generator|u_col|state_reg[5:0] Q[0]
load net u_m1_line_buffer|line_buf1_reg[15]__0[4] -attr @name line_buf1_reg[15]__0[4] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] D[4]
load net mac_result[18] -attr @rip(#000000) mac_result[18] -pin u_m3_mac mac_result[18] -pin u_m5_output_handling mac_result[18]
load net u_m3_mac|ring_4[2] -attr @name ring_4[2] -pin u_m3_mac|ring_3_reg[24:0] D[2] -pin u_m3_mac|ring_4_reg[24:0] Q[2]
load net u_m5_output_handling|final_output[9] -attr @rip(#000000) 9 -attr @name final_output[9] -hierPin u_m5_output_handling final_output[9] -pin u_m5_output_handling|final_output_reg[15:0] Q[9]
load net u_m1_line_buffer|line_buf2_reg[2]__0[7] -attr @name line_buf2_reg[2]__0[7] -pin u_m1_line_buffer|line_buf2_reg[2][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[3][7:0] D[7]
load net u_m1_line_buffer|line_buf2_reg[19]__0[4] -attr @name line_buf2_reg[19]__0[4] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] D[4]
load net u_m3_mac|ev[2] -attr @name ev[2] -pin u_m3_mac|ev_reg[5:1] D[3] -pin u_m3_mac|ev_reg[5:1] Q[2]
load net u_m1_line_buffer|line_buf1_reg[28]__0[0] -attr @name line_buf1_reg[28]__0[0] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] D[0]
load net u_m3_mac|ring_1[0] -attr @name ring_1[0] -pin u_m3_mac|ring_0_reg[24:0] D[0] -pin u_m3_mac|ring_1_reg[24:0] Q[0]
load net u_m3_mac|u_dsp|m_r0[21] -attr @rip(#000000) O[21] -attr @name m_r0[21] -pin u_m3_mac|u_dsp|m_r0_i O[21] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[21]
load net u_m1_line_buffer|line_buf1_reg[3]__0[7] -attr @name line_buf1_reg[3]__0[7] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] D[7]
load net u_m3_mac|prev_c0[6] -attr @rip(#000000) 6 -attr @name prev_c0[6] -pin u_m3_mac|hi_src_i I0[6] -pin u_m3_mac|prev_c0_reg[7:0] Q[6]
load net u_m3_mac|ring_50[6] -attr @rip(#000000) O[6] -attr @name ring_50[6] -pin u_m3_mac|ring_50_i O[6] -pin u_m3_mac|ring_5_reg[24:0] D[6]
load net u_m3_mac|word_f[6] -attr @rip(#000000) 6 -attr @name word_f[6] -pin u_m3_mac|ring_50_i I0[6] -pin u_m3_mac|word_f_reg[24:0] Q[6]
load net u_m1_line_buffer|line_buf1_reg[13]__0[6] -attr @name line_buf1_reg[13]__0[6] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[7]__0[0] -attr @name line_buf2_reg[7]__0[0] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] D[0]
load net u_m3_mac|clk -attr @name clk -hierPin u_m3_mac clk -pin u_m3_mac|acc_r_reg[19:0] C -pin u_m3_mac|ev_reg[5:1] C -pin u_m3_mac|insph_s_reg[2:0] C -pin u_m3_mac|ld_s_reg C -pin u_m3_mac|prev_c0_reg[7:0] C -pin u_m3_mac|q_s0_reg[7:0] C -pin u_m3_mac|q_s1_reg[7:0] C -pin u_m3_mac|q_s2_reg[7:0] C -pin u_m3_mac|s3_a_reg[17:0] C -pin u_m3_mac|s3_b_reg[17:0] C -pin u_m3_mac|s3_c_reg[17:0] C -pin u_m3_mac|s4_a_reg[17:0] C -pin u_m3_mac|s4_b_reg[17:0] C -pin u_m3_mac|s4_c_reg[17:0] C -pin u_m3_mac|sum_c0_reg[17:0] C -pin u_m3_mac|sum_c1_reg[17:0] C -pin u_m3_mac|sum_c2_reg[17:0] C -pin u_m3_mac|t1_reg[17:0] C -pin u_m3_mac|t2_reg[18:0] C -pin u_m3_mac|tog_s_reg C -pin u_m3_mac|word_s_reg[24:0] C -pin u_m3_mac|wv_reg[6:1] C
netloc u_m3_mac|clk 1 0 27 NJ 188 5550 608 NJ 608 6070 608 6390 668 6760 618 7050 678 NJ 678 NJ 678 NJ 678 NJ 678 NJ 678 8260 238 NJ 238 NJ 238 NJ 238 NJ 238 NJ 238 NJ 238 11330 198 11630 338 11830 318 12050 188 12250 188 12530 338 12730J 418 12970
load net u_m3_mac|acc_c[6] -attr @rip(#000000) 6 -attr @name acc_c[6] -pin u_m3_mac|acc_c_reg[17:0] Q[6] -pin u_m3_mac|base_c_i I1[6] -pin u_m3_mac|frame_c_reg[17:0] D[6]
load net u_m3_mac|col_row2[2] -attr @rip(#000000) col_row2[2] -attr @name col_row2[2] -hierPin u_m3_mac col_row2[2] -pin u_m3_mac|q_s2_reg[7:0] D[2]
load net tap_data[6] -attr @rip(#000000) tap_data[6] -pin u_m3_mac tap_data[6] -pin u_m4_kernel_storage tap_data[6]
load net u_m3_mac|ring_4[20] -attr @name ring_4[20] -pin u_m3_mac|ring_3_reg[24:0] D[20] -pin u_m3_mac|ring_4_reg[24:0] Q[20]
load net u_m1_line_buffer|line_buf1_reg[17]__0[2] -attr @name line_buf1_reg[17]__0[2] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] D[2]
load net output_pixel[1] -attr @rip(#000000) output_pixel[1] -port output_pixel[1] -pin u_m7_fifo output_pixel[1]
load net u_m1_line_buffer|line_buf1_reg[16]__0[6] -attr @name line_buf1_reg[16]__0[6] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] D[6]
load net u_m3_mac|s3_b[12] -attr @name s3_b[12] -pin u_m3_mac|s3_b_reg[17:0] Q[12] -pin u_m3_mac|s4_b_reg[17:0] D[12]
load net u_m3_mac|word_s[13] -attr @name word_s[13] -pin u_m3_mac|word_f_reg[24:0] D[13] -pin u_m3_mac|word_s_reg[24:0] Q[13]
load net u_m3_mac|base_b[4] -attr @rip(#000000) O[4] -attr @name base_b[4] -pin u_m3_mac|acc_b0_i I0[4] -pin u_m3_mac|base_b_i O[4]
load net u_m3_mac|u_dsp|p_0_in[5] -attr @rip(#000000) 5 -attr @name p_0_in[5] -pin u_m3_mac|u_dsp|b_r_reg[7:0] Q[5] -pin u_m3_mac|u_dsp|m_r0_i I1[5]
load net u_m2_window_generator|u_col|lfsr_step2076_return[0] -attr @name lfsr_step2076_return[0] -pin u_m2_window_generator|u_col|lfsr_step2076_return0_i O -pin u_m2_window_generator|u_col|state_reg[5:0] D[0]
netloc u_m2_window_generator|u_col|lfsr_step2076_return[0] 1 2 1 2710J
load net u_m1_line_buffer|line_buf1_reg[15]__0[3] -attr @name line_buf1_reg[15]__0[3] -pin u_m1_line_buffer|line_buf1_reg[15][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] D[3]
load net u_m3_mac|frame_a[11] -attr @name frame_a[11] -pin u_m3_mac|frame_a_reg[17:0] Q[11] -pin u_m3_mac|s3_a_reg[17:0] D[11]
load net u_m3_mac|ring_2[16] -attr @name ring_2[16] -pin u_m3_mac|ring_1_reg[24:0] D[16] -pin u_m3_mac|ring_2_reg[24:0] Q[16]
load net u_m5_output_handling|mac_result[7] -attr @rip(#000000) mac_result[7] -attr @name mac_result[7] -hierPin u_m5_output_handling mac_result[7] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[3]
load net u_m7_fifo|mem_reg_n_10 -attr @rip(#000000) RO1[5] -attr @name mem_reg_n_10 -pin u_m7_fifo|mem_reg RO1[5] -pin u_m7_fifo|output_pixel_reg[15:0] D[5]
load net start -port start -pin u_m6_control_fsm start
netloc start 1 0 8 NJ 430 270J 588 720J 430 1240J 1072 4940J 1348 13480J 614 14610J 928 18100J
load net u_m3_mac|sum_c1[8] -attr @rip(#000000) 8 -attr @name sum_c1[8] -pin u_m3_mac|sum_c1_reg[17:0] Q[8] -pin u_m3_mac|t20_i I1[8]
load net u_m7_fifo|mem_reg_n_11 -attr @rip(#000000) RO1[4] -attr @name mem_reg_n_11 -pin u_m7_fifo|mem_reg RO1[4] -pin u_m7_fifo|output_pixel_reg[15:0] D[4]
load net prev_row2_pixel[4] -attr @rip(#000000) prev_row2_pixel[4] -pin u_m1_line_buffer prev_row2_pixel[4] -pin u_m3_mac col_row0[4]
load net u_m7_fifo|mem_reg_n_12 -attr @rip(#000000) RO1[3] -attr @name mem_reg_n_12 -pin u_m7_fifo|mem_reg RO1[3] -pin u_m7_fifo|output_pixel_reg[15:0] D[3]
load net u_m7_fifo|mem_reg_n_13 -attr @rip(#000000) RO1[2] -attr @name mem_reg_n_13 -pin u_m7_fifo|mem_reg RO1[2] -pin u_m7_fifo|output_pixel_reg[15:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[23]__0[4] -attr @name line_buf1_reg[23]__0[4] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] D[4]
load net u_m3_mac|ring_2[22] -attr @name ring_2[22] -pin u_m3_mac|ring_1_reg[24:0] D[22] -pin u_m3_mac|ring_2_reg[24:0] Q[22]
load net u_m7_fifo|mem_reg_n_14 -attr @rip(#000000) RO1[1] -attr @name mem_reg_n_14 -pin u_m7_fifo|mem_reg RO1[1] -pin u_m7_fifo|output_pixel_reg[15:0] D[1]
load net u_m3_mac|word_s[23] -attr @name word_s[23] -pin u_m3_mac|word_f_reg[24:0] D[23] -pin u_m3_mac|word_s_reg[24:0] Q[23]
load net u_m3_mac|u_dsp|m_r0[20] -attr @rip(#000000) O[20] -attr @name m_r0[20] -pin u_m3_mac|u_dsp|m_r0_i O[20] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[20]
load net u_m7_fifo|mem_reg_n_15 -attr @rip(#000000) RO1[0] -attr @name mem_reg_n_15 -pin u_m7_fifo|mem_reg RO1[0] -pin u_m7_fifo|output_pixel_reg[15:0] D[0]
load net u_m3_mac|ev[3] -attr @name ev[3] -pin u_m3_mac|ev_reg[5:1] D[4] -pin u_m3_mac|ev_reg[5:1] Q[3] -pin u_m3_mac|s4_a_reg[17:0] CE -pin u_m3_mac|s4_b_reg[17:0] CE -pin u_m3_mac|s4_c_reg[17:0] CE
load net u_m3_mac|insph_s[1] -attr @name insph_s[1] -pin u_m3_mac|insph_f_reg[2:0] D[1] -pin u_m3_mac|insph_s_reg[2:0] Q[1]
load net u_m1_line_buffer|line_buf1_reg[28]__0[1] -attr @name line_buf1_reg[28]__0[1] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[13]__0[5] -attr @name line_buf1_reg[13]__0[5] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] D[5]
load net clk_sys -pin u_clk_gen clk_sys -pin u_m1_line_buffer clk -pin u_m2_window_generator clk -pin u_m3_mac clk -pin u_m4_kernel_storage clk -pin u_m5_output_handling clk -pin u_m6_control_fsm clk -pin u_m7_fifo clk
netloc clk_sys 1 2 6 720 190 1380 162 5140 8 13480 454 14690 848 18140J
load net u_m1_line_buffer|line_buf1_reg[16]__0[1] -attr @name line_buf1_reg[16]__0[1] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] D[1]
load net u_m1_line_buffer|line_buf2_reg[19]__0[7] -attr @name line_buf2_reg[19]__0[7] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] D[7]
load net u_m3_mac|prev_c0[7] -attr @rip(#000000) 7 -attr @name prev_c0[7] -pin u_m3_mac|hi_src_i I0[7] -pin u_m3_mac|prev_c0_reg[7:0] Q[7]
load net u_m3_mac|ring_50[7] -attr @rip(#000000) O[7] -attr @name ring_50[7] -pin u_m3_mac|ring_50_i O[7] -pin u_m3_mac|ring_5_reg[24:0] D[7]
load net u_m3_mac|sum_c0[16] -attr @name sum_c0[16] -pin u_m3_mac|sum_c0_reg[17:0] Q[16] -pin u_m3_mac|t1_reg[17:0] D[16]
load net u_m3_mac|word_f[7] -attr @rip(#000000) 7 -attr @name word_f[7] -pin u_m3_mac|ring_50_i I0[7] -pin u_m3_mac|word_f_reg[24:0] Q[7]
load net u_m1_line_buffer|line_buf2_reg[26]__0[1] -attr @name line_buf2_reg[26]__0[1] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] D[1]
load net u_m3_mac|s3_b[0] -attr @name s3_b[0] -pin u_m3_mac|s3_b_reg[17:0] Q[0] -pin u_m3_mac|s4_b_reg[17:0] D[0]
load net tap_data[5] -attr @rip(#000000) tap_data[5] -pin u_m3_mac tap_data[5] -pin u_m4_kernel_storage tap_data[5]
load net u_m1_line_buffer|line_buf2_reg[7]__0[1] -attr @name line_buf2_reg[7]__0[1] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] D[1]
load net u_m3_mac|ring_4[9] -attr @name ring_4[9] -pin u_m3_mac|ring_3_reg[24:0] D[9] -pin u_m3_mac|ring_4_reg[24:0] Q[9]
load net u_m2_window_generator|u_col|advance -attr @name advance -hierPin u_m2_window_generator|u_col advance -pin u_m2_window_generator|u_col|state_reg[5:0] CE
netloc u_m2_window_generator|u_col|advance 1 0 3 NJ 756 NJ 756 2770
load net u_m1_line_buffer|line_buf1_reg[17]__0[1] -attr @name line_buf1_reg[17]__0[1] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[18][7:0] D[1]
load net u_m3_mac|acc_c[7] -attr @rip(#000000) 7 -attr @name acc_c[7] -pin u_m3_mac|acc_c_reg[17:0] Q[7] -pin u_m3_mac|base_c_i I1[7] -pin u_m3_mac|frame_c_reg[17:0] D[7]
load net u_m3_mac|col_row2[3] -attr @rip(#000000) col_row2[3] -attr @name col_row2[3] -hierPin u_m3_mac col_row2[3] -pin u_m3_mac|q_s2_reg[7:0] D[3]
load net u_m3_mac|word_s[12] -attr @name word_s[12] -pin u_m3_mac|word_f_reg[24:0] D[12] -pin u_m3_mac|word_s_reg[24:0] Q[12]
load net u_m3_mac|base_b[3] -attr @rip(#000000) O[3] -attr @name base_b[3] -pin u_m3_mac|acc_b0_i I0[3] -pin u_m3_mac|base_b_i O[3]
load net u_m3_mac|ring_4[21] -attr @name ring_4[21] -pin u_m3_mac|ring_3_reg[24:0] D[21] -pin u_m3_mac|ring_4_reg[24:0] Q[21]
load net u_m1_line_buffer|line_buf1_reg[2]__0[5] -attr @name line_buf1_reg[2]__0[5] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] D[5]
load net u_m3_mac|ring_2[15] -attr @name ring_2[15] -pin u_m3_mac|ring_1_reg[24:0] D[15] -pin u_m3_mac|ring_2_reg[24:0] Q[15]
load net u_m3_mac|u_dsp|p_0_in[6] -attr @rip(#000000) 6 -attr @name p_0_in[6] -pin u_m3_mac|u_dsp|b_r_reg[7:0] Q[6] -pin u_m3_mac|u_dsp|m_r0_i I1[6]
load net u_m1_line_buffer|prev_row2_pixel[7] -attr @rip(#000000) 7 -attr @name prev_row2_pixel[7] -hierPin u_m1_line_buffer prev_row2_pixel[7] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] Q[7]
load net u_m3_mac|acc_a0_i_n_10 -attr @rip(#000000) O[7] -attr @name acc_a0_i_n_10 -pin u_m3_mac|acc_a0_i O[7] -pin u_m3_mac|acc_a_reg[17:0] D[7]
load net u_m3_mac|p_lo0 -attr @name p_lo0 -pin u_m3_mac|acc_b0_i I1[17] -pin u_m3_mac|acc_b0_i I1[16] -pin u_m3_mac|acc_b0_i I1[15] -pin u_m3_mac|acc_c0_i I1[17] -pin u_m3_mac|acc_c0_i I1[16] -pin u_m3_mac|acc_c0_i I1[15] -pin u_m3_mac|p_lo0_i O
netloc u_m3_mac|p_lo0 1 17 3 10670 898 10910J 848 11350
load net u_m3_mac|sum_c1[7] -attr @rip(#000000) 7 -attr @name sum_c1[7] -pin u_m3_mac|sum_c1_reg[17:0] Q[7] -pin u_m3_mac|t20_i I1[7]
load net u_m7_fifo|rd_ptr0[5] -attr @rip(#000000) O[5] -attr @name rd_ptr0[5] -pin u_m7_fifo|rd_ptr0_i O[5] -pin u_m7_fifo|rd_ptr_reg[5:0] D[5]
load net final_output[14] -attr @rip(#000000) final_output[14] -pin u_m5_output_handling final_output[14] -pin u_m7_fifo final_output[14]
load net u_m3_mac|acc_a0_i_n_11 -attr @rip(#000000) O[6] -attr @name acc_a0_i_n_11 -pin u_m3_mac|acc_a0_i O[6] -pin u_m3_mac|acc_a_reg[17:0] D[6]
load net u_m3_mac|base_b[10] -attr @rip(#000000) O[10] -attr @name base_b[10] -pin u_m3_mac|acc_b0_i I0[10] -pin u_m3_mac|base_b_i O[10]
load net u_m3_mac|clk_fast -attr @name clk_fast -hierPin u_m3_mac clk_fast -pin u_m3_mac|acc_a_reg[17:0] C -pin u_m3_mac|acc_b_reg[17:0] C -pin u_m3_mac|acc_c_reg[17:0] C -pin u_m3_mac|frame_a_reg[17:0] C -pin u_m3_mac|frame_b_reg[17:0] C -pin u_m3_mac|frame_c_reg[17:0] C -pin u_m3_mac|insph_f_reg[2:0] C -pin u_m3_mac|ld_f_reg C -pin u_m3_mac|ph_reg[2:0] C -pin u_m3_mac|q_f0_reg[7:0] C -pin u_m3_mac|q_f1_reg[7:0] C -pin u_m3_mac|q_f2_reg[7:0] C -pin u_m3_mac|ring_0_reg[24:0] C -pin u_m3_mac|ring_1_reg[24:0] C -pin u_m3_mac|ring_2_reg[24:0] C -pin u_m3_mac|ring_3_reg[24:0] C -pin u_m3_mac|ring_4_reg[24:0] C -pin u_m3_mac|ring_5_reg[24:0] C -pin u_m3_mac|tog_f1_reg C -pin u_m3_mac|tog_f2_reg C -pin u_m3_mac|u_dsp clk_fast -pin u_m3_mac|word_f_reg[24:0] C
netloc u_m3_mac|clk_fast 1 0 22 NJ 278 NJ 278 5840 168 6070 388 NJ 388 6740 598 7070 848 7300 858 NJ 858 7760 758 7920 748 8080 738 8280 678 8460 678 8660 738 9060 518 NJ 518 10690 478 10930 538 11330 518 11590 548 N
load net u_m3_mac|frame_a[12] -attr @name frame_a[12] -pin u_m3_mac|frame_a_reg[17:0] Q[12] -pin u_m3_mac|s3_a_reg[17:0] D[12]
load net mac_result[10] -attr @rip(#000000) mac_result[10] -pin u_m3_mac mac_result[10] -pin u_m5_output_handling mac_result[10]
load net u_m3_mac|acc_a0_i_n_12 -attr @rip(#000000) O[5] -attr @name acc_a0_i_n_12 -pin u_m3_mac|acc_a0_i O[5] -pin u_m3_mac|acc_a_reg[17:0] D[5]
load net u_m3_mac|s3_b[17] -attr @name s3_b[17] -pin u_m3_mac|s3_b_reg[17:0] Q[17] -pin u_m3_mac|s4_b_reg[17:0] D[17]
load net prev_row2_pixel[5] -attr @rip(#000000) prev_row2_pixel[5] -pin u_m1_line_buffer prev_row2_pixel[5] -pin u_m3_mac col_row0[5]
load net u_m3_mac|acc_a0_i_n_13 -attr @rip(#000000) O[4] -attr @name acc_a0_i_n_13 -pin u_m3_mac|acc_a0_i O[4] -pin u_m3_mac|acc_a_reg[17:0] D[4]
load net u_m3_mac|ring_0[24] -attr @rip(#000000) 24 -attr @name ring_0[24] -pin u_m3_mac|ring_0_reg[24:0] Q[24] -pin u_m3_mac|ring_50_i I1[24] -pin u_m3_mac|u_dsp a[24]
load net u_m3_mac|acc_a0_i_n_14 -attr @rip(#000000) O[3] -attr @name acc_a0_i_n_14 -pin u_m3_mac|acc_a0_i O[3] -pin u_m3_mac|acc_a_reg[17:0] D[3]
load net u_m3_mac|acc_a0_i_n_15 -attr @rip(#000000) O[2] -attr @name acc_a0_i_n_15 -pin u_m3_mac|acc_a0_i O[2] -pin u_m3_mac|acc_a_reg[17:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[23]__0[5] -attr @name line_buf1_reg[23]__0[5] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] D[5]
load net u_m3_mac|ring_2[23] -attr @name ring_2[23] -pin u_m3_mac|ring_1_reg[24:0] D[23] -pin u_m3_mac|ring_2_reg[24:0] Q[23]
load net u_m3_mac|word_f[4] -attr @rip(#000000) 4 -attr @name word_f[4] -pin u_m3_mac|ring_50_i I0[4] -pin u_m3_mac|word_f_reg[24:0] Q[4]
load net u_m3_mac|acc_a0_i_n_16 -attr @rip(#000000) O[1] -attr @name acc_a0_i_n_16 -pin u_m3_mac|acc_a0_i O[1] -pin u_m3_mac|acc_a_reg[17:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[13]__0[4] -attr @name line_buf1_reg[13]__0[4] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] D[4]
load net u_m3_mac|word_s[24] -attr @name word_s[24] -pin u_m3_mac|word_f_reg[24:0] D[24] -pin u_m3_mac|word_s_reg[24:0] Q[24]
load net u_m1_line_buffer|line_buf2_reg[25]__0[7] -attr @name line_buf2_reg[25]__0[7] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] D[7]
load net u_m2_window_generator|pass_clear -attr @name pass_clear -pin u_m2_window_generator|col_ge0_i I0 -pin u_m2_window_generator|pass_clear_i O -pin u_m2_window_generator|row_ge_reg[1:0] RST
netloc u_m2_window_generator|pass_clear 1 1 5 1760 522 NJ 522 NJ 522 NJ 522 3900J
load net u_m1_line_buffer|line_buf1_reg[16]__0[0] -attr @name line_buf1_reg[16]__0[0] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] D[0]
load net u_m3_mac|acc_a0_i_n_17 -attr @rip(#000000) O[0] -attr @name acc_a0_i_n_17 -pin u_m3_mac|acc_a0_i O[0] -pin u_m3_mac|acc_a_reg[17:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[19]__0[6] -attr @name line_buf2_reg[19]__0[6] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] D[6]
load net u_m3_mac|insph_s[2] -attr @name insph_s[2] -pin u_m3_mac|insph_f_reg[2:0] D[2] -pin u_m3_mac|insph_s_reg[2:0] Q[2]
load net u_m3_mac|sum_c0[15] -attr @name sum_c0[15] -pin u_m3_mac|sum_c0_reg[17:0] Q[15] -pin u_m3_mac|t1_reg[17:0] D[15]
load net u_m1_line_buffer|line_buf2_reg[26]__0[0] -attr @name line_buf2_reg[26]__0[0] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[28]__0[2] -attr @name line_buf1_reg[28]__0[2] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] D[2]
load net u_m3_mac|s4_b[5] -attr @name s4_b[5] -pin u_m3_mac|s4_b_reg[17:0] Q[5] -pin u_m3_mac|sum_c1_reg[17:0] D[5]
load net u_m3_mac|u_dsp|m_r0[23] -attr @rip(#000000) O[23] -attr @name m_r0[23] -pin u_m3_mac|u_dsp|m_r0_i O[23] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[23]
load net u_m7_fifo|mem_reg_n_0 -attr @rip(#000000) RO1[15] -attr @name mem_reg_n_0 -pin u_m7_fifo|mem_reg RO1[15] -pin u_m7_fifo|output_pixel_reg[15:0] D[15]
load net u_m3_mac|acc_c[4] -attr @rip(#000000) 4 -attr @name acc_c[4] -pin u_m3_mac|acc_c_reg[17:0] Q[4] -pin u_m3_mac|base_c_i I1[4] -pin u_m3_mac|frame_c_reg[17:0] D[4]
load net u_m4_kernel_storage|tap_data[1] -attr @rip(#000000) 1 -attr @name tap_data[1] -hierPin u_m4_kernel_storage tap_data[1] -pin u_m4_kernel_storage|tap_data_reg[7:0] Q[1]
load net frame_done -port frame_done -pin u_m6_control_fsm fifo_all_outputs_done -pin u_m7_fifo fifo_all_outputs_done
netloc frame_done 1 7 2 18040 190 NJ
load net u_m3_mac|ring_50[8] -attr @rip(#000000) O[8] -attr @name ring_50[8] -pin u_m3_mac|ring_50_i O[8] -pin u_m3_mac|ring_5_reg[24:0] D[8]
load net u_m7_fifo|mem_reg_n_1 -attr @rip(#000000) RO1[14] -attr @name mem_reg_n_1 -pin u_m7_fifo|mem_reg RO1[14] -pin u_m7_fifo|output_pixel_reg[15:0] D[14]
load net u_m3_mac|ring_4[8] -attr @name ring_4[8] -pin u_m3_mac|ring_3_reg[24:0] D[8] -pin u_m3_mac|ring_4_reg[24:0] Q[8]
load net u_m7_fifo|mem_reg_n_2 -attr @rip(#000000) RO1[13] -attr @name mem_reg_n_2 -pin u_m7_fifo|mem_reg RO1[13] -pin u_m7_fifo|output_pixel_reg[15:0] D[13]
load net u_m1_line_buffer|line_buf1_reg[11]__0[7] -attr @name line_buf1_reg[11]__0[7] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] D[7]
load net u_m3_mac|s3_b[1] -attr @name s3_b[1] -pin u_m3_mac|s3_b_reg[17:0] Q[1] -pin u_m3_mac|s4_b_reg[17:0] D[1]
load net u_m7_fifo|mem_reg_n_3 -attr @rip(#000000) RO1[12] -attr @name mem_reg_n_3 -pin u_m7_fifo|mem_reg RO1[12] -pin u_m7_fifo|output_pixel_reg[15:0] D[12]
load net u_m6_control_fsm|start_pass0 -attr @name start_pass0 -pin u_m6_control_fsm|start_pass0_i O -pin u_m6_control_fsm|start_pass_i I1
netloc u_m6_control_fsm|start_pass0 1 7 1 20530
load net u_m4_kernel_storage|p_0_in[3] -attr @rip(#000000) 3 -attr @name p_0_in[3] -pin u_m4_kernel_storage|addr_i I1[3] -pin u_m4_kernel_storage|rd_tap0_i S[3] -pin u_m4_kernel_storage|rd_tap1_i I0[3] -pin u_m4_kernel_storage|rd_tap_reg[3:0] Q[3] -pin u_m4_kernel_storage|tap_idx_reg[3:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[7]__0[2] -attr @name line_buf2_reg[7]__0[2] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] D[2]
load net u_m7_fifo|mem_reg_n_4 -attr @rip(#000000) RO1[11] -attr @name mem_reg_n_4 -pin u_m7_fifo|mem_reg RO1[11] -pin u_m7_fifo|output_pixel_reg[15:0] D[11]
load net u_m7_fifo|wr_ptr0_i__0_n_0 -attr @rip(#000000) O[5] -attr @name wr_ptr0_i__0_n_0 -pin u_m7_fifo|wr_ptr0_i__0 O[5] -pin u_m7_fifo|wr_ptr_reg[5:0] D[5]
load net u_m1_line_buffer|line_buf2_reg[13]__0[6] -attr @name line_buf2_reg[13]__0[6] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] D[6]
load net u_m3_mac|col_row2[4] -attr @rip(#000000) col_row2[4] -attr @name col_row2[4] -hierPin u_m3_mac col_row2[4] -pin u_m3_mac|q_s2_reg[7:0] D[4]
load net u_m3_mac|s4_b[13] -attr @name s4_b[13] -pin u_m3_mac|s4_b_reg[17:0] Q[13] -pin u_m3_mac|sum_c1_reg[17:0] D[13]
load net u_m7_fifo|mem_reg_n_5 -attr @rip(#000000) RO1[10] -attr @name mem_reg_n_5 -pin u_m7_fifo|mem_reg RO1[10] -pin u_m7_fifo|output_pixel_reg[15:0] D[10]
load net u_m7_fifo|wr_ptr0_i__0_n_1 -attr @rip(#000000) O[4] -attr @name wr_ptr0_i__0_n_1 -pin u_m7_fifo|wr_ptr0_i__0 O[4] -pin u_m7_fifo|wr_ptr_reg[5:0] D[4]
load net u_m3_mac|ring_1[24] -attr @name ring_1[24] -pin u_m3_mac|ring_0_reg[24:0] D[24] -pin u_m3_mac|ring_1_reg[24:0] Q[24]
load net u_m3_mac|ring_2[14] -attr @name ring_2[14] -pin u_m3_mac|ring_1_reg[24:0] D[14] -pin u_m3_mac|ring_2_reg[24:0] Q[14]
load net u_m7_fifo|mem_reg_n_6 -attr @rip(#000000) RO1[9] -attr @name mem_reg_n_6 -pin u_m7_fifo|mem_reg RO1[9] -pin u_m7_fifo|output_pixel_reg[15:0] D[9]
load net u_m7_fifo|wr_ptr0_i__0_n_2 -attr @rip(#000000) O[3] -attr @name wr_ptr0_i__0_n_2 -pin u_m7_fifo|wr_ptr0_i__0 O[3] -pin u_m7_fifo|wr_ptr_reg[5:0] D[3]
load net u_m1_line_buffer|prev_row2_pixel[6] -attr @rip(#000000) 6 -attr @name prev_row2_pixel[6] -hierPin u_m1_line_buffer prev_row2_pixel[6] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] Q[6]
load net u_m3_mac|acc_a[15] -attr @rip(#000000) 15 -attr @name acc_a[15] -pin u_m3_mac|acc_a_reg[17:0] Q[15] -pin u_m3_mac|base_a_i I1[15] -pin u_m3_mac|frame_a_reg[17:0] D[15]
load net u_m3_mac|sum_c1[6] -attr @rip(#000000) 6 -attr @name sum_c1[6] -pin u_m3_mac|sum_c1_reg[17:0] Q[6] -pin u_m3_mac|t20_i I1[6]
load net u_m3_mac|word_s[15] -attr @name word_s[15] -pin u_m3_mac|word_f_reg[24:0] D[15] -pin u_m3_mac|word_s_reg[24:0] Q[15]
load net u_m7_fifo|mem_reg_n_7 -attr @rip(#000000) RO1[8] -attr @name mem_reg_n_7 -pin u_m7_fifo|mem_reg RO1[8] -pin u_m7_fifo|output_pixel_reg[15:0] D[8]
load net u_m7_fifo|rd_ptr0[4] -attr @rip(#000000) O[4] -attr @name rd_ptr0[4] -pin u_m7_fifo|rd_ptr0_i O[4] -pin u_m7_fifo|rd_ptr_reg[5:0] D[4]
load net u_m7_fifo|wr_ptr0_i__0_n_3 -attr @rip(#000000) O[2] -attr @name wr_ptr0_i__0_n_3 -pin u_m7_fifo|wr_ptr0_i__0 O[2] -pin u_m7_fifo|wr_ptr_reg[5:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[10]__0[3] -attr @name line_buf1_reg[10]__0[3] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] D[3]
load net prev_row2_pixel[2] -attr @rip(#000000) prev_row2_pixel[2] -pin u_m1_line_buffer prev_row2_pixel[2] -pin u_m3_mac col_row0[2]
load net u_m2_window_generator|row_ge_reg_n_1 -attr @name row_ge_reg_n_1 -pin u_m2_window_generator|row_ge_reg[1:0] D[1] -pin u_m2_window_generator|row_ge_reg[1:0] Q[0]
load net u_m1_line_buffer|line_buf1_reg[2]__0[6] -attr @name line_buf1_reg[2]__0[6] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[3][7:0] D[6]
load net u_m3_mac|u_dsp|p_0_in[7] -attr @rip(#000000) 7 -attr @name p_0_in[7] -pin u_m3_mac|u_dsp|b_r_reg[7:0] Q[7] -pin u_m3_mac|u_dsp|m_r0_i I1[7]
load net u_m7_fifo|mem_reg_n_8 -attr @rip(#000000) RO1[7] -attr @name mem_reg_n_8 -pin u_m7_fifo|mem_reg RO1[7] -pin u_m7_fifo|output_pixel_reg[15:0] D[7]
load net u_m7_fifo|wr_ptr0_i__0_n_4 -attr @rip(#000000) O[1] -attr @name wr_ptr0_i__0_n_4 -pin u_m7_fifo|wr_ptr0_i__0 O[1] -pin u_m7_fifo|wr_ptr_reg[5:0] D[1]
load net u_m3_mac|frame_c[15] -attr @name frame_c[15] -pin u_m3_mac|frame_c_reg[17:0] Q[15] -pin u_m3_mac|s3_c_reg[17:0] D[15]
load net u_m3_mac|u_dsp|p0[10] -attr @rip(#000000) O[10] -attr @name p0[10] -pin u_m3_mac|u_dsp|p0_i O[10] -pin u_m3_mac|u_dsp|p_reg[33:0] D[10]
load net u_m7_fifo|mem_reg_n_9 -attr @rip(#000000) RO1[6] -attr @name mem_reg_n_9 -pin u_m7_fifo|mem_reg RO1[6] -pin u_m7_fifo|output_pixel_reg[15:0] D[6]
load net u_m7_fifo|wr_ptr0_i__0_n_5 -attr @rip(#000000) O[0] -attr @name wr_ptr0_i__0_n_5 -pin u_m7_fifo|wr_ptr0_i__0 O[0] -pin u_m7_fifo|wr_ptr_reg[5:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[23]__0[2] -attr @name line_buf1_reg[23]__0[2] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] D[2]
load net final_output[15] -attr @rip(#000000) final_output[15] -pin u_m5_output_handling final_output[15] -pin u_m7_fifo final_output[15]
load net u_m3_mac|base_b[11] -attr @rip(#000000) O[11] -attr @name base_b[11] -pin u_m3_mac|acc_b0_i I0[11] -pin u_m3_mac|base_b_i O[11]
load net u_m3_mac|frame_a[13] -attr @name frame_a[13] -pin u_m3_mac|frame_a_reg[17:0] Q[13] -pin u_m3_mac|s3_a_reg[17:0] D[13]
load net u_m3_mac|ring_50[1] -attr @rip(#000000) O[1] -attr @name ring_50[1] -pin u_m3_mac|ring_50_i O[1] -pin u_m3_mac|ring_5_reg[24:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[26]__0[1] -attr @name line_buf1_reg[26]__0[1] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] D[1]
load net u_m3_mac|word_s[21] -attr @name word_s[21] -pin u_m3_mac|word_f_reg[24:0] D[21] -pin u_m3_mac|word_s_reg[24:0] Q[21]
load net u_m3_mac|ev[1] -attr @name ev[1] -pin u_m3_mac|ev_reg[5:1] D[2] -pin u_m3_mac|ev_reg[5:1] Q[1]
load net u_m1_line_buffer|line_buf1_reg[13]__0[3] -attr @name line_buf1_reg[13]__0[3] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] D[3]
load net u_m1_line_buffer|clk -attr @name clk -hierPin u_m1_line_buffer clk -pin u_m1_line_buffer|line_buf1_reg[0][7:0] C -pin u_m1_line_buffer|line_buf1_reg[10][7:0] C -pin u_m1_line_buffer|line_buf1_reg[11][7:0] C -pin u_m1_line_buffer|line_buf1_reg[12][7:0] C -pin u_m1_line_buffer|line_buf1_reg[13][7:0] C -pin u_m1_line_buffer|line_buf1_reg[14][7:0] C -pin u_m1_line_buffer|line_buf1_reg[15][7:0] C -pin u_m1_line_buffer|line_buf1_reg[16][7:0] C -pin u_m1_line_buffer|line_buf1_reg[17][7:0] C -pin u_m1_line_buffer|line_buf1_reg[18][7:0] C -pin u_m1_line_buffer|line_buf1_reg[19][7:0] C -pin u_m1_line_buffer|line_buf1_reg[1][7:0] C -pin u_m1_line_buffer|line_buf1_reg[20][7:0] C -pin u_m1_line_buffer|line_buf1_reg[21][7:0] C -pin u_m1_line_buffer|line_buf1_reg[22][7:0] C -pin u_m1_line_buffer|line_buf1_reg[23][7:0] C -pin u_m1_line_buffer|line_buf1_reg[24][7:0] C -pin u_m1_line_buffer|line_buf1_reg[25][7:0] C -pin u_m1_line_buffer|line_buf1_reg[26][7:0] C -pin u_m1_line_buffer|line_buf1_reg[27][7:0] C -pin u_m1_line_buffer|line_buf1_reg[28][7:0] C -pin u_m1_line_buffer|line_buf1_reg[29][7:0] C -pin u_m1_line_buffer|line_buf1_reg[2][7:0] C -pin u_m1_line_buffer|line_buf1_reg[30][7:0] C -pin u_m1_line_buffer|line_buf1_reg[31][7:0] C -pin u_m1_line_buffer|line_buf1_reg[3][7:0] C -pin u_m1_line_buffer|line_buf1_reg[4][7:0] C -pin u_m1_line_buffer|line_buf1_reg[5][7:0] C -pin u_m1_line_buffer|line_buf1_reg[6][7:0] C -pin u_m1_line_buffer|line_buf1_reg[7][7:0] C -pin u_m1_line_buffer|line_buf1_reg[8][7:0] C -pin u_m1_line_buffer|line_buf1_reg[9][7:0] C -pin u_m1_line_buffer|line_buf2_reg[0][7:0] C -pin u_m1_line_buffer|line_buf2_reg[10][7:0] C -pin u_m1_line_buffer|line_buf2_reg[11][7:0] C -pin u_m1_line_buffer|line_buf2_reg[12][7:0] C -pin u_m1_line_buffer|line_buf2_reg[13][7:0] C -pin u_m1_line_buffer|line_buf2_reg[14][7:0] C -pin u_m1_line_buffer|line_buf2_reg[15][7:0] C -pin u_m1_line_buffer|line_buf2_reg[16][7:0] C -pin u_m1_line_buffer|line_buf2_reg[17][7:0] C -pin u_m1_line_buffer|line_buf2_reg[18][7:0] C -pin u_m1_line_buffer|line_buf2_reg[19][7:0] C -pin u_m1_line_buffer|line_buf2_reg[1][7:0] C -pin u_m1_line_buffer|line_buf2_reg[20][7:0] C -pin u_m1_line_buffer|line_buf2_reg[21][7:0] C -pin u_m1_line_buffer|line_buf2_reg[22][7:0] C -pin u_m1_line_buffer|line_buf2_reg[23][7:0] C -pin u_m1_line_buffer|line_buf2_reg[24][7:0] C -pin u_m1_line_buffer|line_buf2_reg[25][7:0] C -pin u_m1_line_buffer|line_buf2_reg[26][7:0] C -pin u_m1_line_buffer|line_buf2_reg[27][7:0] C -pin u_m1_line_buffer|line_buf2_reg[28][7:0] C -pin u_m1_line_buffer|line_buf2_reg[29][7:0] C -pin u_m1_line_buffer|line_buf2_reg[2][7:0] C -pin u_m1_line_buffer|line_buf2_reg[30][7:0] C -pin u_m1_line_buffer|line_buf2_reg[31][7:0] C -pin u_m1_line_buffer|line_buf2_reg[3][7:0] C -pin u_m1_line_buffer|line_buf2_reg[4][7:0] C -pin u_m1_line_buffer|line_buf2_reg[5][7:0] C -pin u_m1_line_buffer|line_buf2_reg[6][7:0] C -pin u_m1_line_buffer|line_buf2_reg[7][7:0] C -pin u_m1_line_buffer|line_buf2_reg[8][7:0] C -pin u_m1_line_buffer|line_buf2_reg[9][7:0] C
netloc u_m1_line_buffer|clk 1 0 32 980 208 1280 268 1500 268 1720 268 1940 188 2180 188 2420 188 2660 188 2900 188 3140 188 3380 188 3620 188 3860 188 4100 188 4340 188 4580 188 4820 188 5060 188 5300 188 5540 188 5780 188 6020 188 6260 188 6500 188 6740 188 6980 188 7220 188 7460 188 7700 188 7940 188 8180 188 8460
load net u_m7_fifo|p_0_out -attr @name p_0_out -pin u_m7_fifo|RTL_AND O -pin u_m7_fifo|mem_reg WE2
netloc u_m7_fifo|p_0_out 1 8 1 17080
load net tap_data[7] -attr @rip(#000000) tap_data[7] -pin u_m3_mac tap_data[7] -pin u_m4_kernel_storage tap_data[7]
load net u_m3_mac|ring_2[24] -attr @name ring_2[24] -pin u_m3_mac|ring_1_reg[24:0] D[24] -pin u_m3_mac|ring_2_reg[24:0] Q[24]
load net u_m3_mac|word_f[5] -attr @rip(#000000) 5 -attr @name word_f[5] -pin u_m3_mac|ring_50_i I0[5] -pin u_m3_mac|word_f_reg[24:0] Q[5]
load net u_m3_mac|u_dsp|m_r0[22] -attr @rip(#000000) O[22] -attr @name m_r0[22] -pin u_m3_mac|u_dsp|m_r0_i O[22] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[22]
load net u_m4_kernel_storage|tap_data[0] -attr @rip(#000000) 0 -attr @name tap_data[0] -hierPin u_m4_kernel_storage tap_data[0] -pin u_m4_kernel_storage|tap_data_reg[7:0] Q[0]
load net u_m3_mac|ring_2[21] -attr @name ring_2[21] -pin u_m3_mac|ring_1_reg[24:0] D[21] -pin u_m3_mac|ring_2_reg[24:0] Q[21]
load net u_m1_line_buffer|line_buf1_reg[28]__0[3] -attr @name line_buf1_reg[28]__0[3] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] D[3]
load net u_m3_mac|ring_1[3] -attr @name ring_1[3] -pin u_m3_mac|ring_0_reg[24:0] D[3] -pin u_m3_mac|ring_1_reg[24:0] Q[3]
load net u_m3_mac|ring_4[7] -attr @name ring_4[7] -pin u_m3_mac|ring_3_reg[24:0] D[7] -pin u_m3_mac|ring_4_reg[24:0] Q[7]
load net u_m3_mac|s4_b[6] -attr @name s4_b[6] -pin u_m3_mac|s4_b_reg[17:0] Q[6] -pin u_m3_mac|sum_c1_reg[17:0] D[6]
load net u_m1_line_buffer|line_buf1_reg[11]__0[6] -attr @name line_buf1_reg[11]__0[6] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] D[6]
load net u_m3_mac|acc_c[5] -attr @rip(#000000) 5 -attr @name acc_c[5] -pin u_m3_mac|acc_c_reg[17:0] Q[5] -pin u_m3_mac|base_c_i I1[5] -pin u_m3_mac|frame_c_reg[17:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[16]__0[3] -attr @name line_buf1_reg[16]__0[3] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] D[3]
load net u_m3_mac|ring_5[18] -attr @name ring_5[18] -pin u_m3_mac|ring_4_reg[24:0] D[18] -pin u_m3_mac|ring_5_reg[24:0] Q[18]
load net u_m1_line_buffer|line_buf2_reg[18]__0[1] -attr @name line_buf2_reg[18]__0[1] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] D[1]
load net u_m3_mac|s4_b[12] -attr @name s4_b[12] -pin u_m3_mac|s4_b_reg[17:0] Q[12] -pin u_m3_mac|sum_c1_reg[17:0] D[12]
load net u_m1_line_buffer|line_buf2_reg[7]__0[3] -attr @name line_buf2_reg[7]__0[3] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] D[3]
load net u_m3_mac|ring_1[23] -attr @name ring_1[23] -pin u_m3_mac|ring_0_reg[24:0] D[23] -pin u_m3_mac|ring_1_reg[24:0] Q[23]
load net u_m3_mac|ring_2[13] -attr @name ring_2[13] -pin u_m3_mac|ring_1_reg[24:0] D[13] -pin u_m3_mac|ring_2_reg[24:0] Q[13]
load net u_m1_line_buffer|prev_row2_pixel[5] -attr @rip(#000000) 5 -attr @name prev_row2_pixel[5] -hierPin u_m1_line_buffer prev_row2_pixel[5] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] Q[5]
load net u_m1_line_buffer|line_buf2_reg[13]__0[7] -attr @name line_buf2_reg[13]__0[7] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] D[7]
load net u_m3_mac|col_row2[5] -attr @rip(#000000) col_row2[5] -attr @name col_row2[5] -hierPin u_m3_mac col_row2[5] -pin u_m3_mac|q_s2_reg[7:0] D[5]
load net u_m3_mac|sum_c1[5] -attr @rip(#000000) 5 -attr @name sum_c1[5] -pin u_m3_mac|sum_c1_reg[17:0] Q[5] -pin u_m3_mac|t20_i I1[5]
load net u_m3_mac|word_s[14] -attr @name word_s[14] -pin u_m3_mac|word_f_reg[24:0] D[14] -pin u_m3_mac|word_s_reg[24:0] Q[14]
load net u_m7_fifo|rd_ptr0[3] -attr @rip(#000000) O[3] -attr @name rd_ptr0[3] -pin u_m7_fifo|rd_ptr0_i O[3] -pin u_m7_fifo|rd_ptr_reg[5:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[10]__0[2] -attr @name line_buf1_reg[10]__0[2] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] D[2]
load net final_output[12] -attr @rip(#000000) final_output[12] -pin u_m5_output_handling final_output[12] -pin u_m7_fifo final_output[12]
load net u_m3_mac|ring_0[13] -attr @rip(#000000) 13 -attr @name ring_0[13] -pin u_m3_mac|ring_0_reg[24:0] Q[13] -pin u_m3_mac|ring_50_i I1[13] -pin u_m3_mac|u_dsp a[13]
load net u_m3_mac|acc_a[16] -attr @rip(#000000) 16 -attr @name acc_a[16] -pin u_m3_mac|acc_a_reg[17:0] Q[16] -pin u_m3_mac|base_a_i I1[16] -pin u_m3_mac|frame_a_reg[17:0] D[16]
load net u_m3_mac|s3_b[15] -attr @name s3_b[15] -pin u_m3_mac|s3_b_reg[17:0] Q[15] -pin u_m3_mac|s4_b_reg[17:0] D[15]
load net u_m5_output_handling|final_output[5] -attr @rip(#000000) 5 -attr @name final_output[5] -hierPin u_m5_output_handling final_output[5] -pin u_m5_output_handling|final_output_reg[15:0] Q[5]
load net prev_row2_pixel[3] -attr @rip(#000000) prev_row2_pixel[3] -pin u_m1_line_buffer prev_row2_pixel[3] -pin u_m3_mac col_row0[3]
load net u_m3_mac|base_a[1] -attr @rip(#000000) O[1] -attr @name base_a[1] -pin u_m3_mac|acc_a0_i I0[1] -pin u_m3_mac|base_a_i O[1]
load net u_m3_mac|frame_c[16] -attr @name frame_c[16] -pin u_m3_mac|frame_c_reg[17:0] Q[16] -pin u_m3_mac|s3_c_reg[17:0] D[16]
load net u_m1_line_buffer|line_buf1_reg[23]__0[3] -attr @name line_buf1_reg[23]__0[3] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] D[3]
load net u_m3_mac|base_b[12] -attr @rip(#000000) O[12] -attr @name base_b[12] -pin u_m3_mac|acc_b0_i I0[12] -pin u_m3_mac|base_b_i O[12]
load net u_m3_mac|frame_a[14] -attr @name frame_a[14] -pin u_m3_mac|frame_a_reg[17:0] Q[14] -pin u_m3_mac|s3_a_reg[17:0] D[14]
load net u_m3_mac|ring_50[2] -attr @rip(#000000) O[2] -attr @name ring_50[2] -pin u_m3_mac|ring_50_i O[2] -pin u_m3_mac|ring_5_reg[24:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[26]__0[2] -attr @name line_buf1_reg[26]__0[2] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] D[2]
load net u_m3_mac|word_s[22] -attr @name word_s[22] -pin u_m3_mac|word_f_reg[24:0] D[22] -pin u_m3_mac|word_s_reg[24:0] Q[22]
load net u_m1_line_buffer|line_buf2_reg[23]__0[7] -attr @name line_buf2_reg[23]__0[7] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] D[7]
load net u_m3_mac|s4_a[8] -attr @name s4_a[8] -pin u_m3_mac|s4_a_reg[17:0] Q[8] -pin u_m3_mac|sum_c0_reg[17:0] D[8]
load net u_m3_mac|acc_b[17] -attr @rip(#000000) 17 -attr @name acc_b[17] -pin u_m3_mac|acc_b_reg[17:0] Q[17] -pin u_m3_mac|base_b_i I1[17] -pin u_m3_mac|frame_b_reg[17:0] D[17]
load net u_m3_mac|ring_2[20] -attr @name ring_2[20] -pin u_m3_mac|ring_1_reg[24:0] D[20] -pin u_m3_mac|ring_2_reg[24:0] Q[20]
load net u_m3_mac|ring_4[6] -attr @name ring_4[6] -pin u_m3_mac|ring_3_reg[24:0] D[6] -pin u_m3_mac|ring_4_reg[24:0] Q[6]
load net u_m1_line_buffer|line_buf1_reg[11]__0[5] -attr @name line_buf1_reg[11]__0[5] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[12][7:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[16]__0[2] -attr @name line_buf1_reg[16]__0[2] -pin u_m1_line_buffer|line_buf1_reg[16][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[17][7:0] D[2]
load net u_m3_mac|q_s0[7] -attr @name q_s0[7] -pin u_m3_mac|q_f0_reg[7:0] D[7] -pin u_m3_mac|q_s0_reg[7:0] Q[7]
load net u_m3_mac|sum_c0[17] -attr @name sum_c0[17] -pin u_m3_mac|sum_c0_reg[17:0] Q[17] -pin u_m3_mac|t1_reg[17:0] D[17]
load net u_m1_line_buffer|line_buf1_reg[28]__0[4] -attr @name line_buf1_reg[28]__0[4] -pin u_m1_line_buffer|line_buf1_reg[28][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] D[4]
load net u_m3_mac|ring_1[4] -attr @name ring_1[4] -pin u_m3_mac|ring_0_reg[24:0] D[4] -pin u_m3_mac|ring_1_reg[24:0] Q[4]
load net u_m3_mac|s4_b[7] -attr @name s4_b[7] -pin u_m3_mac|s4_b_reg[17:0] Q[7] -pin u_m3_mac|sum_c1_reg[17:0] D[7]
load net u_m3_mac|u_dsp|a_r[20] -attr @rip(#000000) 20 -attr @name a_r[20] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[20] -pin u_m3_mac|u_dsp|m_r0_i I0[20]
load net u_m3_mac|u_dsp|m_r0[25] -attr @rip(#000000) O[25] -attr @name m_r0[25] -pin u_m3_mac|u_dsp|m_r0_i O[25] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[25]
load net u_m1_line_buffer|line_buf2_reg[13]__0[4] -attr @name line_buf2_reg[13]__0[4] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] D[4]
load net u_m3_mac|ring_5[19] -attr @name ring_5[19] -pin u_m3_mac|ring_4_reg[24:0] D[19] -pin u_m3_mac|ring_5_reg[24:0] Q[19]
load net u_m3_mac|s4_b[11] -attr @name s4_b[11] -pin u_m3_mac|s4_b_reg[17:0] Q[11] -pin u_m3_mac|sum_c1_reg[17:0] D[11]
load net u_m1_line_buffer|line_buf2_reg[18]__0[2] -attr @name line_buf2_reg[18]__0[2] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] D[2]
load net u_m1_line_buffer|prev_row2_pixel[4] -attr @rip(#000000) 4 -attr @name prev_row2_pixel[4] -hierPin u_m1_line_buffer prev_row2_pixel[4] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] Q[4]
load net u_m1_line_buffer|line_buf2_reg[7]__0[4] -attr @name line_buf2_reg[7]__0[4] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] D[4]
load net u_m3_mac|ring_3[6] -attr @name ring_3[6] -pin u_m3_mac|ring_2_reg[24:0] D[6] -pin u_m3_mac|ring_3_reg[24:0] Q[6]
load net u_m3_mac|s3_c[3] -attr @name s3_c[3] -pin u_m3_mac|s3_c_reg[17:0] Q[3] -pin u_m3_mac|s4_c_reg[17:0] D[3]
load net u_m3_mac|frame_c[13] -attr @name frame_c[13] -pin u_m3_mac|frame_c_reg[17:0] Q[13] -pin u_m3_mac|s3_c_reg[17:0] D[13]
load net final_output[13] -attr @rip(#000000) final_output[13] -pin u_m5_output_handling final_output[13] -pin u_m7_fifo final_output[13]
load net u_m3_mac|ring_0[14] -attr @rip(#000000) 14 -attr @name ring_0[14] -pin u_m3_mac|ring_0_reg[24:0] Q[14] -pin u_m3_mac|ring_50_i I1[14] -pin u_m3_mac|u_dsp a[14]
load net u_m3_mac|ring_5[24] -attr @name ring_5[24] -pin u_m3_mac|ring_4_reg[24:0] D[24] -pin u_m3_mac|ring_5_reg[24:0] Q[24]
load net u_m1_line_buffer|line_buf2_reg[10]__0[5] -attr @name line_buf2_reg[10]__0[5] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] D[5]
load net u_m3_mac|acc_a[17] -attr @rip(#000000) 17 -attr @name acc_a[17] -pin u_m3_mac|acc_a_reg[17:0] Q[17] -pin u_m3_mac|base_a_i I1[17] -pin u_m3_mac|frame_a_reg[17:0] D[17]
load net u_m3_mac|base_a[0] -attr @rip(#000000) O[0] -attr @name base_a[0] -pin u_m3_mac|acc_a0_i I0[0] -pin u_m3_mac|base_a_i O[0]
load net u_m3_mac|s3_b[16] -attr @name s3_b[16] -pin u_m3_mac|s3_b_reg[17:0] Q[16] -pin u_m3_mac|s4_b_reg[17:0] D[16]
load net u_m5_output_handling|final_output[6] -attr @rip(#000000) 6 -attr @name final_output[6] -hierPin u_m5_output_handling final_output[6] -pin u_m5_output_handling|final_output_reg[15:0] Q[6]
load net u_m7_fifo|wr_ptr0 -attr @name wr_ptr0 -pin u_m7_fifo|fifo_all_outputs_done_reg RST -pin u_m7_fifo|mem_i S -pin u_m7_fifo|output_pixel_i S -pin u_m7_fifo|output_valid_reg RST -pin u_m7_fifo|rd_ptr_reg[5:0] RST -pin u_m7_fifo|release_mode_reg RST -pin u_m7_fifo|u_release_count clear -pin u_m7_fifo|wr_ptr0_i O -pin u_m7_fifo|wr_ptr_reg[5:0] RST
netloc u_m7_fifo|wr_ptr0 1 1 9 N N 15380 N NJ 298 16010 N NJ 278 16490 N 16820 408 17120 N 17500
load net u_m1_line_buffer|line_buf1_reg[10]__0[5] -attr @name line_buf1_reg[10]__0[5] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] D[5]
load net output_pixel[15] -attr @rip(#000000) output_pixel[15] -port output_pixel[15] -pin u_m7_fifo output_pixel[15]
load net u_m3_mac|base_b[13] -attr @rip(#000000) O[13] -attr @name base_b[13] -pin u_m3_mac|acc_b0_i I0[13] -pin u_m3_mac|base_b_i O[13]
load net u_m3_mac|ring_50[3] -attr @rip(#000000) O[3] -attr @name ring_50[3] -pin u_m3_mac|ring_50_i O[3] -pin u_m3_mac|ring_5_reg[24:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[23]__0[6] -attr @name line_buf2_reg[23]__0[6] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[30]__0[1] -attr @name line_buf2_reg[30]__0[1] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] D[1]
load net u_m3_mac|acc_b[16] -attr @rip(#000000) 16 -attr @name acc_b[16] -pin u_m3_mac|acc_b_reg[17:0] Q[16] -pin u_m3_mac|base_b_i I1[16] -pin u_m3_mac|frame_b_reg[17:0] D[16]
load net u_m3_mac|u_dsp|p[27] -attr @rip(#000000) 27 -attr @name p[27] -hierPin u_m3_mac|u_dsp p[27] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[27]
load net u_m3_mac|ring_1[1] -attr @name ring_1[1] -pin u_m3_mac|ring_0_reg[24:0] D[1] -pin u_m3_mac|ring_1_reg[24:0] Q[1]
load net u_m3_mac|s4_a[9] -attr @name s4_a[9] -pin u_m3_mac|s4_a_reg[17:0] Q[9] -pin u_m3_mac|sum_c0_reg[17:0] D[9]
load net u_m5_output_handling|mac_result[17] -attr @rip(#000000) mac_result[17] -attr @name mac_result[17] -hierPin u_m5_output_handling mac_result[17] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[13]
load net u_m3_mac|q_s0[6] -attr @name q_s0[6] -pin u_m3_mac|q_f0_reg[7:0] D[6] -pin u_m3_mac|q_s0_reg[7:0] Q[6]
load net u_m3_mac|ring_5[16] -attr @name ring_5[16] -pin u_m3_mac|ring_4_reg[24:0] D[16] -pin u_m3_mac|ring_5_reg[24:0] Q[16]
load net u_m3_mac|s3_a[9] -attr @name s3_a[9] -pin u_m3_mac|s3_a_reg[17:0] Q[9] -pin u_m3_mac|s4_a_reg[17:0] D[9]
load net u_m3_mac|u_dsp|m_r0[8] -attr @rip(#000000) O[8] -attr @name m_r0[8] -pin u_m3_mac|u_dsp|m_r0_i O[8] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[8]
load net u_m3_mac|ph1[0] -attr @rip(#000000) O[0] -attr @name ph1[0] -pin u_m3_mac|ph0_i I1[0] -pin u_m3_mac|ph1_i O[0]
load net u_m3_mac|ring_4[19] -attr @name ring_4[19] -pin u_m3_mac|ring_3_reg[24:0] D[19] -pin u_m3_mac|ring_4_reg[24:0] Q[19]
load net u_m3_mac|u_dsp|m_r0[24] -attr @rip(#000000) O[24] -attr @name m_r0[24] -pin u_m3_mac|u_dsp|m_r0_i O[24] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[24]
load net u_m3_mac|s4_b[10] -attr @name s4_b[10] -pin u_m3_mac|s4_b_reg[17:0] Q[10] -pin u_m3_mac|sum_c1_reg[17:0] D[10]
load net u_m3_mac|s4_b[8] -attr @name s4_b[8] -pin u_m3_mac|s4_b_reg[17:0] Q[8] -pin u_m3_mac|sum_c1_reg[17:0] D[8]
load net u_m3_mac|u_dsp|a_r[21] -attr @rip(#000000) 21 -attr @name a_r[21] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[21] -pin u_m3_mac|u_dsp|m_r0_i I0[21]
load net u_m1_line_buffer|line_buf2_reg[13]__0[5] -attr @name line_buf2_reg[13]__0[5] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] D[5]
load net u_m3_mac|<const0> -ground -attr @name <const0> -pin u_m3_mac|base_a_i I0[17] -pin u_m3_mac|base_a_i I0[16] -pin u_m3_mac|base_a_i I0[15] -pin u_m3_mac|base_a_i I0[14] -pin u_m3_mac|base_a_i I0[13] -pin u_m3_mac|base_a_i I0[12] -pin u_m3_mac|base_a_i I0[11] -pin u_m3_mac|base_a_i I0[10] -pin u_m3_mac|base_a_i I0[9] -pin u_m3_mac|base_a_i I0[8] -pin u_m3_mac|base_a_i I0[7] -pin u_m3_mac|base_a_i I0[6] -pin u_m3_mac|base_a_i I0[5] -pin u_m3_mac|base_a_i I0[4] -pin u_m3_mac|base_a_i I0[3] -pin u_m3_mac|base_a_i I0[2] -pin u_m3_mac|base_a_i I0[1] -pin u_m3_mac|base_a_i I0[0] -pin u_m3_mac|base_b_i I0[17] -pin u_m3_mac|base_b_i I0[16] -pin u_m3_mac|base_b_i I0[15] -pin u_m3_mac|base_b_i I0[14] -pin u_m3_mac|base_b_i I0[13] -pin u_m3_mac|base_b_i I0[12] -pin u_m3_mac|base_b_i I0[11] -pin u_m3_mac|base_b_i I0[10] -pin u_m3_mac|base_b_i I0[9] -pin u_m3_mac|base_b_i I0[8] -pin u_m3_mac|base_b_i I0[7] -pin u_m3_mac|base_b_i I0[6] -pin u_m3_mac|base_b_i I0[5] -pin u_m3_mac|base_b_i I0[4] -pin u_m3_mac|base_b_i I0[3] -pin u_m3_mac|base_b_i I0[2] -pin u_m3_mac|base_b_i I0[1] -pin u_m3_mac|base_b_i I0[0] -pin u_m3_mac|base_c_i I0[17] -pin u_m3_mac|base_c_i I0[16] -pin u_m3_mac|base_c_i I0[15] -pin u_m3_mac|base_c_i I0[14] -pin u_m3_mac|base_c_i I0[13] -pin u_m3_mac|base_c_i I0[12] -pin u_m3_mac|base_c_i I0[11] -pin u_m3_mac|base_c_i I0[10] -pin u_m3_mac|base_c_i I0[9] -pin u_m3_mac|base_c_i I0[8] -pin u_m3_mac|base_c_i I0[7] -pin u_m3_mac|base_c_i I0[6] -pin u_m3_mac|base_c_i I0[5] -pin u_m3_mac|base_c_i I0[4] -pin u_m3_mac|base_c_i I0[2] -pin u_m3_mac|base_c_i I0[1] -pin u_m3_mac|base_c_i I0[0] -pin u_m3_mac|hi_lane_i I1[8] -pin u_m3_mac|hi_lane_i I1[7] -pin u_m3_mac|hi_lane_i I1[6] -pin u_m3_mac|hi_lane_i I1[5] -pin u_m3_mac|hi_lane_i I1[4] -pin u_m3_mac|hi_lane_i I1[3] -pin u_m3_mac|hi_lane_i I1[2] -pin u_m3_mac|hi_lane_i I1[1] -pin u_m3_mac|hi_src_i I1[7] -pin u_m3_mac|hi_src_i I1[6] -pin u_m3_mac|hi_src_i I1[5] -pin u_m3_mac|hi_src_i I1[4] -pin u_m3_mac|hi_src_i I1[3] -pin u_m3_mac|hi_src_i I1[2] -pin u_m3_mac|hi_src_i I1[1] -pin u_m3_mac|hi_src_i I1[0] -pin u_m3_mac|insph_s0_i__0 I1[1] -pin u_m3_mac|ld_s1_i I1[1] -pin u_m3_mac|ld_s1_i I1[0] -pin u_m3_mac|ph0_i I0[2] -pin u_m3_mac|ph0_i I0[1] -pin u_m3_mac|ph0_i I0[0] -pin u_m3_mac|ph_i I0[5] -pin u_m3_mac|ph_i I0[4] -pin u_m3_mac|ph_i I0[3] -pin u_m3_mac|ph_i I0[2] -pin u_m3_mac|ph_i I0[1] -pin u_m3_mac|ph_i I1[5] -pin u_m3_mac|ph_i I1[4] -pin u_m3_mac|ph_i I1[3] -pin u_m3_mac|ph_i I1[2] -pin u_m3_mac|ph_i I1[0] -pin u_m3_mac|ph_i I2[5] -pin u_m3_mac|ph_i I2[4] -pin u_m3_mac|ph_i I2[3] -pin u_m3_mac|ph_i I2[1] -pin u_m3_mac|ph_i I2[0] -pin u_m3_mac|ph_i I3[5] -pin u_m3_mac|ph_i I3[4] -pin u_m3_mac|ph_i I3[2] -pin u_m3_mac|ph_i I3[1] -pin u_m3_mac|ph_i I3[0] -pin u_m3_mac|ph_i I4[5] -pin u_m3_mac|ph_i I4[3] -pin u_m3_mac|ph_i I4[2] -pin u_m3_mac|ph_i I4[1] -pin u_m3_mac|ph_i I4[0] -pin u_m3_mac|ph_i I5[4] -pin u_m3_mac|ph_i I5[3] -pin u_m3_mac|ph_i I5[2] -pin u_m3_mac|ph_i I5[1] -pin u_m3_mac|ph_i I5[0] -pin u_m3_mac|prev_c01_i I1[1] -pin u_m3_mac|prev_c01_i I1[0] -pin u_m3_mac|slot0_i I1[0] -pin u_m3_mac|slot_i I0[0] -pin u_m3_mac|slot_i I1[2] -pin u_m3_mac|slot_i I1[1]
load net u_m1_line_buffer|prev_row2_pixel[3] -attr @rip(#000000) 3 -attr @name prev_row2_pixel[3] -hierPin u_m1_line_buffer prev_row2_pixel[3] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] Q[3]
load net u_m7_fifo|rd_ptr0[1] -attr @rip(#000000) O[1] -attr @name rd_ptr0[1] -pin u_m7_fifo|rd_ptr0_i O[1] -pin u_m7_fifo|rd_ptr_reg[5:0] D[1]
load net u_m3_mac|ring_0[11] -attr @rip(#000000) 11 -attr @name ring_0[11] -pin u_m3_mac|ring_0_reg[24:0] Q[11] -pin u_m3_mac|ring_50_i I1[11] -pin u_m3_mac|u_dsp a[11]
load net u_m3_mac|ring_3[5] -attr @name ring_3[5] -pin u_m3_mac|ring_2_reg[24:0] D[5] -pin u_m3_mac|ring_3_reg[24:0] Q[5]
load net u_m1_line_buffer|line_buf2_reg[18]__0[3] -attr @name line_buf2_reg[18]__0[3] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[7]__0[5] -attr @name line_buf2_reg[7]__0[5] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] D[5]
load net u_m3_mac|ring_5[23] -attr @name ring_5[23] -pin u_m3_mac|ring_4_reg[24:0] D[23] -pin u_m3_mac|ring_5_reg[24:0] Q[23]
load net u_m3_mac|s3_c[4] -attr @name s3_c[4] -pin u_m3_mac|s3_c_reg[17:0] Q[4] -pin u_m3_mac|s4_c_reg[17:0] D[4]
load net u_m6_control_fsm|clk -attr @name clk -hierPin u_m6_control_fsm clk -pin u_m6_control_fsm|drain_sr_reg[6:0] C -pin u_m6_control_fsm|state_reg[1:0] C -pin u_m6_control_fsm|u_pixel_count clk
netloc u_m6_control_fsm|clk 1 0 6 NJ 598 NJ 598 18920 598 19200 588 NJ 588 NJ
load net u_m3_mac|frame_c[14] -attr @name frame_c[14] -pin u_m3_mac|frame_c_reg[17:0] Q[14] -pin u_m3_mac|s3_c_reg[17:0] D[14]
load net u_m1_line_buffer|line_buf1_reg[21]__0[2] -attr @name line_buf1_reg[21]__0[2] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] D[2]
load net u_m2_window_generator|u_col|<const0> -ground -attr @name <const0> -pin u_m2_window_generator|u_col|at_count_i I1[5] -pin u_m2_window_generator|u_col|at_count_i I1[1] -pin u_m2_window_generator|u_col|at_count_i I1[0] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I1[3] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I1[2] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I1[1] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I1[0]
load net u_m1_line_buffer|line_buf1_reg[10]__0[4] -attr @name line_buf1_reg[10]__0[4] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] D[4]
load net u_m1_line_buffer|line_buf1_reg[26]__0[0] -attr @name line_buf1_reg[26]__0[0] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[10]__0[6] -attr @name line_buf2_reg[10]__0[6] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] D[6]
load net u_m3_mac|word_s[20] -attr @name word_s[20] -pin u_m3_mac|word_f_reg[24:0] D[20] -pin u_m3_mac|word_s_reg[24:0] Q[20]
load net u_m5_output_handling|final_output[7] -attr @rip(#000000) 7 -attr @name final_output[7] -hierPin u_m5_output_handling final_output[7] -pin u_m5_output_handling|final_output_reg[15:0] Q[7]
load net output_pixel[14] -attr @rip(#000000) output_pixel[14] -port output_pixel[14] -pin u_m7_fifo output_pixel[14]
load net u_m3_mac|ring_2[19] -attr @name ring_2[19] -pin u_m3_mac|ring_1_reg[24:0] D[19] -pin u_m3_mac|ring_2_reg[24:0] Q[19]
load net u_m2_window_generator|pass_reset -attr @name pass_reset -hierPin u_m2_window_generator pass_reset -pin u_m2_window_generator|pass_clear_i I1
netloc u_m2_window_generator|pass_reset 1 0 1 1590
load net u_m1_line_buffer|line_buf2_reg[23]__0[5] -attr @name line_buf2_reg[23]__0[5] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] D[5]
load net u_m3_mac|s4_a[6] -attr @name s4_a[6] -pin u_m3_mac|s4_a_reg[17:0] Q[6] -pin u_m3_mac|sum_c0_reg[17:0] D[6]
load net u_m3_mac|acc_b[15] -attr @rip(#000000) 15 -attr @name acc_b[15] -pin u_m3_mac|acc_b_reg[17:0] Q[15] -pin u_m3_mac|base_b_i I1[15] -pin u_m3_mac|frame_b_reg[17:0] D[15]
load net u_m3_mac|base_b[14] -attr @rip(#000000) O[14] -attr @name base_b[14] -pin u_m3_mac|acc_b0_i I0[14] -pin u_m3_mac|base_b_i O[14]
load net u_m3_mac|ring_50[4] -attr @rip(#000000) O[4] -attr @name ring_50[4] -pin u_m3_mac|ring_50_i O[4] -pin u_m3_mac|ring_5_reg[24:0] D[4]
load net u_m3_mac|u_dsp|p[26] -attr @rip(#000000) 26 -attr @name p[26] -hierPin u_m3_mac|u_dsp p[26] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[26]
load net u_m5_output_handling|out_val[11] -attr @name out_val[11] -pin u_m5_output_handling|final_output_reg[15:0] D[11] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[11]
load net u_m1_line_buffer|line_buf2_reg[30]__0[2] -attr @name line_buf2_reg[30]__0[2] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[29]__0[0] -attr @name line_buf1_reg[29]__0[0] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] D[0]
load net mac_result[14] -attr @rip(#000000) mac_result[14] -pin u_m3_mac mac_result[14] -pin u_m5_output_handling mac_result[14]
load net u_m7_fifo|output_pixel_i_n_0 -attr @name output_pixel_i_n_0 -pin u_m7_fifo|output_pixel_i O -pin u_m7_fifo|output_pixel_reg[15:0] CE
netloc u_m7_fifo|output_pixel_i_n_0 1 9 1 17460
load net u_m3_mac|ring_1[2] -attr @name ring_1[2] -pin u_m3_mac|ring_0_reg[24:0] D[2] -pin u_m3_mac|ring_1_reg[24:0] Q[2]
load net u_m5_output_handling|mac_result[18] -attr @rip(#000000) mac_result[18] -attr @name mac_result[18] -hierPin u_m5_output_handling mac_result[18] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[14]
load net u_m1_line_buffer|line_buf2_reg[13]__0[2] -attr @name line_buf2_reg[13]__0[2] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] D[2]
load net u_m3_mac|col_row2[0] -attr @rip(#000000) col_row2[0] -attr @name col_row2[0] -hierPin u_m3_mac col_row2[0] -pin u_m3_mac|q_s2_reg[7:0] D[0]
load net u_m3_mac|ring_5[17] -attr @name ring_5[17] -pin u_m3_mac|ring_4_reg[24:0] D[17] -pin u_m3_mac|ring_5_reg[24:0] Q[17]
load net u_m3_mac|u_dsp|m_r0[9] -attr @rip(#000000) O[9] -attr @name m_r0[9] -pin u_m3_mac|u_dsp|m_r0_i O[9] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[9]
load net u_m3_mac|ph1[1] -attr @rip(#000000) O[1] -attr @name ph1[1] -pin u_m3_mac|ph0_i I1[1] -pin u_m3_mac|ph1_i O[1]
load net u_m1_line_buffer|prev_row2_pixel[2] -attr @rip(#000000) 2 -attr @name prev_row2_pixel[2] -hierPin u_m1_line_buffer prev_row2_pixel[2] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] Q[2]
load net u_m3_mac|acc_a[11] -attr @rip(#000000) 11 -attr @name acc_a[11] -pin u_m3_mac|acc_a_reg[17:0] Q[11] -pin u_m3_mac|base_a_i I1[11] -pin u_m3_mac|frame_a_reg[17:0] D[11]
load net u_m1_line_buffer|line_buf1_reg[7]__0[4] -attr @name line_buf1_reg[7]__0[4] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] D[4]
load net u_m1_line_buffer|line_buf1_reg[8]__0[7] -attr @name line_buf1_reg[8]__0[7] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] D[7]
load net u_m3_mac|word_s[11] -attr @name word_s[11] -pin u_m3_mac|word_f_reg[24:0] D[11] -pin u_m3_mac|word_s_reg[24:0] Q[11]
load net u_m3_mac|ring_3[4] -attr @name ring_3[4] -pin u_m3_mac|ring_2_reg[24:0] D[4] -pin u_m3_mac|ring_3_reg[24:0] Q[4]
load net u_m3_mac|s3_c[1] -attr @name s3_c[1] -pin u_m3_mac|s3_c_reg[17:0] Q[1] -pin u_m3_mac|s4_c_reg[17:0] D[1]
load net u_m3_mac|u_dsp|a_r[22] -attr @rip(#000000) 22 -attr @name a_r[22] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[22] -pin u_m3_mac|u_dsp|m_r0_i I0[22]
load net u_m3_mac|u_dsp|m_r0[27] -attr @rip(#000000) O[27] -attr @name m_r0[27] -pin u_m3_mac|u_dsp|m_r0_i O[27] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[27]
load net rst -port rst -pin u_m2_window_generator rst -pin u_m3_mac rst -pin u_m5_output_handling rst -pin u_m6_control_fsm rst -pin u_m7_fifo rst
netloc rst 1 0 8 NJ 210 310J 368 700J 210 1400 202 5040 1248 13400 474 14650 908 18180J
load net u_m3_mac|frame_c[11] -attr @name frame_c[11] -pin u_m3_mac|frame_c_reg[17:0] Q[11] -pin u_m3_mac|s3_c_reg[17:0] D[11]
load net u_m7_fifo|rd_ptr0[2] -attr @rip(#000000) O[2] -attr @name rd_ptr0[2] -pin u_m7_fifo|rd_ptr0_i O[2] -pin u_m7_fifo|rd_ptr_reg[5:0] D[2]
load net u_m3_mac|ring_0[12] -attr @rip(#000000) 12 -attr @name ring_0[12] -pin u_m3_mac|ring_0_reg[24:0] Q[12] -pin u_m3_mac|ring_50_i I1[12] -pin u_m3_mac|u_dsp a[12]
load net u_m1_line_buffer|line_buf2_reg[18]__0[4] -attr @name line_buf2_reg[18]__0[4] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] D[4]
load net u_m3_mac|rst -attr @name rst -hierPin u_m3_mac rst -pin u_m3_mac|ev_reg[5:1] RST -pin u_m3_mac|tog_s_reg RST -pin u_m3_mac|wv_reg[6:1] RST
netloc u_m3_mac|rst 1 0 27 NJ 448 5510 N 5800 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ 68 NJ N 11670 418 11830J 488 NJ 488 NJ 488 NJ 488 NJ 488 NJ
load net u_m1_line_buffer|line_buf2_reg[7]__0[6] -attr @name line_buf2_reg[7]__0[6] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] D[6]
load net u_m2_window_generator|row_ge_i__0_n_0 -attr @rip O[1] -attr @name row_ge_i__0_n_0 -pin u_m2_window_generator|row_ge_i__0 O[1]
load net u_m3_mac|s4_b[17] -attr @name s4_b[17] -pin u_m3_mac|s4_b_reg[17:0] Q[17] -pin u_m3_mac|sum_c1_reg[17:0] D[17]
load net u_m1_line_buffer|line_buf1_reg[21]__0[3] -attr @name line_buf1_reg[21]__0[3] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] D[3]
load net u_m2_window_generator|row_ge_i__0_n_1 -attr @rip O[0] -attr @name row_ge_i__0_n_1 -pin u_m2_window_generator|row_ge_i__0 O[0] -pin u_m2_window_generator|row_ge_reg[1:0] SET[0]
load net output_pixel[13] -attr @rip(#000000) output_pixel[13] -port output_pixel[13] -pin u_m7_fifo output_pixel[13]
load net u_m3_mac|ring_2[18] -attr @name ring_2[18] -pin u_m3_mac|ring_1_reg[24:0] D[18] -pin u_m3_mac|ring_2_reg[24:0] Q[18]
load net u_m1_line_buffer|line_buf2_reg[23]__0[4] -attr @name line_buf2_reg[23]__0[4] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[10]__0[7] -attr @name line_buf2_reg[10]__0[7] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] D[7]
load net u_m5_output_handling|final_output[8] -attr @rip(#000000) 8 -attr @name final_output[8] -hierPin u_m5_output_handling final_output[8] -pin u_m5_output_handling|final_output_reg[15:0] Q[8]
load net u_m3_mac|acc_b[14] -attr @rip(#000000) 14 -attr @name acc_b[14] -pin u_m3_mac|acc_b_reg[17:0] Q[14] -pin u_m3_mac|base_b_i I1[14] -pin u_m3_mac|frame_b_reg[17:0] D[14]
load net prev_row2_pixel[6] -attr @rip(#000000) prev_row2_pixel[6] -pin u_m1_line_buffer prev_row2_pixel[6] -pin u_m3_mac col_row0[6]
load net u_m3_mac|u_dsp|p[25] -attr @rip(#000000) 25 -attr @name p[25] -hierPin u_m3_mac|u_dsp p[25] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[25]
load net u_m5_output_handling|out_val[10] -attr @name out_val[10] -pin u_m5_output_handling|final_output_reg[15:0] D[10] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[10]
load net mac_result[13] -attr @rip(#000000) mac_result[13] -pin u_m3_mac mac_result[13] -pin u_m5_output_handling mac_result[13]
load net u_m3_mac|insph_f[2] -attr @rip(#000000) 2 -attr @name insph_f[2] -pin u_m3_mac|insph_f_reg[2:0] Q[2] -pin u_m3_mac|ring_53_i I1[2]
load net u_m3_mac|s4_a[7] -attr @name s4_a[7] -pin u_m3_mac|s4_a_reg[17:0] Q[7] -pin u_m3_mac|sum_c0_reg[17:0] D[7]
load net u_m3_mac|tap_data[7] -attr @rip(#000000) tap_data[7] -attr @name tap_data[7] -hierPin u_m3_mac tap_data[7] -pin u_m3_mac|hi_lane_i I1[0] -pin u_m3_mac|prev_c0_reg[7:0] D[7] -pin u_m3_mac|word_s_reg[24:0] D[15] -pin u_m3_mac|word_s_reg[24:0] D[14] -pin u_m3_mac|word_s_reg[24:0] D[13] -pin u_m3_mac|word_s_reg[24:0] D[12] -pin u_m3_mac|word_s_reg[24:0] D[11] -pin u_m3_mac|word_s_reg[24:0] D[10] -pin u_m3_mac|word_s_reg[24:0] D[9] -pin u_m3_mac|word_s_reg[24:0] D[8] -pin u_m3_mac|word_s_reg[24:0] D[7]
load net relu_enable -port relu_enable -pin u_m5_output_handling relu_enable
netloc relu_enable 1 0 6 NJ 390 310J 548 680J 390 1280J 1032 4980J 1308 13420J
load net u_m1_line_buffer|line_buf1_reg[23]__0[6] -attr @name line_buf1_reg[23]__0[6] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] D[6]
load net u_m3_mac|base_b[15] -attr @rip(#000000) O[15] -attr @name base_b[15] -pin u_m3_mac|acc_b0_i I0[15] -pin u_m3_mac|base_b_i O[15]
load net u_m3_mac|ring_5[14] -attr @name ring_5[14] -pin u_m3_mac|ring_4_reg[24:0] D[14] -pin u_m3_mac|ring_5_reg[24:0] Q[14]
load net u_m3_mac|s3_a[7] -attr @name s3_a[7] -pin u_m3_mac|s3_a_reg[17:0] Q[7] -pin u_m3_mac|s4_a_reg[17:0] D[7]
load net u_m3_mac|u_dsp|p0[31] -attr @rip(#000000) O[31] -attr @name p0[31] -pin u_m3_mac|u_dsp|p0_i O[31] -pin u_m3_mac|u_dsp|p_reg[33:0] D[31]
load net u_m1_line_buffer|line_buf1_reg[29]__0[1] -attr @name line_buf1_reg[29]__0[1] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] D[1]
load net u_m1_line_buffer|line_buf1_reg[26]__0[5] -attr @name line_buf1_reg[26]__0[5] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[13]__0[7] -attr @name line_buf1_reg[13]__0[7] -pin u_m1_line_buffer|line_buf1_reg[13][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[14][7:0] D[7]
load net u_m5_output_handling|mac_result[19] -attr @rip(#000000) mac_result[19] -attr @name mac_result[19] -hierPin u_m5_output_handling mac_result[19] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[16] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[15]
load net u_m1_line_buffer|prev_row2_pixel[1] -attr @rip(#000000) 1 -attr @name prev_row2_pixel[1] -hierPin u_m1_line_buffer prev_row2_pixel[1] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] Q[1]
load net u_m1_line_buffer|line_buf2_reg[13]__0[3] -attr @name line_buf2_reg[13]__0[3] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] D[3]
load net u_m3_mac|col_row2[1] -attr @rip(#000000) col_row2[1] -attr @name col_row2[1] -hierPin u_m3_mac col_row2[1] -pin u_m3_mac|q_s2_reg[7:0] D[1]
load net u_m3_mac|word_s[10] -attr @name word_s[10] -pin u_m3_mac|word_f_reg[24:0] D[10] -pin u_m3_mac|word_s_reg[24:0] Q[10]
load net u_m3_mac|ph1[2] -attr @rip(#000000) O[2] -attr @name ph1[2] -pin u_m3_mac|ph0_i I1[2] -pin u_m3_mac|ph1_i O[2]
load net u_m3_mac|ring_3[3] -attr @name ring_3[3] -pin u_m3_mac|ring_2_reg[24:0] D[3] -pin u_m3_mac|ring_3_reg[24:0] Q[3]
load net u_m3_mac|u_dsp|m_r0[26] -attr @rip(#000000) O[26] -attr @name m_r0[26] -pin u_m3_mac|u_dsp|m_r0_i O[26] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[26]
load net u_m3_mac|acc_a[12] -attr @rip(#000000) 12 -attr @name acc_a[12] -pin u_m3_mac|acc_a_reg[17:0] Q[12] -pin u_m3_mac|base_a_i I1[12] -pin u_m3_mac|frame_a_reg[17:0] D[12]
load net u_m1_line_buffer|line_buf1_reg[7]__0[5] -attr @name line_buf1_reg[7]__0[5] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] D[5]
load net u_m3_mac|u_dsp|p0[21] -attr @rip(#000000) O[21] -attr @name p0[21] -pin u_m3_mac|u_dsp|p0_i O[21] -pin u_m3_mac|u_dsp|p_reg[33:0] D[21]
load net u_m3_mac|s3_c[2] -attr @name s3_c[2] -pin u_m3_mac|s3_c_reg[17:0] Q[2] -pin u_m3_mac|s4_c_reg[17:0] D[2]
load net u_m3_mac|u_dsp|a_r[23] -attr @rip(#000000) 23 -attr @name a_r[23] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[23] -pin u_m3_mac|u_dsp|m_r0_i I0[23]
load net u_m4_kernel_storage|streaming -attr @name streaming -pin u_m4_kernel_storage|rd_tap_i I1 -pin u_m4_kernel_storage|streaming_i O -pin u_m4_kernel_storage|sweep_left_reg[9:0] CE -pin u_m4_kernel_storage|tap_data_reg[7:0] CE -pin u_m4_kernel_storage|tap_idx_reg[3:0] CE -pin u_m4_kernel_storage|tap_valid_reg D
netloc u_m4_kernel_storage|streaming 1 4 7 2740 1642 NJ 1642 3230 1612 NJ 1612 3810J 1562 4100J 1542 4360
load net u_m3_mac|frame_c[12] -attr @name frame_c[12] -pin u_m3_mac|frame_c_reg[17:0] Q[12] -pin u_m3_mac|s3_c_reg[17:0] D[12]
load net u_m1_line_buffer|line_buf1_reg[21]__0[0] -attr @name line_buf1_reg[21]__0[0] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] D[0]
load net u_m3_mac|s4_b[16] -attr @name s4_b[16] -pin u_m3_mac|s4_b_reg[17:0] Q[16] -pin u_m3_mac|sum_c1_reg[17:0] D[16]
load net output_pixel[12] -attr @rip(#000000) output_pixel[12] -port output_pixel[12] -pin u_m7_fifo output_pixel[12]
load net u_m1_line_buffer|line_buf2_reg[7]__0[7] -attr @name line_buf2_reg[7]__0[7] -pin u_m1_line_buffer|line_buf2_reg[7][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] D[7]
load net u_m3_mac|ring_2[17] -attr @name ring_2[17] -pin u_m3_mac|ring_1_reg[24:0] D[17] -pin u_m3_mac|ring_2_reg[24:0] Q[17]
load net u_m3_mac|u_dsp|m_r[10] -attr @rip(#000000) 10 -attr @name m_r[10] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[10] -pin u_m3_mac|u_dsp|p0_i I0[10]
load net u_m1_line_buffer|line_buf2_reg[23]__0[3] -attr @name line_buf2_reg[23]__0[3] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] D[3]
load net u_m3_mac|s4_a[4] -attr @name s4_a[4] -pin u_m3_mac|s4_a_reg[17:0] Q[4] -pin u_m3_mac|sum_c0_reg[17:0] D[4]
load net u_m3_mac|sum_c1[9] -attr @rip(#000000) 9 -attr @name sum_c1[9] -pin u_m3_mac|sum_c1_reg[17:0] Q[9] -pin u_m3_mac|t20_i I1[9]
load net u_m3_mac|acc_b[13] -attr @rip(#000000) 13 -attr @name acc_b[13] -pin u_m3_mac|acc_b_reg[17:0] Q[13] -pin u_m3_mac|base_b_i I1[13] -pin u_m3_mac|frame_b_reg[17:0] D[13]
load net u_m3_mac|sum_c2[1] -attr @rip(#000000) 1 -attr @name sum_c2[1] -pin u_m3_mac|acc_r0_i I1[1] -pin u_m3_mac|sum_c2_reg[17:0] Q[1]
load net u_m3_mac|u_dsp|p[24] -attr @rip(#000000) 24 -attr @name p[24] -hierPin u_m3_mac|u_dsp p[24] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[24]
load net u_m1_line_buffer|line_buf2_reg[30]__0[0] -attr @name line_buf2_reg[30]__0[0] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] D[0]
load net mac_result[12] -attr @rip(#000000) mac_result[12] -pin u_m3_mac mac_result[12] -pin u_m5_output_handling mac_result[12]
load net u_m3_mac|insph_f[1] -attr @rip(#000000) 1 -attr @name insph_f[1] -pin u_m3_mac|insph_f_reg[2:0] Q[1] -pin u_m3_mac|ring_53_i I1[1]
load net prev_row2_pixel[7] -attr @rip(#000000) prev_row2_pixel[7] -pin u_m1_line_buffer prev_row2_pixel[7] -pin u_m3_mac col_row0[7]
load net u_m3_mac|q_s0[3] -attr @name q_s0[3] -pin u_m3_mac|q_f0_reg[7:0] D[3] -pin u_m3_mac|q_s0_reg[7:0] Q[3]
load net u_m1_line_buffer|line_buf2_reg[13]__0[0] -attr @name line_buf2_reg[13]__0[0] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] D[0]
load net u_m1_line_buffer|line_buf1_reg[23]__0[7] -attr @name line_buf1_reg[23]__0[7] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] D[7]
load net u_m3_mac|base_b[16] -attr @rip(#000000) O[16] -attr @name base_b[16] -pin u_m3_mac|acc_b0_i I0[16] -pin u_m3_mac|base_b_i O[16]
load net u_m3_mac|q_f1[3] -attr @rip(#000000) 3 -attr @name q_f1[3] -pin u_m3_mac|b_mux_i I1[3] -pin u_m3_mac|q_f1_reg[7:0] Q[3]
load net u_m3_mac|ring_5[15] -attr @name ring_5[15] -pin u_m3_mac|ring_4_reg[24:0] D[15] -pin u_m3_mac|ring_5_reg[24:0] Q[15]
load net u_m3_mac|s3_a[8] -attr @name s3_a[8] -pin u_m3_mac|s3_a_reg[17:0] Q[8] -pin u_m3_mac|s4_a_reg[17:0] D[8]
load net u_m3_mac|u_dsp|p0[32] -attr @rip(#000000) O[32] -attr @name p0[32] -pin u_m3_mac|u_dsp|p0_i O[32] -pin u_m3_mac|u_dsp|p_reg[33:0] D[32]
load net u_m5_output_handling|out_val[13] -attr @name out_val[13] -pin u_m5_output_handling|final_output_reg[15:0] D[13] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[13]
load net u_m1_line_buffer|line_buf1_reg[29]__0[2] -attr @name line_buf1_reg[29]__0[2] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[26]__0[6] -attr @name line_buf1_reg[26]__0[6] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] D[6]
load net u_m1_line_buffer|line_buf1_reg[5]__0[0] -attr @name line_buf1_reg[5]__0[0] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] D[0]
load net u_m3_mac|insph_s0 -attr @name insph_s0 -pin u_m3_mac|insph_s0_i__0 O -pin u_m3_mac|insph_s_reg[2:0] RST
netloc u_m3_mac|insph_s0 1 4 1 NJ
load net u_m1_line_buffer|prev_row2_pixel[0] -attr @rip(#000000) 0 -attr @name prev_row2_pixel[0] -hierPin u_m1_line_buffer prev_row2_pixel[0] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] Q[0]
load net u_m3_mac|sum_c1[0] -attr @rip(#000000) 0 -attr @name sum_c1[0] -pin u_m3_mac|sum_c1_reg[17:0] Q[0] -pin u_m3_mac|t20_i I1[0]
load net u_m6_control_fsm|start -attr @name start -hierPin u_m6_control_fsm start -pin u_m6_control_fsm|start_pass_i I0
netloc u_m6_control_fsm|start 1 0 8 NJ 988 NJ 988 NJ 988 NJ 988 NJ 988 NJ 988 NJ 988 N
load net u_m3_mac|u_dsp|p0[20] -attr @rip(#000000) O[20] -attr @name p0[20] -pin u_m3_mac|u_dsp|p0_i O[20] -pin u_m3_mac|u_dsp|p_reg[33:0] D[20]
load net u_m5_output_handling|final_output[0] -attr @rip(#000000) 0 -attr @name final_output[0] -hierPin u_m5_output_handling final_output[0] -pin u_m5_output_handling|final_output_reg[15:0] Q[0]
load net u_m7_fifo|rd_ptr0[0] -attr @rip(#000000) O[0] -attr @name rd_ptr0[0] -pin u_m7_fifo|rd_ptr0_i O[0] -pin u_m7_fifo|rd_ptr_reg[5:0] D[0]
load net kernel_wr_data[6] -attr @rip(#000000) kernel_wr_data[6] -port kernel_wr_data[6] -pin u_m4_kernel_storage kernel_wr_data[6]
load net u_m3_mac|ring_0[10] -attr @rip(#000000) 10 -attr @name ring_0[10] -pin u_m3_mac|ring_0_reg[24:0] Q[10] -pin u_m3_mac|ring_50_i I1[10] -pin u_m3_mac|u_dsp a[10]
load net u_m3_mac|ring_5[20] -attr @name ring_5[20] -pin u_m3_mac|ring_4_reg[24:0] D[20] -pin u_m3_mac|ring_5_reg[24:0] Q[20]
load net u_m3_mac|u_dsp|p[33] -attr @rip(#000000) 33 -attr @name p[33] -hierPin u_m3_mac|u_dsp p[33] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[33]
load net u_m3_mac|acc_a[13] -attr @rip(#000000) 13 -attr @name acc_a[13] -pin u_m3_mac|acc_a_reg[17:0] Q[13] -pin u_m3_mac|base_a_i I1[13] -pin u_m3_mac|frame_a_reg[17:0] D[13]
load net u_m1_line_buffer|line_buf1_reg[7]__0[6] -attr @name line_buf1_reg[7]__0[6] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[26]__0[6] -attr @name line_buf2_reg[26]__0[6] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] D[6]
load net u_m2_window_generator|u_col|clear -attr @name clear -hierPin u_m2_window_generator|u_col clear -pin u_m2_window_generator|u_col|state_reg[5:0] RST
netloc u_m2_window_generator|u_col|clear 1 0 3 NJ 776 NJ 776 N
load net u_m1_line_buffer|line_buf1_reg[10]__0[1] -attr @name line_buf1_reg[10]__0[1] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] D[1]
load net u_m3_mac|u_dsp|a_r[24] -attr @rip(#000000) 24 -attr @name a_r[24] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[24] -pin u_m3_mac|u_dsp|m_r0_i I0[24]
load net u_m3_mac|u_dsp|m_r0[29] -attr @rip(#000000) O[29] -attr @name m_r0[29] -pin u_m3_mac|u_dsp|m_r0_i O[29] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[29]
load net u_m3_mac|ph0[1] -attr @rip(#000000) O[1] -attr @name ph0[1] -pin u_m3_mac|ph0_i O[1] -pin u_m3_mac|ph_reg[2:0] D[1]
load net u_m3_mac|s4_b[15] -attr @name s4_b[15] -pin u_m3_mac|s4_b_reg[17:0] Q[15] -pin u_m3_mac|sum_c1_reg[17:0] D[15]
load net u_m1_line_buffer|line_buf1_reg[21]__0[1] -attr @name line_buf1_reg[21]__0[1] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] D[1]
load net u_m1_line_buffer|line_buf2_reg[23]__0[2] -attr @name line_buf2_reg[23]__0[2] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] D[2]
load net u_m2_window_generator|u_col|<const1> -power -attr @name <const1> -pin u_m2_window_generator|u_col|at_count_i I1[4] -pin u_m2_window_generator|u_col|at_count_i I1[3] -pin u_m2_window_generator|u_col|at_count_i I1[2] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I1[5] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I1[4]
load net u_m3_mac|acc_b[12] -attr @rip(#000000) 12 -attr @name acc_b[12] -pin u_m3_mac|acc_b_reg[17:0] Q[12] -pin u_m3_mac|base_b_i I1[12] -pin u_m3_mac|frame_b_reg[17:0] D[12]
load net u_m3_mac|sum_c2[0] -attr @rip(#000000) 0 -attr @name sum_c2[0] -pin u_m3_mac|acc_r0_i I1[0] -pin u_m3_mac|sum_c2_reg[17:0] Q[0]
load net u_m3_mac|u_dsp|m_r[11] -attr @rip(#000000) 11 -attr @name m_r[11] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[11] -pin u_m3_mac|u_dsp|p0_i I0[11]
load net mac_result[11] -attr @rip(#000000) mac_result[11] -pin u_m3_mac mac_result[11] -pin u_m5_output_handling mac_result[11]
load net u_m3_mac|insph_f[0] -attr @rip(#000000) 0 -attr @name insph_f[0] -pin u_m3_mac|insph_f_reg[2:0] Q[0] -pin u_m3_mac|ring_53_i I1[0]
load net u_m3_mac|q_s2[5] -attr @name q_s2[5] -pin u_m3_mac|q_f2_reg[7:0] D[5] -pin u_m3_mac|q_s2_reg[7:0] Q[5]
load net u_m3_mac|s4_a[5] -attr @name s4_a[5] -pin u_m3_mac|s4_a_reg[17:0] Q[5] -pin u_m3_mac|sum_c0_reg[17:0] D[5]
load net u_m4_kernel_storage|rd_tap0[3] -attr @rip(#000000) O[3] -attr @name rd_tap0[3] -pin u_m4_kernel_storage|rd_tap0_i O[3] -pin u_m4_kernel_storage|rd_tap_reg[3:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[12]__0[0] -attr @name line_buf2_reg[12]__0[0] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] D[0]
load net u_m3_mac|q_s0[2] -attr @name q_s0[2] -pin u_m3_mac|q_f0_reg[7:0] D[2] -pin u_m3_mac|q_s0_reg[7:0] Q[2]
load net u_m3_mac|ring_5[12] -attr @name ring_5[12] -pin u_m3_mac|ring_4_reg[24:0] D[12] -pin u_m3_mac|ring_5_reg[24:0] Q[12]
load net u_m3_mac|s3_a[5] -attr @name s3_a[5] -pin u_m3_mac|s3_a_reg[17:0] Q[5] -pin u_m3_mac|s4_a_reg[17:0] D[5]
load net u_m3_mac|u_dsp|m_r0[4] -attr @rip(#000000) O[4] -attr @name m_r0[4] -pin u_m3_mac|u_dsp|m_r0_i O[4] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[4]
load net u_m1_line_buffer|line_buf1_reg[26]__0[3] -attr @name line_buf1_reg[26]__0[3] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] D[3]
load net pixel_in[5] -attr @rip(#000000) pixel_in[5] -port pixel_in[5] -pin u_m1_line_buffer pixel_in[5]
load net u_m3_mac|q_f1[2] -attr @rip(#000000) 2 -attr @name q_f1[2] -pin u_m3_mac|b_mux_i I1[2] -pin u_m3_mac|q_f1_reg[7:0] Q[2]
load net u_m3_mac|u_dsp|p[10] -attr @rip(#000000) 10 -attr @name p[10] -hierPin u_m3_mac|u_dsp p[10] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[10]
load net u_m5_output_handling|out_val[12] -attr @name out_val[12] -pin u_m5_output_handling|final_output_reg[15:0] D[12] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[12]
load net u_m1_line_buffer|line_buf2_reg[13]__0[1] -attr @name line_buf2_reg[13]__0[1] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[14][7:0] D[1]
load net u_m1_line_buffer|line_buf2_reg[9]__0[7] -attr @name line_buf2_reg[9]__0[7] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] D[7] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] Q[7]
load net u_m3_mac|base_b[17] -attr @rip(#000000) O[17] -attr @name base_b[17] -pin u_m3_mac|acc_b0_i I0[17] -pin u_m3_mac|base_b_i O[17]
load net u_m1_line_buffer|line_buf2_reg[30]__0[5] -attr @name line_buf2_reg[30]__0[5] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] D[5]
load net u_m1_line_buffer|line_buf1_reg[29]__0[3] -attr @name line_buf1_reg[29]__0[3] -pin u_m1_line_buffer|line_buf1_reg[29][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[30][7:0] D[3]
load net u_m1_line_buffer|line_buf1_reg[5]__0[1] -attr @name line_buf1_reg[5]__0[1] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[6][7:0] D[1]
load net u_m3_mac|q_f0[2] -attr @rip(#000000) 2 -attr @name q_f0[2] -pin u_m3_mac|b_mux_i I0[2] -pin u_m3_mac|q_f0_reg[7:0] Q[2]
load net kernel_wr_data[5] -attr @rip(#000000) kernel_wr_data[5] -port kernel_wr_data[5] -pin u_m4_kernel_storage kernel_wr_data[5]
load net u_m3_mac|s3_c[0] -attr @name s3_c[0] -pin u_m3_mac|s3_c_reg[17:0] Q[0] -pin u_m3_mac|s4_c_reg[17:0] D[0]
load net u_m2_window_generator|p_0_in -attr @name p_0_in -pin u_m2_window_generator|row_ge_reg[1:0] Q[1] -pin u_m2_window_generator|window_valid0_i I1
load net u_m3_mac|frame_c[10] -attr @name frame_c[10] -pin u_m3_mac|frame_c_reg[17:0] Q[10] -pin u_m3_mac|s3_c_reg[17:0] D[10]
load net u_m1_line_buffer|line_buf1_reg[10]__0[0] -attr @name line_buf1_reg[10]__0[0] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] D[0]
load net u_m3_mac|u_dsp|m_r0[28] -attr @rip(#000000) O[28] -attr @name m_r0[28] -pin u_m3_mac|u_dsp|m_r0_i O[28] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[28]
load net u_m3_mac|acc_a[14] -attr @rip(#000000) 14 -attr @name acc_a[14] -pin u_m3_mac|acc_a_reg[17:0] Q[14] -pin u_m3_mac|base_a_i I1[14] -pin u_m3_mac|frame_a_reg[17:0] D[14]
load net u_m1_line_buffer|line_buf1_reg[7]__0[7] -attr @name line_buf1_reg[7]__0[7] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] D[7]
load net u_m3_mac|s4_b[14] -attr @name s4_b[14] -pin u_m3_mac|s4_b_reg[17:0] Q[14] -pin u_m3_mac|sum_c1_reg[17:0] D[14]
load net u_m3_mac|u_dsp|p0[23] -attr @rip(#000000) O[23] -attr @name p0[23] -pin u_m3_mac|u_dsp|p0_i O[23] -pin u_m3_mac|u_dsp|p_reg[33:0] D[23]
load net u_m1_line_buffer|line_buf2_reg[26]__0[7] -attr @name line_buf2_reg[26]__0[7] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[27][7:0] D[7]
load net u_m1_line_buffer|line_buf2_reg[23]__0[1] -attr @name line_buf2_reg[23]__0[1] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[24][7:0] D[1]
load net u_m3_mac|ph0[2] -attr @rip(#000000) O[2] -attr @name ph0[2] -pin u_m3_mac|ph0_i O[2] -pin u_m3_mac|ph_reg[2:0] D[2]
load net u_m3_mac|s4_a[2] -attr @name s4_a[2] -pin u_m3_mac|s4_a_reg[17:0] Q[2] -pin u_m3_mac|sum_c0_reg[17:0] D[2]
load net u_m3_mac|acc_b[11] -attr @rip(#000000) 11 -attr @name acc_b[11] -pin u_m3_mac|acc_b_reg[17:0] Q[11] -pin u_m3_mac|base_b_i I1[11] -pin u_m3_mac|frame_b_reg[17:0] D[11]
load net u_m2_window_generator|col_ge_reg_n_1 -attr @name col_ge_reg_n_1 -pin u_m2_window_generator|col_ge_reg[1:0] D[1] -pin u_m2_window_generator|col_ge_reg[1:0] Q[0]
load net u_m3_mac|ring_3[9] -attr @name ring_3[9] -pin u_m3_mac|ring_2_reg[24:0] D[9] -pin u_m3_mac|ring_3_reg[24:0] Q[9]
load net u_m5_output_handling|mac_result[8] -attr @rip(#000000) mac_result[8] -attr @name mac_result[8] -hierPin u_m5_output_handling mac_result[8] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[4]
load net u_m3_mac|q_s2[4] -attr @name q_s2[4] -pin u_m3_mac|q_f2_reg[7:0] D[4] -pin u_m3_mac|q_s2_reg[7:0] Q[4]
load net u_m3_mac|ring_4[0] -attr @name ring_4[0] -pin u_m3_mac|ring_3_reg[24:0] D[0] -pin u_m3_mac|ring_4_reg[24:0] Q[0]
load net u_m4_kernel_storage|rd_tap0[2] -attr @rip(#000000) O[2] -attr @name rd_tap0[2] -pin u_m4_kernel_storage|rd_tap0_i O[2] -pin u_m4_kernel_storage|rd_tap_reg[3:0] D[2]
load net u_m3_mac|u_dsp|m_r[12] -attr @rip(#000000) 12 -attr @name m_r[12] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[12] -pin u_m3_mac|u_dsp|p0_i I0[12]
load net u_m4_kernel_storage|kernel_select[0] -attr @rip(#000000) kernel_select[0] -attr @name kernel_select[0] -hierPin u_m4_kernel_storage kernel_select[0] -pin u_m4_kernel_storage|addr_i I1[4] -pin u_m4_kernel_storage|changed0_i I0 -pin u_m4_kernel_storage|sel_prev_reg[0] D
netloc u_m4_kernel_storage|kernel_select[0] 1 0 9 NJ 1162 1960 1322 2300 1302 NJ 1302 NJ 1302 NJ 1302 NJ 1302 NJ 1302 3710J
load net u_m1_line_buffer|line_buf1_reg[21]__0[6] -attr @name line_buf1_reg[21]__0[6] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[12]__0[1] -attr @name line_buf2_reg[12]__0[1] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] D[1]
load net u_m3_mac|ring_5[13] -attr @name ring_5[13] -pin u_m3_mac|ring_4_reg[24:0] D[13] -pin u_m3_mac|ring_5_reg[24:0] Q[13]
load net u_m3_mac|s3_a[6] -attr @name s3_a[6] -pin u_m3_mac|s3_a_reg[17:0] Q[6] -pin u_m3_mac|s4_a_reg[17:0] D[6]
load net u_m3_mac|sum_c2[3] -attr @rip(#000000) 3 -attr @name sum_c2[3] -pin u_m3_mac|acc_r0_i I1[3] -pin u_m3_mac|sum_c2_reg[17:0] Q[3]
load net u_m3_mac|u_dsp|m_r0[5] -attr @rip(#000000) O[5] -attr @name m_r0[5] -pin u_m3_mac|u_dsp|m_r0_i O[5] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[5]
load net u_m3_mac|u_dsp|p0[30] -attr @rip(#000000) O[30] -attr @name p0[30] -pin u_m3_mac|u_dsp|p0_i O[30] -pin u_m3_mac|u_dsp|p_reg[33:0] D[30]
load net u_m5_output_handling|is_neg -attr @name is_neg -pin u_m5_output_handling|final_output0_i I1 -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[16]
load net u_m1_line_buffer|line_buf1_reg[26]__0[4] -attr @name line_buf1_reg[26]__0[4] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] D[4]
load net u_m1_line_buffer|line_buf1_reg[7]__0[0] -attr @name line_buf1_reg[7]__0[0] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[9]__0[6] -attr @name line_buf2_reg[9]__0[6] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] D[6] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] Q[6]
load net pixel_in[6] -attr @rip(#000000) pixel_in[6] -port pixel_in[6] -pin u_m1_line_buffer pixel_in[6]
load net u_m3_mac|q_s0[5] -attr @name q_s0[5] -pin u_m3_mac|q_f0_reg[7:0] D[5] -pin u_m3_mac|q_s0_reg[7:0] Q[5]
load net u_m1_line_buffer|line_buf2_reg[5]__0[5] -attr @name line_buf2_reg[5]__0[5] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] D[5]
load net u_m1_line_buffer|line_buf2_reg[20]__0[7] -attr @name line_buf2_reg[20]__0[7] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] D[7]
load net u_m3_mac|q_f0[1] -attr @rip(#000000) 1 -attr @name q_f0[1] -pin u_m3_mac|b_mux_i I0[1] -pin u_m3_mac|q_f0_reg[7:0] Q[1]
load net u_m3_mac|q_f1[5] -attr @rip(#000000) 5 -attr @name q_f1[5] -pin u_m3_mac|b_mux_i I1[5] -pin u_m3_mac|q_f1_reg[7:0] Q[5]
load net u_m3_mac|ring_50[19] -attr @rip(#000000) O[19] -attr @name ring_50[19] -pin u_m3_mac|ring_50_i O[19] -pin u_m3_mac|ring_5_reg[24:0] D[19]
load net kernel_wr_data[4] -attr @rip(#000000) kernel_wr_data[4] -port kernel_wr_data[4] -pin u_m4_kernel_storage kernel_wr_data[4]
load net u_m1_line_buffer|line_buf2_reg[30]__0[6] -attr @name line_buf2_reg[30]__0[6] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[18]__0[0] -attr @name line_buf2_reg[18]__0[0] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[19][7:0] D[0]
load net u_m3_mac|<const1> -power -attr @name <const1> -pin u_m3_mac|base_c_i I0[3] -pin u_m3_mac|insph_s0_i I1 -pin u_m3_mac|insph_s0_i__0 I1[2] -pin u_m3_mac|insph_s0_i__0 I1[0] -pin u_m3_mac|ph1_i I1 -pin u_m3_mac|ph_i I0[0] -pin u_m3_mac|ph_i I1[1] -pin u_m3_mac|ph_i I2[2] -pin u_m3_mac|ph_i I3[3] -pin u_m3_mac|ph_i I4[4] -pin u_m3_mac|ph_i I5[5] -pin u_m3_mac|slot0_i I1[1] -pin u_m3_mac|t_col_i I1[1] -pin u_m3_mac|t_col_i I1[0] -pin u_m3_mac|t_row_i I1[1] -pin u_m3_mac|t_row_i I1[0]
load net curr_row_pixel[7] -attr @rip(#000000) curr_row_pixel[7] -pin u_m1_line_buffer curr_row_pixel[7] -pin u_m3_mac col_row2[7]
load net u_m3_mac|u_dsp|p0[22] -attr @rip(#000000) O[22] -attr @name p0[22] -pin u_m3_mac|u_dsp|p0_i O[22] -pin u_m3_mac|u_dsp|p_reg[33:0] D[22]
load net u_m3_mac|u_dsp|p[6] -attr @rip(#000000) 6 -attr @name p[6] -hierPin u_m3_mac|u_dsp p[6] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[6]
load net u_m3_mac|acc_b0[10] -attr @rip(#000000) O[10] -attr @name acc_b0[10] -pin u_m3_mac|acc_b0_i O[10] -pin u_m3_mac|acc_b_reg[17:0] D[10]
load net u_m3_mac|ring_5[22] -attr @name ring_5[22] -pin u_m3_mac|ring_4_reg[24:0] D[22] -pin u_m3_mac|ring_5_reg[24:0] Q[22]
load net u_m3_mac|tap_data[6] -attr @rip(#000000) tap_data[6] -attr @name tap_data[6] -hierPin u_m3_mac tap_data[6] -pin u_m3_mac|prev_c0_reg[7:0] D[6] -pin u_m3_mac|word_s_reg[24:0] D[6]
load net u_clk_gen|clk_in -attr @name clk_in -hierPin u_clk_gen clk_in -pin u_clk_gen|u_bufg_fast I -pin u_clk_gen|u_bufr_sys I
netloc u_clk_gen|clk_in 1 0 1 410
load net u_m3_mac|acc_b[10] -attr @rip(#000000) 10 -attr @name acc_b[10] -pin u_m3_mac|acc_b_reg[17:0] Q[10] -pin u_m3_mac|base_b_i I1[10] -pin u_m3_mac|frame_b_reg[17:0] D[10]
load net u_m3_mac|p_1_in[2] -attr @rip(#000000) O[1] -attr @name p_1_in[2] -pin u_m3_mac|slot_i I0[2] -pin u_m3_mac|t_row_i O[1]
load net u_m3_mac|ring_3[8] -attr @name ring_3[8] -pin u_m3_mac|ring_2_reg[24:0] D[8] -pin u_m3_mac|ring_3_reg[24:0] Q[8]
load net u_m3_mac|s4_a[3] -attr @name s4_a[3] -pin u_m3_mac|s4_a_reg[17:0] Q[3] -pin u_m3_mac|sum_c0_reg[17:0] D[3]
load net u_m5_output_handling|out_val[14] -attr @name out_val[14] -pin u_m5_output_handling|final_output_reg[15:0] D[14] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[14]
load net u_m3_mac|ring_5[10] -attr @name ring_5[10] -pin u_m3_mac|ring_4_reg[24:0] D[10] -pin u_m3_mac|ring_5_reg[24:0] Q[10]
load net u_m3_mac|s3_a[3] -attr @name s3_a[3] -pin u_m3_mac|s3_a_reg[17:0] Q[3] -pin u_m3_mac|s4_a_reg[17:0] D[3]
load net u_m3_mac|sum_c0[10] -attr @name sum_c0[10] -pin u_m3_mac|sum_c0_reg[17:0] Q[10] -pin u_m3_mac|t1_reg[17:0] D[10]
load net u_m5_output_handling|final_output_valid -attr @name final_output_valid -hierPin u_m5_output_handling final_output_valid -pin u_m5_output_handling|final_output_valid_reg Q
netloc u_m5_output_handling|final_output_valid 1 3 1 N
load net u_m5_output_handling|mac_result[9] -attr @rip(#000000) mac_result[9] -attr @name mac_result[9] -hierPin u_m5_output_handling mac_result[9] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[5]
load net u_m3_mac|ring_4[1] -attr @name ring_4[1] -pin u_m3_mac|ring_3_reg[24:0] D[1] -pin u_m3_mac|ring_4_reg[24:0] Q[1]
load net u_clk_gen|<const1> -power -attr @name <const1> -pin u_clk_gen|u_bufr_sys CE
load net u_m3_mac|sum_c2[2] -attr @rip(#000000) 2 -attr @name sum_c2[2] -pin u_m3_mac|acc_r0_i I1[2] -pin u_m3_mac|sum_c2_reg[17:0] Q[2]
load net u_m3_mac|u_dsp|m_r[13] -attr @rip(#000000) 13 -attr @name m_r[13] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[13] -pin u_m3_mac|u_dsp|p0_i I0[13]
load net u_m3_mac|q_s2[7] -attr @name q_s2[7] -pin u_m3_mac|q_f2_reg[7:0] D[7] -pin u_m3_mac|q_s2_reg[7:0] Q[7]
load net u_m1_line_buffer|line_buf1_reg[21]__0[7] -attr @name line_buf1_reg[21]__0[7] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] D[7]
load net u_m1_line_buffer|line_buf2_reg[9]__0[5] -attr @name line_buf2_reg[9]__0[5] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] D[5] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] Q[5]
load net u_m1_line_buffer|line_buf2_reg[12]__0[2] -attr @name line_buf2_reg[12]__0[2] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] D[2]
load net u_m3_mac|q_s0[4] -attr @name q_s0[4] -pin u_m3_mac|q_f0_reg[7:0] D[4] -pin u_m3_mac|q_s0_reg[7:0] Q[4]
load net u_m3_mac|u_dsp|m_r0[6] -attr @rip(#000000) O[6] -attr @name m_r0[6] -pin u_m3_mac|u_dsp|m_r0_i O[6] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[20]__0[6] -attr @name line_buf2_reg[20]__0[6] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[30]__0[3] -attr @name line_buf2_reg[30]__0[3] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] D[3]
load net pixel_in[7] -attr @rip(#000000) pixel_in[7] -port pixel_in[7] -pin u_m1_line_buffer pixel_in[7]
load net u_m1_line_buffer|line_buf1_reg[7]__0[1] -attr @name line_buf1_reg[7]__0[1] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] D[1]
load net u_m3_mac|q_f0[0] -attr @rip(#000000) 0 -attr @name q_f0[0] -pin u_m3_mac|b_mux_i I0[0] -pin u_m3_mac|q_f0_reg[7:0] Q[0]
load net u_m3_mac|q_f1[4] -attr @rip(#000000) 4 -attr @name q_f1[4] -pin u_m3_mac|b_mux_i I1[4] -pin u_m3_mac|q_f1_reg[7:0] Q[4]
load net u_m3_mac|ring_50[18] -attr @rip(#000000) O[18] -attr @name ring_50[18] -pin u_m3_mac|ring_50_i O[18] -pin u_m3_mac|ring_5_reg[24:0] D[18]
load net u_m3_mac|u_dsp|p[29] -attr @rip(#000000) 29 -attr @name p[29] -hierPin u_m3_mac|u_dsp p[29] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[29]
load net u_m1_line_buffer|line_buf2_reg[5]__0[6] -attr @name line_buf2_reg[5]__0[6] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] D[6]
load net kernel_wr_data[3] -attr @rip(#000000) kernel_wr_data[3] -port kernel_wr_data[3] -pin u_m4_kernel_storage kernel_wr_data[3]
load net clk_IBUF -pin clk_IBUF_inst O -pin u_clk_gen clk_in
netloc clk_IBUF 1 1 1 310J
load net u_m3_mac|u_dsp|p0[8] -attr @rip(#000000) O[8] -attr @name p0[8] -pin u_m3_mac|u_dsp|p0_i O[8] -pin u_m3_mac|u_dsp|p_reg[33:0] D[8]
load net curr_row_pixel[6] -attr @rip(#000000) curr_row_pixel[6] -pin u_m1_line_buffer curr_row_pixel[6] -pin u_m3_mac col_row2[6]
load net u_m3_mac|ring_5[21] -attr @name ring_5[21] -pin u_m3_mac|ring_4_reg[24:0] D[21] -pin u_m3_mac|ring_5_reg[24:0] Q[21]
load net u_m3_mac|tap_data[5] -attr @rip(#000000) tap_data[5] -attr @name tap_data[5] -hierPin u_m3_mac tap_data[5] -pin u_m3_mac|prev_c0_reg[7:0] D[5] -pin u_m3_mac|word_s_reg[24:0] D[5]
load net u_m3_mac|ph0[0] -attr @rip(#000000) O[0] -attr @name ph0[0] -pin u_m3_mac|ph0_i O[0] -pin u_m3_mac|ph_reg[2:0] D[0]
load net u_m3_mac|s4_a[0] -attr @name s4_a[0] -pin u_m3_mac|s4_a_reg[17:0] Q[0] -pin u_m3_mac|sum_c0_reg[17:0] D[0]
load net u_m3_mac|u_dsp|p[7] -attr @rip(#000000) 7 -attr @name p[7] -hierPin u_m3_mac|u_dsp p[7] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[7]
load net u_m3_mac|acc_b0[11] -attr @rip(#000000) O[11] -attr @name acc_b0[11] -pin u_m3_mac|acc_b0_i O[11] -pin u_m3_mac|acc_b_reg[17:0] D[11]
load net u_m1_line_buffer|line_buf1_reg[9]__0[4] -attr @name line_buf1_reg[9]__0[4] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] D[4] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] Q[4]
load net u_m3_mac|p_1_in[1] -attr @rip(#000000) O[0] -attr @name p_1_in[1] -pin u_m3_mac|slot_i I0[1] -pin u_m3_mac|t_row_i O[0]
load net u_m3_mac|ring_3[7] -attr @name ring_3[7] -pin u_m3_mac|ring_2_reg[24:0] D[7] -pin u_m3_mac|ring_3_reg[24:0] Q[7]
load net u_m3_mac|u_dsp|p0[25] -attr @rip(#000000) O[25] -attr @name p0[25] -pin u_m3_mac|u_dsp|p0_i O[25] -pin u_m3_mac|u_dsp|p_reg[33:0] D[25]
load net u_m3_mac|ring_4[12] -attr @name ring_4[12] -pin u_m3_mac|ring_3_reg[24:0] D[12] -pin u_m3_mac|ring_4_reg[24:0] Q[12]
load net u_m5_output_handling|out_val[15] -attr @name out_val[15] -pin u_m5_output_handling|final_output_reg[15:0] D[15] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[15]
load net u_clk_gen|<const0> -ground -attr @name <const0> -pin u_clk_gen|u_bufr_sys CLR
load net u_m1_line_buffer|line_buf1_reg[21]__0[4] -attr @name line_buf1_reg[21]__0[4] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] Q[4] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] D[4]
load net u_m3_mac|hi_src[0] -attr @rip(#000000) O[0] -attr @name hi_src[0] -pin u_m3_mac|hi_lane_i I0[0] -pin u_m3_mac|hi_src_i O[0]
load net u_m3_mac|ring_5[11] -attr @name ring_5[11] -pin u_m3_mac|ring_4_reg[24:0] D[11] -pin u_m3_mac|ring_5_reg[24:0] Q[11]
load net u_m3_mac|s3_a[4] -attr @name s3_a[4] -pin u_m3_mac|s3_a_reg[17:0] Q[4] -pin u_m3_mac|s4_a_reg[17:0] D[4]
load net u_m3_mac|q_s2[6] -attr @name q_s2[6] -pin u_m3_mac|q_f2_reg[7:0] D[6] -pin u_m3_mac|q_s2_reg[7:0] Q[6]
load net u_m2_window_generator|u_col|lfsr_step2076_return[5] -attr @rip(#000000) 4 -attr @name lfsr_step2076_return[5] -pin u_m2_window_generator|u_col|at_count_i I0[4] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I0[4] -pin u_m2_window_generator|u_col|state_reg[5:0] D[5] -pin u_m2_window_generator|u_col|state_reg[5:0] Q[4]
load net u_m3_mac|u_dsp|m_r[14] -attr @rip(#000000) 14 -attr @name m_r[14] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[14] -pin u_m3_mac|u_dsp|p0_i I0[14]
load net u_m1_line_buffer|line_buf2_reg[20]__0[5] -attr @name line_buf2_reg[20]__0[5] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] D[5]
load net u_m3_mac|ring_50[17] -attr @rip(#000000) O[17] -attr @name ring_50[17] -pin u_m3_mac|ring_50_i O[17] -pin u_m3_mac|ring_5_reg[24:0] D[17]
load net u_m3_mac|sum_c2[5] -attr @rip(#000000) 5 -attr @name sum_c2[5] -pin u_m3_mac|acc_r0_i I1[5] -pin u_m3_mac|sum_c2_reg[17:0] Q[5]
load net u_m3_mac|u_dsp|m_r0[7] -attr @rip(#000000) O[7] -attr @name m_r0[7] -pin u_m3_mac|u_dsp|m_r0_i O[7] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[7]
load net u_m3_mac|u_dsp|p[28] -attr @rip(#000000) 28 -attr @name p[28] -hierPin u_m3_mac|u_dsp p[28] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[28]
load net u_m1_line_buffer|line_buf2_reg[30]__0[4] -attr @name line_buf2_reg[30]__0[4] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] D[4]
load net u_m1_line_buffer|line_buf1_reg[7]__0[2] -attr @name line_buf1_reg[7]__0[2] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] D[2]
load net u_m3_mac|word_s[18] -attr @name word_s[18] -pin u_m3_mac|word_f_reg[24:0] D[18] -pin u_m3_mac|word_s_reg[24:0] Q[18]
load net u_m3_mac|u_dsp|p[13] -attr @rip(#000000) 13 -attr @name p[13] -hierPin u_m3_mac|u_dsp p[13] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[13]
load net u_m1_line_buffer|line_buf2_reg[5]__0[7] -attr @name line_buf2_reg[5]__0[7] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] D[7]
load net u_m3_mac|word_s[8] -attr @name word_s[8] -pin u_m3_mac|word_f_reg[24:0] D[8] -pin u_m3_mac|word_s_reg[24:0] Q[8]
load net curr_row_pixel[5] -attr @rip(#000000) curr_row_pixel[5] -pin u_m1_line_buffer curr_row_pixel[5] -pin u_m3_mac col_row2[5]
load net u_m3_mac|u_dsp|p0[9] -attr @rip(#000000) O[9] -attr @name p0[9] -pin u_m3_mac|u_dsp|p0_i O[9] -pin u_m3_mac|u_dsp|p_reg[33:0] D[9]
load net u_m4_kernel_storage|sel_prev -attr @name sel_prev -pin u_m4_kernel_storage|changed0_i I1 -pin u_m4_kernel_storage|sel_prev_reg[0] Q
netloc u_m4_kernel_storage|sel_prev 1 2 1 2320
load net u_m3_mac|tap_data[4] -attr @rip(#000000) tap_data[4] -attr @name tap_data[4] -hierPin u_m3_mac tap_data[4] -pin u_m3_mac|prev_c0_reg[7:0] D[4] -pin u_m3_mac|word_s_reg[24:0] D[4]
load net u_m3_mac|sum_c1[4] -attr @rip(#000000) 4 -attr @name sum_c1[4] -pin u_m3_mac|sum_c1_reg[17:0] Q[4] -pin u_m3_mac|t20_i I1[4]
load net u_m5_output_handling|out_val[8] -attr @name out_val[8] -pin u_m5_output_handling|final_output_reg[15:0] D[8] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[8]
load net u_m3_mac|col_row2[6] -attr @rip(#000000) col_row2[6] -attr @name col_row2[6] -hierPin u_m3_mac col_row2[6] -pin u_m3_mac|q_s2_reg[7:0] D[6]
load net u_m3_mac|q_s2[1] -attr @name q_s2[1] -pin u_m3_mac|q_f2_reg[7:0] D[1] -pin u_m3_mac|q_s2_reg[7:0] Q[1]
load net u_m3_mac|s4_a[1] -attr @name s4_a[1] -pin u_m3_mac|s4_a_reg[17:0] Q[1] -pin u_m3_mac|sum_c0_reg[17:0] D[1]
load net u_m3_mac|u_dsp|p0[24] -attr @rip(#000000) O[24] -attr @name p0[24] -pin u_m3_mac|u_dsp|p0_i O[24] -pin u_m3_mac|u_dsp|p_reg[33:0] D[24]
load net u_m3_mac|u_dsp|p[8] -attr @rip(#000000) 8 -attr @name p[8] -hierPin u_m3_mac|u_dsp p[8] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[8]
load net u_m5_output_handling|final_output[4] -attr @rip(#000000) 4 -attr @name final_output[4] -hierPin u_m5_output_handling final_output[4] -pin u_m5_output_handling|final_output_reg[15:0] Q[4]
load net u_m3_mac|acc_b0[12] -attr @rip(#000000) O[12] -attr @name acc_b0[12] -pin u_m3_mac|acc_b0_i O[12] -pin u_m3_mac|acc_b_reg[17:0] D[12]
load net u_m1_line_buffer|line_buf1_reg[9]__0[5] -attr @name line_buf1_reg[9]__0[5] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] D[5] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] Q[5]
load net u_m1_line_buffer|line_buf1_reg[23]__0[0] -attr @name line_buf1_reg[23]__0[0] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] Q[0] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] D[0]
load net u_m3_mac|s3_a[1] -attr @name s3_a[1] -pin u_m3_mac|s3_a_reg[17:0] Q[1] -pin u_m3_mac|s4_a_reg[17:0] D[1]
load net u_m3_mac|u_dsp|m_r0[0] -attr @rip(#000000) O[0] -attr @name m_r0[0] -pin u_m3_mac|u_dsp|m_r0_i O[0] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[0]
load net mac_result[1] -attr @rip(#000000) mac_result[1] -pin u_m3_mac mac_result[1] -pin u_m5_output_handling mac_result[1]
load net u_m2_window_generator|u_col|at_count -attr @name at_count -hierPin u_m2_window_generator|u_col at_count -pin u_m2_window_generator|u_col|at_count_i O
netloc u_m2_window_generator|u_col|at_count 1 4 1 NJ
load net u_m3_mac|ring_4[11] -attr @name ring_4[11] -pin u_m3_mac|ring_3_reg[24:0] D[11] -pin u_m3_mac|ring_4_reg[24:0] Q[11]
load net u_m3_mac|ring_1[11] -attr @name ring_1[11] -pin u_m3_mac|ring_0_reg[24:0] D[11] -pin u_m3_mac|ring_1_reg[24:0] Q[11]
load net u_m3_mac|u_dsp|a[9] -attr @rip(#000000) a[9] -attr @name a[9] -hierPin u_m3_mac|u_dsp a[9] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[9]
load net u_m6_control_fsm|busy -attr @name busy -hierPin u_m6_control_fsm busy -pin u_m6_control_fsm|busy_i O
netloc u_m6_control_fsm|busy 1 8 1 N
load net u_m2_window_generator|u_col|lfsr_step2076_return[4] -attr @rip(#000000) 3 -attr @name lfsr_step2076_return[4] -pin u_m2_window_generator|u_col|at_count_i I0[3] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I0[3] -pin u_m2_window_generator|u_col|state_reg[5:0] D[4] -pin u_m2_window_generator|u_col|state_reg[5:0] Q[3]
load net u_m1_line_buffer|line_buf1_reg[21]__0[5] -attr @name line_buf1_reg[21]__0[5] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] Q[5] -pin u_m1_line_buffer|line_buf1_reg[22][7:0] D[5]
load net u_m3_mac|hi_src[1] -attr @rip(#000000) O[1] -attr @name hi_src[1] -pin u_m3_mac|hi_lane_i I0[1] -pin u_m3_mac|hi_src_i O[1]
load net u_m3_mac|sum_c0[12] -attr @name sum_c0[12] -pin u_m3_mac|sum_c0_reg[17:0] Q[12] -pin u_m3_mac|t1_reg[17:0] D[12]
load net u_m1_line_buffer|line_buf2_reg[20]__0[4] -attr @name line_buf2_reg[20]__0[4] -pin u_m1_line_buffer|line_buf2_reg[20][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] D[4]
load net u_m3_mac|ring_50[16] -attr @rip(#000000) O[16] -attr @name ring_50[16] -pin u_m3_mac|ring_50_i O[16] -pin u_m3_mac|ring_5_reg[24:0] D[16]
load net u_m3_mac|ring_5[0] -attr @name ring_5[0] -pin u_m3_mac|ring_4_reg[24:0] D[0] -pin u_m3_mac|ring_5_reg[24:0] Q[0]
load net u_m3_mac|sum_c2[4] -attr @rip(#000000) 4 -attr @name sum_c2[4] -pin u_m3_mac|acc_r0_i I1[4] -pin u_m3_mac|sum_c2_reg[17:0] Q[4]
load net u_m3_mac|u_dsp|m_r[15] -attr @rip(#000000) 15 -attr @name m_r[15] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[15] -pin u_m3_mac|u_dsp|p0_i I0[15]
load net u_m1_line_buffer|line_buf2_reg[17]__0[2] -attr @name line_buf2_reg[17]__0[2] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] D[2]
load net u_m3_mac|u_dsp|a[18] -attr @rip(#000000) a[18] -attr @name a[18] -hierPin u_m3_mac|u_dsp a[18] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[18]
load net u_m7_fifo|pop0_i__0_n_0 -attr @name pop0_i__0_n_0 -pin u_m7_fifo|pop0_i__0 O -pin u_m7_fifo|pop_i I1
netloc u_m7_fifo|pop0_i__0_n_0 1 6 1 16510
load net pixel_valid_out -pin u_m1_line_buffer pixel_valid_out -pin u_m2_window_generator pixel_valid_in -pin u_m3_mac pixel_valid
netloc pixel_valid_out 1 3 2 1300 182 5060J
load net u_m3_mac|u_dsp|p0[33] -attr @rip(#000000) O[33] -attr @name p0[33] -pin u_m3_mac|u_dsp|p0_i O[33] -pin u_m3_mac|u_dsp|p_reg[33:0] D[33]
load net u_m3_mac|u_dsp|p0[6] -attr @rip(#000000) O[6] -attr @name p0[6] -pin u_m3_mac|u_dsp|p0_i O[6] -pin u_m3_mac|u_dsp|p_reg[33:0] D[6]
load net u_m1_line_buffer|line_buf1_reg[26]__0[7] -attr @name line_buf1_reg[26]__0[7] -pin u_m1_line_buffer|line_buf1_reg[26][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[27][7:0] D[7]
load net u_m3_mac|word_s[7] -attr @name word_s[7] -pin u_m3_mac|word_f_reg[24:0] D[7] -pin u_m3_mac|word_s_reg[24:0] Q[7]
load net u_m3_mac|u_dsp|p[30] -attr @rip(#000000) 30 -attr @name p[30] -hierPin u_m3_mac|u_dsp p[30] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[30]
load net u_m3_mac|acc_a[10] -attr @rip(#000000) 10 -attr @name acc_a[10] -pin u_m3_mac|acc_a_reg[17:0] Q[10] -pin u_m3_mac|base_a_i I1[10] -pin u_m3_mac|frame_a_reg[17:0] D[10]
load net u_m1_line_buffer|line_buf1_reg[7]__0[3] -attr @name line_buf1_reg[7]__0[3] -pin u_m1_line_buffer|line_buf1_reg[7][7:0] Q[3] -pin u_m1_line_buffer|line_buf1_reg[8][7:0] D[3]
load net curr_row_pixel[4] -attr @rip(#000000) curr_row_pixel[4] -pin u_m1_line_buffer curr_row_pixel[4] -pin u_m3_mac col_row2[4]
load net u_m3_mac|tog_f1 -attr @name tog_f1 -pin u_m3_mac|ph0_i__0 I0 -pin u_m3_mac|tog_f1_reg Q -pin u_m3_mac|tog_f2_reg D
netloc u_m3_mac|tog_f1 1 3 2 6050 138 6430
load net u_m3_mac|word_s[19] -attr @name word_s[19] -pin u_m3_mac|word_f_reg[24:0] D[19] -pin u_m3_mac|word_s_reg[24:0] Q[19]
load net u_m3_mac|u_dsp|p[14] -attr @rip(#000000) 14 -attr @name p[14] -hierPin u_m3_mac|u_dsp p[14] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[14]
load net u_m3_mac|ring_2[11] -attr @name ring_2[11] -pin u_m3_mac|ring_1_reg[24:0] D[11] -pin u_m3_mac|ring_2_reg[24:0] Q[11]
load net u_m3_mac|tap_data[3] -attr @rip(#000000) tap_data[3] -attr @name tap_data[3] -hierPin u_m3_mac tap_data[3] -pin u_m3_mac|prev_c0_reg[7:0] D[3] -pin u_m3_mac|word_s_reg[24:0] D[3]
load net u_m3_mac|tog_f2 -attr @name tog_f2 -pin u_m3_mac|ph0_i__0 I1 -pin u_m3_mac|tog_f2_reg Q
netloc u_m3_mac|tog_f2 1 4 1 N
load net u_m3_mac|sum_c1[3] -attr @rip(#000000) 3 -attr @name sum_c1[3] -pin u_m3_mac|sum_c1_reg[17:0] Q[3] -pin u_m3_mac|t20_i I1[3]
load net u_m1_line_buffer|line_buf1_reg[9]__0[2] -attr @name line_buf1_reg[9]__0[2] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] D[2] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] Q[2]
load net u_m5_output_handling|out_val[7] -attr @name out_val[7] -pin u_m5_output_handling|final_output_reg[15:0] D[7] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[7]
load net u_m3_mac|q_f0[6] -attr @rip(#000000) 6 -attr @name q_f0[6] -pin u_m3_mac|b_mux_i I0[6] -pin u_m3_mac|q_f0_reg[7:0] Q[6]
load net u_m3_mac|q_s2[0] -attr @name q_s2[0] -pin u_m3_mac|q_f2_reg[7:0] D[0] -pin u_m3_mac|q_s2_reg[7:0] Q[0]
load net u_m3_mac|ring_0[0] -attr @rip(#000000) 0 -attr @name ring_0[0] -pin u_m3_mac|ring_0_reg[24:0] Q[0] -pin u_m3_mac|ring_50_i I1[0] -pin u_m3_mac|u_dsp a[0]
load net u_m3_mac|ring_3[11] -attr @name ring_3[11] -pin u_m3_mac|ring_2_reg[24:0] D[11] -pin u_m3_mac|ring_3_reg[24:0] Q[11]
load net u_m5_output_handling|final_output[3] -attr @rip(#000000) 3 -attr @name final_output[3] -hierPin u_m5_output_handling final_output[3] -pin u_m5_output_handling|final_output_reg[15:0] Q[3]
load net mac_result[0] -attr @rip(#000000) mac_result[0] -pin u_m3_mac mac_result[0] -pin u_m5_output_handling mac_result[0]
load net u_m3_mac|col_row2[7] -attr @rip(#000000) col_row2[7] -attr @name col_row2[7] -hierPin u_m3_mac col_row2[7] -pin u_m3_mac|q_s2_reg[7:0] D[7]
load net u_m3_mac|u_dsp|p[9] -attr @rip(#000000) 9 -attr @name p[9] -hierPin u_m3_mac|u_dsp p[9] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[9]
load net u_m5_output_handling|mac_result[10] -attr @rip(#000000) mac_result[10] -attr @name mac_result[10] -hierPin u_m5_output_handling mac_result[10] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[6]
load net u_m3_mac|acc_b0[13] -attr @rip(#000000) O[13] -attr @name acc_b0[13] -pin u_m3_mac|acc_b0_i O[13] -pin u_m3_mac|acc_b_reg[17:0] D[13]
load net u_m1_line_buffer|line_buf1_reg[23]__0[1] -attr @name line_buf1_reg[23]__0[1] -pin u_m1_line_buffer|line_buf1_reg[23][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[24][7:0] D[1]
load net u_m3_mac|s3_a[2] -attr @name s3_a[2] -pin u_m3_mac|s3_a_reg[17:0] Q[2] -pin u_m3_mac|s4_a_reg[17:0] D[2]
load net u_m3_mac|u_dsp|m_r0[1] -attr @rip(#000000) O[1] -attr @name m_r0[1] -pin u_m3_mac|u_dsp|m_r0_i O[1] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[1]
load net u_m3_mac|ring_1[10] -attr @name ring_1[10] -pin u_m3_mac|ring_0_reg[24:0] D[10] -pin u_m3_mac|ring_1_reg[24:0] Q[10]
load net u_m3_mac|u_dsp|a[8] -attr @rip(#000000) a[8] -attr @name a[8] -hierPin u_m3_mac|u_dsp a[8] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[8]
load net u_m3_mac|u_dsp|p0[27] -attr @rip(#000000) O[27] -attr @name p0[27] -pin u_m3_mac|u_dsp|p0_i O[27] -pin u_m3_mac|u_dsp|p_reg[33:0] D[27]
load net u_m2_window_generator|u_col|lfsr_step2076_return[3] -attr @rip(#000000) 2 -attr @name lfsr_step2076_return[3] -pin u_m2_window_generator|u_col|at_count_i I0[2] -pin u_m2_window_generator|u_col|lfsr_step2076_return1_i I0[2] -pin u_m2_window_generator|u_col|state_reg[5:0] D[3] -pin u_m2_window_generator|u_col|state_reg[5:0] Q[2]
load net u_m3_mac|sum_c0[11] -attr @name sum_c0[11] -pin u_m3_mac|sum_c0_reg[17:0] Q[11] -pin u_m3_mac|t1_reg[17:0] D[11]
load net u_m1_line_buffer|line_buf2_reg[5]__0[1] -attr @name line_buf2_reg[5]__0[1] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] D[1]
load net u_m3_mac|ring_4[14] -attr @name ring_4[14] -pin u_m3_mac|ring_3_reg[24:0] D[14] -pin u_m3_mac|ring_4_reg[24:0] Q[14]
load net u_m3_mac|frame_a_i_n_0 -attr @name frame_a_i_n_0 -pin u_m3_mac|frame_a_i O -pin u_m3_mac|frame_a_reg[17:0] CE
netloc u_m3_mac|frame_a_i_n_0 1 18 1 10910
load net u_m3_mac|hi_src[2] -attr @rip(#000000) O[2] -attr @name hi_src[2] -pin u_m3_mac|hi_lane_i I0[2] -pin u_m3_mac|hi_src_i O[2]
load net u_m3_mac|q_f1[1] -attr @rip(#000000) 1 -attr @name q_f1[1] -pin u_m3_mac|b_mux_i I1[1] -pin u_m3_mac|q_f1_reg[7:0] Q[1]
load net u_m3_mac|ring_0[19] -attr @rip(#000000) 19 -attr @name ring_0[19] -pin u_m3_mac|ring_0_reg[24:0] Q[19] -pin u_m3_mac|ring_50_i I1[19] -pin u_m3_mac|u_dsp a[19]
load net u_m3_mac|ring_50[15] -attr @rip(#000000) O[15] -attr @name ring_50[15] -pin u_m3_mac|ring_50_i O[15] -pin u_m3_mac|ring_5_reg[24:0] D[15]
load net u_m3_mac|word_s[16] -attr @name word_s[16] -pin u_m3_mac|word_f_reg[24:0] D[16] -pin u_m3_mac|word_s_reg[24:0] Q[16]
load net u_m3_mac|u_dsp|m_r[16] -attr @rip(#000000) 16 -attr @name m_r[16] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[16] -pin u_m3_mac|u_dsp|p0_i I0[16]
load net u_m3_mac|u_dsp|p[11] -attr @rip(#000000) 11 -attr @name p[11] -hierPin u_m3_mac|u_dsp p[11] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[11]
load net u_m1_line_buffer|line_buf2_reg[17]__0[3] -attr @name line_buf2_reg[17]__0[3] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] D[3]
load net u_m3_mac|u_dsp|a[19] -attr @rip(#000000) a[19] -attr @name a[19] -hierPin u_m3_mac|u_dsp a[19] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[19]
load net curr_row_pixel[3] -attr @rip(#000000) curr_row_pixel[3] -pin u_m1_line_buffer curr_row_pixel[3] -pin u_m3_mac col_row2[3]
load net u_m3_mac|sum_c2[7] -attr @rip(#000000) 7 -attr @name sum_c2[7] -pin u_m3_mac|acc_r0_i I1[7] -pin u_m3_mac|sum_c2_reg[17:0] Q[7]
load net u_m3_mac|u_dsp|p0[7] -attr @rip(#000000) O[7] -attr @name p0[7] -pin u_m3_mac|u_dsp|p0_i O[7] -pin u_m3_mac|u_dsp|p_reg[33:0] D[7]
load net u_m3_mac|u_dsp|p[2] -attr @rip(#000000) 2 -attr @name p[2] -hierPin u_m3_mac|u_dsp p[2] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[2]
load net u_m3_mac|tap_data[2] -attr @rip(#000000) tap_data[2] -attr @name tap_data[2] -hierPin u_m3_mac tap_data[2] -pin u_m3_mac|prev_c0_reg[7:0] D[2] -pin u_m3_mac|word_s_reg[24:0] D[2]
load net u_m3_mac|u_dsp|p[31] -attr @rip(#000000) 31 -attr @name p[31] -hierPin u_m3_mac|u_dsp p[31] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[31]
load net u_m3_mac|sum_c1[2] -attr @rip(#000000) 2 -attr @name sum_c1[2] -pin u_m3_mac|sum_c1_reg[17:0] Q[2] -pin u_m3_mac|t20_i I1[2]
load net u_m1_line_buffer|line_buf2_reg[22]__0[1] -attr @name line_buf2_reg[22]__0[1] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] D[1]
load net u_m3_mac|ring_2[12] -attr @name ring_2[12] -pin u_m3_mac|ring_1_reg[24:0] D[12] -pin u_m3_mac|ring_2_reg[24:0] Q[12]
load net u_m5_output_handling|out_val[6] -attr @name out_val[6] -pin u_m5_output_handling|final_output_reg[15:0] D[6] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[6]
load net u_m3_mac|mac_result[17] -attr @rip(#000000) 17 -attr @name mac_result[17] -hierPin u_m3_mac mac_result[17] -pin u_m3_mac|acc_r_reg[19:0] Q[17]
load net u_m3_mac|q_f0[5] -attr @rip(#000000) 5 -attr @name q_f0[5] -pin u_m3_mac|b_mux_i I0[5] -pin u_m3_mac|q_f0_reg[7:0] Q[5]
load net u_m3_mac|ring_3[10] -attr @name ring_3[10] -pin u_m3_mac|ring_2_reg[24:0] D[10] -pin u_m3_mac|ring_3_reg[24:0] Q[10]
load net u_m5_output_handling|final_output[2] -attr @rip(#000000) 2 -attr @name final_output[2] -hierPin u_m5_output_handling final_output[2] -pin u_m5_output_handling|final_output_reg[15:0] Q[2]
load net u_m1_line_buffer|line_buf1_reg[9]__0[3] -attr @name line_buf1_reg[9]__0[3] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] D[3] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] Q[3]
load net u_m3_mac|frame_b[9] -attr @name frame_b[9] -pin u_m3_mac|frame_b_reg[17:0] Q[9] -pin u_m3_mac|s3_b_reg[17:0] D[9]
load net u_m3_mac|ring_0[1] -attr @rip(#000000) 1 -attr @name ring_0[1] -pin u_m3_mac|ring_0_reg[24:0] Q[1] -pin u_m3_mac|ring_50_i I1[1] -pin u_m3_mac|u_dsp a[1]
load net u_m4_kernel_storage|wr_enable -attr @name wr_enable -pin u_m4_kernel_storage|addr_i S -pin u_m4_kernel_storage|changed_i I0 -pin u_m4_kernel_storage|mem_reg WE2 -pin u_m4_kernel_storage|rd_tap_i S -pin u_m4_kernel_storage|streaming0_i I0 -pin u_m4_kernel_storage|wr_enable_i O
netloc u_m4_kernel_storage|wr_enable 1 3 7 2520 1422 2740 1382 NJ 1382 3210J N 3530J 1432 3750 N N
load net u_m3_mac|dsp_p[30] -attr @rip(#000000) p[30] -attr @name dsp_p[30] -pin u_m3_mac|acc_a0_i I1[14] -pin u_m3_mac|u_dsp p[30]
load net u_m3_mac|q_s2[3] -attr @name q_s2[3] -pin u_m3_mac|q_f2_reg[7:0] D[3] -pin u_m3_mac|q_s2_reg[7:0] Q[3]
load net u_m3_mac|s4_a[10] -attr @name s4_a[10] -pin u_m3_mac|s4_a_reg[17:0] Q[10] -pin u_m3_mac|sum_c0_reg[17:0] D[10]
load net u_m3_mac|u_dsp|a[7] -attr @rip(#000000) a[7] -attr @name a[7] -hierPin u_m3_mac|u_dsp a[7] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[7]
load net u_m3_mac|u_dsp|p0[26] -attr @rip(#000000) O[26] -attr @name p0[26] -pin u_m3_mac|u_dsp|p0_i O[26] -pin u_m3_mac|u_dsp|p_reg[33:0] D[26]
load net u_m5_output_handling|mac_result[11] -attr @rip(#000000) mac_result[11] -attr @name mac_result[11] -hierPin u_m5_output_handling mac_result[11] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[7]
load net u_m6_control_fsm|state_next0 -attr @name state_next0 -pin u_m6_control_fsm|state_next0_i O -pin u_m6_control_fsm|state_next_i__0 I1
netloc u_m6_control_fsm|state_next0 1 4 1 19510
load net u_m4_kernel_storage|rd_tap0[1] -attr @rip(#000000) O[1] -attr @name rd_tap0[1] -pin u_m4_kernel_storage|rd_tap0_i O[1] -pin u_m4_kernel_storage|rd_tap_reg[3:0] D[1]
load net u_m3_mac|u_dsp|m_r0[2] -attr @rip(#000000) O[2] -attr @name m_r0[2] -pin u_m3_mac|u_dsp|m_r0_i O[2] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[2]
load net window_valid -pin u_m2_window_generator window_valid -pin u_m3_mac window_valid
netloc window_valid 1 4 1 5020
load net u_m3_mac|ring_4[13] -attr @name ring_4[13] -pin u_m3_mac|ring_3_reg[24:0] D[13] -pin u_m3_mac|ring_4_reg[24:0] Q[13]
load net u_m1_line_buffer|line_buf1_reg[10]__0[7] -attr @name line_buf1_reg[10]__0[7] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] D[7]
load net u_m2_window_generator|col_ge_i_n_0 -attr @rip O[1] -attr @name col_ge_i_n_0 -pin u_m2_window_generator|col_ge_i O[1] -pin u_m2_window_generator|col_ge_reg[1:0] CE[1]
load net u_m3_mac|q_f1[0] -attr @rip(#000000) 0 -attr @name q_f1[0] -pin u_m3_mac|b_mux_i I1[0] -pin u_m3_mac|q_f1_reg[7:0] Q[0]
load net u_m3_mac|ring_0[18] -attr @rip(#000000) 18 -attr @name ring_0[18] -pin u_m3_mac|ring_0_reg[24:0] Q[18] -pin u_m3_mac|ring_50_i I1[18] -pin u_m3_mac|u_dsp a[18]
load net u_m3_mac|ring_50[14] -attr @rip(#000000) O[14] -attr @name ring_50[14] -pin u_m3_mac|ring_50_i O[14] -pin u_m3_mac|ring_5_reg[24:0] D[14]
load net u_m3_mac|s3_c[9] -attr @name s3_c[9] -pin u_m3_mac|s3_c_reg[17:0] Q[9] -pin u_m3_mac|s4_c_reg[17:0] D[9]
load net u_m1_line_buffer|line_buf2_reg[5]__0[2] -attr @name line_buf2_reg[5]__0[2] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] D[2]
load net u_m2_window_generator|col_ge_i_n_1 -attr @rip O[0] -attr @name col_ge_i_n_1 -pin u_m2_window_generator|col_ge_i O[0] -pin u_m2_window_generator|col_ge_reg[1:0] CE[0]
load net u_m3_mac|ring_1[13] -attr @name ring_1[13] -pin u_m3_mac|ring_0_reg[24:0] D[13] -pin u_m3_mac|ring_1_reg[24:0] Q[13]
load net u_m3_mac|u_dsp|a[16] -attr @rip(#000000) a[16] -attr @name a[16] -hierPin u_m3_mac|u_dsp a[16] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[16]
load net u_m1_line_buffer|line_buf2_reg[29]__0[5] -attr @name line_buf2_reg[29]__0[5] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] D[5]
load net u_m3_mac|hi_src[3] -attr @rip(#000000) O[3] -attr @name hi_src[3] -pin u_m3_mac|hi_lane_i I0[3] -pin u_m3_mac|hi_src_i O[3]
load net u_m3_mac|sum_c0[14] -attr @name sum_c0[14] -pin u_m3_mac|sum_c0_reg[17:0] Q[14] -pin u_m3_mac|t1_reg[17:0] D[14]
load net u_m3_mac|u_dsp|m_r0[30] -attr @rip(#000000) O[30] -attr @name m_r0[30] -pin u_m3_mac|u_dsp|m_r0_i O[30] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[30]
load net curr_row_pixel[2] -attr @rip(#000000) curr_row_pixel[2] -pin u_m1_line_buffer curr_row_pixel[2] -pin u_m3_mac col_row2[2]
load net u_m3_mac|sum_c2[6] -attr @rip(#000000) 6 -attr @name sum_c2[6] -pin u_m3_mac|acc_r0_i I1[6] -pin u_m3_mac|sum_c2_reg[17:0] Q[6]
load net u_m3_mac|word_s[17] -attr @name word_s[17] -pin u_m3_mac|word_f_reg[24:0] D[17] -pin u_m3_mac|word_s_reg[24:0] Q[17]
load net u_m3_mac|u_dsp|m_r[17] -attr @rip(#000000) 17 -attr @name m_r[17] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[17] -pin u_m3_mac|u_dsp|p0_i I0[17]
load net u_m3_mac|u_dsp|p[12] -attr @rip(#000000) 12 -attr @name p[12] -hierPin u_m3_mac|u_dsp p[12] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[12]
load net u_m4_kernel_storage|p_0_in[0] -attr @rip(#000000) 0 -attr @name p_0_in[0] -pin u_m4_kernel_storage|addr_i I1[0] -pin u_m4_kernel_storage|rd_tap0_i S[0] -pin u_m4_kernel_storage|rd_tap1_i I0[0] -pin u_m4_kernel_storage|rd_tap_reg[3:0] Q[0] -pin u_m4_kernel_storage|tap_idx_reg[3:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[17]__0[4] -attr @name line_buf2_reg[17]__0[4] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] D[4]
load net u_m3_mac|tap_data[1] -attr @rip(#000000) tap_data[1] -attr @name tap_data[1] -hierPin u_m3_mac tap_data[1] -pin u_m3_mac|prev_c0_reg[7:0] D[1] -pin u_m3_mac|word_s_reg[24:0] D[1]
load net u_m3_mac|sum_c1[1] -attr @rip(#000000) 1 -attr @name sum_c1[1] -pin u_m3_mac|sum_c1_reg[17:0] Q[1] -pin u_m3_mac|t20_i I1[1]
load net u_m3_mac|u_dsp|p[3] -attr @rip(#000000) 3 -attr @name p[3] -hierPin u_m3_mac|u_dsp p[3] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[3]
load net clk -port clk -pin clk_IBUF_inst I
netloc clk 1 0 1 NJ
load net u_m2_window_generator|row_wrap -attr @name row_wrap -pin u_m2_window_generator|col_ge0_i I1 -pin u_m2_window_generator|row_ge_i S -pin u_m2_window_generator|row_ge_i__0 S -pin u_m2_window_generator|row_wrap_i O
netloc u_m2_window_generator|row_wrap 1 1 4 1760 852 1910J 986 3390J 852 3550
load net u_m1_line_buffer|line_buf1_reg[9]__0[0] -attr @name line_buf1_reg[9]__0[0] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] D[0] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] Q[0]
load net u_m1_line_buffer|line_buf2_reg[22]__0[0] -attr @name line_buf2_reg[22]__0[0] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[30]__0[7] -attr @name line_buf2_reg[30]__0[7] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[31][7:0] D[7]
load net u_m3_mac|word_s[9] -attr @name word_s[9] -pin u_m3_mac|word_f_reg[24:0] D[9] -pin u_m3_mac|word_s_reg[24:0] Q[9]
load net u_m3_mac|u_dsp|a[24] -attr @rip(#000000) a[24] -attr @name a[24] -hierPin u_m3_mac|u_dsp a[24] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[24]
load net u_m3_mac|u_dsp|p[32] -attr @rip(#000000) 32 -attr @name p[32] -hierPin u_m3_mac|u_dsp p[32] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[32]
load net u_m5_output_handling|out_val[5] -attr @name out_val[5] -pin u_m5_output_handling|final_output_reg[15:0] D[5] -pin u_m5_output_handling|rounded_val_r_reg[16:0] Q[5]
load net u_m1_line_buffer|line_buf2_reg[10]__0[0] -attr @name line_buf2_reg[10]__0[0] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] D[0]
load net u_m3_mac|q_f0[4] -attr @rip(#000000) 4 -attr @name q_f0[4] -pin u_m3_mac|b_mux_i I0[4] -pin u_m3_mac|q_f0_reg[7:0] Q[4]
load net u_m5_output_handling|final_output[1] -attr @rip(#000000) 1 -attr @name final_output[1] -hierPin u_m5_output_handling final_output[1] -pin u_m5_output_handling|final_output_reg[15:0] Q[1]
load net kernel_wr_data[7] -attr @rip(#000000) kernel_wr_data[7] -port kernel_wr_data[7] -pin u_m4_kernel_storage kernel_wr_data[7]
load net u_m3_mac|mac_result[18] -attr @rip(#000000) 18 -attr @name mac_result[18] -hierPin u_m3_mac mac_result[18] -pin u_m3_mac|acc_r_reg[19:0] Q[18]
load net u_m3_mac|s3_a[0] -attr @name s3_a[0] -pin u_m3_mac|s3_a_reg[17:0] Q[0] -pin u_m3_mac|s4_a_reg[17:0] D[0]
load net u_m3_mac|q_s2[2] -attr @name q_s2[2] -pin u_m3_mac|q_f2_reg[7:0] D[2] -pin u_m3_mac|q_s2_reg[7:0] Q[2]
load net u_m3_mac|ring_0[2] -attr @rip(#000000) 2 -attr @name ring_0[2] -pin u_m3_mac|ring_0_reg[24:0] Q[2] -pin u_m3_mac|ring_50_i I1[2] -pin u_m3_mac|u_dsp a[2]
load net u_m3_mac|u_dsp|a[6] -attr @rip(#000000) a[6] -attr @name a[6] -hierPin u_m3_mac|u_dsp a[6] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[6]
load net u_m4_kernel_storage|rd_tap0[0] -attr @rip(#000000) O[0] -attr @name rd_tap0[0] -pin u_m4_kernel_storage|rd_tap0_i O[0] -pin u_m4_kernel_storage|rd_tap_reg[3:0] D[0]
load net u_m3_mac|dsp_p[31] -attr @rip(#000000) p[31] -attr @name dsp_p[31] -pin u_m3_mac|acc_a0_i I1[17] -pin u_m3_mac|acc_a0_i I1[16] -pin u_m3_mac|acc_a0_i I1[15] -pin u_m3_mac|u_dsp p[31]
load net u_m3_mac|ph0_i__0_n_0 -attr @name ph0_i__0_n_0 -pin u_m3_mac|ph0_i__0 O -pin u_m3_mac|ph_reg[2:0] RST[2] -pin u_m3_mac|ph_reg[2:0] RST[0] -pin u_m3_mac|ph_reg[2:0] SET[1]
netloc u_m3_mac|ph0_i__0_n_0 1 5 1 6780
load net u_m3_mac|s4_a[11] -attr @name s4_a[11] -pin u_m3_mac|s4_a_reg[17:0] Q[11] -pin u_m3_mac|sum_c0_reg[17:0] D[11]
load net u_m5_output_handling|mac_result[12] -attr @rip(#000000) mac_result[12] -attr @name mac_result[12] -hierPin u_m5_output_handling mac_result[12] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[8]
load net u_m1_line_buffer|line_buf1_reg[10]__0[6] -attr @name line_buf1_reg[10]__0[6] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[11][7:0] D[6]
load net u_m3_mac|base_a[17] -attr @rip(#000000) O[17] -attr @name base_a[17] -pin u_m3_mac|acc_a0_i I0[17] -pin u_m3_mac|base_a_i O[17]
load net u_m3_mac|ring_0[17] -attr @rip(#000000) 17 -attr @name ring_0[17] -pin u_m3_mac|ring_0_reg[24:0] Q[17] -pin u_m3_mac|ring_50_i I1[17] -pin u_m3_mac|u_dsp a[17]
load net u_m3_mac|ring_50[13] -attr @rip(#000000) O[13] -attr @name ring_50[13] -pin u_m3_mac|ring_50_i O[13] -pin u_m3_mac|ring_5_reg[24:0] D[13]
load net u_m3_mac|u_dsp|b[5] -attr @rip(#000000) b[5] -attr @name b[5] -hierPin u_m3_mac|u_dsp b[5] -pin u_m3_mac|u_dsp|b_r_reg[7:0] D[5]
load net u_m3_mac|u_dsp|m_r0[3] -attr @rip(#000000) O[3] -attr @name m_r0[3] -pin u_m3_mac|u_dsp|m_r0_i O[3] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[3]
load net u_m1_line_buffer|line_buf2_reg[21]__0[7] -attr @name line_buf2_reg[21]__0[7] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] D[7]
load net u_m3_mac|ring_1[12] -attr @name ring_1[12] -pin u_m3_mac|ring_0_reg[24:0] D[12] -pin u_m3_mac|ring_1_reg[24:0] Q[12]
load net u_m3_mac|u_dsp|p0[29] -attr @rip(#000000) O[29] -attr @name p0[29] -pin u_m3_mac|u_dsp|p0_i O[29] -pin u_m3_mac|u_dsp|p_reg[33:0] D[29]
load net u_m3_mac|sum_c0[13] -attr @name sum_c0[13] -pin u_m3_mac|sum_c0_reg[17:0] Q[13] -pin u_m3_mac|t1_reg[17:0] D[13]
load net u_m7_fifo|final_output[8] -attr @rip(#000000) final_output[8] -attr @name final_output[8] -hierPin u_m7_fifo final_output[8] -pin u_m7_fifo|mem_reg WD2[8]
load net u_m4_kernel_storage|sweep_left_reg_n_0 -attr @name sweep_left_reg_n_0 -pin u_m4_kernel_storage|sweep_left_reg[9:0] D[8] -pin u_m4_kernel_storage|sweep_left_reg[9:0] Q[9]
load net u_m1_line_buffer|line_buf2_reg[5]__0[3] -attr @name line_buf2_reg[5]__0[3] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] D[3]
load net u_m3_mac|ring_4[16] -attr @name ring_4[16] -pin u_m3_mac|ring_3_reg[24:0] D[16] -pin u_m3_mac|ring_4_reg[24:0] Q[16]
load net u_m3_mac|u_dsp|a[17] -attr @rip(#000000) a[17] -attr @name a[17] -hierPin u_m3_mac|u_dsp a[17] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[17]
load net u_m7_fifo|release_start0 -attr @name release_start0 -pin u_m7_fifo|release_start0_i O -pin u_m7_fifo|release_start_i I0
netloc u_m7_fifo|release_start0 1 4 1 16030
load net u_m1_line_buffer|line_buf2_reg[29]__0[6] -attr @name line_buf2_reg[29]__0[6] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] D[6]
load net curr_row_pixel[1] -attr @rip(#000000) curr_row_pixel[1] -pin u_m1_line_buffer curr_row_pixel[1] -pin u_m3_mac col_row2[1]
load net u_m4_kernel_storage|sweep_left_reg_n_1 -attr @name sweep_left_reg_n_1 -pin u_m4_kernel_storage|sweep_left_reg[9:0] D[7] -pin u_m4_kernel_storage|sweep_left_reg[9:0] Q[8]
load net u_m3_mac|hi_src[4] -attr @rip(#000000) O[4] -attr @name hi_src[4] -pin u_m3_mac|hi_lane_i I0[4] -pin u_m3_mac|hi_src_i O[4]
load net u_m7_fifo|release_start1 -attr @name release_start1 -pin u_m7_fifo|release_start0_i I0 -pin u_m7_fifo|release_start1_i O
netloc u_m7_fifo|release_start1 1 3 1 NJ
load net mac_result_valid -pin u_m3_mac mac_result_valid -pin u_m5_output_handling mac_result_valid
netloc mac_result_valid 1 5 1 13360
load net u_m4_kernel_storage|sweep_left_reg_n_2 -attr @name sweep_left_reg_n_2 -pin u_m4_kernel_storage|sweep_left_reg[9:0] D[6] -pin u_m4_kernel_storage|sweep_left_reg[9:0] Q[7]
load net u_m3_mac|tap_data[0] -attr @rip(#000000) tap_data[0] -attr @name tap_data[0] -hierPin u_m3_mac tap_data[0] -pin u_m3_mac|prev_c0_reg[7:0] D[0] -pin u_m3_mac|word_s_reg[24:0] D[0]
load net u_m4_kernel_storage|sweep_left_reg_n_3 -attr @name sweep_left_reg_n_3 -pin u_m4_kernel_storage|sweep_left_reg[9:0] D[5] -pin u_m4_kernel_storage|sweep_left_reg[9:0] Q[6]
load net u_m3_mac|u_dsp|m_r[18] -attr @rip(#000000) 18 -attr @name m_r[18] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[18] -pin u_m3_mac|u_dsp|p0_i I0[18]
load net u_m4_kernel_storage|p_0_in[1] -attr @rip(#000000) 1 -attr @name p_0_in[1] -pin u_m4_kernel_storage|addr_i I1[1] -pin u_m4_kernel_storage|rd_tap0_i S[1] -pin u_m4_kernel_storage|rd_tap1_i I0[1] -pin u_m4_kernel_storage|rd_tap_reg[3:0] Q[1] -pin u_m4_kernel_storage|tap_idx_reg[3:0] D[1]
load net u_m4_kernel_storage|sweep_left_reg_n_4 -attr @name sweep_left_reg_n_4 -pin u_m4_kernel_storage|sweep_left_reg[9:0] D[4] -pin u_m4_kernel_storage|sweep_left_reg[9:0] Q[5]
load net u_m1_line_buffer|line_buf2_reg[17]__0[5] -attr @name line_buf2_reg[17]__0[5] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] D[5]
load net u_m3_mac|ring_2[10] -attr @name ring_2[10] -pin u_m3_mac|ring_1_reg[24:0] D[10] -pin u_m3_mac|ring_2_reg[24:0] Q[10]
load net u_m3_mac|u_dsp|a[23] -attr @rip(#000000) a[23] -attr @name a[23] -hierPin u_m3_mac|u_dsp a[23] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[23]
load net u_m1_line_buffer|line_buf2_reg[12]__0[7] -attr @name line_buf2_reg[12]__0[7] -pin u_m1_line_buffer|line_buf2_reg[12][7:0] Q[7] -pin u_m1_line_buffer|line_buf2_reg[13][7:0] D[7]
load net u_m4_kernel_storage|sweep_left_reg_n_5 -attr @name sweep_left_reg_n_5 -pin u_m4_kernel_storage|sweep_left_reg[9:0] D[3] -pin u_m4_kernel_storage|sweep_left_reg[9:0] Q[4]
load net u_m3_mac|mac_result[15] -attr @rip(#000000) 15 -attr @name mac_result[15] -hierPin u_m3_mac mac_result[15] -pin u_m3_mac|acc_r_reg[19:0] Q[15]
load net u_m3_mac|q_f0[3] -attr @rip(#000000) 3 -attr @name q_f0[3] -pin u_m3_mac|b_mux_i I0[3] -pin u_m3_mac|q_f0_reg[7:0] Q[3]
load net u_m3_mac|sum_c2[9] -attr @rip(#000000) 9 -attr @name sum_c2[9] -pin u_m3_mac|acc_r0_i I1[9] -pin u_m3_mac|sum_c2_reg[17:0] Q[9]
load net u_m3_mac|u_dsp|p[4] -attr @rip(#000000) 4 -attr @name p[4] -hierPin u_m3_mac|u_dsp p[4] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[4]
load net u_m4_kernel_storage|sweep_left_reg_n_6 -attr @name sweep_left_reg_n_6 -pin u_m4_kernel_storage|sweep_left_reg[9:0] D[2] -pin u_m4_kernel_storage|sweep_left_reg[9:0] Q[3]
load net u_m1_line_buffer|line_buf1_reg[9]__0[1] -attr @name line_buf1_reg[9]__0[1] -pin u_m1_line_buffer|line_buf1_reg[10][7:0] D[1] -pin u_m1_line_buffer|line_buf1_reg[9][7:0] Q[1]
load net u_m1_line_buffer|line_buf2_reg[10]__0[1] -attr @name line_buf2_reg[10]__0[1] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] Q[1] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] D[1]
load net u_m4_kernel_storage|sweep_left_reg_n_7 -attr @name sweep_left_reg_n_7 -pin u_m4_kernel_storage|sweep_left_reg[9:0] D[1] -pin u_m4_kernel_storage|sweep_left_reg[9:0] Q[2]
load net u_m3_mac|u_dsp|p[17] -attr @rip(#000000) 17 -attr @name p[17] -hierPin u_m3_mac|u_dsp p[17] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[17]
load net u_m4_kernel_storage|sweep_left_reg_n_8 -attr @name sweep_left_reg_n_8 -pin u_m4_kernel_storage|sweep_left_reg[9:0] D[0] -pin u_m4_kernel_storage|sweep_left_reg[9:0] Q[1]
load net u_m3_mac|s4_c[11] -attr @name s4_c[11] -pin u_m3_mac|s4_c_reg[17:0] Q[11] -pin u_m3_mac|sum_c2_reg[17:0] D[11]
load net u_m7_fifo|rst -attr @name rst -hierPin u_m7_fifo rst -pin u_m7_fifo|wr_ptr0_i I0
netloc u_m7_fifo|rst 1 0 1 14910
load net u_m1_line_buffer|line_buf1_reg[1]__0[6] -attr @name line_buf1_reg[1]__0[6] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] Q[6] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] D[6]
load net u_m3_mac|u_dsp|a[5] -attr @rip(#000000) a[5] -attr @name a[5] -hierPin u_m3_mac|u_dsp a[5] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[5]
load net u_m6_control_fsm|clear0 -attr @name clear0 -pin u_m6_control_fsm|clear0_i O -pin u_m6_control_fsm|u_pixel_count clear
netloc u_m6_control_fsm|clear0 1 2 1 18900
load net u_m6_control_fsm|clear1 -attr @name clear1 -pin u_m6_control_fsm|clear0_i I1 -pin u_m6_control_fsm|clear1_i O
netloc u_m6_control_fsm|clear1 1 1 1 NJ
load net u_m2_window_generator|window_valid -attr @name window_valid -hierPin u_m2_window_generator window_valid -pin u_m2_window_generator|window_valid_i O
netloc u_m2_window_generator|window_valid 1 8 1 N
load net u_m3_mac|ring_0[3] -attr @rip(#000000) 3 -attr @name ring_0[3] -pin u_m3_mac|ring_0_reg[24:0] Q[3] -pin u_m3_mac|ring_50_i I1[3] -pin u_m3_mac|u_dsp a[3]
load net u_m3_mac|base_a[16] -attr @rip(#000000) O[16] -attr @name base_a[16] -pin u_m3_mac|acc_a0_i I0[16] -pin u_m3_mac|base_a_i O[16]
load net u_m3_mac|ring_0[16] -attr @rip(#000000) 16 -attr @name ring_0[16] -pin u_m3_mac|ring_0_reg[24:0] Q[16] -pin u_m3_mac|ring_50_i I1[16] -pin u_m3_mac|u_dsp a[16]
load net u_m3_mac|ring_50[12] -attr @rip(#000000) O[12] -attr @name ring_50[12] -pin u_m3_mac|ring_50_i O[12] -pin u_m3_mac|ring_5_reg[24:0] D[12]
load net u_m3_mac|s3_c[7] -attr @name s3_c[7] -pin u_m3_mac|s3_c_reg[17:0] Q[7] -pin u_m3_mac|s4_c_reg[17:0] D[7]
load net u_m3_mac|u_dsp|b[4] -attr @rip(#000000) b[4] -attr @name b[4] -hierPin u_m3_mac|u_dsp b[4] -pin u_m3_mac|u_dsp|b_r_reg[7:0] D[4]
load net u_m3_mac|u_dsp|p[23] -attr @rip(#000000) 23 -attr @name p[23] -hierPin u_m3_mac|u_dsp p[23] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[23]
load net u_m4_kernel_storage|tap_data[2] -attr @rip(#000000) 2 -attr @name tap_data[2] -hierPin u_m4_kernel_storage tap_data[2] -pin u_m4_kernel_storage|tap_data_reg[7:0] Q[2]
load net u_m1_line_buffer|line_buf2_reg[16]__0[5] -attr @name line_buf2_reg[16]__0[5] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] D[5]
load net u_m4_kernel_storage|rd_tap_i_n_0 -attr @name rd_tap_i_n_0 -pin u_m4_kernel_storage|rd_tap_i O -pin u_m4_kernel_storage|rd_tap_reg[3:0] CE
netloc u_m4_kernel_storage|rd_tap_i_n_0 1 7 1 3510
load net u_m3_mac|s4_a[12] -attr @name s4_a[12] -pin u_m3_mac|s4_a_reg[17:0] Q[12] -pin u_m3_mac|sum_c0_reg[17:0] D[12]
load net u_m3_mac|u_dsp|a[14] -attr @rip(#000000) a[14] -attr @name a[14] -hierPin u_m3_mac|u_dsp a[14] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[14]
load net u_m3_mac|u_dsp|p0[28] -attr @rip(#000000) O[28] -attr @name p0[28] -pin u_m3_mac|u_dsp|p0_i O[28] -pin u_m3_mac|u_dsp|p_reg[33:0] D[28]
load net u_m5_output_handling|mac_result[13] -attr @rip(#000000) mac_result[13] -attr @name mac_result[13] -hierPin u_m5_output_handling mac_result[13] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[9]
load net u_m1_line_buffer|line_buf2_reg[29]__0[3] -attr @name line_buf2_reg[29]__0[3] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] D[3]
load net mac_result[5] -attr @rip(#000000) mac_result[5] -pin u_m3_mac mac_result[5] -pin u_m5_output_handling mac_result[5]
load net u_m3_mac|ring_4[15] -attr @name ring_4[15] -pin u_m3_mac|ring_3_reg[24:0] D[15] -pin u_m3_mac|ring_4_reg[24:0] Q[15]
load net u_m7_fifo|final_output[9] -attr @rip(#000000) final_output[9] -attr @name final_output[9] -hierPin u_m7_fifo final_output[9] -pin u_m7_fifo|mem_reg WD2[9]
load net u_m1_line_buffer|pixel_in[0] -attr @rip(#000000) pixel_in[0] -attr @name pixel_in[0] -hierPin u_m1_line_buffer curr_row_pixel[0] -hierPin u_m1_line_buffer pixel_in[0] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] D[0]
load net u_m1_line_buffer|line_buf2_reg[5]__0[4] -attr @name line_buf2_reg[5]__0[4] -pin u_m1_line_buffer|line_buf2_reg[5][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[6][7:0] D[4]
load net u_m3_mac|hi_src[5] -attr @rip(#000000) O[5] -attr @name hi_src[5] -pin u_m3_mac|hi_lane_i I0[5] -pin u_m3_mac|hi_src_i O[5]
load net u_m1_line_buffer|line_buf1_reg[4]__0[1] -attr @name line_buf1_reg[4]__0[1] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] D[1]
load net u_m1_line_buffer|line_buf2_reg[25]__0[6] -attr @name line_buf2_reg[25]__0[6] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] D[6]
load net u_m3_mac|ring_50[20] -attr @rip(#000000) O[20] -attr @name ring_50[20] -pin u_m3_mac|ring_50_i O[20] -pin u_m3_mac|ring_5_reg[24:0] D[20]
load net u_m3_mac|sum_c2[8] -attr @rip(#000000) 8 -attr @name sum_c2[8] -pin u_m3_mac|acc_r0_i I1[8] -pin u_m3_mac|sum_c2_reg[17:0] Q[8]
load net u_m3_mac|u_dsp|m_r[19] -attr @rip(#000000) 19 -attr @name m_r[19] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[19] -pin u_m3_mac|u_dsp|p0_i I0[19]
load net u_m4_kernel_storage|p_0_in[2] -attr @rip(#000000) 2 -attr @name p_0_in[2] -pin u_m4_kernel_storage|addr_i I1[2] -pin u_m4_kernel_storage|rd_tap0_i S[2] -pin u_m4_kernel_storage|rd_tap1_i I0[2] -pin u_m4_kernel_storage|rd_tap_reg[3:0] Q[2] -pin u_m4_kernel_storage|tap_idx_reg[3:0] D[2]
load net u_m1_line_buffer|line_buf1_reg[20]__0[1] -attr @name line_buf1_reg[20]__0[1] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] Q[1] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] D[1]
load net u_m3_mac|mac_result[16] -attr @rip(#000000) 16 -attr @name mac_result[16] -hierPin u_m3_mac mac_result[16] -pin u_m3_mac|acc_r_reg[19:0] Q[16]
load net u_m3_mac|u_dsp|p[5] -attr @rip(#000000) 5 -attr @name p[5] -hierPin u_m3_mac|u_dsp p[5] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[5]
load net u_m3_mac|s4_c[6] -attr @name s4_c[6] -pin u_m3_mac|s4_c_reg[17:0] Q[6] -pin u_m3_mac|sum_c2_reg[17:0] D[6]
load net kernel_wr_addr[2] -attr @rip(#000000) kernel_wr_addr[2] -port kernel_wr_addr[2] -pin u_m4_kernel_storage kernel_wr_addr[2]
load net u_m1_line_buffer|line_buf2_reg[10]__0[2] -attr @name line_buf2_reg[10]__0[2] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] Q[2] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] D[2]
load net u_m3_mac|u_dsp|a[4] -attr @rip(#000000) a[4] -attr @name a[4] -hierPin u_m3_mac|u_dsp a[4] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[4]
load net u_m3_mac|u_dsp|p[18] -attr @rip(#000000) 18 -attr @name p[18] -hierPin u_m3_mac|u_dsp p[18] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[18]
load net u_m3_mac|s4_c[12] -attr @name s4_c[12] -pin u_m3_mac|s4_c_reg[17:0] Q[12] -pin u_m3_mac|sum_c2_reg[17:0] D[12]
load net u_m1_line_buffer|line_buf1_reg[1]__0[7] -attr @name line_buf1_reg[1]__0[7] -pin u_m1_line_buffer|line_buf1_reg[1][7:0] Q[7] -pin u_m1_line_buffer|line_buf1_reg[2][7:0] D[7]
load net u_m3_mac|base_a[15] -attr @rip(#000000) O[15] -attr @name base_a[15] -pin u_m3_mac|acc_a0_i I0[15] -pin u_m3_mac|base_a_i O[15]
load net u_m3_mac|ring_0[15] -attr @rip(#000000) 15 -attr @name ring_0[15] -pin u_m3_mac|ring_0_reg[24:0] Q[15] -pin u_m3_mac|ring_50_i I1[15] -pin u_m3_mac|u_dsp a[15]
load net u_m3_mac|ring_50[11] -attr @rip(#000000) O[11] -attr @name ring_50[11] -pin u_m3_mac|ring_50_i O[11] -pin u_m3_mac|ring_5_reg[24:0] D[11]
load net u_m3_mac|u_dsp|p[22] -attr @rip(#000000) 22 -attr @name p[22] -hierPin u_m3_mac|u_dsp p[22] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[22]
load net u_m3_mac|ring_0[4] -attr @rip(#000000) 4 -attr @name ring_0[4] -pin u_m3_mac|ring_0_reg[24:0] Q[4] -pin u_m3_mac|ring_50_i I1[4] -pin u_m3_mac|u_dsp a[4]
load net u_m3_mac|s3_c[8] -attr @name s3_c[8] -pin u_m3_mac|s3_c_reg[17:0] Q[8] -pin u_m3_mac|s4_c_reg[17:0] D[8]
load net u_m4_kernel_storage|tap_data[3] -attr @rip(#000000) 3 -attr @name tap_data[3] -hierPin u_m4_kernel_storage tap_data[3] -pin u_m4_kernel_storage|tap_data_reg[7:0] Q[3]
load net u_m1_line_buffer|line_buf2_reg[16]__0[6] -attr @name line_buf2_reg[16]__0[6] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] Q[6] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] D[6]
load net mac_result[4] -attr @rip(#000000) mac_result[4] -pin u_m3_mac mac_result[4] -pin u_m5_output_handling mac_result[4]
load net u_m3_mac|ring_2[7] -attr @name ring_2[7] -pin u_m3_mac|ring_1_reg[24:0] D[7] -pin u_m3_mac|ring_2_reg[24:0] Q[7]
load net u_m3_mac|s4_a[13] -attr @name s4_a[13] -pin u_m3_mac|s4_a_reg[17:0] Q[13] -pin u_m3_mac|sum_c0_reg[17:0] D[13]
load net u_m3_mac|u_dsp|a[15] -attr @rip(#000000) a[15] -attr @name a[15] -hierPin u_m3_mac|u_dsp a[15] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[15]
load net u_m5_output_handling|mac_result[14] -attr @rip(#000000) mac_result[14] -attr @name mac_result[14] -hierPin u_m5_output_handling mac_result[14] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[10]
load net u_m1_line_buffer|line_buf2_reg[29]__0[4] -attr @name line_buf2_reg[29]__0[4] -pin u_m1_line_buffer|line_buf2_reg[29][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[30][7:0] D[4]
load net u_m3_mac|u_dsp|b[7] -attr @rip(#000000) b[7] -attr @name b[7] -hierPin u_m3_mac|u_dsp b[7] -pin u_m3_mac|u_dsp|b_r_reg[7:0] D[7]
load net u_m3_mac|frame_a[0] -attr @name frame_a[0] -pin u_m3_mac|frame_a_reg[17:0] Q[0] -pin u_m3_mac|s3_a_reg[17:0] D[0]
load net u_m3_mac|ring_4[18] -attr @name ring_4[18] -pin u_m3_mac|ring_3_reg[24:0] D[18] -pin u_m3_mac|ring_4_reg[24:0] Q[18]
load net u_m1_line_buffer|line_buf2_reg[25]__0[5] -attr @name line_buf2_reg[25]__0[5] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] D[5]
load net u_m3_mac|hi_src[6] -attr @rip(#000000) O[6] -attr @name hi_src[6] -pin u_m3_mac|hi_lane_i I0[6] -pin u_m3_mac|hi_src_i O[6]
load net u_m3_mac|u_dsp|a_r[10] -attr @rip(#000000) 10 -attr @name a_r[10] -pin u_m3_mac|u_dsp|a_r_reg[24:0] Q[10] -pin u_m3_mac|u_dsp|m_r0_i I0[10]
load net u_m3_mac|u_dsp|m_r0[33] -attr @rip(#000000) O[33] -attr @name m_r0[33] -pin u_m3_mac|u_dsp|m_r0_i O[33] -pin u_m3_mac|u_dsp|m_r_reg[33:0] D[33]
load net u_m1_line_buffer|line_buf1_reg[4]__0[2] -attr @name line_buf1_reg[4]__0[2] -pin u_m1_line_buffer|line_buf1_reg[4][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[5][7:0] D[2]
load net done -port done -pin u_m6_control_fsm done
netloc done 1 8 1 20960J
load net u_m3_mac|q_f2[7] -attr @rip(#000000) 7 -attr @name q_f2[7] -pin u_m3_mac|b_mux_i I2[7] -pin u_m3_mac|q_f2_reg[7:0] Q[7]
load net u_m3_mac|ring_50[21] -attr @rip(#000000) O[21] -attr @name ring_50[21] -pin u_m3_mac|ring_50_i O[21] -pin u_m3_mac|ring_5_reg[24:0] D[21]
load net u_m3_mac|u_dsp|p[15] -attr @rip(#000000) 15 -attr @name p[15] -hierPin u_m3_mac|u_dsp p[15] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[15]
load net u_m3_mac|col_row0[0] -attr @rip(#000000) col_row0[0] -attr @name col_row0[0] -hierPin u_m3_mac col_row0[0] -pin u_m3_mac|q_s0_reg[7:0] D[0]
load net u_m3_mac|acc_a0_i_n_0 -attr @rip(#000000) O[17] -attr @name acc_a0_i_n_0 -pin u_m3_mac|acc_a0_i O[17] -pin u_m3_mac|acc_a_reg[17:0] D[17]
load net u_m1_line_buffer|line_buf1_reg[20]__0[2] -attr @name line_buf1_reg[20]__0[2] -pin u_m1_line_buffer|line_buf1_reg[20][7:0] Q[2] -pin u_m1_line_buffer|line_buf1_reg[21][7:0] D[2]
load net u_m3_mac|u_dsp|a[3] -attr @rip(#000000) a[3] -attr @name a[3] -hierPin u_m3_mac|u_dsp a[3] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[3]
load net u_m3_mac|acc_a0_i_n_1 -attr @rip(#000000) O[16] -attr @name acc_a0_i_n_1 -pin u_m3_mac|acc_a0_i O[16] -pin u_m3_mac|acc_a_reg[17:0] D[16]
load net u_m3_mac|s4_c[7] -attr @name s4_c[7] -pin u_m3_mac|s4_c_reg[17:0] Q[7] -pin u_m3_mac|sum_c2_reg[17:0] D[7]
load net kernel_wr_addr[3] -attr @rip(#000000) kernel_wr_addr[3] -port kernel_wr_addr[3] -pin u_m4_kernel_storage kernel_wr_addr[3]
load net u_m3_mac|acc_a0_i_n_2 -attr @rip(#000000) O[15] -attr @name acc_a0_i_n_2 -pin u_m3_mac|acc_a0_i O[15] -pin u_m3_mac|acc_a_reg[17:0] D[15]
load net u_m1_line_buffer|line_buf2_reg[10]__0[3] -attr @name line_buf2_reg[10]__0[3] -pin u_m1_line_buffer|line_buf2_reg[10][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[11][7:0] D[3]
load net u_m3_mac|sum_c2[12] -attr @rip(#000000) 12 -attr @name sum_c2[12] -pin u_m3_mac|acc_r0_i I1[12] -pin u_m3_mac|sum_c2_reg[17:0] Q[12]
load net u_m6_control_fsm|done -attr @name done -hierPin u_m6_control_fsm done -pin u_m6_control_fsm|busy0_i__0 I0 -pin u_m6_control_fsm|done_i O -pin u_m6_control_fsm|start_pass0_i I1
netloc u_m6_control_fsm|done 1 6 3 20190 748 NJ 748 20740
load net u_m1_line_buffer|line_buf2_reg[22]__0[5] -attr @name line_buf2_reg[22]__0[5] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] Q[5] -pin u_m1_line_buffer|line_buf2_reg[23][7:0] D[5]
load net u_m3_mac|acc_a0_i_n_3 -attr @rip(#000000) O[14] -attr @name acc_a0_i_n_3 -pin u_m3_mac|acc_a0_i O[14] -pin u_m3_mac|acc_a_reg[17:0] D[14]
load net u_m3_mac|base_a[14] -attr @rip(#000000) O[14] -attr @name base_a[14] -pin u_m3_mac|acc_a0_i I0[14] -pin u_m3_mac|base_a_i O[14]
load net u_m3_mac|ring_50[10] -attr @rip(#000000) O[10] -attr @name ring_50[10] -pin u_m3_mac|ring_50_i O[10] -pin u_m3_mac|ring_5_reg[24:0] D[10]
load net u_m3_mac|s3_c[5] -attr @name s3_c[5] -pin u_m3_mac|s3_c_reg[17:0] Q[5] -pin u_m3_mac|s4_c_reg[17:0] D[5]
load net u_m3_mac|u_dsp|p[21] -attr @rip(#000000) 21 -attr @name p[21] -hierPin u_m3_mac|u_dsp p[21] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[21]
load net u_m1_line_buffer|line_buf2_reg[21]__0[4] -attr @name line_buf2_reg[21]__0[4] -pin u_m1_line_buffer|line_buf2_reg[21][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[22][7:0] D[4]
load net u_m1_line_buffer|line_buf2_reg[16]__0[3] -attr @name line_buf2_reg[16]__0[3] -pin u_m1_line_buffer|line_buf2_reg[16][7:0] Q[3] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] D[3]
load net u_m3_mac|acc_a0_i_n_4 -attr @rip(#000000) O[13] -attr @name acc_a0_i_n_4 -pin u_m3_mac|acc_a0_i O[13] -pin u_m3_mac|acc_a_reg[17:0] D[13]
load net u_m3_mac|u_dsp|a[12] -attr @rip(#000000) a[12] -attr @name a[12] -hierPin u_m3_mac|u_dsp a[12] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[12]
load net u_m3_mac|acc_a0_i_n_5 -attr @rip(#000000) O[12] -attr @name acc_a0_i_n_5 -pin u_m3_mac|acc_a0_i O[12] -pin u_m3_mac|acc_a_reg[17:0] D[12]
load net u_m3_mac|u_dsp|p0[0] -attr @rip(#000000) O[0] -attr @name p0[0] -pin u_m3_mac|u_dsp|p0_i O[0] -pin u_m3_mac|u_dsp|p_reg[33:0] D[0]
load net u_m6_control_fsm|state[0] -attr @rip 0 -attr @name state[0] -pin u_m6_control_fsm|busy0_i I0[0] -pin u_m6_control_fsm|clear1_i I0[0] -pin u_m6_control_fsm|drain_sr1_i I0[0] -pin u_m6_control_fsm|state_i S[0] -pin u_m6_control_fsm|state_next_i S[0] -pin u_m6_control_fsm|state_next_i__0 S[0] -pin u_m6_control_fsm|state_reg[1:0] Q[0]
load net mac_result[3] -attr @rip(#000000) mac_result[3] -pin u_m3_mac mac_result[3] -pin u_m5_output_handling mac_result[3]
load net u_m3_mac|acc_a0_i_n_6 -attr @rip(#000000) O[11] -attr @name acc_a0_i_n_6 -pin u_m3_mac|acc_a0_i O[11] -pin u_m3_mac|acc_a_reg[17:0] D[11]
load net u_m3_mac|ring_0[5] -attr @rip(#000000) 5 -attr @name ring_0[5] -pin u_m3_mac|ring_0_reg[24:0] Q[5] -pin u_m3_mac|ring_50_i I1[5] -pin u_m3_mac|u_dsp a[5]
load net u_m3_mac|ring_2[6] -attr @name ring_2[6] -pin u_m3_mac|ring_1_reg[24:0] D[6] -pin u_m3_mac|ring_2_reg[24:0] Q[6]
load net u_m3_mac|acc_a0_i_n_7 -attr @rip(#000000) O[10] -attr @name acc_a0_i_n_7 -pin u_m3_mac|acc_a0_i O[10] -pin u_m3_mac|acc_a_reg[17:0] D[10]
load net u_m3_mac|u_dsp|b[6] -attr @rip(#000000) b[6] -attr @name b[6] -hierPin u_m3_mac|u_dsp b[6] -pin u_m3_mac|u_dsp|b_r_reg[7:0] D[6]
load net u_m1_line_buffer|line_buf2_reg[17]__0[0] -attr @name line_buf2_reg[17]__0[0] -pin u_m1_line_buffer|line_buf2_reg[17][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[18][7:0] D[0]
load net u_m4_kernel_storage|tap_data[4] -attr @rip(#000000) 4 -attr @name tap_data[4] -hierPin u_m4_kernel_storage tap_data[4] -pin u_m4_kernel_storage|tap_data_reg[7:0] Q[4]
load net u_m1_line_buffer|line_buf2_reg[8]__0[0] -attr @name line_buf2_reg[8]__0[0] -pin u_m1_line_buffer|line_buf2_reg[8][7:0] Q[0] -pin u_m1_line_buffer|line_buf2_reg[9][7:0] D[0]
load net u_m3_mac|acc_a0_i_n_8 -attr @rip(#000000) O[9] -attr @name acc_a0_i_n_8 -pin u_m3_mac|acc_a0_i O[9] -pin u_m3_mac|acc_a_reg[17:0] D[9]
load net u_m3_mac|s4_a[14] -attr @name s4_a[14] -pin u_m3_mac|s4_a_reg[17:0] Q[14] -pin u_m3_mac|sum_c0_reg[17:0] D[14]
load net u_m5_output_handling|mac_result[15] -attr @rip(#000000) mac_result[15] -attr @name mac_result[15] -hierPin u_m5_output_handling mac_result[15] -pin u_m5_output_handling|rounded_val_r_reg[16:0] D[11]
load net u_m3_mac|acc_a0_i_n_9 -attr @rip(#000000) O[8] -attr @name acc_a0_i_n_9 -pin u_m3_mac|acc_a0_i O[8] -pin u_m3_mac|acc_a_reg[17:0] D[8]
load net u_m3_mac|ring_4[17] -attr @name ring_4[17] -pin u_m3_mac|ring_3_reg[24:0] D[17] -pin u_m3_mac|ring_4_reg[24:0] Q[17]
load net u_m3_mac|u_dsp|a[20] -attr @rip(#000000) a[20] -attr @name a[20] -hierPin u_m3_mac|u_dsp a[20] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[20]
load net u_m3_mac|u_dsp|m_r[8] -attr @rip(#000000) 8 -attr @name m_r[8] -pin u_m3_mac|u_dsp|m_r_reg[33:0] Q[8] -pin u_m3_mac|u_dsp|p0_i I0[8]
load net u_m1_line_buffer|line_buf2_reg[25]__0[4] -attr @name line_buf2_reg[25]__0[4] -pin u_m1_line_buffer|line_buf2_reg[25][7:0] Q[4] -pin u_m1_line_buffer|line_buf2_reg[26][7:0] D[4]
load net u_m3_mac|frame_a[1] -attr @name frame_a[1] -pin u_m3_mac|frame_a_reg[17:0] Q[1] -pin u_m3_mac|s3_a_reg[17:0] D[1]
load net u_m1_line_buffer|pixel_in[2] -attr @rip(#000000) pixel_in[2] -attr @name pixel_in[2] -hierPin u_m1_line_buffer curr_row_pixel[2] -hierPin u_m1_line_buffer pixel_in[2] -pin u_m1_line_buffer|line_buf1_reg[0][7:0] D[2]
load net u_m7_fifo|<const1> -power -attr @name <const1> -pin u_m7_fifo|mem_i I1 -pin u_m7_fifo|rd_ptr0_i I1 -pin u_m7_fifo|release_start0_i__0 I1[5] -pin u_m7_fifo|release_start0_i__0 I1[4] -pin u_m7_fifo|release_start0_i__0 I1[3] -pin u_m7_fifo|release_start0_i__0 I1[0] -pin u_m7_fifo|wr_ptr0_i__0 I1
load net clk_fast -pin u_clk_gen clk_fast -pin u_m3_mac clk_fast
netloc clk_fast 1 2 3 700J 8 1300J 10 5020
load net u_m3_mac|hi_src[7] -attr @rip(#000000) O[7] -attr @name hi_src[7] -pin u_m3_mac|hi_lane_i I0[8] -pin u_m3_mac|hi_lane_i I0[7] -pin u_m3_mac|hi_src_i O[7]
load net u_m3_mac|q_f2[6] -attr @rip(#000000) 6 -attr @name q_f2[6] -pin u_m3_mac|b_mux_i I2[6] -pin u_m3_mac|q_f2_reg[7:0] Q[6]
load net u_m3_mac|s4_c[4] -attr @name s4_c[4] -pin u_m3_mac|s4_c_reg[17:0] Q[4] -pin u_m3_mac|sum_c2_reg[17:0] D[4]
load net u_m3_mac|ring_50[22] -attr @rip(#000000) O[22] -attr @name ring_50[22] -pin u_m3_mac|ring_50_i O[22] -pin u_m3_mac|ring_5_reg[24:0] D[22]
load net u_m3_mac|u_dsp|a[2] -attr @rip(#000000) a[2] -attr @name a[2] -hierPin u_m3_mac|u_dsp a[2] -pin u_m3_mac|u_dsp|a_r_reg[24:0] D[2]
load net u_m3_mac|u_dsp|p[16] -attr @rip(#000000) 16 -attr @name p[16] -hierPin u_m3_mac|u_dsp p[16] -pin u_m3_mac|u_dsp|p_reg[33:0] Q[16]
load net u_m3_mac|col_row0[1] -attr @rip(#000000) col_row0[1] -attr @name col_row0[1] -hierPin u_m3_mac col_row0[1] -pin u_m3_mac|q_s0_reg[7:0] D[1]
load net u_m3_mac|s4_c[10] -attr @name s4_c[10] -pin u_m3_mac|s4_c_reg[17:0] Q[10] -pin u_m3_mac|sum_c2_reg[17:0] D[10]
load netBundle @u_m1_line_buffer|line_buf2_reg_55 8 u_m1_line_buffer|line_buf2_reg[17]__0[7] u_m1_line_buffer|line_buf2_reg[17]__0[6] u_m1_line_buffer|line_buf2_reg[17]__0[5] u_m1_line_buffer|line_buf2_reg[17]__0[4] u_m1_line_buffer|line_buf2_reg[17]__0[3] u_m1_line_buffer|line_buf2_reg[17]__0[2] u_m1_line_buffer|line_buf2_reg[17]__0[1] u_m1_line_buffer|line_buf2_reg[17]__0[0] -autobundled
load netBundle @u_m3_mac|ring_4 25 u_m3_mac|ring_4[24] u_m3_mac|ring_4[23] u_m3_mac|ring_4[22] u_m3_mac|ring_4[21] u_m3_mac|ring_4[20] u_m3_mac|ring_4[19] u_m3_mac|ring_4[18] u_m3_mac|ring_4[17] u_m3_mac|ring_4[16] u_m3_mac|ring_4[15] u_m3_mac|ring_4[14] u_m3_mac|ring_4[13] u_m3_mac|ring_4[12] u_m3_mac|ring_4[11] u_m3_mac|ring_4[10] u_m3_mac|ring_4[9] u_m3_mac|ring_4[8] u_m3_mac|ring_4[7] u_m3_mac|ring_4[6] u_m3_mac|ring_4[5] u_m3_mac|ring_4[4] u_m3_mac|ring_4[3] u_m3_mac|ring_4[2] u_m3_mac|ring_4[1] u_m3_mac|ring_4[0] -autobundled
netbloc @u_m3_mac|ring_4 1 11 1 N
load netBundle @u_m3_mac|s3_c 18 u_m3_mac|s3_c[17] u_m3_mac|s3_c[16] u_m3_mac|s3_c[15] u_m3_mac|s3_c[14] u_m3_mac|s3_c[13] u_m3_mac|s3_c[12] u_m3_mac|s3_c[11] u_m3_mac|s3_c[10] u_m3_mac|s3_c[9] u_m3_mac|s3_c[8] u_m3_mac|s3_c[7] u_m3_mac|s3_c[6] u_m3_mac|s3_c[5] u_m3_mac|s3_c[4] u_m3_mac|s3_c[3] u_m3_mac|s3_c[2] u_m3_mac|s3_c[1] u_m3_mac|s3_c[0] -autobundled
netbloc @u_m3_mac|s3_c 1 23 1 12290
load netBundle @u_m3_mac|q_s2 8 u_m3_mac|q_s2[7] u_m3_mac|q_s2[6] u_m3_mac|q_s2[5] u_m3_mac|q_s2[4] u_m3_mac|q_s2[3] u_m3_mac|q_s2[2] u_m3_mac|q_s2[1] u_m3_mac|q_s2[0] -autobundled
netbloc @u_m3_mac|q_s2 1 13 1 N
load netBundle @u_m3_mac|ring_5 25 u_m3_mac|ring_5[24] u_m3_mac|ring_5[23] u_m3_mac|ring_5[22] u_m3_mac|ring_5[21] u_m3_mac|ring_5[20] u_m3_mac|ring_5[19] u_m3_mac|ring_5[18] u_m3_mac|ring_5[17] u_m3_mac|ring_5[16] u_m3_mac|ring_5[15] u_m3_mac|ring_5[14] u_m3_mac|ring_5[13] u_m3_mac|ring_5[12] u_m3_mac|ring_5[11] u_m3_mac|ring_5[10] u_m3_mac|ring_5[9] u_m3_mac|ring_5[8] u_m3_mac|ring_5[7] u_m3_mac|ring_5[6] u_m3_mac|ring_5[5] u_m3_mac|ring_5[4] u_m3_mac|ring_5[3] u_m3_mac|ring_5[2] u_m3_mac|ring_5[1] u_m3_mac|ring_5[0] -autobundled
netbloc @u_m3_mac|ring_5 1 10 1 N
load netBundle @u_m4_kernel_storage|addr 5 u_m4_kernel_storage|addr[4] u_m4_kernel_storage|addr[3] u_m4_kernel_storage|addr[2] u_m4_kernel_storage|addr[1] u_m4_kernel_storage|addr[0] -autobundled
netbloc @u_m4_kernel_storage|addr 1 9 1 4140
load netBundle @u_m2_window_generator|p_1_in 2 u_m2_window_generator|p_1_in u_m2_window_generator|col_ge_reg_n_1 -autobundled
netbloc @u_m2_window_generator|p_1_in 1 6 2 4380 632 4630
load netBundle @u_m7_fifo|rd_ptr0 6 u_m7_fifo|rd_ptr0[5] u_m7_fifo|rd_ptr0[4] u_m7_fifo|rd_ptr0[3] u_m7_fifo|rd_ptr0[2] u_m7_fifo|rd_ptr0[1] u_m7_fifo|rd_ptr0[0] -autobundled
netbloc @u_m7_fifo|rd_ptr0 1 4 1 NJ
load netBundle @u_m1_line_buffer|line_buf1_reg_4 8 u_m1_line_buffer|line_buf1_reg[0]__0[7] u_m1_line_buffer|line_buf1_reg[0]__0[6] u_m1_line_buffer|line_buf1_reg[0]__0[5] u_m1_line_buffer|line_buf1_reg[0]__0[4] u_m1_line_buffer|line_buf1_reg[0]__0[3] u_m1_line_buffer|line_buf1_reg[0]__0[2] u_m1_line_buffer|line_buf1_reg[0]__0[1] u_m1_line_buffer|line_buf1_reg[0]__0[0] -autobundled
load netBundle @u_m3_mac|acc_b0 18 u_m3_mac|acc_b0[17] u_m3_mac|acc_b0[16] u_m3_mac|acc_b0[15] u_m3_mac|acc_b0[14] u_m3_mac|acc_b0[13] u_m3_mac|acc_b0[12] u_m3_mac|acc_b0[11] u_m3_mac|acc_b0[10] u_m3_mac|acc_b0[9] u_m3_mac|acc_b0[8] u_m3_mac|acc_b0[7] u_m3_mac|acc_b0[6] u_m3_mac|acc_b0[5] u_m3_mac|acc_b0[4] u_m3_mac|acc_b0[3] u_m3_mac|acc_b0[2] u_m3_mac|acc_b0[1] u_m3_mac|acc_b0[0] -autobundled
netbloc @u_m3_mac|acc_b0 1 18 1 10890
load netBundle @u_m4_kernel_storage|mem_reg_n_ 8 u_m4_kernel_storage|mem_reg_n_0 u_m4_kernel_storage|mem_reg_n_1 u_m4_kernel_storage|mem_reg_n_2 u_m4_kernel_storage|mem_reg_n_3 u_m4_kernel_storage|mem_reg_n_4 u_m4_kernel_storage|mem_reg_n_5 u_m4_kernel_storage|mem_reg_n_6 u_m4_kernel_storage|mem_reg_n_7 -autobundled
netbloc @u_m4_kernel_storage|mem_reg_n_ 1 10 1 4340
load netBundle @u_m3_mac|acc_a 18 u_m3_mac|acc_a[17] u_m3_mac|acc_a[16] u_m3_mac|acc_a[15] u_m3_mac|acc_a[14] u_m3_mac|acc_a[13] u_m3_mac|acc_a[12] u_m3_mac|acc_a[11] u_m3_mac|acc_a[10] u_m3_mac|acc_a[9] u_m3_mac|acc_a[8] u_m3_mac|acc_a[7] u_m3_mac|acc_a[6] u_m3_mac|acc_a[5] u_m3_mac|acc_a[4] u_m3_mac|acc_a[3] u_m3_mac|acc_a[2] u_m3_mac|acc_a[1] u_m3_mac|acc_a[0] -autobundled
netbloc @u_m3_mac|acc_a 1 15 4 9120 498 NJ 498 NJ 498 10990
load netBundle @kernel_wr_data 8 kernel_wr_data[7] kernel_wr_data[6] kernel_wr_data[5] kernel_wr_data[4] kernel_wr_data[3] kernel_wr_data[2] kernel_wr_data[1] kernel_wr_data[0] -autobundled
netbloc @kernel_wr_data 1 0 4 NJ 570 190J 728 800J 570 1160J
load netBundle @u_m1_line_buffer|prev_row1_pix 8 u_m1_line_buffer|prev_row1_pixel[7] u_m1_line_buffer|prev_row1_pixel[6] u_m1_line_buffer|prev_row1_pixel[5] u_m1_line_buffer|prev_row1_pixel[4] u_m1_line_buffer|prev_row1_pixel[3] u_m1_line_buffer|prev_row1_pixel[2] u_m1_line_buffer|prev_row1_pixel[1] u_m1_line_buffer|prev_row1_pixel[0] -autobundled
netbloc @u_m1_line_buffer|prev_row1_pix 1 0 33 1020 268 1260J 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 NJ 248 8660
load netBundle @u_m1_line_buffer|line_buf1_reg_6 8 u_m1_line_buffer|line_buf1_reg[16]__0[7] u_m1_line_buffer|line_buf1_reg[16]__0[6] u_m1_line_buffer|line_buf1_reg[16]__0[5] u_m1_line_buffer|line_buf1_reg[16]__0[4] u_m1_line_buffer|line_buf1_reg[16]__0[3] u_m1_line_buffer|line_buf1_reg[16]__0[2] u_m1_line_buffer|line_buf1_reg[16]__0[1] u_m1_line_buffer|line_buf1_reg[16]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_7 8 u_m1_line_buffer|line_buf1_reg[20]__0[7] u_m1_line_buffer|line_buf1_reg[20]__0[6] u_m1_line_buffer|line_buf1_reg[20]__0[5] u_m1_line_buffer|line_buf1_reg[20]__0[4] u_m1_line_buffer|line_buf1_reg[20]__0[3] u_m1_line_buffer|line_buf1_reg[20]__0[2] u_m1_line_buffer|line_buf1_reg[20]__0[1] u_m1_line_buffer|line_buf1_reg[20]__0[0] -autobundled
load netBundle @u_m3_mac|acc_a0_i_n_0 18 u_m3_mac|acc_a0_i_n_0 u_m3_mac|acc_a0_i_n_1 u_m3_mac|acc_a0_i_n_2 u_m3_mac|acc_a0_i_n_3 u_m3_mac|acc_a0_i_n_4 u_m3_mac|acc_a0_i_n_5 u_m3_mac|acc_a0_i_n_6 u_m3_mac|acc_a0_i_n_7 u_m3_mac|acc_a0_i_n_8 u_m3_mac|acc_a0_i_n_9 u_m3_mac|acc_a0_i_n_10 u_m3_mac|acc_a0_i_n_11 u_m3_mac|acc_a0_i_n_12 u_m3_mac|acc_a0_i_n_13 u_m3_mac|acc_a0_i_n_14 u_m3_mac|acc_a0_i_n_15 u_m3_mac|acc_a0_i_n_16 u_m3_mac|acc_a0_i_n_17 -autobundled
netbloc @u_m3_mac|acc_a0_i_n_0 1 17 1 N
load netBundle @u_m3_mac|acc_b 18 u_m3_mac|acc_b[17] u_m3_mac|acc_b[16] u_m3_mac|acc_b[15] u_m3_mac|acc_b[14] u_m3_mac|acc_b[13] u_m3_mac|acc_b[12] u_m3_mac|acc_b[11] u_m3_mac|acc_b[10] u_m3_mac|acc_b[9] u_m3_mac|acc_b[8] u_m3_mac|acc_b[7] u_m3_mac|acc_b[6] u_m3_mac|acc_b[5] u_m3_mac|acc_b[4] u_m3_mac|acc_b[3] u_m3_mac|acc_b[2] u_m3_mac|acc_b[1] u_m3_mac|acc_b[0] -autobundled
netbloc @u_m3_mac|acc_b 1 16 4 10370 778 NJ 778 10910J 808 11330
load netBundle @u_m4_kernel_storage|p_0_in 4 u_m4_kernel_storage|p_0_in[3] u_m4_kernel_storage|p_0_in[2] u_m4_kernel_storage|p_0_in[1] u_m4_kernel_storage|p_0_in[0] -autobundled
netbloc @u_m4_kernel_storage|p_0_in 1 5 6 3020 1582 NJ N NJ 1582 3790 1582 NJ 1582 NJ
load netBundle @u_m4_kernel_storage|kernel_wr__1 8 u_m4_kernel_storage|kernel_wr_data[7] u_m4_kernel_storage|kernel_wr_data[6] u_m4_kernel_storage|kernel_wr_data[5] u_m4_kernel_storage|kernel_wr_data[4] u_m4_kernel_storage|kernel_wr_data[3] u_m4_kernel_storage|kernel_wr_data[2] u_m4_kernel_storage|kernel_wr_data[1] u_m4_kernel_storage|kernel_wr_data[0] -autobundled
netbloc @u_m4_kernel_storage|kernel_wr__1 1 0 10 NJ 1342 1980J 1302 2260J 1322 NJ 1322 NJ 1322 NJ 1322 NJ 1322 NJ 1322 3770J 1292 4100
load netBundle @pixel_in 8 pixel_in[7] pixel_in[6] pixel_in[5] pixel_in[4] pixel_in[3] pixel_in[2] pixel_in[1] pixel_in[0] -autobundled
netbloc @pixel_in 1 0 3 NJ 20 310J 18 680J
load netBundle @u_m1_line_buffer|line_buf2_reg_31 8 u_m1_line_buffer|line_buf2_reg[14]__0[7] u_m1_line_buffer|line_buf2_reg[14]__0[6] u_m1_line_buffer|line_buf2_reg[14]__0[5] u_m1_line_buffer|line_buf2_reg[14]__0[4] u_m1_line_buffer|line_buf2_reg[14]__0[3] u_m1_line_buffer|line_buf2_reg[14]__0[2] u_m1_line_buffer|line_buf2_reg[14]__0[1] u_m1_line_buffer|line_buf2_reg[14]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_83 8 u_m1_line_buffer|line_buf2_reg[26]__0[7] u_m1_line_buffer|line_buf2_reg[26]__0[6] u_m1_line_buffer|line_buf2_reg[26]__0[5] u_m1_line_buffer|line_buf2_reg[26]__0[4] u_m1_line_buffer|line_buf2_reg[26]__0[3] u_m1_line_buffer|line_buf2_reg[26]__0[2] u_m1_line_buffer|line_buf2_reg[26]__0[1] u_m1_line_buffer|line_buf2_reg[26]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_87 8 u_m1_line_buffer|line_buf1_reg[19]__0[7] u_m1_line_buffer|line_buf1_reg[19]__0[6] u_m1_line_buffer|line_buf1_reg[19]__0[5] u_m1_line_buffer|line_buf1_reg[19]__0[4] u_m1_line_buffer|line_buf1_reg[19]__0[3] u_m1_line_buffer|line_buf1_reg[19]__0[2] u_m1_line_buffer|line_buf1_reg[19]__0[1] u_m1_line_buffer|line_buf1_reg[19]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_8 8 u_m1_line_buffer|line_buf1_reg[5]__0[7] u_m1_line_buffer|line_buf1_reg[5]__0[6] u_m1_line_buffer|line_buf1_reg[5]__0[5] u_m1_line_buffer|line_buf1_reg[5]__0[4] u_m1_line_buffer|line_buf1_reg[5]__0[3] u_m1_line_buffer|line_buf1_reg[5]__0[2] u_m1_line_buffer|line_buf1_reg[5]__0[1] u_m1_line_buffer|line_buf1_reg[5]__0[0] -autobundled
load netBundle @u_m5_output_handling|mac_resul 16 u_m5_output_handling|mac_result[19] u_m5_output_handling|mac_result[18] u_m5_output_handling|mac_result[17] u_m5_output_handling|mac_result[16] u_m5_output_handling|mac_result[15] u_m5_output_handling|mac_result[14] u_m5_output_handling|mac_result[13] u_m5_output_handling|mac_result[12] u_m5_output_handling|mac_result[11] u_m5_output_handling|mac_result[10] u_m5_output_handling|mac_result[9] u_m5_output_handling|mac_result[8] u_m5_output_handling|mac_result[7] u_m5_output_handling|mac_result[6] u_m5_output_handling|mac_result[5] u_m5_output_handling|mac_result[4] -autobundled
netbloc @u_m5_output_handling|mac_resul 1 0 1 N
load netBundle @u_m3_mac|acc_c0_i_n_0 18 u_m3_mac|acc_c0_i_n_0 u_m3_mac|acc_c0_i_n_1 u_m3_mac|acc_c0_i_n_2 u_m3_mac|acc_c0_i_n_3 u_m3_mac|acc_c0_i_n_4 u_m3_mac|acc_c0_i_n_5 u_m3_mac|acc_c0_i_n_6 u_m3_mac|acc_c0_i_n_7 u_m3_mac|acc_c0_i_n_8 u_m3_mac|acc_c0_i_n_9 u_m3_mac|acc_c0_i_n_10 u_m3_mac|acc_c0_i_n_11 u_m3_mac|acc_c0_i_n_12 u_m3_mac|acc_c0_i_n_13 u_m3_mac|acc_c0_i_n_14 u_m3_mac|acc_c0_i_n_15 u_m3_mac|acc_c0_i_n_16 u_m3_mac|acc_c0_i_n_17 -autobundled
netbloc @u_m3_mac|acc_c0_i_n_0 1 20 1 11630
load netBundle @u_m3_mac|acc_c 18 u_m3_mac|acc_c[17] u_m3_mac|acc_c[16] u_m3_mac|acc_c[15] u_m3_mac|acc_c[14] u_m3_mac|acc_c[13] u_m3_mac|acc_c[12] u_m3_mac|acc_c[11] u_m3_mac|acc_c[10] u_m3_mac|acc_c[9] u_m3_mac|acc_c[8] u_m3_mac|acc_c[7] u_m3_mac|acc_c[6] u_m3_mac|acc_c[5] u_m3_mac|acc_c[4] u_m3_mac|acc_c[3] u_m3_mac|acc_c[2] u_m3_mac|acc_c[1] u_m3_mac|acc_c[0] -autobundled
netbloc @u_m3_mac|acc_c 1 18 4 10970 788 NJ 788 NJ 788 11850
load netBundle @u_m7_fifo|final_output 16 u_m7_fifo|final_output[15] u_m7_fifo|final_output[14] u_m7_fifo|final_output[13] u_m7_fifo|final_output[12] u_m7_fifo|final_output[11] u_m7_fifo|final_output[10] u_m7_fifo|final_output[9] u_m7_fifo|final_output[8] u_m7_fifo|final_output[7] u_m7_fifo|final_output[6] u_m7_fifo|final_output[5] u_m7_fifo|final_output[4] u_m7_fifo|final_output[3] u_m7_fifo|final_output[2] u_m7_fifo|final_output[1] u_m7_fifo|final_output[0] -autobundled
netbloc @u_m7_fifo|final_output 1 0 9 14930J 728 NJ 728 NJ 728 NJ 728 NJ 728 NJ 728 NJ 728 NJ 728 17120
load netBundle @u_m1_line_buffer|line_buf1_reg_9 8 u_m1_line_buffer|line_buf1_reg[22]__0[7] u_m1_line_buffer|line_buf1_reg[22]__0[6] u_m1_line_buffer|line_buf1_reg[22]__0[5] u_m1_line_buffer|line_buf1_reg[22]__0[4] u_m1_line_buffer|line_buf1_reg[22]__0[3] u_m1_line_buffer|line_buf1_reg[22]__0[2] u_m1_line_buffer|line_buf1_reg[22]__0[1] u_m1_line_buffer|line_buf1_reg[22]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_33 8 u_m1_line_buffer|line_buf2_reg[28]__0[7] u_m1_line_buffer|line_buf2_reg[28]__0[6] u_m1_line_buffer|line_buf2_reg[28]__0[5] u_m1_line_buffer|line_buf2_reg[28]__0[4] u_m1_line_buffer|line_buf2_reg[28]__0[3] u_m1_line_buffer|line_buf2_reg[28]__0[2] u_m1_line_buffer|line_buf2_reg[28]__0[1] u_m1_line_buffer|line_buf2_reg[28]__0[0] -autobundled
load netBundle @u_m3_mac|insph_s 3 u_m3_mac|insph_s[2] u_m3_mac|insph_s[1] u_m3_mac|insph_s[0] -autobundled
netbloc @u_m3_mac|insph_s 1 5 1 6720
load netBundle @u_m1_line_buffer|line_buf1_reg 8 u_m1_line_buffer|line_buf1_reg[4]__0[7] u_m1_line_buffer|line_buf1_reg[4]__0[6] u_m1_line_buffer|line_buf1_reg[4]__0[5] u_m1_line_buffer|line_buf1_reg[4]__0[4] u_m1_line_buffer|line_buf1_reg[4]__0[3] u_m1_line_buffer|line_buf1_reg[4]__0[2] u_m1_line_buffer|line_buf1_reg[4]__0[1] u_m1_line_buffer|line_buf1_reg[4]__0[0] -autobundled
netbloc @u_m1_line_buffer|line_buf1_reg 1 8 1 2880
load netBundle @u_m7_fifo|mem_reg_n_0 16 u_m7_fifo|mem_reg_n_0 u_m7_fifo|mem_reg_n_1 u_m7_fifo|mem_reg_n_2 u_m7_fifo|mem_reg_n_3 u_m7_fifo|mem_reg_n_4 u_m7_fifo|mem_reg_n_5 u_m7_fifo|mem_reg_n_6 u_m7_fifo|mem_reg_n_7 u_m7_fifo|mem_reg_n_8 u_m7_fifo|mem_reg_n_9 u_m7_fifo|mem_reg_n_10 u_m7_fifo|mem_reg_n_11 u_m7_fifo|mem_reg_n_12 u_m7_fifo|mem_reg_n_13 u_m7_fifo|mem_reg_n_14 u_m7_fifo|mem_reg_n_15 -autobundled
netbloc @u_m7_fifo|mem_reg_n_0 1 9 1 17500
load netBundle @u_m1_line_buffer|line_buf2_reg_85 8 u_m1_line_buffer|line_buf2_reg[4]__0[7] u_m1_line_buffer|line_buf2_reg[4]__0[6] u_m1_line_buffer|line_buf2_reg[4]__0[5] u_m1_line_buffer|line_buf2_reg[4]__0[4] u_m1_line_buffer|line_buf2_reg[4]__0[3] u_m1_line_buffer|line_buf2_reg[4]__0[2] u_m1_line_buffer|line_buf2_reg[4]__0[1] u_m1_line_buffer|line_buf2_reg[4]__0[0] -autobundled
load netBundle @tap_data 8 tap_data[7] tap_data[6] tap_data[5] tap_data[4] tap_data[3] tap_data[2] tap_data[1] tap_data[0] -autobundled
netbloc @tap_data 1 4 1 5060
load netBundle @u_m6_control_fsm|state 2 u_m6_control_fsm|state[1] u_m6_control_fsm|state[0] -autobundled
netbloc @u_m6_control_fsm|state 1 0 7 18380 618 18640 618 NJ 618 NJ 618 19550 N 19940 518 20170
load netBundle @u_m1_line_buffer|line_buf2_reg_35 8 u_m1_line_buffer|line_buf2_reg[2]__0[7] u_m1_line_buffer|line_buf2_reg[2]__0[6] u_m1_line_buffer|line_buf2_reg[2]__0[5] u_m1_line_buffer|line_buf2_reg[2]__0[4] u_m1_line_buffer|line_buf2_reg[2]__0[3] u_m1_line_buffer|line_buf2_reg[2]__0[2] u_m1_line_buffer|line_buf2_reg[2]__0[1] u_m1_line_buffer|line_buf2_reg[2]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_61 8 u_m1_line_buffer|line_buf1_reg[29]__0[7] u_m1_line_buffer|line_buf1_reg[29]__0[6] u_m1_line_buffer|line_buf1_reg[29]__0[5] u_m1_line_buffer|line_buf1_reg[29]__0[4] u_m1_line_buffer|line_buf1_reg[29]__0[3] u_m1_line_buffer|line_buf1_reg[29]__0[2] u_m1_line_buffer|line_buf1_reg[29]__0[1] u_m1_line_buffer|line_buf1_reg[29]__0[0] -autobundled
load netBundle @u_m3_mac|dsp_p 32 u_m3_mac|dsp_p[31] u_m3_mac|dsp_p[30] u_m3_mac|dsp_p[29] u_m3_mac|dsp_p[28] u_m3_mac|dsp_p[27] u_m3_mac|dsp_p[26] u_m3_mac|dsp_p[25] u_m3_mac|dsp_p[24] u_m3_mac|dsp_p[23] u_m3_mac|dsp_p[22] u_m3_mac|dsp_p[21] u_m3_mac|dsp_p[20] u_m3_mac|dsp_p[19] u_m3_mac|dsp_p[18] u_m3_mac|dsp_p[17] u_m3_mac|dsp_p[16] u_m3_mac|dsp_p[15] u_m3_mac|dsp_p[14] u_m3_mac|dsp_p[13] u_m3_mac|dsp_p[12] u_m3_mac|dsp_p[11] u_m3_mac|dsp_p[10] u_m3_mac|dsp_p[9] u_m3_mac|dsp_p[8] u_m3_mac|dsp_p[7] u_m3_mac|dsp_p[6] u_m3_mac|dsp_p[5] u_m3_mac|dsp_p[4] u_m3_mac|dsp_p[3] u_m3_mac|dsp_p[2] u_m3_mac|dsp_p[1] u_m3_mac|dsp_p[0] -autobundled
netbloc @u_m3_mac|dsp_p 1 16 4 10350 818 10690 798 10890J 828 11310
load netBundle @u_m1_line_buffer|line_buf2_reg_37 8 u_m1_line_buffer|line_buf2_reg[15]__0[7] u_m1_line_buffer|line_buf2_reg[15]__0[6] u_m1_line_buffer|line_buf2_reg[15]__0[5] u_m1_line_buffer|line_buf2_reg[15]__0[4] u_m1_line_buffer|line_buf2_reg[15]__0[3] u_m1_line_buffer|line_buf2_reg[15]__0[2] u_m1_line_buffer|line_buf2_reg[15]__0[1] u_m1_line_buffer|line_buf2_reg[15]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_12 8 u_m1_line_buffer|line_buf1_reg[2]__0[7] u_m1_line_buffer|line_buf1_reg[2]__0[6] u_m1_line_buffer|line_buf1_reg[2]__0[5] u_m1_line_buffer|line_buf1_reg[2]__0[4] u_m1_line_buffer|line_buf1_reg[2]__0[3] u_m1_line_buffer|line_buf1_reg[2]__0[2] u_m1_line_buffer|line_buf1_reg[2]__0[1] u_m1_line_buffer|line_buf1_reg[2]__0[0] -autobundled
load netBundle @u_m3_mac|u_dsp|p_0_in 8 u_m3_mac|u_dsp|p_0_in[7] u_m3_mac|u_dsp|p_0_in[6] u_m3_mac|u_dsp|p_0_in[5] u_m3_mac|u_dsp|p_0_in[4] u_m3_mac|u_dsp|p_0_in[3] u_m3_mac|u_dsp|p_0_in[2] u_m3_mac|u_dsp|p_0_in[1] u_m3_mac|u_dsp|p_0_in[0] -autobundled
netbloc @u_m3_mac|u_dsp|p_0_in 1 1 1 9440
load netBundle @u_m1_line_buffer|line_buf2_reg_89 8 u_m1_line_buffer|line_buf2_reg[5]__0[7] u_m1_line_buffer|line_buf2_reg[5]__0[6] u_m1_line_buffer|line_buf2_reg[5]__0[5] u_m1_line_buffer|line_buf2_reg[5]__0[4] u_m1_line_buffer|line_buf2_reg[5]__0[3] u_m1_line_buffer|line_buf2_reg[5]__0[2] u_m1_line_buffer|line_buf2_reg[5]__0[1] u_m1_line_buffer|line_buf2_reg[5]__0[0] -autobundled
load netBundle @u_m3_mac|ph 3 u_m3_mac|ph[2] u_m3_mac|ph[1] u_m3_mac|ph[0] -autobundled
netbloc @u_m3_mac|ph 1 3 18 6090 358 NJ N 6760 388 7110 698 NJ 698 NJ 698 NJ 698 NJ 698 NJ 698 NJ 698 NJ 698 8680 N 9040 N 10330 N 10690 748 10950 N NJ 758 11610J
load netBundle @u_m3_mac|ev 5 u_m3_mac|ev[5] u_m3_mac|ev[4] u_m3_mac|ev[3] u_m3_mac|ev[2] u_m3_mac|ev[1] -autobundled
netbloc @u_m3_mac|ev 1 19 8 11350 218 11650 358 11850 338 12070 338 12270 338 12510 318 NJ 318 12950
load netBundle @output_pixel 16 output_pixel[15] output_pixel[14] output_pixel[13] output_pixel[12] output_pixel[11] output_pixel[10] output_pixel[9] output_pixel[8] output_pixel[7] output_pixel[6] output_pixel[5] output_pixel[4] output_pixel[3] output_pixel[2] output_pixel[1] output_pixel[0] -autobundled
netbloc @output_pixel 1 7 2 18060J 210 NJ
load netBundle @curr_row_pixel 8 curr_row_pixel[7] curr_row_pixel[6] curr_row_pixel[5] curr_row_pixel[4] curr_row_pixel[3] curr_row_pixel[2] curr_row_pixel[1] curr_row_pixel[0] -autobundled
netbloc @curr_row_pixel 1 3 2 NJ 70 5120
load netBundle @tap_idx 4 tap_idx[3] tap_idx[2] tap_idx[1] tap_idx[0] -autobundled
netbloc @tap_idx 1 4 1 5080
load netBundle @u_m2_window_generator|u_col|lf 6 u_m2_window_generator|u_col|state_reg_n_0 u_m2_window_generator|u_col|lfsr_step2076_return[5] u_m2_window_generator|u_col|lfsr_step2076_return[4] u_m2_window_generator|u_col|lfsr_step2076_return[3] u_m2_window_generator|u_col|lfsr_step2076_return[2] u_m2_window_generator|u_col|lfsr_step2076_return[1] -autobundled
netbloc @u_m2_window_generator|u_col|lf 1 0 4 2080 816 NJ 816 2730 926 2980
load netBundle @u_m7_fifo|rd_ptr 6 u_m7_fifo|rd_ptr[5] u_m7_fifo|rd_ptr[4] u_m7_fifo|rd_ptr[3] u_m7_fifo|rd_ptr[2] u_m7_fifo|rd_ptr[1] u_m7_fifo|rd_ptr[0] -autobundled
netbloc @u_m7_fifo|rd_ptr 1 3 6 15670 428 NJ 428 16300 568 NJ 568 NJ 568 N
load netBundle @u_m1_line_buffer|line_buf2_reg_39 8 u_m1_line_buffer|line_buf2_reg[8]__0[7] u_m1_line_buffer|line_buf2_reg[8]__0[6] u_m1_line_buffer|line_buf2_reg[8]__0[5] u_m1_line_buffer|line_buf2_reg[8]__0[4] u_m1_line_buffer|line_buf2_reg[8]__0[3] u_m1_line_buffer|line_buf2_reg[8]__0[2] u_m1_line_buffer|line_buf2_reg[8]__0[1] u_m1_line_buffer|line_buf2_reg[8]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_65 8 u_m1_line_buffer|line_buf1_reg[26]__0[7] u_m1_line_buffer|line_buf1_reg[26]__0[6] u_m1_line_buffer|line_buf1_reg[26]__0[5] u_m1_line_buffer|line_buf1_reg[26]__0[4] u_m1_line_buffer|line_buf1_reg[26]__0[3] u_m1_line_buffer|line_buf1_reg[26]__0[2] u_m1_line_buffer|line_buf1_reg[26]__0[1] u_m1_line_buffer|line_buf1_reg[26]__0[0] -autobundled
load netBundle @u_m3_mac|u_dsp|p 34 u_m3_mac|u_dsp|p[33] u_m3_mac|u_dsp|p[32] u_m3_mac|u_dsp|p[31] u_m3_mac|u_dsp|p[30] u_m3_mac|u_dsp|p[29] u_m3_mac|u_dsp|p[28] u_m3_mac|u_dsp|p[27] u_m3_mac|u_dsp|p[26] u_m3_mac|u_dsp|p[25] u_m3_mac|u_dsp|p[24] u_m3_mac|u_dsp|p[23] u_m3_mac|u_dsp|p[22] u_m3_mac|u_dsp|p[21] u_m3_mac|u_dsp|p[20] u_m3_mac|u_dsp|p[19] u_m3_mac|u_dsp|p[18] u_m3_mac|u_dsp|p[17] u_m3_mac|u_dsp|p[16] u_m3_mac|u_dsp|p[15] u_m3_mac|u_dsp|p[14] u_m3_mac|u_dsp|p[13] u_m3_mac|u_dsp|p[12] u_m3_mac|u_dsp|p[11] u_m3_mac|u_dsp|p[10] u_m3_mac|u_dsp|p[9] u_m3_mac|u_dsp|p[8] u_m3_mac|u_dsp|p[7] u_m3_mac|u_dsp|p[6] u_m3_mac|u_dsp|p[5] u_m3_mac|u_dsp|p[4] u_m3_mac|u_dsp|p[3] u_m3_mac|u_dsp|p[2] u_m3_mac|u_dsp|p[1] u_m3_mac|u_dsp|p[0] -autobundled
netbloc @u_m3_mac|u_dsp|p 1 5 1 N
load netBundle @u_m1_line_buffer|line_buf1_reg_14 8 u_m1_line_buffer|line_buf1_reg[7]__0[7] u_m1_line_buffer|line_buf1_reg[7]__0[6] u_m1_line_buffer|line_buf1_reg[7]__0[5] u_m1_line_buffer|line_buf1_reg[7]__0[4] u_m1_line_buffer|line_buf1_reg[7]__0[3] u_m1_line_buffer|line_buf1_reg[7]__0[2] u_m1_line_buffer|line_buf1_reg[7]__0[1] u_m1_line_buffer|line_buf1_reg[7]__0[0] -autobundled
load netBundle @u_m7_fifo|wr_ptr0_i__0_n_0 6 u_m7_fifo|wr_ptr0_i__0_n_0 u_m7_fifo|wr_ptr0_i__0_n_1 u_m7_fifo|wr_ptr0_i__0_n_2 u_m7_fifo|wr_ptr0_i__0_n_3 u_m7_fifo|wr_ptr0_i__0_n_4 u_m7_fifo|wr_ptr0_i__0_n_5 -autobundled
netbloc @u_m7_fifo|wr_ptr0_i__0_n_0 1 2 1 NJ
load netBundle @u_m1_line_buffer|line_buf2_reg_11 8 u_m1_line_buffer|line_buf2_reg[11]__0[7] u_m1_line_buffer|line_buf2_reg[11]__0[6] u_m1_line_buffer|line_buf2_reg[11]__0[5] u_m1_line_buffer|line_buf2_reg[11]__0[4] u_m1_line_buffer|line_buf2_reg[11]__0[3] u_m1_line_buffer|line_buf2_reg[11]__0[2] u_m1_line_buffer|line_buf2_reg[11]__0[1] u_m1_line_buffer|line_buf2_reg[11]__0[0] -autobundled
load netBundle @u_m3_mac|col_row0 8 u_m3_mac|col_row0[7] u_m3_mac|col_row0[6] u_m3_mac|col_row0[5] u_m3_mac|col_row0[4] u_m3_mac|col_row0[3] u_m3_mac|col_row0[2] u_m3_mac|col_row0[1] u_m3_mac|col_row0[0] -autobundled
netbloc @u_m3_mac|col_row0 1 0 13 5280 118 NJ 118 NJ 118 NJ 118 NJ 118 NJ 118 NJ 118 NJ 118 NJ 118 NJ 118 NJ 118 NJ 118 8240J
load netBundle @u_m3_mac|slot 3 u_m3_mac|slot[2] u_m3_mac|slot[1] u_m3_mac|slot[0] -autobundled
netbloc @u_m3_mac|slot 1 3 1 6050
load netBundle @u_m3_mac|b_mux 8 u_m3_mac|b_mux[7] u_m3_mac|b_mux[6] u_m3_mac|b_mux[5] u_m3_mac|b_mux[4] u_m3_mac|b_mux[3] u_m3_mac|b_mux[2] u_m3_mac|b_mux[1] u_m3_mac|b_mux[0] -autobundled
netbloc @u_m3_mac|b_mux 1 15 1 9100
load netBundle @u_m1_line_buffer|line_buf1_reg_67 8 u_m1_line_buffer|line_buf1_reg[15]__0[7] u_m1_line_buffer|line_buf1_reg[15]__0[6] u_m1_line_buffer|line_buf1_reg[15]__0[5] u_m1_line_buffer|line_buf1_reg[15]__0[4] u_m1_line_buffer|line_buf1_reg[15]__0[3] u_m1_line_buffer|line_buf1_reg[15]__0[2] u_m1_line_buffer|line_buf1_reg[15]__0[1] u_m1_line_buffer|line_buf1_reg[15]__0[0] -autobundled
load netBundle @u_m3_mac|col_row1 8 u_m3_mac|col_row1[7] u_m3_mac|col_row1[6] u_m3_mac|col_row1[5] u_m3_mac|col_row1[4] u_m3_mac|col_row1[3] u_m3_mac|col_row1[2] u_m3_mac|col_row1[1] u_m3_mac|col_row1[0] -autobundled
netbloc @u_m3_mac|col_row1 1 0 13 5320 428 NJ 428 NJ 428 NJ 428 NJ 428 NJ 428 NJ 428 NJ 428 NJ 428 NJ 428 NJ 428 NJ 428 NJ
load netBundle @u_m1_line_buffer|line_buf1_reg_16 8 u_m1_line_buffer|line_buf1_reg[21]__0[7] u_m1_line_buffer|line_buf1_reg[21]__0[6] u_m1_line_buffer|line_buf1_reg[21]__0[5] u_m1_line_buffer|line_buf1_reg[21]__0[4] u_m1_line_buffer|line_buf1_reg[21]__0[3] u_m1_line_buffer|line_buf1_reg[21]__0[2] u_m1_line_buffer|line_buf1_reg[21]__0[1] u_m1_line_buffer|line_buf1_reg[21]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_13 8 u_m1_line_buffer|line_buf2_reg[29]__0[7] u_m1_line_buffer|line_buf2_reg[29]__0[6] u_m1_line_buffer|line_buf2_reg[29]__0[5] u_m1_line_buffer|line_buf2_reg[29]__0[4] u_m1_line_buffer|line_buf2_reg[29]__0[3] u_m1_line_buffer|line_buf2_reg[29]__0[2] u_m1_line_buffer|line_buf2_reg[29]__0[1] u_m1_line_buffer|line_buf2_reg[29]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_63 8 u_m1_line_buffer|line_buf2_reg[3]__0[7] u_m1_line_buffer|line_buf2_reg[3]__0[6] u_m1_line_buffer|line_buf2_reg[3]__0[5] u_m1_line_buffer|line_buf2_reg[3]__0[4] u_m1_line_buffer|line_buf2_reg[3]__0[3] u_m1_line_buffer|line_buf2_reg[3]__0[2] u_m1_line_buffer|line_buf2_reg[3]__0[1] u_m1_line_buffer|line_buf2_reg[3]__0[0] -autobundled
load netBundle @u_m6_control_fsm|state_next 2 u_m6_control_fsm|state_next[1] u_m6_control_fsm|state_next[0] -autobundled
netbloc @u_m6_control_fsm|state_next 1 5 1 19960
load netBundle @u_m3_mac|col_row2 8 u_m3_mac|col_row2[7] u_m3_mac|col_row2[6] u_m3_mac|col_row2[5] u_m3_mac|col_row2[4] u_m3_mac|col_row2[3] u_m3_mac|col_row2[2] u_m3_mac|col_row2[1] u_m3_mac|col_row2[0] -autobundled
netbloc @u_m3_mac|col_row2 1 0 13 5280 468 NJ 468 NJ 468 NJ 468 NJ 468 NJ 468 NJ 468 NJ 468 NJ 468 NJ 468 NJ 468 NJ 468 8240J
load netBundle @u_m3_mac|base_a 18 u_m3_mac|base_a[17] u_m3_mac|base_a[16] u_m3_mac|base_a[15] u_m3_mac|base_a[14] u_m3_mac|base_a[13] u_m3_mac|base_a[12] u_m3_mac|base_a[11] u_m3_mac|base_a[10] u_m3_mac|base_a[9] u_m3_mac|base_a[8] u_m3_mac|base_a[7] u_m3_mac|base_a[6] u_m3_mac|base_a[5] u_m3_mac|base_a[4] u_m3_mac|base_a[3] u_m3_mac|base_a[2] u_m3_mac|base_a[1] u_m3_mac|base_a[0] -autobundled
netbloc @u_m3_mac|base_a 1 16 1 N
load netBundle @u_m3_mac|hi_lane 9 u_m3_mac|hi_lane[8] u_m3_mac|hi_lane[7] u_m3_mac|hi_lane[6] u_m3_mac|hi_lane[5] u_m3_mac|hi_lane[4] u_m3_mac|hi_lane[3] u_m3_mac|hi_lane[2] u_m3_mac|hi_lane[1] u_m3_mac|hi_lane[0] -autobundled
netbloc @u_m3_mac|hi_lane 1 6 1 7030
load netBundle @u_m4_kernel_storage|sweep_left 10 u_m4_kernel_storage|sweep_left_reg_n_0 u_m4_kernel_storage|sweep_left_reg_n_1 u_m4_kernel_storage|sweep_left_reg_n_2 u_m4_kernel_storage|sweep_left_reg_n_3 u_m4_kernel_storage|sweep_left_reg_n_4 u_m4_kernel_storage|sweep_left_reg_n_5 u_m4_kernel_storage|sweep_left_reg_n_6 u_m4_kernel_storage|sweep_left_reg_n_7 u_m4_kernel_storage|sweep_left_reg_n_8 u_m4_kernel_storage|p_0_in__0 -autobundled
netbloc @u_m4_kernel_storage|sweep_left 1 4 2 2720 1462 3000
load netBundle @u_m2_window_generator|row_ge_i_1 2 u_m2_window_generator|row_ge_i__0_n_0 u_m2_window_generator|row_ge_i__0_n_1 -autobundled
netbloc @u_m2_window_generator|row_ge_i_1 1 5 1 3920J
load netBundle @u_m2_window_generator|u_col|lf_1 6 u_m2_window_generator|u_col|lfsr_step2076_return1[5] u_m2_window_generator|u_col|lfsr_step2076_return1[4] u_m2_window_generator|u_col|lfsr_step2076_return1[3] u_m2_window_generator|u_col|lfsr_step2076_return1[2] u_m2_window_generator|u_col|lfsr_step2076_return1[1] u_m2_window_generator|u_col|lfsr_step2076_return1[0] -autobundled
netbloc @u_m2_window_generator|u_col|lf_1 1 1 1 2430J
load netBundle @u_m1_line_buffer|line_buf1_reg_69 8 u_m1_line_buffer|line_buf1_reg[1]__0[7] u_m1_line_buffer|line_buf1_reg[1]__0[6] u_m1_line_buffer|line_buf1_reg[1]__0[5] u_m1_line_buffer|line_buf1_reg[1]__0[4] u_m1_line_buffer|line_buf1_reg[1]__0[3] u_m1_line_buffer|line_buf1_reg[1]__0[2] u_m1_line_buffer|line_buf1_reg[1]__0[1] u_m1_line_buffer|line_buf1_reg[1]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_91 8 u_m1_line_buffer|line_buf1_reg[9]__0[7] u_m1_line_buffer|line_buf1_reg[9]__0[6] u_m1_line_buffer|line_buf1_reg[9]__0[5] u_m1_line_buffer|line_buf1_reg[9]__0[4] u_m1_line_buffer|line_buf1_reg[9]__0[3] u_m1_line_buffer|line_buf1_reg[9]__0[2] u_m1_line_buffer|line_buf1_reg[9]__0[1] u_m1_line_buffer|line_buf1_reg[9]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_18 8 u_m1_line_buffer|line_buf1_reg[18]__0[7] u_m1_line_buffer|line_buf1_reg[18]__0[6] u_m1_line_buffer|line_buf1_reg[18]__0[5] u_m1_line_buffer|line_buf1_reg[18]__0[4] u_m1_line_buffer|line_buf1_reg[18]__0[3] u_m1_line_buffer|line_buf1_reg[18]__0[2] u_m1_line_buffer|line_buf1_reg[18]__0[1] u_m1_line_buffer|line_buf1_reg[18]__0[0] -autobundled
load netBundle @u_m3_mac|base_b 18 u_m3_mac|base_b[17] u_m3_mac|base_b[16] u_m3_mac|base_b[15] u_m3_mac|base_b[14] u_m3_mac|base_b[13] u_m3_mac|base_b[12] u_m3_mac|base_b[11] u_m3_mac|base_b[10] u_m3_mac|base_b[9] u_m3_mac|base_b[8] u_m3_mac|base_b[7] u_m3_mac|base_b[6] u_m3_mac|base_b[5] u_m3_mac|base_b[4] u_m3_mac|base_b[3] u_m3_mac|base_b[2] u_m3_mac|base_b[1] u_m3_mac|base_b[0] -autobundled
netbloc @u_m3_mac|base_b 1 17 1 10670
load netBundle @u_m3_mac|insph_s0_i_n_0 3 u_m3_mac|insph_s0_i_n_0 u_m3_mac|insph_s0_i_n_1 u_m3_mac|insph_s0_i_n_2 -autobundled
netbloc @u_m3_mac|insph_s0_i_n_0 1 4 1 6410J
load netBundle @u_m3_mac|acc_r0 20 u_m3_mac|acc_r0[19] u_m3_mac|acc_r0[18] u_m3_mac|acc_r0[17] u_m3_mac|acc_r0[16] u_m3_mac|acc_r0[15] u_m3_mac|acc_r0[14] u_m3_mac|acc_r0[13] u_m3_mac|acc_r0[12] u_m3_mac|acc_r0[11] u_m3_mac|acc_r0[10] u_m3_mac|acc_r0[9] u_m3_mac|acc_r0[8] u_m3_mac|acc_r0[7] u_m3_mac|acc_r0[6] u_m3_mac|acc_r0[5] u_m3_mac|acc_r0[4] u_m3_mac|acc_r0[3] u_m3_mac|acc_r0[2] u_m3_mac|acc_r0[1] u_m3_mac|acc_r0[0] -autobundled
netbloc @u_m3_mac|acc_r0 1 26 1 N
load netBundle @u_m1_line_buffer|line_buf2_reg_15 8 u_m1_line_buffer|line_buf2_reg[30]__0[7] u_m1_line_buffer|line_buf2_reg[30]__0[6] u_m1_line_buffer|line_buf2_reg[30]__0[5] u_m1_line_buffer|line_buf2_reg[30]__0[4] u_m1_line_buffer|line_buf2_reg[30]__0[3] u_m1_line_buffer|line_buf2_reg[30]__0[2] u_m1_line_buffer|line_buf2_reg[30]__0[1] u_m1_line_buffer|line_buf2_reg[30]__0[0] -autobundled
load netBundle @u_m3_mac|base_c 18 u_m3_mac|base_c[17] u_m3_mac|base_c[16] u_m3_mac|base_c[15] u_m3_mac|base_c[14] u_m3_mac|base_c[13] u_m3_mac|base_c[12] u_m3_mac|base_c[11] u_m3_mac|base_c[10] u_m3_mac|base_c[9] u_m3_mac|base_c[8] u_m3_mac|base_c[7] u_m3_mac|base_c[6] u_m3_mac|base_c[5] u_m3_mac|base_c[4] u_m3_mac|base_c[3] u_m3_mac|base_c[2] u_m3_mac|base_c[1] u_m3_mac|base_c[0] -autobundled
netbloc @u_m3_mac|base_c 1 19 1 N
load netBundle @prev_row2_pixel 8 prev_row2_pixel[7] prev_row2_pixel[6] prev_row2_pixel[5] prev_row2_pixel[4] prev_row2_pixel[3] prev_row2_pixel[2] prev_row2_pixel[1] prev_row2_pixel[0] -autobundled
netbloc @prev_row2_pixel 1 3 2 1340J 122 5080
load netBundle @u_m1_line_buffer|line_buf1_reg_93 8 u_m1_line_buffer|line_buf1_reg[6]__0[7] u_m1_line_buffer|line_buf1_reg[6]__0[6] u_m1_line_buffer|line_buf1_reg[6]__0[5] u_m1_line_buffer|line_buf1_reg[6]__0[4] u_m1_line_buffer|line_buf1_reg[6]__0[3] u_m1_line_buffer|line_buf1_reg[6]__0[2] u_m1_line_buffer|line_buf1_reg[6]__0[1] u_m1_line_buffer|line_buf1_reg[6]__0[0] -autobundled
load netBundle @u_m3_mac|tap_idx 4 u_m3_mac|tap_idx[3] u_m3_mac|tap_idx[2] u_m3_mac|tap_idx[1] u_m3_mac|tap_idx[0] -autobundled
netbloc @u_m3_mac|tap_idx 1 0 2 5280 788 NJ
load netBundle @prev_row1_pixel 8 prev_row1_pixel[7] prev_row1_pixel[6] prev_row1_pixel[5] prev_row1_pixel[4] prev_row1_pixel[3] prev_row1_pixel[2] prev_row1_pixel[1] prev_row1_pixel[0] -autobundled
netbloc @prev_row1_pixel 1 3 2 1320J 102 5100
load netBundle @u_m1_line_buffer|line_buf2_reg_17 8 u_m1_line_buffer|line_buf2_reg[0]__0[7] u_m1_line_buffer|line_buf2_reg[0]__0[6] u_m1_line_buffer|line_buf2_reg[0]__0[5] u_m1_line_buffer|line_buf2_reg[0]__0[4] u_m1_line_buffer|line_buf2_reg[0]__0[3] u_m1_line_buffer|line_buf2_reg[0]__0[2] u_m1_line_buffer|line_buf2_reg[0]__0[1] u_m1_line_buffer|line_buf2_reg[0]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_1 8 u_m1_line_buffer|line_buf2_reg[20]__0[7] u_m1_line_buffer|line_buf2_reg[20]__0[6] u_m1_line_buffer|line_buf2_reg[20]__0[5] u_m1_line_buffer|line_buf2_reg[20]__0[4] u_m1_line_buffer|line_buf2_reg[20]__0[3] u_m1_line_buffer|line_buf2_reg[20]__0[2] u_m1_line_buffer|line_buf2_reg[20]__0[1] u_m1_line_buffer|line_buf2_reg[20]__0[0] -autobundled
netbloc @u_m1_line_buffer|line_buf2_reg_1 1 8 1 2880
load netBundle @u_m3_mac|u_dsp|p0 34 u_m3_mac|u_dsp|p0[33] u_m3_mac|u_dsp|p0[32] u_m3_mac|u_dsp|p0[31] u_m3_mac|u_dsp|p0[30] u_m3_mac|u_dsp|p0[29] u_m3_mac|u_dsp|p0[28] u_m3_mac|u_dsp|p0[27] u_m3_mac|u_dsp|p0[26] u_m3_mac|u_dsp|p0[25] u_m3_mac|u_dsp|p0[24] u_m3_mac|u_dsp|p0[23] u_m3_mac|u_dsp|p0[22] u_m3_mac|u_dsp|p0[21] u_m3_mac|u_dsp|p0[20] u_m3_mac|u_dsp|p0[19] u_m3_mac|u_dsp|p0[18] u_m3_mac|u_dsp|p0[17] u_m3_mac|u_dsp|p0[16] u_m3_mac|u_dsp|p0[15] u_m3_mac|u_dsp|p0[14] u_m3_mac|u_dsp|p0[13] u_m3_mac|u_dsp|p0[12] u_m3_mac|u_dsp|p0[11] u_m3_mac|u_dsp|p0[10] u_m3_mac|u_dsp|p0[9] u_m3_mac|u_dsp|p0[8] u_m3_mac|u_dsp|p0[7] u_m3_mac|u_dsp|p0[6] u_m3_mac|u_dsp|p0[5] u_m3_mac|u_dsp|p0[4] u_m3_mac|u_dsp|p0[3] u_m3_mac|u_dsp|p0[2] u_m3_mac|u_dsp|p0[1] u_m3_mac|u_dsp|p0[0] -autobundled
netbloc @u_m3_mac|u_dsp|p0 1 4 1 10110J
load netBundle @u_m1_line_buffer|line_buf2_reg_2 8 u_m1_line_buffer|line_buf2_reg[18]__0[7] u_m1_line_buffer|line_buf2_reg[18]__0[6] u_m1_line_buffer|line_buf2_reg[18]__0[5] u_m1_line_buffer|line_buf2_reg[18]__0[4] u_m1_line_buffer|line_buf2_reg[18]__0[3] u_m1_line_buffer|line_buf2_reg[18]__0[2] u_m1_line_buffer|line_buf2_reg[18]__0[1] u_m1_line_buffer|line_buf2_reg[18]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_18 8 u_m1_line_buffer|line_buf2_reg[19]__0[7] u_m1_line_buffer|line_buf2_reg[19]__0[6] u_m1_line_buffer|line_buf2_reg[19]__0[5] u_m1_line_buffer|line_buf2_reg[19]__0[4] u_m1_line_buffer|line_buf2_reg[19]__0[3] u_m1_line_buffer|line_buf2_reg[19]__0[2] u_m1_line_buffer|line_buf2_reg[19]__0[1] u_m1_line_buffer|line_buf2_reg[19]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg 8 u_m1_line_buffer|line_buf2_reg[13]__0[7] u_m1_line_buffer|line_buf2_reg[13]__0[6] u_m1_line_buffer|line_buf2_reg[13]__0[5] u_m1_line_buffer|line_buf2_reg[13]__0[4] u_m1_line_buffer|line_buf2_reg[13]__0[3] u_m1_line_buffer|line_buf2_reg[13]__0[2] u_m1_line_buffer|line_buf2_reg[13]__0[1] u_m1_line_buffer|line_buf2_reg[13]__0[0] -autobundled
netbloc @u_m1_line_buffer|line_buf2_reg 1 28 1 7680
load netBundle @u_m3_mac|u_dsp|m_r 34 u_m3_mac|u_dsp|m_r[33] u_m3_mac|u_dsp|m_r[32] u_m3_mac|u_dsp|m_r[31] u_m3_mac|u_dsp|m_r[30] u_m3_mac|u_dsp|m_r[29] u_m3_mac|u_dsp|m_r[28] u_m3_mac|u_dsp|m_r[27] u_m3_mac|u_dsp|m_r[26] u_m3_mac|u_dsp|m_r[25] u_m3_mac|u_dsp|m_r[24] u_m3_mac|u_dsp|m_r[23] u_m3_mac|u_dsp|m_r[22] u_m3_mac|u_dsp|m_r[21] u_m3_mac|u_dsp|m_r[20] u_m3_mac|u_dsp|m_r[19] u_m3_mac|u_dsp|m_r[18] u_m3_mac|u_dsp|m_r[17] u_m3_mac|u_dsp|m_r[16] u_m3_mac|u_dsp|m_r[15] u_m3_mac|u_dsp|m_r[14] u_m3_mac|u_dsp|m_r[13] u_m3_mac|u_dsp|m_r[12] u_m3_mac|u_dsp|m_r[11] u_m3_mac|u_dsp|m_r[10] u_m3_mac|u_dsp|m_r[9] u_m3_mac|u_dsp|m_r[8] u_m3_mac|u_dsp|m_r[7] u_m3_mac|u_dsp|m_r[6] u_m3_mac|u_dsp|m_r[5] u_m3_mac|u_dsp|m_r[4] u_m3_mac|u_dsp|m_r[3] u_m3_mac|u_dsp|m_r[2] u_m3_mac|u_dsp|m_r[1] u_m3_mac|u_dsp|m_r[0] -autobundled
netbloc @u_m3_mac|u_dsp|m_r 1 3 1 N
load netBundle @u_m1_line_buffer|line_buf1_reg_45 8 u_m1_line_buffer|line_buf1_reg[11]__0[7] u_m1_line_buffer|line_buf1_reg[11]__0[6] u_m1_line_buffer|line_buf1_reg[11]__0[5] u_m1_line_buffer|line_buf1_reg[11]__0[4] u_m1_line_buffer|line_buf1_reg[11]__0[3] u_m1_line_buffer|line_buf1_reg[11]__0[2] u_m1_line_buffer|line_buf1_reg[11]__0[1] u_m1_line_buffer|line_buf1_reg[11]__0[0] -autobundled
load netBundle @u_m6_control_fsm|drain_sr_reg_ 7 u_m6_control_fsm|drain_done u_m6_control_fsm|drain_sr_reg_n_1 u_m6_control_fsm|drain_sr_reg_n_2 u_m6_control_fsm|drain_sr_reg_n_3 u_m6_control_fsm|drain_sr_reg_n_4 u_m6_control_fsm|drain_sr_reg_n_5 u_m6_control_fsm|drain_sr_reg_n_6 -autobundled
netbloc @u_m6_control_fsm|drain_sr_reg_ 1 3 2 19220 548 19530
load netBundle @u_m1_line_buffer|line_buf2_reg_19 8 u_m1_line_buffer|line_buf2_reg[1]__0[7] u_m1_line_buffer|line_buf2_reg[1]__0[6] u_m1_line_buffer|line_buf2_reg[1]__0[5] u_m1_line_buffer|line_buf2_reg[1]__0[4] u_m1_line_buffer|line_buf2_reg[1]__0[3] u_m1_line_buffer|line_buf2_reg[1]__0[2] u_m1_line_buffer|line_buf2_reg[1]__0[1] u_m1_line_buffer|line_buf2_reg[1]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_41 8 u_m1_line_buffer|line_buf2_reg[9]__0[7] u_m1_line_buffer|line_buf2_reg[9]__0[6] u_m1_line_buffer|line_buf2_reg[9]__0[5] u_m1_line_buffer|line_buf2_reg[9]__0[4] u_m1_line_buffer|line_buf2_reg[9]__0[3] u_m1_line_buffer|line_buf2_reg[9]__0[2] u_m1_line_buffer|line_buf2_reg[9]__0[1] u_m1_line_buffer|line_buf2_reg[9]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_43 8 u_m1_line_buffer|line_buf2_reg[7]__0[7] u_m1_line_buffer|line_buf2_reg[7]__0[6] u_m1_line_buffer|line_buf2_reg[7]__0[5] u_m1_line_buffer|line_buf2_reg[7]__0[4] u_m1_line_buffer|line_buf2_reg[7]__0[3] u_m1_line_buffer|line_buf2_reg[7]__0[2] u_m1_line_buffer|line_buf2_reg[7]__0[1] u_m1_line_buffer|line_buf2_reg[7]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_95 8 u_m1_line_buffer|line_buf2_reg[27]__0[7] u_m1_line_buffer|line_buf2_reg[27]__0[6] u_m1_line_buffer|line_buf2_reg[27]__0[5] u_m1_line_buffer|line_buf2_reg[27]__0[4] u_m1_line_buffer|line_buf2_reg[27]__0[3] u_m1_line_buffer|line_buf2_reg[27]__0[2] u_m1_line_buffer|line_buf2_reg[27]__0[1] u_m1_line_buffer|line_buf2_reg[27]__0[0] -autobundled
load netBundle @u_m3_mac|q_f0 8 u_m3_mac|q_f0[7] u_m3_mac|q_f0[6] u_m3_mac|q_f0[5] u_m3_mac|q_f0[4] u_m3_mac|q_f0[3] u_m3_mac|q_f0[2] u_m3_mac|q_f0[1] u_m3_mac|q_f0[0] -autobundled
netbloc @u_m3_mac|q_f0 1 14 1 8640
load netBundle @u_m3_mac|t_col 2 u_m3_mac|t_col[1] u_m3_mac|t_col[0] -autobundled
netbloc @u_m3_mac|t_col 1 1 4 5510 888 5800J 898 6090 858 6390J
load netBundle @u_m4_kernel_storage|kernel_wr_ 4 u_m4_kernel_storage|kernel_wr_addr[3] u_m4_kernel_storage|kernel_wr_addr[2] u_m4_kernel_storage|kernel_wr_addr[1] u_m4_kernel_storage|kernel_wr_addr[0] -autobundled
netbloc @u_m4_kernel_storage|kernel_wr_ 1 0 9 1590J 1182 NJ 1182 NJ 1182 NJ 1182 NJ 1182 NJ 1182 NJ 1182 NJ 1182 3790J
load netBundle @u_m1_line_buffer|line_buf1_reg_71 8 u_m1_line_buffer|line_buf1_reg[12]__0[7] u_m1_line_buffer|line_buf1_reg[12]__0[6] u_m1_line_buffer|line_buf1_reg[12]__0[5] u_m1_line_buffer|line_buf1_reg[12]__0[4] u_m1_line_buffer|line_buf1_reg[12]__0[3] u_m1_line_buffer|line_buf1_reg[12]__0[2] u_m1_line_buffer|line_buf1_reg[12]__0[1] u_m1_line_buffer|line_buf1_reg[12]__0[0] -autobundled
load netBundle @u_m3_mac|tap_data 8 u_m3_mac|tap_data[7] u_m3_mac|tap_data[6] u_m3_mac|tap_data[5] u_m3_mac|tap_data[4] u_m3_mac|tap_data[3] u_m3_mac|tap_data[2] u_m3_mac|tap_data[1] u_m3_mac|tap_data[0] -autobundled
netbloc @u_m3_mac|tap_data 1 0 7 NJ 748 NJ 748 NJ 748 6050 708 NJ 708 6740 848 7050J
load netBundle @u_m3_mac|q_f1 8 u_m3_mac|q_f1[7] u_m3_mac|q_f1[6] u_m3_mac|q_f1[5] u_m3_mac|q_f1[4] u_m3_mac|q_f1[3] u_m3_mac|q_f1[2] u_m3_mac|q_f1[1] u_m3_mac|q_f1[0] -autobundled
netbloc @u_m3_mac|q_f1 1 14 1 8640
load netBundle @u_m3_mac|t1 18 u_m3_mac|t1[17] u_m3_mac|t1[16] u_m3_mac|t1[15] u_m3_mac|t1[14] u_m3_mac|t1[13] u_m3_mac|t1[12] u_m3_mac|t1[11] u_m3_mac|t1[10] u_m3_mac|t1[9] u_m3_mac|t1[8] u_m3_mac|t1[7] u_m3_mac|t1[6] u_m3_mac|t1[5] u_m3_mac|t1[4] u_m3_mac|t1[3] u_m3_mac|t1[2] u_m3_mac|t1[1] u_m3_mac|t1[0] -autobundled
netbloc @u_m3_mac|t1 1 23 1 12250
load netBundle @u_m3_mac|u_dsp|a_r 25 u_m3_mac|u_dsp|a_r[24] u_m3_mac|u_dsp|a_r[23] u_m3_mac|u_dsp|a_r[22] u_m3_mac|u_dsp|a_r[21] u_m3_mac|u_dsp|a_r[20] u_m3_mac|u_dsp|a_r[19] u_m3_mac|u_dsp|a_r[18] u_m3_mac|u_dsp|a_r[17] u_m3_mac|u_dsp|a_r[16] u_m3_mac|u_dsp|a_r[15] u_m3_mac|u_dsp|a_r[14] u_m3_mac|u_dsp|a_r[13] u_m3_mac|u_dsp|a_r[12] u_m3_mac|u_dsp|a_r[11] u_m3_mac|u_dsp|a_r[10] u_m3_mac|u_dsp|a_r[9] u_m3_mac|u_dsp|a_r[8] u_m3_mac|u_dsp|a_r[7] u_m3_mac|u_dsp|a_r[6] u_m3_mac|u_dsp|a_r[5] u_m3_mac|u_dsp|a_r[4] u_m3_mac|u_dsp|a_r[3] u_m3_mac|u_dsp|a_r[2] u_m3_mac|u_dsp|a_r[1] u_m3_mac|u_dsp|a_r[0] -autobundled
netbloc @u_m3_mac|u_dsp|a_r 1 1 1 9440
load netBundle @u_m3_mac|u_dsp|m_r0 34 u_m3_mac|u_dsp|m_r0[33] u_m3_mac|u_dsp|m_r0[32] u_m3_mac|u_dsp|m_r0[31] u_m3_mac|u_dsp|m_r0[30] u_m3_mac|u_dsp|m_r0[29] u_m3_mac|u_dsp|m_r0[28] u_m3_mac|u_dsp|m_r0[27] u_m3_mac|u_dsp|m_r0[26] u_m3_mac|u_dsp|m_r0[25] u_m3_mac|u_dsp|m_r0[24] u_m3_mac|u_dsp|m_r0[23] u_m3_mac|u_dsp|m_r0[22] u_m3_mac|u_dsp|m_r0[21] u_m3_mac|u_dsp|m_r0[20] u_m3_mac|u_dsp|m_r0[19] u_m3_mac|u_dsp|m_r0[18] u_m3_mac|u_dsp|m_r0[17] u_m3_mac|u_dsp|m_r0[16] u_m3_mac|u_dsp|m_r0[15] u_m3_mac|u_dsp|m_r0[14] u_m3_mac|u_dsp|m_r0[13] u_m3_mac|u_dsp|m_r0[12] u_m3_mac|u_dsp|m_r0[11] u_m3_mac|u_dsp|m_r0[10] u_m3_mac|u_dsp|m_r0[9] u_m3_mac|u_dsp|m_r0[8] u_m3_mac|u_dsp|m_r0[7] u_m3_mac|u_dsp|m_r0[6] u_m3_mac|u_dsp|m_r0[5] u_m3_mac|u_dsp|m_r0[4] u_m3_mac|u_dsp|m_r0[3] u_m3_mac|u_dsp|m_r0[2] u_m3_mac|u_dsp|m_r0[1] u_m3_mac|u_dsp|m_r0[0] -autobundled
netbloc @u_m3_mac|u_dsp|m_r0 1 2 1 N
load netBundle @u_m7_fifo|output_pixel 16 u_m7_fifo|output_pixel[15] u_m7_fifo|output_pixel[14] u_m7_fifo|output_pixel[13] u_m7_fifo|output_pixel[12] u_m7_fifo|output_pixel[11] u_m7_fifo|output_pixel[10] u_m7_fifo|output_pixel[9] u_m7_fifo|output_pixel[8] u_m7_fifo|output_pixel[7] u_m7_fifo|output_pixel[6] u_m7_fifo|output_pixel[5] u_m7_fifo|output_pixel[4] u_m7_fifo|output_pixel[3] u_m7_fifo|output_pixel[2] u_m7_fifo|output_pixel[1] u_m7_fifo|output_pixel[0] -autobundled
netbloc @u_m7_fifo|output_pixel 1 10 1 17860
load netBundle @u_m1_line_buffer|line_buf1_reg_21 8 u_m1_line_buffer|line_buf1_reg[30]__0[7] u_m1_line_buffer|line_buf1_reg[30]__0[6] u_m1_line_buffer|line_buf1_reg[30]__0[5] u_m1_line_buffer|line_buf1_reg[30]__0[4] u_m1_line_buffer|line_buf1_reg[30]__0[3] u_m1_line_buffer|line_buf1_reg[30]__0[2] u_m1_line_buffer|line_buf1_reg[30]__0[1] u_m1_line_buffer|line_buf1_reg[30]__0[0] -autobundled
load netBundle @u_m3_mac|t2 19 u_m3_mac|t2[18] u_m3_mac|t2[17] u_m3_mac|t2[16] u_m3_mac|t2[15] u_m3_mac|t2[14] u_m3_mac|t2[13] u_m3_mac|t2[12] u_m3_mac|t2[11] u_m3_mac|t2[10] u_m3_mac|t2[9] u_m3_mac|t2[8] u_m3_mac|t2[7] u_m3_mac|t2[6] u_m3_mac|t2[5] u_m3_mac|t2[4] u_m3_mac|t2[3] u_m3_mac|t2[2] u_m3_mac|t2[1] u_m3_mac|t2[0] -autobundled
netbloc @u_m3_mac|t2 1 25 1 12710
load netBundle @u_m3_mac|q_f2 8 u_m3_mac|q_f2[7] u_m3_mac|q_f2[6] u_m3_mac|q_f2[5] u_m3_mac|q_f2[4] u_m3_mac|q_f2[3] u_m3_mac|q_f2[2] u_m3_mac|q_f2[1] u_m3_mac|q_f2[0] -autobundled
netbloc @u_m3_mac|q_f2 1 14 1 8660
load netBundle @u_m4_kernel_storage|tap_data 8 u_m4_kernel_storage|tap_data[7] u_m4_kernel_storage|tap_data[6] u_m4_kernel_storage|tap_data[5] u_m4_kernel_storage|tap_data[4] u_m4_kernel_storage|tap_data[3] u_m4_kernel_storage|tap_data[2] u_m4_kernel_storage|tap_data[1] u_m4_kernel_storage|tap_data[0] -autobundled
netbloc @u_m4_kernel_storage|tap_data 1 11 1 N
load netBundle @u_m1_line_buffer|pixel_in 8 u_m1_line_buffer|pixel_in[7] u_m1_line_buffer|pixel_in[6] u_m1_line_buffer|pixel_in[5] u_m1_line_buffer|pixel_in[4] u_m1_line_buffer|pixel_in[3] u_m1_line_buffer|pixel_in[2] u_m1_line_buffer|pixel_in[1] u_m1_line_buffer|pixel_in[0] -autobundled
netbloc @u_m1_line_buffer|pixel_in 1 0 33 960 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 NJ 228 8440J 208 NJ
load netBundle @u_m1_line_buffer|line_buf1_reg_73 8 u_m1_line_buffer|line_buf1_reg[27]__0[7] u_m1_line_buffer|line_buf1_reg[27]__0[6] u_m1_line_buffer|line_buf1_reg[27]__0[5] u_m1_line_buffer|line_buf1_reg[27]__0[4] u_m1_line_buffer|line_buf1_reg[27]__0[3] u_m1_line_buffer|line_buf1_reg[27]__0[2] u_m1_line_buffer|line_buf1_reg[27]__0[1] u_m1_line_buffer|line_buf1_reg[27]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_22 8 u_m1_line_buffer|line_buf1_reg[28]__0[7] u_m1_line_buffer|line_buf1_reg[28]__0[6] u_m1_line_buffer|line_buf1_reg[28]__0[5] u_m1_line_buffer|line_buf1_reg[28]__0[4] u_m1_line_buffer|line_buf1_reg[28]__0[3] u_m1_line_buffer|line_buf1_reg[28]__0[2] u_m1_line_buffer|line_buf1_reg[28]__0[1] u_m1_line_buffer|line_buf1_reg[28]__0[0] -autobundled
load netBundle @u_m3_mac|wv 6 u_m3_mac|mac_result_valid u_m3_mac|wv[5] u_m3_mac|wv[4] u_m3_mac|wv[3] u_m3_mac|wv[2] u_m3_mac|wv[1] -autobundled
netbloc @u_m3_mac|wv 1 26 2 12990 468 13180
load netBundle @u_m1_line_buffer|prev_row2_pix 8 u_m1_line_buffer|prev_row2_pixel[7] u_m1_line_buffer|prev_row2_pixel[6] u_m1_line_buffer|prev_row2_pixel[5] u_m1_line_buffer|prev_row2_pixel[4] u_m1_line_buffer|prev_row2_pixel[3] u_m1_line_buffer|prev_row2_pixel[2] u_m1_line_buffer|prev_row2_pixel[1] u_m1_line_buffer|prev_row2_pixel[0] -autobundled
netbloc @u_m1_line_buffer|prev_row2_pix 1 32 1 N
load netBundle @u_m1_line_buffer|line_buf2_reg_98 8 u_m1_line_buffer|line_buf2_reg[16]__0[7] u_m1_line_buffer|line_buf2_reg[16]__0[6] u_m1_line_buffer|line_buf2_reg[16]__0[5] u_m1_line_buffer|line_buf2_reg[16]__0[4] u_m1_line_buffer|line_buf2_reg[16]__0[3] u_m1_line_buffer|line_buf2_reg[16]__0[2] u_m1_line_buffer|line_buf2_reg[16]__0[1] u_m1_line_buffer|line_buf2_reg[16]__0[0] -autobundled
netbloc @u_m1_line_buffer|line_buf2_reg_98 1 7 1 2640
load netBundle @u_m1_line_buffer|line_buf2_reg_47 8 u_m1_line_buffer|line_buf2_reg[25]__0[7] u_m1_line_buffer|line_buf2_reg[25]__0[6] u_m1_line_buffer|line_buf2_reg[25]__0[5] u_m1_line_buffer|line_buf2_reg[25]__0[4] u_m1_line_buffer|line_buf2_reg[25]__0[3] u_m1_line_buffer|line_buf2_reg[25]__0[2] u_m1_line_buffer|line_buf2_reg[25]__0[1] u_m1_line_buffer|line_buf2_reg[25]__0[0] -autobundled
load netBundle @u_m3_mac|word_f 25 u_m3_mac|word_f[24] u_m3_mac|word_f[23] u_m3_mac|word_f[22] u_m3_mac|word_f[21] u_m3_mac|word_f[20] u_m3_mac|word_f[19] u_m3_mac|word_f[18] u_m3_mac|word_f[17] u_m3_mac|word_f[16] u_m3_mac|word_f[15] u_m3_mac|word_f[14] u_m3_mac|word_f[13] u_m3_mac|word_f[12] u_m3_mac|word_f[11] u_m3_mac|word_f[10] u_m3_mac|word_f[9] u_m3_mac|word_f[8] u_m3_mac|word_f[7] u_m3_mac|word_f[6] u_m3_mac|word_f[5] u_m3_mac|word_f[4] u_m3_mac|word_f[3] u_m3_mac|word_f[2] u_m3_mac|word_f[1] u_m3_mac|word_f[0] -autobundled
netbloc @u_m3_mac|word_f 1 8 1 N
load netBundle @u_m3_mac|s4_a 18 u_m3_mac|s4_a[17] u_m3_mac|s4_a[16] u_m3_mac|s4_a[15] u_m3_mac|s4_a[14] u_m3_mac|s4_a[13] u_m3_mac|s4_a[12] u_m3_mac|s4_a[11] u_m3_mac|s4_a[10] u_m3_mac|s4_a[9] u_m3_mac|s4_a[8] u_m3_mac|s4_a[7] u_m3_mac|s4_a[6] u_m3_mac|s4_a[5] u_m3_mac|s4_a[4] u_m3_mac|s4_a[3] u_m3_mac|s4_a[2] u_m3_mac|s4_a[1] u_m3_mac|s4_a[0] -autobundled
netbloc @u_m3_mac|s4_a 1 21 1 N
load netBundle @final_output 16 final_output[15] final_output[14] final_output[13] final_output[12] final_output[11] final_output[10] final_output[9] final_output[8] final_output[7] final_output[6] final_output[5] final_output[4] final_output[3] final_output[2] final_output[1] final_output[0] -autobundled
netbloc @final_output 1 6 1 14750
load netBundle @u_m1_line_buffer|line_buf2_reg_20 8 u_m1_line_buffer|line_buf2_reg[10]__0[7] u_m1_line_buffer|line_buf2_reg[10]__0[6] u_m1_line_buffer|line_buf2_reg[10]__0[5] u_m1_line_buffer|line_buf2_reg[10]__0[4] u_m1_line_buffer|line_buf2_reg[10]__0[3] u_m1_line_buffer|line_buf2_reg[10]__0[2] u_m1_line_buffer|line_buf2_reg[10]__0[1] u_m1_line_buffer|line_buf2_reg[10]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_25 8 u_m1_line_buffer|line_buf1_reg[24]__0[7] u_m1_line_buffer|line_buf1_reg[24]__0[6] u_m1_line_buffer|line_buf1_reg[24]__0[5] u_m1_line_buffer|line_buf1_reg[24]__0[4] u_m1_line_buffer|line_buf1_reg[24]__0[3] u_m1_line_buffer|line_buf1_reg[24]__0[2] u_m1_line_buffer|line_buf1_reg[24]__0[1] u_m1_line_buffer|line_buf1_reg[24]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_49 8 u_m1_line_buffer|line_buf2_reg[22]__0[7] u_m1_line_buffer|line_buf2_reg[22]__0[6] u_m1_line_buffer|line_buf2_reg[22]__0[5] u_m1_line_buffer|line_buf2_reg[22]__0[4] u_m1_line_buffer|line_buf2_reg[22]__0[3] u_m1_line_buffer|line_buf2_reg[22]__0[2] u_m1_line_buffer|line_buf2_reg[22]__0[1] u_m1_line_buffer|line_buf2_reg[22]__0[0] -autobundled
load netBundle @u_m3_mac|p_1_in 2 u_m3_mac|p_1_in[2] u_m3_mac|p_1_in[1] -autobundled
netbloc @u_m3_mac|p_1_in 1 2 1 5800
load netBundle @u_m3_mac|s4_b 18 u_m3_mac|s4_b[17] u_m3_mac|s4_b[16] u_m3_mac|s4_b[15] u_m3_mac|s4_b[14] u_m3_mac|s4_b[13] u_m3_mac|s4_b[12] u_m3_mac|s4_b[11] u_m3_mac|s4_b[10] u_m3_mac|s4_b[9] u_m3_mac|s4_b[8] u_m3_mac|s4_b[7] u_m3_mac|s4_b[6] u_m3_mac|s4_b[5] u_m3_mac|s4_b[4] u_m3_mac|s4_b[3] u_m3_mac|s4_b[2] u_m3_mac|s4_b[1] u_m3_mac|s4_b[0] -autobundled
netbloc @u_m3_mac|s4_b 1 22 1 12030
load netBundle @u_m3_mac|p_2_in 6 u_m3_mac|p_2_in u_m3_mac|ph_i_n_1 u_m3_mac|ph_i_n_2 u_m3_mac|ph_i_n_3 u_m3_mac|ph_i_n_4 u_m3_mac|ph_i_n_5 -autobundled
netbloc @u_m3_mac|p_2_in 1 15 5 9080 478 10350 388 NJ 388 10930 388 11350J
load netBundle @u_m3_mac|frame_a 18 u_m3_mac|frame_a[17] u_m3_mac|frame_a[16] u_m3_mac|frame_a[15] u_m3_mac|frame_a[14] u_m3_mac|frame_a[13] u_m3_mac|frame_a[12] u_m3_mac|frame_a[11] u_m3_mac|frame_a[10] u_m3_mac|frame_a[9] u_m3_mac|frame_a[8] u_m3_mac|frame_a[7] u_m3_mac|frame_a[6] u_m3_mac|frame_a[5] u_m3_mac|frame_a[4] u_m3_mac|frame_a[3] u_m3_mac|frame_a[2] u_m3_mac|frame_a[1] u_m3_mac|frame_a[0] -autobundled
netbloc @u_m3_mac|frame_a 1 19 1 11310
load netBundle @u_m3_mac|s4_c 18 u_m3_mac|s4_c[17] u_m3_mac|s4_c[16] u_m3_mac|s4_c[15] u_m3_mac|s4_c[14] u_m3_mac|s4_c[13] u_m3_mac|s4_c[12] u_m3_mac|s4_c[11] u_m3_mac|s4_c[10] u_m3_mac|s4_c[9] u_m3_mac|s4_c[8] u_m3_mac|s4_c[7] u_m3_mac|s4_c[6] u_m3_mac|s4_c[5] u_m3_mac|s4_c[4] u_m3_mac|s4_c[3] u_m3_mac|s4_c[2] u_m3_mac|s4_c[1] u_m3_mac|s4_c[0] -autobundled
netbloc @u_m3_mac|s4_c 1 24 1 N
load netBundle @u_m2_window_generator|row_ge_i 2 u_m2_window_generator|row_ge_i_n_0 u_m2_window_generator|row_ge_i_n_1 -autobundled
netbloc @u_m2_window_generator|row_ge_i 1 5 1 3880J
load netBundle @u_m1_line_buffer|line_buf1_reg_27 8 u_m1_line_buffer|line_buf1_reg[25]__0[7] u_m1_line_buffer|line_buf1_reg[25]__0[6] u_m1_line_buffer|line_buf1_reg[25]__0[5] u_m1_line_buffer|line_buf1_reg[25]__0[4] u_m1_line_buffer|line_buf1_reg[25]__0[3] u_m1_line_buffer|line_buf1_reg[25]__0[2] u_m1_line_buffer|line_buf1_reg[25]__0[1] u_m1_line_buffer|line_buf1_reg[25]__0[0] -autobundled
load netBundle @u_m6_control_fsm|pixel_req 3 u_m6_control_fsm|pixel_req u_m6_control_fsm|p_0_in u_m6_control_fsm|state_i_n_2 -autobundled
netbloc @u_m6_control_fsm|pixel_req 1 6 3 20230 818 20550 848 20760J
load netBundle @u_m3_mac|frame_b 18 u_m3_mac|frame_b[17] u_m3_mac|frame_b[16] u_m3_mac|frame_b[15] u_m3_mac|frame_b[14] u_m3_mac|frame_b[13] u_m3_mac|frame_b[12] u_m3_mac|frame_b[11] u_m3_mac|frame_b[10] u_m3_mac|frame_b[9] u_m3_mac|frame_b[8] u_m3_mac|frame_b[7] u_m3_mac|frame_b[6] u_m3_mac|frame_b[5] u_m3_mac|frame_b[4] u_m3_mac|frame_b[3] u_m3_mac|frame_b[2] u_m3_mac|frame_b[1] u_m3_mac|frame_b[0] -autobundled
netbloc @u_m3_mac|frame_b 1 20 1 11570
load netBundle @u_m3_mac|ph0 3 u_m3_mac|ph0[2] u_m3_mac|ph0[1] u_m3_mac|ph0[0] -autobundled
netbloc @u_m3_mac|ph0 1 5 1 N
load netBundle @kernel_wr_addr 4 kernel_wr_addr[3] kernel_wr_addr[2] kernel_wr_addr[1] kernel_wr_addr[0] -autobundled
netbloc @kernel_wr_addr 1 0 4 NJ 530 230J 688 760J 530 1200J
load netBundle @u_m2_window_generator|col_ge_i_1 2 u_m2_window_generator|col_ge_i_n_0 u_m2_window_generator|col_ge_i_n_1 -autobundled
netbloc @u_m2_window_generator|col_ge_i_1 1 6 1 4320
load netBundle @u_m1_line_buffer|line_buf2_reg_23 8 u_m1_line_buffer|line_buf2_reg[23]__0[7] u_m1_line_buffer|line_buf2_reg[23]__0[6] u_m1_line_buffer|line_buf2_reg[23]__0[5] u_m1_line_buffer|line_buf2_reg[23]__0[4] u_m1_line_buffer|line_buf2_reg[23]__0[3] u_m1_line_buffer|line_buf2_reg[23]__0[2] u_m1_line_buffer|line_buf2_reg[23]__0[1] u_m1_line_buffer|line_buf2_reg[23]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_79 8 u_m1_line_buffer|line_buf1_reg[13]__0[7] u_m1_line_buffer|line_buf1_reg[13]__0[6] u_m1_line_buffer|line_buf1_reg[13]__0[5] u_m1_line_buffer|line_buf1_reg[13]__0[4] u_m1_line_buffer|line_buf1_reg[13]__0[3] u_m1_line_buffer|line_buf1_reg[13]__0[2] u_m1_line_buffer|line_buf1_reg[13]__0[1] u_m1_line_buffer|line_buf1_reg[13]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf2_reg_24 8 u_m1_line_buffer|line_buf2_reg[6]__0[7] u_m1_line_buffer|line_buf2_reg[6]__0[6] u_m1_line_buffer|line_buf2_reg[6]__0[5] u_m1_line_buffer|line_buf2_reg[6]__0[4] u_m1_line_buffer|line_buf2_reg[6]__0[3] u_m1_line_buffer|line_buf2_reg[6]__0[2] u_m1_line_buffer|line_buf2_reg[6]__0[1] u_m1_line_buffer|line_buf2_reg[6]__0[0] -autobundled
load netBundle @u_m3_mac|ph1 3 u_m3_mac|ph1[2] u_m3_mac|ph1[1] u_m3_mac|ph1[0] -autobundled
netbloc @u_m3_mac|ph1 1 4 1 NJ
load netBundle @u_m3_mac|frame_c 18 u_m3_mac|frame_c[17] u_m3_mac|frame_c[16] u_m3_mac|frame_c[15] u_m3_mac|frame_c[14] u_m3_mac|frame_c[13] u_m3_mac|frame_c[12] u_m3_mac|frame_c[11] u_m3_mac|frame_c[10] u_m3_mac|frame_c[9] u_m3_mac|frame_c[8] u_m3_mac|frame_c[7] u_m3_mac|frame_c[6] u_m3_mac|frame_c[5] u_m3_mac|frame_c[4] u_m3_mac|frame_c[3] u_m3_mac|frame_c[2] u_m3_mac|frame_c[1] u_m3_mac|frame_c[0] -autobundled
netbloc @u_m3_mac|frame_c 1 22 1 12050
load netBundle @u_m4_kernel_storage|tap_idx 4 u_m4_kernel_storage|tap_idx[3] u_m4_kernel_storage|tap_idx[2] u_m4_kernel_storage|tap_idx[1] u_m4_kernel_storage|tap_idx[0] -autobundled
netbloc @u_m4_kernel_storage|tap_idx 1 11 1 N
load netBundle @u_m4_kernel_storage|rd_tap0 4 u_m4_kernel_storage|rd_tap0[3] u_m4_kernel_storage|rd_tap0[2] u_m4_kernel_storage|rd_tap0[1] u_m4_kernel_storage|rd_tap0[0] -autobundled
netbloc @u_m4_kernel_storage|rd_tap0 1 7 1 N
load netBundle @u_m2_window_generator|p_0_in 2 u_m2_window_generator|p_0_in u_m2_window_generator|row_ge_reg_n_1 -autobundled
netbloc @u_m2_window_generator|p_0_in 1 5 2 3920 532 4280
load netBundle @u_m1_line_buffer|line_buf1_reg_100 8 u_m1_line_buffer|line_buf1_reg[10]__0[7] u_m1_line_buffer|line_buf1_reg[10]__0[6] u_m1_line_buffer|line_buf1_reg[10]__0[5] u_m1_line_buffer|line_buf1_reg[10]__0[4] u_m1_line_buffer|line_buf1_reg[10]__0[3] u_m1_line_buffer|line_buf1_reg[10]__0[2] u_m1_line_buffer|line_buf1_reg[10]__0[1] u_m1_line_buffer|line_buf1_reg[10]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_51 8 u_m1_line_buffer|line_buf1_reg[14]__0[7] u_m1_line_buffer|line_buf1_reg[14]__0[6] u_m1_line_buffer|line_buf1_reg[14]__0[5] u_m1_line_buffer|line_buf1_reg[14]__0[4] u_m1_line_buffer|line_buf1_reg[14]__0[3] u_m1_line_buffer|line_buf1_reg[14]__0[2] u_m1_line_buffer|line_buf1_reg[14]__0[1] u_m1_line_buffer|line_buf1_reg[14]__0[0] -autobundled
load netBundle @u_m3_mac|prev_c0 8 u_m3_mac|prev_c0[7] u_m3_mac|prev_c0[6] u_m3_mac|prev_c0[5] u_m3_mac|prev_c0[4] u_m3_mac|prev_c0[3] u_m3_mac|prev_c0[2] u_m3_mac|prev_c0[1] u_m3_mac|prev_c0[0] -autobundled
netbloc @u_m3_mac|prev_c0 1 4 1 N
load netBundle @u_m4_kernel_storage|rd_tap1 4 u_m4_kernel_storage|rd_tap1[3] u_m4_kernel_storage|rd_tap1[2] u_m4_kernel_storage|rd_tap1[1] u_m4_kernel_storage|rd_tap1[0] -autobundled
netbloc @u_m4_kernel_storage|rd_tap1 1 6 1 NJ
load netBundle @u_m5_output_handling|out_val 17 u_m5_output_handling|is_neg u_m5_output_handling|out_val[15] u_m5_output_handling|out_val[14] u_m5_output_handling|out_val[13] u_m5_output_handling|out_val[12] u_m5_output_handling|out_val[11] u_m5_output_handling|out_val[10] u_m5_output_handling|out_val[9] u_m5_output_handling|out_val[8] u_m5_output_handling|out_val[7] u_m5_output_handling|out_val[6] u_m5_output_handling|out_val[5] u_m5_output_handling|out_val[4] u_m5_output_handling|out_val[3] u_m5_output_handling|out_val[2] u_m5_output_handling|out_val[1] u_m5_output_handling|out_val[0] -autobundled
netbloc @u_m5_output_handling|out_val 1 1 2 13860 374 14170
load netBundle @u_m1_line_buffer|line_buf2_reg_77 8 u_m1_line_buffer|line_buf2_reg[21]__0[7] u_m1_line_buffer|line_buf2_reg[21]__0[6] u_m1_line_buffer|line_buf2_reg[21]__0[5] u_m1_line_buffer|line_buf2_reg[21]__0[4] u_m1_line_buffer|line_buf2_reg[21]__0[3] u_m1_line_buffer|line_buf2_reg[21]__0[2] u_m1_line_buffer|line_buf2_reg[21]__0[1] u_m1_line_buffer|line_buf2_reg[21]__0[0] -autobundled
load netBundle @u_m3_mac|insph_f 3 u_m3_mac|insph_f[2] u_m3_mac|insph_f[1] u_m3_mac|insph_f[0] -autobundled
netbloc @u_m3_mac|insph_f 1 6 1 N
load netBundle @u_m3_mac|sum_c0 18 u_m3_mac|sum_c0[17] u_m3_mac|sum_c0[16] u_m3_mac|sum_c0[15] u_m3_mac|sum_c0[14] u_m3_mac|sum_c0[13] u_m3_mac|sum_c0[12] u_m3_mac|sum_c0[11] u_m3_mac|sum_c0[10] u_m3_mac|sum_c0[9] u_m3_mac|sum_c0[8] u_m3_mac|sum_c0[7] u_m3_mac|sum_c0[6] u_m3_mac|sum_c0[5] u_m3_mac|sum_c0[4] u_m3_mac|sum_c0[3] u_m3_mac|sum_c0[2] u_m3_mac|sum_c0[1] u_m3_mac|sum_c0[0] -autobundled
netbloc @u_m3_mac|sum_c0 1 22 1 12030
load netBundle @u_m3_mac|mac_result 20 u_m3_mac|mac_result[19] u_m3_mac|mac_result[18] u_m3_mac|mac_result[17] u_m3_mac|mac_result[16] u_m3_mac|mac_result[15] u_m3_mac|mac_result[14] u_m3_mac|mac_result[13] u_m3_mac|mac_result[12] u_m3_mac|mac_result[11] u_m3_mac|mac_result[10] u_m3_mac|mac_result[9] u_m3_mac|mac_result[8] u_m3_mac|mac_result[7] u_m3_mac|mac_result[6] u_m3_mac|mac_result[5] u_m3_mac|mac_result[4] u_m3_mac|mac_result[3] u_m3_mac|mac_result[2] u_m3_mac|mac_result[1] u_m3_mac|mac_result[0] -autobundled
netbloc @u_m3_mac|mac_result 1 27 1 N
load netBundle @u_m7_fifo|wr_ptr 6 u_m7_fifo|wr_ptr[5] u_m7_fifo|wr_ptr[4] u_m7_fifo|wr_ptr[3] u_m7_fifo|wr_ptr[2] u_m7_fifo|wr_ptr[1] u_m7_fifo|wr_ptr[0] -autobundled
netbloc @u_m7_fifo|wr_ptr 1 1 8 15100 278 NJ 278 15650 588 NJ 588 16280 588 NJ 588 NJ 588 NJ
load netBundle @u_m1_line_buffer|line_buf2_reg_29 8 u_m1_line_buffer|line_buf2_reg[24]__0[7] u_m1_line_buffer|line_buf2_reg[24]__0[6] u_m1_line_buffer|line_buf2_reg[24]__0[5] u_m1_line_buffer|line_buf2_reg[24]__0[4] u_m1_line_buffer|line_buf2_reg[24]__0[3] u_m1_line_buffer|line_buf2_reg[24]__0[2] u_m1_line_buffer|line_buf2_reg[24]__0[1] u_m1_line_buffer|line_buf2_reg[24]__0[0] -autobundled
load netBundle @u_m3_mac|sum_c1 18 u_m3_mac|sum_c1[17] u_m3_mac|sum_c1[16] u_m3_mac|sum_c1[15] u_m3_mac|sum_c1[14] u_m3_mac|sum_c1[13] u_m3_mac|sum_c1[12] u_m3_mac|sum_c1[11] u_m3_mac|sum_c1[10] u_m3_mac|sum_c1[9] u_m3_mac|sum_c1[8] u_m3_mac|sum_c1[7] u_m3_mac|sum_c1[6] u_m3_mac|sum_c1[5] u_m3_mac|sum_c1[4] u_m3_mac|sum_c1[3] u_m3_mac|sum_c1[2] u_m3_mac|sum_c1[1] u_m3_mac|sum_c1[0] -autobundled
netbloc @u_m3_mac|sum_c1 1 23 1 N
load netBundle @u_m3_mac|sum_c2 18 u_m3_mac|sum_c2[17] u_m3_mac|sum_c2[16] u_m3_mac|sum_c2[15] u_m3_mac|sum_c2[14] u_m3_mac|sum_c2[13] u_m3_mac|sum_c2[12] u_m3_mac|sum_c2[11] u_m3_mac|sum_c2[10] u_m3_mac|sum_c2[9] u_m3_mac|sum_c2[8] u_m3_mac|sum_c2[7] u_m3_mac|sum_c2[6] u_m3_mac|sum_c2[5] u_m3_mac|sum_c2[4] u_m3_mac|sum_c2[3] u_m3_mac|sum_c2[2] u_m3_mac|sum_c2[1] u_m3_mac|sum_c2[0] -autobundled
netbloc @u_m3_mac|sum_c2 1 25 1 12750
load netBundle @u_m3_mac|ring_0 25 u_m3_mac|ring_0[24] u_m3_mac|ring_0[23] u_m3_mac|ring_0[22] u_m3_mac|ring_0[21] u_m3_mac|ring_0[20] u_m3_mac|ring_0[19] u_m3_mac|ring_0[18] u_m3_mac|ring_0[17] u_m3_mac|ring_0[16] u_m3_mac|ring_0[15] u_m3_mac|ring_0[14] u_m3_mac|ring_0[13] u_m3_mac|ring_0[12] u_m3_mac|ring_0[11] u_m3_mac|ring_0[10] u_m3_mac|ring_0[9] u_m3_mac|ring_0[8] u_m3_mac|ring_0[7] u_m3_mac|ring_0[6] u_m3_mac|ring_0[5] u_m3_mac|ring_0[4] u_m3_mac|ring_0[3] u_m3_mac|ring_0[2] u_m3_mac|ring_0[1] u_m3_mac|ring_0[0] -autobundled
netbloc @u_m3_mac|ring_0 1 8 8 7480 718 NJ 718 NJ 718 NJ 718 NJ 718 NJ 718 NJ 718 9080
load netBundle @u_m1_line_buffer|line_buf1_reg_57 8 u_m1_line_buffer|line_buf1_reg[17]__0[7] u_m1_line_buffer|line_buf1_reg[17]__0[6] u_m1_line_buffer|line_buf1_reg[17]__0[5] u_m1_line_buffer|line_buf1_reg[17]__0[4] u_m1_line_buffer|line_buf1_reg[17]__0[3] u_m1_line_buffer|line_buf1_reg[17]__0[2] u_m1_line_buffer|line_buf1_reg[17]__0[1] u_m1_line_buffer|line_buf1_reg[17]__0[0] -autobundled
load netBundle @u_m3_mac|hi_src 8 u_m3_mac|hi_src[7] u_m3_mac|hi_src[6] u_m3_mac|hi_src[5] u_m3_mac|hi_src[4] u_m3_mac|hi_src[3] u_m3_mac|hi_src[2] u_m3_mac|hi_src[1] u_m3_mac|hi_src[0] -autobundled
netbloc @u_m3_mac|hi_src 1 5 1 6720
load netBundle @u_m3_mac|t20 19 u_m3_mac|t20[18] u_m3_mac|t20[17] u_m3_mac|t20[16] u_m3_mac|t20[15] u_m3_mac|t20[14] u_m3_mac|t20[13] u_m3_mac|t20[12] u_m3_mac|t20[11] u_m3_mac|t20[10] u_m3_mac|t20[9] u_m3_mac|t20[8] u_m3_mac|t20[7] u_m3_mac|t20[6] u_m3_mac|t20[5] u_m3_mac|t20[4] u_m3_mac|t20[3] u_m3_mac|t20[2] u_m3_mac|t20[1] u_m3_mac|t20[0] -autobundled
netbloc @u_m3_mac|t20 1 24 1 12490
load netBundle @u_m3_mac|ring_1 25 u_m3_mac|ring_1[24] u_m3_mac|ring_1[23] u_m3_mac|ring_1[22] u_m3_mac|ring_1[21] u_m3_mac|ring_1[20] u_m3_mac|ring_1[19] u_m3_mac|ring_1[18] u_m3_mac|ring_1[17] u_m3_mac|ring_1[16] u_m3_mac|ring_1[15] u_m3_mac|ring_1[14] u_m3_mac|ring_1[13] u_m3_mac|ring_1[12] u_m3_mac|ring_1[11] u_m3_mac|ring_1[10] u_m3_mac|ring_1[9] u_m3_mac|ring_1[8] u_m3_mac|ring_1[7] u_m3_mac|ring_1[6] u_m3_mac|ring_1[5] u_m3_mac|ring_1[4] u_m3_mac|ring_1[3] u_m3_mac|ring_1[2] u_m3_mac|ring_1[1] u_m3_mac|ring_1[0] -autobundled
netbloc @u_m3_mac|ring_1 1 14 1 8640
load netBundle @u_m3_mac|ring_50 25 u_m3_mac|ring_50[24] u_m3_mac|ring_50[23] u_m3_mac|ring_50[22] u_m3_mac|ring_50[21] u_m3_mac|ring_50[20] u_m3_mac|ring_50[19] u_m3_mac|ring_50[18] u_m3_mac|ring_50[17] u_m3_mac|ring_50[16] u_m3_mac|ring_50[15] u_m3_mac|ring_50[14] u_m3_mac|ring_50[13] u_m3_mac|ring_50[12] u_m3_mac|ring_50[11] u_m3_mac|ring_50[10] u_m3_mac|ring_50[9] u_m3_mac|ring_50[8] u_m3_mac|ring_50[7] u_m3_mac|ring_50[6] u_m3_mac|ring_50[5] u_m3_mac|ring_50[4] u_m3_mac|ring_50[3] u_m3_mac|ring_50[2] u_m3_mac|ring_50[1] u_m3_mac|ring_50[0] -autobundled
netbloc @u_m3_mac|ring_50 1 9 1 7740
load netBundle @u_m2_window_generator|col_ge_i 2 u_m2_window_generator|col_ge_i__0_n_0 u_m2_window_generator|col_ge_i__0_n_1 -autobundled
netbloc @u_m2_window_generator|col_ge_i 1 6 1 4300
load netBundle @u_m3_mac|u_dsp|a 25 u_m3_mac|u_dsp|a[24] u_m3_mac|u_dsp|a[23] u_m3_mac|u_dsp|a[22] u_m3_mac|u_dsp|a[21] u_m3_mac|u_dsp|a[20] u_m3_mac|u_dsp|a[19] u_m3_mac|u_dsp|a[18] u_m3_mac|u_dsp|a[17] u_m3_mac|u_dsp|a[16] u_m3_mac|u_dsp|a[15] u_m3_mac|u_dsp|a[14] u_m3_mac|u_dsp|a[13] u_m3_mac|u_dsp|a[12] u_m3_mac|u_dsp|a[11] u_m3_mac|u_dsp|a[10] u_m3_mac|u_dsp|a[9] u_m3_mac|u_dsp|a[8] u_m3_mac|u_dsp|a[7] u_m3_mac|u_dsp|a[6] u_m3_mac|u_dsp|a[5] u_m3_mac|u_dsp|a[4] u_m3_mac|u_dsp|a[3] u_m3_mac|u_dsp|a[2] u_m3_mac|u_dsp|a[1] u_m3_mac|u_dsp|a[0] -autobundled
netbloc @u_m3_mac|u_dsp|a 1 0 1 N
load netBundle @u_m1_line_buffer|line_buf2_reg_53 8 u_m1_line_buffer|line_buf2_reg[12]__0[7] u_m1_line_buffer|line_buf2_reg[12]__0[6] u_m1_line_buffer|line_buf2_reg[12]__0[5] u_m1_line_buffer|line_buf2_reg[12]__0[4] u_m1_line_buffer|line_buf2_reg[12]__0[3] u_m1_line_buffer|line_buf2_reg[12]__0[2] u_m1_line_buffer|line_buf2_reg[12]__0[1] u_m1_line_buffer|line_buf2_reg[12]__0[0] -autobundled
load netBundle @u_m3_mac|word_s 25 u_m3_mac|word_s[24] u_m3_mac|word_s[23] u_m3_mac|word_s[22] u_m3_mac|word_s[21] u_m3_mac|word_s[20] u_m3_mac|word_s[19] u_m3_mac|word_s[18] u_m3_mac|word_s[17] u_m3_mac|word_s[16] u_m3_mac|word_s[15] u_m3_mac|word_s[14] u_m3_mac|word_s[13] u_m3_mac|word_s[12] u_m3_mac|word_s[11] u_m3_mac|word_s[10] u_m3_mac|word_s[9] u_m3_mac|word_s[8] u_m3_mac|word_s[7] u_m3_mac|word_s[6] u_m3_mac|word_s[5] u_m3_mac|word_s[4] u_m3_mac|word_s[3] u_m3_mac|word_s[2] u_m3_mac|word_s[1] u_m3_mac|word_s[0] -autobundled
netbloc @u_m3_mac|word_s 1 7 1 N
load netBundle @u_m3_mac|ring_2 25 u_m3_mac|ring_2[24] u_m3_mac|ring_2[23] u_m3_mac|ring_2[22] u_m3_mac|ring_2[21] u_m3_mac|ring_2[20] u_m3_mac|ring_2[19] u_m3_mac|ring_2[18] u_m3_mac|ring_2[17] u_m3_mac|ring_2[16] u_m3_mac|ring_2[15] u_m3_mac|ring_2[14] u_m3_mac|ring_2[13] u_m3_mac|ring_2[12] u_m3_mac|ring_2[11] u_m3_mac|ring_2[10] u_m3_mac|ring_2[9] u_m3_mac|ring_2[8] u_m3_mac|ring_2[7] u_m3_mac|ring_2[6] u_m3_mac|ring_2[5] u_m3_mac|ring_2[4] u_m3_mac|ring_2[3] u_m3_mac|ring_2[2] u_m3_mac|ring_2[1] u_m3_mac|ring_2[0] -autobundled
netbloc @u_m3_mac|ring_2 1 13 1 N
load netBundle @u_m3_mac|q_s0 8 u_m3_mac|q_s0[7] u_m3_mac|q_s0[6] u_m3_mac|q_s0[5] u_m3_mac|q_s0[4] u_m3_mac|q_s0[3] u_m3_mac|q_s0[2] u_m3_mac|q_s0[1] u_m3_mac|q_s0[0] -autobundled
netbloc @u_m3_mac|q_s0 1 13 1 8480
load netBundle @u_m3_mac|s3_a 18 u_m3_mac|s3_a[17] u_m3_mac|s3_a[16] u_m3_mac|s3_a[15] u_m3_mac|s3_a[14] u_m3_mac|s3_a[13] u_m3_mac|s3_a[12] u_m3_mac|s3_a[11] u_m3_mac|s3_a[10] u_m3_mac|s3_a[9] u_m3_mac|s3_a[8] u_m3_mac|s3_a[7] u_m3_mac|s3_a[6] u_m3_mac|s3_a[5] u_m3_mac|s3_a[4] u_m3_mac|s3_a[3] u_m3_mac|s3_a[2] u_m3_mac|s3_a[1] u_m3_mac|s3_a[0] -autobundled
netbloc @u_m3_mac|s3_a 1 20 1 N
load netBundle @mac_result 20 mac_result[19] mac_result[18] mac_result[17] mac_result[16] mac_result[15] mac_result[14] mac_result[13] mac_result[12] mac_result[11] mac_result[10] mac_result[9] mac_result[8] mac_result[7] mac_result[6] mac_result[5] mac_result[4] mac_result[3] mac_result[2] mac_result[1] mac_result[0] -autobundled
netbloc @mac_result 1 5 1 13340
load netBundle @u_m1_line_buffer|line_buf1_reg_1 8 u_m1_line_buffer|line_buf1_reg[8]__0[7] u_m1_line_buffer|line_buf1_reg[8]__0[6] u_m1_line_buffer|line_buf1_reg[8]__0[5] u_m1_line_buffer|line_buf1_reg[8]__0[4] u_m1_line_buffer|line_buf1_reg[8]__0[3] u_m1_line_buffer|line_buf1_reg[8]__0[2] u_m1_line_buffer|line_buf1_reg[8]__0[1] u_m1_line_buffer|line_buf1_reg[8]__0[0] -autobundled
netbloc @u_m1_line_buffer|line_buf1_reg_1 1 5 1 2160
load netBundle @u_m3_mac|u_dsp|b 8 u_m3_mac|u_dsp|b[7] u_m3_mac|u_dsp|b[6] u_m3_mac|u_dsp|b[5] u_m3_mac|u_dsp|b[4] u_m3_mac|u_dsp|b[3] u_m3_mac|u_dsp|b[2] u_m3_mac|u_dsp|b[1] u_m3_mac|u_dsp|b[0] -autobundled
netbloc @u_m3_mac|u_dsp|b 1 0 1 N
load netBundle @u_m1_line_buffer|line_buf1_reg_59 8 u_m1_line_buffer|line_buf1_reg[3]__0[7] u_m1_line_buffer|line_buf1_reg[3]__0[6] u_m1_line_buffer|line_buf1_reg[3]__0[5] u_m1_line_buffer|line_buf1_reg[3]__0[4] u_m1_line_buffer|line_buf1_reg[3]__0[3] u_m1_line_buffer|line_buf1_reg[3]__0[2] u_m1_line_buffer|line_buf1_reg[3]__0[1] u_m1_line_buffer|line_buf1_reg[3]__0[0] -autobundled
load netBundle @u_m1_line_buffer|line_buf1_reg_81 8 u_m1_line_buffer|line_buf1_reg[23]__0[7] u_m1_line_buffer|line_buf1_reg[23]__0[6] u_m1_line_buffer|line_buf1_reg[23]__0[5] u_m1_line_buffer|line_buf1_reg[23]__0[4] u_m1_line_buffer|line_buf1_reg[23]__0[3] u_m1_line_buffer|line_buf1_reg[23]__0[2] u_m1_line_buffer|line_buf1_reg[23]__0[1] u_m1_line_buffer|line_buf1_reg[23]__0[0] -autobundled
load netBundle @u_m5_output_handling|final_out 16 u_m5_output_handling|final_output[15] u_m5_output_handling|final_output[14] u_m5_output_handling|final_output[13] u_m5_output_handling|final_output[12] u_m5_output_handling|final_output[11] u_m5_output_handling|final_output[10] u_m5_output_handling|final_output[9] u_m5_output_handling|final_output[8] u_m5_output_handling|final_output[7] u_m5_output_handling|final_output[6] u_m5_output_handling|final_output[5] u_m5_output_handling|final_output[4] u_m5_output_handling|final_output[3] u_m5_output_handling|final_output[2] u_m5_output_handling|final_output[1] u_m5_output_handling|final_output[0] -autobundled
netbloc @u_m5_output_handling|final_out 1 3 1 14450
load netBundle @u_m3_mac|q_s1 8 u_m3_mac|q_s1[7] u_m3_mac|q_s1[6] u_m3_mac|q_s1[5] u_m3_mac|q_s1[4] u_m3_mac|q_s1[3] u_m3_mac|q_s1[2] u_m3_mac|q_s1[1] u_m3_mac|q_s1[0] -autobundled
netbloc @u_m3_mac|q_s1 1 13 1 8440
load netBundle @u_m3_mac|ring_3 25 u_m3_mac|ring_3[24] u_m3_mac|ring_3[23] u_m3_mac|ring_3[22] u_m3_mac|ring_3[21] u_m3_mac|ring_3[20] u_m3_mac|ring_3[19] u_m3_mac|ring_3[18] u_m3_mac|ring_3[17] u_m3_mac|ring_3[16] u_m3_mac|ring_3[15] u_m3_mac|ring_3[14] u_m3_mac|ring_3[13] u_m3_mac|ring_3[12] u_m3_mac|ring_3[11] u_m3_mac|ring_3[10] u_m3_mac|ring_3[9] u_m3_mac|ring_3[8] u_m3_mac|ring_3[7] u_m3_mac|ring_3[6] u_m3_mac|ring_3[5] u_m3_mac|ring_3[4] u_m3_mac|ring_3[3] u_m3_mac|ring_3[2] u_m3_mac|ring_3[1] u_m3_mac|ring_3[0] -autobundled
netbloc @u_m3_mac|ring_3 1 12 1 N
load netBundle @u_m3_mac|s3_b 18 u_m3_mac|s3_b[17] u_m3_mac|s3_b[16] u_m3_mac|s3_b[15] u_m3_mac|s3_b[14] u_m3_mac|s3_b[13] u_m3_mac|s3_b[12] u_m3_mac|s3_b[11] u_m3_mac|s3_b[10] u_m3_mac|s3_b[9] u_m3_mac|s3_b[8] u_m3_mac|s3_b[7] u_m3_mac|s3_b[6] u_m3_mac|s3_b[5] u_m3_mac|s3_b[4] u_m3_mac|s3_b[3] u_m3_mac|s3_b[2] u_m3_mac|s3_b[1] u_m3_mac|s3_b[0] -autobundled
netbloc @u_m3_mac|s3_b 1 21 1 11850
levelinfo -pg 1 0 40 380 930 1560 5250 13610 14880 18350 21000 -top -10 -bot 1790
levelinfo -hier u_clk_gen * 470 *
levelinfo -hier u_m1_line_buffer * 1090 1350 1590 1810 2030 2270 2510 2750 2990 3230 3470 3710 3950 4190 4430 4670 4910 5150 5390 5630 5870 6110 6350 6590 6830 7070 7310 7550 7790 8030 8270 8530 *
levelinfo -hier u_m2_window_generator * 1640 1810 2050 3440 3750 4100 4450 4680 *
levelinfo -hier u_m3_mac * 5390 5670 5910 6240 6550 6850 7180 7350 7610 7810 7970 8130 8330 8530 8910 9270 10520 10770 11180 11430 11720 11910 12130 12370 12590 12830 13040 *
levelinfo -hier u_m4_kernel_storage * 1740 2100 2370 2570 2820 3090 3380 3600 3970 4170 4440 *
levelinfo -hier u_m5_output_handling * 13720 13970 14240 *
levelinfo -hier u_m6_control_fsm * 18520 18780 19040 19310 19770 20010 20400 20600 *
levelinfo -hier u_m7_fifo * 14980 15190 15470 15830 16100 16370 16630 16920 17260 17630 *
levelinfo -hier u_m2_window_generator|u_col * 2240 2500 2820 3140 *
levelinfo -hier u_m3_mac|u_dsp * 9340 9540 9720 9990 10150 *
show
zoom 0.278878
scrollpos 5121 -3
#
# initialize ictrl to current module cnn_accelerator_top work:cnn_accelerator_top:NOFILE
ictrl init topinfo |
ictrl layer glayer install
ictrl layer glayer config ibundle 1
ictrl layer glayer config nbundle 0
ictrl layer glayer config pbundle 0
ictrl layer glayer config cache 1
