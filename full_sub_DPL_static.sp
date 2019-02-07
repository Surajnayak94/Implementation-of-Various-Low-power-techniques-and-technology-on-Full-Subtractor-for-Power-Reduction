*Full Subtractor using DPL Logic
.include '22nm_bulk_cmos.pm'
.trans 1p 60ns
.options post

*Power Supply
vSupply Vdd 0 0.9v
vGround Vss 0 0v

*Power supply global
.global Vdd
.global Vss

*Main Ckt
MP1 A1 A Vdd Vdd PMOS W=88n W=22n
MN1 A1 A Vss Vss NMOS W=44n W=22n
MP2 B1 B Vdd Vdd PMOS W=88n W=22n
MN2 B1 B Vss Vss NMOS W=44n W=22n
MP3 C1 C Vdd Vdd PMOS W=88n W=22n
MN3 C1 C Vss Vss NMOS W=44n W=22n
MP4 D B A Vdd PMOS W=88n W=22n
MN4 D A B1 Vss NMOS W=44n W=22n
MP5 D B1 A1 Vdd PMOS W=88n W=22n
MN5 D A1 B Vss NMOS W=44n W=22n
MP6 D1 D Vdd Vdd PMOS W=88n W=22n
MN6 D1 D Vss Vss NMOS W=44n W=22n
MP7 Diff C D Vdd PMOS W=88n W=22n
MN7 Diff C1 D Vss NMOS W=44n W=22n
MP8 Diff C1 D1 Vdd PMOS W=88n W=22n
MN8 Diff C D1 Vss NMOS W=44n W=22n
MP9 Bo D1 B Vdd PMOS W=88n W=22n
MN9 Bo D B Vss NMOS W=44n W=22n
MP10 Bo D C Vdd PMOS W=88n W=22n
MN10 Bo D1 C Vss NMOS W=44n W=22n

*Input Signals
*--------------------- input (0 0 0) ---------------------
VA A Vss pulse (0 0 1.99ns 0.01ns 0.01ns 1.99ns 4ns)
VB B Vss pulse (0 0 0.99ns 0.01ns 0.01ns 0.99ns 2ns)
VBin Bin Vss pulse (0 0 0.49ns 0.01ns 0.01ns 0.49ns 1ns)
.measure TRAN leakage_0 rms I(vSupply) FROM=10n TO=11n
.print leakage_0

*--------------------- input (0 0 1) ---------------------
.alter
VA A Vss pulse (0 0 1.99ns 0.01ns 0.01ns 1.99ns 4ns)
VB B Vss pulse (0 0 0.99ns 0.01ns 0.01ns 0.99ns 2ns)
VBin Bin Vss pulse (0.7 0.7 0.49ns 0.01ns 0.01ns 0.49ns 1ns)
.measure TRAN leakage_1 rms I(vSupply) FROM=10n TO=11n
.print leakage_1

*--------------------- input (0 1 0) ---------------------
.alter
VA A Vss pulse (0 0 1.99ns 0.01ns 0.01ns 1.99ns 4ns)
VB B Vss pulse (0.7 0.7 0.99ns 0.01ns 0.01ns 0.99ns 2ns)
VBin Bin Vss pulse (0 0 0.49ns 0.01ns 0.01ns 0.49ns 1ns)
.measure TRAN leakage_2 rms I(vSupply) FROM=10n TO=11n
.print leakage_2

*--------------------- input (0 1 1) ---------------------
.alter
VA A Vss pulse (0 0 1.99ns 0.01ns 0.01ns 1.99ns 4ns)
VB B Vss pulse (0.7 0.7 0.99ns 0.01ns 0.01ns 0.99ns 2ns)
VBin Bin Vss pulse (0.7 0.7 0.49ns 0.01ns 0.01ns 0.49ns 1ns)
.measure TRAN leakage_3 rms I(vSupply) FROM=10n TO=11n
.print leakage_3

*--------------------- input (1 0 0) ---------------------
.alter
VA A Vss pulse (0.7 0.7 1.99ns 0.01ns 0.01ns 1.99ns 4ns)
VB B Vss pulse (0 0 0.99ns 0.01ns 0.01ns 0.99ns 2ns)
VBin Bin Vss pulse (0 0 0.49ns 0.01ns 0.01ns 0.49ns 1ns)
.measure TRAN leakage_4 rms I(vSupply) FROM=10n TO=11n
.print leakage_4

*--------------------- input (1 0 1) ---------------------
.alter
VA A Vss pulse (0.7 0.7 1.99ns 0.01ns 0.01ns 1.99ns 4ns)
VB B Vss pulse (0 0 0.99ns 0.01ns 0.01ns 0.99ns 2ns)
VBin Bin Vss pulse (0.7 0.7 0.49ns 0.01ns 0.01ns 0.49ns 1ns)
.measure TRAN leakage_5 rms I(vSupply) FROM=10n TO=11n
.print leakage_5

*--------------------- input (1 1 0) ---------------------
.alter
VA A Vss pulse (0.7 0.7 1.99ns 0.01ns 0.01ns 1.99ns 4ns)
VB B Vss pulse (0.7 0.7 0.99ns 0.01ns 0.01ns 0.99ns 2ns)
VBin Bin Vss pulse (0 0 0.49ns 0.01ns 0.01ns 0.49ns 1ns)
.measure TRAN leakage_6 rms I(vSupply) FROM=10n TO=11n
.print leakage_6

*--------------------- input (1 1 1) ---------------------
.alter
VA A Vss pulse (0.7 0.7 1.99ns 0.01ns 0.01ns 1.99ns 4ns)
VB B Vss pulse (0.7 0.7 0.99ns 0.01ns 0.01ns 0.99ns 2ns)
VBin Bin Vss pulse (0.7 0.7 0.49ns 0.01ns 0.01ns 0.49ns 1ns)
.measure TRAN leakage_7 rms I(vSupply) FROM=10n TO=11n
.print leakage_7

.end