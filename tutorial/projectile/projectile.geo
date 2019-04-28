ll = 0.01;
a = 0.1;  // ball radius
b = 5*a;  // outer ball radius
N1 = 20;
N2 = 20;
l3 = 5*N1; // number of horizontal split of domain
l4 = 2*N1; // number of vertical split of domain


hx = 0;
hy = 0;

sx = 0;
sy = 0;

Point(1) = {a+sx,0+sy,0};
Point(2) = {b+sx,0+sy,0};
//+
Line(1) = {1, 2};
//+
Extrude {{0,0,1}, {sx, sy, 0}, Pi/2} {
  Line{1};
}
//+
Line Loop(1) = {3, 2, -4, -1};
//+
//Plane Surface(6) = {1};
//+
//+
Symmetry {0, 1, 0, -sy} {
  Duplicata { Surface{5}; }
}

//+
Symmetry {1, 0, 0, -sx} {
  Duplicata { Surface{5}; }
}
//+
Symmetry {1, 0, 0, -sx} {
  Duplicata { Surface{6}; }
}

Transfinite Line {1,2,12,-9} = N1 Using Progression 1.1;
Transfinite Line {3,4,15,13,20,18,10,8} = N2;

//Transfinite Line {46,47,48,49} = 100;
Transfinite Surface {5} = {1,2,4,3}; //{94, 95, 92, 93};
Transfinite Surface {11} = {4,3,21,20};
Transfinite Surface {16} = {15,19,21,20};
Transfinite Surface {6} = {1,2,15,19};
Recombine Surface {5,11,6,16};


//+
// Extrude {0, 0, .05} {
//   Surface{11}; Surface{5}; Surface{6}; Surface{16}; Layers{1}; Recombine;
// }
//+

Point(46) = {-2+hx, -1+hy, 0, 0.10};
Point(47) = {12+hx, -1+hy, 0, 0.10};
Point(48) = {12+hx, 4+hy, 0, 0.10};
Point(49) = {-2+hx, 4+hy, 0, 0.10};
//+
Line(92) = {46, 47};
//+
Line(93) = {47, 48};
//+
Line(94) = {48, 49};
//+
Line(95) = {49, 46};
//+
Line Loop(2) = {94, 95, 92, 93};
//+
Plane Surface(109) = {2};
Transfinite Line {94,  92} = 250;
Transfinite Line {95, 93} = 140;

//Transfinite Line {46,47,48,49} = 100;
Transfinite Surface {109} = {46,47,48,49}; //{94, 95, 92, 93};
Recombine Surface {109};
Extrude {0, 0, 0.02} {
  Surface{109}; Surface{5}; Surface{11}; Surface{16}; Surface{6}; Layers{1}; Recombine;
}
//+
Physical Surface("inlet") = {122};
//+
Physical Surface("outlet") = {130};
//+
Physical Surface("sides") = {118,126};
//+
Physical Surface("ballIn") = {174, 152, 218, 196};
//+
Physical Surface("ballOut") = {144, 166, 188, 210};
//+
Physical Volume("front") = {2, 3, 4, 5};
//+
Physical Volume("background") = {1};
