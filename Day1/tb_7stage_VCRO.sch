v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1310 -430 1370 -430 {
lab=V_2}
N 1450 -430 1520 -430 {
lab=V_3}
N 1230 -510 2200 -510 {
lab=V_1}
N 1230 -510 1230 -430 {
lab=V_1}
N 1600 -430 1670 -430 {
lab=V_4}
N 1750 -430 1820 -430 {
lab=V_5}
N 1900 -430 1970 -430 {
lab=V_6}
N 2050 -430 2120 -430 {
lab=V_7}
N 2200 -510 2200 -430 {lab=V_1}
C {devices/code_shown.sym} 1390 -920 0 0 {name=s1 only_toplevel=false value=".include /opt/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
vvcc vcc 0 dc 1.2
vvss vss 0 0

.control
    let idx = 0

    dowhile idx < 5
        let vdd = 0.8 + 0.1 * idx

        reset
        alter VVCC $&vdd

        tran 10p 10n

        let idx = idx + 1
    end

    * Save all transient simulation plots
    setplot const
    wrdata V1_sweep.txt tran1.v(V_1) tran2.v(V_1) tran3.v(V_1) tran4.v(V_1) tran5.v(V_1)
.endc
"}
C {devices/lab_pin.sym} 1230 -480 0 0 {name=p1 sig_type=std_logic lab=V_1}
C {devices/lab_pin.sym} 1340 -430 1 0 {name=p2 sig_type=std_logic lab=V_2}
C {devices/lab_pin.sym} 1490 -430 1 0 {name=p3 sig_type=std_logic lab=V_3}
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
C {sg13g2_inv_2.sym} 1270 -430 0 0 {name=x1 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_inv_2.sym} 1410 -430 0 0 {name=x2 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_inv_2.sym} 1560 -430 0 0 {name=x3 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {devices/lab_pin.sym} 1640 -430 1 0 {name=p4 sig_type=std_logic lab=V_4}
C {sg13g2_inv_2.sym} 1710 -430 0 0 {name=x4 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {devices/lab_pin.sym} 1790 -430 1 0 {name=p5 sig_type=std_logic lab=V_5}
C {sg13g2_inv_2.sym} 1860 -430 0 0 {name=x5 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {devices/lab_pin.sym} 1940 -430 1 0 {name=p6 sig_type=std_logic lab=V_6}
C {sg13g2_inv_2.sym} 2010 -430 0 0 {name=x6 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {devices/lab_pin.sym} 2090 -430 1 0 {name=p7 sig_type=std_logic lab=V_7}
C {sg13g2_inv_2.sym} 2160 -430 0 0 {name=x7 VDD=VCC VSS=VSS prefix=sg13g2_ }
