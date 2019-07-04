#PACE: Start of Constraints generated by PACE


#PACE: Start of PACE I/O Pin Assignments
#NET "clk"  LOC = E3	| IOSTANDARD = LVCMOS33; 
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
#NET "enable"  LOC=J15 | IOSTANDARD=LVCMOS33; 
#NET "input"  LOC=L16 | IOSTANDARD=LVCMOS33; 
#NET "reset"  LOC=M13 | IOSTANDARD=LVCMOS33; 

set_property -dict { PACKAGE_PIN P18  IOSTANDARD LVCMOS33 } [get_ports { reset_async }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { start }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { finish }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { ready }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { done_led }]; #IO_L24N_T3_RS0_15 Sch=sw[0]

set_property -dict { PACKAGE_PIN J15  IOSTANDARD LVCMOS33 } [get_ports { divisor[0] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { divisor[1] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { divisor[2] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN R15  IOSTANDARD LVCMOS33 } [get_ports { divisor[3] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { divisor[4] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { divisor[5] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { divisor[6] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { divisor[7] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]

set_property -dict { PACKAGE_PIN T8  IOSTANDARD LVCMOS33 } [get_ports { dividend[0] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN U8  IOSTANDARD LVCMOS33 } [get_ports { dividend[1] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN R16  IOSTANDARD LVCMOS33 } [get_ports { dividend[2] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN T13  IOSTANDARD LVCMOS33 } [get_ports { dividend[3] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN H6   IOSTANDARD LVCMOS33 } [get_ports { dividend[4] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { dividend[5] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN U11  IOSTANDARD LVCMOS33 } [get_ports { dividend[6] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { dividend[7] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]



set_property -dict { PACKAGE_PIN H17  IOSTANDARD LVCMOS33 } [get_ports { current_state_led[0] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN K15  IOSTANDARD LVCMOS33 } [get_ports { current_state_led[1] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN J13  IOSTANDARD LVCMOS33 } [get_ports { current_state_led[2] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN N14  IOSTANDARD LVCMOS33 } [get_ports { current_state_led[3] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]

#NET "led_next<0>"  LOC=H17 | IOSTANDARD=LVCMOS33;
#NET "led_next<1>"  LOC=K15 | IOSTANDARD=LVCMOS33; 
#NET "led_next<2>"  LOC=J13 | IOSTANDARD=LVCMOS33;
#NET "led_next<3>"  LOC=N14 | IOSTANDARD=LVCMOS33;
#NET "led_next<4>"  LOC=R18 | IOSTANDARD=LVCMOS33; 
#NET "led_next<5>"  LOC=V17 | IOSTANDARD=LVCMOS33;
#NET "led_next<6>"  LOC=U17 | IOSTANDARD=LVCMOS33;
#NET "led_next<7>"  LOC=U16 | IOSTANDARD=LVCMOS33;

set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { seg_out[0] }];
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { seg_out[1] }]; #IO_L24N_T3_A00_D16_14 Sch=ca
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { seg_out[2] }]; #IO_25_14 Sch=cb
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { seg_out[3] }]; #IO_25_15 Sch=cc
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { seg_out[4] }]; #IO_L17P_T2_A26_15 Sch=cd
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { seg_out[5] }]; #IO_L13P_T2_MRCC_14 Sch=ce
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { seg_out[6] }]; #IO_L19P_T3_A10_D26_14 Sch=cf
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { seg_out[7] }]; #IO_L4P_T0_D04_14 Sch=cg

#NET "seg_out<0>"  LOC=H15 | IOSTANDARD=LVCMOS33;
#NET "seg_out<1>"  LOC=T10 | IOSTANDARD=LVCMOS33; 
#NET "seg_out<2>"  LOC=R10 | IOSTANDARD=LVCMOS33;
#NET "seg_out<3>"  LOC=K16 | IOSTANDARD=LVCMOS33;
#NET "seg_out<4>"  LOC=K13 | IOSTANDARD=LVCMOS33; 
#NET "seg_out<5>"  LOC=P15 | IOSTANDARD=LVCMOS33;
#NET "seg_out<6>"  LOC=T11 | IOSTANDARD=LVCMOS33;
#NET "seg_out<7>"  LOC=L18 | IOSTANDARD=LVCMOS33;

set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { seg_sel[0] }]; #IO_L23P_T3_FOE_B_15 Sch=an[0]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { seg_sel[1] }]; #IO_L23N_T3_FWE_B_15 Sch=an[1]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { seg_sel[2] }]; #IO_L24P_T3_A01_D17_14 Sch=an[2]
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { seg_sel[3] }]; #IO_L19P_T3_A22_15 Sch=an[3]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { seg_sel[4] }]; #IO_L8N_T1_D12_14 Sch=an[4]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { seg_sel[5] }]; #IO_L14P_T2_SRCC_14 Sch=an[5]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { seg_sel[6] }]; #IO_L23P_T3_35 Sch=an[6]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { seg_sel[7] }]; #IO_L23N_T3_A02_D18_14 Sch=an[7]

#NET "seg_sel<0>"  LOC=J17 | IOSTANDARD=LVCMOS33; 
#NET "seg_sel<1>"  LOC=J18 | IOSTANDARD=LVCMOS33;
#NET "seg_sel<2>"  LOC=T9 | IOSTANDARD=LVCMOS33; 
#NET "seg_sel<3>"  LOC=J14 | IOSTANDARD=LVCMOS33; 
#NET "seg_sel<4>"  LOC=P14 | IOSTANDARD=LVCMOS33; 
#NET "seg_sel<5>"  LOC=T14 | IOSTANDARD=LVCMOS33; 
#NET "seg_sel<6>"  LOC=K2 | IOSTANDARD=LVCMOS33; 
#NET "seg_sel<7>"  LOC=U13 | IOSTANDARD=LVCMOS33; 


#PACE: Start of PACE Area Constraints

#PACE: Start of PACE Prohibit Constraints

#PACE: End of Constraints generated by PACE