(* ::Package:: *)

(*  
    : Title : MATtug
    : Release Date : 12.05.2019      
    : Preliminary version:
      Function names could be changed in a future version. For testing only. 
*)
(* :Summary:	
    This package provides Mathematica interfaces to the Matlab toolbox MatTuGames using MATLink.
*)		

(* : Author : 
     Holger Ingmar Meinhardt
     Institute of Operations Research
     Karlsruhe Institute of Technology (KIT)
     Holger.Meinhardt@wiwi.uni-karlsruhe.de
*)
(*
  : Mathematica Version : 8.x, 9.x, 10.x, 11.x, 12.x
*)
(* :Summary:	
    This package provides Mathematica interfaces to the Matlab toolbox MatTuGames using MATLink.

*)			
(*  :Sources:


*)

(*:Requirements: 
   
    MATLink: A Mathematica application for seamless two-way communication and data transfer with MATLAB.
    http://matlink.org

    The Matlab toolbox MatTuGames from
    http://www.mathworks.de/matlabcentral/fileexchange/35933-mattugames
*)


(*
   :Comments:
   Argument game ~= v. Argument v is an array (Mathematica list) of length 2^n-1.
   Argument payoff is a vector (Mathematica list) of length n (in most cases optional).
   Argument tol is a tolerance value (optional).
   Argument apu is a list of a priori unions (required input).
   Argument cs is a communication situation or a hypergraph system (Mathematica list, required). 

*)   


(*
BeginPackage["TUG`MATtug`"];
*)

GameToMatlab::usage = 
    "GameToMatlab[game] converts a Tu game under Mathematica into Matlab.";

(* Usage of the interfaces. *)

Madv::usage = 
    "Madv[v,apu] computes the Aumann-Dreze value of game v using the Matlab toolbox MatTuGames.";

Mamc::usage = 
    "mamc[v] computes all marginal contributions of a Tu game v.";

Masg::usage = 
    "masg[v] computes all subgames of game v.";

Macrp::usage = 
    "Macrp[v] plots the anti-core of game v.";

Macrv::usage = 
    "Macrv[v,'method',tol] evaluates the vertices of the anti-core.";

MacrQ::usage = 
    "MarcQ[v,tol] checks the existence for the anti core of the game v.";

Makr::usage = 
    "Makr[v,payoff] computes an anti-kernel point of a Tu game.";

MakrQ::usage = 
    "MakrQ[v,payoff] checks if an imputation is an anti kernel point of game v.";

Maprk::usage = 
    "Maprk[v,payoff] computes an anti-prekernel point of Tu game v.";

MaprkQ::usage = 
    "MaprkQ[v,payoff] checks if an imputation is an anti prekernel point of Tu game v.";

Maddg::usage = 
    "Maddg[payoff] creates an additive game from a payoff vector/imputation.";

Mapex::usage = 
    "Mapex[k,n] creates an apex game. Where k is the main player and n is the number of players involved.";

Maslv::usage = 
    "Maslv[v,apu] determines the solidarity value w.r.t. a priori unions (apu).";

Massignmentg::usage = 
    "Massignmentg[sl_vec,prof_mat] creates an assignment game.";

MacvQ::usage = 
    "MacvQ[v,tol] checks the Tu game v on average convexity.";

Mbank::usage = 
    "Mbank[Est,dvec] determines a bankruptcy game using the Matlab toolbox MatTuGames. Here Est is the estate value and dvec is the claims vector of length n.";

Mbzhv::usage = 
    "Mbzhv[v] computes the Banzhaf value of Tu game v using the Matlab toolbox MatTuGames.";

Mbcoord::usage = 
    "Mbcoord[v] determines the basis coordinates of a Tu game v.";

Mbg::usage = 
    "Mbg[n] determines bases games.";

MbtacQ::usage = 
    "MbtacQ[v,payoff,'method',tol] checks if a payoff vector belongs to the anti-core of a Tu game v.";

MbtcQ::usage = 
    "MbtcQ[v,payoff] checks if a payoff vector belongs to the core of a Tu game v.";

Mbcl::usage = 
    "Mbcl[v,payoff,smc] computes the set of most effective coalitions. The value smc is either 1 (smallest) or 0 (largest).";

Mcardg::usage = 
    "Mcardg[n,k]  assigns zero to a coalition of size<=k<n, otherwise its cardinality.";

Mcddacrp::usage = 
    "Mcddacrp[v,string,imp_set] plots the anti-core of a game using cddmex. Admissible strings are 'all,none,prk,prn,shap'. However, permissible values for imp_set are 0 (false ) either 1 (true).";

