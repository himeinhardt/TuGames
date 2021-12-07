(* ::Package:: *)

(* :Title: ParaTuGames.m
    : Release Date : 07.12.2021


*)
Off[Needs::nocont]
(* :Context: TUG`ParaTuGames` *)

(* :Summary:	
    This package provides some extensions to the package TuGame for 
    modeling and calculating solutions and properties for cooperative games with 
    transferable utilities in parallel. 
*)			

(* :Author:		
    Holger Ingmar Meinhardt
    Department of Economics
    University of Karlsruhe (KIT)
    holger.meinhardt@wiwi.uni-karlsruhe.de
*)

(* :Package Version: 1.0.2 *)

(* 
   :Mathematica Version: 12.x

*)
(*:Keywords:
   Dual Game, Superadditive Game, Convex Game, Strong Convex Game, Average-Convex Game,
   Kernel, balancing Maximum Excesses.
*)

(* :Sources:
   
   Theo Driessen, Cooperative Games, Solutions and Applications, Kluwer Academic
   Publishers, Dordrecht, 1988.

   E. Inarra and J. Usategui, The Shapley value and average convex games, 
   IJGT, 22, 13-29, 1993.

   M. Maschler, The Bargaining Set, Kernel and Nucleolus, Handbook of Game
   Theory, Chapter 18, 591-647, 1992.

   M. Maschler, B. Peleg and L.S. Shapley, Geometric Properties of Kernel,  
   Nucleolus and related Concepts, in Mathematics of Operations Research, 
   Vol4 Nov. 1979, p. 303-338.

   J-E. Martinez-Legaz, Dual Representation of Cooperative Games based on 
   Fenchel-Moreau Conjugation, Optimization, pp. 291-319, Vol. 36, 1996.

   H. I. Meinhardt, An LP approach to compute the pre-kernel for cooperative games, 
   Computers and Operation Research, Vol 33/2 pp. 535-557,2006.

   H. I. Meinhardt, The Pre-Kernel as a Tractable Solution for Cooperative Games:
   An Exercise in Algorithmic Game Theory, forthcoming in: Theory and Decision Library C,
   Springer Publisher, Heidelberg. pp. 1-247, 2013.  

   A. Meseguer-Artola, Using the Indirect Function to characterize the Kernel of a TU-Game,
   Departament d'Economia i d'Historia Economica, 1997. 
   
   R. T. Rockafellar, Convex Analysis, Princeton University Press, 1970.

   R.E. Stearns, Convergent Transfer Schemes for N-Person Games,
   Transaction American Mathematical Society, 449-459, 1968.

   Hal Varian (Ed.). Economics and Financial Modeling with Mathematica, 
   Springer, 1992. 
*)


(* 
   :History:
*)

Needs["TUG`coop`CooperativeGames`"];
Needs["TUG`TuGames`"];
Needs["TUG`TuGamesAux`"];

Which[$OperatingSystem === "Unix", Needs["TUG`vertex`VertexEnum`"],
      $OperatingSystem === "Windows", Needs["TUG`vertex`VertexEnum`"],
      True, Needs["VertexEnum`"]
];

ParaAntiPreKernel::usage = 
"ParaAntiPreKernel[game,payoff,options] computes an anti-pre-kernel solution by relying on
 the anti of Algorithm 7.2.1 of Meinhardt (2013).";

ParaAntiPreKernelQ::usage = 
"ParaAntiPreKernelQ[game,payoff,opts] checks whether the vector 'payoff' is an element of the anti-pre-kernel. 
 ParaAntiPreKernelQ checks also the efficiency condition in contrast to the function MinExcessBalanced.";

ParaAvConvexQ::usage = 
"ParaAvConvexQ[game] checks the average-convexity of the game.
 It returns 'True' or 'False'. Calling the function with the option will return
 the sum of the marginal contributions for each coalition S w.r.t. to each 
 superset S union {j}. These values must be non-negative.";

ParaConvexQ::usage = 
"ParaConvexQ[game] checks if the Tu-game is convex. It returns the value 'True' or 'False'.";

ParaSuperAdditiveQ::usage = 
"ParaSuperAdditiveQ[game] checks if a game is superadditive.";

ParaPreKernel::usage =
"ParaPreKernel[game,payoff,options] computes a pre-kernel element by iteratively solving
 a system of linear equations in parallel mode. (cf. Algorithm 8.2.1 of Meinhardt (2013))";

ParaPreKernelQ::usage = 
"ParaPreKernelQ[game,payoff,options] checks whether the (pre-)imputation 'payoff' is an element of the pre-kernel. 
 ParaPreKernelQ checks also the efficiency condition in contrast to the function MaxExcessBalanced.";


ParaPreKernelElement::usage =
"ParaPreKernelElement[game,payoff,options] computes a pre-kernel element by iteratively 
 determining a direction of improvement in parallel mode. The iteration process stops whenever the 
 direction of improvement is equal to the null vector. (cf. Algorithm 8.3.1 of Meinhardt (2013)).";

ParaModiclus::usage = 
"Modiclus[game,opts] computes the modiclus as the projection of the pre-nucleolus from the
 dual cover game onto the player set T of the original game. Do not confound this command
 with the function ModifiedNucleolus[]. The algorithm is based on a method by Peleg to translate
 the definition of the Nucleolus into a sequence of linear programs on the pre-imputation set.
 A simplex method is now used to increase its computational reliability. For its default value
 'False' the function Kernel[game] will be invoked to avoid infinite loops. To increases the
 computational reliability in cases of numerical issues the following methods can be used:
 RevisedSimplex, CLP, GUROBI, MOSEK, or Automatic. Default setting is Automatic. This option
 must be used in connection with CallMaximize->False. For getting more precise results one
 can even set Method->{InteriorPoint, Tolerance->10^-10}.";


ParaIsModiclusQ::usage = 
"IsModiclusQ[game,payoff,opts] checks whether the provided payoff vector is the modiclus of the game.
 For its default value 'False' the function Kernel[game] will be invoked to avoid infinite loops. 
 To increases the computational reliability in cases of numerical issues the following methods can be used:
 RevisedSimplex, CLP, GUROBI, MOSEK, or Automatic. Default setting is Automatic. This option
 must be used in connection with CallMaximize->False. For getting more precise results one
 can even set Method->{InteriorPoint, Tolerance->10^-10}.";


ParaModPreKernel::usage =
"ParaModPreKernel[game] computes a modified pre-kernel element as the solution
 of the pre-kernel from the excess comparability cover game.
 Do not confound this command with the function ModifiedKernel[].";

ParaIsModPreKernelQ::usage =
"ParaIsModPreKernelQ[game,payoff] checks whether the provided payoff vector is a modified
 pre-kernel element of the game.";

ParaProperModPreKernel::usage =
"ParaProperModPreKernel[game] computes a proper modified pre-kernel element as the projection
 of the pre-kernel from the dual cover game onto the player set T of the original game.
 Do not confound this command with the function ModifiedKernel[].";

