(*

  Vertex Enumeration for Convex Polytopes
             and Arrangements

             Version 0.41 Beta (mod 1.02)
              November 14, 1992

           Copyright (c) 1991,1992 by
    Komei Fukuda and Ichiro Mizukoshi

***    
Beta1.01 eww: PolyhedronFromInequalities added
Beta1.02 eww: MathWorld context added
***

This package contains Mathematica implementations
of Avis-Fukuda algorithms for enumerating all 
vertices of a convex polyhedra given by a system
of linear inequalities, and all vertices (points)
of an arrangement given similarly.

This package is copyright 1991 by Komei Fukuda and
Ichiro Mizukoshi.  This package may be copied in 
its entirety for nonprofit purposes only.  
Sale, other than for the direct cost of the media,
is prohibited.  This copyright notice must
accompany all copies.

The authors make no representations, express or 
implied, with respond to this documentation, of 
the software it describes and contains, including
without limitations, any implied warranties of 
mechantability or fitness for a particular purpose,
all of which are expressly disclaimed.  The authors
shall in no event be liable for any indirect,
incidental, or consequential damages.

This beta release is designed to run under 
Version 1.2 & 2.0 of Mathematica. Any comments, 
bug reports, or requests to get on the 
VertexEnumeration mailing list should be 
forwarded to:

  Komei Fukuda  or Ichiro Mizukoshi
  Graduate School of Systems Management
  University of Tsukuba, Tokyo
  3-29-1 Otsuka, Bunkyo-ku
  Tokyo 112, Japan

  +81-3-3942-6876
  fukuda@gssm.otsuka.tsukuba.ac.jp
  or mizukosi@gssm.otsuka.tsukuba.ac.jp
 
*)

(* Limitations:
Pivot and options for other functions use Simplify, which is just not 
a good thing
*)


BeginPackage["TUG`vertex`VertexEnum`"];


Unprotect[VE];
Unprotect[PE];
Unprotect[VertexEnumeration];
Unprotect[PointEnumeration];
Unprotect[CrissCrossSolve];
Unprotect[BlandSolve];
Unprotect[Faces];
Unprotect[Polyhedron3D];
Unprotect[SubSetQ];
Unprotect[AdjacentQ];
Unprotect[EdgesOfPolyhedron];
Unprotect[MaximalQ];
Unprotect[MaximalSets];
Unprotect[LinesOfArrangement];

VE::usage="VE[m,b] is a short form of VertexEnumeration[m,b].";

PE::usage="PE[m,b] is a short form of PointEnumeration[m,b].";

VertexEnumeration::usage="VertexEnumeration[m,b] gives the list of all vertices of the polyhedron represented as the solution set of the linear inequality system  m.x <= b, x>=0. If you want to get results on progress MonitoringFile -> \"stdout\" ";

PointEnumeration::usage="PointEnumeration[m,b]  gives the list of all vertices of the arrangement of hyperplanes associated with the linear inequality system m.x <= b, x>=0.";

CrissCrossSolve::usage="CrissCrossSolve[c,m,b] solves the linear program  maximize c.x subject to m.x<=b and x>=0 by the Criss-Cross method. The output is {x*, v*, y*} where x* is an optimal solution, v* is an optimal value, and y* is a dual optimal solution. It warns if it is infeasible or dualinfeasible";

BlandSolve::usage="BlandSolve[c,m,b] solves the linear program  maximize c.x subject to m.x<=b and x>=0 by the Simplex method with Bland's rule, provided b is nonnegative.  The output is {x*, v*, y*} where x* is an optimal solution, v* is an optimal value, and y* is a dual optimal solution. It warns if it is unbounded.";


Faces::usage="Faces[list] returns a list of faces for the zero-variable list.  The kth face corresponds to kth inequality in x>=0, m.x<=b, for VertexEnumeration[m,b].";

Polyhedron3D::usage="Polyhedron3D[ver_List,zerova_List] returns 3D graphic primitives for drawing a 3D polytope.  The two arguments correspond to the first two list given by VertexEnumeration[m,b].";

SubSetQ::usage="SubSetQ[s,t] returns true if s is a subset of t.";

AdjacentQ::usage="AdjacentQ[i_Integer,j_Integer,zerova_List] returns True if and only if the zeroset zerova[[i]] and the zeroset zerova[[j]] correspond to adjacent vertices (the intersection of zerova[[i]] and zerova[[j]] is contained in no other zerosets).";

EdgesOfPolyhedron::usage="EdgesOfPolyhedron[zerova_List] returns the set of adjacent pairs of vertices.  See AdjacentQ.";

MaximalQ::usage="MaximalQ[i_Integer,l_List] returns True if and only if l[[i]] is a maximal set.";

MaximalSets::usage="MaximalSets[l_List] returns the sublist of maximal sets.  See, MaximalQ.";

LinesOfArrangement::usage="LinesOfArrangement[zerova_List] returns the list of lines as [1] sets of colinear vertices, and as [2] zerosets.";


(* added by eww *)

PolyhedronFromInequalities::usage = 
"PolyhedronFromInequalities[ineqs,{x,y,z},<offset>] returns the polygons of a polyhedron \
obtained by vertex enumeration of the given list of inequalities in variables x, y, and z \
for x,y,z>0.  An offset may be specified either as {dx,dy,dz} or dx (assumed then to be \
multiplied by {1,1,1} in order to make sure the inequalities have solutions in only the \
positive octant, as needed by VertexEnumeration.";

nullFile = If[$OperatingSystem === "Windows", "NUL", "/dev/null"];

Options[VertexEnumeration] = {SearchTree -> False, ZeroVariables -> True, MonitoringFile -> nullFile};

Options[PointEnumeration] = {SearchTree -> False, ZeroVariables -> True, MonitoringFile -> nullFile};


