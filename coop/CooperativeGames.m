(* ==================================================================
The use of this Package is described in "Economic and Financial
Modeling with Mathematica", Hal Varian, editor, TELOS/Springer-Verlag,
1993, ISBN 0-387-97882-8.  $44.95 (Includes 1.44 MS-DOS disk.)  To
place order call 1-800-777-4643 or fax 1-201-348-4505.
=====================================================================*)

(*
Cooperat.m

A Package for the Modelling and Solution of 
Cooperative Games

by

Michael Carter
Department of Economics
University of Cantebury
*)

(*
Release Date: 28.09.2021 

Modification made to be compatible with Mathematica Version 12

by 

Holger I. Meinhardt
Institute of Operations Research
Karlsruhe Institute of Technology (KIT)
D-76128 Karlsruhe

ConstrainedMin is replaced by LinearOptimization.
Is not anymore usable with Mathematica Versions smaller than 12.

*)
BeginPackage["TUG`coop`CooperativeGames`"];
If[$VersionNumber < 9,Needs["Utilities`FilterOptions`"]];

(*
The following describe elements of the game
*)
Coalitions 	:= Subsets[T];
ProperCoalitions := Rest[Drop[Coalitions,-1]];
PayoffVector 	:= Module[{},  x /@ T];

v::usage = "v[S] describes the worth of coalition S";
(*
x::usage = "x[S] sums the allocation of coalition S"
*)
(*
The following describe properties of the payoffs.
*)
ParetoOptimality 	:= x[T] == v[T];
IndividualRationality 	:= x[#] >=v[{#}] & /@ T;	
CoalitionalRationality 	:= x[#] >= v[#] & /@ ProperCoalitions;
(*
The following solutions are implemented
*)
Imputations::usage = "Imputations[game] specifies the set of imputations";
Core::usage = "Core[game] specifies the core of game.
	      Core[game, epsilon] calculates the epsilon core";
CoreQ::usage = "CoreQ[game] returns True if core is nonempty";
InCoreQ::usage = "InCore[y_List,game] returns True if y belongs to the core";
Blocking::usage = "Blocking[y_List,game] lists the coalitions which can block allocation y";
LeastCore::usage = "LeastCore[game] calculates the least core";
Nucleolus::usage = "Nucleolus[game] calculates the nucleolus";
ShapleyValue::usage = "ShapleyValue[game] calculates the Shapley Value";
(*
Some other useful functions
*)
Draw::usage = "Draw[objects,options] depicts solutions on the simplex";
DrawSimplex::usage = "DrawSimplex[objects,options] depicts solutions on the simplex";
Excess::usage = "Excess[y,S] gives the excess of coalition S at payoff y";
Payoff::usage = "Payoff[y] transforms a payoff vector into a list of rules";
(*
Subsets::usage = "Subsets[S] lists the subsets of set S"; 
*)
ConstraintLabels::usage = "ConstraintLabels is an option for Draw";
Options[Draw] = {ConstraintLabels ->True};
Options[DrawSimplex] = Flatten[Sort[{ConstraintLabels ->True, Options[Graphics]}]];
Options[CoreQ] = {Method -> Automatic};
Options[Nucleolus] = {Method -> Automatic};

Begin["`Private`"];


x[S_List] := Plus @@ x /@ S;

Imputations[game_:Null] :=
	Append[IndividualRationality, ParetoOptimality];

Core[game_:Null] :=
    Append[CoalitionalRationality, ParetoOptimality];

Core[(epsilon_Integer | epsilon_Real)] :=
    Append[x[#] >= v[#] - epsilon & /@ ProperCoalitions ,
	ParetoOptimality];

Core[game_, epsilon_] := Core[epsilon];

CoreQ[game_:Null,opts:OptionsPattern[CoreQ]] := Block[{mthd,grQ},
	mthd = OptionValue[Method];
	grQ = v[T] >= LinearOptimization[x[T],
		CoalitionalRationality, 
		PayoffVector,"PrimalMinimumValue",Method->mthd]
];

InCoreQ[y_List,game_:Null] := And @@
		Core[game] /. Payoff[y];

Blocking[y_List,game_:Null] := Module[{violated},
	violated = Flatten @
		 Position[Core[game] /. Payoff[y], False];
	Part[Rest[Coalitions], violated]
];

Excess[S_List] := v[S] - x[S];

Excess[y_List,S_List] := Excess[S] /. Payoff[y];

LeastCore[game_:Null] := LeastCoreAux[Prepend[
				CoalitionalRationality,
				ParetoOptimality]
];

Nucleolus[game_:Null,opts:OptionsPattern[Nucleolus]] := Module[{equations},
(*		equations = Nest[LeastCoreAux, Prepend[CoalitionalRationality, ParetoOptimality], Length[T]]; *)
                                        equations = LeastCoreAux[Prepend[CoalitionalRationality, ParetoOptimality],opts];
                (* Print[equations];*)
		equations = Cases[equations,_Equal];
                (* Print[equations]; *)
		PayoffVector /. Solve[equations,PayoffVector] [[1]]
];

ShapleyValue[game_:Null,S_List:T] := Module[{value},
	value = p[T] - (p[DeleteCases[T,#]] & /@ S);
	Unset[p[#]]  & /@ Rest[Coalitions];
	Return[value]
];

ShapleyValue[game_] := ShapleyValue[game,T];

ShapleyValue[] := ShapleyValue[Null,T];

ShapleyValue[game_:Null,i_?AtomQ] := 
	ShapleyValue[game,{i}];

p[{i_}] := p[{i}] = v[{i}];

p[S_]   := p[S] =(v[S] + Plus @@ Map[p[Complement[S,{#}]] &,S])/
				Length[S];

(*
Graphics Functions
*)

Draw[objects_, opts___] := Module[{cLabels},
	cLabels = ConstraintLabels /. {opts} /. Options[Draw];
	Show[Graphics[{
	SimplexC[],
	objects /. {
	pt_?NVectorQ :> {PointSize[0.03], Point[pt]},
	{pt_?NVectorQ,label_String} :>
		{PointSize[0.01], Point[pt],
		Text[label,pt,{0,1}]},
	{pt1_?NVectorQ, pt2_?NVectorQ} :>
		{Thickness[0.02], Line[{pt1,pt2}]},
	ineq_GreaterEqual :> plotConstraint[ineq,cLabels],
	eqn_Equal :> {}
	}
		
	}] /.toSimplex,
	PlotRange -> All
]];
	

DrawSimplex[objects_, opts___] := Module[{cLabels, filopts},
        filopts = If[$VersionNumber < 9,FilterOptions[Graphics, opts] ,FilterRules[Graphics, opts]]; 
	cLabels = ConstraintLabels /. {opts} /. Options[DrawSimplex];
	Show[Graphics[{
	SimplexC[],
	objects /. {
	pt_?NVectorQ :> {PointSize[0.02], Point[pt]},
	{pt_?NVectorQ,label_String} :>
		{PointSize[0.01], Point[pt],
		Text[label,pt,{0,1}]},
	{pt1_?NVectorQ, pt2_?NVectorQ} :>
		{Thickness[0.0075], Line[{pt1,pt2}]},
	ineq_GreaterEqual :> plotConstraint[ineq,cLabels],
	eqn_Equal :> {}
	}
		
	}] /.toSimplex,
	PlotRange -> All, filopts
]];


toSimplex = {x1_?NumberQ, x2_?NumberQ, x3_?NumberQ} ->
		 {(x2-x1) Sqrt[3]/2, x3-(x1+x2)/2};

SimplexC[] := Module[{unitVectors},
	unitVectors = IdentityMatrix[Length[T]];
	{{Thickness[0.01],
	Line[(v[T] Append[ unitVectors, First[unitVectors]])]},
	MapThread[Text[FontForm[#1,{"Times-Roman",20}],#2] &,
		{T,(1.1 v[T] unitVectors)}]}
];

plotConstraint[ineq_, labels_] :=
    Module[{p, fixedcomp, offset=v[T]/4, textpoint},
	p = Solve[{Equal @@ ineq,
		ParetoOptimality},PayoffVector];
	p = Flatten[PayoffVector /. p];
	fixedcomp = First[Select[p,NumberQ]];
	p =  {p /. x[_] -> - offset, p /. x[_] -> 
		v[T] - fixedcomp + offset};
	If[labels,
	   List[Line[p],
	         Text[
		HoldForm[v] @ Variables[ineq[[1]]] /. x[i_] -> i,
		(textpoint = p[[2]] /. toSimplex),
		- Sign[textpoint]]
	    ],
	   Line[p]
	]
];
(*
Utility functions
*)
Payoff[y_List] := Thread[Rule[PayoffVector,y]];

(*
Subsets[T_List] := 
	Sort[Flatten /@ Distribute[{{},{#}} & /@ T, List]] 
*)
(*
This definition was devised by Stan Wagon,  The Mathematica Journal 1, Spring 1991, p 46
*)
LeastCoreAux[constraints_,opts:OptionsPattern[Nucleolus]] :=
     Module[{lp,pt,value,newConstraints,binding,nonbinding,newconst,res,zf,res1},
	mthd=OptionValue[Method];
	{zf,res} =  LinearOptimization[e-f,
		Relax[constraints,e-f],
		Join[PayoffVector,{e,f}],{"PrimalMinimumValue","PrimalMinimizer"},Method->mthd
		];
        res1=MapThread[Rule,{PayoffVector,Take[res,Length[T]]}];
	value = zf;
	pt = PayoffVector /. res1;
	newConstraints = Relax[constraints, value];
		(*Partition into two sets *)

	binding = Select[newConstraints, 
		# /. GreaterEqual :> Equal /. res1 & ];
 	nonbinding = Complement[newConstraints,binding];
	newconst = Join[NullVariables[binding], nonbinding];
                    If[newconst === constraints, newconst, LeastCoreAux[newconst,Method->mthd]]
];

NVectorQ[x_] := VectorQ[x,NumberQ];

NonNegativeVector[x_List] := And @@ NonNegative[x];

NonPositiveVector[x_List] := NonNegativeVector[-x];

NullVariables[ineq_] := Module[{},
	n = Count[ineq,_Equal] ; (* no of equations *)
	ns = NullSpace @ Transpose @ 
		ToMatrix[ineq /. GreaterEqual -> Equal];
	binary = Cases[{Take[#,n],Drop[#,n]} & /@ ns,
	   ({x_,y_ } /; NonPositiveVector[x] && NonNegativeVector[y] )];
	If[Length[binary] > 0,
	    (null = Flatten[First[binary]];		
	    Sort[
		#[[1]] /. (GreaterEqual :> Equal /; #[[2]] >0) &
			 /@ Thread[{#1,#2}& [ineq,null]]]),
	    ineq
	]
];

Relax[ineq_, epsilon_] :=  ineq /. 
		lhs_ >= rhs_ -> lhs >= rhs - epsilon;

ToMatrix[eqns_] := Module[{vars},	(* assumes standard form *)
	vars = Union @@
		Cases[eqns,Equal[lhs_,rhs_] :> Variables[lhs]];
	Cases[eqns,Equal[lhs_,rhs_] :>
	    Append[(Coefficient[lhs,#] & /@ vars),
			      rhs]
	]
];

End[];
(*
Some examples
*)
(*
BankruptcyGame := (
T = {1,2,3};
Clear[v];
v[{}] = 0;
v[{1}]	 = 10;
v[{2}]	 = 20;
v[{3}]	 = 30;
v[{1,2}]	 = 50;
v[{1,3}]	 = 60;
v[{2,3}]	 = 70;
v[T]	 = 100;
)

(*
ThreeWayMarketGame := (
T = {f,m,s};
Clear[v];
v[{}] = 0;
v[{f}] = 1;
v[{m}] = v[{s}] = 0;
v[{f,m}] = 2;	v[{f,s}] = 3;	v[{m,s}] = 0;
v[T] = 3;
)
*)

ThreePersonMajorityGame := (
T = {1,2,3};
Clear[v];
v[{}] = 0;
v[{i_}] = 0;
v[{i_,j_}] = 1;
v[T] = 1;
)

CorporationGame := (
T = {1,2,3,4};
Clear[v];
W = {{2,4},{3,4},{1,2,3},{1,2,4},{1,3,4},{2,3,4},{1,2,3,4}};
v[S_] := 1 /; MemberQ[W,S];
v[S_] := 0 /; FreeQ[W,S];
)


LectureTourGame := (
T = {Frankfurt, Paris, Vienna};
Clear[v]; v[{}] = 0;
v[{i_}] = 0;
v[S_List] := Plus @@ (c[{#}] & /@ S) - c[S];
c[{Frankfurt}] =750;
c[{Paris}]    =750;
c[{Vienna}]   =1800;

c[{Frankfurt,Paris}]  = 1200;
c[{Frankfurt,Vienna}] =1950;
c[{Paris,Vienna}]     =1800;

c[{Frankfurt,Paris,Vienna}] =2400;
)


ThreePlayerGame := (
T = {1,2,3};
Clear[v]; v[{}] = 0;
v[{i_}] = 0;
v[{1,2}] = 50;
v[{1,3}] = 20;
v[{2,3}] = 10;
v[{1,2,3}] = 60;)


FourPlayerGame := (
T = {1,2,3,4};
Clear[v]; v[{}] = 0;
v[T] = 2;
v[{1,2,3}] = v[{1,2,4}] = v[{1,3,4}] = v[{2,3,4}] = 1;
v[{1,2}] = v[{3,4}] = v[{1,4}] = v[{2,3}] = 1;
v[{1,3}] = 1/2;
v[{2,4}] = 0;
v[{i_}] = 0;
)

*)
EndPackage[]