McddacrQ::usage = 
    "McddacrQ[v,tol] checks if the anti-core exists of Tu game v using cddmex.";

Mcddacrv::usage = 
    "Mcddacrv[v,tol] computes the vertices of the anti-core of a Tu game v using cddmex.";

Mcddcrp::usage = 
    "Mcddcrp[v,string,imp_set] plots the core of a game v using cddmex. Admissible strings are 'all,none,prk,prn,shap'. However, permissible values for imp_set are 0 (false ) either 1 (true).";

McddcrQ::usage = 
    "McddcrQ[v,tol] checks if the core exists using cddmex.";

Mcddcrv::usage = 
    "Mcddcrv[v,tol] computes the vertices of the core of game v using cddmex.";

Mcddipv::usage = 
    "Mcddipv[v] computes the vertices of the imputation set of game v using cddmex.";

Mcddlcr::usage = 
    "Mcddlcr[v] computes the least core of game v using cddmex.";

Mcddnc::usage = 
    "Mcddnc[v,tol] computes the nucleolus of game v using the CDD solver (cddmex).";

Mcddprk::usage = 
    "Mcddprk[v,payoff] computes a pre-kernel element of game v using cddmex.";

Mcddprn::usage = 
    "Mcddprn[v,tol] computes the prenucleolus of game v using the CDD solver (cddmex).";

Mcddmnc::usage = 
    "Mcddmnc[v,tol] computes the modiclus of game v using the CDD solver (cddmex).";

Mclpkr::usage = 
    "Mclpkr[v,payoff] computes a kernel point of game v using the CLP solver.";

Mclskr::usage = 
    "Mclskr[v,payoff] computes a kernel point of game v using the CLS solver.";

Mclm::usage = 
    "Mclm[cl] computes the unique integer representation of coalitions.";

Mcslv::usage = 
    "Mcslv[v,apu] determines the coalition solidarity value of game v w.r.t. apu.";

Mcflb::usage = 
    "Mcflb[v] determines the coefficients (dividends) of a linear basis from a TU game v.";

MCRGPQ::usage = 
    "MCRGPQ[v,payoff,string,tol] checks if an imputation satisfies the CRGP. Permissible string values are 'PRK,PRN,SHAP'.";

McvQ::usage = 
    "McvQ[v,tol] checks the convexity of a Tu game v.";

Mcrp::usage = 
    "Mcrp[v,method,add_sol,imp_set,tol] plots the core of Tu game v. Permissible methods are: 'float,gmp'. Permissible add_sol are 'none,prk,prn,shap,none'. The input argument imp_set can be set to 0 (false) or 1 (true).";

McrQ::usage = 
    "McrQ[v,tol] checks the non-emptiness of the core of game v.";

Mcplexkr::usage = 
    "Mcplexkr[v,payoff] computes a kernel point of game v using the CPLEX solver.";

Mcplexnc::usage = 
    "Mcplexnc[v,tol] computes the nucleolus of game v using the CPLEX solver.";

Mcplexprk::usage = 
    "Mcplexprk[v,payoff] computes a pre-kernel element using the Matlab toolbox MatTuGames and CPLEX.";

Mcplexprn::usage = 
    "Mcplexprn[v,tol] computes the pre-nucleolus using the Matlab toolbox MatTuGames and CPLEX.";

Mcplexmnc::usage = 
    "Mcplexmnc[v,tol] computes the modiclus using the Matlab toolbox MatTuGames and CPLEX.";

Mcritval1::usage = 
    "Mcritval1[v] computes the biggest gain of any group of players.";

Mcritval2::usage = 
    "Mcritval2[v] computes a critical value w.r.t. the strong epsilon-core.";

Mcritvals::usage = 
    "Mcritvals[v] computes a critical value which contains the intersection of the imputation and reasonable set.";

Mcvxkr::usage = 
    "Mcvxkr[v,payoff] computes a kernel point of game v using the CVX solver.";

Mcvxprk::usage = 
    "Mcvxprk[v,payoff] computes a prekernel point of game v using the CVX solver.";

Mdmrg::usage = 
    "Mdmrg[v,payoff] computes all Davis-Maschler reduced games.";

Mdualg::usage = 
    "Mdualg[v] creates the dual of a Tu game v.";

Mexc::usage = 
    "Mexc[v,payoff] determines the excesses of a payoff vector.";

Mgb::usage = 
    "Mgb[n] computes a game basis for n, the number of players involved.";