Begin["`Private`"];

(* added by eww *)

MatrixFromInequalities[ineqs_,{x_,y_,z_}]:=Module[
	{i=First/@ineqs-Last/@ineqs,m,b},
	m=Coefficient[#,{x,y,z}]&/@i;
	b=-#/.Thread[{x,y,z}:>0]&/@i;
	{m,b}
];


(* VertexEnumeration does not work well with approximate numbers *)

(*
PolyhedronFromInequalities[ineqs_,{x_,y_,z_}]:=Module[
	{i=First/@ineqs-Last/@ineqs,m,b,offset},
    {m,b}=MatrixFromInequalities[ineqs,{x,y,z}];
    offset=Tr[LinearProgramming[-#,m,-b]&/@IdentityMatrix[3],List];
    Print[offset];
    Polyhedron3D@@VertexEnumeration[m,Chop[b+m.Ceiling[offset]]]
]
*)

PolyhedronFromInequalities[ineqs_,{x_,y_,z_},offset_List]:=
  Module[{i=First/@ineqs-Last/@ineqs,m,b},
    {m,b}=MatrixFromInequalities[ineqs,{x,y,z}];
    (Polyhedron3D@@VertexEnumeration[m,Chop[b+m.offset]])/.
    	Polygon[l_]:>Polygon[#-offset&/@l]
];

PolyhedronFromInequalities[ineqs_,{x_,y_,z_},offset_:10]:=
	PolyhedronFromInequalities[ineqs,{x,y,z},offset{1,1,1}];
    
(* end *)

VertexEnumeration::LpInfeasible = "linear program is infeasible.";
VertexEnumeration::LpDualInfeasible = "linear program is dual infeasible.";
VertexEnumeration::LpUnbounded = "linear program is unbounded.";
VertexEnumeration::Infeasible = "linear inequality system is infeasible.";

(* comments for private routine *)
PivotF::usage="PivotF[mat,r,s,b,n] performs a pivot operation on mat with row:r and 
column:s and updates basis b and nonbasis n. Last 2 arguments are optional.";

GetPivotSequence::usage="GetPivotSequence[startbv,startnbv,goalbv,goalnbv] gives a set of pivots (variable pairs) which transfers the start to the goal.";

SortDict::usage="SortDict[mat,b,n] returns the new {mat,b,n} sorted by b and n reordered in ascending order.";

Dic2Vertex::usage="Dic2Vertex[value of bv, name of bv, name of nbv, ver] returns the vertex associated with ver.";

MakeSequence::usage="MakeSequence[dic_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,bases_?MatrixQ] returns pivot sequence.";

GetChangeBaseVariableNames::usage="GetChangeBaseVariableNames[startbv,startnbv,goalbv,goalnbv] gives a set of pivots (variable pairs) which transfers the start to the goal.";

ExecPivotSequence::usage="ExecPivotSequence[dic,bv,nbv,sequence] performs a sequence of pivots to {dic,bv,nbv} according to the given sequence.";

NonEmptyFaces::usage="NonEmptyFaces[list] returns a list of nonempty faces.";

OptimalBasesEnumeration::usage="OptimalBasesEnumeration[mat,b] gives the set of variable
pairs obtaining an optimal basis.";

LexMin::usage="LexMin[mat,bv,nbv,m,n] returns True if the dictionary {mat,bv,nbv} is lexicographically minimum for representing the current solution.";

CrissCrossSelect::usage="CrissCrossSelect[mat,bv,nbv,m,n] gives the pivot position
selected by the Criss-Cross rule.";

CrissCrossSelectQ::usage="CrissCrossSelectQ[mat,bv,nbv,i,j] checks whether {i,j} is the pivot position selected by the Criss-Cross rule.";

CrissCrossFilter::usage="CrissCrossFilter[mat,bv,nbv,i,j] is filter (necesarily True) for {i,j}==CrissCrossSelect[mat,bv,nbv].";

CrissCross::usage="CrissCross[mat,bv,nbv,m,n] solves the linear program given by a dictionary {mat,bv,nbv} and outputs a terminal dictionary.";

NegSmallest::usage="Ratio Function used by the Simplex Method";

FirstElement::usage="FirstElement[function,list1[,list2]] gives a position on list1 (ordered by list2),that is True at first time.";

NonNegativeVectorQ::usage="NonNegativeVectorQ[vec] returns True if and only if vec is a nonnegative vector.";

BlandSelect::usage="BlandSelect[mat,bv,nbv] gives a pivot position selected by Bland's rule.";

BlandSelectQ::usage="BlandSelectQ[mat,bv,nbv,i,j] returns True if and only if {i,j}==
BlandSelect[mat,bv,nbv].";

BlandFilter::usage="BlandFilter[mat,bv,nbv,i,j,m,n] is filter (necesarily True) for {i,j}==
BlandSelect[mat,bv,nbv].";

Bland::usage="Bland[mat,bv,nbv,m,n] solves the linear program given by a feasible dictionary {mat,bv,nbv} and outputs a terminal dictionary.";

DegenerateQ::usage="DegenerateQ[vec] gives True if vec contains 0. It is used to recognize degenerate dictionary.";

InfeasibleQ::usage="InfeasbleQ[mat] gives True if mat is infeasible.";

DualInfeasibleQ::usage="DualInfeasbleQ[mat] gives True if mat is dual infeasible.";

Zerovar::usage="Zerovar[Value of bv, Name of bv,Name of nbv] shows the variable names with value 0.";

BSearch::usage="BSearch[mat,b,n] returns the set of all basic feasible solutions for the input mat, b, n, {value of bv, name of bv, name of nbv}.";

CSearch::usage="CSearch[mat,b,n] returns the set of all basic solutions for the input mat, b, n, {value of bv, name of bv, name of nbv}.";

Options[CrissCross] = { NegativeTest-> Function[Negative[Chop[N[Simplify[#]]]]]};

Options[Bland] = { NegativeTest-> Function[Negative[Chop[N[Simplify[#]]]]]};

Options[ZeroVar] = { NegativeTest-> Function[Negative[Chop[N[Simplify[#]]]]]};

Options[BSearch] = {SearchTree -> False, NegativeTest-> Function[Negative[Chop[N[Simplify[#]]]]], MonitoringFile-> nullFile};

Options[CSearch] = {SearchTree -> False, NegativeTest-> Function[Negative[Chop[N[Simplify[#]]]]], MonitoringFile-> nullFile};

VE[mat_?MatrixQ,vec_?VectorQ, opts___Rule]:=VertexEnumeration[mat,vec,opts];

PE[mat_?MatrixQ,vec_?VectorQ, opts___Rule]:=PointEnumeration[mat,vec,opts];

Bout2Dlist[bout_List,dlist0_List]:=
	Block[{i,j,dlist,boutlength,dlist0rule},
		dlist =  Map[ Function[Father2Edge[Dlist2Father[#[[2]]]]], bout];
		boutlength = Map[Function[Length[#[[1]]]],bout];
		boutlength = Prepend[Table[Sum[boutlength[[i]],{i,1,j}],{j,Length[boutlength]-1}],0];
		dlist += boutlength;
		dlist0rule = Table[ Rule[i, boutlength[[i]] + 1], {i,Length[boutlength]}];
		AppendTo[dlist,dlist0 /. dlist0rule];
		{Flatten[dlist,1],boutlength+1}
	];


VertexEnumeration[mat_?MatrixQ,vec_?VectorQ,opts___Rule]:=
	Block[{dic,i,j,m,n,bv,nbv,flattenbout,bout,obe,output,dlist,opt1,opt2},
		opt1 = SearchTree /. {opts} /. Options[VertexEnumeration];
		opt2 = ZeroVariables /. {opts} /. Options[VertexEnumeration];
		{m,n} = Dimensions[mat];
		dic = Transpose[Append[Transpose[-mat],vec]];
		AppendTo[dic,Append[Table[0,{n}],0]];
	(* get dic, bv, nbv for Bland. Warnig nbv has been chanded.*)
		{dic,bv,nbv} = CrissCross[dic,Range[n+1,m+n],Range[n],m+1,n+1,opts];
	(* feasiblity check *)
		If[InfeasibleQ[dic], Message[VertexEnumeration::Infeasible];Return[{}]];
	(* shape up dic for Bland *)
		dic = Drop[dic,-1];
		If[DegenerateQ[Last[Transpose[dic]]],
		(* There is degeneracy *)
			(* obe looks like {{{dic,bv,nbv},{dic,bv,nbv}}, dlist0} *)
			obe= OptimalBasesEnumeration[Table[-dic[[i,j]],{i,m},{j,n}],Table[dic[[i,n+1]],{i,m}],bv,nbv];
			(* bout looks like
			 {{{{Value of bv,bv,nbv},{Value of bv,bv,nbv},...},dlist},{{{Value of bv,bv,nbv},...},dlist},...} *)
			bout = Map[ Function[BSearch[#[[1]],#[[2]],#[[3]],opts]],obe[[1]]];
			(* flattenbout looks like {{Value of bv,bv,nbv},{Value of bv,bv,nbv},....} but no dupilicat startpoint*)
			flattenbout = Flatten[Map[Function[#[[1]]],bout],1];
			output = {Map[Function[Dic2Vertex[ #[[1]],#[[2]],#[[3]],Range[n]]],flattenbout]};
			If[opt2, AppendTo[output, Map[ Function[ZeroVar[#[[1]],#[[2]],#[[3]],opts]], flattenbout]]];
			If[opt1, 
				dlist = Bout2Dlist[bout,obe[[2]]];
				AppendTo[output,dlist[[1]]];
				AppendTo[output,dlist[[2]]]],
		(* There is not degeneracy *)
			(* dic and mat must be same shape *)
			AppendTo[dic,Append[Table[-1,{n}],0]];
			bout = BSearch[dic,bv,nbv,opts];
			output = {Map[ Function[Dic2Vertex[ #[[1]],#[[2]],#[[3]],Range[n]]],bout[[1]]]};
			If[opt2, AppendTo[output, Map[ Function[ZeroVar[#[[1]],#[[2]],#[[3]],opts]],
			                            bout[[1]]]]];
			If[opt1, AppendTo[output, Father2Edge[Dlist2Father[bout[[2]]]]]]
		];
		output
	];


PointEnumeration[mat_?MatrixQ,vec_?VectorQ,opts___Rule]:=
	Block[{dic,i,j,m,n,bv,nbv,tmp,flattenbout,bout,obe,output,opt1,opt2},
		opt1 = SearchTree /. {opts} /. Options[PointEnumeration];
		opt2 = ZeroVariables /. {opts} /. Options[PointEnumeration];
		{m,n} = Dimensions[mat];
(*
		dic = Table[
			Which[
				SimpleNegative[vec[[i]]], Join[mat[[i]],vec[[i]]],
				True, Join[-mat[[i]],-vec[[i]]]],
			{i,m}
		]
*)
		dic = Transpose[Append[Transpose[-mat],vec]];
		AppendTo[dic,Append[Table[-1,{n}],0]];
		bv = Range[n+1,m+n];
		nbv = Range[n];
		If[DegenerateQ[Last[Transpose[dic]]],
		(* There is degeneracy *)
			(* obe looks like {{{dic,bv,nbv},{dic,bv,nbv}}, dlist0} *)
			obe= OptimalBasesEnumeration[Table[-dic[[i,j]],{i,m},{j,n}],Table[dic[[i,n+1]],{i,m}],bv,nbv];
			(* bout looks like
			 {{{{Value of bv,bv,nbv},{Value of bv,bv,nbv},...},dlist},{{{Value of bv,bv,nbv},...},dlist},...} *)
			bout = Map[ Function[CSearch[#[[1]],#[[2]],#[[3]],opts]],obe[[1]]];
			(* flattenbout looks like {{Value of bv,bv,nbv},{Value of bv,bv,nbv},....} but no dupilicat startpoint*)
			flattenbout = Flatten[Map[Function[#[[1]]],bout],1];
			output = {Map[Function[Dic2Vertex[ #[[1]],#[[2]],#[[3]],Range[n]]],flattenbout]};
			If[opt2, AppendTo[output, Map[ Function[ZeroVar[#[[1]],#[[2]],#[[3]],opts]], flattenbout]]];
			If[opt1, 
				dlist = Bout2Dlist[bout,obe[[2]]];
				AppendTo[output,dlist[[1]]];
				AppendTo[output,dlist[[2]]]],
		(* There is not degeneracy *)
			(* dic and mat must be same shape *)
		tmp = CSearch[dic,bv,nbv,opts];
		output = {Map[ Function[Dic2Vertex[ #[[1]],#[[2]],#[[3]],Range[n]]],tmp[[1]]]};
		If[opt2, AppendTo[output, Map[ Function[ZeroVar[#[[1]],#[[2]],#[[3]],opts]],
		                            tmp[[1]]]]];
		If[opt1, AppendTo[output, Father2Edge[Dlist2Father[tmp[[2]]]]]]
		];
		output
	];

Faces[zerova_List]:=
	Map[Function[x,
	      If[Position[zerova,x]=={},{},
	         Transpose[Position[zerova,x]][[1]]
	      ]
	    ], 
	    Range[Max[zerova]]
	];

NonEmptyFaces[zerova_List]:=
	Map[Function[Transpose[Position[zerova,#]][[1]]],Union[Flatten[zerova]]];

MakeLink[ver_List,zerova_List]:=
		Block[{candidates, cycle ,candidate2cycle},
		candidates = Drop[ver,1];
		cycle = { First[ver] };
		(* when one is list, comparing needs other is list *)
		While[{} != (candidate2cycle = Select[candidates,AdjacentQ[Last[cycle],#,zerova] &]),
			AppendTo[cycle,candidate2cycle[[1]]];
			candidates = Complement[candidates,candidate2cycle[[{1}]]];
		];
		While[{} != (candidate2cycle = Select[candidates,AdjacentQ[First[cycle],#,zerova] &]),
			PrependTo[cycle,candidate2cycle[[1]]];
			candidates = Complement[candidates,candidate2cycle[[{1}]]];
		];
		cycle
	];

Polyhedron3D[ver_List,zerova_List]:=
	Polygon /@ (ver[[#]]&) /@ ( MakeLink[#,zerova] & ) /@ NonEmptyFaces[zerova];

ZeroVar[ValueOfBv_?VectorQ,bv_?VectorQ,nbv_?VectorQ,opts___Rule]:=
	Block[{m,out={}},
		m=Length[ValueOfBv];
		SimpleNegative := NegativeTest /. {opts} /. Options[ZeroVar];
		out=Map[Function[SimpleSameQ[#,0]],ValueOfBv];
		Join[nbv,Map[Function[bv[[#[[1]]]]],Position[out,True]]]
	];
		
ForAllQ[func_,list1_List]:= Apply[And, Map[func, list1]];
	

Father2Edge[fathers_?VectorQ]:=	Map[{#,fathers[[#]]}&,Range[2,Length[fathers]]];

Dlist2Father[dlist_?VectorQ]:=
	Block[{po,dist,father,fathers={1}},
	(* first element in dist must be 0 and Length[dlist] => 2*)
		For[po = 2, po <= Length[dlist], ++po,
			dist =  dlist[[po]];
			father = po - 1;
			--dist;
		(* At first step a element in dist must be 1 *)
			While[dist > 0,
				father = fathers[[father]];
				--dist
			];
			AppendTo[fathers,father];
		];
		fathers
	];

Dic2Vertex[valueofbv_?VectorQ,bv_?VectorQ,nbv_?VectorQ,ver_?VectorQ]:=
	Map[Function[If[ MemberQ[nbv,#],
	                   0,valueofbv[[Position[bv,#][[1,1]]]]]],
	    ver];


LexMin[dic_?MatrixQ,bv_?VectorQ,nbv_?VectorQ]:=
	Block[{m,n},
		{m,n}=Dimensions[dic];
		LexMin[dic,bv,nbv,m,n]
	];

LexMin[dic_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,m_Integer,n_Integer]:=
	Block[{i,j},
		For[i = 1, i < m , ++i,
			If[SimpleSameQ[0,dic[[i,n]]],
				For[j = 1, j < n, ++j,
					If[ Not[SimpleSameQ[0,dic[[i,j]]]] && bv[[i]]  > nbv[[j]], 
					    Return[False]]
					]
				]
			];
		True
	];

CSearch[dict_?MatrixQ,opts___Rule]:=
	Block[{m,n,bv,nbv},
		{m,n}=Dimensions[dict];
		bv = Range[m-1];
		nbv = Range[m,m+n-2];
		CSearch[dict,bv,nbv,opts]
	];

CSearch[origdict_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,opts___Rule]:=
	Block[{ bv=origbv,nbv=orignbv,dict=origdict,m,n,i=1,j=1,opt1,MonitoringFile,
	        result,dist=1,distlist={0}},
		opt1 = SearchTree /. {opts} /. Options[CSearch];
		MonitoringFile = MonitoringFile /. {opts} /. Options[CSearch];
		SimpleNegative := NegativeTest /. {opts} /. Options[CSearch];
		{m,n}=Dimensions[dict];
		If[opt1,
			result ={{Drop[Transpose[origdict][[n]],-1],origbv,orignbv}};
			Write[MonitoringFile,Last[result][[3]]],
			If[LexMin[origdict,origbv,orignbv,m,n], 
				result ={{Drop[Transpose[origdict][[n]],-1],origbv,orignbv}};
				Write[MonitoringFile,Last[result][[3]]],
				result = {}]];
		While[ ((i < m )|| (origbv != bv)),
			While[ ((i <  m ) && Not[CrissCrossSelectQ[dict,bv,nbv,i,j]]),
				++j;
				If[ j >= n, j = 1; ++i];
			];
			If[ i < m,
				{dict,bv,nbv} = PivotF[dict,bv,nbv,i,j,m,n];
				If[opt1,
					AppendTo[result,{Drop[Transpose[dict][[n]],-1],bv,nbv}];
					Write[MonitoringFile,Last[result][[3]]];
					AppendTo[distlist,dist];
					dist = 1,
					If[LexMin[dict,bv,nbv,m,n],
						AppendTo[result,{Drop[Transpose[dict][[n]],-1],bv,nbv}];
						Write[MonitoringFile,Last[result][[3]]];
						AppendTo[distlist,dist];
						dist =1;
					];
				];
				{i,j}={1,1},
				{i,j}=CrissCrossSelect[dict,bv,nbv,m,n];
				If[ (i < m && j < n),
					{dict,bv,nbv}=PivotF[dict,bv,nbv,i,j,m,n];
					++j;
					++dist;
					If[ j >= n, j = 1; ++i]
				];
			];
		];
	{result,distlist}
	];

BSearch[dict_?MatrixQ,opts___Rule]:=
	Block[{m,n,bv,nbv},
		{m,n}=Dimensions[dict];
		bv = Range[m-1];
		nbv = Range[m, m+n-2];
		BSearch[dict,bv,nbv,opts]
	];

BSearch[origdict_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,opts___Rule]:=
	Block[{ bv=origbv,nbv=orignbv,dict=origdict,m,n,i=1,j=1,opt1,MonitoringFile,
	        result,dist=1,distlist = {0},bvposi,nbvposi},
		opt1 = SearchTree /. {opts} /. Options[BSearch];
		MonitoringFile = MonitoringFile /. {opts} /. Options[BSearch];
		SimpleNegative := NegativeTest /. {opts} /. Options[BSearch];
		{m,n}=Dimensions[dict];
		bvposi = Flatten[Map[Position[bv,#] & ,Sort[bv]]];
		nbvposi = Flatten[Map[Position[nbv,#] & ,Sort[nbv]]];
		If[opt1,
			result ={{Drop[Transpose[origdict][[n]],-1],origbv,orignbv}};
			Write[MonitoringFile,Last[result][[3]]],
			If[LexMin[origdict,origbv,orignbv,m,n], 
				result ={{Drop[Transpose[origdict][[n]],-1],origbv,orignbv}};
				Write[MonitoringFile,Last[result][[3]]],
				result = {}]];
		While[ ((i < m) || (origbv != bv)),
			While[ (i <  m && Not[BlandSelectQ[dict,bv,nbv,i,j,m,n,bvposi]]),
				++j;
				If[ j >= n, j = 1; ++i]
			];
			If[ i < m,
				{dict,bv,nbv} = PivotF[dict,bv,nbv,i,j,m,n];
				bvposi = Flatten[Map[Position[bv,#] & ,Sort[bv]]];
				nbvposi = Flatten[Map[Position[nbv,#] & ,Sort[nbv]]];
				
(*
				Print["."];
*)
				If[opt1,
					AppendTo[result,{Drop[Transpose[dict][[n]],-1],bv,nbv}];
					Write[MonitoringFile,Last[result][[3]]];
					AppendTo[distlist,dist];
					dist = 1,
					If[LexMin[dict,bv,nbv,m,n],
						AppendTo[result,{Drop[Transpose[dict][[n]],-1],bv,nbv}];
						Write[MonitoringFile,Last[result][[3]]];
						AppendTo[distlist,dist];
						dist = 1,
						Null
					];
				];
				{i,j}={1,1},
				{i,j}=BlandSelect[dict,bv,nbv,bvposi,nbvposi];
				If[ (i < m && j < n),
					{dict,bv,nbv}=PivotF[dict,bv,nbv,i,j,m,n];
					bvposi = Flatten[Map[Position[bv,#] & ,Sort[bv]]];
					nbvposi = Flatten[Map[Position[nbv,#] & ,Sort[nbv]]];
					++j;
					++dist;
					If[ j >= n, j = 1; ++i]
				];
			];
		];
	{result,distlist}
	];

BlandFilter[dict_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,i_Integer,j_Integer]:=
	Block[{m,n},
		{m,n}=Dimensions[dict];
		BlandFilter[dict,bv,nbv,i,j,m,n,Flatten[Map[Position[bv,#] & ,Sort[bv]]]]
	];

BlandFilter[dict_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,i_Integer,j_Integer,m_Integer,n_Integer]:=
		BlandFilter[dict,bv,nbv,i,j,m,n,Flatten[Map[Position[bv,#] & ,Sort[bv]]]];

BlandFilter[dict_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,i_Integer,j_Integer,m_Integer,n_Integer,bvposi_?VectorQ]:=
	( SimpleNegative[dict[[i,j]]] && SimpleNegative[dict[[m,j]]] &&
	  SimpleSameQ[-dict[[i,n]]/dict[[i,j]],
	              NegSmallest[Transpose[dict][[j]],bvposi,Last[Transpose[dict]]][[2]]]
	);

BlandSelectQ[origdict_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,i_Integer,j_Integer,m_Integer,n_Integer]:=
	BlandSelectQ[origdict,origbv,orignbv,i,j,m,n,Flatten[Map[Position[origbv,#] & ,Sort[origbv]]]];
	
BlandSelectQ[origdict_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,i_Integer,j_Integer,m_Integer,n_Integer,bvposi_?VectorQ]:=
	Block[{dict,bv,nbv},
		BlandFilter[origdict,origbv,orignbv,i,j,m,n,bvposi] &&
		(
		 {dict,bv,nbv}=PivotF[origdict,origbv,orignbv,i,j,m,n];
		 SameQ[{i,j},BlandSelect[dict,bv,nbv]]
		)
	];

NonNegativeVectorQ[vec_?VectorQ]:=
	ForAllQ[Function[Not[SimpleNegative[#]]],vec];


BlandSolve[cost_?VectorQ,mat_?MatrixQ,b_?NonNegativeVectorQ,opts___Rule]:=
	Block[{dic,m,n,ccdic,ccbv,ccnbv},
		dic = Transpose[Append[Transpose[Append[-mat,cost]],Append[b,0]]];
		{m,n}=Dimensions[dic];
		{ccdic, ccbv, ccnbv}= Bland[dic,opts];
		If[DualInfeasibleQ[ccdic], Message[VertexEnumeration::LpUnbounded];Return[{}]];
		{Dic2Vertex[ Drop[Transpose[ccdic][[n]],-1], ccbv, ccnbv,Range[n-1]],ccdic[[m,n]], Dic2Vertex[ Drop[-ccdic[[m]],-1],ccnbv, ccbv, Range[n,n+m-2]]}
	];

Bland[dict_?MatrixQ,opts___Rule]:=
	Block[{m,n,bv,nbv},
		{m,n}=Dimensions[dict];
		bv = Range[n,n+m-2];
		nbv = Range[n-1];
		Bland[dict,bv,nbv,m,n,opts]
	];

Bland[origdict_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,opts___Rule]:=
	Block[{m,n},
		{m,n}=Dimensions[origdict];
		Bland[origdict,origbv,orignbv,m,n,opts]
	];

Bland[origdict_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,m_Integer,n_Integer,opts___Rule]:=
	Block[{bv=origbv,nbv=orignbv,dict=origdict,i,j},
		SimpleNegative := NegativeTest /. {opts} /. Options[Bland];
		For[{i,j}=BlandSelect[dict,bv,nbv], (i < m && j < n),
		    {i,j}=BlandSelect[dict,bv,nbv],
		    {dict,bv,nbv}=PivotF[dict,bv,nbv,i,j,m,n]
		];
		{dict,bv,nbv}
	];

BlandSelect[dict_?MatrixQ,bv_?VectorQ,nbv_?VectorQ]:=
	Block[{bvposi,nbvposi},
		bvposi = Flatten[Map[Position[bv,#] & , Sort[bv]]];
		nbvposi = Flatten[Map[Position[nbv,#] & , Sort[nbv]]];
		BlandSelect[dict,bv,nbv,bvposi,nbvposi]
	];

BlandSelect[dict_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,bvposi_?VectorQ,nbvposi_?VectorQ]:=
	Block[{i,j},
		j = FirstElement[SimplePositive,Last[dict],nbvposi];
		i = NegSmallest[
		                Transpose[dict][[j]],bvposi,
		                Last[Transpose[dict]]
		               ][[1]];
		{i,j}
	];

CrissCrossFilter[dict_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,i_Integer,j_Integer]:=
	Block[{m,n},
		{m,n}=Dimensions[dict];
		CrissCrossFilter[dict,bv,nbv,i,j,m,n]
	];

CrissCrossFilter[dict_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,i_Integer,j_Integer,m_Integer,n_Integer]:=
	((
	 SimplePositive[dict[[i,n]]] && SimplePositive[dict[[i,j]]] && 
	 ForAllQ[Function[Not[SimpleNegative[dict[i,#]]] &&
	 nbv[#] < bv[i]],Range[n-1]]
	)
	||
	(
	 SimpleNegative[dict[[m,j]]] && SimpleNegative[dict[[i,j]]] &&
	 ForAllQ[Function[Not[SimplePositive[dict[#,j]]] &&
	 bv[#] < nbv[j]],Range[m-1]]
	));
	
CrissCrossSelectQ[origdict_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,i_Integer,j_Integer]:=
	Block[{dict,bv,nbv,m,n},
		{m,n}=Dimensions[origdict];
		CrissCrossFilter[origdict,origbv,orignbv,i,j,m,n] &&
		(
		 {dict,bv,nbv}=PivotF[origdict,origbv,orignbv,i,j,m,n];
		 SameQ[{i,j},CrissCrossSelect[dict,bv,nbv,m,n]]
		)
	];

CrissCrossSolve[cost_?VectorQ,mat_?MatrixQ,b_?VectorQ,opts___Rule]:=
	Block[{dic,m,n,ccdic,ccbv,ccnbv},
		dic = Transpose[Append[Transpose[Append[-mat,cost]],Append[b,0]]];
		{m,n}=Dimensions[dic];
		{ccdic, ccbv, ccnbv}=CrissCross[dic,opts];
		If[InfeasibleQ[ccdic], Message[VertexEnumeration::LpInfeasible];Return[{}]];
		If[DualInfeasibleQ[ccdic], Message[VertexEnumeration::LpDualInfeasible];Return[{}]];
		{Dic2Vertex[ Drop[Transpose[ccdic][[n]],-1], ccbv, ccnbv,Range[n-1]],ccdic[[m,n]], Dic2Vertex[ Drop[-ccdic[[m]],-1],ccnbv, ccbv, Range[n,n+m-2]]}
	      ];

CrissCross[dict_?MatrixQ,opts___Rule]:=
	Block[{m,n,bv,nbv},
		{m,n}=Dimensions[dict];
		bv = Range[n,m+n-2];
		nbv = Range[n-1];
		CrissCross[dict,bv,nbv,m,n,opts]
	];

CrissCross[origdict_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,opts___Rule]:=
	Block[{m,n},
		{m,n}=Dimensions[origdict];
		CrissCross[origdict,origbv,orignbv,m,n,opts]
	];

CrissCross[origdict_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,m_Integer,n_Integer,opts___Rule]:=
	Block[{bv=origbv,nbv=orignbv,dict=origdict,i,j},
		SimpleNegative := NegativeTest /. {opts} /. Options[CrissCross];
		For[{i,j}=CrissCrossSelect[dict,bv,nbv,m,n],(i < m && j < n),
			{i,j}=CrissCrossSelect[dict,bv,nbv,m,n],
			{dict,bv,nbv}=PivotF[dict,bv,nbv,i,j,m,n]
		];
		{dict,bv,nbv}
	];

CrissCrossSelect[dict_?MatrixQ,bv_?VectorQ,nbv_?VectorQ]:=
	Block[{m,n},
		{m,n}=Dimensions[dict];
		CrissCrossSelect[dict,bv,nbv,m,n]
	];

CrissCrossSelect[dict_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,m_Integer,n_Integer]:=
	Block[{i,j,bvposi,nbvposi},
		bvposi = Flatten[Map[ Position[bv,#] & ,Sort[bv]]];
		nbvposi = Flatten[Map[ Position[nbv,#] & ,Sort[nbv]]];
		i = FirstElement[SimpleNegative,Last[Transpose[dict]],bvposi];
		j = FirstElement[SimplePositive,Last[dict],nbvposi];
		Which[
			i == m, i = FirstElement[SimpleNegative,Transpose[dict][[j]],bvposi],
			j == n, j = FirstElement[SimplePositive,dict[[i]],nbvposi],
			nbv[[j]] > bv[[i]], j = FirstElement[SimplePositive,dict[[i]],nbvposi],
			True,   i = FirstElement[SimpleNegative,Transpose[dict][[j]],bvposi];
		];
		{i,j}
	];
	 
FirstElement[func_,list1_List,list2_List]:=
	Block[{i},
		For[i = 1,i <= Length[list2],++i,
			If[func[list1[[list2[[i]]]]],Return[list2[[i]]]]];
			i
	];

FirstElement[func_,list1_List]:=
	Block[{i},
		For[i = 1, i <= Length[list1], ++i,
		If[func[list1[[i]]],Return[i]]];
		i
	];

NegSmallest[list1_List,list2_List,list3_List]:=
	Block[{i,posi,tmpval,val=Infinity},
		For[i = 1,i <= Length[list2],++i,
			If[
				(
				 SimpleNegative[list1[[list2[[i]]]]] &&
				 SimpleGreater[val,
				               tmpval = -(list3[[list2[[i]]]]/list1[[list2[[i]]]])]
				),
				posi = i;
				val = tmpval
			];
		];
		(* val = Infinity -> nothing happens. Never happens *)
		If[SameQ[Infinity,val], {i,val}, {list2[[posi]],val}]
	];

PivotF[d_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,i_Integer,j_Integer,m_Integer,n_Integer]:=
	Block[{tmpbv,tmpnbv},
		{tmpbv,tmpnbv} = {bv,nbv};
		{tmpbv[[i]],tmpnbv[[j]]}={tmpnbv[[j]],tmpbv[[i]]};
		{PivotF[d,i,j,m,n],tmpbv,tmpnbv}
	];

PivotF[d_?MatrixQ,bv_?VectorQ,nbv_?VectorQ,i_Integer,j_Integer]:=
	Block[{tmpbv,tmpnbv},
		{tmpbv,tmpnbv} = {bv,nbv};
		{tmpbv[[i]],tmpnbv[[j]]}={tmpnbv[[j]],tmpbv[[i]]};
		{PivotF[d,i,j],tmpbv,tmpnbv}
	];

PivotF[d_?MatrixQ,r_Integer,s_Integer]:=
	Block[{m,n},
		{m,n}=Dimensions[d];
		PivotF[d,r,s,m,n]
	];

PivotF[d_?MatrixQ,r_Integer,s_Integer,m_Integer,n_Integer]:=
  Block[{i,j},
	Simplify[
	  Table[
	    Which[ (i == r) && (j == s), 1 / d[[i,j]],
		   (i == r) && (j != s), -(d[[i,j]]/d[[r,s]]),
		   (i != r) && (j == s), d[[i,j]]/d[[r,s]],
		   True, d[[i,j]] - ((d[[r,j]] * d[[i,s]]) / d[[r,s]])
		 ],{i,m},{j,n}
	       ]
	     ]
	   ];


GetChangeBaseVariableNames[startbv_?VectorQ,startnbv_?VectorQ,goalbv_?VectorQ,goalnbv_?VectorQ]:=
	{Intersection[startbv,goalnbv],Intersection[startnbv,goalbv]};

MakeSequence[origdic_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,bases_?MatrixQ]:=
	Block[{dic = origdic, bv = origbv, nbv = orignbv, bvposi, nbvposi, tmpsequence},
		(* name to position *)
		bvposi = Flatten[Map[Position[bv,#] & ,bases[[1]]]];
		nbvposi = Flatten[Map[Position[nbv,#] & ,bases[[2]]]];
		(* make all possible sequences *)
		tmpsequence = Map[Transpose[{bvposi,#}] &, Permutations[nbvposi]];
		(* choose one *)
		If[{} == tmpsequence,tmpsequence,tmpsequence[[FirstElement[# &,Map[Apply[And,Map[Not[SimpleSameQ[0,origdic[[#[[1]],#[[2]]]]]] &,#]] &,tmpsequence]]]]]
	];

GetPivotSequence[startbv_?VectorQ,startnbv_?VectorQ,goalbv_?VectorQ,goalnbv_?VectorQ]:=
	Transpose[{Intersection[startbv,goalnbv],Intersection[startnbv,goalbv]}];

ExecPivotSequence[origdic_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ,sequence_?MatrixQ]:=
	Block[{dic = origdic, bv = origbv, nbv = orignbv, i},
		Do[{dic,bv,nbv} = PivotF[dic,bv,nbv,sequence[[i,1]],sequence[[i,2]]],{i,Length[sequence]}];
		{dic,bv,nbv}
	];

OptimalBasesEnumeration[mat_?MatrixQ,vec_?VectorQ,bv_?VectorQ,nbv_?VectorQ]:=
	Block[{dic,degenerateBasicVariables,i,m,n,tmp,output},
		{m,n} = Dimensions[mat];
		degenerateBasicVariables = Flatten[Position[vec,0]];
		dic = mat[[degenerateBasicVariables]];
		AppendTo[dic,Table[1,{n}]];
		dic = Append[Transpose[dic],Append[Table[-1,{Length[degenerateBasicVariables]}],0]];
(*
		bv = Table[i,{i,n+1,m+n}];
		nbv = Table[i,{i,n}];
*)
(* this is dual, so bv and nbv are exchanged *)
		tmp = BSearch[dic,nbv,bv[[degenerateBasicVariables]],SearchTree->True,MonitoringFile->nullFile];
		dic = Transpose[Append[Transpose[-mat],vec]];
		AppendTo[dic,Append[Table[-1,{n}],0]];
		output = Map[ Function[MakeSequence[dic,bv,nbv,GetChangeBaseVariableNames[bv,nbv,#[[3]],#[[2]]]]], tmp[[1]]];
		output = {Map[Function[ExecPivotSequence[dic,bv,nbv,#]], output]};
		AppendTo[output,  Father2Edge[Dlist2Father[tmp[[2]]]]];
		output
	];

SubSetQ[s_List,t_List]:=
   Length[s]==Length[Intersection[s,t]];

AdjacentQ[i_Integer,j_Integer,l_List]:=
    Block[{subface}, 
      subface=Intersection[l[[i]],l[[j]]];
      Length[Select[l,SubSetQ[subface,#]&]]==2];


EdgesOfPolyhedron[l_List]:=
    Block[{i,j,edges={}},
      Do[
          Do[If[AdjacentQ[i,j,l],AppendTo[edges,{i,j}]],
             {j,i+1,Length[l]}
          ],{i,Length[l]}
      ];
    edges];

    
MaximalQ[i_Integer,l_List]:=
    Block[{candidate}, 
      candidate=l[[i]];
      Length[Union[Select[l,SubSetQ[candidate,#]&]]]==1];

MaximalSets[l_List]:=
    Block[{i,maximals={}},
        Do[If[MaximalQ[i,l],
            AppendTo[maximals,l[[i]]]
           ], {i,Length[l]}
        ];
    maximals];
LinesOfArrangement[zerova_List]:=
    Block[{i,j,p=Length[zerova],zeros={},lines={}},
      Do[Do[AppendTo[zeros,
              Intersection[zerova[[i]],zerova[[j]]]],{j,i+1,p}
         ],{i,p}
      ];zeros=MaximalSets[Union[zeros]];
      Do[AppendTo[lines,
           Select[Range[p],SubSetQ[zeros[[i]],zerova[[#]]]&]
         ],{i,Length[zeros]}
      ];
      {lines,zeros} 
    ];

SortDict[origdict_?MatrixQ,origbv_?VectorQ,orignbv_?VectorQ]:=
	Block[{bv=origbv,nbv=orignbv,dict=origdict},
		dict = Append[
		              Map[ 
		                  Function[dict[[Position[bv,#][[1,1]]]]],
		                  Sort[bv]],
		              Last[dict]];
		dict = Append[
		              Map[
		                  Function[Transpose[dict][[Position[nbv,#][[1,1]]]]],
		                  Sort[nbv]],
		              Last[Transpose[dict]]];
		{Transpose[dict],Sort[bv],Sort[nbv]}
	];

DegenerateQ[vec_?VectorQ]:=Count[vec,0]!=0;

InfeasibleRowQ[vec_?VectorQ]:=
	SimpleNegative[Last[vec]] && ForAllQ[Function[Not[SimplePositive[#]]],Drop[vec,-1]];

InfeasibleQ[mat_?MatrixQ]:=
	Apply[Or,Map[InfeasibleRowQ,Drop[mat,-1]]];

DualInfeasibleQ[mat_?MatrixQ]:=
	InfeasibleQ[Transpose[-mat]];

SimplePositive:=Function[SimpleNegative[-#]];

SimpleSameQ:=
	Function[( Not[SimpleNegative[#1 - #2]] && Not[SimplePositive[#1 - #2]] )];

SimpleGreater:=Function[SimplePositive[#1 - #2]];

End[(* "`Private`" *)];


Protect[VE];
Protect[PE];
Protect[VertexEnumeration];
Protect[PointEnumeration];
Protect[CrissCrossSolve];
Protect[BlandSolve];
Protect[Faces];
Protect[Polyhedron3D];
Protect[SubSetQ];
Protect[AdjacentQ];
Protect[EdgesOfPolyhedron];
Protect[MaximalQ];
Protect[MaximalSets];
Protect[LinesOfArrangement];

EndPackage[]

