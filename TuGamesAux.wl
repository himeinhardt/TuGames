(* ::Package:: *)

(* :Title: TuGamesAux.m *)
(* Release Date: 28.09.2021 *)
(* Version: 3.0.0 *)

(* :Context: TuGamesAux` *)

(* :Summary:	
    This package provides some auxiliary functions to the package TuGames.m.
*)			

(* :Author:		
    Holger Ingmar Meinhardt
    Department of Economics
    University of Karlsruhe (KIT) 
    E-Mail: Holger.Meinhardt@wiwi.uni-karlsruhe.de
*)

(* :Package Version: 3.0.0 *)

(* 
   :Mathematica Version: 12.x

*)

(* :Sources:
   Maschler JET, 13, pp. 184-192.

*)

(*:Keywords:
 Extracting the coefficient from a LP. Solving the primal and dual problem.
*)

(* :History:

   Version 1.1
    
    The following functions have been added:

     ContestedGarment[],TalmudicRule[].

   Version 1.3
    
    The following functions have been added:

      Angle[],LieBracket[]

   Version 1.5
    
    The following functions have been added:
 
      AssignmentProblem[],GenProfitMatrix[],AdjointMatrix[],HermitianMatrixQ[].
    
    Some code adjustment and clean up.

   Version 1.6

    The following functions have been added:

    GetCardinalityGame[],SymGameType2[],SymGameType3[],SymGameType4[],SymGameSizeK[],Coal2Dec[].

    HermitianMatrixQ[]  - has been renamed due to a name conflict to IsHermitianMatrixQ[]. 
    ModestBankruptcy[]  - has changed its behavior, only two input arguments are allowed. 
    GreedyBankruptcy[]  - has changed its behavior, only two input arguments are allowed. 
    TalmudicRule[]      - has changed its behavior, only two input arguments are allowed. 
   
   Version 1.7

    SelectPart[]        - Superfluous, has been removed.  
    AssignSymVal[]      - Superfluous, has been removed. 
    LPtoMatrix[]        - has been modified to clean up and to simplify the code.

   Version 1.8
    LPtoMatrix[]        - fixes incorrect computation due to wrong order into the boundary vector.

   Version 2.2
       Transcription of the old option rules to the new ones invented by Mathematica 8.x.
       This package is now exclusively dedicated to Mathematica version 8.x and higher.    

    Version 2.3:
       Change protected command SubsetQ[] to SubSetQ[] from the VertexEnum package. Order is
       reversed to SubsetQ[] which is new in Mathematica version 10.x.

    Version 2.5.4:
       Adding the function Sets2Dec[] that transcribes a set of coalitions into its unique integer
       representations. Moreover, we add the function BalancedSystemQ[] that should check if a collection
       of sets is balanced. However, use it with care, it returns for n=>4 incorrect results probably due to 
       a bug within the DualLinearProgramming. For an example see ChangeLog.


    Version 2.6.0:
       Performing some code maintenance.

    Version 3.0.0:
       Not anymore backward compatible to Mathemaitca versions smaller than 12 due to the port
       to the new collection of algorithms for solving convex problems introduced in version 12.
*)

BeginPackage["TUG`TuGamesAux`"];

Angle::usage = 
"Angle[x_vec,y_vec] computes the angle of the two vectors x and y.";

AssignmentProblem::usage =
"AssignmentProblem[buyers, sellers, profitmat] determines the characteristic values from an 
 assignment problem. These values can be used to define the corresponding assignment game.";

BalancedSystemQ::usage = 
"{bcQ,cfs}=BalancedSystemQ[coll,T] checks whether the collection of sets 'coll' is balanced.
 It returns a True or False on the first return value, at the second position the weights of
 the balanced collection are returned." ;

WeaklyBalancedSystemQ::usage =
"bcQ=WeaklyBalancedSystemQ[coll,b0,T] checks whether the collection of sets 'coll' in connection with 
 a set of single coalitions b0 -- could be empty -- is weakly balanced. It returns a True or False." ;

GenProfitMatrix::usage = 
"GenProfitMatrix[valuation_buyers,valuation_sellers] generates a profit matrix for an assignment 
 problem by the list of valuation of buyers and sellers.";

ComplementaryMarket::usage = 
"ComplementaryMarket[Tlist,Plist_,Qlist,opts] computes the coalitional values of a market situation 
 with complementary goods. See Maschler JET, 13, pp. 184-192. The set P can be understood as manufactures 
 and Q as workers. The set T is the player set with P union Q.";

ContestedGarment::usage = 
"ContestGarment[Estate,{d1,d2}] computes a solution for a contested garment or two-creditor modest 
 bankruptcy problem.";

TalmudicRule::usage = 
"TalmudicRule[Estate,{d1,d2,d3,...,dn}] computes a solution for a contested garment or n-creditor modest 
 bankruptcy problem. The solution coincides with the nucleolus of the corresponding bankruptcy game.";

GreedyBankruptcy::usage = 
"GreedyBankruptcy[Estate,claims] computes the coalitional values for a greedy bankruptcy game.";

LPtoMatrix::usage = 
"LPtoMatrix[zf, const, var] extracts the coefficient from a LP. Where 'zf' is the objective function,
 'const' is the linear constraint set and 'var' is set of variables.";

AdjointMatrix::usage=
"AdjointMatrix[mat_List] computes the conjugate transpose of the matrix 'mat'.";

IsHermitianMatrixQ::usage:=
"IsHermitianMatrixQ[mat_List] checks whether a square matrix is self adjoint.";

ModestBankruptcy::usage = 
"ModestBankruptcy[Estate,claims] computes the coalitional values for a modest bankruptcy game.";

GetCardinalityGame::usage = 
"GetCardinalityGame[T,k] assigns a worth of zero to a coalition of size=<k<Length[T].
 Larger coalition will be assigned according to its cardinality. The resultant vector can be 
 used to define a game.";
 
SymGameSizeK::usage =
"SymGameSize2[T,k,val] constructs a symmetric game where a cycle of coalitions of size k getting
 a worth of 'val' and the grand coalition gets 2*val. The value k must be an integer between
 2 and Length[T]. Remind that T is the player set.";

SymGameType2::usage =
"SymGameType2[T,S,val] constructs a game where all coalitions of size 2 satisfying 
 Intersection[S,Complement[T,S]] getting a worth of 'val', the grand coalition gets 2*val,
 and otherwise zero. Coalition S must have size not less than 2.";

SymGameType3::usage =
"SymGameType3[T,S,val] constructs a game where all coalitions of size 3 satisfying 
 Intersection[S,Complement[T,S]] getting a worth of 'val', the grand coalition gets 2*val,
 and otherwise zero. Coalition S must have size not less than 3.";

SymGameType4::usage =
"SymGameType4[T,S,val] constructs a game where all coalitions of size 4 satisfying 
 Intersection[S,Complement[T,S]] getting a worth of 'val', the grand coalition gets 2*val,
 and otherwise zero. Coalition S must have size not less than 4.";

SolvePrimal::usage = 
"SolvePrimal[zf, const, var] solves a primal problem.";

SolveDual::usage = 
"SolveDual[zf, const, var] solves the corresponding dual problem.";

EuclidianDistance::usage = 
"EuclidianDistance[liste,refliste] computes the Euclidian distance of the vector 'liste' w.r.t. 
 the vector 'refliste'.";

NearRingQ::usage =
"NearRingQ[list,T] checks if the collection of sets is a near ring.";

LieBracket::usage = 
"LieBracket[mat01,mat02] computes the commutator of the (nXn)-matrices mat01 and mat02.";

Coal2Dec::usage =
"Coal2Dec[n_Integer] converts the set of proper coalitions to its unique integer representations.";

Sets2Dec::usage
"Sets2Dec[list] converts a collection of coalitions to its unique integer representations.";

RStirlingNumber::usage=
"RStirlingNumber[r,n,k] computes the r-associated Stirling number of the second kind.";

(* :Options: *)

Options[AssignmentProblem] := {Verbose -> False};
Options[BalancedSystemQ] := {Method-> RevisedSimplex};
Options[ComplementaryMarket] := {MarketParameter -> (1/2)};
Options[WeaklyBalancedSystemQ] := {Method-> RevisedSimplex};

(* :Error Messages: *)

(* :One Argument: *)
AdjointMatrix::argerr="One argument was expected.";
Coal2Dec::argerr="One argument was expected.";
IsHermitianMatrixQ::argerr="One argument was expected.";
Sets2Dec::argerr="One argument was expected.";

(* :Two Arguments: *)
Angle::argerr="Two arguments were expected.";
BalancedSystemQ::argerr="Two arguments were expected.";
ContestedGarment::argerr="Two arguments were expected.";
EuclidianDistance::argerr="Two arguments were expected.";
GenProfitMatrix::argerr="Two arguments were expected.";
GreedyBankruptcy::argerr="Two arguments were expected.";
GetCardinalityGame::argerr="Two arguments were expected.";
LieBracket::argerr="Two arguments were expected.";
NearRingQ::argerr="Two arguments were expected.";
ModestBankruptcy::argerr="Two arguments were expected.";
TalmudicRule::argerr="Two arguments were expected.";


(* :Three Arguments: *)
AssignmentProblem::argerr="Three arguments were expected.";
ComplementaryMarket::argerr="Three arguments were expected.";
LPtoMatrix::argerr="Three arguments were expected.";
RStirlingNumber::argerr="Three arguments were expected.";
SolveDual::argerr="Three arguments were expected.";
SolvePrimal::argerr="Three arguments were expected.";
SymGameSizeK::argerr="Three arguments were expected.";
SymGameType2::argerr="Three arguments were expected.";
SymGameType3::argerr="Three arguments were expected.";
SymGameType4::argerr="Three arguments were expected.";
WeaklyBalancedSystemQ::argerr="Three arguments were expected.";

Begin["`Private`"];
Which[$OperatingSystem === "Unix", Needs["TUG`vertex`VertexEnum`"],
      $OperatingSystem === "Windows", Needs["TUG`vertex`VertexEnum`"],
      $OperatingSystem === "MacOSX", Needs["TUG`vertex`VertexEnum`"],
      True, Needs["VertexEnum`"]
];


