;MASTER.GEO
;PROJECT=Diffuse Empty Classroom 


GLOBAL L=14
GLOBAL W=8
GLOBAL H=4

;MIRROR co_add pl_add

;ABS absname   <10 10 10 10 10 10> ;L <10 10 10 100 10 10> {255 0 0}
ABS FloorAbs      <02 04 08 20 35 40> L <30 30 30 30 30 30> {125 125 125} ; carpet glued to floor from Beranek
ABS CeilingAbs    <60 85 95 98 98 98> L <30 30 30 30 30 30> {250 250 250} ; high quality ceiling tile
ABS WallAbs       <15 11 10 07 06 07> L <30 30 30 30 30 30> {200 200 200} ; gypsum on metal studs
ABS panelabs	<40 50 60 60 60 60> L <30 30 30 30 30 30> {125 125 200}
ABS DoorAbs       <15 11 10 07 06 07> L <30 30 30 30 30 30> {125 125 50}
ABS BlackboardAbs <15 15 11 03 05 03> L <30 30 30 30 30 30> {0 0 0}
ABS CurtainAbs    <20 25 30 30 35 35> L <30 30 30 30 30 30> {125 125 50}

CORNERS

;id 	x	y 	z
;Floor Corners
1	0	0	0
2	L	0	0
3	L	W	0
4	0	W	0

;Ceiling Corners
5	0	0	H
6	0	W	H
7	L	W	H
8	L	0	H

;Wall Corners
9	0	0	2.5
10	1.469	0	2.5
11	1.469	0	0
12	2.231	0	0
13	2.231	0	2.5
14	3.7	0	2.5
15	3.7	0	0
16	3.7	0	1
17	10	0	1
18	10	0	0
19	10	0	2.5
20	11.469	0	2.5
21	11.469	0	0
22	12.231	0	2.5
23	12.231	0	0
24	L	0	2.5
25	10	W	H
26	10	W	0
27	10	W	1
28	3.7	W	1
29	3.7	W	0
30	10	W	2.5
31	3.7	W	H
32	3.7	W	2.5
33	1	W	H
34	1	W	0
35	0	6.9	H
36	0	6.9	0
37	0	6.9	1.0
38	0	0.9	1.0
39	0	0.9	0
40	0	6.9	2.5
41	0	0.9	H
42	0	0.9	2.5

;Other Corners


PLANES
;[id name  	/   	/ absname  ]
[1  Floor 	/1  2  3  4 / FloorAbs]
[2  Ceiling 	/5  6  7  8 / CeilingAbs]
[3  Wall_Yo 	/1  9  10 11/ WallAbs]
[4  Wall_Yo 	/9  5  8  24/ WallAbs]
[5  Wall_Yo 	/12 13 14 15/ WallAbs]
[6  Wall_Yo 	/18 19 20 21/ WallAbs]
[7  Wall_Yo 	/15 16 17 18/ WallAbs]
[8  Wall_Yo 	/23 22 24 2 / WallAbs]
[9  Wall_X13.7 	/2  8  7  3 / panelAbs]
[10 Wall_Y7.8 	/3  7  25 26/ WallAbs]
[11 Wall_Y7.8 	/30 25 31 32/ WallAbs]
[12 Wall_Y7.8 	/26 27 28 29/ WallAbs]
[13 Wall_Y7.8 	/29 31 33 34/ WallAbs]
[14 Wall_Xo 	/4  6  35 36/ WallAbs]
[15 Wall_Xo 	/40 35 41 42/ WallAbs]
[16 Wall_Xo 	/36 37 38 39/ WallAbs]
[17 Wall_Xo 	/39 41 5  1 / WallAbs]
[18 Door1 	/11 10 13 12/ DoorAbs]
[19 Door2 	/21 20 22 23/ DoorAbs]
[20 Blackboard1 	/16 14 19 17/ BlackboardAbs]
[21 Blackboard2 	/27 30 32 28/ BlackboardAbs]
[22 Blackboard3 	/37 40 42 38/ BlackboardAbs]
[23 Curtain 	/34 33 6  4 / curtainabs]


;[id name  /   / (a /  / a_abs) (b /  / b_abs) ]

