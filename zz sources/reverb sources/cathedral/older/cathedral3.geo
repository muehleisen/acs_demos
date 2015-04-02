;GEO-file template for AniScape
;Created by CATT PureVerb v3.2c
GLOBAL xp =  20
GLOBAL xm =  10
GLOBAL y1 =  30
global y2 =  40
GLOBAL yp =  50.00
GLOBAL ym =  0.00
GLOBAL zh =  25
GLOBAL zp =  15.0
GLOBAL zm =  0.00

; scale the beranek data by 50% to take into account the open floor area
;ABS pews = <28 30 38 43 45 43 : 40 38> L < 30 40 50 60 70 70 : 70 70 >
ABS pews = <28 30 30 30 30 30 : 30 30> L < 30 40 50 60 70 70 : 70 70 >


ABS brick = <  2  2  2  3  4 5 : 6 7>
ABS plaster = < 12 10 8 6 6 6 : 6 6>

mirror 1000 100

CORNERS
  0   0  0 0
  1  xm ym zm
  2  xm y1 zm
  3  xp y1 zm
  4  xp y2 zm
  5  xm y2 zm
  6  xm yp zm
  7  0 yp zm	
  ;8  0  0  0
  ;7  -xm yp zm
  ;8  -xm y2 zm
  ;9  -xp y2 zm
  ;10 -xp y1 zm
  ;11 -xm y1 zm
  ;12 -xm ym zm
  ;13 0 0 zh
  ;14 0 yp zh

  101  xm ym zp
  102  xm y1 zp
  103  xp y1 zp
  104  xp y2 zp
  105  xm y2 zp
  106  xm yp zp
  107  0 yp zp
  108  0 0 zp


  ;107  -xm yp zp
  ;108  -xm y2 zp
  ;109  -xp y2 zp
  ;110 -xp y1 zp
  ;111 -xm y1 zp
  ;112 -xm ym zp
  
  200 0 0 zh
  201 xm/2 0 zh
  206 xm/2 yp zh
  207 0 yp zh
 


PLANES
 [ 1 floor   /   0  1  2  3  4 5 6 7 /  pews ]
 [ 2 ceiling1 / 101 201 206 106 105 102 / plaster ]
 [ 3 ceiling2 /200 207 206 201 / plaster]
 ;[ 3 ceiling2 \ 213 214 107 108 111 112 \ plaster]
;[ 2 ceiling1 / 213 214 206 101 / plaster ]
 ;[ 3 ceiling2 /112 107 214 213 / plaster]
[ 4 ceiling3 / 102 105 104 103/ plaster]
; [ 5 ceiling5 / 111 110 109 108/ plaster]

[ 6 ewall1 /1 101 102 2/brick]
[ 7 ewall1 /2 102 103 3/brick]
 [ 8 ewall2 /3 103 104 4/brick]
 [ 9 ewall3 /4 104 105 5/brick]
 [ 10 ewall4 /5 105 106 6/brick]

; [ 11 leftwall1 \12 112 111 11 \ brick]
; [ 12 leftwall2 \11 111 110 10 \ brick]
; [ 13 leftwall3 \10 110 109 9 \ brick]
; [ 14 leftwall4 \9 109 108 8 \ brick]
; [ 15 leftwall5 \8 108 107 7 \ brick]

[16 nwall /7  6 106 206 207\ brick]
[17 swall \0 1  101 201 200 \ brick]


;audience planes


 ;[ 3 left  side wall  /  1  4 14 11 / xm ]
 ;[ 4 right side wall  /  1 101 2 102 / brick ]
 ;[ 5 front wall /  1 11 12  2 / ym ]
 ;[ 6 back wall  /  3 13 14  4 / yp ]