Mgspc::usage = 
    "Mgspc[v,payoff,scl,smc] computes the game space which replicates a payoff as a pre-kernel element. Input argument scl is a scaling factor (natural number), whereas smc is either 0 (largest card of effective coalitions) or 1 (smallest card of effective coalitions).";

MgToMama::usage = 
    "MgToMama[v] converts a TU game v into Mathematica representation.";

MgToMatlab::usage = 
    "MgToMatlab[w] converts a Tu game w into Matlab representation.";

Mgap::usage = 
    "Mgap[v] determines the gap function.";

Mgus::usage = 
    "Mgus[cs] creates a union stable system from coalition structure cs.";

Mgetg::usage = 
    "Mgetg[uc,n] creates a Tu-game from the unanimity coordinates uc.";

Mglpkkr::usage = 
    "Mglpkkr[v,payoff] computes a kernel point of game v using the GLPK solver.";

Mglpknc::usage = 
    "Mglpknc[v,tol] computes the nucleolus of game v using the GLPK solver.";

Mglpkprk::usage = 
    "Mglpkprk[v,payoff] Computes a prekernel point of game v using the GLPK solver.";

Mglpkprn::usage = 
    "Mglpkprn[v,tol] computes the pre-nucleolus of game v using the GLPK solver.";

Mglpkmnc::usage = 
    "Mglpkmnc[v,tol] computes the modiclus of game v using the GLPK solver.";

Mgreedyb::usage = 
    "Mgreedyb[Est,dvec] creates the greedy bankruptcy game from the estate value Est and claims vector dvec.";

Mgurobikr::usage = 
    "Mgurobikr[v,payoff] computes a kernel point of game v using the GUROBI solver.";

Mgurobinc::usage = 
    "Mgurobinc[v,tol] computes the nucleolus of game v using the GUROBI solver.";

Mgurobiprk::usage = 
    "Mgurobiprk[v,payoff] computes a pre-kernel element using the Matlab toolbox MatTuGames and GUROBI.";

Mgurobiprn::usage = 
    "Mgurobiprn[v,tol] computes the pre-nucleolus using the Matlab toolbox MatTuGames and GUROBI.";

Mgurobimnc::usage = 
    "Mgurobimnc[v,tol] computes the modiclus using the Matlab toolbox MatTuGames and GUROBI.";

Mharsdivd::usage = 
    "Mharsdivd[v] determines the the unanimity coordinates.";

Mhmsrdg::usage = 
    "Mhmsrdg[v,payoff,S] creates a Hart/Mas-Colell reduced games.";

MhmsReducedg::usage = 
    "MhmsReducedg[v,payoff,string] creates all Hart/Mas-Colell reduced games. Permissible string data are 'PRN,PRK,SHAP'.";

MhrQ::usage = 
    "MhrQ[th,wghs] checks if the weighted majority game possesses a homogeneous representation. Input argument th is the threshold to pass a bill and wghs is the weights vector.";

Mhslprk::usage = 
    "Mhslprk[v,payoff] computes a prekernel point of game v using HSL solvers. ";

MhgQ::usage = 
    "MhgQ[cs,n] checks whether the coalition structure cs is a hypergraph.";
    
Mimpvr::usage = 
    "Mimpvr[v,method] computes the vertices of the imputation set. Input argument method is a string. Permissible methods are 'gmp,float'";

Mintsts::usage = 
    "Mintsts[S,hs,n] determines a system of interaction sets. Input S is a coalition, hs a hypergraph communication situation and n is the number of players involved.";

Mipoptkr::usage = 
    "Mipoptkr[v,payoff] computes a kernel point of game v using the IPOPT solver. ";

Mipoptprk::usage = 
    "Mipoptprk[v,payoff] computes a prekernel point of game v using the IPOPT solver.";

MkCRGPQ::usage = 
    "MkCRGPQ[v,payoff,k,str,tol] checks if an imputation satisfies the k-CRGP. The input argument must be an integer s.t. 1<=k<=n. Permissible values for str are 'PRK,PRN,SHAP'.";

MkcvQ::usage = 
    "MkcvQ[v] checks k-convexity of the Tu game v.";

Mkcover::usage = 
    "Mkcover[v,k] determines from the Tu game v the corresponding k-game. The input argument must be an integer s.t. 1<=k<=n.";

Mkr::usage = 
    "Mkr[v,payoff] computes a kernel point of game v using optimization toolbox.";

MkrQ::usage = 
    "MkrQ[v,payoff,tol] checks if an imputation is a kernel point of game v.";

