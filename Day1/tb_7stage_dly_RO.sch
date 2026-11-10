v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1380 -380 1440 -380 {
lab=V_2}
N 1230 -510 1230 -380 {
lab=V_1}
N 1260 -380 1260 -360 {lab=V_1}
N 1230 -380 1260 -380 {lab=V_1}
N 1260 -400 1260 -380 {lab=V_1}
N 1560 -380 1620 -380 {
lab=V_3}
N 1440 -380 1440 -360 {lab=V_2}
N 1440 -400 1440 -380 {lab=V_2}
N 1740 -380 1800 -380 {
lab=V_4}
N 1620 -380 1620 -360 {lab=V_3}
N 1620 -400 1620 -380 {lab=V_3}
N 1920 -380 1980 -380 {
lab=V_5}
N 1800 -380 1800 -360 {lab=V_4}
N 1800 -400 1800 -380 {lab=V_4}
N 2100 -380 2160 -380 {
lab=V_1}
N 1980 -380 1980 -360 {lab=V_5}
N 1980 -400 1980 -380 {lab=V_5}
N 2160 -510 2160 -380 {lab=V_1}
N 1230 -510 2160 -510 {lab=V_1}
C {devices/code_shown.sym} 1390 -780 0 0 {name=s1 only_toplevel=false value=".include /opt/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
vvcc vcc 0 dc 1.2
vvss vss 0 0
.option temp = 100
.ic v(V_1) = 0
.ic v(V_2) = 1.2

.control
   tran 10p 10n
   wrdata TT_3stage_RO_v1p1.txt v(V_1) v(V_2) v(V_3)
   wrdata TT_3stage_RO_power_v1p1.txt v(vcc) i(vvcc)
   plot v(V_1) v(V_2) v(V_3)
.endc
"}
C {devices/lab_pin.sym} 1230 -480 0 0 {name=p1 sig_type=std_logic lab=V_1}
C {devices/lab_pin.sym} 1410 -380 1 0 {name=p2 sig_type=std_logic lab=V_2}
C {devices/code_shown.sym} 1070 -770 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
C {sg13g2_nand2_2.sym} 1320 -380 0 0 {name=x8 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {devices/lab_pin.sym} 1590 -380 1 0 {name=p3 sig_type=std_logic lab=V_3}
C {sg13g2_nand2_2.sym} 1500 -380 0 0 {name=x1 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {devices/lab_pin.sym} 1770 -380 1 0 {name=p4 sig_type=std_logic lab=V_4}
C {sg13g2_nand2_2.sym} 1680 -380 0 0 {name=x2 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {devices/lab_pin.sym} 1950 -380 1 0 {name=p5 sig_type=std_logic lab=V_5}
C {sg13g2_nand2_2.sym} 1860 -380 0 0 {name=x3 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_nand2_2.sym} 2040 -380 0 0 {name=x4 VDD=VCC VSS=VSS prefix=sg13g2_ }
