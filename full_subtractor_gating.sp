* Full Subtractor using CMOS
.include '22nm_bulk_cmos.pm'
.trans 1p 60ns
.options post

*Power Supply
vSupply Vdd 0 0.7v
vGround Vss 0 0v

*Power Supply global
.global Vdd
.global Vss

*Sub ckt
.subckt HFSUB1 A B diff1 borrow1
MP22 N12 A1 Vdd Vdd PMOS W=88n L=22n
MP23 N13 A Vdd Vdd PMOS W=88n L=22n
MP24 N14 A1 Vdd Vdd PMOS W=88n L=22n
MP25 N15 B Vdd Vdd PMOS W=88n L=22n
MP31 N21 A Vdd Vdd PMOS W=88n L=22n
MP32 N22 B Vdd Vdd PMOS W=88n L=22n
MP33 N23 op12 Vdd Vdd PMOS W=88n L=22n
MP1 A1 A N21 Vdd PMOS W=88n L=22n
MN1 A1 A Vss Vss NMOS W=44n L=22n
MP2 B1 B N22 Vdd PMOS W=88n L=22n
MN2 B1 B Vss Vss NMOS W=44n L=22n
MP3 N1 A1 N12 Vdd PMOS W=88n L=22n
MP4 N2 A N13 Vdd PMOS W=88n L=22n
MP5 diff1 B N1 Vdd PMOS W=88n L=22n
MP6 diff1 B1 N2 Vdd PMOS W=88n L=22n
MN3 diff1 A N3 Vss NMOS W=44n L=22n
MN4 diff1 A1 N4 Vss NMOS W=44n L=22n
MN5 N3 B Vss Vss NMOS W=44n L=22n
MN6 N4 B1 Vss Vss NMOS W=44n L=22n
MP7 op12 A1 Vdd N14 PMOS W=88n L=22n
MP8 op12 B Vdd N15 PMOS W=88n L=22n
MN7 op12 A1 N5 Vss NMOS W=44n L=22n
MN8 N5 B Vss Vss NMOS W=44n L=22n
MP9 borrow1 op12 N23 Vdd PMOS W=88n L=22n
MN9 borrow1 op12 Vss Vss NMOS W=44n L=22n
.ends

.subckt HFSUB2 diff1 Bin diff borrow
MP26 N16 diff11 Vdd Vdd PMOS W=88n L=22n
MP27 N17 diff1 Vdd Vdd PMOS W=88n L=22n
MP28 N18 diff11 Vdd Vdd PMOS W=88n L=22n
MP29 N19 Bin Vdd Vdd PMOS W=88n L=22n
MP34 N24 diff1 Vdd Vdd PMOS W=88n L=22n
MP35 N25 Bin Vdd Vdd PMOS W=88n L=22n
MP36 N26 op22 Vdd Vdd PMOS W=88n L=22n
MP10 diff11 diff1 N24 Vdd PMOS W=88n L=22n
MN10 diff11 diff1 Vss Vss NMOS W=44n L=22n
MP11 Bin1 Bin N25 Vdd PMOS W=88n L=22n
MN11 Bin1 Bin Vss Vss NMOS W=44n L=22n
MP12 N6 diff11 N16 Vdd PMOS W=88n L=22n
MP13 N7 diff1 N17 Vdd PMOS W=88n L=22n
MP14 diff Bin N6 Vdd PMOS W=88n L=22n
MP15 diff Bin1 N7 Vdd PMOS W=88n L=22n
MN12 diff diff1 N8 Vss NMOS W=44n L=22n
MN13 diff diff11 N9 Vss NMOS W=44n L=22n
MN14 N8 Bin Vss Vss NMOS W=44n L=22n
MN15 N9 Bin1 Vss Vss NMOS W=44n L=22n
MP16 op22 diff11 N18 Vdd PMOS W=88n L=22n
MP17 op22 Bin Vdd N19 PMOS W=88n L=22n
MN16 op22 diff11 N10 Vss NMOS W=44n L=22n
MN17 N10 Bin Vss Vss NMOS W=44n L=22n
MP18 borrow op22 N26 Vdd PMOS W=88n L=22n
MN18 borrow op22 Vss Vss NMOS W=44n L=22n
.ends

.subckt OR borrow borrow1 Bo
MP30 N20 borrow Vdd Vdd PMOS W=88n L=22n
MP37 N27 op33 Vdd Vdd PMOS W=88n L=22n
MP19 N11 borrow N20 Vdd PMOS W=88n L=22n
MP20 op33 borrow1 N11 Vdd PMOS W=88n L=22n
MN19 op33 borrow Vss Vss NMOS W=44n L=22n
MN20 op33 borrow1 Vss Vss NMOS W=44n L=22n
MP21 Bo op33 N27 Vdd PMOS W=88n L=22n
MN21 Bo op33 Vss Vss NMOS W=44n L=22n
.ends

*Main Circuit
Xhfsub1 A B diff1 borrow1 HFSUB1
Xhfsub2 diff1 Bin diff borrow HFSUB2
Xor borrow borrow1 Bo OR

*Input Signals
VA A Vss pulse (0 0.7 1.99ns 0.01ns 0.01ns 1.99ns 4ns)
VB B Vss pulse (0 0.7 0.99ns 0.01ns 0.01ns 0.99ns 2ns)
VBin Bin Vss pulse (0 0.7 0.49ns 0.01ns 0.01ns 0.49ns 1ns)
VC C Vss pulse (0.7 0 0.99ns 0.01ns 0.01ns 1.99ns 4ns)

*delay
.measure TRAN tphl TRIG v(Bin) val=0.35 rise=1 td=0n TARG v(diff) val=0.35 fall=1
.measure TRAN tplh TRIG v(Bin) val=0.35 fall=1 td=0n TARG v(diff) val=0.35 rise=2
.print tphl
.print tplh

*Dynamic power
.measure dynpower avg power from 0n to 60n
.print dynower

.end