MkRCPQ::usage = 
    "MkRCPQ[v,payoff,K,str,tol] checks the k-RCP. The input argument must be an integer s.t. 1<=k<=n. Admissible values for str are 'PRK,PRN,SHAP,HMS_PK,HMS_PN'.";

MkRGPQ::usage = 
    "MkRGPQ[v,payoff,K,str,tol] checks the k-RGP. The input argument must be an integer s.t. 1<=k<=n. Admissible values for str are 'PRK,PRN,SHAP,HMS_PK,HMS_PN'.";


MkSCRGPQ::usage = 
    "MkSCRGPQ[v,payoff,K,str,tol] checks the strong k-CRGP. The input argument must be an integer s.t. 1<=k<=n. Admissible values for str are 'PRK,PRN,SHAP'.";

Mlcr::usage = 
    "Mlcr[v,tol] computes the least core using optimization toolbox.";

Mlb::usage = 
    "Mlb[n] determines the linear basis of a TU game v.";


Mlprk::usage = 
    "Mlprk[v,payoff] computes a pre-kernel point of game v using optimization toolbox.";

Mlsnc::usage = 
    "Mlsnc[v] computes the least square nucleolus of a game. v";

Mlsprn::usage = 
    "Mlsprn[v] computes the least square pre-nucleolus of a game v.";

Mmyv::usage = 
    "Mmyv[v,cs,string] computes the Myerson value using the Matlab toolbox MatTuGames. Permissible string values are 'cs,us', that is, a communication situation or union stable system.";

Mmarketg::usage =
    "Mmarketg[P,Q,n,scl] determines from two disjoint sets a market game. An integer P to specify the set of producers. An integer Q to specify the set of buyers s.t. P and Q partition N. The input n is the cardinality of the player set N. The input scl is a scaling factor, default is 1.";

Mmwg::usage = 
    "Mmwg[th,wghs] computes the minimal winning coalitions. Input argument th is the threshold to pass a bill (positive number). The input wghs is the vector of weights.";

MmgQ::usage = 
    "MmgQ[v,tol] checks monotonicity of the TU game v.";

Mmcov::usage = 
    "Mmcov[v] determines the monotonic cover from a TU game v.";

Mmskkr::usage = 
    "Mmskkr[v,payoff] computes a kernel point of game v using the MOSEK solver.";

Mmsknc::usage = 
    "Mmsknc[v,tol] computes the nucleolus of game v using the MOSEK solver.";

Mmskprk::usage = 
    "Mmskprk[v,payoff] computes a pre-kernel element using the Matlab toolbox MatTuGames and MOSEK.";

Mmskprn::usage = 
    "Mmskprn[v,tol] computes the pre-nucleolus using the Matlab toolbox MatTuGames and MOSEK.";

Mmskmnc::usage = 
    "Mmskmnc[v,tol] computes the modiclus using the Matlab toolbox MatTuGames and MOSEK.";

Mnc::usage = 
    "Mnc[v,tol] computes the nucleolus of game v using optimization toolbox.";

MncQ::usage =
    "MncQ[v,payoff,tol] applies a Kolberg criterion on payoff using the Matlab toolbox MatTuGames. A return value of True indicates that we have found the nucleolus. ";

Mowv::usage = 
    "Mowv[v,apu] computes the Owen value using the Matlab toolbox MatTuGames.";

Moaseskr::usage = 
    "Moaseskr[v,payoff] computes a kernel point of game v using the OASES solver.";

Moasesprk::usage = 
    "Moasesprk[v,payoff] computes a prekernel point of game v using the OASES solver.";

Molsprk::usage = 
    "Molsprk[v,payoff] Computes a prekernel point using optimization toolbox.";

MpartSA::usage = 
    "MpartSA[S,hs,n] computes a partition of S w.r.t. a hypergraph communication situation cs. Input n is the cardinality of the player set N.";

MpartSL::usage = 
    "MpartSL[S,cs,n] computes a partition of S w.r.t. a communication situation cs. Input n is the cardinality of the player set N.";

Mpsv::usage = 
    "Mpsv[v,cs,string] computes the Position value using the Matlab toolbox MatTuGames. Admissible strings are 'us,hs', for union stable or hypergraph system.";

Mpwset::usage = 
    "Mpwset[A] computes all subsets from a set representation, like A=[2 3 4].";

Mprk::usage = 
    "Mprk[v,payoff] computes a pre-kernel element using the Matlab toolbox MatTuGames.";

MprkQ::usage = 
    "MprkQ[v,payoff] verifies if payoff is a pre-kernel element.";

