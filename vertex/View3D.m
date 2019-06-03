(*:Name: View3D *)

(* :Title: View3D *)

(* :Author: Tom Wickham-Jones*)

(* :Package Version: 1.0 *)

(* :Mathematica Version: After 2.2 *)


(* :History:
	Created summer 1992 by Tom Wickham-Jones.

	This package is described in the book
	Mathematica Graphics: Techniques and Applications.
	Tom Wickham-Jones, TELOS/Springer-Verlag 1994.

*)

(*:Warnings:
	Removes ViewPointToUser and ViewPointFromUser in case they
	have already been defined.

	This package requires the version after 2.2 for the functions
	that work with normals and lighting.  The functions for the
	Plot3Matrix work in Version 2.2.
        
        The function name SphereBox[] was changed to SphereBox3D[] 
        to be conform to Mathematica Version >=6.
        by Holger I. Meinhardt

*)


If[ Context[ ViewPointToUser] =!= "TUG`vertex`View3D`",
		Remove[ ViewPointToUser]]

If[ Context[ ViewPointFromUser] =!= "TUG`vertex`View3D`",
		Remove[ ViewPointFromUser]]


BeginPackage["TUG`vertex`View3D`"]


ViewPointToUser::usage =
	"ViewPointToUser[ view, prng, box] returns the point in
	user coordinates that corresponds to the ViewPoint view,
	with PlotRange prng and BoxRatios box."


ViewPointFromUser::usage =
	"ViewPointFromUser[ pt, plotrange, boxratios] returns the
	ViewPoint that corresponds  to the point in user coordinates pt,
	with PlotRange prng and BoxRatios box."


ProjectVector::usage = 
	"ProjectVector[ mat, vec] applies the four dimensional transformation
	matrix mat to vector vec."

Plot3Matrix::usage =
	"Plot3Matrix[ gobj] returns the four dimensional transformation matrix
	used by Graphics3D or SurfaceGraphics object gobj."


SetOldDisplayFunction::usage =
	"SetOldDisplayFunction[] restores the default $DisplayFunction."
	
SetNormalDisplayFunction::usage =
	"SetNormalDisplayFunction[] sets $DisplayFunction to insert
	normal vectors into three-dimensional Polygon primitives 
	when they are rendered."

SetOldLights::usage	=
	"SetOldLights[] restores the default LightSource options of 
	three-dimensional graphics objects."
	
SetWhiteLights::usage	=
	"SetWhiteLights[] sets the LightSources options of ParametricPlot3D
	and Graphics3D to use a set of evenly distributed white light sources."
	
SetColorLights::usage	=
	"SetColorLights[] sets the LightSources options of ParametricPlot3D
	and Graphics3D to use a set of evenly distributed colored light sources."

NormalDisplayFunction::usage =
	"NormalDisplayFunction is a setting for the DisplayFunction option
	that inserts normals into three-dimensional Polygon primitives."
	
WhiteLights::usage	=
	"WhiteLights are a set of evenly distributed white light sources."
	
ColorLights::usage	=
	"ColorLights are a set of evenly distributed colored light sources."
	

Begin["`Private`"]

