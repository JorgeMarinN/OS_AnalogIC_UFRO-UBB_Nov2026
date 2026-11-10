v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1720 -210 1780 -210 {
lab=V_2,V_3,V_4,V_5,V_6,V_7,V_1}
N 1590 -210 1640 -210 {lab=V_1,V_2,V_3,V_4,V_5,V_6,V_7}
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
C {devices/lab_pin.sym} 1750 -210 1 0 {name=p2 sig_type=std_logic lab=V_2,V_3,V_4,V_5,V_6,V_7,V_1}
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
C {sg13g2_inv_2.sym} 1680 -210 0 0 {name=x1[0:6] VDD=VCC VSS=VSS prefix=sg13g2_ }
C {devices/lab_pin.sym} 1600 -210 1 0 {name=p1 sig_type=std_logic lab=V_1,V_2,V_3,V_4,V_5,V_6,V_7}
