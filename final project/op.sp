************************************************************************
* auCdl Netlist:
* 
* Library Name:  OP_final
* Top Cell Name: OP_AIC_FINAL
* View Name:     schematic
* Netlisted on:  Jan 14 00:01:25 2022
************************************************************************

*.BIPOLAR
*.RESI = 2000 
*.RESVAL
*.CAPVAL
*.DIOPERI
*.DIOAREA
*.EQUATION
*.SCALE METER
*.MEGA

.PARAM supplyp  = 1.8V
+ supplyn 	= 0V
+ comon  	= 0.9V


************************************************************************
* Library Name: OP_final
* Cell Name:    OP_AIC_FINAL
* View Name:    schematic
************************************************************************



.SUBCKT my_op   vinp     vinn     vdd     vss     vop     von     vocm
*.PININFO Vinn:I Vinp:I Von:O Vop:O vdd:B vss:B Vocm:B



* 1st stage
MM1     net0135     Vinn    net90   vss     n_18    W=15u    L=1u    m=5
MM2     net0191     Vinp    net90   vss     n_18    W=15u    L=1u    m=5
MM3     net0135     ErrorOut vdd    vdd     p_18    W=12u    L=1u    m=5
MM4     net0191     ErrorOut vdd    vdd     p_18    W=12u    L=1u    m=5
MM5     net90       GATE     vss    vss     n_18    W=65u    L=1u    m=5

* 2nd stage
MM6     von         net0135  vdd    vdd     p_18    W=85u    L=0.25u  m=5
MM7 	vop 	    net0191  vdd    vdd     p_18    W=85u    L=0.25u  m=5
MM8     von         GATE     vss    vss     n_18    W=75u    L=1u    m=5
MM9     vop         GATE     vss    vss     n_18    W=75u    L=1u    m=5


*miller compensate
MM10    net10       net25    net0135  vdd   p_18    W=45u    L=0.55u    m=1
MM11    net31       net25    net0191  vdd   p_18    W=45u    L=0.55u    m=1
CCC2    net31   vop     4p $[CP]
CCC1    net10   von     4p $[CP]



*constant gm
MM12    net0120     net20    vdd    vdd     p_18    W=10u    L=1u    m=1
MM13    net20       net20    vdd    vdd     p_18    W=10u    L=1u    m=1
MM14    GATE    net25   net0120 vdd     p_18    W=8u    L=1u    m=1
MM15 	net25 	net25 	net20 	vdd 	p_18 	W=8u 	L=1u 	m=1
MM16    net75   GATE    vss     vss     n_18    W=20u    L=4u    m=1
MM17    net25   net75   vss     vss     n_18    W=80u    L=4u    m=1
RRB     GATE    net75   7K $[RP]

* start up

MM18    net65       GATE     vdd    vdd     p_18    W=2u    L=1u    m=1
MM19    net65       GATE     vss    vss     n_18    W=36u    L=1u    m=1
MM20    net20       net65    vss    vss     n_18    W=1u    L=1u    m=1

*error_amplifier
MM21    net0170   vocm       net0173 vss     n_18    W=12u   L=1u    m=4
MM22    ErrorOut  invIn      net0173 vss     n_18    W=12u    L=1u    m=4
MM23    net0170 net0170 vdd     vdd     p_18    W=15u    L=1u    m=4
MM24    ErrorOut ErrorOut vdd   vdd     p_18    W=15u    L=1u    m=4
MM25    net0173 GATE     vss   vss     n_18    W=90u    L=0.6u    m=4
RRsenp  vop     invIn   50k $[RP]
RRsenn  von     invIn   50k $[RP]


.ENDS

