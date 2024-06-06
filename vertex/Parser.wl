(*

  Praser borrowed from the URL:
  
    https://mathematica.stackexchange.com/questions/32716/how-to-examine-the-structure-of-graphics-objects


*)

(* Utility for turning printing on/off. *)
(* --- Mr.Wizard's version of BlockPrint --- *)
ClearAll[BlockPrint];
SetAttributes[BlockPrint, HoldRest];
BlockPrint[True , body_] := Block[{Print}, body]
BlockPrint[False, body_] := body

(* Parser proper. Invoked by: parser@Graphics[...] *)
ClearAll[parser, parser`iparser, parser`directive, parser`primitive]; 

Options[parser] = {Verbose -> False};
parser[a_, opts:OptionsPattern[]] := 
Block[{parser`state = {}, parser`primList, parser`unknownfcn},
    parser`unknownfcn[_]:= Sequence[];
    BlockPrint[!OptionValue[Verbose], 
      Flatten[parser`iparser[a]] /. parser`primList -> List
    ] 
]

(* Better isolation*)
Begin["parser`"];

(* Note the changes for v10 *)
directive := _AbsolutePointSize | _Arrowheads | _CapForm | _Dashing | 
  _EdgeForm | _FaceForm | _Glow  | _JoinForm | 
  _Opacity | _PointSize |  _Specularity | _Thickness |
  If[ $VersionNumber < 10,
    _CMYKColor | _RGBColor | _GrayLevel | _Hue,
    _?ColorQ
  ];

primitive := _Arrow | _BezierCurve | _BSplineCurve | _BSplineSurface | _Circle | 
  _Cone | _Cuboid | _Cylinder | _Disk | _FilledCurve | _Inset | 
  _JoinedCurve | _Line | _Point | _Polygon | _Raster | _Raster3D | 
  _Rectangle | _Sphere | _Text | _Tube | 
  If[ $VersionNumber >= 10,
    _Ball | _Circumsphere | 
    _ConicHullRegion | _HalfLine | 
    _HalfPlane | _Hexahedron | _InfiniteLine  | 
    _Parallelepiped | _Parallelogram | _Prism | _Pyramid | 
    _Simplex | _Tetrahedron | _Triangle,
   ##&[]
  ] | 
  If[ $VersionNumber >= 10.2,
    _AffineHalfSpace | _AffineSpace | _Annulus | _CapsuleShape | 
    _Cuboid | _DiskSegment | _HalfSpace | _Hyperplane | _InfinitePlane | 
    _Insphere | _RegularPolygon | _SphericalShell | _StadiumShape,
    ##&[]
  ];

(* 
 AASTriangle, ASATriangle, SASTriangle, and SSSTriangle evaluate
 to Triangle via DownValues, so they'll never show up in Graphics(3D)
 by themselves.
*)

iparser[l_Legended] := iparser@First@l
iparser[g:(_Graphics|_Graphics3D)]:= iparser @ First @ g

iparser[{}]:= Sequence[]

iparser[l_List] := 
Internal`InheritedBlock[{state},
  Print["List"];
  iparser /@ l 
]

iparser[Style[a_, b__]]:=
Internal`InheritedBlock[{state,unknownfcn},
  (* augment unknown function to work with strings *)
  unknownfcn[str_String]:= (state = {state, str}; ##&[]);
  Print["Style"];
  iparser /@ {b};
  iparser @ a
]

iparser[GraphicsGroup[a_List]] := 
  (Print["GraphicsGroup - List"]; iparser @ a)
iparser[GraphicsGroup[a_]]:= 
  (Print["GraphicsGroup - NoList"]; iparser @ {a})

iparser[g_GraphicsComplex]:= 
  (Print["GraphicsComplex - Normalizing."]; iparser @ Normal @ g);

iparser[Directive[a___]] := 
  (Print["Directive: ", Directive[a]]; iparser /@ Flatten[{a}])

iparser[m:directive] := 
  (Print["directive: ", m]; state = {state, m}; ##&[])

iparser[p:primitive] := 
  (
   Print["primitive: ", p, "; state: ", state]; 
   (* Prevents flattening later *)
   primList[Flatten[state], p]
  )

iparser[a_] := (Print["unknown: ", a]; unknownfcn[a])
End[]; (* parser` *)
