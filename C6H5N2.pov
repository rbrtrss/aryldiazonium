#include "colors.inc"
#include "finish.inc"

global_settings {assumed_gamma 1 max_trace_level 6}
background {color White transmit 1.0}
camera {orthographic
  right -18.71*x up 13.49*y
  direction 1.00*z
  location <0,0,50.00> look_at <0,0,0>}


light_source {<  2.00,   3.00,  40.00> color White
  area_light <0.70, 0, 0>, <0, 0.70, 0>, 3, 3
  adaptive 1 jitter}
// no fog
#declare simple = finish {phong 0.7}
#declare pale = finish {ambient 0.5 diffuse 0.85 roughness 0.001 specular 0.200 }
#declare intermediate = finish {ambient 0.3 diffuse 0.6 specular 0.1 roughness 0.04}
#declare vmd = finish {ambient 0.0 diffuse 0.65 phong 0.1 phong_size 40.0 specular 0.5 }
#declare jmol = finish {ambient 0.2 diffuse 0.6 specular 1 roughness 0.001 metallic}
#declare ase2 = finish {ambient 0.05 brilliance 3 diffuse 0.6 metallic specular 0.7 roughness 0.04 reflection 0.15}
#declare ase3 = finish {ambient 0.15 brilliance 2 diffuse 0.6 metallic specular 1.0 roughness 0.001 reflection 0.0}
#declare glass = finish {ambient 0.05 diffuse 0.3 specular 1.0 roughness 0.001}
#declare glass2 = finish {ambient 0.01 diffuse 0.3 specular 1.0 reflection 0.25 roughness 0.001}
#declare Rcell = 0.070;
#declare Rbond = 0.100;

#macro atom(LOC, R, COL, TRANS, FIN)
  sphere{LOC, R texture{pigment{color COL transmit TRANS} finish{FIN}}}
#end
#macro constrain(LOC, R, COL, TRANS FIN)
union{torus{R, Rcell rotate 45*z texture{pigment{color COL transmit TRANS} finish{FIN}}}
     torus{R, Rcell rotate -45*z texture{pigment{color COL transmit TRANS} finish{FIN}}}
     translate LOC}
#end

// no cell vertices
atom(< -1.55,   0.25,  -0.14>, 0.68, rgb <0.56, 0.56, 0.56>, 0.0, jmol) // #0
atom(< -0.83,  -0.94,  -0.16>, 0.68, rgb <0.56, 0.56, 0.56>, 0.0, jmol) // #1
atom(< -0.88,   1.47,  -0.29>, 0.68, rgb <0.56, 0.56, 0.56>, 0.0, jmol) // #2
atom(<  0.56,  -0.92,  -0.34>, 0.68, rgb <0.56, 0.56, 0.56>, 0.0, jmol) // #3
atom(<  0.50,   1.49,  -0.47>, 0.68, rgb <0.56, 0.56, 0.56>, 0.0, jmol) // #4
atom(<  1.22,   0.30,  -0.50>, 0.68, rgb <0.56, 0.56, 0.56>, 0.0, jmol) // #5
atom(< -2.62,   0.23,   0.00>, 0.28, rgb <1.00, 1.00, 1.00>, 0.0, jmol) // #6
atom(< -1.34,  -1.89,  -0.05>, 0.28, rgb <1.00, 1.00, 1.00>, 0.0, jmol) // #7
atom(< -1.45,   2.40,  -0.27>, 0.28, rgb <1.00, 1.00, 1.00>, 0.0, jmol) // #8
atom(<  1.01,   2.44,  -0.59>, 0.28, rgb <1.00, 1.00, 1.00>, 0.0, jmol) // #9
atom(<  2.30,   0.32,  -0.64>, 0.28, rgb <1.00, 1.00, 1.00>, 0.0, jmol) // #10
atom(<  1.26,  -2.10,  -0.37>, 0.63, rgb <0.18, 0.31, 0.97>, 0.0, jmol) // #11
atom(<  1.82,  -3.04,  -0.39>, 0.63, rgb <0.18, 0.31, 0.97>, 0.0, jmol) // #12

// no constraints