Mprn::usage = 
    "Mprn[v,tol] computes the pre-nucleolus using the Matlab toolbox MatTuGames.";

Mprn2::usage = 
    "Mprn[v,payoff,tol] computes the pre-nucleolus using the Matlab toolbox MatTuGames.";

MprnQ::usage =
    "MprnQ[v,payoff,tol] applies a Kolberg criterion on payoff using the Matlab toolbox MatTuGames. A retrun value of True indicates that we have found the pre-nucleolus. ";

Mmnc::usage =
    "Mmnc[v,tol] computes the modiclus using the Matlab toolbox MatTuGames.";

MmncQ::usage =
    "MmncQ[v,payoff, tol] verifies if payoff is the modiclus.";

Mmodprk::usage = 
    "Mmodprk[v,payoff] computes a modified pre-kernel element using the Matlab toolbox MatTuGames.";

MmodprkQ::usage = 
    "MmodprkQ[v,payoff] verifies if payoff is a modified pre-kernel element.";

Mpmodprk::usage = 
    "Mpmodprk[v,payoff] computes a proper modified pre-kernel element using the Matlab toolbox MatTuGames.";

MpmodprkQ::usage = 
    "MpmodprkQ[v,payoff] verifies if payoff is a proper modified pre-kernel element.";

Mprodg::usage = 
    "Mprodg[n,k] determines a linear production game with 1<=k<=n.";

Mprodg2::usage = 
    "Mprodg2[n,k] determines a quadratic production game with 1<=k<=n.";

Mpfmat::usage = 
    "Mpfmat[valbuy,valsel] creates the profit matrix of an assignment game. Input valbuy is buyers valuation and valsel is the sellers valuation.";

Mpureoh::usage = 
    "Mpureoh[n] creates the matrix of pure overhead games.";

MqpBBkr::usage = 
    "MqpBBkr[v,payoff] computes a kernel point of game v using the QPBB solver.";

Mqpckr::usage = 
    "Mqpckr[v,payoff] computes a kernel point of game v using the QPC solver.";

Mqpcprk::usage = 
    "Mqpcprk[v,payoff] computes a prekernel point of game v using the QPC solver.";

Mquotas::usage = 
    "Mquotas[v] determines the quotas of a game v.";

Mroutc::usage = 
    "Mroutc[v] determines the reasonable outcome of game v.";

MRCPQ::usage = 
    "MRCPQ[v,payoff,str,tol] checks the RCP. Admissible values for str are 'PRK,PRN,SHAP,HMS_PK,HMS_PN'.";

Mredg::usage = 
    "Mredg[v,payoff,S] creates a Davis-Maschler reduced game vS on S at x for game v.";

MRGPQ::usage = 
    "MRGPQ[v,payoff,str,tol] checks the RGP. Admissible values for str are 'PRK,PRN,SHAP,HMS_PK,HMS_PN'.";

Mrepprk::usage = 
    "Mrepprk[v,payoff,scl,smc] replicates a pre-kernel solution as a pre-kernel of a game space. Input scl is a scaling factor. Whereas smc selecting from the set of effective coalitions the smallest/largest cardinality (optional). Value 1 or 0.";

Mrepshv::usage = 
    "Mrepshv[v,scl,tol] replicates the Shapley value for a game space. Input scl is a scaling factor.";

Msavg::usage = 
    "Msavg[cv] creates a saving game from a cost game cv.";

Mselpt::usage = 
    "Mselpt[v] selects a starting point for the pre-kernel computation.";

MscvQ::usage = 
    "MscvQ[v] checks semi-convexity.";

Msca::usage = 
    "Msca[cv,str] computes the separable cost allocation of the cost game cv. Input str has permissible strings given by 'ENSC,ACA,SCRB', that is, egalitarian non-separable cost method, alternate cost avoided method, and separable costs remaining benefits method.";

Mshv::usage = 
    "Mshv[v] computes the Shapley value using the Matlab toolbox MatTuGames.";

MshvLB::usage = 
    "MshvLB[v] computes the Shapley value from the linear basis.";

MshvM::usage = 
    "MshvM[v] computes the Shapley value while relying on all marginal contributions.";

Msg::usage = 
    "Msg[wcl,n] creates a simple game. Input argument wcl is the set of winning coalitions, and n the cardinality of the player set N.";

Mslshv::usage = 
    "Mslslv[v,apu] computes the Solidarity Shapley value using the Matlab toolbox MatTuGames.";

Mslv::usage = 
    "Mslv[v] computes the Solidarity value using the Matlab toolbox MatTuGames.";

