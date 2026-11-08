v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 610 -550 640 -550 {lab=vin}
N 720 -550 750 -550 {lab=vout}
N 670 -515 670 -490 {lab=GND}
N 670 -620 670 -585 {lab=vdd}
C {devices/code_shown.sym} 210 -650 0 0 {name=NGSPICE
only_toplevel=true
value="

vin vin 0 dc=0.6
vdd vdd 0 dc=1.2

.control
save all

dc vin 0 1.2 0.01

plot v(vout)


.endc
" }
C {devices/iopin.sym} 610 -550 0 1 {name=p2 lab=vin}
C {devices/gnd.sym} 670 -490 0 0 {name=l3 lab=GND}
C {devices/code_shown.sym} 220 -300 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
C {inv_1_manual.sym} 670 -670 0 0 {name=x1}
C {devices/iopin.sym} 750 -550 0 0 {name=p1 lab=vout}
C {devices/iopin.sym} 670 -620 1 1 {name=p3 lab=vdd}
