*****************************************************
.param gflag__totalflag_mos__mos__cmos040lp=0
.param gflag__globalflag_mos__mos__cmos040lp=1
.param svtlp_dev=1

.include './45nm_MGK.pm'
.option parhier=local   *$ *** Required by WiCkeD ***
.DC dummy 1 1 1
.temp 25
.options GMIN=1e-30
.options POST
.options AUTOSTOP
.options INGOLD=2
.options DCON=1
.options GSHUNT=1e-15
.options RMIN=1e-15
.options ABSTOL=1e-25
.options ABSVDC=1e-25
.options RELTOL=1e-20
.options RELVDC=1e-2                                                                                                                                                                                                               
.options NUMDGT=4
.options PIVOT=1e-13
.options MEASDGT=6
.option measform=1
*****Parameters*********************
.Param
+   trfck=10p       $ rise and fall times for clk and data input
+   tr=10p
+   cqload=0.2f     $ capacitive loads on FF Q and Qn
+   pvdd=1.0        $ voltage supply
+   tsetup=1n       $ conservative Tsetup
+   thold=3n        $ conservative Thold

Mp1    1   nodea   vdd   vdd   pmos  l=47.0329073273n w=164.855021636n 
Mp2    1   nodeb   vdd   vdd   pmos  l=47.9154136625n w=143.2773267n 
Mp3    nodecon nodec   1   vdd   pmos l=45.8469431398n w=162.708234204n 
Mn1    5   nodea   gnd   gnd   nmos  l=45.8422026258n w=168.707909706n 
Mn2    5   nodeb   gnd   gnd   nmos  l=50.2348269296n w=101.824346025n 
Mn3    nodecon nodec   5   gnd   nmos l=48.8008798841n w=108.016815647n 
Mp4    4   nodea   vdd   vdd   pmos  l=47.2391798199n w=182.194669245n 
Mp5    nodecon nodeb   4   vdd   pmos  l=45.2371750638n w=165.095569845n 
Mn4    nodecon nodeb   node4   gnd   nmos l=48.5299700744n w=93.4861811524n 
Mn5    node4   nodea   gnd   gnd   nmos l=47.2874704197n w=131.559099101n 
Mp6    2   nodea   vdd   vdd   pmos  l=47.652467525n w=150.781708138n 
Mp7    2   nodeb   vdd   vdd   pmos l=46.444275276n w=156.019435636n 
Mp8    2   nodec   vdd   vdd   pmos l=49.2009821186n w=138.547022282n 
Mp9    nodes0n nodecon 2   vdd   pmos l=46.8576322757n w=81.1343710239n 
Mn6    3   nodea   gnd   gnd   nmos l=47.5224358951n w=159.268335475n 
Mn7    3   nodeb   gnd   gnd   nmos l=50.5166682525n w=118.041645539n 
Mn8    3   nodec   gnd   gnd   nmos l=46.0081685767n w=105.888491192n 
Mn9    nodes0n nodecon 3   gnd   nmos l=49.5344581129n w=83.1889959664n 
Mp10   9   nodea   vdd   vdd   pmos  l=46.9259533283n w=132.09928126n 
Mp11   8   nodeb   9   vdd   pmos    l=45.6744150147n w=237.455262766n 
Mp12   nodes0n nodec   8   vdd   pmos l=54.4107594437n w=222.422669861n 
Mn10   7   nodea   gnd   gnd   nmos  l=48.3274041752n w=119.739517794n 
Mn11   6   nodeb   7   gnd   nmos    l=49.7724863031n w=182.617632567n 
Mn12   nodes0n nodec   6   gnd   nmos  l=50.5009504456n w=152.92655059n 
Mp13   nodeco  nodecon vdd   vdd   pmos l=49.1143970164n w=78.4441093842n 
Mn13   nodeco  nodecon gnd   gnd   nmos l=45.0474176041n w=97.7660863254n 
Mp14   nodes0  nodes0n vdd   vdd   pmos l=54.3152123776n w=109.874038742n 
Mn14   nodes0  nodes0n gnd   gnd   nmos  l=51.7322973982n w=90.2454357337n  


cq1 nodes0 0 c='cqload' ic=0
cq2 nodeco 0 c='cqload' ic=0
**************************supply digital power rails*******************
vgnd gnd 0 dc=0
vvdd vdd 0 dc='pvdd'
**************************stimulus waveforms**************************
Vina nodea 0 PWL(0  0   600p    0   '600p+tr'   'pvdd'  1200p   'pvdd'  '1200p+tr'  0       3000p   0       '3000p+tr'  'pvdd'  3600p   'pvdd'  '3600p+tr'  0       6600p   0       '6600p+tr'      'pvdd'  10200p      'pvdd'      '10200p+tr'     0       12600p      0)
Vinb nodeb 0 PWL(0  'pvdd'  1800p   'pvdd'  '1800p+tr'  0   4800p    0  '4800p+tr'  'pvdd'  5400p   'pvdd'  '5400p+tr'  0       7200p   0       '7200p+tr'  'pvdd'  7800p   'pvdd'  '7800p+tr'      0       10800p      0           '10800p+tr'     'pvdd'  12600p  'pvdd') 
Vinc nodec 0 PWL(0  0   2400p   0   '2400p+tr'  'pvdd'  6000p   'pvdd'  '6000p+tr'  0       9000p   0       '9000p+tr'  'pvdd'  9600p   'pvdd'  '9600p+tr'  0       11400p  0       '11400p+tr'     'pvdd'  12000p      'pvdd'      '12000p+tr'     0)
***************************Measurements*********************************

.tran 6e-12 12e-9
.measure tran delay_lh_nodeaCo  trig v(nodea) val='0.5*pvdd' rise=1 targ v(nodeco) val='0.5*pvdd' rise=1
.measure tran delay_hl_nodeaCo  trig v(nodea) val='0.5*pvdd' fall=1 targ v(nodeco) val='0.5*pvdd' fall=1 

.measure tran delay_lh_nodebCo  trig v(nodeb) val='0.5*pvdd' rise=1 targ v(nodeco) val='0.5*pvdd' rise=3 
.measure tran delay_hl_nodebCo  trig v(nodeb) val='0.5*pvdd' fall=2 targ v(nodeco) val='0.5*pvdd' fall=3 

.measure tran delay_lh_nodecCo  trig v(nodec) val='0.5*pvdd' rise=2 targ v(nodeco) val='0.5*pvdd' rise=5
.measure tran delay_hl_nodecCo  trig v(nodec) val='0.5*pvdd' fall=2 targ v(nodeco) val='0.5*pvdd' fall=5

.end                                                                                  


