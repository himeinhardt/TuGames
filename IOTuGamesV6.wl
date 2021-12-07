(* ::Package:: *)

(*
    : Title : IOTuGamesV6.m
    : Release Date : 07.12.2021
    : Version 3.0.2 

*)

(* :Context: IOTuGamesV6` *)

(* :Summary:
    This package provides some graphical extensions to the package TuGames for Mathematica 8.x and higher.
*)

(* : Author :
     Holger Ingmar Meinhardt
     Department of Economics, University of Karlsruhe (KIT)
     Holger.Meinhardt@wiwi.uni-karlsruhe.de
*)

(*
   : Mathematica Version : 12.x
*)
(* 
   :History:
    :IOTuGames.m:
      Version 1.1: Output of the graphics functions are not compatible with JavaView
      Version 1.3: Output of the graphics functions are compatible with JavaView
      Version 1.5: Some minor code revision.
      Mathematica version 5.x and lower
.
    :IOTuGamesV6.m:
      Version 2.0: Complete code revision to make it compatible with the new graphic concept of 
                   Mathematica since version 6.x. Thus, this package is exclusively dedicated to 
                   Mathematica version 6.x and higher. 
      
      Version 2.1: Transcription of the old option rules to the new ones invented by Mathematica 8.x.
                   This package is exclusively dedicated to Mathematica version 8.x and higher.
      Version 2.2: Small corrections to avoid warning like
                   'OptionValue::nodef: "Unknown option PlotCore3dV6 for ... '
      Version 2.3: Corrects a problem with a bad viewpoint for AnimationKernelPropertyV6.
      Version 2.4: Replaces Line[] to Tube[] for the skeletons.
                   Correcting a wrong projection of the imputation set from dim 4 to dim 3. 
                   The radius of the Sphere related to the Pre-Kernel, Pre-Nucleolus, and Shapley value
                   can now be adjusted, for instance, through PtRadius -> 0.0061, the default is
                   PtRadius -> 0.021.
      Version 2.5: The Thickness of the line segment of a two-dimensional core is set to 0.7*PtRadius,
                   and can therefore adjusted by setting PtRadius. Similar for the line segment of a
                   two-dimensional Kernel, this is set to 0.75*PtRadius. In addition, the modiclus
                   can be drawn by invoking the options ViewModiclusSol -> True. Finally, a bug
                   w.r.t. the option UseManipulate -> True has been fixed.
      Version 2.6.0:
                   Performing some code maintenance.   
 
      Version 3.0.2:
                   
 *)


(* :Requirements: 
    
    :cddmathlink libraries:
     http://www.ifor.math.ethz.ch/~fukuda/cdd_home/ (cddml, PolytopeSkeleton.m)

*)

(* :Limitations:
    Not useable for Mathematica version < 8. 
    Four Person Games only!
*)




BeginPackage["TUG`IOTuGamesV6`"];

PlotCore3dV6::usage =
"PlotCore3dV6[game, options] plots the core of the game.";

SkelCore3dV6::usage =
"SkelCore3dV6[game, options] depicts the skeleton of the core.";

SkelImputationV6::usage =
"SkelImputationV6[game,options] plots the imputation set as a skeleton.";

StrongEpsCore3dV6::usage = 
"StrongEpsCore3dV6[game,options] depicts the skeleton of the strong epsilon core.";

AnimationKernelPropertyV6::usage = 
"AnimationKernelPropertyV6[game,options] visualizes the relationship between the kernel solution 
 and the strong epsilon core.";

ShowKernelCatcherV6::usage = 
"ShowKernelCatcherV6[game,options] plots the interlocking of the imputation and lower or 
 proper reasonable set as a skeleton.";

SkelReasonableSetV6::usage = 
"SkelReasonableSetV6[game,options] plots the reasonable set of a game as a skeleton.";

SkelLowerSetV6::usage = 
"SkelLowerSetV6[game,options] plots the lower set of a game as a skeleton.";

CriticalValue::usage =
"Is an option for the functions ShwoKernelCatcherV6[] and StrongEpsCore3dV6[].
 The default value of the option can be changed by CriticalValue-> integer-value.
 Admissible integer numbers are 1,2,3,4,5, and 6. This selects a critical
 value for the strong epsilon core.";

EpsStrValues::usage =
"Sets a specific epsilon value for a strong epsilon core. This option can be
 set by invoking EpsStrValues -> real-value, for instance, EpsStrValues -> 0.5.";

KernelCoord::usage = 
"Is an option of the functions PlotCore3DV6[],PlotStrCore3DV6[],StrongEpsCore3dV6[]
 and ShowKernelCatcherV6[]. If the variable ker holds the distribution of a kernel
 element, then this option can be set by KernelCoord -> ker. Do not forget to 
 activate the option ViewKernelSol -> True. Similar for ShapleyCoord and NucleolusCoord.";

PictureSize::usage =
"An option to specify the size of the image of StrongEpsCore3dV6[]. Same as ImageSize. 
 Both values must coincide.";


(* :Error Messages: *)

PlotCore3dV6::argerr="One argument was expected.";
SkelCore3dV6::argerr="Four arguments were expected.";
SkelImputationV6::argerr="One argument was expected.";
StrongEpsCore3dV6::argerr="One argument was expected.";
AnimationKernelPropertyV6::argerr="One argument was expected.";
ShowKernelCatcherV6::argerr="One argument was expected.";
SkelReasonableSetV6::argerr="One argument was expected.";
SkelLowerSetV6::argerr="One argument was expected.";

(* 
Choose the lighting you prefer mostly.
1.)
vec1={{1,0,1},1,1,1,0,1,1};
clv={Red,Green,Blue};
lt=Table[{"Directional",clv[[t]],ImageScaled /@ {vec1[[t]],{.5,.5,.5}}},{t,1,3}];
2.)
lt={{"Directional", RGBColor[.3, 1, .1], {{5, 5, 4}, {5, 5, 0}}}}
3.)
lt={Automatic}
4.)
lt={White}
5.) 
lt={Neutral}
*)
lt=Lighting -> {{"Directional", RGBColor[.3, 1, .1], {{5, 5, 4}, {5, 5, 0}}}};
Map[SetOptions[#,AspectRatio -> 1,Boxed -> False,ImageSize->{400,434},ViewPoint -> {1.714, 2.478, 1.540},  ViewCenter -> {.35, .35, .3}, ImageMargins -> 15, Lighting -> lt] &, {Graphics3D}];
(*
 Activate the line below, if you want to reccur to the old behavior, and deactivate the line above. 
Map[SetOptions[#,AspectRatio -> 1,Boxed -> False,ImageSize->{400,434},ViewPoint -> {1.714, 2.478, 1.540}, Lighting -> lt] &, {Graphics3D}];
*)
(* 
SetOptions[Graphics3D, ViewCenter -> {.35, .25, 1},  ImageMargins -> 15]  
*) 

  
Options[PlotCore3dV6] = Sort[{ViewSkel -> False, ViewKernelSol -> False, KernelCoord -> {}, ViewShapleySol -> False, ShapleyCoord -> {}, ViewNucleolusSol-> False, NucleolusCoord->{}, ViewModiclusSol-> False, ModiclusCoord->{}, ViewPayoffSol -> False, PayoffCoord -> {}, ViewLegend -> False, ShowImputationSet -> True, SyncDim -> True, Verbosely -> True, PtRadius -> 0.021, PictureSize -> {400,434}}];
Options[StrongEpsCore3dV6] = Sort[{ShowStrongEpsCore -> True, ShowCore -> True, EpsStrValues -> {}, PictureSize -> {400,434},ViewSkel -> False, ShowImputationSet -> True, ViewKernelSol -> False, KernelCoord -> {}, ViewShapleySol -> False, ShapleyCoord -> {}, ViewNucleolusSol-> False, NucleolusCoord->{}, ViewModiclusSol-> False, ModiclusCoord->{}, ViewPayoffSol -> False, PayoffCoord -> {}, CriticalValue -> {1}, SyncDim -> True,PtRadius -> 0.021}];
Options[AnimationKernelPropertyV6] = Sort[{UpperCriticalVal ->{1/2}, LowerCriticalVal -> {},ManipulateMode->False,StepSize -> {-(1/4)},ShowStrongEpsCore -> True, ShowCore -> True, EpsStrValues -> {}, PictureSize -> {400,434},ViewSkel -> False, ShowImputationSet -> True, ViewKernelSol -> False, KernelCoord -> {}, ViewShapleySol -> False, ShapleyCoord -> {}, ViewNucleolusSol-> False, NucleolusCoord->{}, ViewModiclusSol-> False, ModiclusCoord->{}, ViewPayoffSol -> False, PayoffCoord -> {}, CriticalValue -> {1}, SyncDim -> True,PtRadius -> 0.021}];
Options[ShowKernelCatcherV6] = Sort[{ShowCore->False, ShowLowerSet->False, ShowUpperSet-> True, ShowStrongEpsCore -> False, EpsStrValues -> {}, ViewSkel -> False, ShowImputationSet -> True, ViewKernelSol -> False, KernelCoord -> {}, ViewShapleySol -> False, ShapleyCoord -> {}, ViewNucleolusSol-> False, NucleolusCoord->{}, ViewModiclusSol-> False, ModiclusCoord->{}, ViewPayoffSol -> False, PayoffCoord -> {}, CriticalValue -> {1}, SyncDim -> True,PtRadius -> 0.021,PictureSize -> {400,434}}]; 
Options[SkelImputationV6] = Sort[{SyncDim -> 1}];

Begin["`Private`"];

Needs["TUG`coop`CooperativeGames`"];
Needs["TUG`TuGames`"];
Needs["TetGenLink`"];
Needs["PlotLegends`"];
Get["TUG`vertex`PolytopeSkeleton`"];

PlotCore3dV6[args___]:=(Message[PlotCore3dV6::argerr];$Failed);
PlotCore3dV6[game_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] :=
  Module[{vwskl,vwker,vwshv,vwnuc,vwpay,vwmnc,vwleg,mnc,rd,kerc,fs,shc,nuc,paycoord,shimp,vrb,bx,dld4,filopts,gr,psm,crQ},
    filopts = FilterRules[{opts},Options[Graphics3D]];
    vwskl=OptionValue[ViewSkel];
    vwker=OptionValue[ViewKernelSol];
    vwshv = OptionValue[ViewShapleySol]; 
    vwnuc = OptionValue[ViewNucleolusSol];
    vwmnc = OptionValue[ViewModiclusSol];	 
    vwpay = OptionValue[ViewPayoffSol];
    vwleg = OptionValue[ViewLegend];	 	 
    kerc = OptionValue[KernelCoord];
    shc = OptionValue[ShapleyCoord];
    nuc = OptionValue[NucleolusCoord];
    mnc = OptionValue[ModiclusCoord];
    fs = OptionValue[PictureSize];	 
    paycoord = OptionValue[PayoffCoord];	 
    shimp = OptionValue[ShowImputationSet];
    dld4= OptionValue[SyncDim];
    vrb= OptionValue[Verbosely];
    bx= OptionValue[Boxed];
    rd = OptionValue[PtRadius];
    crQ = CoreQ[game];
    {gr,psm} = If[SameQ[crQ,True], PlotCore3DV6[game,ViewSkel -> vwskl, ViewKernelSol -> vwker, KernelCoord -> kerc, ViewShapleySol -> vwshv, ShapleyCoord -> shc, ViewNucleolusSol -> vwnuc, NucleolusCoord -> nuc, ViewModiclusSol -> vwmnc, ModiclusCoord -> mnc, ViewPayoffSol -> vwpay, PayoffCoord -> paycoord, PictureSize-> fs, ViewLegend -> vwleg, ShowImputationSet -> shimp,SyncDim -> dld4, PtRadius -> rd, Boxed-> bx,filopts],
                  If[SameQ[vrb,True],Print["Core is empty! No Core plotted."],True];
                  PlotNonCoreSol3d[game, ViewKernelSol -> vwker, KernelCoord -> kerc, ViewShapleySol -> vwshv, ShapleyCoord -> shc, ViewNucleolusSol -> vwnuc, NucleolusCoord -> nuc, ViewModiclusSol -> vwmnc, ModiclusCoord -> mnc, ViewPayoffSol -> vwpay, PayoffCoord -> paycoord, PictureSize-> fs, ViewLegend -> vwleg, PtRadius -> rd,Boxed-> False, filopts]
                  ];
    Return[gr];

];



PlotCore3DV6[game_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] :=
  Module[{vwskl,vwker,vwshv,vwnuc,vwmnc,vwpay,vwleg,kerc,rd,shc,nuc,mnc,paycoord,shimp,origgame,trext,fs,varl,minv,dld4,filopts,norm,normgame,vertlist,linearity,ecdlist, eadlist, icdlist, iadlist,extmat,d1,d2,oldvls,dpt,dlvert,gr1,gr2,gr3,gr4,gr5,gr6,gr7,gr8,grli,gr,psm={}},
    filopts = FilterRules[{opts},Options[Graphics3D]];
    vwskl = OptionValue[ViewSkel];
    vwker = OptionValue[ViewKernelSol];
    vwshv = OptionValue[ViewShapleySol];
    vwnuc = OptionValue[ViewNucleolusSol];
    vwmnc = OptionValue[ViewModiclusSol];	 
    vwpay = OptionValue[ViewPayoffSol];
    vwleg = OptionValue[ViewLegend];	 
    kerc = OptionValue[KernelCoord];
    shc = OptionValue[ShapleyCoord];
    nuc = OptionValue[NucleolusCoord];
    mnc = OptionValue[ModiclusCoord];
    fs = OptionValue[PictureSize];	 
    paycoord = OptionValue[PayoffCoord];	 
    shimp = OptionValue[ShowImputationSet];
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    oldvls= v[#] & /@ Subsets[T];
    norm = OneNormalization[game];
    normgame = DefineGame[T,norm];
    {{vertlist,linearity},ecdlist,eadlist,icdlist,iadlist,extmat}=CddGmpPlotCore[normgame];
    dpt=Depth[vertlist];
    {d1,d2}=If[dpt===2,Flatten[{1,Dimensions[vertlist]}],Dimensions[vertlist]];
    dlvert=Which[d2===4,
            If[d1===1, RedDimV6[First[vertlist]],
                 trext= Transpose[vertlist];
                 varl=N[Variance[#] &/@ trext];
                 minv=Min[varl];
                 psm=Position[varl,minv];
                 psm=First[psm];
                 Delete[#,psm] &/@ vertlist
              ],
          d2===3, vertlist,
          True, vertlist];
    psm=If[SameQ[dld4,True],psm,{}];
    gr1=Which[d1===1, GenCoreGraphPointV6[dlvert,PtRadius -> rd,filopts],
              d1===2, GenCoreGraphLineV6[dlvert, SyncDim -> psm,PtRadius -> rd,filopts],
              True, If[vwskl===False,DrawCore3dV6[dlvert,filopts],SkelImputationV6[normgame,SyncDim -> psm,opts]]];
    gr2=Which[d1===1,{}, 
              d1===2,{},
              True,SkelCore3dV6[N[dlvert],ecdlist,eadlist,extmat,filopts]];
    gr3=If[SameQ[shimp,True], SkelImputationV6[normgame,SyncDim -> psm,opts],{}];
    gr4=If[SameQ[vwker,True],ShowKernelV6[normgame, KernelCoord -> kerc,SyncDim -> psm,PtRadius -> rd,filopts],{}];
    gr5=If[SameQ[vwshv,True],ShowShapleyV6[normgame,ShapleyCoord -> shc,SyncDim -> psm,PtRadius -> rd,filopts],{}];
    gr6=If[SameQ[vwnuc,True],ShowNucleolusV6[normgame,NucleolusCoord -> nuc,SyncDim -> psm,PtRadius -> rd,filopts],{}];
    gr7=If[SameQ[vwmnc,True],ShowModiclusV6[normgame,ModiclusCoord -> mnc,SyncDim -> psm,PtRadius -> rd,filopts],{}];	 
    gr8=If[SameQ[vwpay,True],ShowPayoffV6[normgame,PayoffCoord -> paycoord,SyncDim -> psm,PtRadius -> rd,filopts],{}];	 
    grli=Flatten[{gr1,gr2,gr3,gr4,gr5,gr6,gr7,gr8}];
    gr=If[SameQ[vwleg,False],Show[grli, ImageSize -> fs],
	                    ShowLegend[Show[grli, ImageSize -> fs], {{{Graphics[{Blue, Disk[{0, 0}, 0.005]}], "Shapley Value"},
					     {Graphics[{Green, Disk[{0, 0}, 0.005]}], "Nucleolus"},
					     {Graphics[{Red, Disk[{0, 0}, 0.005]}], "Kernel"},
					     {Graphics[{Purple, Disk[{0, 0}, 0.005]}], "Modiclus"}}, 
                                              LegendShadow -> None, LegendTextSpace -> 5, LegendPosition -> {1.1, -.4}, LegendSize -> {0.5, 0.25}}]];
    origgame=DefineGame[T,oldvls];
    Return[{gr,psm}];
];

DrawCore3dV6[vert_List, opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] :=
  Module[{pts,surface,gr,filopts},
    filopts=FilterRules[{opts},Options[Graphics3D]]; 	 
    {pts, surface} = TetGenConvexHull[vert];
    gr=Graphics3D[{Opacity[.4], Yellow, GraphicsComplex[pts,Polygon[surface]]},filopts];  
    Return[gr];

 ];

SkelCore3dV6[args___]:=(Message[SkelCore3dV6::argerr];$Failed);
SkelCore3dV6[vert_List, ecd_List, ead_List, extmat_List, opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] :=
   Module[{amat,bvec,viewpt,trext,minv,psm,dlvert,uvp1,vskl,gr,filopts},
    filopts=FilterRules[{opts},Options[Graphics3D]];  
    amat=Transpose[Drop[Transpose[extmat],1]];
    amat = Take[#,-3] &/@ amat;
    bvec=Transpose[extmat][[1]];
    uvp1 = circle[Pi/11, 50, 20];
    vskl=VisibleSkeleton[vert,ecd,ead,{amat, bvec}, uvp1];
    gr=Graphics3D[{Thick, GraphicsComplex[vert, vskl]},filopts];
    Return[gr];
   ];


PlotNonCoreSol3d[game_, opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] :=
  Module[{vwskl,vwker,vwshv,vwnuc,vwmnc,vwpay,kerc,shc,nuc,mnc,rd,psm,origgame,paycoord,shimp,dld4,filopts,fs,oldvls,norm,normgame,gr1,gr2,gr3,gr4,gr5,gr6,grli,gr},
    filopts = FilterRules[{opts},Options[Graphics3D]];
    vwker = OptionValue[ViewKernelSol];
    vwshv = OptionValue[ViewShapleySol];
    vwnuc = OptionValue[ViewNucleolusSol];
    vwmnc = OptionValue[ViewModiclusSol];	 
    vwpay = OptionValue[ViewPayoffSol];	 	 
    kerc = OptionValue[KernelCoord];
    shc = OptionValue[ShapleyCoord];
    nuc = OptionValue[NucleolusCoord];
    mnc = OptionValue[ModiclusCoord];
    fs = OptionValue[PictureSize];	 	 
    paycoord = OptionValue[PayoffCoord];	 
    rd = OptionValue[PtRadius];
    psm = ImpRedDimV6[game];
    oldvls= v[#] & /@ Subsets[T];
    norm = OneNormalization[game];
    normgame = DefineGame[T,norm];
    gr1 = SkelImputationV6[normgame,SyncDim -> psm,opts];
    gr2=If[vwker===True,ShowKernelV6[normgame, KernelCoord -> kerc,SyncDim -> psm,PtRadius -> rd,filopts],{}];
    gr3=If[vwshv===True,ShowShapleyV6[normgame,ShapleyCoord -> shc,SyncDim -> psm,PtRadius -> rd,filopts],{}];
    gr4=If[vwnuc===True,ShowNucleolusV6[normgame,NucleolusCoord -> nuc,SyncDim -> psm,PtRadius -> rd,filopts],{}];
    gr5=If[SameQ[vwmnc,True],ShowModiclusV6[normgame,ModiclusCoord -> mnc,SyncDim -> psm,PtRadius -> rd,filopts],{}];	 	 
    gr6=If[vwpay===True,ShowPayoffV6[normgame,PayoffCoord -> paycoord,SyncDim -> psm,PtRadius -> rd,filopts],{}];	 
    grli=Flatten[{gr1,gr2,gr3,gr4,gr5,gr6}];
    gr=Show[grli,ImageSize-> fs];
    origgame=DefineGame[T,oldvls];
    Return[{gr,psm}];
      ];

SkelImputationV6[args___]:=(Message[SkelImputationV6::argerr];$Failed);
SkelImputationV6[game_, opts:OptionsPattern[{SkelImputationV6,PlotCore3dV6,Graphics3D}]] := 
     Module[{gr,filopts,showskl, impext, implin, impecdlist, rg, impeadlist, impicdlist, impiadlist, impinedata, m0, d0, trext, varl, minv, psm, dlvert, amat, bvec, vp, redead1, redead2, redead3, redead4},
     filopts = FilterRules[{opts},Options[Graphics3D]]; 
      psm = OptionValue[SyncDim];
     {{impext, implin}, impecdlist, impeadlist, impicdlist, impiadlist, impinedata} = CddGmpPlotImputationSet[game];
      {m0,d0} = Dimensions[impext];
      dlvert = ListRedDimV6[impext, SyncDim->psm];
      amat = Transpose[Drop[Transpose[impinedata],1]];
      amat = Take[#,-3] &/@ amat;
      bvec = Transpose[impinedata][[1]];
      vp = circle[Pi/11, 50, 20];
      redead1 = DeleteCases[#,m0+1]&/@ Drop[impeadlist,-4];
      redead2 = DeleteCases[#,m0+2]&/@ redead1;
      redead3 = DeleteCases[#,m0+3]&/@ redead2;
      redead4 = DeleteCases[#,m0+4]&/@ redead3;
      rg=Range[4];
      redead4=MapThread[Append,{redead4,rg}];
      gr=Graphics3D[{Thick, GraphicsComplex[dlvert, Tube[redead4]]},filopts]; 
      Return[gr];
];

StrongEpsCore3dV6[args___]:=(Message[StrongEpsCore3dV6::argerr];$Failed);
StrongEpsCore3dV6[game_, opts:OptionsPattern[{StrongEpsCore3dV6,Graphics3D}]] :=
    Module[{vwskl,vwker,vwshv,vwnuc,vwmnc,vwpay,kerc,shc,nuc,mnc,epsw,paycoord,dld4,rd,fs,epsval,psm,filopts,strgskl,shcr,mvplt,impsetQ,critval,oldvls,origgame,norm,normgame,epsvls,crQ,newgame,gr0,gr1,gr2,gr3,grli},
     filopts = FilterRules[{opts},Options[Graphics3D]]; 
     vwskl = OptionValue[ViewSkel];
     vwker = OptionValue[ViewKernelSol];
     vwshv = OptionValue[ViewShapleySol];
     vwnuc = OptionValue[ViewNucleolusSol];
     vwmnc = OptionValue[ViewModiclusSol];	   
     vwpay = OptionValue[ViewPayoffSol];	 	   
     kerc = OptionValue[KernelCoord];
     shc = OptionValue[ShapleyCoord];
     nuc = OptionValue[NucleolusCoord];
     mnc = OptionValue[ModiclusCoord];	   
     paycoord = OptionValue[PayoffCoord];	   
     impsetQ = OptionValue[ShowImputationSet];
     strgskl = OptionValue[ShowStrongEpsCore];
     shcr = OptionValue[ShowCore];
     epsw =  OptionValue[EpsStrValues];
     critval = OptionValue[CriticalValue];
     dld4 = OptionValue[SyncDim];
     rd = OptionValue[PtRadius];
     fs = OptionValue[PictureSize];
     shcr = If[SameQ[shcr,True],CoreQ[game],shcr];
     oldvls= v[#] & /@ Subsets[T];
     norm = OneNormalization[game];
     normgame = DefineGame[T,norm];
     epsval = If[SameQ[epsw,{}], SelectCritical[normgame,critval],epsw];
(*
     gr0=Which[SameQ[shcr,False], If[impsetQ===True,SkelImputationV6[normgame,Boxed->False,filopts],{}],
               True,SkelImputationV6[normgame,Boxed->False,filopts]];
*)
     gr0=Which[SameQ[shcr,False], If[impsetQ===True,SkelImputationV6[normgame,Boxed->False,filopts],{}],
               True,{}];
     origgame=DefineGame[T,oldvls];
     {gr1,psm} = If[SameQ[shcr,True],PlotCore3DV6[origgame,ViewSkel -> vwskl, ShowImputationSet -> impsetQ,SyncDim -> dld4,PtRadius -> rd,filopts],{gr0,{}}];
     psm=Which[SameQ[psm,{}],MultRedDimV6[origgame],
               True,psm];
     epsvls = EpsValue[origgame, epsval];
     epsvls = Prepend[epsvls,0];
     epsvls = Append[epsvls,Last[oldvls]];
     newgame= DefineGame[T,epsvls];
     gr2=PlotStrCore3DV6[newgame,ViewSkel -> True, ViewKernelSol -> vwker, KernelCoord -> kerc, ViewShapleySol -> vwshv, ShapleyCoord -> shc, ViewNucleolusSol -> vwnuc, NucleolusCoord-> nuc, ViewModiclusSol -> vwmnc, ModiclusCoord -> mnc, ViewPayoffSol -> vwpay, PayoffCoord -> paycoord, SyncDim -> psm,PtRadius -> rd,Boxed->False,filopts];
     origgame=DefineGame[T,oldvls];
     grli=Flatten[{gr2,gr1}];
     gr3=Show[grli,ImageSize->fs,PlotLabel -> StringJoin["eps=",ToString[N[epsval]]]]; 
     Return[gr3];
     
];


SelectCritical[game_,critval_List]:=
 Module[{epsval},
  epsval=Which[First[critval] === 1, FifthCriticalVal[game],
               First[critval] === 2, SecondCriticalVal[game],
               First[critval] === 3, ThirdCriticalVal[game],
               First[critval] === 4, StarCriticalVal[game],
               First[critval] === 5, SecondStarCriticalVal[game],
               First[critval] === 6, ThirdStarCriticalVal[game],
               True, FifthCriticalVal[game]];
  epsval = epsval[[1,1]] /. epsval;
  epsval = Max[epsval,1];
  Return[epsval];
];


PlotStrCore3DV6[game_,opts:OptionsPattern[{StrongEpsCore3dV6,Graphics3D}]] :=
  Module[{vwskl,vwker,vwshv,vwnuc,vwmnc,vwpay,kerc,shc,nuc,mnc,rd,psm,dlvert,paycoord,shrc,dld4,filopts,norm,normgame,vertlist,linearity,ecdlist,eadlist,icdlist,iadlist,extmat,gr1,gr2,gr4,gr5,gr6,gr7,gr8,grli,gr},
    filopts = FilterRules[{opts},Options[Graphics3D]];
    vwskl = OptionValue[ViewSkel];
    vwker = OptionValue[ViewKernelSol];
    vwshv = OptionValue[ViewShapleySol];
    vwnuc = OptionValue[ViewNucleolusSol];
    vwmnc = OptionValue[ViewModiclusSol];	 
    vwpay = OptionValue[ViewPayoffSol];	 
    kerc = OptionValue[KernelCoord];
    shc = OptionValue[ShapleyCoord];
    nuc = OptionValue[NucleolusCoord];
    mnc = OptionValue[ModiclusCoord];	 	 
    paycoord = OptionValue[PayoffCoord];
    dld4 = OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    norm = OneNormalization[game];
    normgame = DefineGame[T,norm];
    {{vertlist,linearity},ecdlist,eadlist,icdlist,iadlist,extmat}=CddGmpPlotCore[normgame];
    psm=Which[SameQ[dld4,True],MultRedDimV6[normgame],
              True,dld4];
    dld4=psm;
    dlvert=Delete[#,psm] &/@ vertlist;
    gr1=If[SameQ[vwskl,False],DrawCore3dV6[dlvert,filopts],{}];
    gr2=SkelCore3dV6[N[dlvert],ecdlist,eadlist,extmat,filopts];
    gr4=If[SameQ[vwker,True],ShowKernelV6[normgame, KernelCoord -> kerc, SyncDim -> dld4,PtRadius -> rd,filopts],{}];
    gr5=If[SameQ[vwshv,True],ShowShapleyV6[normgame,ShapleyCoord -> shc, SyncDim -> dld4,PtRadius -> rd,filopts],{}];
    gr6=If[SameQ[vwnuc,True],ShowNucleolusV6[normgame,NucleolusCoord -> nuc, SyncDim -> dld4,PtRadius -> rd,filopts],{}];
    gr7=If[SameQ[vwmnc,True],ShowModiclusV6[normgame,ModiclusCoord -> mnc,SyncDim -> psm,PtRadius -> rd,filopts],{}];	 	 
    gr8=If[SameQ[vwpay,True],ShowPayoffV6[normgame,PayoffCoord -> paycoord,SyncDim -> psm,PtRadius -> rd,filopts],{}];
    gr=If[SameQ[vwskl,False],grli=Flatten[{gr1,gr2,gr4,gr5,gr6,gr7,gr8}];Show[grli],grli=Flatten[{gr2,gr4,gr5,gr6,gr7,gr8}];Show[grli]];
    Return[gr];
];

AnimationKernelPropertyV6[args___]:=(Message[AnimationKernelPropertyV6::argerr];$Failed);
AnimationKernelPropertyV6[game_, opts:OptionsPattern[{AnimationKernelPropertyV6,Graphics3D}]] :=
  Module[{shcr, fs, imps, crv, vwker, kcoord, vwsh, shc, vwnuc,nuc, rd, vwmnc, mnc, vwpay, paycoord,filopts,epsw, uppval, lowval, stpsize,manip, vpt,dld4,detlow},
    filopts = FilterRules[{opts},Options[Graphics3D]];
    shcr = OptionValue[ShowCore];
    imps = OptionValue[ShowImputationSet];
    crv = OptionValue[CriticalValue];
    vwker = OptionValue[ViewKernelSol];
    kcoord = OptionValue[KernelCoord];
    vwsh = OptionValue[ViewShapleySol];
    shc = OptionValue[ShapleyCoord];
    vwnuc = OptionValue[ViewNucleolusSol];
    nuc = OptionValue[NucleolusCoord];
    vwmnc = OptionValue[ViewModiclusSol];
    mnc = OptionValue[ModiclusCoord];	  	 
    vwpay = OptionValue[ViewPayoffSol];
    paycoord = OptionValue[PayoffCoord];	 
    epsw = OptionValue[EpsStrValues];
    uppval = OptionValue[UpperCriticalVal];
    lowval = OptionValue[LowerCriticalVal];
    stpsize = OptionValue[StepSize];
    manip = OptionValue[ManipulateMode];
    vpt = OptionValue[ViewPoint];
    dld4 = OptionValue[SyncDim];
    fs = OptionValue[PictureSize];
    rd = OptionValue[PtRadius];
    detlow = If[lowval=={},First[EpsCore[game]], lowval[[1]]];
    If[SameQ[manip,False],
        Table[StrongEpsCore3dV6[game,EpsStrValues -> t, ViewKernelSol -> vwker, KernelCoord -> kcoord, ViewNucleolusSol -> vwnuc, NucleolusCoord -> nuc, ViewShapleySol -> vwsh, ShapleyCoord -> shc, ViewModiclusSol -> vwmnc, ModiclusCoord -> mnc, ViewPayoffSol -> vwpay, PayoffCoord -> paycoord, ShowCore->shcr, ShowImputationSet -> imps,SyncDim -> True,PtRadius -> rd,ViewPoint ->vpt,PictureSize->fs], {t, uppval[[1]], detlow, stpsize[[1]]}],
        Manipulate[StrongEpsCore3dV6[game,EpsStrValues -> t, ViewKernelSol -> vwker, KernelCoord -> kcoord, ViewNucleolusSol -> vwnuc, NucleolusCoord -> nuc, ViewShapleySol -> vwsh, ShapleyCoord -> shc, ShowCore->shcr, ViewPayoffSol -> vwpay, ViewModiclusSol -> vwmnc, ModiclusCoord -> mnc, PayoffCoord -> paycoord, ShowImputationSet -> imps,SyncDim -> True,PtRadius -> rd,PictureSize->fs,ViewPoint -> Dynamic[{v1,v2,v3}]], {{t, uppval[[1]],"Epsilon" },detlow, uppval[[1]], stpsize[[1]]}, {{v1, 1.714,"x-coordinate"}, 4},{{v2, 2,"y-coordinate"}, 4},{{v3, 1.54,"z-coordinate"}, 4}]] 
    ];


ShowKernelV6[game_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] :=
 Module[{kercoord,dld4,rd,filopts,kemQ,kersol,dpk,d1,d2,normQ,gr},
    kercoord = OptionValue[KernelCoord];
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    filopts = FilterRules[{opts},Options[Graphics3D]]; 
    kemQ=Length[kercoord];
    kersol=If[kemQ==0 ,KernelVertices[game],kercoord];
    dpk=Depth[kersol];    
    {d1,d2}=If[dpk==2,{1,4} ,Dimensions[kersol]];
    kersol=If[dpk == 3 && d1 == 1,First[kersol], kersol];
    normQ = Which[d1 === 1, Total[kersol],
                  d1 === 2, Total[#]&/@kersol,
                True,1];
    kercoord = Which[d1 === 1,
                       Which[normQ == 1, kersol,
                         True, kersol/normQ],
                     d1 === 2,
                       Which[(normQ[[1]] == 1 && normQ[[2]] == 1),kersol,
                         True,kersol/normQ[[1]]],
               True, kersol];
    gr=Which[d1==1, GenKernelGraphPointV6[kercoord,SyncDim ->dld4,PtRadius -> rd,filopts],
             d1==2, GenKernelGraphLineV6[kercoord,SyncDim ->dld4,PtRadius -> rd,filopts],
             True, kersol=Kernel[game];GenKernelGraphPointV6[kersol,SyncDim ->dld4,PtRadius -> rd,filopts]
    ];
    Return[gr];
];


ShowNucleolusV6[game_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] :=
    Module[{nuccoord,dld4,rd,filopts,normQ,nucsol,l1},
    nuccoord = OptionValue[NucleolusCoord];
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    filopts = FilterRules[{opts},Options[Graphics3D]]; 
    normQ = Which[Length[nuccoord] != 0, Total[ nuccoord], True, 1];
    nuccoord = Which[Length[nuccoord] != 0, Which[normQ == 1, nuccoord, True, nuccoord/normQ], True, nuccoord];
    l1 = Depth[nuccoord];
    Which[(Length[nuccoord]!=0 && l1==2)==True,GenNucleolusGraphPointV6[nuccoord,SyncDim ->dld4,PtRadius -> rd,filopts],
    True,nucsol = ModifiedNucleolus[game];GenNucleolusGraphPointV6[nucsol,SyncDim ->dld4,PtRadius -> rd,filopts]]
];


ShowModiclusV6[game_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] :=
    Module[{mnccoord,dld4,rd,filopts,normQ,mncsol,l1},
    mnccoord = OptionValue[ModiclusCoord];
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    filopts = FilterRules[{opts},Options[Graphics3D]]; 
    normQ = Which[Length[mnccoord] != 0, Total[ mnccoord], True, 1];
    mnccoord = Which[Length[mnccoord] != 0, Which[normQ == 1, mnccoord, True, mnccoord/normQ], True, mnccoord];
    l1 = Depth[mnccoord];
    Which[(Length[mnccoord]!=0 && l1==2)==True,GenModiclusGraphPointV6[mnccoord,SyncDim ->dld4,PtRadius -> rd,filopts],
    True,mncsol = Modiclus[game];GenModiclusGraphPointV6[mncsol,SyncDim ->dld4,PtRadius -> rd,filopts]]
];

ShowShapleyV6[game_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] :=
    Module[{shapcoord,dld4,rd,filopts,normQ,shapsol,l1,retval},
    shapcoord = OptionValue[ShapleyCoord];
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    filopts = FilterRules[{opts},Options[Graphics3D]]; 
    normQ = Which[Length[shapcoord] != 0, Total[shapcoord],True,1];
    shapcoord = Which[Length[shapcoord] != 0, Which[normQ == 1, shapcoord, True, shapcoord/normQ], True, shapcoord];
    l1 = Depth[shapcoord];
    retval=Which[(Length[shapcoord]!=0 && l1==2)==True,GenShapleyGraphPointV6[shapcoord,SyncDim ->dld4,PtRadius -> rd,filopts],
    True,shapsol = NewShapley[game];GenShapleyGraphPointV6[shapsol,SyncDim ->dld4,PtRadius -> rd,filopts]];
    Return[retval]
];



GenKernelGraphPointV6[payoff_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]]:=
   Module[{dld4,rd,filopts,reddim,sph,gr},
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    filopts = FilterRules[{opts},Options[Graphics3D]]; 
    reddim=If[Length[payoff]==4,
             Which[SameQ[dld4,{}],RedDimV6[payoff],
                   True,Delete[payoff,dld4]],payoff];
    sph = Sphere[reddim,rd];
    gr=Graphics3D[{ RGBColor[1,0,0], sph },filopts];
    Return[gr];
];


ShowPayoffV6[game_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] :=
    Module[{paycoord,dld4,rd,filopts,normQ,paysol,l1},
    paycoord = OptionValue[PayoffCoord];
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    filopts = FilterRules[{opts},Options[Graphics3D]];
    normQ = Which[Depth[paycoord] == 2, Total[paycoord],
		  Depth[paycoord] == 3, Total[First[paycoord]],
		  True,1];
    paycoord= Which[Depth[paycoord] == 2, List[paycoord],True,paycoord];	   
    paycoord =Which[Length[#] != 0, Which[normQ == 1, #, True, #/normQ], True, #] &/@ paycoord;
    l1 = Depth[paycoord];
    Which[(Length[paycoord]!=0 && l1<=3)==True,GenGraphPointV6[paycoord,SyncDim ->dld4,PtRadius -> rd,filopts],
    True,paysol = Table[v[T]/Length[T], {i, 1, Length[T]}];GenGraphPointV6[paysol,SyncDim ->dld4,PtRadius -> rd,filopts]]
];

RedDimV6[pay_List]:=
  Module[{mcoor,psmc},
    mcoord=Min[pay];
    psmc=Position[pay,mcoord];
    psmc=First[psmc];
    Delete[pay,psmc]
];

MultRedDimV6[game_] := 
  Module[{crQ,vertlist,trext,varl,minv,psm},
    crQ=CoreQ[game];
    vertlist=If[SameQ[crQ,True],CddGmpVerticesCore[game],CddVerticesImputationSet[game]];
    trext = Transpose[vertlist];
    varl=N[Variance[#] &/@ trext];
    minv=Min[varl];
    psm=Position[varl,minv];
    First[psm]
];

ListRedDimV6[vertlist_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]] := 
  Module[{trext,varl,minv,psm},
    dld4= OptionValue[SyncDim];
    trext = Transpose[vertlist];
    varl=N[Variance[#] &/@ trext];
    minv=Min[varl];
    psm=Position[varl,minv];
    psm = First[psm];
    psm = If[SameQ[dld4,{}],psm,dld4];
    Delete[#,psm] &/@ vertlist
];

ImpRedDimV6[game_] := 
  Module[{vertlist,trext,varl,minv,psm},
    vertlist = CddVerticesImputationSet[game];
    trext = Transpose[vertlist];
    varl=N[Variance[#] &/@ trext];
    minv=Min[varl];
    psm=Position[varl,minv];
    First[psm]
];


GenNucleolusGraphPointV6[payoff_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]]:=
   Module[{dld4,rd,filopts,reddim,sph,gr},
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    filopts = FilterRules[{opts},Options[Graphics3D]];
    reddim=If[Length[payoff]==4,
             Which[SameQ[dld4,{}],RedDimV6[payoff],
                   True,Delete[payoff,dld4]],payoff];
    sph = Sphere[reddim,rd];
    gr = Graphics3D[{ Green, sph },filopts];
    Return[gr];
];


GenModiclusGraphPointV6[payoff_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]]:=
   Module[{dld4,rd,filopts,reddim,sph,gr},
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    filopts = FilterRules[{opts},Options[Graphics3D]];
    reddim=If[Length[payoff]==4,
             Which[SameQ[dld4,{}],RedDimV6[payoff],
                   True,Delete[payoff,dld4]],payoff];
    sph = Sphere[reddim,rd];
    gr = Graphics3D[{ Purple, sph },filopts];
    Return[gr];
];


GenShapleyGraphPointV6[payoff_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]]:=
   Module[{dld4,rd,filopts,reddim,sph,gr},
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    filopts = FilterRules[{opts},Options[Graphics3D]]; 
    reddim=If[Length[payoff]==4,
             Which[SameQ[dld4,{}],RedDimV6[payoff],
                   True,Delete[payoff,dld4]],payoff];
    sph = Sphere[reddim,rd];
    gr=Graphics3D[{ RGBColor[0,0,1], sph },filopts];
    Return[gr];
];


GenGraphPointV6[payoff_List,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]]:=
   Module[{dld4,rd,filopts,py,reddim,l1,sph,gr},
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];
    filopts = FilterRules[{opts},Options[Graphics3D]];
    py=If[Depth[payoff]==2,{payoff},payoff];
    reddim=If[Length[#]==4,
             Which[SameQ[dld4,{}],RedDimV6[#],
                   True,Delete[#,dld4]],py] & /@ py;
    l1 = Depth[reddim];	  
    sph = If[l1==2,{RGBColor[1,1/2,0], Sphere[reddim,rd] }, {RGBColor[#] , Sphere[#,rd]} & /@ reddim];
    gr = Graphics3D[sph ,filopts];
    Return[gr];
   ];



GenCoreGraphPointV6[payoff_,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]]:=
   Module[{dld4,rd,filopts,pr,pay1,reddim,sph,gr},
    dld4= OptionValue[SyncDim];
    rd = OptionValue[PtRadius];	  
    filopts = FilterRules[{opts},Options[Graphics3D]]; 
    pr=Total[payoff];
    pay1=payoff/pr;
    reddim=If[Length[pay1]==4,
             Which[SameQ[dld4,{}],RedDimV6[pay1],
                   True,Delete[pay1,dld4]],pay1];
    sph = Sphere[reddim,1.1*rd];
    gr=Graphics3D[{ RGBColor[0,1,0], sph },filopts];
    Return[gr];
];


GenCoreGraphLineV6[payoff_List,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]]:= 
   Module[{filopts,dld4,rd,py1,reddim,crseg,gr},
      filopts = FilterRules[{opts},Options[Graphics3D]]; 
      dld4 = OptionValue[SyncDim];
      rd = OptionValue[PtRadius];
      py1=First[payoff];
      reddim = If[SameQ[py1,4],ListRedDimV6[payoff,SyncDim -> dld4],
                  payoff];
      crseg = Tube[reddim,0.7*rd]; (* kerseg = Line[reddim] *)
      gr=Graphics3D[{ Yellow, crseg },filopts];
      Return[gr];
];


GenKernelGraphLineV6[payoff_List,opts:OptionsPattern[{PlotCore3dV6,Graphics3D}]]:=
   Module[{filopts,dld4,rd,trpy,varl,minv,psm,reddim,kerseg,gr},
      filopts = FilterRules[{opts},Options[Graphics3D]]; 
      dld4= OptionValue[SyncDim];
      rd = OptionValue[PtRadius];	  
      trpy= Transpose[payoff];
      varl=N[Variance[#] &/@ trpy];
      minv=Min[varl];
      psm=Position[varl,minv];
      psm=First[psm];
      psm=If[SameQ[dld4,{}],psm,dld4];
      reddim=Delete[#,psm] &/@ payoff;
      kerseg = Tube[reddim,0.75*rd]; (* kerseg = Line[reddim] *)
      gr=Graphics3D[{ RGBColor[1,0,0], kerseg },filopts];
      Return[gr]
];

ShowKernelCatcherV6[args___]:=(Message[ShowKernelCatcherV6::argerr];$Failed);
ShowKernelCatcherV6[game_, opts:OptionsPattern[{ShowKernelCatcherV6,Graphics3D}]] :=
    Module[{vwskl,vwker,vwshv,vwnuc,vwmnc,vwpay,kerc,shc,nuc,mnc,paycoord,rd,fs,epsval,psm,shups,shcr,strCr,epsw,shlws,critval,dld4,filopts,oldvls,norm,normgame,gr0,origgame,gr1,epsvls,newgame,crQ,gr2,gr3,gr4,gr5,gr6,gr7,gr8,gr9,grli,gr},
        filopts = FilterRules[{opts},Options[Graphics3D]];
        vwskl = OptionValue[ViewSkel];
        vwker = OptionValue[ViewKernelSol];
        vwshv = OptionValue[ViewShapleySol];
        vwnuc = OptionValue[ViewNucleolusSol];
        vwmnc = OptionValue[ViewModiclusSol];	   
        vwpay = OptionValue[ViewPayoffSol];	 	   
        kerc = OptionValue[KernelCoord];
        shc = OptionValue[ShapleyCoord];
        nuc = OptionValue[NucleolusCoord];
        mnc = OptionValue[ModiclusCoord];	 	   
        paycoord = OptionValue[PayoffCoord];	   
        shups = OptionValue[ShowUpperSet];
        shcr = OptionValue[ShowCore];
        strCr = OptionValue[ShowStrongEpsCore];
        epsw =  OptionValue[EpsStrValues];
        shlws = OptionValue[ShowLowerSet];
        critval = OptionValue[CriticalValue];
        rd = OptionValue[PtRadius];
        dld4 = OptionValue[SyncDim];
        fs = OptionValue[PictureSize];
        dld4=If[SameQ[dld4,False],{},First[DetDim2Del[game]]];
        shcr = If[SameQ[shcr,True],
                crQ=CoreQ[game];
                Print["Is core nonempty? ", crQ];
                crQ,
               shcr];
        oldvls= v[#] & /@ Subsets[T];
        norm = OneNormalization[game];
        normgame = DefineGame[T,norm];
        gr0=SkelImputationV6[normgame,Boxed->False,SyncDim -> dld4,filopts];
        origgame=DefineGame[T,oldvls];
        {gr1,psm} = If[shcr===True,PlotCore3DV6[origgame,ViewSkel -> vwskl, ShowImputationSet -> False,PtRadius -> rd,Boxed->False,filopts],{gr0,MultRedDimV6[normgame]}];
        epsval=If[epsw==={},SelectCritical[normgame,critval],epsw];
        origgame=DefineGame[T,oldvls];
        epsvls = EpsValue[origgame, epsval];
        epsvls = Prepend[epsvls,0];
        epsvls = Append[epsvls,Last[oldvls]];
        newgame= DefineGame[T,epsvls];
        gr2=If[strCr==True, PlotStrCore3DV6[newgame,ViewSkel -> True,Boxed->False,SyncDim -> psm,PtRadius -> rd,filopts],{}];
        gr3=If[shups===True,SkelReasonableSetV6[normgame,filopts],{}];
        gr4=If[shlws===True,SkelLowerSetV6[normgame,opts],{}];
        gr5=ShowKernelV6[origgame, KernelCoord -> kerc, SyncDim -> dld4,PtRadius -> rd,filopts];
        gr6=If[vwshv===True,ShowShapleyV6[origgame,ShapleyCoord -> shc,SyncDim -> dld4,PtRadius -> rd,filopts],{}];
        gr7=If[vwnuc===True,ShowNucleolusV6[origgame,NucleolusCoord -> nuc,SyncDim -> dld4,PtRadius -> rd,filopts],{}];
        gr8=If[SameQ[vwmnc,True],ShowModiclusV6[origgame,ModiclusCoord -> mnc,SyncDim -> psm,PtRadius -> rd,filopts],{}];	 	   
        gr9=If[vwpay===True,ShowPayoffV6[origgame,PayoffCoord -> paycoord,SyncDim -> psm,PtRadius -> rd,filopts],{}];	   
        origgame=DefineGame[T,oldvls];
        grli=Flatten[{gr0,gr1,gr2,gr3,gr4,gr5,gr6,gr7,gr8,gr9}];
        gr=Show[grli, ImageSize-> fs, PlotLabel -> StringJoin["eps=",ToString[N[epsval]]]];
        Return[gr];
];

DetDim2Del[game_,vert_:{}]:= Module[{crQ,trext,varl,minv,psm},
     crQ=CoreQ[game];
     extlist=If[SameQ[vert,{}],
                Which[SameQ[crQ,True],CddGmpVerticesCore[game],
                     True,CddVerticesImputationSet[game]],vert];
     trext= Transpose[extlist];
     varl=N[Variance[#] &/@ trext];
     minv=Min[varl];
     psm=Position[varl,minv];
     psm=First[psm]
];

SkelReasonableSetV6[args___]:=(Message[SkelReasonableSetV6::argerr];$Failed);
SkelReasonableSetV6[game_, opts:OptionsPattern[Graphics3D]] :=
   Module[{filopts,norm,normgame,extlist,linearity,ecdlist,eadlist,icdlist,iadlist,inedata,dlvert,amat,bvec,vlist0,uvp1,m0,d0,lgt,mlg,redead,rg,vskl,gr},
      filopts = FilterRules[{opts},Options[Graphics3D]]; 
      norm = OneNormalization[game];
      normgame = DefineGame[T,norm];
      {{extlist, linearity}, ecdlist, eadlist, icdlist, iadlist, inedata} = CddGmpPlotReasonableSet[normgame, ProperContribution -> True];
      {m0,d0}= Dimensions[extlist];
      dlvert = If[SameQ[m0,1],RedDimV6[extlist],ListRedDimV6[extlist, SyncDim->{}]];
      amat= -Transpose[Drop[Transpose[inedata],1]];
      amat = Take[#,-3] &/@ amat;
      bvec=Transpose[inedata][[1]];
      uvp1 = circle[Pi/11, 50, 20];
      redead=Delete[T,#] &/@ T;
      rg=Range[4];
      redead=MapThread[Append,{redead,rg}];
      gr=If[SameQ[m0,1],     
               sph = Sphere[dlvert,0.02];
               Print["Upper Point is plotted as a magenta point!"];
               Print["Might coincide with the Nucleolus!"];
               Graphics3D[{ Magenta, sph },filopts],
            Graphics3D[{Thick, GraphicsComplex[dlvert, Tube[redead]]},filopts]];
      Return[gr];
];



SkelLowerSetV6[args___]:=(Message[SkelLowerSetV6::argerr];$Failed);
SkelLowerSetV6[game_, opts:OptionsPattern[]] :=
   Module[{filopts,norm,normgame,extlist,linearity,ecdlist,eadlist,icdlist,iadlist,inedata,dlvert,amat,bvec,vlist0,uvp1,m0,d0,pt,sph,redead,rg,gr},
      filopts = FilterRules[{opts},Options[Graphics3D]]; 
      norm = OneNormalization[game];
      normgame = DefineGame[T,norm];
      {{extlist, linearity}, ecdlist, eadlist, icdlist, iadlist, inedata} =  CddGmpPlotLowerSet[normgame];
      {m0,d0}=Dimensions[extlist];
      dlvert = If[SameQ[m0,1],RedDimV6[extlist],ListRedDimV6[extlist, SyncDim->{}]];  
      amat= Transpose[Drop[Transpose[inedata],1]];
      amat = Take[#,-3] &/@ amat;
      bvec=Transpose[inedata][[1]];
      uvp1 = circle[Pi/11, 50, 20];
      redead=Delete[T,#] &/@ T;
      rg=Range[4];
      redead=MapThread[Append,{redead,rg}];
      gr=If[SameQ[m0,1],     
               sph = Sphere[dlvert[[1]],0.02];
               Print["Lower Point is plotted as a orange point!"];
               Graphics3D[{ Orange, sph },filopts],
             Graphics3D[{Thick, GraphicsComplex[dlvert, Tube[redead]]},filopts]
           ];
      Return[gr];
];

End[];


EndPackage[]