ViewPointToUser[ view_, prng_, boxr_] :=
    Block[{scale, trans},
        scale = 
         Max[ boxr] Map[ (#[[2]] - #[[1]])&, 
                                prng]/boxr ;
        trans = 
          Map[ (#[[2]] + #[[1]])&, prng]/2 ;
        view scale + trans
    ]	


ViewPointFromUser[ user_, prng_, boxr_] :=
    Block[{bm, scale, trans},
        bm = Max[ boxr] ;
        scale = 
          boxr/{bm, bm, bm}/
                   Map[ (#[[2]] - #[[1]])&, prng] ;
        trans = 
          -scale Map[ (#[[2]] + #[[1]])&, prng]/2 ;
        user scale + trans
    ]	


Unprotect[ Plot3Matrix]

Clear[ Plot3Matrix]

ProjectVector[ mat_, {x_, y_, z_}] :=
    Block[{tmp},
	tmp = mat.{x, y, z, 1} ;
	Drop[ tmp, -2] / Last[ tmp]
	]

Plot3Matrix[ g_Graphics3D | g_SurfaceGraphics] :=
    Block[{vp, vc, vv, prng, boxrat, sreg, opt},
    	opt = FullOptions[ g] ;
	{vp, vc, vv, prng, boxrat, sreg} = 
	    {ViewPoint, ViewCenter, ViewVertical, PlotRange, BoxRatios,
		 SphericalRegion}/. opt /. Options[ Head[ g]] ;
	MatrixCalculate[ vp, vc, vv, prng, boxrat, sreg]
	]

MatrixCalculate[ vp_,  vc_, vv_, prng_, boxrat_, sreg_] :=
    Block[{mat1, mat2, mat3, ctr, tmp, rmax, rmin, sfact},
	{rmin, rmax} = N[Transpose[ prng]] ;
				(* min and max user coords of box *)
	ctr = (rmax + rmin)/2. ;
				(* center of box *)
	mat1 = TransMatrix[ -ctr] ;
				(* origin at center of box *)
	tmp = N[boxrat/(rmax-rmin)/Max[boxrat]] ;
				(* Scale user coords to boxratios *)
	mat2 = ScaleMatrix[ tmp] ;
				(* Scale matrix for boxratios *)
	mat3 = TransMatrix[ -vp] ;
				(* translate to put viewpoint at origin *)
	mat1 = mat3 . mat2 . mat1 ;
				(* put all together *)
	mat2 = CalculateRotate[ -vp] ;
				(* rotate to look along -z and up correct *)
	mat3 = DiagonalMatrix[ {1,1,-1,1}] ;
				(* reflect so project along +z *)
	mat1 = mat3. mat2 . mat1 ;
	sfact = If[ sreg =!= True, ScaleBox[ mat1, prng], 
								SphereBox3D[ mat1, prng, ctr]] ;	
				(* Get the scale factor *)
	mat1 = ProjMatrix[ 0.5] . mat1 ;	
	ctr = HMatrixTimesVector[ mat1, ctr] ;
				(* ctr is now box center imager *)
	mat1 = FinalMatrix[ sfact, ctr].mat1 ;
                        	(* move ctr to center and scale *)
	mat1
	]



FinalMatrix[ s_, ctr_] :=
	Module[{m1, m2},
		m1 = TransMatrix[-ctr] {s,s,s,1} ;		(* move ctr to origin *)
		TransMatrix[ {0.5, 0.5, 0.0}].m1  (* T to mid screen*)	
	]



ProjMatrix[ z_] :=
    ( t = 1/(1-z);
      Join[
        Map[ Join[ #, {0,0}]&, IdentityMatrix[ 2]],
	Map[ Join[ {0,0}, #]&, {{t, -z t}, {1, 0}}]]
    )


SphereBox3D[ mat_, {xb_, yb_, zb_}, gctr_] :=
	Module[{pt, ctr, r, d},
		pt = Map[ Last, {xb,yb,zb}] ;
				(* coordinates of one corner *)
		pt = HMatrixTimesVector[mat, pt] ;
				(* apply box transform to corners *)
		ctr = HMatrixTimesVector[ mat, gctr] ;
				(* transform center *)
		d = Sqrt[ ctr.ctr] ;
		pt = pt-ctr ;
		r = Sqrt[ pt.pt] ;
				(* length of diagonal *)
		If[ d < r || r == 0.0,
				1.0,
				Sqrt[d^2 - r^2]/ (2 r)]
				(* half the inverse of the radius under projection *)
	]

ScaleBox[ mat_, {xb_, yb_, zb_}] :=
	Module[{pts},
		pts = Flatten[ Outer[ List, xb, yb, zb], 2] ;
				(* coordinates of box corners *)
		pts = Map[ HMatrixTimesVector[mat, #]&, pts] ;
				(* apply box transform to corners *)
		pts = Map[ ProjectCrude, pts] ; 	
				(* crude project box corners *)
		pts = Abs[ pts] ;
				(* get abs distance *)
		1/ (2 * Max[pts])
				(* scale is half of 1/max *)
	]


ProjectCrude[ vec_] := Drop[ vec, {-1}] / Last[ vec]

	


(*
  Take a vector and return a homogeneous matrix to make it point the
  -z axis with the projection of the original z-axis in +y.
*)

CalculateRotate[ vec_] :=
	Block[{ proj, norm, mat1, mat2},
		proj = N[ Drop[ vec, -1]] ;
			(* xy projection of vec *)
		norm = Sqrt[ proj.proj] ;
			(* length of proj *)
		mat1 = If[ norm == 0,
				IdentityMatrix[ 4],
				RotateMatrixZ[ Reverse[ proj/norm]]] ;
			(* Rotate around z axis to make proj along +y *)
		proj = HMatrixTimesVector[ mat1, vec] ;
			(* Rotate vector around z-axis *)
		proj = Rest[ proj] ;
			(* yz projection of vector *)
		norm = Sqrt[ proj.proj] ;
			(* length of proj *)
		mat2 = If[ norm == 0,
				IdentityMatrix[ 4],
				proj = -Reverse[ proj/norm] ;
				RotateMatrixX[ proj]] ;
			(* Rotate around x axis to make proj along -z *)
		mat2 . mat1
	]


HMatrixTimesVector[ m_, h_] :=
	Block[{ tmp},
		tmp = m . Append[ h, 1] ;
		Drop[ tmp / tmp[[4]] , -1]
	]
	
TransMatrix[ d_] :=
        Transpose[ ReplacePart[ IdentityMatrix[ 4], Append[ d, 1], 4]]

ScaleMatrix[ s_] := 
	DiagonalMatrix[ Append[ s, 1]]

RotateMatrixZ[ {ct_, st_}] :=
     {{ct, -st, 0, 0}, {st, ct, 0, 0}, {0,0,1,0}, {0,0,0,1}}

RotateMatrixX[ {ct_, st_}] :=
     {{1, 0, 0, 0}, {0, ct, -st, 0}, {0,st,ct,0}, {0,0,0,1}}





oldDisplayFunction = $DisplayFunction

SetOldDisplayFunction[] :=
	($DisplayFunction = oldDisplayFunction;)
	

fixPoly[ {a_, b_, c_, d___}] :=
    Block[{norm},
		norm = Cross[ b-a, c-b] ;
		len = Sqrt[ norm.norm] ;
		If[ len > 0, 
			Polygon[ {a,b,c,d}, norm/len],
			Polygon[ {a,b,c,d}, {0,0,0}]]
		]


fixPoly[ pts_, norm_] := 
	If[ norm === Automatic, fixPoly[ pts], Polygon[pts, norm]]

fixPoly[ pts_, norm_, style_] :=
	If[ norm === Automatic, 
		Append[ fixPoly[ pts], style], Polygon[pts, norm, style]]


NormalDisplayFunction[ g_Graphics3D] :=
	(oldDisplayFunction[ g /. Polygon[ arg__] :> fixPoly[ arg]] ;g)

NormalDisplayFunction[ g_] := oldDisplayFunction[g]


SetNormalDisplayFunction[] :=
	($DisplayFunction = NormalDisplayFunction;)

oldLightsG3D = LightSources /. Options[ Graphics3D, LightSources]

oldLightsPP3D = LightSources /. Options[ ParametricPlot3D, LightSources]


SetOldLights[] := 
	(SetOptions[ Graphics3D, LightSources -> oldLightsG3D];
	 SetOptions[ ParametricPlot3D, LightSources -> oldLightsPP3D];)


WhiteLights =
{{{1., 0., 1.}, RGBColor[1, 1, 1]}, 
 {{-0.5, 0.5, 1/Sqrt[2]}, RGBColor[1, 1, 1]}, 
 {{-0.5, -0.5, 1/Sqrt[2]}, RGBColor[1, 1, 1]}}

SetWhiteLights[] :=
	(SetOptions[ Graphics3D, LightSources -> WhiteLights];
	 SetOptions[ ParametricPlot3D, LightSources -> WhiteLights];)

ColorLights =
{{{1., 0., 1.}, RGBColor[1, 0, 0]}, 
 {{-0.5, 0.5, 1/Sqrt[2]}, RGBColor[0, 1, 0]}, 
 {{-0.5, -0.5, 1/Sqrt[2]}, RGBColor[0, 0, 1]}}

SetColorLights[] :=
	(SetOptions[ Graphics3D, LightSources -> ColorLights];
	 SetOptions[ ParametricPlot3D, LightSources -> ColorLights];)

End[]

EndPackage[]

(*

<<ExtendGraphics/View3D.m

SetNormalDisplayFunction[]

SetOldDisplayFunction[]

SetWhiteLights[]

SetOldLights[]

*)