ParaIsProperModPreKernelQ::usage =
"ParaIsProperModPreKernelQ[game,payoff] checks whether the provided payoff vector is a proper modified
 pre-kernel element of the game.";

ParaSMPreKernel::usage = 
"ParaSMPreKernel[game] computes the simplified modified pre-kernel of the game.";

ParaIsSMPreKernelQ::usage = 
"ParaIsSMPreKernelQ[game,payoff] checks if payoff is the simplified modified pre-kernel of the game.";



ParaBestCoalitions::usage = 
"ParaBestCoalitions[game,payoff] computes the set of most effective coalitions that supports the claim of 
 player i against j, for all possible pair of players in parallel mode.";


ParaSetsToVec::usage =
"ParaSetsToVec[bestcoal,T,options] converts the set of most effective coalitions to a set of vectors 
 of length T in parallel mode. A vector reflects how the best arguments are distributed between a
 bargaining pair (i,j) at a proposal. A plus sign indicates that the arguments are skewed in favor
 of the player i, zero means that the arguments are balanced, and a minus sign indicates that the
 arguments are skewed in favor of the player j. See also Meinhardt (2013).";


ParaDirectionOfImprovement::usage =
"ParaDirectionOfImprovement[game, payoff, options] determines a vector of improvement in order reduce 
 the maximum surpluses in parallel mode.";

ParaMaxSurplus::usage = 
"ParaMaxSurplus[game,pi,pj,payoff] calculates the maximum surplus of player i over j with respect to the 
 imputation 'payoff' in parallel mode. Note that the efficiency condition will not be checked.";

ParaGameBasis::usage = 
"ParaGameBasis[T] computes the basis of a |T|-person game in parallel.";

ParaCharacteristicValues::usage =
"ParaCharacteristicValues[unancrd_List,T,opts] computes the coalitional values from the vector of 
 unanimity coordinates in parallel.";


Options[ParaAntiPreKernel] = Sort[Options[PreKernel]];
Options[ParaAntiPreKernelQ] = Sort[Options[PreKernelQ]];
(* Options[ParaAvConvexQ] = Options[AverageConvexQ]; *)
Options[ParaBestCoalitions] = Sort[Options[BestCoalitions]]; 
Options[ParaSetsToVec] = Sort[Options[SetsToVec]];
Options[ParaPreKernelElement] = Sort[Options[PreKernelElement]];
Options[ParaDirectionOfImprovement] = Sort[Options[DirectionOfImprovement]];
Options[ParaPreKernel] = Sort[Options[PreKernel]];
Options[ParaPreKernelQ] = Sort[Options[PreKernelQ]];
Options[ParaMaxExcessBalanced] = Sort[Options[MaxExcessBalanced]];
Options[ParaMinExcessBalanced] = Sort[Options[MinExcessBalanced]];
Options[ParaExcessPayoff] = Sort[Options[ExcessPayoff]];
Options[ParaModPreKernel] = Sort[Options[ModPreKernel]];
Options[ParaProperModPreKernel] = Sort[Options[ProperModPreKernel]];
Options[ParaModiclus] = Sort[Options[Modiclus]];
Options[ParaIsModiclusQ] = Sort[Options[IsModiclusQ]];

DistributeDefinitions[Options[ParaPreKernel] = Sort[Options[PreKernel]]];
(* DistributeDefinitions[Options[ParaAvConvexQ] = Options[AverageConvexQ]]; *)
DistributeDefinitions[Options[ParaBestCoalitions] = Sort[Options[BestCoalitions]]];
DistributeDefinitions[Options[ParaPreKernelElement] = Sort[Options[PreKernelElement]]];
DistributeDefinitions[Options[ParaDirectionOfImprovement] = Sort[Options[DirectionOfImprovement]]];
DistributeDefinitions[Options[ParaPreKernel] = Sort[Options[PreKernel]]];
DistributeDefinitions[Options[ParaExcessPayoff] = Sort[Options[ExcessPayoff]]];
DistributeDefinitions[Options[ParaModPreKernel] = Sort[Options[ModPreKernel]]];
DistributeDefinitions[Options[ParaProperModPreKernel] = Sort[Options[ProperModPreKernel]]];

SetSharedFunction[ParaMaxSurplus];
SetSharedFunction[ParaAntiSurplus];
SetSharedFunction[ParaTIJsets];
SetSharedFunction[ParaW];


(* :Error Messages: *)

(* :One Argument: *)
ParaAntiPreKernel::argerr="One argument was expected.";
ParaAvConvexQ::argerr="One argument was expected.";
ParaConvexQ::argerr="One argument was expected.";
ParaGameBasis::argerr="One argument was expected.";
ParaModiclus::argerr="One argument was expected.";
ParaModPreKernel::argerr="One argument was expected.";
ParaPreKernelElement::argerr="One argument was expected.";
ParaPreKernel::argerr="One argument was expected.";
ParaProperModPreKernel::argerr="One argument was expected.";
SMPreKernel::argerr="One argument was expected.";
ParaSuperAdditiveQ::argerr="One argument was expected.";


(* :Two Arguments: *)
ParaAntiPreKernelQ::argerr="Two arguments were expected.";
ParaBestCoalitions::argerr="Two arguments were expected.";
ParaCharacteristicValues::argerr="Two arguments were expected.";
ParaDirectionOfImprovement::argerr="Two arguments were expected.";
ParaExcessPayoff::argerr="Two arguments were expected.";
ParaIsModiclusQ::argerr="Two arguments were expected.";
ParaIsModPreKernelQ::argerr="Two arguments were expected.";
ParaIsProperModPreKernelQ::argerr="Two arguments were expected.";
ParaIsSMPreKernelQ::argerr="Two arguments were expected.";
ParaMaxExcessBalanced::argerr="Two arguments were expected.";
ParaMinExcessBalanced::argerr="Two arguments were expected.";
ParaPreKernelQ::argerr="Two arguments were expected.";
ParaSetsToVec::argerr="Two arguments were expected.";


(* :Four Arguments: *)
ParaMaxSurplus::argerr="Four arguments were expected.";
ParaAntiSurplus::argerr="Four arguments were expected.";



(* Based on Algorithm 8.2.1 of Meinhardt (2013) *)
(* User interface to compute a pre-kernel element. *)

ParaPreKernel[args___]:=(Message[ParaPreKernel::argerr];$Failed);
ParaPreKernel[game_,opts:OptionsPattern[ParaPreKernel]] := 
  Block[{pay},
  pay = Table[v[T],{Length[T]}]/Length[T];
  ParaPreKernel[game,pay,opts]
 ];


ParaPreKernel[game_, payoff_List, opts:OptionsPattern[ParaPreKernel]] := Block[{dimpay,rclim}, 
      dimpay = Dimensions[payoff]; 
      rclim=If[Length[T] > 11,1024,256];
      Which[Length[dimpay]===2, 
                       Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), Block[{$RecursionLimit = rclim}, ParaPreKernelAlg2[game,#, opts]&/@ payoff //Union],
                                     True, ParaPrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), Block[{$RecursionLimit = rclim},ParaPreKernelAlg2[game, payoff,  opts]], 
                                     True, ParaPrintRemark[payoff]],
                    True, ParaPrintRemark[payoff]
                                   ]
      ];

