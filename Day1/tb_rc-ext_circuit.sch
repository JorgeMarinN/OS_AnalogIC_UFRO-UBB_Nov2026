v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1430 -1380 1430 -1340 {
lab=GND}
N 1430 -1450 1430 -1440 {
lab=vin}
N 1430 -1450 1510 -1450 {
lab=vin}
N 1570 -1450 1640 -1450 {
lab=vin}
N 1640 -1450 1640 -1430 {
lab=vin}
N 1640 -1370 1640 -1340 {
lab=GND}
C {devices/res.sym} 1540 -1450 1 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 1640 -1400 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1640 -1340 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 1430 -1340 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 1430 -1410 0 0 {name=V1 value=1 savecurrent=false}
C {devices/code_shown.sym} 1780 -1430 0 0 {name=s1 only_toplevel=false 
value="
.tran 100p 20n
.save all
.ic v(vout) = 0
.control
run
meas tran teval WHEN v(vout) = 0.63
let res_val = 1000
let cap_val = teval/res_val
print cap_val
.endc
"}
C {devices/lab_pin.sym} 1470 -1450 1 0 {name=p1 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 1610 -1450 1 0 {name=p2 sig_type=std_logic lab=vout}