Msortmg::usage = 
    "Msortmg[pws,n] sorts a sub/power set w.r.t. its cardinality.";

Msortsts::usage = 
    "Msortsts[pws,n] sorts a sub/power set w.r.t. its cardinality.";

Mstdsol::usage = 
    "Mstdsol[v] determines the standard solution of 2-person game v.";

MSCRGPQ::usage = 
    "MSCRGPQ[v,payoff,str,tol] checks the strong RGP. Admissible values for str are 'PRK,PRN,SHAP,HMS_PK,HMS_PN'.";

Mstrevls::usage = 
    "Mstrevls[v,t] determines the strong epsilon-game.";

Msubdual::usage = 
    "Msubdual[v,cl] determines the dual of a subgame.";

Msubg::usage = 
    "Msubg[v,S] creates a subgame.";

Msubsts::usage = 
    "Msubsts[S,n] creates all subsets of super set S. The input argument n is the cardinality of the player set N.";
 
Msmcs::usage = 
    "Msmcs[v,S,n,tol] returns 1 whenever for a coalition the sum of marginal contributions is positive. A super-set S, which is a positive number. The third input argument is the number of players involved in game v.";

MsaddQ::usage = 
    "MsaddQ[v] checks the Tu-game v on super additivity.";

Mtrl::usage = 
    "Mtrl[Est,dvec] computes the Talmudic rule for a generalized bankruptcy situation (Est,dvec).";

Mtauv::usage = 
    "Mtauv[v] computes the Tau value using the Matlab toolbox MatTuGames.";

Munag::usage = 
    "Munag[v] computes the unanimity coordinates for game v.";

MusQ::usage = 
    "MusQ[cs] checks whether the coalition structure cs is union stable.";

Mvclm::usage = 
    "Mvclm[clm,vlm]  computes a Tu-game and the corresponding unique integer representation of coalitions. Here clm is cell or matrix, which contains the coalition information in generic power set representation (e.g. Mathematica format). The input vlm is the valuation vector of coalitions in the order as presented by the cell input clm.";

Mvetopls::usage = 
    "Mvetopls[v] determines the veto players of a simple game v. ";

MwsaddQ::usage = 
    "MwsaddQ[v] checks the Tu game v on weakly super additivity.";

Mwmg::usage = 
    "Mwmg[th,wghs] determines a weighted majority game.";

Mwowv::usage = 
    "Mwowv[v,apu] computes the weighted Owen value w.r.t. apu.";

Mwshv::usage = 
    "Mwshv[v,wghs] computes the weighted Shapley value of game v. Here wghs is a vector of positive weights. No zeros are allowed.";

Mwslv::usage = 
    "Mwslv[v,wghs] computes the weighted solidarity value w.r.t. wghs. The input wghs is a vector of positive weights.";

Mwcl::usage = 
    "Mwcl[mW] determines the whole set of winning coalitions. The input argument mW is the pre-defined list/vector of winning coalitions, and n is the cardinality of the player set N.";

MzmQ::usage = 
    "MzmQ[v] checks zero monotonicity for game v";

Mzn::usage =
    "Mzn[v] creates a zero normalized game from game v.";

Mzon::usage =
    "Mzon[v] creates a zero-one normalized game from game v.";



Needs["MATLink`"];
OpenMATLAB[];

(* Defining the interfaces starts *)

