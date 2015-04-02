;MASTFULL.GEO
;PROJECT:CATT-Acoustic tutorial for v8.0

GLOBAL step = 6

;STEP 6 - side wall reflectors
INCLUDE reflect

;general materials defined here or from library
ABS wood   = <12 10 8 7 5 4>  {213 220 160}
;ABS carpet = < 10 8 6 4 3 2 > {98 209 44}
ABS carpet = <2 4 8 20 35 40>  {98 209 44}; carpet glued to concrete from beranek
ABS plaster = <14 10 6 5 4 3 > {220 220 220} ; thick plaster on metal lath from Beranek
ABS parquet = <4 4 7 6 6 7> {30 30 30} ; parquet floor from Beranek
ABS audience = <68 75 82 85 86 86 > L <30 40 50 60 70 80> {128 128 0}  ; audience for med upholstery from Beranek

;STEP 1: audience and floor surfaces
;ABS audience = <35 50 55 70 85 80> L <30 40 50 60 70 80> {128 128 0}
ABS floorabs = carpet
;STEP 2: ceiling, backwall, sidewalls
ABS ceilabs = plaster
ABS wallabs = plaster
;STEP 3: entrance door
ABS doorabs = wood
;STEP 4: prosc. and stage
ABS sfloorab = wood
ABS swallabs = wood

;STEP 1: floor, audience
GLOBAL ah  = 1.0 ; audience height
GLOBAL rh  = 0.3 ; receiver height above audience plane
GLOBAL aww = 1.0 ; audience sidewalk widths

GLOBAL fsd = 1   ; front-stage depth
GLOBAL fsw = 12   ; front-stage width
GLOBAL sw  = fsw + 2 ; stage width
GLOBAL pw  = 2   ; prosc. width
GLOBAL w   = 15  ; max hall width
GLOBAL ew  = 2 ; entrance width
GLOBAL fld = 3   ; flank depth
GLOBAL flt = 1   ; floor tilt
GLOBAL wl1 = 8   ; first side wall length
GLOBAL wl2 = 8   ; second side wall length
GLOBAL hd  = fld + wl1 + wl2 ; hall depth from prosc

;STEP 2: ceiling, backwall, sidewalls
GLOBAL h   = 9   ; hall height
GLOBAL mh  = h+1  ; mid hall height
GLOBAL bh  = h-1	;  back hall height

;STEP 3: entrance door
GLOBAL e   = 0.2 ; edge width entrance door
GLOBAL dh  = 2   ; entrance door height

;STEP 4: prosc. and stage
GLOBAL sh  = 1   ; stage height
GLOBAL sd  = 6   ; stage depth
GLOBAL sbw = 8   ; stage back width
GLOBAL sfh = h-2 ; stage front height
GLOBAL sbh = sfh-2   ; stage back height
 
MIRROR 100 200  ; corner (100) and plane (200) offsets for mirrored part

CORNERS

;-- STEP 1 --------------------------------------------------------

;floor corners
1 -fsw/2   fsd     0
2 -sw/2    0       0
3  x(2)-pw 0       0 
4 -w/2     fld     0
7 -w/2+ew  hd	   flt
8  0       y(4)    0   ; help corner for lock
5  x(4)    fld+wl1 lock(4 7 8)
6  x(7)    y(5)    lock(4 7 8)

;audience surface
;20-21 help corners to lock audience corners at ah above floor
20 x(8) y(8) z(8)+ah
21 x(4) y(4) z(4)+ah
22 x(7) y(7) z(7)+ah

;23-25 help corners to lock receiver positions at rh above audience
;surface (in REC.LOC)
23 x(20) y(20) z(20)+rh
24 x(21) y(21) z(21)+rh
25 x(22) y(22) z(22)+rh

;audience upper corners
30 x(4)+aww y(4)     lock(20 21 22)
31 x(4)+aww y(5)-aww lock(20 21 22)
32 x(7)+aww y(5)-aww lock(20 21 22)
33 x(7)+aww y(7)-aww lock(20 21 22)

;audience lower corners
40 x(30) y(30) lock(4 7 8)
41 x(31) y(31) lock(4 7 8)
42 x(32) y(32) lock(4 7 8)
43 x(33) y(33) lock(4 7 8)

;-- STEP 2 --------------------------------------------------------

;ceiling
52 x(2) y(2) h
53 x(3) y(3) h
54 x(4) y(4) mh
55 x(5) y(5) mh
56 x(6) y(6) mh
57 x(7) y(7) bh




;-- STEP 3 --------------------------------------------------------

;entrance door
60 x(5)+e y(5) z(5)
61 x(5)+e y(5) z(5)+dh
62 x(6)-e y(5) z(5)+dh
63 x(6)-e y(5) z(5)

;-- STEP 4 --------------------------------------------------------

;prosc. and stage
74  x(2)   y(2)  sh
75  x(1)   y(1)  sh 
76 -sbw/2 -sd    sh
77  x(76)  y(76) sh+sbh
78  x(2)   y(2)  sh+sfh

PLANES

;STEP 1: audience and floor planes --------------------------------

;audience surfaces
[1 audience surface / 33 32 31 30 130 131 132 133 / audience ]
[2 audience front / 140 130 30 40 / audience ]
[3 audience rear / 143 43 33 133 / audience ]
[4 audience front side / 30 31 41 40 / audience ]
[5 audience middle side / 42 41 31 32 / audience ]
[6 audience rear side / 43 42 32 33s / audience ]

;floor surfaces
[7 front floor  / 101 102 103 104 140 40 4 3 2 1 / floorabs ]
[8 sloped side floor / 40 41 42 43 7 6 5 4 / floorabs ] 
[9 sloped rear floor / 107 7 43 143 / floorabs ] 

;STEP 2: ceiling, backwall, sidewalls -----------------------------
[18 ceiling1 / 52 53 54 154 153 152 / ceilabs]
[19 ceiling2 / 54 55 56 156 155 154 / ceilabs]
[20 ceiling / 56 57 157 156 / ceilabs ]


;[20 ceiling / 52 53 54 55 56 57 157 156 155 154 153 152 / ceilabs ]



[21 back wall / 107 157 57 7 / wallabs ]
[22 side wall front  / 5 55 54 4 / wallabs ]
[23 side wall back   / 56 6 7 57 / wallabs ]
[24 front flank wall / 54 53 3 4 / wallabs ]

;STEP 3: entrance door --------------------------------------------

[30 entrance wall / 5 6 56 55 / 
	(door / 63 62 61 60 / doorabs) 
	(wall /  5  6 56 55 / wallabs) ]

;STEP 4: prosc. and stage -----------------------------------------

[40 prosc. walls     / 2 3 53 52 78 74 / wallabs ]
[41 stage side edge  / 2 74 75 1 / swallabs ]
[42 stage front edge / 1 75 175 101 / swallabs ]
[43 stage floor      / 176 174 175 75 74 76 / sfloorab ]
[44 stage ceiling    / 77 78 178 177 / swallabs ]
[45 stage back wall  / 76 77 177 176 / swallabs ]
[46 stage side wall  / 76 74 78 77 / swallabs ]
[47 prosc. top       / 78 52 152 178 / swallabs ]

;------------------------------------------------------------------
