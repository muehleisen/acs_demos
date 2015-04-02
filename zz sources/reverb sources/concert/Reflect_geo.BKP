;REFLECT.GEO
;PROJECT:CATT-Acoustic tutorial for v8.0
; STEP 6 side-wall reflectors

ABS backabs = <20 30 40 50 60 60> {64 128 128}
ABS frontabs = <12 10 8 7 6 5> {0 0 128}

LOCAL r_w  = wl1/5
LOCAL r_h  = h-3

LOCAL tx = w/2 - 0.5
LOCAL ty = r_w
LOCAL tz = 2.75

LOCAL ry = -10
LOCAL rz =  15

OBJECT
ROTATE       0   ry      rz
TRANSLATE    tx  fld+ty  tz

OFFSETPL  100
OFFSETCO   80

MIRROR 100 200

COPY  5 2  0 0 0  tx fld+2*ty tz  0 ry rz
COPY 10 4  0 0 0  tx fld+3*ty tz  0 ry rz
COPY 15 6  0 0 0  tx fld+4*ty tz  0 ry rz

CORNERS

0  0 -r_w/2 0
1  0 -r_w/2 r_h
2  0  r_w/2 r_h
3  0  r_w/2 0

PLANES

;* = auto edge diffusion
 [0 refl front / 0 1 2 3 / frontabs* ]
;the back MUST be defined too
 [1 refl back  \ 0 1 2 3 \ backabs* ]
