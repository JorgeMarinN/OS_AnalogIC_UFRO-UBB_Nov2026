v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
L 4 160 -560 160 -360 {}
L 4 860 -560 860 -360 {}
L 4 160 -360 860 -360 {}
L 4 160 -560 860 -560 {}
T {SHORT-PULSE GENERATOR} 390 -590 0 0 0.4 0.4 {}
N 410 -420 410 -380 {
lab=dly_in}
N 530 -480 530 -420 {
lab=dly_out}
N 410 -520 430 -520 {
lab=dly_in}
N 410 -520 410 -420 {
lab=dly_in}
N 630 -420 650 -420 {
lab=#net1}
N 410 -380 650 -380 {
lab=dly_in}
N 510 -520 650 -520 {
lab=#net2}
N 290 -420 310 -420 {
lab=#net3}
N 530 -480 650 -480 {
lab=dly_out}
N 530 -420 550 -420 {
lab=dly_out}
N 140 -420 210 -420 {
lab=VIN}
N 770 -500 880 -500 {
lab=VFE}
N 770 -400 880 -400 {
lab=VRE}
N 390 -420 410 -420 {
lab=dly_in}
C {devices/iopin.sym} 140 -420 2 0 {name=p1 lab=VIN}
C {devices/iopin.sym} 880 -500 0 0 {name=p2 lab=VFE}
C {devices/iopin.sym} 880 -400 0 0 {name=p3 lab=VRE}
C {devices/iopin.sym} 140 -660 2 0 {name=p4 lab=VCC}
C {devices/iopin.sym} 140 -620 2 0 {name=p5 lab=VSS}
C {devices/lab_pin.sym} 410 -460 0 0 {name=p12 sig_type=std_logic lab=dly_in}
C {devices/lab_pin.sym} 530 -460 0 0 {name=p13 sig_type=std_logic lab=dly_out}
C {devices/lab_pin.sym} 540 -120 0 0 {name=p7 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 520 -200 0 0 {name=p8 sig_type=std_logic lab=VCC}
C {sg13g2_stdcells/sg13g2_inv_1.sym} 470 -520 0 0 {name=x2 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 350 -420 0 0 {name=x3 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 590 -420 0 0 {name=x4 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_2.sym} 250 -420 0 0 {name=x5 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_and2_2.sym} 710 -500 0 0 {name=x7 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_and2_2.sym} 710 -400 0 0 {name=x8 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {../large_delay/large_delay_vto1p1.sym} 480 -160 0 0 {name=x9}
C {devices/lab_pin.sym} 360 -160 0 0 {name=p9 sig_type=std_logic lab=dly_in}
C {devices/lab_pin.sym} 660 -160 0 1 {name=p6 sig_type=std_logic lab=dly_out}