Angle[args___]:=(Message[Angle::argerr];$Failed);
Angle[x_?VectorQ, y_?VectorQ] :=  ArcCos[Divide[x.y,(Norm[x, 2] Norm[y, 2])]]/Degree // N;

(*Extracting the coefficients from an LP *)

LPtoMatrix[args___]:=(Message[LPtoMatrix::argerr];$Failed);
LPtoMatrix[obf_, const_List, var_List]:=
    Module[{zf, ineq, coemat, coebv, greq, lseq, eqeq, grout, lsout, eqout, ext1,
       ext2, ext3, bv01, bv02, bv03, nbv01, bvec,ar,ps,rl},
    zf = Coefficient[obf, var];
(*    ineq = Simplify[const]; *)
    coemat = Coefficient[#[[1]], var] & /@ const;
    coebv = Last[#] & /@ const;
    greq = Position[const, GreaterEqual];
    eqeq = Position[const, Equal];
    lseq = Position[const, LessEqual];
    grout = Outer[List, First[#] & /@ greq];
    eqout = Outer[List, First[#] & /@ eqeq];
    lsout = Outer[List, First[#] & /@ lseq];
    ext1 = If[SameQ[grout,{}], grout, Extract[coebv, grout]];
    ext2 = If[SameQ[eqout,{}], eqout, Extract[coebv, eqout]];
    ext3 = If[SameQ[lsout,{}], lsout, Extract[coebv, lsout]];
    bv01 = If[SameQ[ext1, {}], ext1,
        Flatten[MapThread[List, {{#}, {1}}]] & /@ ext1];
    bv02 = 
      If[SameQ[ext2,{}], ext2, 
        Flatten[MapThread[List, {{#}, {0}}]] & /@ ext2];
    bv03 = 
      If[SameQ[ext3,{}], ext3, 
        Flatten[MapThread[List, {{#}, {-1}}]] & /@ ext3];
    bv01 = If[SameQ[bv01,{}], {bv01}, bv01 ];
    nbv01 = If[SameQ[bv02,{}], bv01, AppendTo[bv01, bv02]; FlattenAt[bv01,Length[bv01]]];
    nbv01 = If[SameQ[bv03,{}], nbv01, AppendTo[nbv01, bv03]; FlattenAt[nbv01,Length[nbv01]]];
    bvec = DeleteCases[nbv01,{}];
    ar = Array[{0,0} &,Length[bvec]];
    ps = Flatten[{grout,eqout,lsout}];
    rl = MapThread[Rule,{ps,bvec}];
    bvec = ReplacePart[ar,rl];
    {zf, coemat, bvec}
    ];


SolvePrimal[args___]:=(Message[SolvePrimal::argerr];$Failed);
SolvePrimal[zf_,eq_List,var_List, bd_:{}, opts:OptionsPattern[LinearOptimization]] := 
  Module[{obf, cmat, bvect, res, nzf, rl},
    {obf, cmat, bvect} = LPtoMatrix[zf, eq, var];
    cmat = SparseArray[cmat];
(*    res = LinearProgramming[obf, cmat, bvect, bd,opts]; *) (*second solution??? *)
    bv=-First[#] &/@ bvect;
    eqm=cmat[[1]];
    beq=bv[[1]];
    {res,nzf}=LinearOptimization[obf,{cmat,bv},{{eqm},{beq}},{"PrimalMinimizer", "PrimalMinimumValue"},Method->"RevisedSimplex"];
    rl = MapThread[Rule, {var, res}];
    Prepend[{rl}, nzf]
    ];


SolveDual[args___]:=(Message[SolveDual::argerr];$Failed);
SolveDual[zf_, eq_List, var_List, bd_:{},opts:OptionsPattern[LinearOptimization]]:=
 Module[{obf, cmat, bvect, tobf, eqm, beq, res, nzf, yvar, dim,rl},
   {obf, cmat, bvect} = LPtoMatrix[zf,eq, var];
   tobf = First[#] & /@ bvect;
   eqm=cmat[[1]];
   beq=tobf[[1]];
   cmat = SparseArray[cmat];
   {res,nzf}=LinearOptimization[obf,{cmat,-tobf},{{eqm},{-beq}},{"DualMaximizer", "DualMaximumValue"},Method->"RevisedSimplex"];
   dim = Dimensions[cmat];
   yvar = Global`y[#] & /@ Table[i, {i, First[dim]}];
   rl = MapThread[Rule, {yvar, First[res]}];
   Prepend[{rl}, nzf]
  ];


(* Near Ring *)

NearRingQ[args___]:=(Message[NearRingQ::argerr];$Failed);
NearRingQ[set_List,T1_] := Module[{boolval},
    boolval = Which[Depth[set] === 3,  CheckNearRing[set,set,T1],
                    Depth[set] === 4,  CheckNearRing[#,#,T1] & /@ set,
                    True, DisplayMessNearRing[set]];
   Return[boolval]
    ];


CheckNearRing[Univers_List, RestSet_List, T2_, prevres_:{}] := 
  Module[{fi, restuni, res, allres, boolval},
    fi = Flatten[Take[RestSet, 1]];
    res = NearRingDef[fi, #, T2, Univers] & /@ RestSet;
    restuni = Delete[RestSet, 1];
    allres = FlattenAt[Append[res, prevres], Length[res] + 1];
    Which[Length[restuni] === 0, Apply[And, allres], True, 
      CheckNearRing[Univers, restuni, T2, allres]]
    ];


NearRingDef[A_, B_, R1_,Univers_List] := Module[{},
    SameQ[Union[A, B],R1] || SameQ[Intersection[A, B], {}] || (Length[Position[Univers, Union[A, B]]] != 0 && 
          Length[Position[Univers, Intersection[A, B]]] != 0)
    
    ];


DisplayMessNearRing[set_List] := (Print["Depth is equal to ", Depth[set]];
      Print["The collection of sets must be of depth 3 or 4."];
      Print["Usage: NearRi[set]"]);


(* Market Situation  *)

teilm[T_List]:=Sort[Flatten /@ Distribute[({{}, {#1}} &) /@ T, List]];

ComplementaryMarket[args___]:=(Message[ComplementaryMarket::argerr];$Failed);
ComplementaryMarket[T_List,P_List,Q_List,opts:OptionsPattern[ComplementaryMarket]]:= Module[{em,param,coal,val},
    em = Intersection[P,Q];
    Which[Length[em] != 0, Print["The sets P and Q are not disjoint."]; Return[],
          True, 
              param = OptionValue[MarketParameter];  
              coal = Subsets[T];
              val = Min[Length[Intersection[#, P]], a Length[Intersection[#, Q]]] & /@ coal;
              val /. a -> param
          ]
];

(* Bankruptcy Situation *)

x[S_List]:= Plus @@ x /@ S;

ModestBankruptcy[args___]:=(Message[ModestBankruptcy::argerr];$Failed);
ModestBankruptcy[E_?NumberQ,claims_List]:= Module[{lc,T,asscl,compset,vecval},
    lc=Length[claims];
    T=Range[lc];
    asscl = MapThread[Rule,{x /@ T,claims}];
    compset = Reverse[Subsets[T]];
    vecval = Max[0, E -  x[#]] &/@ compset; 
    vecval /.asscl
];

GreedyBankruptcy[args___]:=(Message[GreedyBankruptcy::argerr];$Failed);
GreedyBankruptcy[E_?NumberQ,claims_List]:= Module[{lc,T,asscl,vecval},
    lc=Length[claims];
    T=Range[lc];
    asscl = MapThread[Rule,{x /@ T,claims}];
    vecval = Min[E, x[#]] &/@ Subsets[T];
    vecval /.asscl
];

ContestedGarment[args___]:=(Message[ContestedGarment::argerr];$Failed);
ContestedGarment[Estate_?NumberQ, Claims_List] := 
  Module[{clset, extdset, award, param},
    clset = If[Length[Claims] === 2, Map[x[#] &, Range[2]], ErrorMessage; Return[]];
    extdset = {clset, Reverse[clset]};
    award = MapThread[(E - Max[0, E - #1] - Max[0, E - #2])/2  + Max[0, E - #2] &, extdset];
    param = MapThread[Rule, {{E, clset[[1]], clset[[2]]}, {Estate, Claims[[1]], Claims[[2]]}}];
    award /. param
    ];

ErrorMessage := (Print["The Contested Garment Problem is a two-Creditor Bankruptcy Problem."];
      Print["A Claims List of the Length of two is expexted like: ", "{d1,d2}"];);


TalmudicRule[args___]:=(Message[TalmudicRule::argerr];$Failed);
TalmudicRule[Estate_?NumberQ, Claims_List] := 
  Module[{clvar, sumcl, param, eqsys, nclsum,sol, sol01},
    clvar = Map[x[#] &, Range[Length[Claims]]];
    sumcl = Total[ clvar];
    param = MapThread[Rule, {clvar, Claims}];
    nclsum = sumcl /. param;
    eqsys = 
      If[Greater[(1/2)*nclsum, Estate], 
        Min[\[Lambda], (1/2)*#] & /@ Claims, 
        Max[(# - \[Lambda]), (1/2)*#] & /@ Claims];
    sol = Reduce[Total[ eqsys] == Estate, \[Lambda]];
    sol01 = MapThread[Rule, {{\[Lambda]}, {sol[[2]]}}];
    eqsys /. sol01
    ];


(* Assignment Problem *)
(* User interface *)

GenProfitMatrix[args___]:=(Message[GenProfitMatrix::argerr];$Failed);
GenProfitMatrix[valOfbuyers_List, valOfsellers_List] := Module[{prfij,valmat},
If[SameQ[First[Dimensions[valOfsellers]],First[Dimensions[valOfbuyers]]],
    Which[SameQ[VectorQ[valOfbuyers],True],
                   valmat = Map[valOfbuyers - # &, valOfsellers];
                   prfij = Map[Max[0,#]&,#] & /@ valmat; 
                   Transpose[prfij],
                 SameQ[MatrixQ[valOfbuyers],True],
                    valmat=valOfbuyers - valOfsellers;
                    prfij = Map[Max[0,#]&,#] & /@ valmat, 
                 True,  Print["Valuation of buyers is neither a vector nor a matrix."];
       ], 
 Print["Input data format is not correct. It must be symmetric."];
 Print["Valuation of buyers must be a vector or a matrix of dimension: ", First[Dimensions[valOfsellers]] ];
    ]
  ];



AssignmentProblem[args___]:=(Message[AssignmentProblem::argerr];$Failed);
AssignmentProblem[buyers_List, sellers_List, profmat_List, opts:OptionsPattern[AssignmentProblem]] := 
  Module[{bplayer, splayer, extprofmat}, 
     vrb = OptionValue[Verbose];
    Which[First[buyers] >= First[sellers], MessIdenticalPlayerSet;,
                       True, 
                       {bplayer, splayer, extprofmat} =  
                             If[Length[buyers] != Length[sellers], 
                                    MessInsertDummy;
                                    ExtAssProb[buyers, sellers, profmat], 
                              {buyers, sellers, profmat}];
                       AssignmentVal[bplayer, splayer, extprofmat, opts]
                                 ]
    ];

MessIdenticalPlayerSet := (Print[ "The set of buyers and sellers is identical."];
      Print["Or the set of buyers and sellers is mixed up."];
      Print["Rename at least the set of sellers"];
      Print["Or put the set of buyers and sellers in correct order."]);

MessInsertDummy:=Print["Inserting dummy buyers/sellers to extend the asymmetric assignment problem into a symmetric one. "];

ExtAssProb[buyers_List, sellers_List, profmat_List] := 
  Module[{newby, newsel, extmat},
    {newby, newsel} = NewPlayerSet[buyers, sellers];
      extmat = FillMatrix[profmat];
    {newby, newsel, extmat}
   ];

NewPlayerSet[buyers_List, sellers_List] := Module[{bplayer, splayer},
    Which[Length[buyers] > Length[sellers],                                                      \
                         splayer = Range[Length[buyers] + 1, 2Length[buyers]]; {buyers, splayer},
                  Length[buyers] < Length[sellers], 
                        bplayer = Range[1, Length[sellers]];  
                        splayer = Range[Length[bplayer] + 1, 2Length[bplayer]]; 
                       {bplayer, splayer}, 
                 True, {buyers, sellers}
            ]
    ];


FillMatrix[profmat_List] := Module[{dm},
    dm = Dimensions[profmat];
    Which[dm[[1]] > dm[[2]], ClmsFillZeros[profmat, dm[[1]], dm[[2]]],
                 dm[[1]] < dm[[2]], RwsFillZeros[profmat, dm[[1]], dm[[2]]],
                 True, profmat
      ]
    ];

ClmsFillZeros[profmat_List, rws_, clms_] := Module[{zromat, nwmat},
    zromat = Table[Table[0, {i, rws}], {i, rws - clms}];
    nwmat = FlattenAt[Append[Transpose[profmat], zromat], -1];
    Transpose[nwmat]
    ];

RwsFillZeros[profmat_List, rws_, clms_] := Module[{zromat, nwmat},
    zromat = Table[Table[0, {i, clms}], {i, clms - rws}];
    nwmat = FlattenAt[Append[profmat, zromat], -1];
    nwmat
    ];


AssignmentVal[bplayer_List, splayer_List, assmat_List, opts:OptionsPattern[AssignmentProblem]] := Module[{cmg,matchpl,T1},
     vrb = OptionValue[Verbose];
    Clear[T1];
    T1= Union[bplayer, splayer];
    cmg = Teilmg[T1];
    Which[SubSetQ[#, bplayer], Set[v[#], 0],
                  SubSetQ[#, splayer], Set[v[#], 0],
                  True, matchpl = MatchPairs[bplayer, splayer,#, opts];
                        MaxProfit[matchpl, assmat, bplayer, splayer, opts]] & /@ cmg 
    ];

(* Borrowed from M. Carter *)
Teilmg[T_List] :=Sort[Flatten /@ Distribute[{{},{#}} & /@ T, List]];

(* Main functions to compute the characteristic function values for an Assignment game. *)

MatchPairs[ bplayer_List, splayer_List, subst_List, opts:OptionsPattern[AssignmentProblem]] := 
Module[{vrb,intcob, intcos, prtextb, prtexts, permcb, extcob, extcos, mptprs,rvmp},
  vrb = OptionValue[Verbose];
  intcob = Intersection[subst, bplayer];
  intcos = Intersection[subst, splayer];
 If[SameQ[vrb,True], 
  Print["intcob=",intcob];  
  Print["intcos=",intcos];,
  True];
  Which[Length[intcob] > Length[intcos], 
      If[Length[intcos] === 1, 
                    extcos = Flatten[Table[intcos, {i, Length[intcob]}]]; 
                    mptprs = MapThread[List, {intcob, extcos}];
                     If[vrb === True,  Print["mptprs=", mptprs];,True];
                    Split[mptprs, Length[mptprs]],
             {extcob,extcos} =  ExtPlayerSet[intcob, intcos];
     If[SameQ[vrb,True], 
         Print["extcob=", extcob];  
         Print["extcos=", extcos];,
         True];
        mptprs = MatchingPairs[extcos, extcob];
       If[SameQ[vrb,True],  Print["mptprs=", mptprs];,True];
       Map[Reverse[#] &,#] & /@ mptprs ],
    Length[intcob] < Length[intcos], 
    If[Length[intcob] === 1, 
               extcob = Flatten[Table[intcob, {i, Length[intcos]}]]; 
               mptprs = MapThread[List, {intcos, extcob}]; 
               rvmp = Reverse[#] & /@ mptprs;
              Split[rvmp, Length[rvmp]],
         {extcob,extcos} =  ExtPlayerSet[intcob, intcos];
     If[SameQ[vrb,True], 
         Print["extcob=", extcob];  
         Print["extcos=", extcos];,
         True];
        MatchingPairs[extcob, extcos]],
    Length[intcob] == Length[intcos], 
        Which[Length[intcob] === 1, Flatten[{intcob, intcos}],
                      Length[intcob] === (Length[Union[bplayer, splayer]]/2),  
                           permcb = Permutations[intcob];
                          MapThread[List, {#, intcos}] & /@ permcb,
                    True,
                        {extcob,extcos} =  ExtPlayerSet[intcob, intcos];
                     If[SameQ[vrb,True], 
                        Print["extcob=", extcob];  
                        Print["extcos=", extcos];,
                         True];
                       mptprs = MatchingPairs[extcos, extcob];
                     If[SameQ[vrb,True],  Print["mptprs=", mptprs];,True];
                            Map[Reverse[#] &,#] & /@ mptprs ]
    ]
  ];


ExtPlayerSet[intcob_List,intcos_List]:=Module[{extcob,extcos},
              extcob = Flatten[Table[intcob, {i, 2}]];
              extcos = Flatten[Table[intcos, {i, 2}]];
              {extcob,extcos}
             
];



MatchingPairs[extbuyer_List, extseller_List] := Module[{tkmin, nwsl, nwbuy,mptab},
    tkmin = Min[Length[extbuyer], Length[extseller]];
    nwsl =  Table[Take[extseller, {i,  i + (tkmin/2) - 1}], {i, (Length[extseller]/2)}];
    nwbuy =  If[OddQ[(Length[extbuyer]/2)] === True, 
        Table[Take[extbuyer, {i,  i + (Length[extbuyer]/2) - 1}], {i, (Length[extbuyer]/2)}], 
        Table[Take[extbuyer, {i, i + (tkmin/2)-1}], {i, (Length[extbuyer]/2)}]];
    mptab = Table[MapThread[List, {nwbuy[[i]], #}] & /@ nwsl, {i, Length[nwbuy]}];
    Apply[Join, mptab]
    ];


MaxProfit[matchli_List, assmat_List, bplayer_List, splayer_List, opts:OptionsPattern[AssignmentProblem]] := 
  Module[{vrb,matchmat, profitmat, profitli},
    vrb = OptionValue[Verbose];
    If[SameQ[vrb,True], Print["matpl=", matchli];, True];
    Clear[Global`beta];
    matchmat = Thread[List[#,splayer]] & /@ bplayer; 
    profitmat = Map[Global`beta, #] & /@ matchmat;
    MapThread[Set[#1, #2] &, {profitmat, assmat}];
    profitli = Which[Depth[matchli] === 2, Global`beta[matchli] ,
                                    Depth[matchli] === 3, Global`beta[#] & /@ {matchli},
                                    Depth[matchli] === 5, Table[Table[Global`beta[#] & /@ matchli[[j, i]], {i, Length[matchli[[j]]]}], {j, Length[matchli]}],
                                    True, Table[Global`beta[#] & /@ matchli[[i]], {i, Length[matchli]}]];
    If[SameQ[vrb,True], Print["prfli=", profitli];, True];
    Which[Depth[matchli] <= 3, Max[Total[ profitli]], 
                 Depth[matchli] === 5, Max[Table[Total[ #] & /@ profitli[[i]], {i, Length[profitli]}]], 
                 True, Max[Total[ #] & /@ profitli]]
    ];

(* Euclidean Distance, Spelling Euclidian is not protected! *)

EuclidianDistance[args___]:=(Message[EuclidianDistance::argerr];$Failed);
EuclidianDistance[liste_,refliste_]:=
          Which[Depth[liste] == 3, EuclidianDist[#, refliste] & /@ liste,
                Depth[liste] == 2, EuclidianDist[liste, refliste],
                True,DisplayEuk[liste]];

EuclidianDist[liste_, refliste_] := N[Power[Total[ MapThread[Power[#1 - #2, 2] &, {liste, refliste}]], (1/2)]];

DisplayEuk[liste_]:=(
       Print["Depth is equal to ",Depth[liste]];
       Print["Usage: EuclidianDistance[liste,refliste]"];
       Print["Input format of the variable 'liste' is not correct."];
       Print["The variable 'liste' must be a list."]
);


(* Assigning symmetric values *)


AssignValues[univers_List, alp_List] := Module[{},
      Which[Length[alp] != 0,
        Which[First[univers] === First[alp], Global`\[Alpha], 
          Length[First[univers]] <= 4, Global`\[Lambda], True, Global`\[Sigma]],
                          True,
        Which[Length[First[univers]] ==  5,Global`\[Theta],
          Length[First[univers]] ==  6, Global`\[Phi],
          Length[First[univers]] >= 7, 
          If[Length[First[univers]] === 7, Global`\[Beta], 
            v[First[univers]] = Global`\[Gamma]], True, Global`\[Sigma]]]];


Coal2Dec[args___]:=(Message[Coal2Dec::argerr];$Failed);
Coal2Dec[n_Integer]:=Module[{T,ps,prs,xp,sxp},
   T=Range[n];
   ps=Subsets[T];
   prs=Delete[ps,1];
   xp=prs-1;
   sxp=(2^#)&/@xp;
   Total[#]&/@ sxp
];


Sets2Dec[args___]:=(Message[Sets2Dec::argerr];$Failed);
Sets2Dec[sets_List]:=Module[{T,ps,prs,xp,sxp},
   xp=sets-1;
   sxp=(2^#)&/@xp;
   Total[#]&/@ sxp
];

BalancedSystemQ[args___]:=(Message[BalancedSystemQ::argerr];$Failed);
BalancedSystemQ[coll_List, T_List, opts:OptionsPattern[BalancedSystemQ]] :=
  Module[{mthd,zvec, ovec, pos, mat, tmat, smat, d1, d2, veco, zf, bv, am, tbv, yineq, yeq, cf, rs, bq, bcQ},
   mthd=OptionValue[Method];   
   zvec = Array[0 &, Length[T]];
   ovec = Array[1 &, Length[T]];
   pos = Outer[List, #] & /@ coll;
   mat = ReplacePart[zvec, 1, #] & /@ pos;
   tmat = Transpose[mat];
   {d1, d2} = Dimensions[tmat];
   veco = Table[1, {i, d2}];
   (*max Problem*)
   zf = -tmat.veco;
   AppendTo[mat, ovec];
   bv = Array[0 &, d2 + 1];
   smat = SparseArray[mat];
   {{yineq,yeq},res}=LinearOptimization[zf,{smat,bv},{{ovec},{0}},{"ConstraintSensitivity","PrimalMinimizer"},Method->mthd];
   cf = (Delete[-yineq, -1] + 1);
   rs = tmat.cf;
   bq = Round[res]; 
(*
   Print["bq=",bq];
   Print["cf=",cf/First[rs]];
*)
   bcQ = FreeQ[bq, _?Positive] && FreeQ[bq, _?Negative] && Apply[And, NumberQ[#] & /@ bq];
   If[SameQ[bcQ, True], {bcQ, cf/First[rs]},
      {bcQ, Array[Indeterminate &, Length[T]]}]
];

WeaklyBalancedSystemQ[args___]:=(Message[WeaklyBalancedSystemQ::argerr];$Failed);
WeaklyBalancedSystemQ[coll_List, b0_List,T_List, opts:OptionsPattern[BalancedSystemQ]] :=
  Module[{mthd,zvec, ovec, coll0,pos0, pos, mat, tmat0,tmat, smat, d1, d2, veco, zf, bv, am, tbv, yineq, yeq, cf, rs, bq},
   mthd=OptionValue[Method];
   zvec = Array[0 &, Length[T]];
   ovec = Array[1 &, Length[T]];
   coll0=Complement[coll,b0];
   pos0 = Outer[List, #] & /@ coll0;
   mat0 = ReplacePart[zvec, 1, #] & /@ pos0;
   tmat = Transpose[mat0];
   {d1, d2} = Dimensions[tmat];
   veco = Table[1, {i, d2}];
   (*max Problem*)
   zf = -tmat.veco;
   pos = Outer[List, #] & /@ coll;
   mat = ReplacePart[zvec, 1, #] & /@ pos;
   AppendTo[mat, ovec];
   tmat = Transpose[mat];
   {d1, d2} = Dimensions[tmat];
   bv = Array[0 &, d2];
   smat = SparseArray[mat];
   {{yineq,yeq},res}=LinearOptimization[zf,{smat,bv},{{ovec},{0}},{"ConstraintSensitivity","PrimalMinimizer"},Method->mthd];
   bq = Round[res];
   FreeQ[bq, _?Positive] && FreeQ[bq, _?Negative] && Apply[And, NumberQ[#] & /@ bq]
];


GetCardinalityGame[args___]:=(Message[GetCardinalityGame::argerr];$Failed);
GetCardinalityGame[T_List,k_Integer]:=Module[{cos},
  cos = Subsets[T];
  If[LessEqual[Length[#], k],0,Length[#]] & /@ cos 
];

SymGameSizeK[args___]:=(Message[SymGameSizeK::argerr];$Failed);
SymGameSizeK[T_List,k_Integer,val_Integer]:=Module[{lt2,sbs,rl,tkr,srl},
  lt2=Length[T]/2;
  sbs=Subsets[T];
  Set[v[#],0]& /@ sbs;
  v[T]=lt2*val;
  rl=RotateLeft[T,#] & /@ T;
  tkr=Take[#,-k] & /@ rl;
  srl=Sort[#] & /@ tkr;
  Set[v[#],val]& /@ srl;
  v[#] & /@ sbs
];


SymGameType2[args___]:=(Message[SymGameType2::argerr];$Failed);
SymGameType2[T_List,S_List,val_Integer]:=Module[{S2,sbs,csb,asv,cl2,cw},
 S2=Complement[T,S];
 sbs=Subsets[T];
 cl2=If[SameQ[Length[#],2],#,{}] & /@ sbs;
 cl2=DeleteCases[cl2,{}];
 csb=Complement[Drop[sbs,-1],cl2];
 v[T]=2*val;
 asv=Thread[AssValToCoal2[#[[1]],#[[2]],val,S,S2]] & /@ cl2;
 cw=v[#]& /@ sbs;
 MapThread[Set[v[#1],#2] &,{cl2,asv}];
 Set[v[#],0]& /@ csb;
 v[#] & /@ sbs
];


SymGameType3[args___]:=(Message[SymGameType3::argerr];$Failed);
SymGameType3[T_List,S_List,val_Integer]:=Module[{S2,sbs,csb,asv,cl3,cw},
 S2=Complement[T,S];
 sbs=Subsets[T];
 cl3=If[SameQ[Length[#],3],#,{}] & /@ sbs;
 cl3=DeleteCases[cl3,{}];
 csb=Complement[Drop[sbs,-1],cl3];
 v[T]=2*val;
 asv=Thread[AssValToCoal3[#[[1]],#[[2]],#[[3]],val,S,S2]] & /@ cl3;
 cw=v[#]& /@ sbs;
 MapThread[Set[v[#1],#2] &,{cl3,asv}];
 Set[v[#],0]& /@ csb;
 v[#] & /@ sbs
];


SymGameType4[args___]:=(Message[SymGameType4::argerr];$Failed);
SymGameType4[T_List,S_List,val_Integer]:=Module[{S2,sbs,csb,asv,cl4,cw},
 S2=Complement[T,S];
 sbs=Subsets[T];
 cl4=If[SameQ[Length[#],4],#,{}] & /@ sbs;
 cl4=DeleteCases[cl4,{}];
 csb=Complement[Drop[sbs,-1],cl4];
 v[T]=2*val;
 asv=Thread[AssValToCoal4[#[[1]],#[[2]],#[[3]],#[[4]],val,S,S2]] & /@ cl4;
 cw=v[#]& /@ sbs;
 MapThread[Set[v[#1],#2] &,{cl4,asv}];
 Set[v[#],0]& /@ csb;
 v[#] & /@ sbs
];



AssValToCoal2[i_Integer,j_Integer,val_Integer,S1_List,S2_List]:=Module[{},
        Which[SameQ[(i!=j),True],
                   If[(MemberQ[S1,i] && MemberQ[S1,j]),v[{i,j}]=val,0],
             True, Print["NAN"];
        ]
];


AssValToCoal3[i_Integer,j_Integer,k_Integer,val_Integer,S1_List,S2_List]:=Module[{},
        Which[SameQ[(i!=j!=k),True],
                   If[(MemberQ[S1,i] && MemberQ[S1,j] && MemberQ[S2,k]),v[{i,j,k}]=val,0],
             True, Print["NAN"];
        ]
];


AssValToCoal4[i_Integer,j_Integer,k_Integer,l_Integer,val_Integer,S1_List,S2_List]:=Module[{},
        Which[SameQ[(i!=j!=k!=l),True],
                   If[(MemberQ[S1,i] && MemberQ[S1,j] && MemberQ[S2,k] && MemberQ[S2,l]),v[{i,j,k,l}]=val,0],
             True, Print["NAN"];
        ]
];


(* Lie Groups *)

LieBracket[args___]:=(Message[LieBracket::argerr];$Failed);
LieBracket[mat01_?ListQ,mat02_?ListQ]:= mat01.mat02 - mat02.mat01;

(* Linear Algebra *)

(* Borrowed from WolframMathWorld *)

AdjointMatrix[args___]:=(Message[AdjointMatrix::argerr];$Failed);
AdjointMatrix[mat_List] := (Conjugate@Transpose@mat);

IsHermitianMatrixQ[args___]:=(Message[IsHermitianMatrixQ::argerr];$Failed);
IsHermitianMatrixQ[mat_List] := (mat === Conjugate@Transpose@mat);

(* Borrowed from StackExchange *)

RStirlingNumber[args___]:=(Message[RStirlingNumber::argerr];$Failed);
RStirlingNumber[_, 0, 0] = 1;
RStirlingNumber[r_, n_, 1] /; n >= r = 1;
RStirlingNumber[r_, n_, k_] /; r > 0 && n > 0 && k > 0 && n >= k r := 
   RStirlingNumber[r, n, k] = k RStirlingNumber[r, n - 1, k] + Binomial[n - 1, r - 1] RStirlingNumber[r, n - r, k - 1];
RStirlingNumber[___] = 0;

End[];



EndPackage[]
