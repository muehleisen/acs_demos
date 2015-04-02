;CATT-Acoustic v8.0 Manual Shoebox Example
;MASTER.GEO

;constant declarations
LOCAL  h  =  8	;hall height
LOCAL  w  = 10	;hall width
GLOBAL d  = 10 	;hall depth

;absorption and scattering coefficients 125Hz to 4kHz [%], RGB-color
ABS wedges = <96 98 99 99 99 99> L <30 30 30 30 30 30> 

CORNERS
;floor corners
 1	-w/2	0	0
 2	-w/2	d	0
 3	 w/2	d	0
 4	 w/2	0	0
;ceiling corners
11	-w/2	0	h
12	-w/2	d	h
13	 w/2	d	h
14	 w/2	0	h

PLANES
[1 floor / 4 3 2 1 / wedges ]
[2 ceiling / 11 12 13 14 / wedges ]
[3 stage wall / 1 11 14 4 / wedges ]
[4 rear wall / 3 13 12 2 / wedges ]
[5 left wall / 2 12 11 1 / wedges ]
[6 right wall / 4 14 13 3 / wedges ]

