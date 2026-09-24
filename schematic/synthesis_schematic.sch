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
load symbol OBUF hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol IBUF hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol clk_gen_6x work:clk_gen_6x:NOFILE HIERBOX pin clk_fast output.right pin clk_in input.left pin clk_sys output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol line_buffer work:line_buffer:NOFILE HIERBOX pin clk_sys input.left pinBus D input.left [7:0] pinBus E input.left [0:0] pinBus Q output.right [7:0] pinBus q_s0_reg[7] output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol window_generator work:window_generator:NOFILE HIERBOX pin clk_sys input.left pin row_end output.right pin row_wrap input.left pinBus E input.left [0:0] pinBus Q output.right [0:0] pinBus SR input.left [0:0] pinBus fifo_all_outputs_done_reg input.left [0:0] pinBus row_ge output.right [0:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol M3 work:M3:NOFILE HIERBOX pin clk_fast input.left pin clk_sys input.left pin ld_s0 input.left pin rst_IBUF input.left pin tap_idx_reg[0] input.left pin tap_idx_reg[0]_0 input.left pin word_s_reg[19]_0 output.right pin word_s_reg[20]_0 output.right pin word_s_reg[22]_0 output.right pinBus D input.left [13:0] pinBus E input.left [0:0] pinBus FSM_sequential_state_reg[1] input.left [0:0] pinBus FSM_sequential_state_reg[1]_0 input.left [0:0] pinBus Q output.right [5:0] pinBus line_buf1_reg[31][7] input.left [7:0] pinBus line_buf2_reg[31][7] input.left [7:0] pinBus pixel_in[7] input.left [7:0] pinBus rounded_val_r_reg[16] output.right [0:0] pinBus rounded_val_r_reg[16]_0 output.right [15:0] pinBus tap_idx_reg[3] input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol kernel_storage work:kernel_storage:NOFILE HIERBOX pin clk_sys input.left pin kernel_wr_en_IBUF input.left pin ld_s0 output.right pin prev_c0_reg[1] input.left pin prev_c0_reg[2] input.left pin prev_c0_reg[3] input.left pin word_s_reg[17] output.right pin word_s_reg[17]_0 output.right pinBus D output.right [13:0] pinBus E output.right [0:0] pinBus Q output.right [3:0] pinBus kernel_select_IBUF input.left [0:0] pinBus kernel_wr_addr_IBUF input.left [3:0] pinBus kernel_wr_bank_IBUF input.left [0:0] pinBus kernel_wr_data input.left [7:0] pinBus prev_c0_reg[5] input.left [5:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol output_handling work:output_handling:NOFILE HIERBOX pin clk_sys input.left pin final_output_valid output.right pin relu_enable_IBUF input.left pin rst_IBUF input.left pinBus D input.left [15:0] pinBus E input.left [0:0] pinBus Q output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol control_fsm work:control_fsm:NOFILE HIERBOX pin busy_OBUF output.right pin clk_sys input.left pin done_OBUF output.right pin final_output_valid input.left pin frame_done_OBUF input.left pin p_0_in output.right pin pixel_in_valid_IBUF input.left pin pixel_req_OBUF output.right pin row_end input.left pin row_wrap output.right pin rst_IBUF input.left pin start_IBUF input.left pinBus Q input.left [0:0] pinBus SR output.right [0:0] pinBus out output.right [1:0] pinBus q_s2_reg[7] output.right [0:0] pinBus row_ge input.left [0:0] pinBus state_reg[0] output.right [0:0] pinBus wv_reg[1] output.right [0:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol FIFO work:FIFO:NOFILE HIERBOX pin clk_sys input.left pin final_output_valid input.left pin frame_done_OBUF output.right pin output_valid_OBUF output.right pin p_0_in input.left pin rst_IBUF input.left pin start_IBUF input.left pinBus SR input.left [0:0] pinBus final_output input.left [15:0] pinBus out input.left [1:0] pinBus output_pixel output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load port pixel_req output -pg 1 -y 830
load port busy output -pg 1 -y 690
load port kernel_wr_en input -pg 1 -y 1190
load port pixel_in_valid input -pg 1 -y 890
load port relu_enable input -pg 1 -y 930
load port start input -pg 1 -y 1080
load port rst input -pg 1 -y 910
load port output_valid output -pg 1 -y 1140
load port done output -pg 1 -y 760
load port clk input -pg 1 -y 340
load port frame_done output -pg 1 -y 1000
load portBus kernel_wr_bank input [0:0] -attr @name kernel_wr_bank[0:0] -pg 1 -y 500
load portBus pixel_in input [7:0] -attr @name pixel_in[7:0] -pg 1 -y 1260
load portBus kernel_wr_addr input [3:0] -attr @name kernel_wr_addr[3:0] -pg 1 -y 40
load portBus kernel_wr_data input [7:0] -attr @name kernel_wr_data[7:0] -pg 1 -y 1100
load portBus kernel_select input [0:0] -attr @name kernel_select[0:0] -pg 1 -y 430
load portBus output_pixel output [15:0] -attr @name output_pixel[15:0] -pg 1 -y 1210
load inst output_pixel_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1350
load inst output_pixel_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1770
load inst u_m1_line_buffer line_buffer work:line_buffer:NOFILE -autohide -attr @cell(#000000) line_buffer -pinBusAttr D @name D[7:0] -pinBusAttr E @name E -pinBusAttr Q @name Q[7:0] -pinBusAttr q_s0_reg[7] @name q_s0_reg[7][7:0] -pg 1 -lvl 3 -y 730
load inst u_m3_mac M3 work:M3:NOFILE -autohide -attr @cell(#000000) M3 -pinBusAttr D @name D[13:0] -pinBusAttr E @name E -pinBusAttr FSM_sequential_state_reg[1] @name FSM_sequential_state_reg[1] -pinBusAttr FSM_sequential_state_reg[1]_0 @name FSM_sequential_state_reg[1]_0 -pinBusAttr Q @name Q[5:0] -pinBusAttr line_buf1_reg[31][7] @name line_buf1_reg[31][7][7:0] -pinBusAttr line_buf2_reg[31][7] @name line_buf2_reg[31][7][7:0] -pinBusAttr pixel_in[7] @name pixel_in[7][7:0] -pinBusAttr rounded_val_r_reg[16] @name rounded_val_r_reg[16] -pinBusAttr rounded_val_r_reg[16]_0 @name rounded_val_r_reg[16]_0[15:0] -pinBusAttr tap_idx_reg[3] @name tap_idx_reg[3][3:0] -pg 1 -lvl 4 -y 410
load inst u_m5_output_handling output_handling work:output_handling:NOFILE -autohide -attr @cell(#000000) output_handling -pinBusAttr D @name D[15:0] -pinBusAttr E @name E -pinBusAttr Q @name Q[15:0] -pg 1 -lvl 5 -y 810
load inst kernel_wr_data_IBUF[3]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 780
load inst pixel_req_OBUF_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 830
load inst output_pixel_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1280
load inst pixel_in_IBUF[1]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1330
load inst rst_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 3 -y 910
load inst frame_done_OBUF_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1000
load inst kernel_wr_data_IBUF[0]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 570
load inst output_pixel_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1420
load inst u_clk_gen clk_gen_6x work:clk_gen_6x:NOFILE -autohide -attr @cell(#000000) clk_gen_6x -pg 1 -lvl 2 -y 330
load inst u_m4_kernel_storage kernel_storage work:kernel_storage:NOFILE -autohide -attr @cell(#000000) kernel_storage -pinBusAttr D @name D[13:0] -pinBusAttr E @name E -pinBusAttr Q @name Q[3:0] -pinBusAttr kernel_select_IBUF @name kernel_select_IBUF -pinBusAttr kernel_wr_addr_IBUF @name kernel_wr_addr_IBUF[3:0] -pinBusAttr kernel_wr_bank_IBUF @name kernel_wr_bank_IBUF -pinBusAttr kernel_wr_data @name kernel_wr_data[7:0] -pinBusAttr prev_c0_reg[5] @name prev_c0_reg[5][5:0] -pg 1 -lvl 3 -y 430
load inst kernel_wr_data_IBUF[1]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 640
load inst pixel_in_IBUF[5]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1610
load inst pixel_in_valid_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 6 -y 940
load inst kernel_wr_addr_IBUF[2]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 180
load inst kernel_wr_data_IBUF[5]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 970
load inst u_m2_window_generator window_generator work:window_generator:NOFILE -autohide -attr @cell(#000000) window_generator -pinBusAttr E @name E -pinBusAttr Q @name Q -pinBusAttr SR @name SR -pinBusAttr fifo_all_outputs_done_reg @name fifo_all_outputs_done_reg -pinBusAttr row_ge @name row_ge -pg 1 -lvl 6 -y 610
load inst kernel_wr_addr_IBUF[3]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 250
load inst output_pixel_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1560
load inst output_pixel_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1700
load inst output_pixel_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1840
load inst pixel_in_IBUF[3]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1470
load inst pixel_in_IBUF[4]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1540
load inst pixel_in_IBUF[7]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1750
load inst done_OBUF_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 760
load inst kernel_wr_data_IBUF[2]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 710
load inst output_pixel_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 2120
load inst output_pixel_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1630
load inst pixel_in_IBUF[2]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1400
load inst clk_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 1 -y 340
load inst kernel_wr_bank_IBUF[0]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 500
load inst output_pixel_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 2050
load inst pixel_in_IBUF[6]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1680
load inst busy_OBUF_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 690
load inst kernel_select_IBUF[0]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 430
load inst output_pixel_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1490
load inst kernel_wr_addr_IBUF[0]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 40
load inst kernel_wr_data_IBUF[4]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 850
load inst kernel_wr_en_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1190
load inst output_pixel_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1910
load inst output_pixel_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 2190
load inst output_pixel_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 2260
load inst u_m7_fifo FIFO work:FIFO:NOFILE -autohide -attr @cell(#000000) FIFO -pinBusAttr SR @name SR -pinBusAttr final_output @name final_output[15:0] -pinBusAttr out @name out[1:0] -pinBusAttr output_pixel @name output_pixel[15:0] -pg 1 -lvl 6 -y 1050
load inst kernel_wr_addr_IBUF[1]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 110
load inst kernel_wr_data_IBUF[6]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1040
load inst kernel_wr_data_IBUF[7]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1120
load inst output_pixel_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1210
load inst output_pixel_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1980
load inst output_valid_OBUF_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 8 -y 1140
load inst pixel_in_IBUF[0]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -y 1260
load inst relu_enable_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 4 -y 950
load inst start_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 5 -y 1080
load inst u_m6_control_fsm control_fsm work:control_fsm:NOFILE -autohide -attr @cell(#000000) control_fsm -pinBusAttr Q @name Q -pinBusAttr SR @name SR -pinBusAttr out @name out[1:0] -pinBusAttr q_s2_reg[7] @name q_s2_reg[7] -pinBusAttr row_ge @name row_ge -pinBusAttr state_reg[0] @name state_reg[0] -pinBusAttr wv_reg[1] @name wv_reg[1] -pg 1 -lvl 7 -y 710
load net clk_fast -pin u_clk_gen clk_fast -pin u_m3_mac clk_fast
netloc clk_fast 1 2 2 NJ 340 1200
load net acc_r[10] -attr @rip(#000000) rounded_val_r_reg[16]_0[6] -pin u_m3_mac rounded_val_r_reg[16]_0[6] -pin u_m5_output_handling D[6]
load net acc_r[7] -attr @rip(#000000) rounded_val_r_reg[16]_0[3] -pin u_m3_mac rounded_val_r_reg[16]_0[3] -pin u_m5_output_handling D[3]
load net line_buf1_reg[31][2] -attr @rip(#000000) Q[2] -pin u_m1_line_buffer Q[2] -pin u_m3_mac line_buf1_reg[31][7][2]
load net output_pixel_OBUF[4] -attr @rip(#000000) output_pixel[4] -pin output_pixel_OBUF[4]_inst I -pin u_m7_fifo output_pixel[4]
load net kernel_wr_bank[0] -attr @rip(#000000) kernel_wr_bank[0] -port kernel_wr_bank[0] -pin kernel_wr_bank_IBUF[0]_inst I
netloc kernel_wr_bank[0] 1 0 2 NJ 500 NJ
load net acc_r[15] -attr @rip(#000000) rounded_val_r_reg[16]_0[11] -pin u_m3_mac rounded_val_r_reg[16]_0[11] -pin u_m5_output_handling D[11]
load net kernel_wr_addr_IBUF[0] -attr @rip(#000000) 0 -pin kernel_wr_addr_IBUF[0]_inst O -pin u_m4_kernel_storage kernel_wr_addr_IBUF[0]
load net output_pixel[11] -attr @rip(#000000) 11 -port output_pixel[11] -pin output_pixel_OBUF[11]_inst O
load net pixel_req -port pixel_req -pin pixel_req_OBUF_inst O
netloc pixel_req 1 8 1 NJ
load net rst_IBUF -pin rst_IBUF_inst O -pin u_m3_mac rst_IBUF -pin u_m5_output_handling rst_IBUF -pin u_m6_control_fsm rst_IBUF -pin u_m7_fifo rst_IBUF
netloc rst_IBUF 1 3 4 1040 890 1730 960 2150 860 NJ
load net final_output[12] -attr @rip(#000000) Q[12] -pin u_m5_output_handling Q[12] -pin u_m7_fifo final_output[12]
load net output_pixel_OBUF[14] -attr @rip(#000000) output_pixel[14] -pin output_pixel_OBUF[14]_inst I -pin u_m7_fifo output_pixel[14]
load net acc_r[4] -attr @rip(#000000) rounded_val_r_reg[16]_0[0] -pin u_m3_mac rounded_val_r_reg[16]_0[0] -pin u_m5_output_handling D[0]
load net hi_lane[1] -attr @rip(#000000) D[9] -pin u_m3_mac D[9] -pin u_m4_kernel_storage D[9]
load net final_output[3] -attr @rip(#000000) Q[3] -pin u_m5_output_handling Q[3] -pin u_m7_fifo final_output[3]
load net clk_IBUF -pin clk_IBUF_inst O -pin u_clk_gen clk_in
netloc clk_IBUF 1 1 1 NJ
load net kernel_wr_data[5] -attr @rip(#000000) kernel_wr_data[5] -port kernel_wr_data[5] -pin kernel_wr_data_IBUF[5]_inst I
load net line_buf1_reg[31][7] -attr @rip(#000000) Q[7] -pin u_m1_line_buffer Q[7] -pin u_m3_mac line_buf1_reg[31][7][7]
load net final_output[0] -attr @rip(#000000) Q[0] -pin u_m5_output_handling Q[0] -pin u_m7_fifo final_output[0]
load net 0 -attr @rip(#000000) D[7] -pin u_m3_mac D[7] -pin u_m4_kernel_storage D[7]
load net output_valid_OBUF -pin output_valid_OBUF_inst I -pin u_m7_fifo output_valid_OBUF
netloc output_valid_OBUF 1 6 2 NJ 1140 NJ
load net pixel_in[1] -attr @rip(#000000) pixel_in[1] -port pixel_in[1] -pin pixel_in_IBUF[1]_inst I
load net prev_c0[4] -attr @rip(#000000) Q[4] -pin u_m3_mac Q[4] -pin u_m4_kernel_storage prev_c0_reg[5][4]
load net clk_sys -pin u_clk_gen clk_sys -pin u_m1_line_buffer clk_sys -pin u_m2_window_generator clk_sys -pin u_m3_mac clk_sys -pin u_m4_kernel_storage clk_sys -pin u_m5_output_handling clk_sys -pin u_m6_control_fsm clk_sys -pin u_m7_fifo clk_sys
netloc clk_sys 1 2 5 510 380 1100 860 1750 760 2190 780 2730J
load net output_pixel[14] -attr @rip(#000000) 14 -port output_pixel[14] -pin output_pixel_OBUF[14]_inst O
load net pixel_in[6] -attr @rip(#000000) pixel_in[6] -port pixel_in[6] -pin pixel_in_IBUF[6]_inst I
load net tap_idx[2] -attr @rip(#000000) Q[2] -pin u_m3_mac tap_idx_reg[3][2] -pin u_m4_kernel_storage Q[2]
load net u_m4_kernel_storage_n_10 -attr @rip(#000000) D[3] -pin u_m3_mac D[3] -pin u_m4_kernel_storage D[3]
load net final_output[11] -attr @rip(#000000) Q[11] -pin u_m5_output_handling Q[11] -pin u_m7_fifo final_output[11]
load net line_buf2_reg[31][2] -attr @rip(#000000) q_s0_reg[7][2] -pin u_m1_line_buffer q_s0_reg[7][2] -pin u_m3_mac line_buf2_reg[31][7][2]
load net u_m4_kernel_storage_n_11 -attr @rip(#000000) D[2] -pin u_m3_mac D[2] -pin u_m4_kernel_storage D[2]
load net acc_r[13] -attr @rip(#000000) rounded_val_r_reg[16]_0[9] -pin u_m3_mac rounded_val_r_reg[16]_0[9] -pin u_m5_output_handling D[9]
load net output_pixel[7] -attr @rip(#000000) 7 -port output_pixel[7] -pin output_pixel_OBUF[7]_inst O
load net output_pixel_OBUF[2] -attr @rip(#000000) output_pixel[2] -pin output_pixel_OBUF[2]_inst I -pin u_m7_fifo output_pixel[2]
load net output_pixel_OBUF[7] -attr @rip(#000000) output_pixel[7] -pin output_pixel_OBUF[7]_inst I -pin u_m7_fifo output_pixel[7]
load net pixel_in_IBUF[1] -attr @rip(#000000) 1 -pin pixel_in_IBUF[1]_inst O -pin u_m1_line_buffer D[1] -pin u_m3_mac pixel_in[7][1]
load net pixel_in_IBUF[6] -attr @rip(#000000) 6 -pin pixel_in_IBUF[6]_inst O -pin u_m1_line_buffer D[6] -pin u_m3_mac pixel_in[7][6]
load net prev_c0[1] -attr @rip(#000000) Q[1] -pin u_m3_mac Q[1] -pin u_m4_kernel_storage prev_c0_reg[5][1]
load net row_ge[1] -attr @rip(#000000) row_ge[0] -pin u_m2_window_generator row_ge[0] -pin u_m6_control_fsm row_ge[0]
netloc row_ge[1] 1 6 1 2770
load net u_m3_mac_n_0 -pin u_m3_mac word_s_reg[22]_0 -pin u_m4_kernel_storage prev_c0_reg[3]
netloc u_m3_mac_n_0 1 2 3 650 660 1020J 760 1690
load net u_m4_kernel_storage_n_12 -attr @rip(#000000) D[1] -pin u_m3_mac D[1] -pin u_m4_kernel_storage D[1]
load net acc_r[5] -attr @rip(#000000) rounded_val_r_reg[16]_0[1] -pin u_m3_mac rounded_val_r_reg[16]_0[1] -pin u_m5_output_handling D[1]
load net acc_r[18] -attr @rip(#000000) rounded_val_r_reg[16]_0[14] -pin u_m3_mac rounded_val_r_reg[16]_0[14] -pin u_m5_output_handling D[14]
load net line_buf1_reg[31][0] -attr @rip(#000000) Q[0] -pin u_m1_line_buffer Q[0] -pin u_m3_mac line_buf1_reg[31][7][0]
load net line_buf1_reg[31][5] -attr @rip(#000000) Q[5] -pin u_m1_line_buffer Q[5] -pin u_m3_mac line_buf1_reg[31][7][5]
load net u_m4_kernel_storage_n_13 -attr @rip(#000000) D[0] -pin u_m3_mac D[0] -pin u_m4_kernel_storage D[0]
load net u_m6_control_fsm_n_0 -attr @rip(#000000) out[1] -pin u_m6_control_fsm out[1] -pin u_m7_fifo out[1]
load net final_output[1] -attr @rip(#000000) Q[1] -pin u_m5_output_handling Q[1] -pin u_m7_fifo final_output[1]
load net kernel_wr_data_IBUF[5] -attr @rip(#000000) 5 -pin kernel_wr_data_IBUF[5]_inst O -pin u_m4_kernel_storage kernel_wr_data[5]
load net u_m6_control_fsm_n_1 -attr @rip(#000000) out[0] -pin u_m6_control_fsm out[0] -pin u_m7_fifo out[0]
load net kernel_wr_bank_IBUF[0] -attr @rip(#000000) 0 -pin kernel_wr_bank_IBUF[0]_inst O -pin u_m4_kernel_storage kernel_wr_bank_IBUF[0]
netloc kernel_wr_bank_IBUF[0] 1 2 1 NJ
load net clk -port clk -pin clk_IBUF_inst I
netloc clk 1 0 1 NJ
load net kernel_wr_en -port kernel_wr_en -pin kernel_wr_en_IBUF_inst I
netloc kernel_wr_en 1 0 2 NJ 1190 NJ
load net ld_s0 -pin u_m3_mac ld_s0 -pin u_m4_kernel_storage ld_s0
netloc ld_s0 1 3 1 N
load net line_buf2_reg[31][1] -attr @rip(#000000) q_s0_reg[7][1] -pin u_m1_line_buffer q_s0_reg[7][1] -pin u_m3_mac line_buf2_reg[31][7][1]
load net output_pixel_OBUF[12] -attr @rip(#000000) output_pixel[12] -pin output_pixel_OBUF[12]_inst I -pin u_m7_fifo output_pixel[12]
load net start_IBUF -pin start_IBUF_inst O -pin u_m6_control_fsm start_IBUF -pin u_m7_fifo start_IBUF
netloc start_IBUF 1 5 2 2170 1000 2830
load net kernel_wr_data_IBUF[2] -attr @rip(#000000) 2 -pin kernel_wr_data_IBUF[2]_inst O -pin u_m4_kernel_storage kernel_wr_data[2]
load net output_pixel[6] -attr @rip(#000000) 6 -port output_pixel[6] -pin output_pixel_OBUF[6]_inst O
load net final_output[8] -attr @rip(#000000) Q[8] -pin u_m5_output_handling Q[8] -pin u_m7_fifo final_output[8]
load net output_pixel_OBUF[9] -attr @rip(#000000) output_pixel[9] -pin output_pixel_OBUF[9]_inst I -pin u_m7_fifo output_pixel[9]
load net pixel_in[4] -attr @rip(#000000) pixel_in[4] -port pixel_in[4] -pin pixel_in_IBUF[4]_inst I
load net kernel_wr_addr_IBUF[2] -attr @rip(#000000) 2 -pin kernel_wr_addr_IBUF[2]_inst O -pin u_m4_kernel_storage kernel_wr_addr_IBUF[2]
load net kernel_select_IBUF[0] -attr @rip(#000000) 0 -pin kernel_select_IBUF[0]_inst O -pin u_m4_kernel_storage kernel_select_IBUF[0]
netloc kernel_select_IBUF[0] 1 2 1 490J
load net prev_c0[2] -attr @rip(#000000) Q[2] -pin u_m3_mac Q[2] -pin u_m4_kernel_storage prev_c0_reg[5][2]
load net relu_enable -port relu_enable -pin relu_enable_IBUF_inst I
netloc relu_enable 1 0 4 NJ 930 NJ 930 470J 950 NJ
load net start -port start -pin start_IBUF_inst I
netloc start 1 0 5 NJ 1080 NJ 1080 NJ 1080 NJ 1080 NJ
load net u_m4_kernel_storage_n_18 -pin u_m3_mac tap_idx_reg[0] -pin u_m4_kernel_storage word_s_reg[17]
netloc u_m4_kernel_storage_n_18 1 3 1 1120
load net u_m4_kernel_storage_n_7 -attr @rip(#000000) D[6] -pin u_m3_mac D[6] -pin u_m4_kernel_storage D[6]
load net final_output[14] -attr @rip(#000000) Q[14] -pin u_m5_output_handling Q[14] -pin u_m7_fifo final_output[14]
load net kernel_wr_data[7] -attr @rip(#000000) kernel_wr_data[7] -port kernel_wr_data[7] -pin kernel_wr_data_IBUF[7]_inst I
load net tap_idx[0] -attr @rip(#000000) Q[0] -pin u_m3_mac tap_idx_reg[3][0] -pin u_m4_kernel_storage Q[0]
load net u_m3_mac_n_7 -pin u_m3_mac word_s_reg[20]_0 -pin u_m4_kernel_storage prev_c0_reg[2]
netloc u_m3_mac_n_7 1 2 3 610 840 NJ 840 1710
load net u_m4_kernel_storage_n_19 -pin u_m3_mac tap_idx_reg[0]_0 -pin u_m4_kernel_storage word_s_reg[17]_0
netloc u_m4_kernel_storage_n_19 1 3 1 1160
load net u_m4_kernel_storage_n_8 -attr @rip(#000000) D[5] -pin u_m3_mac D[5] -pin u_m4_kernel_storage D[5]
load net wr_ptr0 -attr @rip(#000000) SR[0] -pin u_m2_window_generator SR[0] -pin u_m6_control_fsm SR[0] -pin u_m7_fifo SR[0]
netloc wr_ptr0 1 5 3 2250 760 2710J 660 3180
load net done_OBUF -pin done_OBUF_inst I -pin u_m6_control_fsm done_OBUF
netloc done_OBUF 1 7 1 NJ
load net output_pixel[2] -attr @rip(#000000) 2 -port output_pixel[2] -pin output_pixel_OBUF[2]_inst O
load net u_m3_mac_n_8 -pin u_m3_mac word_s_reg[19]_0 -pin u_m4_kernel_storage prev_c0_reg[1]
netloc u_m3_mac_n_8 1 2 3 590 820 NJ 820 1730
load net u_m4_kernel_storage_n_9 -attr @rip(#000000) D[4] -pin u_m3_mac D[4] -pin u_m4_kernel_storage D[4]
load net acc_r[11] -attr @rip(#000000) rounded_val_r_reg[16]_0[7] -pin u_m3_mac rounded_val_r_reg[16]_0[7] -pin u_m5_output_handling D[7]
load net busy -port busy -pin busy_OBUF_inst O
netloc busy 1 8 1 NJ
load net output_pixel_OBUF[0] -attr @rip(#000000) output_pixel[0] -pin output_pixel_OBUF[0]_inst I -pin u_m7_fifo output_pixel[0]
load net output_pixel_OBUF[5] -attr @rip(#000000) output_pixel[5] -pin output_pixel_OBUF[5]_inst I -pin u_m7_fifo output_pixel[5]
load net pixel_in_IBUF[4] -attr @rip(#000000) 4 -pin pixel_in_IBUF[4]_inst O -pin u_m1_line_buffer D[4] -pin u_m3_mac pixel_in[7][4]
load net busy_OBUF -pin busy_OBUF_inst I -pin u_m6_control_fsm busy_OBUF
netloc busy_OBUF 1 7 1 3300J
load net kernel_wr_addr[1] -attr @rip(#000000) kernel_wr_addr[1] -port kernel_wr_addr[1] -pin kernel_wr_addr_IBUF[1]_inst I
load net acc_r[16] -attr @rip(#000000) rounded_val_r_reg[16]_0[12] -pin u_m3_mac rounded_val_r_reg[16]_0[12] -pin u_m5_output_handling D[12]
load net kernel_wr_data[4] -attr @rip(#000000) kernel_wr_data[4] -port kernel_wr_data[4] -pin kernel_wr_data_IBUF[4]_inst I
load net line_buf1_reg[31][3] -attr @rip(#000000) Q[3] -pin u_m1_line_buffer Q[3] -pin u_m3_mac line_buf1_reg[31][7][3]
load net line_buf2_reg[31][7] -attr @rip(#000000) q_s0_reg[7][7] -pin u_m1_line_buffer q_s0_reg[7][7] -pin u_m3_mac line_buf2_reg[31][7][7]
load net relu_enable_IBUF -pin relu_enable_IBUF_inst O -pin u_m5_output_handling relu_enable_IBUF
netloc relu_enable_IBUF 1 4 1 1770J
load net u_m6_control_fsm_n_9 -pin u_m6_control_fsm p_0_in -pin u_m7_fifo p_0_in
netloc u_m6_control_fsm_n_9 1 5 3 2230 880 2810J 940 3200
load net final_output[13] -attr @rip(#000000) Q[13] -pin u_m5_output_handling Q[13] -pin u_m7_fifo final_output[13]
load net final_output[9] -attr @rip(#000000) Q[9] -pin u_m5_output_handling Q[9] -pin u_m7_fifo final_output[9]
load net output_pixel_OBUF[15] -attr @rip(#000000) output_pixel[15] -pin output_pixel_OBUF[15]_inst I -pin u_m7_fifo output_pixel[15]
load net pixel_in_valid -port pixel_in_valid -pin pixel_in_valid_IBUF_inst I
netloc pixel_in_valid 1 0 6 NJ 890 NJ 890 550J 870 1060J 910 1690J 940 NJ
load net pixel_req_OBUF -pin pixel_req_OBUF_inst I -pin u_m6_control_fsm pixel_req_OBUF
netloc pixel_req_OBUF 1 7 1 3300J
load net rst -port rst -pin rst_IBUF_inst I
netloc rst 1 0 3 NJ 910 NJ 910 NJ
load net line_buf2_reg[31][4] -attr @rip(#000000) q_s0_reg[7][4] -pin u_m1_line_buffer q_s0_reg[7][4] -pin u_m3_mac line_buf2_reg[31][7][4]
load net output_pixel_OBUF[10] -attr @rip(#000000) output_pixel[10] -pin output_pixel_OBUF[10]_inst I -pin u_m7_fifo output_pixel[10]
load net output_pixel[13] -attr @rip(#000000) 13 -port output_pixel[13] -pin output_pixel_OBUF[13]_inst O
load net output_pixel[9] -attr @rip(#000000) 9 -port output_pixel[9] -pin output_pixel_OBUF[9]_inst O
load net hi_lane[4] -attr @rip(#000000) D[12] -pin u_m3_mac D[12] -pin u_m4_kernel_storage D[12]
load net final_output[6] -attr @rip(#000000) Q[6] -pin u_m5_output_handling Q[6] -pin u_m7_fifo final_output[6]
load net pixel_in[2] -attr @rip(#000000) pixel_in[2] -port pixel_in[2] -pin pixel_in_IBUF[2]_inst I
load net kernel_wr_data[1] -attr @rip(#000000) kernel_wr_data[1] -port kernel_wr_data[1] -pin kernel_wr_data_IBUF[1]_inst I
load net hi_lane[5] -attr @rip(#000000) D[13] -pin u_m3_mac D[13] -pin u_m4_kernel_storage D[13]
load net kernel_wr_data_IBUF[7] -attr @rip(#000000) 7 -pin kernel_wr_data_IBUF[7]_inst O -pin u_m4_kernel_storage kernel_wr_data[7]
load net pixel_in[7] -attr @rip(#000000) pixel_in[7] -port pixel_in[7] -pin pixel_in_IBUF[7]_inst I
load net pixel_valid_in -attr @rip(#000000) q_s2_reg[7][0] -pin u_m1_line_buffer E[0] -pin u_m2_window_generator E[0] -pin u_m3_mac FSM_sequential_state_reg[1][0] -pin u_m6_control_fsm q_s2_reg[7][0]
netloc pixel_valid_in 1 2 6 650 680 1060 720 NJ 720 2170 900 2710J 960 3180
load net prev_c0[0] -attr @rip(#000000) Q[0] -pin u_m3_mac Q[0] -pin u_m4_kernel_storage prev_c0_reg[5][0]
load net tap_idx[3] -attr @rip(#000000) Q[3] -pin u_m3_mac tap_idx_reg[3][3] -pin u_m4_kernel_storage Q[3]
load net line_buf2_reg[31][3] -attr @rip(#000000) q_s0_reg[7][3] -pin u_m1_line_buffer q_s0_reg[7][3] -pin u_m3_mac line_buf2_reg[31][7][3]
load net kernel_wr_addr[2] -attr @rip(#000000) kernel_wr_addr[2] -port kernel_wr_addr[2] -pin kernel_wr_addr_IBUF[2]_inst I
load net kernel_wr_data_IBUF[4] -attr @rip(#000000) 4 -pin kernel_wr_data_IBUF[4]_inst O -pin u_m4_kernel_storage kernel_wr_data[4]
load net output_pixel[0] -attr @rip(#000000) 0 -port output_pixel[0] -pin output_pixel_OBUF[0]_inst O
load net output_pixel[3] -attr @rip(#000000) 3 -port output_pixel[3] -pin output_pixel_OBUF[3]_inst O
load net output_pixel[8] -attr @rip(#000000) 8 -port output_pixel[8] -pin output_pixel_OBUF[8]_inst O
load net output_pixel_OBUF[3] -attr @rip(#000000) output_pixel[3] -pin output_pixel_OBUF[3]_inst I -pin u_m7_fifo output_pixel[3]
load net pixel_in_IBUF[2] -attr @rip(#000000) 2 -pin pixel_in_IBUF[2]_inst O -pin u_m1_line_buffer D[2] -pin u_m3_mac pixel_in[7][2]
load net pixel_in_IBUF[7] -attr @rip(#000000) 7 -pin pixel_in_IBUF[7]_inst O -pin u_m1_line_buffer D[7] -pin u_m3_mac pixel_in[7][7]
load net acc_r[19] -attr @rip(#000000) rounded_val_r_reg[16]_0[15] -pin u_m3_mac rounded_val_r_reg[16]_0[15] -pin u_m5_output_handling D[15]
load net line_buf1_reg[31][1] -attr @rip(#000000) Q[1] -pin u_m1_line_buffer Q[1] -pin u_m3_mac line_buf1_reg[31][7][1]
load net line_buf1_reg[31][6] -attr @rip(#000000) Q[6] -pin u_m1_line_buffer Q[6] -pin u_m3_mac line_buf1_reg[31][7][6]
load net p_1_in -attr @rip(#000000) Q[0] -pin u_m2_window_generator Q[0] -pin u_m6_control_fsm Q[0]
netloc p_1_in 1 6 1 2670
load net acc_r[14] -attr @rip(#000000) rounded_val_r_reg[16]_0[10] -pin u_m3_mac rounded_val_r_reg[16]_0[10] -pin u_m5_output_handling D[10]
load net kernel_wr_data[0] -attr @rip(#000000) kernel_wr_data[0] -port kernel_wr_data[0] -pin kernel_wr_data_IBUF[0]_inst I
load net kernel_wr_data_IBUF[1] -attr @rip(#000000) 1 -pin kernel_wr_data_IBUF[1]_inst O -pin u_m4_kernel_storage kernel_wr_data[1]
load net output_pixel[10] -attr @rip(#000000) 10 -port output_pixel[10] -pin output_pixel_OBUF[10]_inst O
load net acc_r[8] -attr @rip(#000000) rounded_val_r_reg[16]_0[4] -pin u_m3_mac rounded_val_r_reg[16]_0[4] -pin u_m5_output_handling D[4]
load net final_output[7] -attr @rip(#000000) Q[7] -pin u_m5_output_handling Q[7] -pin u_m7_fifo final_output[7]
load net output_pixel_OBUF[13] -attr @rip(#000000) output_pixel[13] -pin output_pixel_OBUF[13]_inst I -pin u_m7_fifo output_pixel[13]
load net output_pixel_OBUF[8] -attr @rip(#000000) output_pixel[8] -pin output_pixel_OBUF[8]_inst I -pin u_m7_fifo output_pixel[8]
load net kernel_wr_addr_IBUF[1] -attr @rip(#000000) 1 -pin kernel_wr_addr_IBUF[1]_inst O -pin u_m4_kernel_storage kernel_wr_addr_IBUF[1]
load net mac_result_valid -attr @rip(#000000) rounded_val_r_reg[16][0] -pin u_m3_mac rounded_val_r_reg[16][0] -pin u_m5_output_handling E[0]
netloc mac_result_valid 1 4 1 1790
load net hi_lane[2] -attr @rip(#000000) D[10] -pin u_m3_mac D[10] -pin u_m4_kernel_storage D[10]
load net col_ge0 -attr @rip(#000000) state_reg[0][0] -pin u_m2_window_generator fifo_all_outputs_done_reg[0] -pin u_m6_control_fsm state_reg[0][0]
netloc col_ge0 1 5 3 2210 540 NJ 540 3280
load net final_output[4] -attr @rip(#000000) Q[4] -pin u_m5_output_handling Q[4] -pin u_m7_fifo final_output[4]
load net kernel_wr_data[6] -attr @rip(#000000) kernel_wr_data[6] -port kernel_wr_data[6] -pin kernel_wr_data_IBUF[6]_inst I
load net output_pixel[1] -attr @rip(#000000) 1 -port output_pixel[1] -pin output_pixel_OBUF[1]_inst O
load net pixel_in[0] -attr @rip(#000000) pixel_in[0] -port pixel_in[0] -pin pixel_in_IBUF[0]_inst I
load net row_end -pin u_m2_window_generator row_end -pin u_m6_control_fsm row_end
netloc row_end 1 6 1 2650
load net window_valid -attr @rip(#000000) wv_reg[1][0] -pin u_m3_mac FSM_sequential_state_reg[1]_0[0] -pin u_m6_control_fsm wv_reg[1][0]
netloc window_valid 1 3 5 1220 740 NJ 740 NJ 740 2690J 640 3240
load net final_output[15] -attr @rip(#000000) Q[15] -pin u_m5_output_handling Q[15] -pin u_m7_fifo final_output[15]
load net pixel_in[5] -attr @rip(#000000) pixel_in[5] -port pixel_in[5] -pin pixel_in_IBUF[5]_inst I
load net row_wrap -pin u_m2_window_generator row_wrap -pin u_m6_control_fsm row_wrap
netloc row_wrap 1 5 3 2230 560 NJ 560 3220
load net tap_idx[1] -attr @rip(#000000) Q[1] -pin u_m3_mac tap_idx_reg[3][1] -pin u_m4_kernel_storage Q[1]
load net final_output[10] -attr @rip(#000000) Q[10] -pin u_m5_output_handling Q[10] -pin u_m7_fifo final_output[10]
load net done -port done -pin done_OBUF_inst O
netloc done 1 8 1 NJ
load net kernel_wr_addr[0] -attr @rip(#000000) kernel_wr_addr[0] -port kernel_wr_addr[0] -pin kernel_wr_addr_IBUF[0]_inst I
load net kernel_wr_data[3] -attr @rip(#000000) kernel_wr_data[3] -port kernel_wr_data[3] -pin kernel_wr_data_IBUF[3]_inst I
load net line_buf2_reg[31][6] -attr @rip(#000000) q_s0_reg[7][6] -pin u_m1_line_buffer q_s0_reg[7][6] -pin u_m3_mac line_buf2_reg[31][7][6]
load net prev_c0[5] -attr @rip(#000000) Q[5] -pin u_m3_mac Q[5] -pin u_m4_kernel_storage prev_c0_reg[5][5]
load net acc_r[12] -attr @rip(#000000) rounded_val_r_reg[16]_0[8] -pin u_m3_mac rounded_val_r_reg[16]_0[8] -pin u_m5_output_handling D[8]
load net acc_r[9] -attr @rip(#000000) rounded_val_r_reg[16]_0[5] -pin u_m3_mac rounded_val_r_reg[16]_0[5] -pin u_m5_output_handling D[5]
load net output_pixel[15] -attr @rip(#000000) 15 -port output_pixel[15] -pin output_pixel_OBUF[15]_inst O
load net output_pixel_OBUF[1] -attr @rip(#000000) output_pixel[1] -pin output_pixel_OBUF[1]_inst I -pin u_m7_fifo output_pixel[1]
load net output_pixel_OBUF[6] -attr @rip(#000000) output_pixel[6] -pin output_pixel_OBUF[6]_inst I -pin u_m7_fifo output_pixel[6]
load net pixel_in_IBUF[0] -attr @rip(#000000) 0 -pin pixel_in_IBUF[0]_inst O -pin u_m1_line_buffer D[0] -pin u_m3_mac pixel_in[7][0]
load net pixel_in_IBUF[5] -attr @rip(#000000) 5 -pin pixel_in_IBUF[5]_inst O -pin u_m1_line_buffer D[5] -pin u_m3_mac pixel_in[7][5]
load net acc_r[17] -attr @rip(#000000) rounded_val_r_reg[16]_0[13] -pin u_m3_mac rounded_val_r_reg[16]_0[13] -pin u_m5_output_handling D[13]
load net line_buf1_reg[31][4] -attr @rip(#000000) Q[4] -pin u_m1_line_buffer Q[4] -pin u_m3_mac line_buf1_reg[31][7][4]
load net prev_c00 -attr @rip(#000000) E[0] -pin u_m3_mac E[0] -pin u_m4_kernel_storage E[0]
netloc prev_c00 1 3 1 1080
load net output_pixel[12] -attr @rip(#000000) 12 -port output_pixel[12] -pin output_pixel_OBUF[12]_inst O
load net acc_r[6] -attr @rip(#000000) rounded_val_r_reg[16]_0[2] -pin u_m3_mac rounded_val_r_reg[16]_0[2] -pin u_m5_output_handling D[2]
load net hi_lane[3] -attr @rip(#000000) D[11] -pin u_m3_mac D[11] -pin u_m4_kernel_storage D[11]
load net final_output[5] -attr @rip(#000000) Q[5] -pin u_m5_output_handling Q[5] -pin u_m7_fifo final_output[5]
load net line_buf2_reg[31][0] -attr @rip(#000000) q_s0_reg[7][0] -pin u_m1_line_buffer q_s0_reg[7][0] -pin u_m3_mac line_buf2_reg[31][7][0]
load net line_buf2_reg[31][5] -attr @rip(#000000) q_s0_reg[7][5] -pin u_m1_line_buffer q_s0_reg[7][5] -pin u_m3_mac line_buf2_reg[31][7][5]
load net output_pixel_OBUF[11] -attr @rip(#000000) output_pixel[11] -pin output_pixel_OBUF[11]_inst I -pin u_m7_fifo output_pixel[11]
load net final_output[2] -attr @rip(#000000) Q[2] -pin u_m5_output_handling Q[2] -pin u_m7_fifo final_output[2]
load net final_output_valid -pin u_m5_output_handling final_output_valid -pin u_m6_control_fsm final_output_valid -pin u_m7_fifo final_output_valid
netloc final_output_valid 1 5 2 2130 800 2750J
load net kernel_wr_data_IBUF[6] -attr @rip(#000000) 6 -pin kernel_wr_data_IBUF[6]_inst O -pin u_m4_kernel_storage kernel_wr_data[6]
load net output_pixel[5] -attr @rip(#000000) 5 -port output_pixel[5] -pin output_pixel_OBUF[5]_inst O
load net hi_lane[0] -attr @rip(#000000) D[8] -pin u_m3_mac D[8] -pin u_m4_kernel_storage D[8]
load net pixel_in[3] -attr @rip(#000000) pixel_in[3] -port pixel_in[3] -pin pixel_in_IBUF[3]_inst I
load net frame_done -port frame_done -pin frame_done_OBUF_inst O
netloc frame_done 1 8 1 NJ
load net kernel_wr_data[2] -attr @rip(#000000) kernel_wr_data[2] -port kernel_wr_data[2] -pin kernel_wr_data_IBUF[2]_inst I
load net kernel_wr_data_IBUF[3] -attr @rip(#000000) 3 -pin kernel_wr_data_IBUF[3]_inst O -pin u_m4_kernel_storage kernel_wr_data[3]
load net frame_done_OBUF -pin frame_done_OBUF_inst I -pin u_m6_control_fsm frame_done_OBUF -pin u_m7_fifo frame_done_OBUF
netloc frame_done_OBUF 1 6 2 2850 1000 NJ
load net kernel_select[0] -attr @rip(#000000) kernel_select[0] -port kernel_select[0] -pin kernel_select_IBUF[0]_inst I
netloc kernel_select[0] 1 0 2 NJ 430 NJ
load net kernel_wr_addr_IBUF[3] -attr @rip(#000000) 3 -pin kernel_wr_addr_IBUF[3]_inst O -pin u_m4_kernel_storage kernel_wr_addr_IBUF[3]
load net kernel_wr_addr[3] -attr @rip(#000000) kernel_wr_addr[3] -port kernel_wr_addr[3] -pin kernel_wr_addr_IBUF[3]_inst I
load net kernel_wr_data_IBUF[0] -attr @rip(#000000) 0 -pin kernel_wr_data_IBUF[0]_inst O -pin u_m4_kernel_storage kernel_wr_data[0]
load net kernel_wr_en_IBUF -pin kernel_wr_en_IBUF_inst O -pin u_m4_kernel_storage kernel_wr_en_IBUF
netloc kernel_wr_en_IBUF 1 2 1 530J
load net output_pixel[4] -attr @rip(#000000) 4 -port output_pixel[4] -pin output_pixel_OBUF[4]_inst O
load net output_valid -port output_valid -pin output_valid_OBUF_inst O
netloc output_valid 1 8 1 NJ
load net pixel_in_IBUF[3] -attr @rip(#000000) 3 -pin pixel_in_IBUF[3]_inst O -pin u_m1_line_buffer D[3] -pin u_m3_mac pixel_in[7][3]
load net pixel_in_valid_IBUF -pin pixel_in_valid_IBUF_inst O -pin u_m6_control_fsm pixel_in_valid_IBUF
netloc pixel_in_valid_IBUF 1 6 1 2790J
load net prev_c0[3] -attr @rip(#000000) Q[3] -pin u_m3_mac Q[3] -pin u_m4_kernel_storage prev_c0_reg[5][3]
load netBundle @kernel_wr_data_IBUF 8 kernel_wr_data_IBUF[7] kernel_wr_data_IBUF[6] kernel_wr_data_IBUF[5] kernel_wr_data_IBUF[4] kernel_wr_data_IBUF[3] kernel_wr_data_IBUF[2] kernel_wr_data_IBUF[1] kernel_wr_data_IBUF[0] -autobundled
netbloc @kernel_wr_data_IBUF 1 2 1 490
load netBundle @final_output 16 final_output[15] final_output[14] final_output[13] final_output[12] final_output[11] final_output[10] final_output[9] final_output[8] final_output[7] final_output[6] final_output[5] final_output[4] final_output[3] final_output[2] final_output[1] final_output[0] -autobundled
netbloc @final_output 1 5 1 2110
load netBundle @line_buf1_reg 8 line_buf1_reg[31][7] line_buf1_reg[31][6] line_buf1_reg[31][5] line_buf1_reg[31][4] line_buf1_reg[31][3] line_buf1_reg[31][2] line_buf1_reg[31][1] line_buf1_reg[31][0] -autobundled
netbloc @line_buf1_reg 1 3 1 1140
load netBundle @pixel_in_IBUF 8 pixel_in_IBUF[7] pixel_in_IBUF[6] pixel_in_IBUF[5] pixel_in_IBUF[4] pixel_in_IBUF[3] pixel_in_IBUF[2] pixel_in_IBUF[1] pixel_in_IBUF[0] -autobundled
netbloc @pixel_in_IBUF 1 2 2 570 1100 1200
load netBundle @u_m6_control_fsm_n_0 2 u_m6_control_fsm_n_0 u_m6_control_fsm_n_1 -autobundled
netbloc @u_m6_control_fsm_n_0 1 5 3 2270 980 NJ 980 3260
load netBundle @kernel_wr_addr 4 kernel_wr_addr[3] kernel_wr_addr[2] kernel_wr_addr[1] kernel_wr_addr[0] -autobundled
netbloc @kernel_wr_addr 1 0 2 NJ 40 170
load netBundle @pixel_in 8 pixel_in[7] pixel_in[6] pixel_in[5] pixel_in[4] pixel_in[3] pixel_in[2] pixel_in[1] pixel_in[0] -autobundled
netbloc @pixel_in 1 0 2 NJ 1260 170
load netBundle @output_pixel_OBUF 16 output_pixel_OBUF[15] output_pixel_OBUF[14] output_pixel_OBUF[13] output_pixel_OBUF[12] output_pixel_OBUF[11] output_pixel_OBUF[10] output_pixel_OBUF[9] output_pixel_OBUF[8] output_pixel_OBUF[7] output_pixel_OBUF[6] output_pixel_OBUF[5] output_pixel_OBUF[4] output_pixel_OBUF[3] output_pixel_OBUF[2] output_pixel_OBUF[1] output_pixel_OBUF[0] -autobundled
netbloc @output_pixel_OBUF 1 6 2 2750 1160 3240
load netBundle @acc_r 16 acc_r[19] acc_r[18] acc_r[17] acc_r[16] acc_r[15] acc_r[14] acc_r[13] acc_r[12] acc_r[11] acc_r[10] acc_r[9] acc_r[8] acc_r[7] acc_r[6] acc_r[5] acc_r[4] -autobundled
netbloc @acc_r 1 4 1 1770
load netBundle @tap_idx 4 tap_idx[3] tap_idx[2] tap_idx[1] tap_idx[0] -autobundled
netbloc @tap_idx 1 3 1 1080
load netBundle @hi_lane,0 14 hi_lane[5] hi_lane[4] hi_lane[3] hi_lane[2] hi_lane[1] hi_lane[0] 0 u_m4_kernel_storage_n_7 u_m4_kernel_storage_n_8 u_m4_kernel_storage_n_9 u_m4_kernel_storage_n_10 u_m4_kernel_storage_n_11 u_m4_kernel_storage_n_12 u_m4_kernel_storage_n_13 -autobundled
netbloc @hi_lane,0 1 3 1 1040
load netBundle @kernel_wr_addr_IBUF 4 kernel_wr_addr_IBUF[3] kernel_wr_addr_IBUF[2] kernel_wr_addr_IBUF[1] kernel_wr_addr_IBUF[0] -autobundled
netbloc @kernel_wr_addr_IBUF 1 2 1 610
load netBundle @line_buf2_reg 8 line_buf2_reg[31][7] line_buf2_reg[31][6] line_buf2_reg[31][5] line_buf2_reg[31][4] line_buf2_reg[31][3] line_buf2_reg[31][2] line_buf2_reg[31][1] line_buf2_reg[31][0] -autobundled
netbloc @line_buf2_reg 1 3 1 1180
load netBundle @prev_c0 6 prev_c0[5] prev_c0[4] prev_c0[3] prev_c0[2] prev_c0[1] prev_c0[0] -autobundled
netbloc @prev_c0 1 2 3 630 360 NJ 360 1790
load netBundle @output_pixel 16 output_pixel[15] output_pixel[14] output_pixel[13] output_pixel[12] output_pixel[11] output_pixel[10] output_pixel[9] output_pixel[8] output_pixel[7] output_pixel[6] output_pixel[5] output_pixel[4] output_pixel[3] output_pixel[2] output_pixel[1] output_pixel[0] -autobundled
netbloc @output_pixel 1 8 1 3560
load netBundle @kernel_wr_data 8 kernel_wr_data[7] kernel_wr_data[6] kernel_wr_data[5] kernel_wr_data[4] kernel_wr_data[3] kernel_wr_data[2] kernel_wr_data[1] kernel_wr_data[0] -autobundled
netbloc @kernel_wr_data 1 0 2 NJ 1100 170
levelinfo -pg 1 0 40 240 830 1430 1920 2450 2990 3340 3580 -top 0 -bot 2300
show
fullfit
#
# initialize ictrl to current module cnn_accelerator_top work:cnn_accelerator_top:NOFILE
ictrl init topinfo |