(* Main Functions *)
ParaPreKernelAlg2[game_, payoff_List, opts:OptionsPattern[ParaPreKernel]] := 
Block[{rattol,sil, smc, meff, matE, vlis, alpv},
  sil = OptionValue[Silent];
  smc = OptionValue[SmallestCardinality];
  rattol=OptionValue[RationalTol];
  meff = ParaBestCoalitions[game, payoff, MaximumSurpluses -> False, SmallestCardinality -> smc];
  matE = -ParaSetsToVec[meff, T, EffVector -> True];
  vlis = ParallelMap[MapThread[v[#1] &, {#}] &, meff, Method -> "CoarsestGrained",DistributedContexts -> None];
  alpv = ParallelMap[ReplaceAll[#, List -> Subtract] &, vlis, Method -> "CoarsestGrained",DistributedContexts -> None];
  PrependTo[alpv,v[T]];
  err=Norm[matE.payoff+alpv]^2;
  If[LessEqual[err,1.5*rattol],Return[payoff],
               xvec=-PseudoInverse[matE].alpv;
               ParaPreKernelAlg2[game,xvec,opts]]   
  ];


(* Based on Algorithm 8.3.1 of Meinhardt (2013) *)
(* User interface to compute a pre-kernel element. *)

ParaPreKernelElement[args___]:=(Message[ParaPreKernelElement::argerr];$Failed);
ParaPreKernelElement[game_,opts:OptionsPattern[ParaPreKernelElement]] := 
  Block[{pay},
  pay = Table[v[T],{Length[T]}]/Length[T];
  ParaPreKernelElement[game,pay,opts]
 ];

ParaPreKernelElement[game_, payoff_List, opts:OptionsPattern[ParaPreKernelElement]] := Block[{dimpay,rclim}, 
      dimpay = Dimensions[payoff]; 
      rclim=If[Length[T] > 11,1024,256];
      Which[Length[dimpay]===2, 
                       Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), Block[{$RecursionLimit = rclim}, ParaPreKernelAlg3[game,#, opts]&/@ payoff //Union],
                                     True, ParaPrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), Block[{$RecursionLimit = rclim},ParaPreKernelAlg3[game, payoff,  opts]], 
                                     True, ParaPrintRemark[payoff]],
                    True, ParaPrintRemark[payoff]
                                   ]
      ];

(* Main Functions *)

ParaPreKernelAlg3[game_, payoff_List, opts:OptionsPattern[ParaPreKernelElement]] := 
Block[{sil, smc, optst, doi, optstep, itpay,tol,brc,pinv},
     sil = OptionValue[Silent];
     smc = OptionValue[SmallestCardinality];     
     optst = OptionValue[CalcStepSize];
     pinv = OptionValue[PseudoInv];
     rattol=OptionValue[RationalTol];
     {optstep, doi} = ParaDirectionOfImprovement[game, payoff, MaximumSurpluses -> False, CalcStepSize -> optst, PseudoInv->pinv,Silent -> sil, SmallestCardinality -> smc];
     itpay =  payoff + optstep*doi; 
     If[SameQ[sil,False], 
                 Print["doi=", doi];
                 Print["optstep=", optstep];
                 Print["itpay=", itpay];, 
              True];
     If[Depth[itpay]!=2,Return[payoff],True];
     tol=Table[1.5*rattol,{Length[T]}];
     brc=Apply[And,MapThread[LessEqual[#1,#2] &,{Abs[doi],tol}]];
     If[SameQ[brc,True], Rationalize[itpay,rattol], ParaPreKernelAlg3[game, Rationalize[itpay,rattol], CalcStepSize -> optst, Silent -> sil, SmallestCardinality -> smc]] 
];


ParaDirectionOfImprovement[args___]:=(Message[ParaDirectionOfImprovement::argerr];$Failed);
ParaDirectionOfImprovement[game_, payoff_List, opts:OptionsPattern[ParaDirectionOfImprovement]] := 
Module[{sil, smc, optst, meff, matE, mopt,matQ, matP, varpay, mex, submex, setpay, grmex, doi, optstep,pinv},
  sil = OptionValue[Silent];
  smc = OptionValue[SmallestCardinality];
  optst = OptionValue[CalcStepSize];
  pinv = OptionValue[PseudoInv];
  mopt= OptionValue[MaximumSurpluses];
  {meff, mex} = ParaBestCoalitions[game, payoff, AntiPreKernel -> False, MaximumSurpluses -> True, SmallestCardinality -> smc];
  matE = -ParaSetsToVec[meff, T, EffVector -> True];
  submex = ParallelMap[{1, -1}.# &, mex];    
  varpay = x[#] & /@ T;
  setpay = MapThread[Rule, {varpay, payoff}];
  grmex = v[T] - Total[x[#] & /@ T] /. setpay;
  PrependTo[submex, grmex];
  If[SameQ[sil,False], Print["submex=", submex],True];
  If[SameQ[pinv,False],
     doi = LeastSquares[matE,-submex,Tolerance -> 10^(-10)];,
     doi = -PseudoInverse[matE].submex];
  optstep = If[SameQ[optst,True], ParaDelStar[doi, matE, submex], 1];
  If[SameQ[mopt,False],{optstep,doi},{optstep,doi,mex}]
  ];



ParaDelStar[doi_List, matE_List, smex_List]:= 
  Block[{edvec,nrsq,tol},
  edvec = matE.doi; 
  nrsq =Norm[edvec]^2;
  tol=1.5*10^(-12);
  If[LessEqual[Abs[nrsq],tol], 0, - smex.edvec/nrsq]
];

(* Computing the anti pre-kernel *)

ParaAntiPreKernel[args___]:=(Message[ParaAntiPreKernel::argerr];$Failed);
ParaAntiPreKernel[game_,opts:OptionsPattern[ParaPreKernel]] := 
  Block[{pay},
  pay = ParallelTable[v[T],{Length[T]}]/Length[T];
  ParaAntiPreKernel[game,pay,opts]
 ];


ParaAntiPreKernel[game_, payoff_List, opts:OptionsPattern[ParaPreKernel]] := Block[{dimpay,rclim}, 
      dimpay = Dimensions[payoff]; 
      rclim=If[Length[T] > 11,1024,256];
      Which[Length[dimpay]===2, 
                       Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), Block[{$RecursionLimit = rclim}, ParaAntiPreKernelAlg2[game,#, opts]&/@ payoff //Union],
                                     True, ParaPrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), Block[{$RecursionLimit = rclim},ParaAntiPreKernelAlg2[game, payoff,  opts]], 
                                     True, ParaPrintRemark[payoff]],
                    True, ParaPrintRemark[payoff]
                                   ]
      ];


ParaAntiPreKernelAlg2[game_, payoff_List, opts:OptionsPattern[ParaPreKernel]] := 
Block[{sil, smc, meff, matE, vlis, alpv,err},
  sil = OptionValue[Silent];
  smc = OptionValue[SmallestCardinality];
  meff = ParaBestCoalitions[game, payoff, AntiPreKernel -> True, MaximumSurpluses -> False, SmallestCardinality -> smc];
  matE = -ParaSetsToVec[meff, T, EffVector -> True];
  Parallelize[vlis = MapThread[v[#1] &, {#}] &/@ meff;
              alpv = ReplaceAll[#, List -> Subtract] & /@ vlis, Method -> "CoarsestGrained",DistributedContexts -> None];
  PrependTo[alpv,v[T]];
  err=Norm[matE.payoff+alpv]^2;
  If[LessEqual[err,1.5*10^(-12)],Return[payoff],
               xvec=-PseudoInverse[matE].alpv;
               ParaAntiPreKernelAlg2[game,xvec,opts]]   
  ];


(* Section Modiclus, Modified and Proper Modified Pre-Kernel *)

ParaModiclus[args___]:=(Message[ParaModiclus::argerr];$Failed);
ParaModiclus[game_,opts:OptionsPattern[ParaModiclus]] := 
 Block[{mthd,ovls, dcvals, lt, t0, t1, DCGame, mdnc},
  mthd=OptionValue[Method];
  ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
  t0 = T; (* Storing original game values. *)
  dcvals = ParaDualCover[game];
  lt = Length[T];
  t1 = Range[2*lt];
  DCGame = DefineGame[t1, dcvals];
  mdnc = PreNucleolus[DCGame,Method->mthd];
  DefineGame[t0, ovls]; (* Redefine the original game. *)
  Take[mdnc, lt]
  ];

ParaIsModiclusQ[args___]:=(Message[ParaIsModiclusQ::argerr];$Failed);

ParaIsModiclusQ[game_,payoff_List,opts:OptionsPattern[ParaIsModiclusQ]] := 
 Block[{ovls, dcvals, lt, t0, t1, dpay, DCGame, bcQ},
  mthd=OptionValue[Method];
  If[SameQ[Total[payoff] - v[T], 0] && Apply[And,NumericQ[#] &/@ payoff], True, Return[False]];
  ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
  t0 = T; (* Storing original game values. *)
  dcvals = ParaDualCover[game];
  lt = Length[T];
  t1 = Range[2*lt];
  DCGame = DefineGame[t1, dcvals];
  dpay= Flatten[{payoff,payoff}];
  bcQ = BalancedCollectionQ[DCGame,dpay,Method->mthd];
  DefineGame[t0, ovls]; (* Redefine the original game. *)
  Return[bcQ]
  ]


ParaModPreKernel[args___]:=(Message[ParaModPreKernel::argerr];$Failed);
ParaModPreKernel[game_,opts:OptionsPattern[ParaModPreKernel]] :=
    Module[{pay},
      pay = Table[v[T],{Length[T]}]/Length[T];
      ParaModPreKernel[game,pay,opts]
    ];

ParaModPreKernel[game_, payoff_List, opts:OptionsPattern[ParaModPreKernel]] := Module[{dimpay,rclim},
  dimpay = Dimensions[payoff];
  rclim=If[Length[T] > 11,1024,512];
  Which[Length[dimpay]===2,
    Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), Block[{$RecursionLimit = rclim}, ParaFuncModPreKernel[game,#, opts]&/@ payoff //Union],
      True, PrintRemark[payoff]],
    Length[dimpay]===1,
    Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), Block[{$RecursionLimit = rclim},ParaFuncModPreKernel[game, payoff,  opts]],
      True, PrintRemark[payoff]],
    True, PrintRemark[payoff]
  ]
];

(* Main Functions *)

ParaFuncModPreKernel[game_, payoff_List, opts:OptionsPattern[ParaModPreKernel]] :=
    Module[{sil, smc, optst, pinv, ovls, t0, dcvals, dcgame, doi, optstep, itpay,tol,brc},
      sil = OptionValue[Silent];
      smc = OptionValue[SmallestCardinality];
      optst = OptionValue[CalcStepSize];
      pinv = OptionValue[PseudoInv];
      ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
      t0 = T; (* Storing original game values. *)
      dcvals = ParaECCoverGame[game,payoff];
      dcgame = DefineGame[t0, dcvals];
      {optstep, doi} = ParaDirectionOfImprovement[dcgame, payoff, MaximumSurpluses -> False, CalcStepSize -> optst, PseudoInv->pinv,Silent -> sil, SmallestCardinality -> smc];
      If[SameQ[sil,False], Print["doi=", doi], True];
      If[SameQ[sil,False], Print["optstep=", optstep], True];
      itpay =  payoff + optstep*doi;
      If[SameQ[sil,False], Print["itpay=", itpay], True];
      If[Depth[itpay]!=2,Return[payoff],True];
      tol=Table[1.5*10^(-6),{Length[T]}];
      brc=Apply[And,MapThread[LessEqual[#1,#2] &,{Abs[doi],tol}]];
      DefineGame[t0, ovls];
      If[SameQ[brc,True], Rationalize[N[itpay],10^(-6)], ParaFuncModPreKernel[game, itpay, CalcStepSize -> optst, Silent -> sil, SmallestCardinality -> smc]]
    ];


ParaECCoverGame[game_, payoff_] :=
    Module[{exc, mexc, dv, sx, df, assg, dmexc, pvals, dvals, vals},
      exc = ParaExcessPayoff[game, payoff];
      mexc = Max[exc];
      dv = (v[T] - v[#]) & /@ Reverse[Coalitions];
      assg = MapThread[Rule, {Map[x, T], payoff}];
      sx = x[#] & /@ Coalitions /. assg;
      df = dv - sx;
      dmexc = Max[df];
      pvals = v[#] + mexc + 2*dmexc & /@ Coalitions;
      dvals = dv + dmexc + 2*mexc;
      vals = MapThread[Max[#1, #2] &, {pvals, dvals}];
      vals = Flatten[{0,Drop[vals,1]}];
      vals = Drop[vals, -1];
      Flatten[{vals, v[T]}]
    ];


ParaProperModPreKernel[args___]:=(Message[ParaProperModPreKernel::argerr];$Failed);
ParaProperModPreKernel[game_,opts:OptionsPattern[ParaProperModPreKernel]] := Block[{ovls, dcvals, lt, t0, t1, DCGame, mdnc},
  ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
  t0 = T; (* Storing original game values. *)
  dcvals = DualCover[game];
  lt = Length[T];
  t1 = Range[2*lt];
  DCGame = DefineGame[t1, dcvals];
  mdnc = ParaPreKernel[DCGame,opts];
  (*Print["mdnc0=",mdnc];*)
  DefineGame[t0, ovls]; (* Redefine the original game. *)
  Take[mdnc, lt]
];


ParaProperModPreKernel[game_,payoff_List,opts:OptionsPattern[ParaProperModPreKernel]] := Block[{ovls, dcvals, lt, t0, t1, DCGame, mdnc,dcpay},
  ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
  t0 = T; (* Storing original game values. *)
  dcvals = ParaDualCover[game];
  lt = Length[T];
  t1 = Range[2*lt];
  dcpay=Flatten[{payoff,payoff}];
  DCGame = DefineGame[t1, dcvals];
  mdnc = ParaPreKernel[DCGame,dcpay,opts];
  (*  Print["mdnc=",mdnc];*)
  DefineGame[t0, ovls]; (* Redefine the original game. *)
  Take[mdnc, lt]
];


ParaIsModPreKernelQ[args___]:=(Message[ParaIsModPreKernelQ::argerr];$Failed);
ParaIsModPreKernelQ[game_, payoff_List] :=
    Block[{ovls, dcvals, lt, t0, t1, DCGame, pmpkQ},
      ovls = v[#] & /@ Coalitions;(*Storing original game values.*)
      t0 = T;(*Storing original game values.*)
      dcvals = ParaECCoverGame[game, payoff];
      DCGame = DefineGame[t0, dcvals];
      pmpkQ = ParaPreKernelQ[DCGame, payoff];
      DefineGame[t0, ovls];(*Redefine the original game.*)
      Return[pmpkQ]];

ParaIsProperModPreKernelQ[args___]:=(Message[ParaIsProperModPreKernelQ::argerr];$Failed);
ParaIsProperModPreKernelQ[game_,payoff_List] := Block[{ovls, dcvals, lt, t0, t1, dpay, DCGame, pmpkQ},
  ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
  t0 = T; (* Storing original game values. *)
  dcvals = ParaDualCover[game];
  lt = Length[T];
  t1 = Range[2*lt];
  DCGame = DefineGame[t1, dcvals];
  dpay= Flatten[{payoff,payoff}];
  pmpkQ = ParaPreKernelQ[DCGame,dpay];
  DefineGame[t0, ovls]; (* Redefine the original game. *)
  Return[pmpkQ]
];

(* Dual Extension of the primal game *)
ParaDualExtension[game_] := Block[{lt, T1, cls, cl1, clset, vlset, dlext,vals},
  lt = Length[T];
  cls=Subsets[T];
  T1 = Range[lt + 1, 2*lt];
  cl1 = Subsets[T1];
  Parallelize[
  clset = Table[Join[cls[[i]], #] & /@ cl1, {i, 1, Length[cl1]}];
  vlset = Table[v[cls[[i]]] + v[T] - v[Complement[T, #]] & /@ Coalitions, {i, 1, Length[cl1]}];
  dlext = Flatten[MapThread[MapThread[List[#1, #2] &, {#1, #2}] &, {clset, vlset}], 1] // Sort,
       Method -> "CoarsestGrained",DistributedContexts -> Automatic];
  vals = Last[#] & /@ dlext;
  {vals, dlext}
];


(* Primal Extension of the dual game *)
ParaPrimalExtension[game_] :=
    Block[{lt, T1, cl1, cls,clset, vlset, plext,vals},
      cls=Subsets[T];
      lt = Length[T];
      T1 = Range[lt + 1, 2*lt];
      cl1 = Subsets[T1];
      Parallelize[
      clset = Table[Join[cls[[i]], #] & /@ cl1, {i, 1, Length[cl1]}];
      vlset = Table[v[#] + v[T] - v[Complement[T, cls[[i]]]] & /@ Coalitions, {i, 1, Length[cl1]}];
      plext = Flatten[MapThread[MapThread[List[#1, #2] &, {#1, #2}] &, {clset, vlset}], 1] // Sort,
        Method -> "CoarsestGrained",DistributedContexts -> Automatic];
      vals = Last[#] & /@ plext;
      {vals, plext}
    ];


ParaDualCover[game_] := Block[{dvals, dexts, pvals, pexts},
  {dvals, dexts} = ParaDualExtension[game];
  {pvals, pexts} = ParaPrimalExtension[game];
  MapThread[Max[#1, #2] &, {dvals, pvals}]
];


(* Start of the section related to the simplified modified pre-kernel/nucleolus of a game. *)


ParaSMPreKernel[args___]:=(Message[ParaSMPreKernel::argerr];$Failed);
ParaSMPreKernel[game_] := Block[{ovls, dv, av, AVGame, smpk},
  ovls = v[#] & /@ Coalitions;(*Storing original game values.*)
  dv = DualGame[game];
  av = (ovls + dv)/2;
  AVGame = DefineGame[T, av];
  smpk = ParaPreKernelElement[AVGame];
  DefineGame[T, ovls];(* Redefine the original game.*)
  Return[smpk];
  ];

ParaIsSMPreKernelQ[args___]:=(Message[ParaIsSMPreKernelQ::argerr];$Failed);
ParaIsSMPreKernelQ[game_, payoff_] := Block[{ovls, dv, av, AVGame, smpkQ},
  ovls = v[#] & /@ Coalitions;(*Storing original game values.*)
  dv = DualGame[game];
  av = (ovls + dv)/2;
  AVGame = DefineGame[T, av];
  smpkQ = ParaPreKernelQ[AVGame, payoff];
  DefineGame[T, ovls];(* Redefine the original game.*)
  Return[smpkQ];
  ];



(* End of the section related to the simplified modified pre-kernel of a game. *)

(* Selecting the set of lexicographically smallest coalitions. *) 

ParaBestCoalitions[args___]:=(Message[ParaBestCoalitions::argerr];$Failed);
ParaBestCoalitions[game_,payoff_List,opts:OptionsPattern[ParaBestCoalitions]]:= 
  Block[{dimpay}, 
       dimpay = Dimensions[payoff]; 
      Which[Length[dimpay]===2, 
                        Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), Map[ParaBestcoalij01[game,#,opts]&, payoff],
                                     True, ParaWrongDimension],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ),ParaBestcoalij01[game,payoff,opts], 
                                     True, ParaWrongDimension],
                    True, ParaWrongDimension
                                   ]
];

paralistIJ[T_List]:=Flatten[ParallelTable[Table[{i, j}, {j, i + 1, Length[T]}], {i, 1, Length[T]}]];



ParaBestcoalij01[game_, payoff_List,opts:OptionsPattern[ParaBestCoalitions]] :=
  Block[{anti, maxsurp, allc, plvec,sij,sji,plj,pli,payass,amax,ramax,exc,exvec,intcoal,selcij,selcji,sigcoal},
    anti = OptionValue[AntiPreKernel];
    allc = OptionValue[AllCoalitions];
    maxsurp = OptionValue[MaximumSurpluses];
    plvec = Partition[paralistIJ[T],2];
    Parallelize[pli = Map[First[#] &, plvec];
                plj = Map[#[[2]] &,plvec];
                sij=MapThread[ParaTIJsets[#1,#2] &,{pli,plj}];
                sji=MapThread[ParaTIJsets[#1,#2] &,{plj,pli}];
                payass = MapThread[Rule,{x /@ T,payoff}],Method -> "CoarsestGrained",DistributedContexts -> True];
    If[SameQ[anti,False],
       amax = ParallelTable[ParaMaxSijSurpluses[game,sij[[i]],sji[[i]],payass],{i,Length[sij]},Method -> "CoarsestGrained",DistributedContexts -> True],
       amax = ParallelTable[ParaAntiSijSurpluses[game,sij[[i]],sji[[i]],payass],{i,Length[sij]},Method -> "CoarsestGrained",DistributedContexts -> True]
    ];
    exc = First[ParaExcessPayoff[game, payoff]];
    exvec = Drop[Drop[exc, 1], -1];
    intcoal = Drop[Drop[Subsets[T], 1], -1];
    ramax =  Map[Reverse[#] &, amax];
    selcij = ParallelTable[ParaSelCoal[sij[[i]], intcoal, exvec, amax[[i]]],{i,Length[amax]},Method -> "CoarsestGrained"];
    selcji = ParallelTable[ParaSelCoal[sji[[i]], intcoal, exvec, ramax[[i]]],{i,Length[ramax]},Method -> "CoarsestGrained"];
    sigcoal = MapThread[{Flatten[#1], Flatten[#2]} &,{selcij, selcji}];
    If[SameQ[maxsurp,False], sigcoal,{sigcoal,amax}]
    ];
 



ParaSelCoal[setsij_List, coal_List, redexc_List, maxexc_List, opts:OptionsPattern[ParaBestCoalitions]] := 
  Block[{allc, smc, detpos, extval, poscoal, extcoal},
    allc = OptionValue[AllCoalitions];
    smc = OptionValue[SmallestCardinality];
    detpos=MapThread[List,{coal,redexc}];
    extval = Last[#] &/@ Cases[detpos,{#,___}] &/@ setsij // Flatten;
    poscoal = Position[extval, First[maxexc]];
    extcoal = Extract[setsij, poscoal];
(*  Taking the coalition with smallest/largest (First/Last) cardinality if extcoal > 1 *)
    If[Length[extcoal] === 1, extcoal, 
     Which[allc === True, extcoal, True,
       Which[smc === True, First[extcoal], 
             smc === False, Last[extcoal], 
             True,  First[extcoal]]]]
    ];


ParaSetsToVec[args___]:=(Message[ParaSetsToVec::argerr];$Failed);
ParaSetsToVec[mg_List, T_List, opts:OptionsPattern[ParaSetsToVec]] := 
    Block[{effvec, zrv, pscoal, replzr,coasts, onesoft},
    effvec = OptionValue[EffVector];
    zrv = Table[0, {i, Length[T]}];
    pscoal = Map[Outer[List, #] &, mg];
    replzr = Parallelize[Map[ReplacePart[zrv, 1, #] &, #] &/@ pscoal];
    coasts = Parallelize[MapThread[Subtract[#1, #2] &, #] &/@ replzr];
    onesoft = Table[1,{i,Length[T]}];
    If[effvec==True, Prepend[coasts,onesoft], coasts]
];


ParaMaxSurpluses[game_, payoff_List,dir_List] := 
    Block[{pli,plj,maxpi,maxpj,res},
      Parallelize[pli = First[#] &/@ dir;
                  plj = #[[2]] &/@ dir;
                  maxpi = MapThread[ParaMaxSurplus[game,#1,#2,payoff]&,{pli,plj}];
                  maxpj = MapThread[ParaMaxSurplus[game,#1,#2,payoff]&,{plj,pli}];
                  MapThread[List,{maxpi,maxpj}],Method -> "CoarsestGrained",DistributedContexts -> None]
    ];

 
(* We refrain from overloading due to its negative effect on the performance of the (Anti-)Pre-Kernel computation!!!   *)
ParaMaxSijSurpluses[game_, sij_List, sji_List,payoff_List] := 
	Block[{maxpi,maxpj},
           maxpi = ParaMaxSijSurplus[game,sij,payoff];
           maxpj = ParaMaxSijSurplus[game,sji,payoff];
          Return[{maxpi,maxpj}]
	];

ParaAntiSurpluses[game_, payoff_List,dir_List] := 
    Block[{pli,plj,minpi,minpj,res}, 
      Parallelize[pli = First[#] &/@ dir;
                  plj = #[[2]] &/@ dir;
                  minpi = MapThread[ParaAntiSurplus[game,#1,#2,payoff]&,{pli,plj}];
                  minpj = MapThread[ParaAntiSurplus[game,#1,#2,payoff]&,{plj,pli}];
                  MapThread[List,{minpi,minpj}],Method -> "CoarsestGrained",DistributedContexts -> None]
     ];


ParaAntiSijSurpluses[game_, sij_List, sji_List,payoff_List] := 
	Block[{minpi,minpj},
           minpi = ParaAntiSijSurplus[game,sij,payoff];
           minpj = ParaAntiSijSurplus[game,sji,payoff];
          Return[{minpi,minpj}]
	];



ParaMaxSurplus[args___]:=(Message[ParaMaxSurplus::argerr];$Failed);
ParaMaxSurplus[game_, pi_, pj_, payoff_List] := 
    Block[{payass}, 
      payass = Which[Depth[payoff]==3, MapThread[Rule,{x /@ T,#}]& /@ payoff, 
                     Depth[payoff]==2, MapThread[Rule,{x /@ T,payoff}],
                     True, Print["The input 'payoff' is not a list."];Return[]];
      Which[Depth[payass] == 5,Max[ReplaceAll[(v[#] - x[#]) & /@ ParaTIJsets[pi,pj],#]] &/@ payass,
            Depth[payass] == 4,Max[ReplaceAll[(v[#] - x[#]) & /@ ParaTIJsets[pi,pj],payass]],
            True, Print["Wrong data format."];Return[]]
      ];
 


ParaMaxSijSurplus[game_,sij_List, payass_List] := 
	Block[{},
          Max[ReplaceAll[Map[v[#] - x[#] &, sij],payass]]
      ];

ParaAntiSurplus[args___]:=(Message[ParaMaxSurplus::argerr];$Failed);
ParaAntiSurplus[game_, pi_, pj_, payoff_List] := 
    Block[{payass}, 
      payass = Which[Depth[payoff]==3, MapThread[Rule,{x /@ T,#}]& /@ payoff, 
                     Depth[payoff]==2, MapThread[Rule,{x /@ T,payoff}],
                     True, Print["The input 'payoff' is not a list."];Return[]];
      Which[Depth[payass] == 5,Min[ReplaceAll[(v[#] - x[#]) & /@ ParaTIJsets[pi,pj],#]] &/@ payass,
            Depth[payass] == 4,Min[ReplaceAll[(v[#] - x[#]) & /@ ParaTIJsets[pi,pj],payass]],
            True, Print["Wrong data format."];Return[]]
      ];

ParaAntiSijSurplus[game_,sij_List, payass_List] := 
	Block[{},
          Min[ReplaceAll[Map[v[#] - x[#] &, sij],payass]]
      ];

ParaTIJsets[i_Integer, j_Integer]:=DeleteCases[Cases[ProperCoalitions,{___,i,___}],{___,j,___}];


ParaExcessPayoff[args___]:=(Message[ParaExcessPayoff::argerr];$Failed);
ParaExcessPayoff[game_,payoff_List, opts:OptionsPattern[ParaExcessPayoff]]:= Block[{dispmat,assg,li,res},
  dispmat = OptionValue[DisplayMatrixForm];    
  If[Depth[payoff] == 2 || Depth[payoff] == 3,
    li = If[Length[Dimensions[payoff]]==1,{payoff},payoff];
    Parallelize[assg = MapThread[Rule,{Map[x,T],#}] & /@ li;
                res = (v[#]-x[#])& /@ Coalitions;
                res = ReplaceAll[res,#]&/@ assg,Method -> "CoarsestGrained",DistributedContexts -> Automatic];
    Which[dispmat == False, res, True, ParaDisplayErgb[res]],
            ParaPrintRemark[payoff]
		]
  ];

ParaDisplayErgb[payoff_List]:= Block[{exc,coal,mpc},
    exc = payoff;
    coal = Subsets[T];
    mpc = Map[Global`Co,coal];
    MatrixForm[PrependTo[exc,mpc]]
    ];


(* User interface to check for (anti) pre-kernel element. *)

ParaPreKernelQ[args___]:=(Message[ParaPreKernelQ::argerr];$Failed);
ParaPreKernelQ[game_, payoff_List,opts:OptionsPattern[ParaPreKernelQ]] :=Block[{rattol,tolv,graval,dimpay},
       rattol = OptionValue[RationalTol]; 
       graval = v[T];
       dimpay = Dimensions[payoff];
       tolv=1.5*rattol;
    Which[Length[dimpay] === 2,
                                 Which[ (Last[dimpay]===Length[T] && Depth[payoff] ===3),MapThread[And,{(Abs[Total[#] - graval]<=tolv) & /@ payoff,ParaMaxExcessBalanced[game, payoff,RationalTol->rattol]}],
                                               True, ParaPrintRemark[payoff]],
                   Length[dimpay] === 1,
                              Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), MapThread[And,{{Abs[Total[payoff] - graval]<=tolv},{ParaMaxExcessBalanced[game, payoff,RationalTol->rattol]}}], 
                                            True, ParaPrintRemark[payoff]],
      True, ParaPrintRemark[payoff]
            ]
 ];


ParaAntiPreKernelQ[args___]:=(Message[ParaAntiPreKernelQ::argerr];$Failed);
ParaAntiPreKernelQ[game_, payoff_List,opts:OptionsPattern[ParaAntiPreKernelQ]] :=Block[{rattol,tolv,graval,dimpay},
       rattol = OptionValue[RationalTol]; 
       graval = v[T];
       dimpay = Dimensions[payoff];
       tolv=1.5*rattol;
    Which[Length[dimpay] === 2,
                               Which[ (Last[dimpay]===Length[T] && Depth[payoff] ===3), MapThread[And,{(Abs[Total[#] - graval]<= tolv) & /@ payoff,ParaMinExcessBalanced[game, payoff,RationalTol->rattol]}],
                                               True, ParaPrintRemark[payoff]],
                   Length[dimpay] === 1,
                              Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), MapThread[And,{{Abs[Total[payoff] - graval]<=tolv},{ParaMinExcessBalanced[game, payoff,RationalTol->rattol]}}], 
                                            True, ParaPrintRemark[payoff]],
      True, ParaPrintRemark[payoff]
            ]
 ];


ParaMaxExcessBalanced[args___]:=(Message[ParaMaxExcessBalanced::argerr];$Failed);
ParaMaxExcessBalanced[game_, payoff_List,opts:OptionsPattern[ParaMaxExcessBalanced]]:= Block[{rattol,dimpay},
    rattol = OptionValue[RationalTol];
    dimpay = Dimensions[payoff];
    Which[Length[dimpay] === 2,
         Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), ParaMaxExcessBalCheck[game, #,RationalTol->rattol] & /@ payoff, 
                       True, ParaPrintRemark[payoff]], 
   Length[dimpay] === 1,
            Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), ParaMaxExcessBalCheck[game, payoff,RationalTol->rattol], 
                         True,  ParaPrintRemark[payoff]], 
   True, ParaPrintRemark[payoff]]
];

ParaMaxExcessBalCheck[game_,payoff_List,opts:OptionsPattern[ParaMaxExcessBalanced]]:= 
 Block[{rattol,plpr,rvpr,asspay,sij,sji,msrplij,msrplji,msrij,msrji,lthij,tolvec,sysij,sysji,eqQ},
    rattol = OptionValue[RationalTol];
    plpr = Partition[paralistIJ[T],2];
    rvpr = Map[Reverse[#] &, plpr];
    asspay = ParaAssgPay[payoff];
    Parallelize[
    sij = ParaTIJsets[#[[1]], #[[2]]] & /@ plpr;
    sji = ParaTIJsets[#[[1]], #[[2]]] & /@ rvpr,
       Method -> "CoarsestGrained",DistributedContexts -> Automatic];
    {msrplij,msrplji}= {ParaMaxExcess[sij, asspay],ParaMaxExcess[sji, asspay]};
    {msrij,msrji} = {msrplij - msrplji,msrplji - msrplij};
    lthij = Binomial[Length[T],2];
    tolvec = Table[1.5*rattol, {i, lthij}];
    sysij = Union[MapThread[LessEqual, {Abs[msrij], tolvec}]];
    sysji = Union[MapThread[LessEqual, {Abs[msrji], tolvec}]];
    eqQ = Apply[Join, {sysij, sysji}];
    Apply[And, eqQ]
];


ParaMinExcessBalanced[args___]:=(Message[ParaMinExcessBalanced::argerr];$Failed);
ParaMinExcessBalanced[game_, payoff_List,opts:OptionsPattern[ParaMinExcessBalanced]]:= Block[{rattol,dimpay},
    rattol = OptionValue[RationalTol];
    dimpay = Dimensions[payoff];
    Which[Length[dimpay] === 2,
         Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), ParaMinExcessBalCheck[game, #,RationalTol->rattol] & /@ payoff, 
                       True, ParaPrintRemark[payoff]], 
   Length[dimpay] === 1,
            Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), ParaMinExcessBalCheck[game, payoff,RationalTol->rattol], 
                         True,  ParaPrintRemark[payoff]], 
   True, ParaPrintRemark[payoff]]
];

ParaMinExcessBalCheck[game_,payoff_List,opts:OptionsPattern[ParaMaxExcessBalanced]]:= 
 Block[{rattol,plpr, rvpr, asspay,sij,sji,msrplij,msrplji,msrij, msrji,lthij,tolvec,sysij,sysji,eqQ},
    rattol = OptionValue[RationalTol];
    plpr = Partition[paralistIJ[T],2];
    rvpr = Map[Reverse[#] &,plpr];
    asspay = ParaAssgPay[payoff];
    Parallelize[
      sij = ParaTIJsets[#[[1]], #[[2]]] & /@ plpr;
      sji = ParaTIJsets[#[[1]], #[[2]]] & /@ rvpr,
      Method -> "CoarsestGrained",DistributedContexts -> Automatic];
     {msrplij,msrplji} = {ParaMinExcess[sij, asspay],ParaMinExcess[sji, asspay]};
     {msrij,msrji} = {msrplij - msrplji,msrplji - msrplij};
    lthij = Binomial[Length[T],2];
    tolvec = ParallelTable[1.5*rattol, {i, lthij}];
     sysij = Union[MapThread[LessEqual, {Abs[msrij], tolvec}]];
    sysji = Union[MapThread[LessEqual, {Abs[msrji], tolvec}]];
    eqQ = Apply[Join, {sysij, sysji}];
    Apply[And, eqQ]
];


ParaAssgPay[payoff_List] := Block[{vars},
    vars = x[#] & /@ T;
    MapThread[Rule, {vars, payoff}]
    ];

ParaMaxExcess[mgij_List, asspay_List] := ParallelMap[ParaMaxExc[#, asspay] &, mgij,Method -> "CoarsestGrained",DistributedContexts -> Automatic];
ParaMinExcess[mgij_List, asspay_List] := ParallelMap[ParaMinExc[#, asspay] &, mgij,Method -> "CoarsestGrained",DistributedContexts -> Automatic];

ParaMaxExc[mg_List, asspay_List] := Max[ReplaceAll[(v[#] - x[#]) & /@ mg, asspay]];
ParaMinExc[mg_List, asspay_List] := Min[ReplaceAll[(v[#] - x[#]) & /@ mg, asspay]];


(* Deriving a game from unanimity coordinates. *)

ParaCharacteristicValues[args___]:=(Message[ParaCharacteristicValues::argerr];$Failed);
ParaCharacteristicValues[coord_List,T_,opts:OptionsPattern[]]:= Block[{},
      Which[ Length[coord] === 2^Length[T] , ParaDetWorth[coord,T] ,
                    True, ParaWrongCoordDimension[coord, T]]
];



ParaDetWorth[coord_List, T_, opts:OptionsPattern[]]:=Block[{tugb, cval},
                 tugb = ParaGameBasis[T];
                 cval = tugb.Drop[coord,1];
                 Prepend[cval,0]
];

ParaGameBasis[args___]:=(Message[ParaGameBasis::argerr];$Failed);
ParaGameBasis[T_] := Block[{mgsys,gb},
    mgsys = Drop[Subsets[T], 1];
    gb = ParallelTable[If[SubsetQ[#,mgsys[[i]]], 1, 0] & /@ mgsys, {i, Length[mgsys]}]; 
    Transpose[gb]
];

(* Checking convexity and average-convexity *)

ParaConvexQ[args___]:=(Message[ParaConvexQ::argerr];$Failed);
ParaConvexQ[game_]:= 
Block[{liste}, 
    liste = Flatten[ParaIncreasingMargContributions[game,#] & /@ T,1];
    Apply[And,Apply[And,liste,1]]
	];

ParaIncreasingMargContributions[game_,i_Integer]:=
	ParallelTable[(v[#]-v[DeleteCases[#,i]] <= 
          v[Union[Flatten[{#,j}]]] - v[DeleteCases[ 
            Union[Flatten[{#,j}]],i]])& /@ Take[ParaW[i],Length[ParaW[i]]-1],
              {j,1,Length[T]},Method -> "CoarsestGrained",DistributedContexts -> Automatic];

ParaW[i_Integer]:= Cases[Coalitions,{___,i,___}];

ParaAvConvexQ[args___]:=(Message[ParaAvConvexQ::argerr];$Failed);
ParaAvConvexQ[game_] := Block[{dispre, pwset, chsum,delmp},
    pwset = Drop[Subsets[T],1];
    DistributeDefinitions[pwset];
    chsum = ParallelMap[ParaCheckSumQ[#, T] &, pwset,Method -> "CoarsestGrained"];
    delmp = DeleteCases[chsum, {{}, {}}];
    Apply[And, Union[chsum]]			      
 ];

ParaCheckSumQ[teilmg_List, T_] := 
  Block[{supset, smarg, dispres},
    supset = ParaOberMenge[teilmg, T];
    smarg = ParaSumMargContribution[#, teilmg] & /@ supset;
    Apply[And, Union[smarg]]
];


ParaOberMenge[teilmg_List, T_List] := Block[{compl,subc,prop},
    compl = Complement[T, teilmg];
    subc=Subsets[compl];
    prop=Join[teilmg, #] & /@ subc;
    Sort[#] & /@ prop

];

ParaSumMargContribution[superset_List, teilmg_List] := 
  Block[{dispre, delisp, delitlm, sumtmg, add},
    delisp = DeleteCases[superset, #] & /@ teilmg;
    delitlm = DeleteCases[teilmg, #] & /@ teilmg;
    sumtmg = MapThread[(v[superset] - v[#1] - v[teilmg] + v[#2]) &, {delisp, delitlm}];
    add = Total[sumtmg] // Simplify;
    NonNegative[add]
];


(*
Def. Every subset S of T induce a sub-game w via w(S) = v(S) on the new player set S.
Prop. A game v is superadditive, if for every sub-game w it holds w =< dual w.
*)

ParaSuperAdditiveQ[args___]:=(Message[ParaSuperAdditiveQ::argerr];$Failed);
ParaSuperAdditiveQ[game_] := Block[{coal, clsup},
    coal = Coalitions;
    DistributeDefinitions[v];
    clsup = Map[ParaSupAddQ[#] &, coal];
    Apply[And, clsup]
];


(*
Checking if w =< dual w holds for every subgame w.
*)

ParaSupAddQ[teilmg_List] := Block[{tpws, valsubg, duval, leq},
    tpws = Subsets[teilmg];
    valsubg = ParallelMap[v[#] &, tpws];
    duval = Parallelize[(v[T]-v[#] & /@ Reverse[tpws])];
    leq = MapThread[LessEqual, {valsubg, duval}];
    Apply[And, leq]
 ];


ParaWrongDimension:=(Print["Payoff vector has not the correct dimension!"]); 

ParaWrongCoordDimension[T_]:= Block[{},
      Print["List of unanimity coordinates of size 2 has not the correct length!"];
      Print["The correct dimension is: ", Binomial[Length[T],2]];
];
ParaWrongCoordDimension[coord_List,T_]:= Block[{},
      Print["List of unanimity coordinates of length ", Length[coord]];
      Print["is not correct!"];
      Print["The correct dimension is: ", 2^Length[T]];
];

ParaPrintRemark[payoff_List]:= (
      Print["Dimensions is equal to ",Dimensions[payoff]];
      Print["Depth is equal to ",Depth[payoff]];
      Print["Usage: MaxExcessBalanced[game,payoff] and ExcessPayoff[game,payoff]"];
      Print["The variable 'payoff' has not the correct input format."];
      Print["The variable 'payoff' must be a list of payoff vectors or a single payoff vector."]
);


SetSharedVariable[T];