Madv = MFunction["ADvalue"];
Mamc = MFunction["AllMarginalContributions"];
Masg = MFunction["AllSubGames"];
Macrp = MFunction["m_AntiCorePlot"];    
Macrv = MFunction["AntiCoreVertices"];
MacrQ = MFunction["anti_coreQ"];
Makr = MFunction["Anti_Kernel"];
MakrQ = MFunction["Anti_kernelQ"];
Maprk = MFunction["Anti_PreKernel"];
MaprkQ = MFunction["Anti_PrekernelQ"];
Maddg = MFunction["additive_game"];
Mkapex = MFunction["m_apex_game"];
Maslv = MFunction["apu_SolidarityValue"];
Massignmentg = MFunction["assignment_game"];
MacvQ = MFunction["average_convexQ"];
Mbank = MFunction["bankruptcy_game"];
Mbzhv = MFunction["banzhaf"];
Mbcoord = MFunction["basis_coordinates"];
Mbg = MFunction["basis_game"];
MbtacQ = MFunction["belongToAntiCoreQ"];
MbtcQ = MFunction["belongToCoreQ"];
Mbcl = MFunction["BestCoalitions"];
Mcardg = MFunction["cardinality_game"];
Mcddacrp = MFunction["m_CddAntiCorePlot"];
McddacrQ = MFunction["CddAntiCoreQ"];
Mcddacrv = MFunction["CddAntiCoreVertices"];
Mcddcrp = MFunction["m_CddCorePlot"];
McddcrQ = MFunction["CddCoreQ"];
Mcddcrv = MFunction["CddCoreVertices"];
Mcddipv = MFunction["CddImputationVertices"];
Mcddlcr = MFunction["CddLeastCore"];
Mcddnc = MFunction["CddNucl"];
Mcddprk = MFunction["CddPreKernel"];
Mcddprn = MFunction["CddPrenucl"];
Mcddmnc = MFunction["CddModiclus"];
Mclpkr = MFunction["clp_kernel"];
Mclskr = MFunction["cls_kernel"];
Mclm = MFunction["clToMatlab"];
Mcslv = MFunction["CoalitionSolidarity"];
Mcflb = MFunction["coeff_linearbasis"];
MCRGPQ = MFunction["Converse_RGP_Q"];
McvQ = MFunction["convex_gameQ"];
Mcrp = MFunction["m_CorePlot"];
McrQ = MFunction["coreQ"];
Mcrv = MFunction["CoreVertices"];
(* CPLEX is depreciated and may let Matlab crash
Mcplexkr = MFunction["cplex_kernel"];
Mcplexnc = MFunction["cplex_nucl"];
Mcplexprk = MFunction["cplex_prekernel"];
Mcplexprn = MFunction["cplex_prenucl"];
Mcplexmnc = MFunction["cplex_modiclus"];
*)
Mcritval1 = MFunction["critical_value1"];
Mcritval2 = MFunction["critical_value2"];
Mcritvals = MFunction["critical_value_star"];
Mcvxkr = MFunction["cvx_kernel"];
Mcvxprk = MFunction["cvx_prekernel"];
Mdmrg = MFunction["DM_Reduced_game"];
Mdualg = MFunction["dual_game"];
Mexc = MFunction["excess"];
Mgb = MFunction["game_basis"];
Mgspc = MFunction["game_space"];
MgToMama = MFunction["gameToMama"];
MgToMatlab = MFunction["gameToMatlab"];
Mgap = MFunction["Gap"];
Mgus = MFunction["genUnionStable"];
Mgetg = MFunction["getgame"];
Mglpkkr = MFunction["glpk_kernel"];
Mglpknc = MFunction["glpk_nucl"];
Mglpkprk = MFunction["glpk_prekernel"];
Mglpkprn = MFunction["glpk_prenucl"];
Mglpkmnc = MFunction["glpk_modiclus"];
Mgreedyb = MFunction["greedy_bankruptcy"];
Mgurobikr = MFunction["gurobi_kernel"];
Mgurobinc = MFunction["gurobi_nucl"];
Mgurobiprk = MFunction["gurobi_prekernel"];
Mgurobiprn = MFunction["gurobi_prenucl"];
Mgurobimnc = MFunction["gurobi_modiclus"];
Mharsdivd = MFunction["harsanyi_dividends"];
Mhmsrdg = MFunction["HMS_RedGame"];
MhmsReducedg = MFunction["HMS_Reduced_game"];
MhrQ = MFunction["homogeneous_representationQ"];
Mhslprk = MFunction["hsl_prekernel"];
MhgQ = MFunction["hypergraphQ"];
Mimpvr = MFunction["ImputationVertices"];
Mintsts = MFunction["InteractionSets"];
Mipoptkr = MFunction["ipopt_kernel"];
Mipoptprk = MFunction["ipopt_prekernel"];
MkCRGPQ = MFunction["k_Converse_RGP_Q"];
MkcvQ = MFunction["k_convexQ"];
Mkcover = MFunction["k_cover"];
Mkr = MFunction["Kernel"];
MkrQ = MFunction["kernelQ"];
MkRCPQ = MFunction["k_Reconfirmation_propertyQ"];
MkRGPQ = MFunction["k_Reduced_game_propertyQ"];
MkSCRGPQ = MFunction["k_StrConverse_RGP_Q"];
Mlcr = MFunction["LeastCore"];
Mlb = MFunction["linear_basis"];
Mlprk = MFunction["lin_prekernel"];
Mlsnc = MFunction["LS_Nucl"];
Mlsprn = MFunction["LS_PreNucl"];
Mmyv = MFunction["MyersonValue"];
Mmarketg = MFunction["market_game"];
Mmwg = MFunction["minimal_winning"];
MmgQ = MFunction["monotone_gameQ"];
Mmcov = MFunction["monotonic_cover"];
Mmskkr = MFunction["msk_kernel"];
Mmsknc = MFunction["msk_nucl"];
Mmskprk = MFunction["msk_prekernel"];
Mmskprn = MFunction["msk_prenucl"]; 
Mmskmnc = MFunction["msk_modiclus"]; 
Mnc = MFunction["nucl"];
MncQ = MFunction["B0_balancedCollectionQ"]; 
Mowv = MFunction["OwenValue"];
Moaseskr = MFunction["oases_kernel"];
Moasesprk = MFunction["oases_prekernel"];
Molsprk = MFunction["ols_prekernel"];
MpartSA = MFunction["PartitionSA"];
MpartSL = MFunction["PartitionSL"];
Mpsv = MFunction["PositionValue"];
Mpwset = MFunction["PowerSet"];
Mprk = MFunction["PreKernel"]; 
MprkQ = MFunction["PrekernelQ"];
Mprn = MFunction["PreNucl"];
Mprn2 = MFunction["PreNucl2"];
(* MprnQ = MFunction["balancedCollectionQ"]; *)
Mmnc = MFunction["Modiclus"];
MmncQ = MFunction["modiclusQ"];
Mmodprk = MFunction["ModPreKernel"]; 
MmodprkQ = MFunction["ModPrekernelQ"];
Mpmodprk = MFunction["PModPreKernel"]; 
MpmodprkQ = MFunction["PModPrekernelQ"];
Mprodg = MFunction["production_game"];
Mprodg2 = MFunction["production_game_sq"];
Mpfmat = MFunction["profit_matrix"];
Mpureoh = MFunction["pure_overhead"];
MqpBBkr = MFunction["qpBB_kernel"];
Mqpckr = MFunction["qpc_kernel"];
Mqpcprk = MFunction["qpc_prekernel"];
Mquotas = MFunction["quotas"];
Mroutc = MFunction["reasonable_outcome"];
MRCPQ = MFunction["Reconfirmation_propertyQ"];
Mredg = MFunction["RedGame"];
MRGPQ = MFunction["Reduced_game_propertyQ"];
Mrepprk = MFunction["replicate_prk"];
Mrepshv = MFunction["replicate_Shapley"];
Msavg = MFunction["savings_game"];
Mselpt = MFunction["select_starting_pt"];
MscvQ = MFunction["semi_convexQ"];
Msca = MFunction["separable_cost_allocation"];
Mshv = MFunction["ShapleyValue"];
MshvLB = MFunction["ShapleyValueLB"];
MshvM = MFunction["ShapleyValueM"];
Msg = MFunction["m_simple_game"];
Mslshv = MFunction["SolidarityShapleyValue"];
Mslv = MFunction["SolidarityValue"];
Msortmg = MFunction["SortMg"];
Msortsts = MFunction["sortsets"];
Mstdsol = MFunction["StandardSolution"];
MSCRGPQ = MFunction["StrConverse_RGP_Q"];
Mstrevls = MFunction["streps_value"];
Msubdual = MFunction["SubDual"];
Msubg = MFunction["SubGame"];
Msubsts = MFunction["SubSets"];
Msmcs = MFunction["Sum_Marg_Contributions"];
MsaddQ = MFunction["super_additiveQ"];
Mtrl = MFunction["Talmudic_Rule"];
Mtauv = MFunction["TauValue"];
Munag = MFunction["unanimity_games"];
MusQ = MFunction["union_stableQ"];
Mvclm = MFunction["vclToMatlab"];
Mvetopls = MFunction["veto_players"];
MwsaddQ = MFunction["weakly_super_additiveQ"];
Mwmg = MFunction["m_weighted_majority"];
Mwowv = MFunction["weightedOwen"];
Mwshv = MFunction["weightedShapley"];
Mwslv = MFunction["weightedSolidarity"];
Mwcl = MFunction["winning_coalitions"];
MzmQ = MFunction["zero_monotonicQ"];
Mzn = MFunction["zero_normalization"];
Mzon = MFunction["ZeroOne_Normalization"];

(*
M = MFunction[""];
M = MFunction[""];
M = MFunction[""];
M = MFunction[""];
M = MFunction[""];
*)

(* Defining the interfaces ends *)
GameToMatlab[game_]:=Module[{pws,vcl},
    pws=Subsets[T];
    vcl=v[#] &/@ pws;
    vcl=Delete[vcl,1];
    MgToMatlab[vcl]
		     ]


(*
EndPackage[]
*)
