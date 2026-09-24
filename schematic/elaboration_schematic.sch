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
load inst u_m1_line_buffer line_buffer work:line_buffer:NOFILE -autohide -attr @cell(#000000) line_buffer -pinBusAttr curr_row_pixel @name curr_row_pixel[7:0] -pinBusAttr pixel_in @name pixel_in[7:0] -pinBusAttr prev_row1_pixel @name prev_row1_pixel[7:0] -pinBusAttr prev_row2_pixel @name prev_row2_pixel[7:0] -pg 1 -lvl 3 -y 60
load inst u_m3_mac M3 work:M3:NOFILE -autohide -attr @cell(#000000) M3 -pinBusAttr col_row0 @name col_row0[7:0] -pinBusAttr col_row1 @name col_row1[7:0] -pinBusAttr col_row2 @name col_row2[7:0] -pinBusAttr mac_result @name mac_result[19:0] -pinBusAttr tap_data @name tap_data[7:0] -pinBusAttr tap_idx @name tap_idx[3:0] -pg 1 -lvl 5 -y 80
load inst u_m5_output_handling output_handling work:output_handling:NOFILE -autohide -attr @cell(#000000) output_handling -pinBusAttr final_output @name final_output[15:0] -pinBusAttr mac_result @name mac_result[19:0] -pg 1 -lvl 6 -y 140
load inst u_clk_gen clk_gen_6x work:clk_gen_6x:NOFILE -autohide -attr @cell(#000000) clk_gen_6x -pg 1 -lvl 2 -y 70
load inst u_m4_kernel_storage kernel_storage work:kernel_storage:NOFILE -autohide -attr @cell(#000000) kernel_storage -pinBusAttr kernel_select @name kernel_select -pinBusAttr kernel_wr_addr @name kernel_wr_addr[3:0] -pinBusAttr kernel_wr_bank @name kernel_wr_bank -pinBusAttr kernel_wr_data @name kernel_wr_data[7:0] -pinBusAttr tap_data @name tap_data[7:0] -pinBusAttr tap_idx @name tap_idx[3:0] -pg 1 -lvl 4 -y 480
load inst u_m2_window_generator window_generator work:window_generator:NOFILE -autohide -attr @cell(#000000) window_generator -pg 1 -lvl 4 -y 280
load inst clk_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 1 -y 80
load inst u_m7_fifo FIFO work:FIFO:NOFILE -autohide -attr @cell(#000000) FIFO -pinBusAttr final_output @name final_output[15:0] -pinBusAttr output_pixel @name output_pixel[15:0] -pg 1 -lvl 7 -y 160
load inst u_m6_control_fsm control_fsm work:control_fsm:NOFILE -autohide -attr @cell(#000000) control_fsm -pg 1 -lvl 8 -y 360
load net clk_fast -pin u_clk_gen clk_fast -pin u_m3_mac clk_fast
netloc clk_fast 1 2 3 380J 10 NJ 10 1170
load net kernel_wr_bank[0] -attr @rip(#000000) kernel_wr_bank[0] -port kernel_wr_bank[0] -pin u_m4_kernel_storage kernel_wr_bank[0]
netloc kernel_wr_bank[0] 1 0 4 NJ 550 NJ 550 NJ 550 NJ
load net curr_row_pixel[7] -attr @rip(#000000) curr_row_pixel[7] -pin u_m1_line_buffer curr_row_pixel[7] -pin u_m3_mac col_row2[7]
load net output_pixel[11] -attr @rip(#000000) output_pixel[11] -port output_pixel[11] -pin u_m7_fifo output_pixel[11]
load net pixel_req -port pixel_req -pin u_m6_control_fsm pixel_req
netloc pixel_req 1 8 1 NJ
load net final_output[12] -attr @rip(#000000) final_output[12] -pin u_m5_output_handling final_output[12] -pin u_m7_fifo final_output[12]
load net mac_result[16] -attr @rip(#000000) mac_result[16] -pin u_m3_mac mac_result[16] -pin u_m5_output_handling mac_result[16]
load net mac_result[4] -attr @rip(#000000) mac_result[4] -pin u_m3_mac mac_result[4] -pin u_m5_output_handling mac_result[4]
load net curr_row_pixel[4] -attr @rip(#000000) curr_row_pixel[4] -pin u_m1_line_buffer curr_row_pixel[4] -pin u_m3_mac col_row2[4]
load net final_output[3] -attr @rip(#000000) final_output[3] -pin u_m5_output_handling final_output[3] -pin u_m7_fifo final_output[3]
load net kernel_wr_data[5] -attr @rip(#000000) kernel_wr_data[5] -port kernel_wr_data[5] -pin u_m4_kernel_storage kernel_wr_data[5]
load net clk_IBUF -pin clk_IBUF_inst O -pin u_clk_gen clk_in
netloc clk_IBUF 1 1 1 NJ
load net final_output[0] -attr @rip(#000000) final_output[0] -pin u_m5_output_handling final_output[0] -pin u_m7_fifo final_output[0]
load net curr_row_pixel[1] -attr @rip(#000000) curr_row_pixel[1] -pin u_m1_line_buffer curr_row_pixel[1] -pin u_m3_mac col_row2[1]
load net mac_result[1] -attr @rip(#000000) mac_result[1] -pin u_m3_mac mac_result[1] -pin u_m5_output_handling mac_result[1]
load net pixel_in[1] -attr @rip(#000000) pixel_in[1] -port pixel_in[1] -pin u_m1_line_buffer pixel_in[1]
load net prev_row1_pixel[3] -attr @rip(#000000) prev_row1_pixel[3] -pin u_m1_line_buffer prev_row1_pixel[3] -pin u_m3_mac col_row1[3]
load net clk_sys -pin u_clk_gen clk_sys -pin u_m1_line_buffer clk -pin u_m2_window_generator clk -pin u_m3_mac clk -pin u_m4_kernel_storage clk -pin u_m5_output_handling clk -pin u_m6_control_fsm clk -pin u_m7_fifo clk
netloc clk_sys 1 2 6 400 190 760 170 1210 10 1590 270 1990 370 NJ
load net output_pixel[14] -attr @rip(#000000) output_pixel[14] -port output_pixel[14] -pin u_m7_fifo output_pixel[14]
load net pixel_in[6] -attr @rip(#000000) pixel_in[6] -port pixel_in[6] -pin u_m1_line_buffer pixel_in[6]
load net prev_row2_pixel[6] -attr @rip(#000000) prev_row2_pixel[6] -pin u_m1_line_buffer prev_row2_pixel[6] -pin u_m3_mac col_row0[6]
load net tap_data[4] -attr @rip(#000000) tap_data[4] -pin u_m3_mac tap_data[4] -pin u_m4_kernel_storage tap_data[4]
load net tap_idx[2] -attr @rip(#000000) tap_idx[2] -pin u_m3_mac tap_idx[2] -pin u_m4_kernel_storage tap_idx[2]
load net final_output[11] -attr @rip(#000000) final_output[11] -pin u_m5_output_handling final_output[11] -pin u_m7_fifo final_output[11]
load net curr_row_pixel[0] -attr @rip(#000000) curr_row_pixel[0] -pin u_m1_line_buffer curr_row_pixel[0] -pin u_m3_mac col_row2[0]
load net mac_result[13] -attr @rip(#000000) mac_result[13] -pin u_m3_mac mac_result[13] -pin u_m5_output_handling mac_result[13]
load net output_pixel[7] -attr @rip(#000000) output_pixel[7] -port output_pixel[7] -pin u_m7_fifo output_pixel[7]
load net prev_row1_pixel[2] -attr @rip(#000000) prev_row1_pixel[2] -pin u_m1_line_buffer prev_row1_pixel[2] -pin u_m3_mac col_row1[2]
load net tap_data[7] -attr @rip(#000000) tap_data[7] -pin u_m3_mac tap_data[7] -pin u_m4_kernel_storage tap_data[7]
load net final_output[1] -attr @rip(#000000) final_output[1] -pin u_m5_output_handling final_output[1] -pin u_m7_fifo final_output[1]
load net mac_result[19] -attr @rip(#000000) mac_result[19] -pin u_m3_mac mac_result[19] -pin u_m5_output_handling mac_result[19]
load net kernel_wr_en -port kernel_wr_en -pin u_m4_kernel_storage kernel_wr_en
netloc kernel_wr_en 1 0 4 NJ 590 NJ 590 NJ 590 NJ
load net mac_result[10] -attr @rip(#000000) mac_result[10] -pin u_m3_mac mac_result[10] -pin u_m5_output_handling mac_result[10]
load net clk -port clk -pin clk_IBUF_inst I
netloc clk 1 0 1 NJ
load net prev_row2_pixel[5] -attr @rip(#000000) prev_row2_pixel[5] -pin u_m1_line_buffer prev_row2_pixel[5] -pin u_m3_mac col_row0[5]
load net output_pixel[6] -attr @rip(#000000) output_pixel[6] -port output_pixel[6] -pin u_m7_fifo output_pixel[6]
load net prev_row2_pixel[0] -attr @rip(#000000) prev_row2_pixel[0] -pin u_m1_line_buffer prev_row2_pixel[0] -pin u_m3_mac col_row0[0]
load net tap_data[5] -attr @rip(#000000) tap_data[5] -pin u_m3_mac tap_data[5] -pin u_m4_kernel_storage tap_data[5]
load net final_output[8] -attr @rip(#000000) final_output[8] -pin u_m5_output_handling final_output[8] -pin u_m7_fifo final_output[8]
load net pixel_in[4] -attr @rip(#000000) pixel_in[4] -port pixel_in[4] -pin u_m1_line_buffer pixel_in[4]
load net relu_enable -port relu_enable -pin u_m5_output_handling relu_enable
netloc relu_enable 1 0 6 NJ 390 NJ 390 NJ 390 NJ 390 NJ 390 1550J
load net start -port start -pin u_m6_control_fsm start
netloc start 1 0 8 NJ 430 NJ 430 NJ 430 NJ 430 NJ 430 NJ 430 1910J 450 NJ
load net kernel_wr_data[7] -attr @rip(#000000) kernel_wr_data[7] -port kernel_wr_data[7] -pin u_m4_kernel_storage kernel_wr_data[7]
load net final_output[14] -attr @rip(#000000) final_output[14] -pin u_m5_output_handling final_output[14] -pin u_m7_fifo final_output[14]
load net mac_result[8] -attr @rip(#000000) mac_result[8] -pin u_m3_mac mac_result[8] -pin u_m5_output_handling mac_result[8]
load net tap_data[2] -attr @rip(#000000) tap_data[2] -pin u_m3_mac tap_data[2] -pin u_m4_kernel_storage tap_data[2]
load net tap_idx[0] -attr @rip(#000000) tap_idx[0] -pin u_m3_mac tap_idx[0] -pin u_m4_kernel_storage tap_idx[0]
load net curr_row_pixel[6] -attr @rip(#000000) curr_row_pixel[6] -pin u_m1_line_buffer curr_row_pixel[6] -pin u_m3_mac col_row2[6]
load net output_pixel[2] -attr @rip(#000000) output_pixel[2] -port output_pixel[2] -pin u_m7_fifo output_pixel[2]
load net mac_result[3] -attr @rip(#000000) mac_result[3] -pin u_m3_mac mac_result[3] -pin u_m5_output_handling mac_result[3]
load net busy -port busy -pin u_m6_control_fsm busy
netloc busy 1 8 1 NJ
load net curr_row_pixel[3] -attr @rip(#000000) curr_row_pixel[3] -pin u_m1_line_buffer curr_row_pixel[3] -pin u_m3_mac col_row2[3]
load net kernel_wr_addr[1] -attr @rip(#000000) kernel_wr_addr[1] -port kernel_wr_addr[1] -pin u_m4_kernel_storage kernel_wr_addr[1]
load net kernel_wr_data[4] -attr @rip(#000000) kernel_wr_data[4] -port kernel_wr_data[4] -pin u_m4_kernel_storage kernel_wr_data[4]
load net prev_row1_pixel[5] -attr @rip(#000000) prev_row1_pixel[5] -pin u_m1_line_buffer prev_row1_pixel[5] -pin u_m3_mac col_row1[5]
load net final_output[13] -attr @rip(#000000) final_output[13] -pin u_m5_output_handling final_output[13] -pin u_m7_fifo final_output[13]
load net mac_result[17] -attr @rip(#000000) mac_result[17] -pin u_m3_mac mac_result[17] -pin u_m5_output_handling mac_result[17]
load net final_output[9] -attr @rip(#000000) final_output[9] -pin u_m5_output_handling final_output[9] -pin u_m7_fifo final_output[9]
load net pixel_in_valid -port pixel_in_valid -pin u_m6_control_fsm pixel_in_valid
netloc pixel_in_valid 1 0 8 NJ 410 NJ 410 NJ 410 NJ 410 NJ 410 NJ 410 NJ 410 NJ
load net rst -port rst -pin u_m2_window_generator rst -pin u_m3_mac rst -pin u_m5_output_handling rst -pin u_m6_control_fsm rst -pin u_m7_fifo rst
netloc rst 1 0 8 NJ 210 NJ 210 NJ 210 800 210 1170 330 1570 290 1930 430 NJ
load net mac_result[0] -attr @rip(#000000) mac_result[0] -pin u_m3_mac mac_result[0] -pin u_m5_output_handling mac_result[0]
load net output_pixel[13] -attr @rip(#000000) output_pixel[13] -port output_pixel[13] -pin u_m7_fifo output_pixel[13]
load net output_pixel[9] -attr @rip(#000000) output_pixel[9] -port output_pixel[9] -pin u_m7_fifo output_pixel[9]
load net tap_data[3] -attr @rip(#000000) tap_data[3] -pin u_m3_mac tap_data[3] -pin u_m4_kernel_storage tap_data[3]
load net final_output[6] -attr @rip(#000000) final_output[6] -pin u_m5_output_handling final_output[6] -pin u_m7_fifo final_output[6]
load net pixel_in[2] -attr @rip(#000000) pixel_in[2] -port pixel_in[2] -pin u_m1_line_buffer pixel_in[2]
load net prev_row1_pixel[4] -attr @rip(#000000) prev_row1_pixel[4] -pin u_m1_line_buffer prev_row1_pixel[4] -pin u_m3_mac col_row1[4]
load net mac_result[12] -attr @rip(#000000) mac_result[12] -pin u_m3_mac mac_result[12] -pin u_m5_output_handling mac_result[12]
load net kernel_wr_data[1] -attr @rip(#000000) kernel_wr_data[1] -port kernel_wr_data[1] -pin u_m4_kernel_storage kernel_wr_data[1]
load net pass_reset -pin u_m2_window_generator pass_reset -pin u_m6_control_fsm pass_reset -pin u_m7_fifo fifo_pass_reset
netloc pass_reset 1 3 6 820 230 1130J 350 NJ 350 1970 310 NJ 310 2650
load net pixel_in[7] -attr @rip(#000000) pixel_in[7] -port pixel_in[7] -pin u_m1_line_buffer pixel_in[7]
load net pixel_valid_in -pin u_m1_line_buffer pixel_valid_in -pin u_m6_control_fsm pixel_valid_in
netloc pixel_valid_in 1 2 7 420 170 740J 150 1130J 30 1530J 310 1950J 290 NJ 290 2670
load net prev_row2_pixel[7] -attr @rip(#000000) prev_row2_pixel[7] -pin u_m1_line_buffer prev_row2_pixel[7] -pin u_m3_mac col_row0[7]
load net tap_idx[3] -attr @rip(#000000) tap_idx[3] -pin u_m3_mac tap_idx[3] -pin u_m4_kernel_storage tap_idx[3]
load net mac_result[6] -attr @rip(#000000) mac_result[6] -pin u_m3_mac mac_result[6] -pin u_m5_output_handling mac_result[6]
load net prev_row2_pixel[2] -attr @rip(#000000) prev_row2_pixel[2] -pin u_m1_line_buffer prev_row2_pixel[2] -pin u_m3_mac col_row0[2]
load net tap_data[0] -attr @rip(#000000) tap_data[0] -pin u_m3_mac tap_data[0] -pin u_m4_kernel_storage tap_data[0]
load net kernel_wr_addr[2] -attr @rip(#000000) kernel_wr_addr[2] -port kernel_wr_addr[2] -pin u_m4_kernel_storage kernel_wr_addr[2]
load net output_pixel[0] -attr @rip(#000000) output_pixel[0] -port output_pixel[0] -pin u_m7_fifo output_pixel[0]
load net output_pixel[3] -attr @rip(#000000) output_pixel[3] -port output_pixel[3] -pin u_m7_fifo output_pixel[3]
load net output_pixel[8] -attr @rip(#000000) output_pixel[8] -port output_pixel[8] -pin u_m7_fifo output_pixel[8]
load net kernel_wr_data[0] -attr @rip(#000000) kernel_wr_data[0] -port kernel_wr_data[0] -pin u_m4_kernel_storage kernel_wr_data[0]
load net output_pixel[10] -attr @rip(#000000) output_pixel[10] -port output_pixel[10] -pin u_m7_fifo output_pixel[10]
load net mac_result[15] -attr @rip(#000000) mac_result[15] -pin u_m3_mac mac_result[15] -pin u_m5_output_handling mac_result[15]
load net final_output[7] -attr @rip(#000000) final_output[7] -pin u_m5_output_handling final_output[7] -pin u_m7_fifo final_output[7]
load net mac_result_valid -pin u_m3_mac mac_result_valid -pin u_m5_output_handling mac_result_valid
netloc mac_result_valid 1 5 1 N
load net prev_row1_pixel[7] -attr @rip(#000000) prev_row1_pixel[7] -pin u_m1_line_buffer prev_row1_pixel[7] -pin u_m3_mac col_row1[7]
load net prev_row2_pixel[1] -attr @rip(#000000) prev_row2_pixel[1] -pin u_m1_line_buffer prev_row2_pixel[1] -pin u_m3_mac col_row0[1]
load net mac_result[5] -attr @rip(#000000) mac_result[5] -pin u_m3_mac mac_result[5] -pin u_m5_output_handling mac_result[5]
load net tap_data[1] -attr @rip(#000000) tap_data[1] -pin u_m3_mac tap_data[1] -pin u_m4_kernel_storage tap_data[1]
load net final_output[4] -attr @rip(#000000) final_output[4] -pin u_m5_output_handling final_output[4] -pin u_m7_fifo final_output[4]
load net kernel_wr_data[6] -attr @rip(#000000) kernel_wr_data[6] -port kernel_wr_data[6] -pin u_m4_kernel_storage kernel_wr_data[6]
load net curr_row_pixel[5] -attr @rip(#000000) curr_row_pixel[5] -pin u_m1_line_buffer curr_row_pixel[5] -pin u_m3_mac col_row2[5]
load net output_pixel[1] -attr @rip(#000000) output_pixel[1] -port output_pixel[1] -pin u_m7_fifo output_pixel[1]
load net pixel_in[0] -attr @rip(#000000) pixel_in[0] -port pixel_in[0] -pin u_m1_line_buffer pixel_in[0]
load net window_valid -pin u_m2_window_generator window_valid -pin u_m3_mac window_valid
netloc window_valid 1 4 1 1210
load net mac_result[2] -attr @rip(#000000) mac_result[2] -pin u_m3_mac mac_result[2] -pin u_m5_output_handling mac_result[2]
load net final_output[15] -attr @rip(#000000) final_output[15] -pin u_m5_output_handling final_output[15] -pin u_m7_fifo final_output[15]
load net mac_result[9] -attr @rip(#000000) mac_result[9] -pin u_m3_mac mac_result[9] -pin u_m5_output_handling mac_result[9]
load net pixel_in[5] -attr @rip(#000000) pixel_in[5] -port pixel_in[5] -pin u_m1_line_buffer pixel_in[5]
load net tap_idx[1] -attr @rip(#000000) tap_idx[1] -pin u_m3_mac tap_idx[1] -pin u_m4_kernel_storage tap_idx[1]
load net final_output[10] -attr @rip(#000000) final_output[10] -pin u_m5_output_handling final_output[10] -pin u_m7_fifo final_output[10]
load net curr_row_pixel[2] -attr @rip(#000000) curr_row_pixel[2] -pin u_m1_line_buffer curr_row_pixel[2] -pin u_m3_mac col_row2[2]
load net done -port done -pin u_m6_control_fsm done
netloc done 1 8 1 NJ
load net kernel_wr_addr[0] -attr @rip(#000000) kernel_wr_addr[0] -port kernel_wr_addr[0] -pin u_m4_kernel_storage kernel_wr_addr[0]
load net kernel_wr_data[3] -attr @rip(#000000) kernel_wr_data[3] -port kernel_wr_data[3] -pin u_m4_kernel_storage kernel_wr_data[3]
load net pixel_valid_out -pin u_m1_line_buffer pixel_valid_out -pin u_m2_window_generator pixel_valid_in -pin u_m3_mac pixel_valid
netloc pixel_valid_out 1 3 2 780 190 NJ
load net output_pixel[15] -attr @rip(#000000) output_pixel[15] -port output_pixel[15] -pin u_m7_fifo output_pixel[15]
load net prev_row1_pixel[1] -attr @rip(#000000) prev_row1_pixel[1] -pin u_m1_line_buffer prev_row1_pixel[1] -pin u_m3_mac col_row1[1]
load net prev_row1_pixel[6] -attr @rip(#000000) prev_row1_pixel[6] -pin u_m1_line_buffer prev_row1_pixel[6] -pin u_m3_mac col_row1[6]
load net mac_result[18] -attr @rip(#000000) mac_result[18] -pin u_m3_mac mac_result[18] -pin u_m5_output_handling mac_result[18]
load net mac_result[14] -attr @rip(#000000) mac_result[14] -pin u_m3_mac mac_result[14] -pin u_m5_output_handling mac_result[14]
load net output_pixel[12] -attr @rip(#000000) output_pixel[12] -port output_pixel[12] -pin u_m7_fifo output_pixel[12]
load net tap_valid -pin u_m3_mac tap_valid -pin u_m4_kernel_storage tap_valid
netloc tap_valid 1 4 1 1230
load net final_output[5] -attr @rip(#000000) final_output[5] -pin u_m5_output_handling final_output[5] -pin u_m7_fifo final_output[5]
load net prev_row2_pixel[4] -attr @rip(#000000) prev_row2_pixel[4] -pin u_m1_line_buffer prev_row2_pixel[4] -pin u_m3_mac col_row0[4]
load net mac_result[11] -attr @rip(#000000) mac_result[11] -pin u_m3_mac mac_result[11] -pin u_m5_output_handling mac_result[11]
load net final_output[2] -attr @rip(#000000) final_output[2] -pin u_m5_output_handling final_output[2] -pin u_m7_fifo final_output[2]
load net final_output_valid -pin u_m5_output_handling final_output_valid -pin u_m7_fifo final_output_valid
netloc final_output_valid 1 6 1 1930
load net output_pixel[5] -attr @rip(#000000) output_pixel[5] -port output_pixel[5] -pin u_m7_fifo output_pixel[5]
load net pixel_in[3] -attr @rip(#000000) pixel_in[3] -port pixel_in[3] -pin u_m1_line_buffer pixel_in[3]
load net prev_row1_pixel[0] -attr @rip(#000000) prev_row1_pixel[0] -pin u_m1_line_buffer prev_row1_pixel[0] -pin u_m3_mac col_row1[0]
load net frame_done -port frame_done -pin u_m6_control_fsm fifo_all_outputs_done -pin u_m7_fifo fifo_all_outputs_done
netloc frame_done 1 7 2 2330 190 NJ
load net kernel_wr_data[2] -attr @rip(#000000) kernel_wr_data[2] -port kernel_wr_data[2] -pin u_m4_kernel_storage kernel_wr_data[2]
load net tap_data[6] -attr @rip(#000000) tap_data[6] -pin u_m3_mac tap_data[6] -pin u_m4_kernel_storage tap_data[6]
load net kernel_select[0] -attr @rip(#000000) kernel_select[0] -port kernel_select[0] -pin u_m4_kernel_storage kernel_select[0]
netloc kernel_select[0] 1 0 4 NJ 510 NJ 510 NJ 510 NJ
load net mac_result[7] -attr @rip(#000000) mac_result[7] -pin u_m3_mac mac_result[7] -pin u_m5_output_handling mac_result[7]
load net prev_row2_pixel[3] -attr @rip(#000000) prev_row2_pixel[3] -pin u_m1_line_buffer prev_row2_pixel[3] -pin u_m3_mac col_row0[3]
load net kernel_wr_addr[3] -attr @rip(#000000) kernel_wr_addr[3] -port kernel_wr_addr[3] -pin u_m4_kernel_storage kernel_wr_addr[3]
load net output_pixel[4] -attr @rip(#000000) output_pixel[4] -port output_pixel[4] -pin u_m7_fifo output_pixel[4]
load net output_valid -port output_valid -pin u_m7_fifo output_valid
netloc output_valid 1 7 2 NJ 230 NJ
load netBundle @tap_data 8 tap_data[7] tap_data[6] tap_data[5] tap_data[4] tap_data[3] tap_data[2] tap_data[1] tap_data[0] -autobundled
netbloc @tap_data 1 4 1 1150
load netBundle @prev_row2_pixel 8 prev_row2_pixel[7] prev_row2_pixel[6] prev_row2_pixel[5] prev_row2_pixel[4] prev_row2_pixel[3] prev_row2_pixel[2] prev_row2_pixel[1] prev_row2_pixel[0] -autobundled
netbloc @prev_row2_pixel 1 3 2 NJ 130 N
load netBundle @final_output 16 final_output[15] final_output[14] final_output[13] final_output[12] final_output[11] final_output[10] final_output[9] final_output[8] final_output[7] final_output[6] final_output[5] final_output[4] final_output[3] final_output[2] final_output[1] final_output[0] -autobundled
netbloc @final_output 1 6 1 1950
load netBundle @kernel_wr_addr 4 kernel_wr_addr[3] kernel_wr_addr[2] kernel_wr_addr[1] kernel_wr_addr[0] -autobundled
netbloc @kernel_wr_addr 1 0 4 NJ 530 NJ 530 NJ 530 NJ
load netBundle @prev_row1_pixel 8 prev_row1_pixel[7] prev_row1_pixel[6] prev_row1_pixel[5] prev_row1_pixel[4] prev_row1_pixel[3] prev_row1_pixel[2] prev_row1_pixel[1] prev_row1_pixel[0] -autobundled
netbloc @prev_row1_pixel 1 3 2 NJ 110 1150
load netBundle @pixel_in 8 pixel_in[7] pixel_in[6] pixel_in[5] pixel_in[4] pixel_in[3] pixel_in[2] pixel_in[1] pixel_in[0] -autobundled
netbloc @pixel_in 1 0 3 NJ 20 NJ 20 360J
load netBundle @tap_idx 4 tap_idx[3] tap_idx[2] tap_idx[1] tap_idx[0] -autobundled
netbloc @tap_idx 1 4 1 1190
load netBundle @curr_row_pixel 8 curr_row_pixel[7] curr_row_pixel[6] curr_row_pixel[5] curr_row_pixel[4] curr_row_pixel[3] curr_row_pixel[2] curr_row_pixel[1] curr_row_pixel[0] -autobundled
netbloc @curr_row_pixel 1 3 2 NJ 70 1230
load netBundle @mac_result 20 mac_result[19] mac_result[18] mac_result[17] mac_result[16] mac_result[15] mac_result[14] mac_result[13] mac_result[12] mac_result[11] mac_result[10] mac_result[9] mac_result[8] mac_result[7] mac_result[6] mac_result[5] mac_result[4] mac_result[3] mac_result[2] mac_result[1] mac_result[0] -autobundled
netbloc @mac_result 1 5 1 N
load netBundle @output_pixel 16 output_pixel[15] output_pixel[14] output_pixel[13] output_pixel[12] output_pixel[11] output_pixel[10] output_pixel[9] output_pixel[8] output_pixel[7] output_pixel[6] output_pixel[5] output_pixel[4] output_pixel[3] output_pixel[2] output_pixel[1] output_pixel[0] -autobundled
netbloc @output_pixel 1 7 2 NJ 210 NJ
load netBundle @kernel_wr_data 8 kernel_wr_data[7] kernel_wr_data[6] kernel_wr_data[5] kernel_wr_data[4] kernel_wr_data[3] kernel_wr_data[2] kernel_wr_data[1] kernel_wr_data[0] -autobundled
netbloc @kernel_wr_data 1 0 4 NJ 570 NJ 570 NJ 570 NJ
levelinfo -pg 1 0 40 220 530 960 1340 1720 2120 2480 2690 -top 0 -bot 630
show
fullfit
#
# initialize ictrl to current module cnn_accelerator_top work:cnn_accelerator_top:NOFILE
ictrl init topinfo |
ictrl layer glayer install
ictrl layer glayer config ibundle 1
ictrl layer glayer config nbundle 0
ictrl layer glayer config pbundle 0
ictrl layer glayer config cache 1
