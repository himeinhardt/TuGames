(* ::Package:: *)

(* :Title: TuGames.m *)
Off[Syntax::stresc];
Off[General::obspkg];
(* :Context: TuGames` *)

(* :Summary:	
    This package is an extension to the package written by Michael Carter for 
    modeling and calculating solutions and properties for cooperative games with 
    transferable utilities. 
*)			

(* :Author:		
    Holger Ingmar Meinhardt
    Department of Economics
    University of Karlsruhe (KIT)
    holger.meinhardt@wiwi.uni-karlsruhe.de
*)

(* :Package Version: 3.0.2 *)

(* 
   :Mathematica Version: 12.x

   The function ConstrainedMax/ConstrainedMin or Linear/DualLinearProgramming have been deprecated
   in Version 3 and are replaced by LinearOptimization. Thus, this version is not anymore compatible
   with Mathematica versions smaller than 12. This replacement allows to supply the Method options
   of LinearOptimization. In this context, we strongly recommend to apply for a MOSEK license, which   
   is in according to our experience up to 50 times faster than the other methods. To change the method 
   one needs just to set Method -> MOSEK. For changing the solver, one has to set CallMinimize -> True
   or CallMaximize -> True, for instance. One shall check first with Options[command] if the solver
   is available. 

*)

(* :Package: Tested under RHEL 8.2, Lustre 2.12.6_ddn40 *)

(*:Keywords:
   Dual Game, Superadditive Game, Convex Game, Strong Convex Game, Average-Convex Game,
   Kernel, balancing Maximum Excesses.
*)

(* :Sources:
   G. Bergantinos & J. Masso, Notes on a new compromise value: The Chi-Value,
   Optimization 1996, Vol. 38, pp. 277-286.
   
   Chih Chang and Theo Driessen, (Pre)Kernel Catchers for Cooperative Games,
   OR Spectrum, Vol. 17, 1995

   Chih Chang and Ching Yu Kan, The Bound of the Kernel, Mathematical Social
   Sciences, Vol. 25, 87-93, 1992.

   Chih Chang and Chrong-Hisan Lian, Some Results on (Pre)Kernel Catchers and
   the Coincidence of the Kernel and Prekernel, International Game Theory Review,
   Vol. 4, No. 3, 201-211, 2002. 

   Theo Driessen, Cooperative Games, Solutions and Applications, Kluwer Academic
   Publishers, Dordrecht, 1988.

   Theo Driessen. The Greedy Bankruptcy Game: An Alternative Game Theoretic Analysis of a Bankruptcy Problem. In
   L.A. Petrosjan and V.V. Mazalov, editors, Game Theory and Applications, volume IV, pages 45\[Dash]61, Commack,
   New York, 1998. Nova Science Publishers Inc.


   E. Inarra and J. Usategui, The Shapley value and average convex games, 
   IJGT, 22, 13-29, 1993.

   U. Faigle, W. Kern and J. Kuipers, An efficient algorithm for nucleolus and
   prekernel computation in some classes of Tu Games. Memorandum No. 1464,
   Faculty of Mathematical Sciences, University of Twente, 1998.

   Y. Funaki, Upper and Lower Bounds of the Kernel and Nucleolus, 
   IJGT, 121-129, 1986.

   Y. Funaki and H. I. Meinhardt, A Note on the Pre-Kernel and Pre-Nucleolus 
   for Bankruptcy Game, The Waseda Journal of Political Science and Economics,
   Waseda, Japan, 2006.

   J. Getán, J. M. Izquierdo, J. Montes, C. Rafels. The bargaining set and the kernel for almost-convex
   games, (2012). mimeo.


   I. Katsev and E. Yanovskaya, Between the Prekernel and the Prenucleolus, mimeo, 2009. 

   K. Kido. A nonlinear Approximation of the Nucleolus. In W. Takahashi and T. Tanaka,
   editors, Proceedings of the International Conference on Nonlinear Analysis and
   Convex Analysis, pages 307\[Dash]317, Tokyo, 2004. Yokohama Publishers, Yokohama, Japan
   
   K. Kido. Convergence Theorems for lp-Norm Minimizers with respect to p. Journal of
   Optimization Theory and Applications, 125:577\[Dash]589, 2005.
   
   K. Kido. A Modified Kohlberg Criterion and a Nonlinear Method to compute the Nucleolus
   of a Cooperative Game. Taiwanese Journal of Mathematics, 12:1581\[Dash]1590, 2008.

   M. Leng and M. Parlar. Analytic solution for the nucleolus of a three-player cooperative
   game. Naval Research Logistics (NRL), 57(7):667\[Dash]672, 2010. doi: 10.1002/nav.20429.
   URL https://onlinelibrary.wiley.com/doi/abs/10.1002/nav.20429.

   M. Leng, Ch. Luo, L. Liang. Multi-Player Allocations in the Presence of Diminishing Marginal Contributions:
   Cooperative Game Analysis and Applications in Management Science, 2020, to appear in Management Science

   SC. Littlechild and KG. Vaidya, The propensity to disrupt and the disruption nucleolus
   of a characteristic function game. International Journal of Game Theory 5(2):151-161,
   1976.

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
   An Exercise in Algorithmic Game Theory, Theory and Decision Library C,
   Springer Publisher, Heidelberg. pp. 1-247, 2013.  

   H. I. Meinhardt, A Characterization of Average-Convexity based on Unanimity Coordinates,  
    mimeo, 2009.  

   H. I. Meinhardt. The Modiclus Reconsidered. Technical report, Karlsruhe Institute of Technology
   (KIT), Karlsruhe, Germany, 2018b. URL http://dx.doi.org/10.13140/RG.2.2.32651.75043.

   H. I. Meinhardt. Reconsidering Related Solutions of the Modiclus. Technical report,
   Karlsruhe Institute of Technology (KIT), Karlsruhe, Germany, 2018c.
   URL http://dx.doi.org/10.13140/RG.2.2.27739.82729
   
   A. Meseguer-Artola, Using the Indirect Function to characterize the Kernel of a TU-Game,
   Departament d'Economia i d'Historia Economica, 1997. 
   
   G. Owen, A Note on the Nucleolus, International Journal of Game Theory, 
   Vol. 3., pp. 101-103, 1974. 
   
   G. Owen, Game Theory, Third Edition, Academic Press, 1995.

   C. Rafels and N. Ybern, Even and Odd Marginal Worth Vectors, Owen's 
   Multilinear Extension and Convex Games, IJGT, 113-126, 1995. 

   L. M. Ruiz, F. Valenciano, and J. M. Zarzuelo. The Least Square Pre-Nucleolus and the
   Least Square Nucleolus. Two Values for TU Games based on the Excess Vector.
   International Journal of Game Theory, 25:113\[Dash]134, 1996.
   
   R. T. Rockafellar, Convex Analysis, Princeton University Press, 1970.

   J. M. Solano and C. Rafels, Convexity versus average convexity: potential, 
   pmas, the shapley value and simple games, Documents de Treball, No. 3, 
   Universitat de Barcelona, 1996.

   R.E. Stearns, Convergent Transfer Schemes for N-Person Games,
   Transaction American Mathematical Society, 449-459, 1968.

   Sudhoelter (1997), The modified nucleolus: Properties and axiomatizations.
   International Journal of Game Theory, 26 (2):147\[Dash]182, Jun 1997. ISSN 1432-1270.
   doi: 10.1007/BF01295846. URL https://doi.org/10.1007/BF01295846.
   
   Hal Varian (Ed.). Economics and Financial Modeling with Mathematica, 
   Springer, 1992. 
*)


(* 
    See ChangeLog file for a complete list of revisions.
   
    Version 2.2:
       Transcription of the old option rules to the new ones invented by Mathematica 8.x.
       This package is now exclusively dedicated to Mathematica version 8.x and higher.

       FilledCore[] is deprecated now. Using the old graphic concept Version 1.8 is required. 

    Version 2.3:
       Modification:      
       Change protected command SubsetQ[] to SubSetQ[] from the VertexEnum package. Order is
       reversed to SubsetQ[] which is new in Mathematica version 10.x.
     
       Some minor code revision. 
   
       New Functions:
        MLExtension[]           - Computes the multi-linear extension of the game.
        ShapleyValueML[]        - Computes the Shapley value from the multi-linear extension of the game.
        PreKernel[]             - Computes a pre-kernel point by Algorithm 8.2.1 of Meinhardt (2013).

       Bug fixes:
        FindKernelSolution[] convergence process to the kernel should be now more robust. 

    Version 2.4

       Some minor code revision.
   
    Version 2.5

       Adding the function ApproxNuc[] to compute the (p,k)-nucleolus which is an approximation of
       the nucleolus by a non-linear optimization approach, i.e., minimizes a p-norm. The function
       NonLinNuc[] is based on this function to compute the nucleolus. We extended this idea to the
       pre-nucleolus through the commands ApproxPreNuc[] and NonLinPreNuc[]. In addition, we added
       the least square computation of the (pre-)nucleolus by the functions LSNuc[] and LSPreNuc[].

       Functions to compute the barycenter of the extreme points of the core, dual cover game,
       dual extension, primal extension, modiclus, a proper modified pre-kernel element,
       potential of a game, the Lorenz solution, and Dutta-Ray solution for convex games
       have been added.

       Bug fixes:
        An insufficient coloring of the function FilledCoreV6[] caused by an incomplete delaunay
        triangulation of the Mathematica built-in function DelaunayTriangulation[] has been fixed.

    Version 2.5.1 
        Installation procedure has changed. The package is now distributed by Paclet. The documentation
        was revised and extended. About 230 pages were added to the documentation. The error 
        handling of functions was improved.
        
        Some minor code revision and bug fixes.

    Version 2.5.2

        We have revised the Install procedure of the Cddmathlink library, which makes it not anymore necessary
        to explicitly formulate some conditions for all operating systems. Moreover, some binaries for RHEL 7.5
        ships now with the package.

        Some minor code revision and bug fixes.	

    Version 2.5.3

        Adding some binaries for Mathematica 10.0 or later on OS X 10.9 or later. We are very grateful
        to Szabolcs Horv\[AAcute]t for providing these to the community.

        Change of the License to the MIT License terms.

    Version 2.5.4 

        Functions to compute and to verify the simplified modified pre-kernel/nucleolus are added. They are called
        SMPrenucleolus[],IsSMPrenucleolusQ[],SMPreKernel[],IsSMPreKernelQ[]. For the last two commands we implemented
        parallel counterparts called ParaSMPreKernel[],and ParaIsSMPreKernelQ[] respectively.

        Adding the function BalancedCollectionQ[] that should replace in the future the function BalancedSelectionQ[].
        For n=>4 the function returns incorrect results, probably caused by a bug of the DualLinearProgramming[] function.

        Example of incorrect results:

        Consider the collection of sets given by 

        cS4={{1}, {2}, {3}, {1, 2}, {1, 3}, {2, 4}, {3, 4}, {2, 3, 4}};

        then the return value is false 

         In[29]:= First[BalancedSystemQ[cS4, Range[4]]]

         Out[29]= False
  
        However, the system is balanced, since the balancing weights are given by 

        whgs = {3,1,1,1,1,2,2,1}/5
       
        Related to this context we provide the function BalancedInequalityQ[] to check whether a balanced system
        satisfies a balanced inequality of a TU-game. Notice that if all balanced systems satisfying this property
        non-emptiness of the core is guaranteed. Recall that for n=4 we need to check 9 equivalence classes, however,
        for n=6 we have to check 158 classes.

    Version 2.6.0

       Adding functions to compute the EPSD-Value, Chi-Value, PD-Value and the nucleolus by the Leng and Parlar (2010) formulae for three person
       zero-normalized and super-additive games. Changing the package extension from *.m to *.wl.

       Performing some code maintenance and minor bug fixes.

    Version 2.6.1

       Code revision and optimization. The (anti-)pre-kernel computation is now faster up to a factor 3 in serial as well as in parallel.

    Version 2.6.2

       Adding functions:
            -  AlmostConvexQ[] to check if the game is almost convex. 
            -  AlmostConcaveQ[] to check if the game is almost concave.
            -  ADMCGameQ[] to check the property if the game satisfies almost diminishing marginal contributions.
            -  AIMCGameQ[] to check the property if the game satisfies almost increasing marginal contributions.
            -  kConvexity[] to check if the game is k-convex. 
            -  EANSCValue[] to compute the Equal Allocation of Non-Separable Contribution/Cost value.

       Revised the functions:
              ConvexQ[], ConcaveQ[], Nuc1convex[].

       Minor Bug fixes and code revision.

    Version 3.0.0

       Not anymore backward compatible to Mathematica versions smaller than 12 due to the port
       to the new collection of algorithms for solving convex problems introduced in version 12.

       ConstrainedMax/ConstrainedMin and LinearProgramming/DualLinearProgramming are replaced by LinearOptimization.

       This replacement has been conducted for the following functions:

       Nucleolus                  -- Part of CooperativeGames. Function originally written by M. Carter.
       LeastCoreAux               -- Part of CooperativeGames. Function originally written by M. Carter.
       ModifiedNucleolus          -- Part of TuGames.
       ModifiedKernel             -- Part of TuGames.
       PreNucleolus               -- Part of TuGames.
       LexiCenter                 -- Part of TuGames.
       Modiclus                   -- Part of TuGames.
       IsModiclusQ                -- Part of TuGames.
       Kernel                     -- Part of TuGames.
       KernelCalculation          -- Part of TuGames.
       BalancedInequalityQ        -- Part of TuGames.
       BalancedCollectionQ        -- Part of TuGames.
       EpsCore                    -- Part of TuGames.
       FirstCriticalVal           -- Part of TuGames.
       DeltaLP                    -- Part of TuGames.
       FeasibleConstraints        -- Part of TuGames.
       KernelVertices             -- Part of TuGames.
       SolvePrimal                -- Part of TuGamesAux.
       SolveDual                  -- Part of TuGamesAux.
       BalancedSystemQ            -- Part of TuGamesAux.
       ParaModiclus               -- Part of ParaTuGames.
       ParaIsModiclus             -- Part of ParaTuGames.
       
      New added functions are:
      WeaklyBalancedCollectionQ   -- Part of TuGames.
      WeaklyBalancedSystemQ       -- Part of TuGamesAux.       


     The function WeaklyBalancedCollectionQ replaces WeaklyBalancedSelectionQ, the latter will be deprecated in a future version.

     Version 3.0.1

     Improved exception handling for functions using LinearOptimization. Performance improving of revised functions in Version 3.

     Some minor bug fixes.

     Version 3.0.2

     Adjusting the functions
     
       ApproxPreNuc                -- Part of TuGames,
       ApproxNuc                   -- Part of TuGames,
       DuttaRay                    -- Part of TuGames,  
       LorenzSolution              -- Part of TuGames,
       NonLinPreNuc                -- Part of TuGames,
       NonLinNuc                   -- Part of TuGames,
       PreKernelSolution           -- Part of TuGames

    to the new set of optimization algorithms.

    Adding options to the functions PreKernelQ, MaxExcessBalanced, AntiPreKernelQ, MinExcessBalanced, ParaPreKernelQ, ParaMaxExcessBalanced, ParaAntiPreKernelQ, ParaMinExcessBalanced.
    
    Improving the performance of PreKernelSolution.

    Some minor bug fixes and code revision. 
*)
 

(* 
    :Limitations: 
    see TUG/Guides/ManualTuGames from the Documentation Center. 
*)


(* 
   :General Remarks:
 
     Since version 2.5.3, this project is licensed under the MIT License terms.
    
*)



(*:Requirements: 
 
   The Package Cooperat.m by Michael Carter and VertexEnum.m 
   by Komei Fukuda and Ichiro Mizukoshi. The program 'cddmathlink' by Komei
   Fukuda is highly recommended for calculating all extreme
   points of the core. Nevertheless, it is not necessary to have installed
   the C-library on your computer to run properly the package 'TuGames.m'. 
   Some pre-compiled binaries of the C-library can be found under
   https://inf.ethz.ch/personal/fukudak/cdd_home/
   As a substitute use the function VerticesCore[] that is based on
   VertexEnum.m. 
*)

(* :Acknowledgment:

   We are very thankful to Szabolcs Horv\[AAcute]t for his helpful support, suggestion of improvements,
   and of his piece of advice to follow best practice of publicizing a Mathematica package
   that allows a custom installation for everyone. Moreover, we owe him executables for
   MacOSX, which ship with this version.


   The author acknowledge support by the state of Baden-W\[UDoubleDot]rttemberg through bwHPC.
*)   


BeginPackage["TUG`TuGames`", {"TUG`coop`CooperativeGames`","TUG`TuGamesAux`","TUG`vertex`VertexEnum`","ComputationalGeometry`"}];
If[SameQ[Global`$ParaMode,"False"],
Print["==================================================="];
Print["Loading Package 'TuGames' for ", $OperatingSystem];
Print["==================================================="];
Print["TuGames V3.0.2 by Holger I. Meinhardt"];
Print["Release Date: 07.12.2021"];
Print["Program runs under Mathematica Version 12.0 or later"];
Print["Version 12.x or higher is recommended"];
Print["==================================================="];,
   True];

(* 
The following describes some useful functions in the package to
check properties of a game.
*)

DefineGame::usage = 
"GameName := (DefineGame[T,values];); defines the game to be
 analyzed. T is the player set and values are the worth for the coalitions.
 Do not forget the semicolons, otherwise some compatibly problems with
 M. Carter's ShapleyValue[] occurs";


DualGame::usage= 
"DualGame[game] assigns to each coalition the value what it can extract from 
 the grand coalition by leaving the grand coalition.";

CostSaving::usage=
"CostSaving[costvec_List,T] computes the cost savings for each coalition
 from the vector of costs 'costvec'.  T is the player set. The resultant cost
 saving vector can be used to define a new game.";

SuperAdditiveQ::usage = 
"SuperAdditiveQ[game, options] checks if a game is superadditive.";

WeaklySuperAdditiveQ::usage = 
"WeaklySuperAdditiveQ[game] checks if a game is weakly superadditive.
 Suppose the coalitions S_1,S_2,...S_k partition the grand coalition T, 
 then the game v is weakly superadditive, if sum_i v(S_i) <= v(T). 
 This superadditivity property is a necessary condition for the core  
 of the game v to be nonempty.";

SelectSuperSets::usage = 
"SelectSuperSets[i] selects all super sets of i";
 
IncreasingMargContributions::usage = 
"IncreasingMargContributions[game,i] checks if the marginal contributions of player i is increasing.";

ConvCheck::usage = 
"ConvCheck[game] checks the convexity of the game. It provides information whether 
 the marginal contributions are increasing for each player.";

ConvexQ::usage = 
"ConvexQ[game] checks if the Tu-game is convex (super-modular). It returns the value 'True' or 'False'.";

AlmostConvexQ::usage = 
"AlmostConvexQ[game] checks if the Tu-game is almost convex (super-modular). It returns the value 'True' or 'False'.";


AlmostConcaveQ::usage = 
"AlmostConcaveQ[game] checks if the Tu-game is almost concave (super-modular). It returns the value 'True' or 'False'.";

ConcaveQ::usage = 
"ConcaveQ[game] checks if the Tu-game is concave (sub-modular). It returns the value 'True' or 'False'.";

StrIncreasMargContrib::usage = 
"StrIncreasMargContrib[game,i] checks if the marginal contributions of player i is 
 strictly increasing."; 
  
ConvStrQ::usage = 
"ConvStrQ[game] checks if the Tu-game is strictly convex. It provides information 
 whether the marginal contributions are increasing for each player.";

ConvexStrQ::usage = 
"ConvexStrQ[game] checks if the Tu-game is strictly convex. It returns only 'True' or 'False'.";

AverageConvexQ::usage = 
"AverageConvexQ[game,opts] checks the average-convexity of the game.
 It returns 'True' or 'False'. Calling the function with the option will return
 the sum of the marginal contributions for each coalition S w.r.t. to each 
 superset S union {j}. These values must be non-negative.";


AvConvexQ::usage =   
"AvConvexQ[game, opts] checks the average-convexity of the game.   
 It returns 'True' or 'False'. Now same as AverageConvexQ[]. 
 For more details see also the description of AverageConvexQ[].";  

ADMCGameQ::usage = 
"ADMCGameQ[game] checks if the TU-game satisfies the property of almost diminishing marginal contributions. It returns 'True' or 'False'.";

AIMCGameQ::usage = 
"AIMCGameQ[game] checks if the TU-game satisfies the property of almost increasing marginal contributions. It returns 'True' or 'False'.";

GameMonotoneQ::usage = 
"GameMonotoneQ[game] verifies if the game is monotone.";

MonotoneQ::usage = 
"MonotoneQ[game] verifies if the game is monotone. This is done for all sub-games.";

ZeroMonotoneQ::usage = 
"ZeroMonotoneQ[game] verifies if the game is zero-monotone.";

ZeroNormalization::usage = 
"ZeroNormalization[game] determines the zero-normalized game.";

ZeroOneNormalization::usage = 
"ZeroOneNormalization[game] determines the (0,1)-normalized game.";

OneNormalization::usage = 
"OneNormalization[game] determines the one-normalized game.";

SmallestContributionVector::usage = 
"SmallestContribution[game] calculates the vector of the smallest contributions.";

SmallestContribution::usage = 
"SmallestContribution[game,i] calculates the smallest contribution of player i.";

Scrb::usage = 
"Scrb[game,i] calculates the separable cost-remaining benefits for player i. See Funaki (1986).";

ScrbSolution::usage = 
"ScrbSolution[game] calculates the separable cost-remaining benefits. See Funaki (1986).";

TIJsets::usage = 
"TIJsets[i,j] computes the coalitions which contains player i but not j.";


ExcessPayoff::usage = 
"ExcessPayoff[game,payoff] calculates the excess vector for the (pre-)imputation 'payoff'.";

MaxExcessBalanced::usage = 
"MaxExcessBalanced[game,payoff] determines whether the maximum surpluses induced by 
 the imputation 'payoff' are maximal balanced among the players. Be careful, the 
 function does not check the efficiency property.  For checking in addition the efficiency
 property consult the function PreKernelQ[]."; 

MinExcessBalanced::usage = 
"MinExcessBalanced[game,payoff] determines whether the minimum surpluses induced by the 
 imputation 'payoff' are minimal balanced among the players. Be careful, the function does 
 not check the efficiency property.  For checking in addition the efficiency 
 property consult the function AntiPreKernelQ[]."; 

MaxExcessSets::usage = 
"MaxExcessSets[game,payoff] computes the set of proper coalitions having largest excesses.";

IntersectionOfMaxExcessSets::usage = 
"IntersectionOfMaxExcessSets[game, payoff] determines if the set of proper coalitions having
 largest excesses has an empty intersection.";

KernelCalculation::usage = 
"KernelCalculation[game,options] computes kernel or pre-kernel point(s) of a game. 
 Optional parameters are: ChangeInternalEps, DisplayAllResults, EpsilonValue and 
 SetGameToNonZeroMonotonic. The first optional parameter AVChangeInternalEps can 
 be used to speed up computation or to search for different allocations in the initial LPs.
 If the option DisplayAllResults is set to 'True', then the return value is related
 to a kernel solution, objective function, constraint set of the final LP, 
 all bi-symmetrical transfers, and the allocations computed by the initial LPs.
 In this case invoke the function by {solker,obj,const,tra,pay}=KernelCalculation[game].
 The default value is set to 'False', that is, the return value is just related to a kernel 
 solution and the allocation obtained by the initial LPs. The option EpsilonValue is a critical 
 value for changing the strong epsilon-core. This value can be calculated, for instance,
 by the function FirstCriticalVal[game]. A solution can be checked with the functions 
 KernelImputationQ[], KernelImputationListQ[], PreKernelQ[], or MaxExcessBalanced[]. To 
 search for a kernel solution of an non zero-monotonic game set the last variable to 
 'True', but in this case the function need not to terminate properly. For its default value 
 'False' the function Kernel[game] will be invoked to avoid infinite loops. To increases the 
 computational reliability in cases of numerical issues the following methods can be used: 
 RevisedSimplex, CLP, GUROBI, MOSEK, or Automatic. Default setting is Automatic. This option
 can be used in either case by CallMaximize->False or CallMaximize->True. For getting more 
 precise results one can even set Method->{InteriorPoint, Tolerance->10^-10}.";

Kernel::usage = 
"Kernel[game,options] computes a kernel point of the game from one LP. Options are:
 DisplayAllResults and EpsilonValue. If the option DisplayAllResults is set to 'True', 
 then the return value is related to a kernel solution, objective function, constraint 
 set of the final LP, the complete variable set, and all bi-symmetrical transfers. In 
 this case invoke the function by {solker,obj,const,var,tra}=Kernel[game]. The option 
 EpsilonValue is a critical value to change the strong epsilon-core. This value can be 
 calculated, for instance, by the function FirstCriticalVal[game]. To increases the computational 
 reliability in cases of numerical issues the following methods can be used: RevisedSimplex, CLP,
 GUROBI, MOSEK, or Automatic. Default setting is Automatic. This option must be used in 
 connection with CallMaximize->False or CallMaximize->True. For getting more precise results 
 one can even set Method->{InteriorPoint, Tolerance->10^-10}.";

KernelVertices::usage =
"KernelVertices[game,options] computes the vertices of the Kernel solution from an LP. To 
 increases the computational reliability in cases of numerical issues the following methods 
 can be used: RevisedSimplex, CLP, GUROBI, MOSEK, or Automatic. Default setting is Automatic. 
 This option must be used in connection with CallMaximize->False. For getting more precise 
 results one can even set Method->{InteriorPoint, Tolerance->10^-10}.";

ModifiedKernel::usage = 
"ModifiedKernel[game,options] computes a kernel point from the least core.
 That means, a vertex of the kernel solution inside of the least core will be computed.
 Thus, in many cases the Nucleolus should be computed. The algorithm is based 
 on a method by Peleg to translate the definition of the Nucleolus into 
 a sequence of linear programs. To increases the computational reliability in 
 cases of numerical issues the following methods can be used: RevisedSimplex, CLP, 
 MOSEK, or Automatic. Default setting is Automatic. For getting more precise results 
 one can even set Method->{InteriorPoint, Tolerance->10^-10}.";


ModifiedNucleolus::usage = 
"ModifiedNucleolus[game,options] computes the nucleolus from the least core.
 The algorithm is based on a method by Peleg to translate the definition of the 
 Nucleolus into a sequence of linear programs. The recursion stops, if the set
 of new equal constraints is empty. To increases the computational reliability in 
 cases of numerical issues the following methods can be used: RevisedSimplex, CLP, 
  MOSEK, or Automatic. Default setting is Automatic. For getting more precise results 
 one can even set Method->{InteriorPoint, Tolerance->10^-10}.";


LexiCenter::usage = 
"LexiCenter[game,options] computes the lexicographic center of a TU-game, i.e. 
 the nucleolus. Same as ModifiedNucleolus[].";

LSPreNuc::usage = 
"LSPreNuc[game] computes the least square pre-nucleolus.";

LSNuc::usage = 
"LSNuc[game] computes the least square nucleolus.";

FTPreNuc::usage = 
"FTPreNuc[game] computes the pre-nucleolus by a Fenchel Transform Method.";

NonLinPreNuc::usage = 
"NonLinPreNuc[game,p,k,tol,options] computes by a non-linear optimization method the pre-nucleolus, 
 otherwise it returns a $Failed. Different solvers can be selected by option setting Method->Solver. 
 Permissible solvers are: Automatic, GUROBI, IPOPT, MOSEK, DifferentialEvolution, NelderMead, 
 RandomSearch, or SimulatedAnnealing. Default setting is Automatic";

ApproxPreNuc::usage =
"ApproxPreNuc[game,p,k,options] computes the (p,k)-nucleolus by a non-linear minimization method. 
 It is an approximation of the pre-nucleolus. If (p,k)=(2,k), then it computes the least square pre-nucleolus. 
 Different solvers can be selected by option setting Method->Solver. Permissible solvers are: Automatic, GUROBI, 
 IPOPT, MOSEK, DifferentialEvolution, NelderMead, RandomSearch, or SimulatedAnnealing. Default setting is Automatic";

NonLinNuc::usage = 
"NonLinNuc[game,p,k,tol,options] computes by a non-linear optimization method the nucleolus, 
 otherwise it returns a $Failed. Different solvers can be selected by option setting Method->Solver. 
 Permissible solvers are: Automatic, GUROBI, IPOPT, MOSEK, DifferentialEvolution, NelderMead, 
 RandomSearch, or SimulatedAnnealing. Default setting is Automatic";

ApproxNuc::usage =
"ApproxNuc[game,p,k,options] computes the (p,k)-nucleolus by a non-linear minimization method. 
 It is an approximation of the nucleolus. If (p,k)=(2,k), then it computes the least square nucleolus. 
 Different solvers can be selected by option setting Method->Solver. Permissible solvers are: Automatic, 
 GUROBI, IPOPT, MOSEK, DifferentialEvolution, NelderMead, RandomSearch, or SimulatedAnnealing. 
 Default setting is Automatic";

ModCoalArray::usage =
"ModCoalArray[game,payoff] computes a modified coalition array of first, second, ..., kth maximal excess.";

StandardSolution::usage = 
"StandardSolution[game] computes the standard solution of a two-person TU-game.";

NucleolusThreePerson::usage = 
"NucleolusThreePerson[game] computes the nucleolus of zero-normalized super-additive three person games. Uses the formula of Leng and Parlar (2010).";

PreNucleolus::usage = 
"PreNucleolus[game,options] computes the pre-nucleolus from the set of pre-imputations.
 The algorithm is based on a method by Peleg to translate the definition of the Nucleolus into 
 a sequence of linear programs on the pre-imputation set. To increases the computational reliability 
 in cases of numerical issues the following methods can be used: RevisedSimplex, CLP, MOSEK, 
 or Automatic. Default setting is Automatic. This option must be used in connection with CallMaximize->False. 
 For getting more precise results, one can even set  Method->{InteriorPoint, Tolerance->10^-10}.";

Modiclus::usage = 
"Modiclus[game,opts] computes the modiclus as the projection of the pre-nucleolus from the
 dual cover game onto the player set T of the original game. Do not confound this command
 with the function ModifiedNucleolus[]. The algorithm is based on a method by Peleg to translate
 the definition of the Nucleolus into a sequence of linear programs on the pre-imputation set.
 To increases the computational reliability in cases of numerical issues the following methods
 can be used: RevisedSimplex, CLP, MOSEK, or Automatic. Default setting is Automatic. This option
 must be used in connection with CallMaximize->False. For getting more precise results one can even set 
 Method->{InteriorPoint, Tolerance->10^-10}.";


IsModiclusQ::usage = 
"IsModiclusQ[game,payoff,opts] checks whether the provided payoff vector is the modiclus of the game.
 To increases the computational reliability in cases of numerical issues the following methods
 can be used: RevisedSimplex, CLP, MOSEK, or Automatic. Default setting is Automatic. This option
 must be used in connection with CallMaximize->False. For getting more precise results one can even set 
 Method->{InteriorPoint, Tolerance->10^-10}";


ModPreKernel::usage = 
"ModPreKernel[game] computes a modified pre-kernel element as the solution
 of the pre-kernel from the excess comparability cover game.
 Do not confound this command with the function ModifiedKernel[].";

IsModPreKernelQ::usage = 
"IsModPreKernelQ[game,payoff] checks whether the provided payoff vector is a modified
 pre-kernel element of the game.";

ProperModPreKernel::usage = 
"ProperModPreKernel[game] computes a proper modified pre-kernel element as the projection
 of the pre-kernel from the dual cover game onto the player set T of the original game.
 Do not confound this command with the function ModifiedKernel[].";

IsProperModPreKernelQ::usage = 
"IsProperModPreKernelQ[game,payoff] checks whether the provided payoff vector is a proper modified
 pre-kernel element of the game.";

DualCover::usage =
"DualCover[game] computes the dual cover game from which the modiclus will be determined.";

DualExtension::usage =
"DualExtension[game] determines the dual extension of the primal game.";

PrimalExtension::usage =
"PrimalExtension[game] determines the primal extension of the dual game.";

ECCoverGame::usage =
"ECCoverGame[game] computes the excess comparability cover game.";

SMPreKernel::usage = 
"SMPreKernel[game] computes the simplified modified pre-kernel of the game.";

IsSMPreKernelQ::usage = 
"IsSMPreKernelQ[game,payoff] checks if payoff is the simplified modified pre-kernel of the game.";

SMPrenucleolus::usage =
"SMPrenucleolus[game] computes the simplified modified pre-nucleolus of the game.";

IsSMPrenucleolusQ::usage =
"IsSMPrenucleolusQ[game,payoff] checks if payoff is the simplified modified pre-nucleolus of the game.";

DuttaRay::usage = 
"DuttaRay[game,options] computes the Dutta-Ray solution for convex games. Different solvers can be selected 
 by option setting Method->Solver. Permissible solvers are: Automatic, GUROBI, IPOPT, MOSEK, DifferentialEvolution, 
 NelderMead, RandomSearch, or SimulatedAnnealing. Default setting is Automatic";

LorenzSolution::usage = 
"LorenzSolution[game,options] computes the Lorenz solution whenever the core exits. Different solvers can be 
 selected by option setting Method->Solver. Permissible solvers are: Automatic, GUROBI, IPOPT, MOSEK, 
 DifferentialEvolution, NelderMead, RandomSearch, or SimulatedAnnealing. Default setting is Automatic";

CollectionOfDecreasingExcess::usage =
"CollectionOfDecreasingExcess[game,payoff] determines the collection of coalitions with highest up 
 to the lowest level of excesses.";

BalancedCollectionQ::usage =
"BalancedCollectionQ[game,payoff,options] determines whether the induced collections
 are balanced w.r.t. all excess levels.  Implements Kohlberg's Theorem. The return value must
 be 'True' for the prenucleolus, otherwise 'False'. For its default value 'False' the function 
 Kernel[game] will be invoked to avoid infinite loops. To increases the computational reliability 
 in cases of numerical issues the following methods can be used: RevisedSimplex, CLP, GUROBI, MOSEK, 
 or Automatic. Default setting is RevisedSimplex. For getting more precise results one can even set 
 Method->{InteriorPoint, Tolerance->10^-10}.";


WeaklyBalancedCollectionQ::usage =
"WeaklyBalancedCollectionQ[game,payoff,options] determines whether the induced collections
 are weakly balanced w.r.t. all excess levels.  Implements Kohlberg's Theorem. The return value must
 be 'True' for the nucleolus, otherwise 'False'. For its default value 'False' the function Kernel[game] 
 will be invoked to avoid infinite loops. To increases the computational reliability in cases of numerical issues 
 the following methods can be used: RevisedSimplex, CLP, GUROBI, MOSEK, or Automatic. Default setting is RevisedSimplex. 
 For getting more precise results one can even set Method->{InteriorPoint, Tolerance->10^-10}.";

kBalancednessQ::usage =
"kBalancednessQ[collect_List, coalOfsize_k, options] determines whether the coalition collection
 is k-balanced w.r.t. all excess levels. It is based on Kurskal rank condition.";


BalancedSelectionQ::usage = 
"BalancedSelectionQ[game,payoff,options] or BalancedSelectionQ[coalstruct, options] 
 determines whether the induced collections are balanced w.r.t. all excess levels. 
 Implements Kohlberg's Theorem. The return value must be 'True' for the prenucleolus, 
 otherwise 'False'. It might be that this function returns in any case a 'False', 
 this is due to circumvent wrong selections. Whenever one has computed the prekernel 
 set, one can set the option Tight->True to filter out the prenucleolus. It is recommended
 to switch to BalancedCollectionQ, which is more robust.";

WeaklyBalancedSelectionQ::usage = 
"WeaklyBalancedSelectionQ[game,payoff,options] or WeaklyBalancedSelectionQ[coalstruct, options] 
 determines whether the induced collections are weakly balanced w.r.t. all excess levels. 
 Implements a weak form of Kohlberg's Theorem, i.e. it allows zero weights. It is recommended
 to switch to WeaklyBalancedCollectionQ, which is more robust.";

SelectionKBalancedQ::usage =
"SelectionKBalancedQ[game, payoff,k options] or SelectionKBalancedQ[coalstruct,k options] 
 determines whether a coalition collection or its induced from an imputation 'payoff' is
 k-balanced. The value k must be an integer between 2 and n. Experimental, not stable!";

PreKernel::usage =
"PreKernel[game] or PreKernel[game,payoff,options] computes a pre-kernel element by iteratively solving
 a system of linear equations. (cf. Algorithm 8.2.1 of Meinhardt (2013))" ;

PreKernelElement::usage =
"PreKernelElement[game,payoff,options] computes a pre-kernel element by iteratively 
 determining a direction of improvement. The iteration process stops whenever the 
 direction of improvement is equal to the null vector. (cf. Algorithm 8.3.1 of Meinhardt (2013)).";

PreKernelSolution::usage = 
"PreKernelSolution[game,payoff,options] computes a pre-kernel solution by relying on 
 Algorithm 8.1.1 and 8.2.1 of Meinhardt (2013). Default solver is SolutionExact -> True in order to call
 FindMinimum set SolutionExact->False. If the solution is still not correct or to search for a
 different pre-kernel element change the Method of FindMinimum, admissible values are: Method -> Automatic
 either to: Method -> Newton, Method-> QuasiNewton, Method -> InteriorPoint, Method->Gradient, 
 Method -> ConjugateGradient, Method -> PrincipalAxis, Method->LevenbergMarquardt, Method->GUROBI, 
 Method->MOSEK, or Method -> IPOPT.  By setting the  option AntiPreKernel -> True,  
 an anti-pre-kernel of the game can be computed. In order to look for further solutions, invoke   
 {prk,cvfunc,grad} = PreKernelSolution[game,payoff, ConjugateFunction -> True, 
 ShowObjectiveFunction -> True].";

AntiPreKernelSolution::usage = 
"AntiPreKernelSolution[game,payoff,options] computes an anti-pre-kernel solution by relying on a 
 SDM-Method. This approach was discussed by Meseguer-Artola (1997). Setting the option AntiPreKernel 
 to 'False', a pre-kernel of the game can be computed.";

ImputationToMatrix::usage =   
"ImputationToMatrix[game,payoff,opts] transforms an imputation into equivalence class matrix Q. 
 Same as BestCoalToMatrix[]. Only the input parameters are different. See also BestCoalToMatrix[].";

BestCoalitions::usage = 
"BestCoalitions[game,payoff] computes the set of most effective coalitions that supports the claim of 
 player i against j, for all possible pair of players.";

BestCoalToMatrix::usage = 
"BestCoalToMatrix[bestcoal,T,options] computes an equivalence matrix Q, all sub-matrices, and 
 determinants from the set of best/most effective coalitions. For details see Meinhardt (2013).";

SetsToVec::usage =
"SetsToVec[bestcoal,T,options] converts the set of most effective coalitions to a set of vectors 
 of length T. A vector reflects how the best arguments are distributed between a bargaining pair 
 (i,j) at a proposal. A plus sign indicates that the arguments are skewed in favor of the player i, 
 zero means that the arguments are balanced, and a minus sign indicates that the arguments are 
 skewed in favor of the player j. See also Meinhardt (2013).";

ImputationToVec::usage =
"ImputationToVec[game,payoff,options] converts an imputation to a set of vectors of length T. A 
 vector reflects how the best arguments are distributed between a bargaining pair i,j at a proposal 
 'payoff'. A positive number indicates that the arguments are skewed in favor of the player i, zero 
 means that the arguments are balanced, and a negative number indicates that the arguments are skewed 
 in favor of the player j. This information can be obtained by invoking the option InFavor. Notice that 
 whenever the option EffVector is set to 'True', then the first vector must be positive, since it is 
 related to the grand coalition. Similar to SetsToVec[]. See also SetsToVec[].";


ImputationToEqClass::usage =    
"ImputationToEqClass[game,payoff] determines an equivalence class from an imputation. See also DetEqClass[] for more details.";

DetEqClass::usage = 
"DetEqClass[matrix,T] replicates the set of most effective coalitions from the unanimity 
 matrix-(Binom(t,2) x 2^t -1), where t is the cardinality of the player set. The unanimity 
 matrix can be determined by the function BargainUnanMatrix[game,payoff,EffVector -> False].";

BargainUnanMatrix::usage =   
"BargainUnanMatrix[game,payoff,options] computes an unanimity matrix of dimension (Binom(t,2) x 2^t -1), 
 where t is the cardinality of the player set. This is matrix W of equation 5.14, for details,
 see Meinhardt (2013).";


ValueExcess::usage =     
"ValueExcess[exc_vec] or ValueExcess[game, payoff] value the excess list or the list of all maximum 
 surpluses induced by a (pre)imputation. This is function h_gamma of Meinhardt (2013).";


ConvexConjugate::usage=    
"ConvexConjugate[game, confunc] specifies the convex conjugate (Fenchel transform) of the convex 
 input function 'confunc'. The convex input function must be determined by the function 
 PreKernelSolution[] by invoking the option ShowObjectiveFunction -> True.";
 

OptStepSize::usage =  
"OptStepSize[game, payoff, options] computes the optimal step size in order to decrease  the excess 
 value of the function ValueExcess[]. A direction of improvement 'doi' can be determined by the 
 function DirectionOfImprovement[]. Then a new payoff vector can be constructed by 
 newpay = payoff + Optstep * doi. Use this vector to value the excesses by ValueExcess[game, newpay]. 
 This value should be smaller than ValueExcess[game,payoff].";

DirectionOfImprovement::usage = 
"DirectionOfImprovement[game, payoff, options] determines a vector of improvement in order reduce 
 the maximum surpluses.";

FindKernelSolution::usage = 
"FindKernelSolution[game,payoff] tries to approximate a pre-kernel solution by iteratively carrying 
 out transfers between pairs of players. The suggested algorithm is due to M. Maschler. For details 
 see U. Faigle, W. Kern and J. Kuipers (1998).";


FindPreKernelSolution::usage = 
"FindKernelSolution[game,payoff] tries to approximate a pre-kernel solution by iteratively carrying 
 out transfers between pairs of players. The suggested algorithm is due to M. Maschler. For details 
 see U. Faigle, W. Kern and J. Kuipers (1998).";


KernelImputationQ::usage = 
"KernelImputationQ[game,payoff] checks whether the payoff belongs to the kernel.";

KernelImputationListQ::usage = 
"KernelImputationListQ[game,payoff] checks whether the list of payoffs belongs to the kernel.";
                                
PreKernelQ::usage = 
"PreKernelQ[game,payoff] checks whether the (pre-)imputation 'payoff' is an element of the pre-kernel. 
 PreKernelQ checks also the efficiency condition in contrast to the function MaxExcessBalanced.";

AntiPreKernelQ::usage = 
"AntiPreKernelQ[game,payoff] checks whether the vector 'payoff' is an element of the anti-pre-kernel. 
 AntiPreKernelQ checks also the efficiency condition in contrast to the function MinExcessBalanced.";
                            
Transfer::usage = 
"Transfer[payoff, T, d, i, j] determines the bi-symmetrical transfer w.r.t. the strong epsilon-core. 
 The function Transfer[] computes the endpoint of the imputation 'payoff' in the ij-direction by 
 transferring the amount 'd_ij' from player i to player j. The argument 'payoff' is the initial 
 distribution, T is the player set, d is the amount which should be transferred from player i to j.";

DeltaLP::usage = 
"DeltaLP[game, i, j, eps] determines the largest amount d_ij that can be transferred from player i 
 to player j while remaining in the epsilon-core.";

TransferConstraints::usage = 
"TransferConstraints[game, i, j] or TransferConstraints[game, i, j, eps] computes the constraints 
 for calculating the largest amount that be transferred from player i to j while remaining in the 
 core or strong epsilon core. Default value for 'eps' is zero, and the value 'eps' can be omitted
 while calling this function.";

AllConstraints::usage = 
"AllConstraints[game] computes the constraints set and variable set which are needed to calculate a 
 kernel point of a game.";

AllMaxSurpluses::usage = 
"AllMaxSurpluses[game,payoff] calculates the maximum surplus of player i over j w.r.t. the imputation 
 'payoff' for all possible player combinations. Note that the efficiency condition will not be checked.";

AllAntiSurpluses::usage = 
"AllAntiSurpluses[game,payoff] calculates the minimum surplus of player i over j with respect to the 
 imputation 'payoff' for all possible player combinations. Note that the efficiency condition will not
 be checked.";

MaxSurplus::usage = 
"MaxSurplus[game,pi,pj,payoff] calculates the maximum surplus of player i over j with respect to the 
 imputation 'payoff'. Note that the efficiency condition will not be checked.";


EpsValue::usage = 
"EpsValue[game,eps] assigns the cost amount 'eps' to every proper coalition.";
                    
EpsCore::usage = 
"EpsCore[game] determines the least-core. Gives more information than the function LeastCore[game].";

FirstCriticalVal::usage  = 
"FirstCriticalVal[game] calculates the smallest epsilon such that the epsilon-core is nonempty.";

SecondCriticalVal::usage = 
"SecCriticalVal[game] calculates the largest gain that any group of individuals can assure while 
 forming a coalition. The epsilon core is included in the imputation set iff epsilon is greater 
 than the sec-critical-val. See Maschler, Peleg and Shapley (1979) on page 306 for more details.";
                         
ThirdCriticalVal::usage = 
"ThirdCriticalVal[game] calculates another critical value for epsilon to generalize the
 bisection property w.r.t. the strong epsilon-core. The epsilon-core is included in the 
 reasonable set iff epsilon is greater or equal than the third critical value.";
                            

FourthCriticalVal::usage = 
"FourthCriticalVal[game] returns the minimum of the SecCriticalVal[] and the ThirdCriticalVal[].";

FifthCriticalVal::usage = 
"The Union of the lower set and the core is included in the strong epsilon-core iff 
 epsilon >= epsilon5. See Chang and Kan (1992) for more details.";

StarCriticalVal::usage = 
"StarCriticalVal[game] determines a bound for epsilon as defined by Maschler, Peleg and 
 Shapley (1979) on page 320. The epsilon-core is included in the intersection of the imputation 
 set and the reasonable set iff epsilon is greater or equal than this epsilon bound. 
 Hence, the kernel is included in the strong epsilon core if epsilon >= epsilon*.";

SecondStarCriticalVal::usage = 
"SecondStarCriticalVal[game] determines a bound for epsilon as defined by Chang and Kan (1992) 
 on page 92. This is a better lower epsilon bound than the epsilon bound obtained by StarCriticalVal[].
 The kernel is included in the strong epsilon core if epsilon >= epsilon**.";

ThirdStarCriticalVal::usage = 
"ThirdStarCriticalVal[game] determines a bound for epsilon as defined by Chang and Driessen (1994). 
 This is a better lower epsilon bound than the epsilon or epsilon** bound obtained by StarCriticalVal[] 
 and ThirdStarCritical[]. The kernel is included in the strong epsilon core if epsilon >= epsilon***.";

LowerSetQ::usage = 
"LowerSetQ[game] checks if the lower set is non empty. An important set to define kernel catcher.";

UpperSetQ::usage = 
"UpperSetQ[game] checks if the upper set is non empty. An important set to define kernel catcher. 
 Furthermore, the kernel is equal to the pre-kernel.";

LowerSetIncImputationQ::usage = 
"LowerSetIncImputationQ[game] checks if the lower set is included in the imputation set. This is 
 equivalent to the statement that the game is zero-monotone.";

UpperSetIncImputationQ::usage = 
"UpperSetIncImputationQ[game] checks if the upper set is included in the imputation set.";

IntersectionUpperLowerSetQ::usage = 
"IntersectionUpperLowerSetQ[game] checks if the intersection of the lower and upper set is non-empty.";

GrandCoalitionLargestValueQ::usage = 
"GrandCoalitionLargestValueQ[game] checks if the worth of the grand coalition is the largest.";

PreKernelEqualsKernelQ::usage = 
"PreKernelEqualsKernelQ[game] checks if 'game' belongs to a class of games where the prekernel 
 is equal to the kernel.";

LargestAmount::usage = 
"LargestAmount[game] or LargestAmount[game,i] indicates the largest amount a player i can contribute 
 to a coalition.";

ProperAmount::usage = 
"ProperAmount[game_] or ProperAmount[game,i] indicates the largest amount a player i can contribute 
 to a proper coalition.";
                        
ReasonableSet::usage = 
"ReasonableSet[game] returns the set of imputations that give no player more than his largest amount 
 that he can contribute to a coalition.";
                        
ReasonableOutcome::usage = 
"ReasonableOutcome[game] set the largest amount to the variable r.";

Quota::usage = "Quota[game] determines the quotas of the game.";

VerticesCore::usage = 
"VerticesCore[game] calculates all vertices of the core. Be careful for games greater than n > 6. 
 Calculation time explodes.";

CddVerticesCore::usage = 
"CddVerticesCore[game] calculates all vertices of the core with Cddmathlink via Mathlink.
 Cddmathlink uses floating point arithmetic.";

CddGmpVerticesCore::usage = 
"CddGmpVerticesCore[game,Options] calculates all vertices of the core with Cddmathlink2gmp via Mathlink.
 Cddmathlink2gmp uses GMP rational exact arithmetic.";

CddGmpPlotCore::usage = 
"CddGmpPlotCore[game,Options] plots the core of a game with Cddmathlink2gmp via Mathlink.
 Cddmathlink2gmp uses GMP rational exact arithmetic.";
 
CddGmpPlotImputationSet::usage = 
"CddGmpPlotCore[game,Options] plots the core of a game with Cddmathlink2gmp via Mathlink.
 Cddmathlink2gmp uses GMP rational exact arithmetic.";

CddGmpPlotReasonableSet::usage = 
"CddGmpPlotReasonableSet[game,Options] plots the reasonable set of a game with Cddmathlink2gmp 
 via Mathlink. Cddmathlink2gmp uses GMP rational exact arithmetic.";

CddGmpImputationVertices::usage =
"CddGmpImputationVertices[game] calculates all vertices of the imputation set with Cddmathlink2gmp via Mathlink.";

CddVerticesImputationSet::usage = 
"CddVerticesReasonableSet[game] calculates all vertices of the imputation set with Cddmathlink via Mathlink."; 
                          
CddVerticesReasonableSet::usage = 
"CddVerticesReasonableSet[game] calculates all vertices of the reasonable set with Cddmathlink via Mathlink.";

CddVerticesLowerSet::usage =
"CddVerticesLowerSet[game] calculates all vertices of the lower set with Cddmathlink via Mathlink.";

CddGmpPlotLowerSet::usage = 
"CddGmpPlotLowerSet[game,Options] plots the lower set of a game with Cddmathlink2gmp via Mathlink.
 Cddmathlink2gmp uses GMP rational exact arithmetic.";

BaryCenter::usage =
"BaryCenter[game] computes the barycenter from the extreme points of the core.";

AnimationKernelProperty2d::usage =
"AnimationKernelProperty2d[game,options] visualizes the relationship between the kernel solution 
 and the strong epsilon core for three person games.";

StrongEpsCore2d::usage = 
"StrongEpsCore2d[game,opts] plots the strong epsilon core of a three person game. For more details see FilledCoreV6[].";

FilledCoreV6::usage =
"FilledCoreV6[game,opts] plots the core of a three person game. Filled the core area with light blue color. 
 Furthermore, the Shapley value will be depicted as a blue point, the kernel as a light red, the pre-kernel 
 as a red, and the nucleolus as a green point. Dedicated for Mathematica Version 6.x or higher only.";

Vec3DToSimplex::usage = 
"Vec3DToSimplex[{x1,x2,x3}] transforms a vector of dimension 3 into a vector of dimension 2.";

Vec4DToSimplex::usage =
"Vec4DToSimplex[{x1,x2,x3,x4}] transforms a vector of dimension 4 into a vector of dimension 3.";

Nuc1convex::usage = 
"Nuc1convex[game] can be only used to calculate the nucleolus for 1-convex games.";

EANSCValue::usage = 
"EANSCValue[game] computes the Equal Allocation of Non-Separable Contribution/Cost value.";

NewShapley::usage = 
"NewShapley[game] calculates the Shapley Value of the game based on the marginal contributions of players. Function not very efficient!";

Potential::usage =
"Potential[game] computes the potential of a game.";

ShapleyValueML::usage =
"ShapleyValueML[game] computes the Shapley Value of the game using the multi-linear extension.";

MLExtension::usage =
"MLExtension[game] computes the multi-linear extension of the game.";

UtopiaVector::usage = 
"UtopiaVector[game] calculates the utopia payoffs for all players.";

UtopiaPayoff::usage = 
"UtopiaPayoff[game,i] or UtopiaPayoff[i] represents the utopia payoff of player i.";

UtopiaSum::usage = 
"UtopiaSum[game,S_List] calculates the sum of utopia payoffs for coalition S.";

UpperVector::usage =
    "UpperVector[game] calculates the upper payoff for all players.";

UpperSum::usage =
    "UpperSum[game,S_List] calculates the sum of upper payoffs for coalition S.";

Gap::usage  = 
"Gap[game] balances the difference of the total utopia payoff of a coalition and its value."; 

GenGap::usage  = 
"GenGap[game] balances the difference of the total generalized utopia payoff of a coalition and its value."; 

GenUpperVector::usage =
    "UpperVector[game] calculates the generalized upper payoff for all players.";

GenUpperSum::usage =
    "GenUpperSum[game,S_List] calculates the sum of generalized upper payoffs for coalition S.";

AdjustedEffVector::usage = 
"AdjustedEffVector[game,i] calculates the adjusted efficient upper vector of player i for 1-convex games.";

AdjustedEffUpperVectors::usage = 
"AdjustedEffUpperVectors[game] calculates the adjusted efficient upper vectors for all players 
 for 1-convex games. There are exactly |T| upper efficient vectors in a 1-convex game."; 

AdjustedWorthVectors::usage = 
"AdjustedWorthVectors[game,k] computes the adjusted worth vectors of k-convex games. k is a natural number.";
 
Concession::usage = 
"Concession[game] is the maximum concession of player w.r.t. his utopia payoff UtopiaPayoff[game,i].";

DisagreeConvex::usage = 
"DisagreeConvex[game] calculates the disagreement vector for convex games."; 

Disagreement::usage = 
"Disagreement[game] calculates the disagreement vector of a game.";

TauValue::usage = 
"The TauValue[game] represents some efficient compromise between the upper bound 'Utopia-Payoff' 
 and some lower bound 'Disagreement' of the core.";  

ChiValue::usage = 
"The ChiValue[game] represents some efficient compromise between the generalized upper bound 'Utopia-Payoff' 
 and some lower bound 'Disagreement' of the core.";

GatelyValue::usage = 
"GatelyValue[game] computes the Gately point of an essential game v.";

PDValue::usage = 
"PDValue[game] computes the proportional division value of a individually positive TU-game.";

EPSDValue::usage = 
"EPSDValue[game] computes the egalitarian proportional surplus division value of a individually positive TU-game.";

GenConcession::usage = 
"GenConcession[game] is the maximum concession of player w.r.t. his generalized utopia payoff GenUtopiaPayoff[game,i].";

MargValue::usage = 
"MargValue[game] calculates the marginal worth for all players.";

kCover::usage = 
"kCover[game,k] determines the k-cover of the game. k is a natural number.";

kConvexity::usage = 
"kConvexity[game] determines whether the TU-game is k-convex. Return value is a list of natural numbers to indicate 
 which kind of k-convexity is fulfilled. In case that the game is not k-convex, a list of zeors will be returned."; 

CoreElementsQ::usage = 
"CoreElementsQ[game,payoff] checks if a list of payoffs contain core allocations."; 

BelongToCoreQ::usage = 
"BelongToCore[game,payoff] checks if a list of payoffs contain core allocations. An imputation x 
 is in the core iff x =< dual v."; 

BalancedInequalityQ::usage = 
"BalancedInequalityQ[game,coll] checks if the balanced system of sets satisfies a balanced inequality
of the game. It returns True or False. The latter includes also the case that the system is not
balanced.";


ImputationQ::usage = 
"ImputationQ[game,payoff] checks whether the imputation or list of imputations belongs to the 
 imputation set.";

CoordS::usage = 
"CoordS[game,S] determines the unanimity coordinate of coalitions S.";

GameBasis::usage = 
"GameBasis[T] computes the basis of a |T|-person game.";

CharacteristicValues::usage =
"CharacteristicValues[unancrd_List,T,opts] computes the coalitional values from the vector of 
 unanimity coordinates.";

UnanimityCoordinates::usage = 
"UnanimityCoordinates[game] determines all unanimity coordinates of the game.";

HarsanyiDividends::usage = 
"HarsanyiDividends[game] determines all unanimity coordinates of the game. It computes the 
 coordinates by multiplying the inverse of the game basis with the worth vector of the game.";

MinUnanimityCoordinates::usage = 
"MinUnanimityCoordinates[game] calculates the minimum unanimity coordinate for each coalition size.";

StrictlyConvexUnanConditionQ::usage = 
"StrictlyConvexUnanConditionQ[game] checks at most (n-1) inequalities of the unanimity coordinates 
 constraints for strict positive sums. It examines if the sufficient condition of convexity in terms 
 of unanimity coordinates is satisfied. The return value is 'True' or 'False'. See also EvalSumMinCoord[].";


ConvexUnanConditionQ::usage = 
"ConvexUnanConditionQ[game] checks at most (n-1) inequalities of the unanimity coordinates constraints 
 for positive sums. It examines if the sufficient condition of convexity in terms of  unanimity 
 coordinates is satisfied. The return value is 'True' or 'False'. See also EvalSumMinCoord[].";     


UnanConvexQ::usage =
"UnanConvexQ[coord,T,opts] checks if the coordinates satisfy the sufficient and necessary condition 
 of convexity of the game in terms of unanimity coordinates. Calling the function with its options
 open a glance on the results, all terms must be non-negative.";

UnanAvConvexQ::usage =
"UnanAvConvexQ[coord,T,opts] checks if the coordinates satisfy the sufficient and necessary condition 
 of average convexity of the game in terms of unanimity coordinates. Calling the function with its options
 open a glance on the results, all terms must be non-negative. See Solano and Rafels (1996).";


DetUCoord::usage = 
"DetUCoord[coord_List,T] determines the missing unanimity coordinates of size greater than 2 to 
 generate a TU-game. It is required that the list of unanimity coordinates which represents the  
 coordinates of size 2 has non-negative input values. Thus, the input dimension of coord_List 
 is Binomial[|T|,2], where T is the player set. See Meinhardt (2009).";

DetQuasiAvConvex::usage = 
"vallist = DetQuasiAvConvex[Origgame] determines from the game 'Origame' the coalitional values of 
 a quasi average convex game. The resultant list of the coalitional values can be used to define 
 a new game by NewGame := (DefineGame[T, vallist];);. See also DetUCoord[].";

PlayerPairs::usage = 
"PlayerPairs[T] determines the set of all pair of players from the player set T.";

EvalSumMinCoord::usage = 
"EvalSumMinCoord[game] calculates at most (n-1) inequalities of the unanimity coordinates constraints 
 of non-negative sums. It is a sufficient condition of convexity for a game. If all values are 
 non-negative then the game is convex. But the converse is not true."; 

WeightedMajority::usage = 
"WeightedMajority[T,weightList] determines a simple game from the non-negative vector [q; p1, ..., pt], 
 where T={1,...t}=Range[t]. It is admissible to specify the vector of weights by the following 
 format of lists {q, p1, ...,pt} or {q, {p1, ..., pt}} or {{q}, {p1, ...,pt}}. The resultant list can 
 then be used to define a game by using the function DefineGame[].";


(* Some explanations for options are given next.*) 

CallMaximize::usage = 
"Is an option for the function KernelCalculation[]. With this option the LP solver is changed from
 LinearOptimization to NMaximize/NMinimize. The solver ConstrainedMax has been deprecated in 
 Mathematica version 12.";

ChangeInternalEps::usage =
"Is an option for the function KernelCalculation[]. With this option it is possible to change internally 
 the epsilon value within the first loop. This option is useful to obtain different allocations from the 
 initial LPs.";

DisplayAllResults::usage =
"Is an option for the functions Kernel[] and KernelCalculation[]. If the option is set to 'True', then 
 all internal results are returned, otherwise a kernel element and the imputations computed by the 
 initial LPs are returned.";

EpsilonValue::usage = 
"Is an option of the functions Kernel[] and KernelCalculation[]. The default value is set to zero. Using 
 different real numbers, the strong epsilon-core can be changed.";

RationalApproximate::usage = 
"Is an option for the function DefineGame[]. The real numbers of the coalitional values are approximated 
 by rational numbers. Default value is true.";

RationalExact::usage = 
"Is an option for the functions CddGmpVerticesCore[] and CddGmpPlotCore[].";

SetGameToNonZeroMonotonic::usage = 
"Is an option for the function KernelCalculation[]. Switching this option on, it is possible 
 to search for additional pre-imputations for non-zero-monotonic games.";

WithIncidences::usage = 
"Is an option for the function CddGmpVerticesCore[]. Switching this option on, a facets-vertices 
 incidence matrix will be returned.";

ConjugateFunction::usage =
"Is an option for the function PreKernelSolution[]. Switching this option on, the Fenchel transform 
 of a convex function will be returned. The Fenchel transform gives evidence whether the pre-kernel 
 solution is a set solution or whether it consists of a unique vector.";

Silent::usage = 
"If this option is set to 'False', then it is possible to monitor the iterative numerical computation 
 to search for a (pre)-kernel solution. Similar to verbose.";

SetRecursionLimit::usage =
"Is an option to change the current limit on the number of level of recursion. The default value is 
 set to 128.";

ShowObjectiveFunction::usage =
"Is an option of the function PreKernelSolution[] to return the objective function 
 (convex function) that has determined a pre-kernel solution of the game. In connection  
 with the option 'ConjugateFunction' it gives evidence whether the pre-kernel solution 
 is a set of solution or whether it consists of a unique vector.";

AllCoalitions::usage = 
"Is an option of the function BestCoalitions[] to return the complete set of most effective 
 coalitions w.r.t an imputation. When this option is switched on, then use the function in this 
 way: {bscij,bscji} = BestCoalitions[game,payoff,AllCoalitions->True].";

SmallestCardinality::usage =  
"Is an option of the functions PreKernelSolution[] and BestCoalitions[] to return the set of most 
 effective coalitions with smallest cardinality. Whenever this option is set to 'False', then the 
 set of coalitions w.r.t. the largest cardinality is returned.";

KernelRange::usage =
"Is an option for the function ModifiedKernel[] to search for a line segment of the (pre)-kernel.";

ProperContribution::usage =
"This is an option to determine the vertices of the upper set, which is a kernel catcher.
 This function may useful in connection with the package 'TuGamesView3D' to visualize for 
 four person games the upper set. This set can coincide with the reasonable set.";


Which[$OperatingSystem === "Unix",
  Options[AverageConvexQ] = {DisplayAllResults -> False};
  Options[BalancedCollectionQ] = {Method-> RevisedSimplex};
  Options[SuperAdditiveQ] = {Silent -> True};
  Options[DefineGame] = {RationalApproximate -> True};
  Options[CddVerticesCore] = {RationalExact -> True};
  Options[CddGmpVerticesCore] = {RationalExact -> True, WithIncidences -> False};
  Options[CddGmpPlotCore] = {RationalExact -> True};
  Options[CddVerticesImputationSet] =  {RationalExact -> True};
  Options[CddVerticesReasonableSet] = {RationalExact -> True, ProperContribution -> False};
  Options[CddGmpPlotReasonableSet] = {ProperContribution -> False};
  Options[CddVerticesLowerSet] = {RationalExact -> True};
  Options[CddGmpPlotLowerSet] = {}; 
  Options[BestCoalitions] = {AllCoalitions -> False, AntiPreKernel -> False, MaximumSurpluses -> False, SmallestCardinality -> True}; 
  Options[OptStepSize] = {Silent -> True, SmallestCardinality -> True}; 
  Options[PreKernelElement] = {CalcStepSize -> True, PseudoInv->True,Silent -> True, SmallestCardinality -> True, RationalTol -> 10^(-7)};
  Options[Modiclus] = {Method -> Automatic};
  Options[IsModiclusQ] = {Method -> Automatic};
  Options[ModPreKernel] = {CalcStepSize -> True, PseudoInv->True,Silent -> True, SmallestCardinality -> True};       
  Options[DirectionOfImprovement] = {CalcStepSize -> True, MaximumSurpluses -> False, PseudoInv->True,Silent -> True, SmallestCardinality -> True};
  Options[Kernel] = {CallMaximize -> False, Method -> Automatic, DisplayAllResults -> False, EpsilonValue -> 0};
  Options[KernelCalculation] = {CallMaximize -> True, Method -> Automatic, ChangeInternalEps -> False, DisplayAllResults -> False, EpsilonValue -> 0, SetGameToNonZeroMonotonic -> False};
  Options[ModifiedKernel] = {Method -> Automatic};
  Options[KernelVertices] = {CallMaximize -> True, Method -> Automatic, EpsilonValue -> 0, Silent -> True};
  Options[ModifiedNucleolus] = {Method -> Automatic};
  Options[LexiCenter] = {Method -> Automatic};
  Options[PreNucleolus] = {Method -> Automatic};
  Options[NonLinPreNuc] = {Method -> Automatic};
  Options[NonLinNuc] = {Method -> Automatic};
  Options[ApproxNuc] = {Method -> Automatic};
  Options[ApproxPreNuc] = {Method -> Automatic};
  Options[LorenzSolution] = {DigitPrecision -> 20, RationalApproximate -> True,Method-> Automatic};
  Options[DuttaRay] = {DigitPrecision -> 20, RationalApproximate -> True, Method-> Automatic};
  Options[kBalancednessQ] = {DisplayAllResults -> False, Silent -> True};
  Options[BalancedSelectionQ] = {DisplayAllResults -> False, Silent -> True, Tight->False};
  Options[WeaklyBalancedSelectionQ] = {DisplayAllResults -> False, Silent -> True, Tight->False};
  Options[WeaklyBalancedCollectionQ] = {Method-> RevisedSimplex};
  Options[SelectionKBalancedQ] := {DisplayAllResults -> False, Silent -> True, Tight->False};
  Options[PreKernelSolution] = {AntiPreKernel -> False, ConjugateFunction -> False,  DigitPrecision -> 6, Method -> Automatic, ShowObjectiveFunction -> False, RationalTol -> 10^(-9),  Silent -> True, SmallestCardinality -> True, SolutionExact -> True}; (* If the solution is not correct, change Method to: "Newton", "ConjugateGradient", "PrincipalAxis"  *)
  Options[PreKernel] = {AntiPreKernel -> False, RationalTol -> 10^(-9),  Silent -> True, SmallestCardinality -> True};        
  Options[AntiPreKernelSolution] = {AntiPreKernel -> True, ConjugateFunction -> False, DigitPrecision -> 6, Method -> Automatic, ShowObjectiveFunction -> False, RationalTol -> 10^(-9), Silent -> True, SmallestCardinality -> True, SolutionExact -> False};
  Options[ProperModPreKernel] = {AntiPreKernel -> False, ConjugateFunction -> False,  DigitPrecision -> 6, Method -> Automatic, ShowObjectiveFunction -> False, RationalTol -> 10^(-9),  Silent -> True, SmallestCardinality -> True, SolutionExact -> False};
  Options[BestCoalToMatrix] = {DisplayAllResults -> True, DisplayMatrixForm -> True};
  Options[ConvexConjugate] = {Silent -> True};
  Options[AllMaxSurpluses] = {DisplayMatrixForm -> False};
  Options[AllAntiSurpluses] = {DisplayMatrixForm -> False};
  Options[ExcessPayoff] = {DisplayMatrixForm -> False};
  Options[FindKernelSolution] = {DigitPrecision -> 6, RationalTol -> 10^(-7), SetRecursionLimit -> 512, Silent -> True};
  Options[FindPreKernelSolution] = {DigitPrecision -> 6, RationalTol -> 10^(-7), SetRecursionLimit -> 512, Silent -> True};
  Options[PreKernelQ] = {RationalTol -> 10^(-6)};
  Options[AntiPreKernelQ] = {RationalTol -> 10^(-6)};
  Options[MaxExcessBalanced] = {RationalTol -> 10^(-6)};
  Options[MinExcessBalanced] = {RationalTol -> 10^(-6)}; 
  Options[UpperSetIncImputationQ] = {Silent -> True};
  Options[LowerSetIncImputationQ] = {Silent -> True};
  Options[PreKernelEqualsKernelQ] = {Silent -> True};
  Options[AnimationKernelProperty2d] = {UpperCritVal ->{5}, LowerCritVal -> {},IncSize -> {-(1/4)}, FigureSize -> 500, UseManipulate->False};
  Options[StrongEpsCore2d] = {EpsilonValue -> 5,FigureSize -> 500,Labeling -> True};
  Options[FilledCoreV6] = {DisplayLegend -> True,FigureSize -> 500,PreImpSet -> True,Silent -> False};
  Options[SetsToVec] ={EffVector -> False};
  Options[ImputationToVec] ={DisplayAllResults -> False, EffVector -> False, InFavor -> False};
  Options[ImputationToEqClass] = {BargUnanMat -> False};
  Options[BargainUnanMatrix] ={EffVector -> True};
  Options[DeltaLP]={CallMaximize-> False, Method -> Automatic};
  Options[UnanConvexQ] = {DisplayAllResults -> False, DisplayCoord-> False, NumericalPrec -> 10^(-12)};
  Options[UnanAvConvexQ] = {DisplayAllResults -> False, DisplayCoord-> False, NumericalPrec -> 10^(-12)};,
True,
  Options[AverageConvexQ] = {DisplayAllResults -> False};
  Options[BalancedCollectionQ] = {Method-> RevisedSimplex};
  Options[DefineGame] = {RationalApproximate -> True};
  Options[CddVerticesCore] = {RationalExact -> False};
  Options[CddGmpVerticesCore] = {RationalExact -> True, WithIncidences -> False};
  Options[CddGmpPlotCore] = {RationalExact -> True};
  Options[CddVerticesImputationSet] =  {RationalExact -> False};
  Options[CddVerticesReasonableSet] = {RationalExact -> False, ProperContribution -> False};
  Options[CddGmpPlotReasonableSet] = {ProperContribution -> False};
  Options[CddGmpPlotLowerSet] = {}; 
  Options[BestCoalitions] := {AllCoalitions -> False, AntiPreKernel -> False, MaximumSurpluses -> False, SmallestCardinality -> True}; 
  Options[OptStepSize] := {Silent -> True, SmallestCardinality -> True};   
  Options[PreKernelElement] = {CalcStepSize -> True, PseudoInv->True,Silent -> True, SmallestCardinality -> True};
  Options[Modiclus] = {Method -> Automatic};
  Options[IsModiclusQ] = {Method -> Automatic};
  Options[ModPreKernel] = {CalcStepSize -> True, PseudoInv->True,Silent -> True, SmallestCardinality -> True};
  Options[ProperModPreKernel] = {AntiPreKernel -> False, ConjugateFunction -> False,  DigitPrecision -> 6, Method -> Automatic, ShowObjectiveFunction -> False, RationalTol -> 10^(-9),  Silent -> True, SmallestCardinality -> True, SolutionExact -> False};
  Options[DirectionOfImprovement] = {CalcStepSize -> True, MaximumSurpluses -> False, PseudoInv->True, Silent -> True, SmallestCardinality -> True};
  Options[Kernel] = {CallMaximize -> False, Method -> Automatic, DisplayAllResults -> False, EpsilonValue -> 0}; 
  Options[KernelCalculation] = {CallMaximize -> True, Method -> Automatic, ChangeInternalEps -> False, DisplayAllResults -> False, EpsilonValue -> 0, SetGameToNonZeroMonotonic -> False};
  Options[ModifiedKernel] = {Method -> Automatic}; 
  Options[KernelVertices] = {CallMaximize -> True, Method -> Automatic, EpsilonValue -> 0, Silent -> True}; 
  Options[ModifiedNucleolus] = {Method -> Automatic}; 
  Options[LexiCenter] = {Method -> Automatic}; 
  Options[PreNucleolus] = {Method -> Automatic};
  Options[NonLinPreNuc] = {Method -> Automatic};
  Options[NonLinNuc] = {Method -> Automatic};
  Options[ApproxNuc] = {Method -> Automatic};
  Options[ApproxPreNuc] = {Method -> Automatic};
  Options[LorenzSolution] = {DigitPrecision -> 20, RationalApproximate -> True, Method-> Automatic};
  Options[DuttaRay] = {DigitPrecision -> 20, RationalApproximate -> True, Method-> Automatic};
  Options[kBalancednessQ] = {DisplayAllResults -> False, Silent -> True};
  Options[BalancedSelectionQ] = {DisplayAllResults -> False,  Silent -> True, Tight->False}
  Options[WeaklyBalancedSelectionQ] = {DisplayAllResults -> False,  Silent -> True, Tight->False};
  Options[BalancedCollectionQ] = {Method-> RevisedSimplex};
  Options[SelectionKBalancedQ] = {DisplayAllResults -> False, Silent -> True, Tight->False};
  Options[PreKernelSolution] = {AntiPreKernel -> False, ConjugateFunction -> False,  DigitPrecision -> 6, Method -> Newton, ShowObjectiveFunction -> False, RationalTol -> 10^(-9),  Silent -> True, SmallestCardinality -> True, SolutionExact -> False};
  Options[PreKernel] = {AntiPreKernel -> False, RationalTol -> 10^(-9),  Silent -> True, SmallestCardinality -> True};    
  Options[AntiPreKernelSolution] = {AntiPreKernel -> True, ConjugateFunction -> False, DigitPrecision -> 6, Method -> Newton, ShowObjectiveFunction -> False, RationalTol -> 10^(-9), Silent -> True, SmallestCardinality -> True, SolutionExact -> False};   
  Options[BestCoalToMatrix] = {DisplayAllResults -> True, DisplayMatrixForm -> True}; 
  Options[ImputationToMatrix] = Options[BestCoalToMatrix]; 
  Options[ConvexConjugate] = {Silent -> True};
  Options[AllMaxSurpluses] = {DisplayMatrixForm -> False};
  Options[AllAntiSurpluses] = {DisplayMatrixForm -> False};
  Options[ExcessPayoff] = {DisplayMatrixForm -> False};
  Options[FindKernelSolution] = {DigitPrecision -> 6, RationalTol -> 10^(-7), SetRecursionLimit -> 512, Silent -> True};
  Options[FindPreKernelSolution] = {DigitPrecision -> 6, RationalTol -> 10^(-7), SetRecursionLimit -> 512, Silent -> True}; 
  Options[UpperSetIncImputationQ] = {Silent -> True};
  Options[LowerSetIncImputationQ] = {Silent -> True};
  Options[PreKernelEqualsKernelQ] = {Silent -> True};
  Options[PreKernelQ] = {RationalTol -> 10^(-6)};
  Options[AntiPreKernelQ] = {RationalTol -> 10^(-6)};
  Options[MaxExcessBalanced] = {RationalTol -> 10^(-6)};                        
  Options[MinExcessBalanced] = {RationalTol -> 10^(-6)};
  Options[AnimationKernelProperty2d] = {UpperCritVal ->{5}, LowerCritVal -> {},IncSize -> {-(1/4)},UseManipulate->False};
  Options[StrongEpsCore2d] = {EpsilonValue -> 5,FigureSize -> 500,Labeling -> True};
  Options[FilledCoreV6] = {DisplayLegend -> True,FigureSize -> 500,PreImpSet -> True,Silent -> False};
  Options[SetsToVec] ={EffVector -> False};
  Options[ImputationToVec] ={DisplayAllResults -> False, EffVector -> False, InFavor -> False};
  Options[ImputationToEqClass] = {BargUnanMat -> False};
  Options[BargainUnanMatrix] ={EffVector -> True};
  Options[DeltaLP]={CallMaximize-> False, Method -> Automatic};
  Options[UnanConvexQ] = {DisplayAllResults -> False, DisplayCoord-> False, NumericalPrec -> 10^(-12)};
  Options[UnanAvConvexQ]  = {DisplayAllResults -> False, DisplayCoord-> False, NumericalPrec -> 10^(-12)};
];


(* :Error Messages: *)

(* :One Argument: *)

AdjustedEffUpperVectors::argerr="One argument was expected.";
ADMCGameQ::argerr="One argument was expected.";
AIMCGameQ::argerr="One argument was expected.";
AllConstraints::argerr="One argument was expected.";
AlmostConcaveQ::argerr="One argument was expected.";
AlmostConvexQ::argerr="One argument was expected.";
AntiPreKernelSolution::argerr="One argument was expected.";
AvConvexQ::argerr="One argument was expected.";
AverageConvexQ::argerr="One argument was expected.";
BaryCenter::argerr="One argument was expected.";
CddGmpPlotCore::argerr="One argument was expected.";
CddGmpPlotImputationSet::argerr="One argument was expected.";
CddGmpPlotLowerSet::argerr="One argument was expected.";
CddGmpPlotReasonableSet::argerr="One argument was expected.";
CddGmpVerticesCore::argerr="One argument was expected.";
CddGmpImputationVertices::argerr="One argument was expected.";
CddVerticesCore::argerr="One argument was expected.";
CddVerticesImputationSet::argerr="One argument was expected.";
CddVerticesLowerSet::argerr="One argument was expected.";
CddVerticesReasonableSet::argerr="One argument was expected.";
ChiValue::argerr="One argument was expected.";
ConcaveQ::argerr="One argument was expected.";
Concession::argerr="One argument was expected.";
ConvCheck::argerr="One argument was expected.";
ConvexQ::argerr="One argument was expected.";
ConvexStrQ::argerr="One argument was expected.";
ConvexUnanConditionQ::argerr="One argument was expected.";
ConvStrQ::argerr="One argument was expected.";
DetQuasiAvConvex::argerr="One argument was expected.";
Disagreement::argerr="One argument was expected.";
DisagreeConvex::argerr="One argument was expected.";
DualCover::argerr="One argument was expected.";
DualExtension::argerr="One argument was expected.";
DualGame::argerr="One argument was expected.";
DuttaRay::argerr="One argument was expected.";
EANSCValue::argerr="One argument was expected.";
EpsCore::argerr="One argument was expected.";
EPSDValue::argerr="One argument was expected.";
EvalSumMinCoord::argerr="One argument was expected.";
FifthCriticalVal::argerr="One argument was expected.";
FilledCoreV6::argerr="One argument was expected.";
FindKernelSolution::argerr="One argument was expected.";
FindPreKernelSolution::argerr="One argument was expected.";
FirstCriticalVal::argerr="One argument was expected.";
FourthCriticalVal::argerr="One argument was expected.";
GameBasis::argerr="One argument was expected.";
GameMonotoneQ::argerr="One argument was expected.";
Gap::argerr="One argument was expected.";
GatelyValue::argerr="One argument was expected.";
GenConcession::argerr="One argument was expected.";
GenUpperPayoff::argerr="One argument was expected.";
GenUpperSum::argerr="One argument was expected.";
GenUpperVector::argerr="One argument was expected.";
GrandCoalitionLargestValueQ::argerr="One argument was expected.";
HarsanyiDividends::argerr="One argument was expected.";
IntersectionUpperLowerSetQ::argerr="One argument was expected.";
KernelCalculation::argerr="One argument was expected.";
Kernel::argerr="One argument was expected.";
KernelVertices::argerr="One argument was expected.";
kConvexity::argerr="One argument was expected.";
LargestAmount::argerr="One argument was expected."
LexiCenter::argerr="One argument was expected.";
LorenzSolution::argerr="One argument was expected.";
LowerSetIncImputationQ::argerr="One argument was expected.";
LowerSetQ::argerr="One argument was expected.";
LSNuc::argerr="One argument was expected.";
LSPreNuc::argerr="One argument was expected.";
MargValue::argerr="One argument was expected.";
MinUnanimityCoordinates::argerr="One argument was expected.";
MLExtension::argerr="One argument was expected.";
Modiclus::argerr="One argument was expected.";
ModifiedKernel::argerr="One argument was expected.";
ModifiedNucleolus::argerr="One argument was expected.";
ModPreKernel::argerr="One argument was expected.";
MonotoneQ::argerr="One argument was expected.";
NewShapley::argerr="One argument was expected.";
NucleolusThreePerson::argerr="One argument was expected.";
Nuc1convex::argerr="One argument was expected.";
OneNormalization::argerr="One argument was expected.";
PDValue::argerr="One argument was expected.";
PlayerPairs::argerr="One argument was expected.";
Potential::argerr="One argument was expected.";
PreKernelElement::argerr="One argument was expected.";
PreKernelEqualsKernelQ::argerr="One argument was expected.";
PreKernel::argerr="One argument was expected.";
PreKernelSolution::argerr="One argument was expected.";
PreNucleolus::argerr="One argument was expected.";
PrimalExtension::argerr="One argument was expected.";
ProperAmount::argerr="One argument was expected.";
ProperModPreKernel::argerr="One argument was expected.";
Quota::argerr="One argument was expected.";
ReasonableOutcome::argerr="One argument was expected.";
ReasonableSet::argerr="One argument was expected.";
StandardSolution::argerr="One argument was expected.";
ScrbSolution::argerr="One argument was expected.";
SecondCriticalVal::argerr="One argument was expected.";
SecondStarCriticalVal::argerr="One argument was expected.";
SelectSuperSets::argerr="One argument was expected.";
ShapleyValueML::argerr="One argument was expected.";
SmallestContributionVector::argerr="One argument was expected.";
SMPreKernel::argerr="One argument was expected.";
SMPrenucleolus::argerr="One argument was expected.";
StarCriticalVal::argerr="One argument was expected.";
StrictlyConvexUnanConditionQ::argerr="One argument was expected.";
StrongEpsCore2d::argerr="One argument was expected.";
SuperAdditiveQ::argerr="One argument was expected.";
TauValue::argerr="One argument was expected.";
ThirdCriticalVal::argerr="One argument was expected.";
ThirdStarCriticalVal::argerr="One argument was expected.";
UpperSum::argerr="One argument was expected.";
UpperVector::argerr="One argument was expected.";
UpperPayoff::argerr="One argument was expected.";
UtopiaSum::argerr="One argument was expected.";
UtopiaVector::argerr="One argument was expected.";
UtopiaPayoff::argerr="One argument was expected.";
WeaklySuperAdditiveQ::argerr="One argument was expected.";
UnanimityCoordinates::argerr="One argument was expected.";
UpperSetIncImputationQ::argerr="One argument was expected.";
UpperSetQ::argerr="One argument was expected.";
UtopiaVector::argerr="One argument was expected.";
ValueExcess::argerr="One argument was expected.";
VerticesCore::argerr="One argument was expected.";
WeaklyBalancedSelectionQ::argerr="One argument was expected.";
WeaklySuperAdditiveQ::argerr="One argument was expected.";
ZeroMonotoneQ::argerr="One argument was expected.";
ZeroNormalization::argerr="One argument was expected.";
ZeroOneNormalization::argerr="One argument was expected.";


(* :Two Arguments: *)
AdjustedEffVector::argerr="Two arguments were expected.";
AdjustedWorthVectors::argerr="Two arguments were expected.";
AllAntiSurpluses::argerr="Two arguments were expected.";
AllMaxSurpluses::argerr="Two arguments were expected.";
AntiPreKernelQ::argerr="Two arguments were expected.";
BalancedSelectionQ::argerr="Two arguments were expected.";
BalancedCollectionQ::argerr="Two arguments were expected.";
BalancedInequalityQ::argerr="Two arguments were expected.";
BargainUnanMatrix::argerr="Two arguments were expected.";
BelongToCoreQ::argerr="Two arguments were expected.";
BestCoalitions::argerr="Two arguments were expected.";
BestCoalToMatrix::argerr="Two arguments were expected.";
CharacteristicValues::argerr="Two arguments were expected.";
CollectionOfDecreasingExcess::argerr="Two arguments were expected.";
ConvexConjugate::argerr="Two arguments were expected.";
CoordS::argerr="Two arguments were expected.";
CoreElementsQ::argerr="Two arguments were expected.";
CostSaving::argerr="Two arguments were expected.";
DefineGame::argerr="Two arguments were expected.";
DetEqClass::argerr="Two arguments were expected.";
DetUCoord::argerr="Two arguments were expected.";
DirectionOfImprovement::argerr="Two arguments were expected.";
ECCoverGame::argerr="Two arguments were expected.";
EpsValue::argerr="Two arguments were expected.";
ExcessPayoff::argerr="Two arguments were expected.";
ImputationQ::argerr="Two arguments were expected.";
ImputationToEqClass::argerr="Two arguments were expected.";
ImputationToMatrix::argerr="Two arguments were expected.";
ImputationToVec::argerr="Two arguments were expected.";
IncreasMargContributions::argerr="Two arguments were expected.";
IntersectionOfMaxExcessSets::argerr="Two arguments were expected.";
IsModiclusQ::argerr="Two arguments were expected.";
IsModPreKernelQ::argerr="Two arguments were expected.";
IsProperModPreKernelQ::argerr="Two arguments were expected.";
IsSMPreKernelQ::argerr="Two arguments were expected.";
IsSMPrenucleolusQ::argerr="Two arguments were expected.";
kBalancednessQ::argerr="Two arguments were expected.";
kCover::argerr="Two arguments were expected.";
KernelImputationQ::argerr="Two arguments were expected.";
KernelImputationListQ::argerr="Two arguments were expected.";
MaxExcessBalanced::argerr="Two arguments were expected.";
MaxExcessSets::argerr="Two arguments were expected.";
MinExcessBalanced::argerr="Two arguments were expected.";
ModCoalArray::argerr="Two arguments were expected.";
OptStepSize::argerr="Two arguments were expected.";
PreKernelQ::argerr="Two arguments were expected.";
Scrb::argerr="Two arguments were expected.";
SetsToVec::argerr="Two arguments were expected.";
SmallestContribution::argerr="Two arguments were expected.";
StrIncreasMargContrib::argerr="Two arguments were expected.";
TIJsets::argerr="Two arguments were expected.";
UnanAvConvexQ::argerr="Two arguments were expected.";
UnanConvexQ::argerr="Two arguments were expected.";
UpperSum::argerr="Two arguments were expected.";
UtopiaPayoff::argerr="Two arguments were expected.";
UtopiaSum::argerr="Two arguments were expected.";
WekalyBalancedCollectionQ::argerr="Two arguments were expected.";


(* :Three Arguments: *)
TransferConstraints::argerr="Threee arguments were expected.";

(* :Four Arguments: *)
DeltaLP::argerr="Four arguments were expected.";
MaxSurplus::argerr="Four arguments were expected.";

(* :Five Arguments: *)
Transfer::argerr="Five arguments were expected.";

Begin["`Private`"];

(* Check the directory where you have installed your packages *)
Needs["PlotLegends`"];

(* 
  In order to run even the cddmathlink libraries in parallel, we have to create here some artificial 
  links for the SubKernels to be synchronized with the links created by the Master Kernel. Otherwise
  the link numbering of the SubKernels does not coincide with the numbering created by the Master Kernel.
  This might not happen on all platforms, in this case enclose the line below with command marks.
  For more details have a look in the README file and/or in TuGamesMovieParaModeV6.nb in the Documentation 
  directory. See also

  http://mathematica.stackexchange.com/questions/25561/how-to-run-an-external-program-in-parallel-with-a-mathematica-package

*)

Which[SameQ[Global`$ParaMode,"False"] && SameQ[Global`$NotebookMode,"False"],False,
      SameQ[Global`$ParaMode,"False"] && SameQ[Global`$NotebookMode,"True"], False,
      SameQ[Global`$ParaMode,"True"]  && SameQ[Global`$NotebookMode,"False"],kc=$KernelCount;Table[LinkCreate[],{kc-1}],
      SameQ[Global`$ParaMode,"True"]  && SameQ[Global`$NotebookMode,"True"],kc=$KernelCount;Table[LinkCreate[],{kc+6}]
      ];


(* :Comments for Windows OS starts:
   Check the paths where you have to install the cddmathlink library.

   PacletInformation["TUG"]

   Then open the directory.

   SystemOpen@Lookup[PacletInformation["TUG"], "Location"]

   :Comments for Windows OS ends: 
*)

(*  Deactivate the lines below if you have not installed cddmathlink. *)
linksQ=Links[];
If[Length[Position[StringFreeQ[#[[1]], "TUG" ~~ ___ ~~ "cddmathlink"] & /@ linksQ, False]]!=0,
(* Checking first if a LinkObject exists already and uninstall the cddml libraries. *)
         Uninstall[cddml];
         Uninstall[cddmlgmp];
         Uninstall[cddml2];
(* We owe the following lines of code to Szabolcs Horv\[AAcute]t. *)
(* In the second step install the cddml libraries again.*)
         cddml=Install@FileNameJoin[{DirectoryName[$InputFileName], "cddmathlink"}];
         cddmlgmp = Install@FileNameJoin[{DirectoryName[$InputFileName], "cddmathlink2gmp"}];
         cddml2=Install@FileNameJoin[{DirectoryName[$InputFileName], "cddmathlink2"}];,
(* If the LinkObject is empty, then install the cddml libraries.*)
         cddml = Install@FileNameJoin[{DirectoryName[$InputFileName], "cddmathlink"}];
         cddmlgmp = Install@FileNameJoin[{DirectoryName[$InputFileName], "cddmathlink2gmp"}];
         cddml2 = Install@FileNameJoin[{DirectoryName[$InputFileName], "cddmathlink2"}]
];


Off[LinearOptimization::ubnd];
Off[LinearOptimization::dinfeas];

(* Section general functions starts *)

DefineGame[args___]:=(Message[DefineGame::argerr];$Failed);
DefineGame[R_List, values_List, opts:OptionsPattern[DefineGame]] := (Clear[T]; T = R; Clear[v];
    approxrat = OptionValue[RationalApproximate];
    If[SameQ[2^Length[T],Length[values]],True,Print["Game is not consistently defined!"];Return[]];
    If[SameQ[approxrat,True], 
      MapThread[Set[v[#1], #2] &, {Coalitions, Rationalize[values, 5^(-12)]}];, 
      MapThread[Set[v[#1], #2] &, {Coalitions, values}];]);


CostSaving[args___]:=(Message[CostSaving::argerr];$Failed);
CostSaving[costvec_List,T_List] := Block[{cs},
  MapThread[SetDelayed[c[#1], #2] &, {Subsets[T], costvec}];
  cs=(Total[c[{#}] & /@ #] - c[#]) & /@ Subsets[T];
  Flatten[{0,Drop[cs,1]}]
  ];


DualGame[args___]:=(Message[DualGame::argerr];$Failed);
DualGame[game_]:=(v[T]-v[#] & /@ Reverse[Coalitions]);

(*
Def.: Let S_1,S_2,...S_k be a partition of the grand coalition T, then
the game v is called weakly superadditive, if sum_{i=1}^k v(S_i) <= v(T). 
	
Prop.:
v is a weakly superadditive game if and only if v <= dual v
*)

WeaklySuperAdditiveQ[args___]:=(Message[WeaklySuperAdditiveQ::argerr];$Failed);
WeaklySuperAdditiveQ[game_] := Block[{truelist},
    truelist = Thread[(v[#] & /@ Coalitions) <= DualGame[game]];
    Apply[And, truelist]
];

(*
Def. Every subset S of T induce a subgame w via w(S) = v(S) on the new player set S.
Prop. A game v is superadditive, if for every subgame w it holds w =< dual w.
*)

SuperAdditiveQ[args___]:=(Message[SuperAdditiveQ::argerr];$Failed);
SuperAdditiveQ[game_, opts:OptionsPattern[SuperAdditiveQ]] := Block[{sil, coal, clsup},
    sil = OptionValue[Silent];
    clsup = SupAddQ[#] & /@ Coalitions;
    If[sil===False,Print["w greater dual w= ",clsup]; , True];
    Apply[And, clsup]
];


(*
Checking if w =< dual w holds for every subgame w.
*)

SupAddQ[teilmg_List] := Block[{tpws,valsubg, duval, leq},
    tpws=Subsets[teilmg];			       
    valsubg = v[#] & /@ tpws;
    duval = (v[T]-v[#] & /@ Reverse[tpws]);
    leq = MapThread[LessEqual, {valsubg, duval}];
    Apply[And, leq]
 ];

SelectSuperSets[args___]:=(Message[SelectSuperSets::argerr];$Failed);
SelectSuperSets[i_Integer]:=W[i];

W[i_Integer]:= Cases[Coalitions,{___,i,___}];

Assign[values_List]:=Thread[Rule[(v[#]& /@ Coalitions),values]];

WeightedMajority[T_,weight_List]:=Block[{wgs},
                    Which[Depth[weight]===3,
                               If[SameQ[Length[Last[weight]],Length[T]],
                                  wgs=Flatten[weight];
                                  Which[SameQ[Length[wgs],Length[T]+1],WeightedMajMain[T,wgs],
                                        True,Print["Wrong Input"]],
                                   Print["Wrong Input"]],
                          Depth[weight]===2,If[SameQ[Length[weight],Length[T]+1],
                                             WeightedMajMain[T,weight],
                                              Print["Wrong Input"]],
                          True,Print["Wrong Input"]] 
];


WeightedMajMain[T_,weight_List] := Block[{outersets,coalweights,sumweights,threshold},
       outersets = Outer[List, Subsets[T]];
       coalweights = Extract[Drop[weight,1], #] & /@ outersets;
       sumweights = Total[#] & /@ coalweights;
       threshold = First[weight]; 
       GreaterEqual[#, threshold] & /@ sumweights /. True -> 1 /. False -> 0 
];




StandardSolution[args___]:=(Message[StandardSolution::argerr];$Failed);
StandardSolution[game_]:=Block[{dmQ},
   dmQ=SameQ[2^Length[T],2^2];
   If[dmQ,v[{#}] + (v[T]-v[{1}]-v[{2}])/2 &/@ T,
      Print["Game has incorrect dimension!"];Return[]]
   ];

(* Section general functions ends *)


(* convexity and av-convexity section starts *)

IncreasMargContributions[args___]:=(Message[IncreasMargContributions::argerr];$Failed);
IncreasMargContributions[game_,i_Integer ,values_List]:=
	Do[Print[(v[#]-v[DeleteCases[#,i]] <= 
         v[Union[Flatten[{#,j}]]] - v[DeleteCases[ 
          Union[Flatten[{#,j}]],i]])& /@ Take[W[i],Length[W[i]]-1]/.Assign[values]],
           {j,DeleteCases[T,1]}];

IncreasingMargContributions[game_,i_Integer]:=
	Table[(v[#]-v[DeleteCases[#,i]] <= 
          v[Union[Flatten[{#,j}]]] - v[DeleteCases[ 
            Union[Flatten[{#,j}]],i]])& /@ Take[W[i],Length[W[i]]-1] ,
              {j,DeleteCases[T,1]}];

ConvCheck[args___]:=(Message[ConvCheck::argerr];$Failed);
ConvCheck[game_]:= IncreasingMargContributions[game,#] & /@ T;

ConvexQ[args___]:=(Message[ConvexQ::argerr];$Failed);
ConvexQ[game_]:= 
Block[{liste}, 
    liste = Flatten[IncreasingMargContributions[game,#] & /@ T,1];
    Apply[And,Apply[And,liste,1]]
	];

AlmostConvexQ[args___]:=(Message[AlmostConvexQ::argerr];$Failed);
AlmostConvexQ[game_]:= 
Block[{liste}, 
      liste = Flatten[QuasiIncreasingMargContributions[game,#] & /@ T,1];
      Apply[And,Apply[And,liste,1]]
	];
delT[i_Integer,j_Integer]:= DeleteCases[Take[W[i],Length[W[i]]-1],DeleteCases[T,j]];


QuasiIncreasingMargContributions[game_,i_Integer]:=
	Table[(v[#]-v[DeleteCases[#,i]] <= 
          v[Union[Flatten[{#,j}]]] - v[DeleteCases[ 
		  Union[Flatten[{#,j}]],i]]) & /@ delT[i,j] ,
              {j,DeleteCases[T,i]}];

ADMCGameQ[args___]:=(Message[ADMCGameQ::argerr];$Failed);
ADMCGameQ[game_]:= 
Block[{liste}, 
    liste = Flatten[AlmostDiminishingMargContributions[game,#] & /@ T,1];
    Apply[And,Apply[And,liste,1]]
	];

AlmostDiminishingMargContributions[game_,i_Integer]:=
	Table[(v[#]-v[DeleteCases[#,i]] >= 
          v[Union[Flatten[{#,j}]]] - v[DeleteCases[ 
		  Union[Flatten[{#,j}]],i]] >= v[{i}])& /@ Drop[Take[W[i],Length[W[i]]-1],1] ,
              {j,DeleteCases[T,1]}];

AIMCGameQ[args___]:=(Message[AIMCGameQ::argerr];$Failed);
AIMCGameQ[game_]:= 
Block[{liste}, 
    liste = Flatten[AlmostIncreasingMargContributions[game,#] & /@ T,1];
    Apply[And,Apply[And,liste,1]]
	];

AlmostIncreasingMargContributions[game_,i_Integer]:=
	Table[(v[#]-v[DeleteCases[#,i]] <= 
          v[Union[Flatten[{#,j}]]] - v[DeleteCases[ 
		  Union[Flatten[{#,j}]],i]] <= v[{i}])& /@ Drop[Take[W[i],Length[W[i]]-1],1] ,
              {j,DeleteCases[T,1]}];

AlmostConcaveQ[args___]:=(Message[AlmostConcaveQ::argerr];$Failed);
AlmostConcaveQ[game_]:= 
Block[{liste}, 
      liste = Flatten[QuasiDiminishingMargContributions[game,#] & /@ T,1];
      Apply[And,Apply[And,liste,1]]
	];

QuasiDiminishingMargContributions[game_,i_Integer]:=
	Table[(v[#]-v[DeleteCases[#,i]] >= 
          v[Union[Flatten[{#,j}]]] - v[DeleteCases[ 
		  Union[Flatten[{#,j}]],i]]) & /@ delT[i,j] ,
              {j,DeleteCases[T,i]}];


ConcaveQ[args___]:=(Message[ConcaveQ::argerr];$Failed);
ConcaveQ[game_]:= 
Block[{liste}, 
    liste = Flatten[DiminishingMargContributions[game,#] & /@ T,1];
    Apply[And,Apply[And,liste,1]]
	];

DiminishingMargContributions[game_,i_Integer]:=
	Table[(v[#]-v[DeleteCases[#,i]] >= 
          v[Union[Flatten[{#,j}]]] - v[DeleteCases[ 
            Union[Flatten[{#,j}]],i]])& /@ Take[W[i],Length[W[i]]-1] ,
              {j,DeleteCases[T,1]}];


StrIncreasMargContrib[args___]:=(Message[StrIncreasMargContrib::argerr];$Failed);
StrIncreasMargContrib[game_, i_Integer]:=
	Table[(Rationalize[v[#] - v[DeleteCases[#,i]]] < 
          Rationalize[v[Union[Flatten[{#,j}]]] - v[DeleteCases[ 
             Union[Flatten[{#,j}]],i]]])& /@ Take[W[i],Length[W[i]]-1] ,
              {j,DeleteCases[T,1]}];

ConvStrQ[args___]:=(Message[ConvStrQ::argerr];$Failed);
ConvStrQ[game_]:= StrIncreasMargContrib[game,#] & /@ T;

ConvexStrQ[args___]:=(Message[ConvexStrQ::argerr];$Failed);

ConvexStrQ[game_]:= Block[{liste},
		liste = Flatten[StrIncreasMargContrib[game,#] & /@ T,1];
		 Apply[And,Apply[And,liste,1]]
	];

AverageConvexQ[args___]:=(Message[AverageConvexQ::argerr];$Failed);

AverageConvexQ[game_, opts:OptionsPattern[AverageConvexQ]] := Block[{dispres, pwset, chsum,delmp},
    dispres = OptionValue[DisplayAllResults];
    pwset = Subsets[T];
    chsum = CheckSumQ[#, T, opts]  & /@ Drop[pwset, 1];
     delmp = DeleteCases[chsum, {{}, {}}];
    Which[SameQ[dispres,False], Apply[And, Union[chsum]],
                  True, {Apply[And,Union[Flatten[First[#] & /@ delmp]]], Last[#] & /@ delmp}
                ]
 ];

CheckSumQ[teilmg_List, T_, opts:OptionsPattern[AverageConvexQ]] := 
  Block[{supset, smarg, dispres},
    dispres = OptionValue[DisplayAllResults];
    supset = OberMenge[teilmg, T];
    smarg = SumMargContribution[#, teilmg, opts] & /@ supset;
    Which[SameQ[dispres,False], Apply[And, Union[smarg]],
                  True, {First[#] & /@ smarg, Last[#] & /@ smarg}
                 ]
];


OberMenge[teilmg_List, T_List] := Block[{compl,subc,prop},
    compl = Complement[T, teilmg];
    subc=Subsets[compl];
    prop=Join[teilmg, #] & /@ subc;
    Sort[#] & /@ prop

];


SumMargContribution[superset_List, teilmg_List, opts:OptionsPattern[AverageConvexQ]] := 
  Block[{dispres, delisp, delitlm, sumtmg, add, nnegQ},
    dispres = OptionValue[DisplayAllResults];
    delisp = DeleteCases[superset, #] & /@ teilmg;
    delitlm = DeleteCases[teilmg, #] & /@ teilmg;
    sumtmg = MapThread[N[v[superset] - v[#1] - v[teilmg] + v[#2]] &, {delisp, delitlm}];
    add = Total[sumtmg] // Simplify;
    nnegQ = NonNegative[add];
    Which[SameQ[dispres,False], nnegQ,
                 True, {nnegQ, add}]
];

(* AvConvexQ[] is same as AverageConvexQ[] *)

AvConvexQ[args___]:=(Message[AvConvexQ::argerr];$Failed);

AvConvexQ[game_,  opts:OptionsPattern[AverageConvexQ]]  := AverageConvexQ[game, opts];

(* Old Average Convex Function is deprecated *)


(* convexity and av-convexity section ends *)
      

(* (zero)-monotonicity section starts *)

ZeroMonotoneQ[args___]:=(Message[ZeroMonotoneQ::argerr];$Failed);
ZeroMonotoneQ[game_] := Block[{zeroval, orgval,newgame,mQ,oldgame},
    orgval = Rationalize[v[#] & /@ Subsets[T]];
    zeroval = ZeroNormalization[game];
    newgame := DefineGame[T, zeroval];
    mQ=MonotoneQ[newgame];
    oldgame = DefineGame[T,orgval]; (* Reconstruction of the original game. *)
    Return[mQ];
    ];

ZeroNormalization[args___]:=(Message[ZeroNormalization::argerr];$Failed);
ZeroNormalization[game_] := Block[{genIndVal, addIndVal, coalval},
    coalval = v[#] & /@ Coalitions ;
    genIndVal = Map[v, #] & /@ Outer[List, Coalitions];
    addIndVal = Total[#] & /@ genIndVal;
    Subtract[coalval, addIndVal]
    ];

ZeroOneNormalization[args___]:=(Message[ZeroOneNormalization::argerr];$Failed);
ZeroOneNormalization[game_] := Block[{zeroli, div},
    zeroli = ZeroNormalization[game];
    div = Divide[ #, Take[zeroli, -1]] & /@ zeroli;
    Flatten[div]
    ];

OneNormalization[args___]:=(Message[OneNormalization::argerr];$Failed);
OneNormalization[game_] := Block[{newgame},
    newgame = v[#] & /@ Subsets[T];
    newgame * (1/Last[newgame])

];

(*
A game v is monotone if v(S \cup i) - v(S) is non-negative for all i \in N.
*)

GameMonotoneQ[args___]:=(Message[GameMonotoneQ::argerr];$Failed);
GameMonotoneQ[game_]:= 
Block[{liste}, 
      liste = Flatten[MargContribPositive[game,#] & /@ T,1];
      Apply[And,Apply[And,liste,1]]
	];



MargContribPositive[game_,i_Integer]:= Block[{margli},
        margli = ( v[#]-v[DeleteCases[#,i]])& /@ W[i];
        MapThread[GreaterEqual,{margli,Table[0,{j,Length[margli]}]}]
 ];



MonotoneQ[args___]:=(Message[MonotoneQ::argerr];$Failed);
MonotoneQ[game_] := Block[{coal},
    coal = Coalitions;
    MonoCheck[game, coal]
    ];


(* Checks monotonicity for every subgame  *)

MonoCheck[game_, liste_] := 
  Block[{mengen = liste, obermenge, gensub, newsets, val, pruef,truelist = {}, wahrQ},
    While[Length[mengen] > 0,
      obermenge = Take[mengen, -1][[1]];
      newsets = DeleteCases[mengen, obermenge];
      gensub = Subsets[obermenge];
      val = v[#] & /@ gensub;
      pruef = (val[[Length[gensub]]] >=  #) & /@ val;
      mengen = newsets;
      wahrQ = Apply[And, pruef];
      truelist = Append[truelist, wahrQ];
     ];
    Apply[And, truelist]
    ];

(* (zero)-monotonicity section ends *)




(* strong epsilon core section starts *)

EpsValue[args___]:=(Message[EpsValue::argerr];$Failed);
EpsValue[game_, eps_] := Map[Set[v[#], v[#] - eps] &, ProperCoalitions];
      
     
NewRelax[ineq_, epsilon_] := ineq /. lhs_ >= rhs_ -> lhs >= rhs - epsilon;

EpsCore[args___]:=(Message[EpsCore::argerr];$Failed);
EpsCore[game_] := Block[{zf,res},
        {zf,res}=LinearOptimization[Global`e - f,Append[NewRelax[CoalitionalRationality,Global`e - f], ParetoOptimality],
                   Join[PayoffVector, {Global`e, f}],{"PrimalMinimumValue","PrimalMinimizer"},Method->"Automatic"]; (*RevisedSimplex *)
        {zf,MapThread[Rule,{Join[PayoffVector, {Global`e, f}],res}]}
];


(* Section critical values starts *)
(* The following critical values are due to Maschler, Peleg and Shapley (1979) *)

FirstCriticalVal[args___]:=(Message[FirstCriticalVal::argerr];$Failed);
FirstCriticalVal[game_] := Block[{con},
          con = LinearOptimization[e - f, Append[
          NewRelax[CoalitionalRationality, e - f],
          ParetoOptimality], Join[PayoffVector, {e, f}],{"PrimalMinimumValue","PrimalMinimizer"},Method->"Automatic"];
          MapThread[Rule, {{Global`eps1}, {con[[1]]}}]
    ];
        
SecondCriticalVal[args___]:=(Message[SecondCriticalVal::argerr];$Failed);
SecondCriticalVal[game_] := Block[{cval2},
         cval2 = Max[(v[#] - Total[Map[v[{#1}] &, #]]) & /@ ProperCoalitions];
         MapThread[Rule, {{Global`eps2}, {cval2}}]
    ];
            
 
ThirdCriticalVal[args___]:=(Message[ThirdCriticalVal::argerr];$Failed);
ThirdCriticalVal[game_] := Block[{cval3},
    ReasonableOutcome[game];
    cval3 = Max[(v[#] - v[T] + Total[Map[Global`r[#1] &, Complement[T,#]]]) & /@ ProperCoalitions];
         MapThread[Rule, {{Global`eps3}, {cval3}}]
     ];
    
FourthCriticalVal[args___]:=(Message[FourthCriticalVal::argerr];$Failed);
FourthCriticalVal[game_]:= Block[{cval4},
     cval4 = Min[{SecondCriticalVal[game][[1,2]],ThirdCriticalVal[game][[1,2]]}];
                MapThread[Rule, {{Global`eps4}, {cval4}}]
        ];
    
StarCriticalVal[args___]:=(Message[StarCriticalVal::argerr];$Failed);
StarCriticalVal[game_] :=Block[{cval, upbd},
        upbd = MapThread[Rule, {up[#] & /@ T, ReasonableOutcome[game]}];
        cval =  Max[Min[{v[#] - Total[v[{#1}] & /@ #], 
            v[#] + (up[Complement[T, #]] /. upbd) - v[T]}] & /@ 
         ProperCoalitions]; 
      MapThread[Rule, {{Global`stareps}, {cval}}]
  ];

up[S_List] := Plus @@ up /@ S;
m[S_List] := Plus @@ m /@ S;

 
(* The next two critical values are defined by Chang and Kan (1992) and Chang and Driessen (1994) *)

SecondStarCriticalVal[args___]:=(Message[SecondStarCriticalVal::argerr];$Failed);
SecondStarCriticalVal[game_] := Block[{lwbd, lwpara, upbd, uppara, dstarcval},
    lwbd = SmallestContributionVector[game];
    lwpara = MapThread[Rule, {m[#] & /@ T, lwbd}];
    upbd = ReasonableOutcome[game];
    uppara = MapThread[Rule, {up[#] & /@ T, upbd}];
    dstarcval = Which[Max[v[#] & /@ Drop[Subsets[T], -1]] >  v[T] === False,
                        Which[LowerSetQ[game] === False, CaseOne[game, uppara],
                         True, Which[CoreQ[game] === False, CaseTwo[game, lwpara, uppara],
                                        True, CaseThree[game, lwpara, uppara]]
             ],
        True, StarCriticalVal[game][[1, 2]]
        ];
    MapThread[Rule, {{Global`dstareps}, {dstarcval}}]
    ];

ThirdStarCriticalVal[args___]:=(Message[ThirdStarCriticalVal::argerr];$Failed);
ThirdStarCriticalVal[game_] := Block[{lwbd, lwpara, upbd, uppara, thstarcval},
    lwbd = SmallestContributionVector[game];
    lwpara = MapThread[Rule, {m[#] & /@ T, lwbd}];
    upbd = ProperAmount[game];
    uppara = MapThread[Rule, {up[#] & /@ T, upbd}];
    thstarcval = Which[Max[v[#] & /@ Drop[Subsets[T], -1]] >  v[T] === False,
                        Which[((LowerSetQ[game] || UpperSetQ[game]) && CoreQ[game]) === True, 0,
                         True, Which[CoreQ[game] === False, CaseTwo[game, lwpara, uppara],
                                        True, CaseThreeFor3[game, lwpara, uppara]]
             ],
        True, StarCriticalVal[game][[1, 2]]
        ];
    MapThread[Rule, {{Global`thstareps}, {thstarcval}}]
    ];

CaseOne[game_, uppara_List] := Block[{},Max[Min[{(v[#] + up[Complement[T, #]] - v[T]), v[#] - Total[v[{#1}] & /@ #], 0}] & /@ ProperCoalitions  /. uppara]];
CaseTwo[game_, lwpara_List, uppara_List] := Block[{}, Max[Min[{v[#] - m[#], v[#] - Total[v[{#1}] & /@ #], v[#] + up[Complement[T, #]] - v[T]}] & /@ ProperCoalitions  /. lwpara  /. uppara]];
CaseThree[game_, lwpara_List, uppara_List] := Block[{},Max[Min[{Max[{v[#] - m[#], 0}], v[#] - Total[v[{#1}] & /@ #], (v[#] + up[Complement[T, #]]  - v[T])}] & /@ ProperCoalitions  /. lwpara /. uppara]];
CaseThreeFor3[game_, lwpara_List, uppara_List] := Block[{},Max[Min[{Max[{Min[{v[#] - Total[v[{#1}] & /@ #],v[#] - m[#]}],0}], Max[{(v[#] + up[Complement[T, #]] - v[T]),0}]}] & /@ ProperCoalitions  /. lwpara  /. uppara]];


FifthCriticalVal[args___]:=(Message[FifthCriticalVal::argerr];$Failed);
FifthCriticalVal[game_] := Block[{lwbd, lwpara,cval5},
    lwbd = SmallestContributionVector[game];
    lwpara = MapThread[Rule, {m[#] & /@ T, lwbd}];
    cval5=Which[LowerSetQ[game] === False, 0,
                 LowerSetQ[game] === True,
      Which[ CoreQ[game] === False, Max[(v[#] - (m[#] /. lwpara)) & /@ ProperCoalitions],
       True, Max[Max[{(v[#] - (m[#] /. lwpara)), 0}] & /@ ProperCoalitions]] 
      ];
    MapThread[Rule, {{Global`eps5}, {cval5}}]
   ];

UpperSetQ[args___]:=(Message[UpperSetQ::argerr];$Failed);
UpperSetQ[game_] := Block[{upbd,uppara},
    upbd = ProperAmount[game];
    uppara = MapThread[Rule, {up[#] & /@ T, upbd}];
    (up[T] /. uppara) >=  v[T]
    ];


LowerSetQ[args___]:=(Message[LowerSetQ::argerr];$Failed);
LowerSetQ[game_] := Block[{lwbd, lwpara},
    lwbd = SmallestContributionVector[game];
    lwpara = MapThread[Rule, {m[#] & /@ T, lwbd}];
    (m[T] /. lwpara) <=  v[T]
    ];

LowerSetIncImputationQ[args___]:=(Message[LowerSetIncImputationQ::argerr];$Failed);
LowerSetIncImputationQ[game_,opts:OptionsPattern[LowerSetIncImputationQ]] := Block[{sil},
   sil = OptionValue[Silent];
   Which[SameQ[sil,False],DisplayMessageLower;True];
   Min[SmallestContributionVector[game]] >= 0
];

DisplayMessageLower:=(Print["Checking if Kernel and Pre-kernel are identical"];
                      Print["True is equivalent to zero-monotonicity of the game."];);

UpperSetIncImputationQ[args___]:=(Message[UpperSetIncImputationQ::argerr];$Failed);
UpperSetIncImputationQ[game_,opts:OptionsPattern[UpperSetIncImputationQ]] := Block[{sil,prub, prpara, setwoi},
    sil = OptionValue[Silent];
    Which[UpperSetQ[game] === True,
      prub = ProperAmount[game];
      prpara = MapThread[Rule, {up[#] & /@ T, prub}];
      setwoi = DeleteCases[T, #] & /@ T;
      Which[SameQ[sil,False],DisplayMessageUpper;True];
      v[T] >= Max[up[#] & /@ setwoi /. prpara],
      True, Print["Upper Set is empty. Nothing to check."]]
 ];


DisplayMessageUpper:=(Print["This class of games is different from zero-monotonic games."];
                      Print["If True, then the pre-kernel is equal to the kernel."];);

IntersectionUpperLowerSetQ[args___]:=(Message[IntersectionUpperLowerSetQ::argerr];$Failed);

IntersectionUpperLowerSetQ[game_] := Block[{},
     LowerSetQ[game] && UpperSetQ[game]
   ];

GrandCoalitionLargestValueQ[args___]:=(Message[GrandCoalitionLargestValueQ::argerr];$Failed);
GrandCoalitionLargestValueQ[game_] := Block[{},
  Max[v[#] &/@ Subsets[T]] <= v[T] 
  ];

PreKernelEqualsKernelQ[args___]:=(Message[PreKernelEqualsKernelQ::argerr];$Failed);
PreKernelEqualsKernelQ[game_,opts:OptionsPattern[PreKernelEqualsKernelQ]] := Block[{sil},
  sil = OptionValue[Silent];
  Which[sil===False,
         Switch[True, ZeroMonotoneQ[game],PrintMessPreKernelEq01; True, 
                      (!(!LowerSetQ[game]) && (!UpperSetQ[game])), PrintMessPreKernelEq02; True,
                      UpperSetIncImputationQ[game], PrintMessPreKernelEq03; True,
(*  This statement needs more!  (GrandCoalitionLargestValueQ[game] && IntersectionUpperLowerSetQ[game]),
                                 PrintMessPreKernelEq04; True,*)
                True, PrintMessPreKernelEq05;False
         ],
        True,
          Switch[True, ZeroMonotoneQ[game], True,
                     (!(!LowerSetQ[game]) && (!UpperSetQ[game])), True,
                     UpperSetIncImputationQ[game], True,
(*                     (GrandCoalitionLargestValueQ[game] && IntersectionUpperLowerSetQ[game]),True,*)
                      True,False
      ]
    ]
  ];

PrintMessPreKernelEq01 := Print["Checking if the game is zero monotone."];
PrintMessPreKernelEq02 := Print["Checking if the intersection of the upper and lower set is empty."];
PrintMessPreKernelEq03 := Print["Checking if the upper set is included in the imputation set."];
(*
PrintMessPreKernelEq04 := (Print["Checking if the intersection of the upper and lower set is non empty"];
                           Print["and that the grand coalition has the largest value."];);
*)
PrintMessPreKernelEq05 := Print["Checked sufficient conditions are not satisfied."];

(* Section critical values ends *)

LargestAmount[args___]:=(Message[LargestAmount::argerr];$Failed);
LargestAmount[game_, i_Integer] := Max[(v[#] - v[DeleteCases[#, i]]) & /@ W[i]];
LargestAmount[game_] := LargestAmount[game,#] &/@ T;

ProperAmount[args___]:=(Message[ProperAmount::argerr];$Failed);
ProperAmount[game_, i_Integer] := Max[(v[#] - v[DeleteCases[#, i]]) & /@ Drop[W[i], -1]];
ProperAmount[game_] := ProperAmount[game,#] &/@ T;

ImplementReas[game_] := Map[Global`r, T];

ReasonableOutcome[args___]:=(Message[ReasonableOutcome::argerr];$Failed);
ReasonableOutcome[game_] := (Clear[Global`r]; MapThread[Set, {ImplementReas[game], \
LargestAmount[game]}]);
 
ReasonableConst := x[#] <= Global`r[#] & /@ T;

ReasonableSet[args___]:=(Message[ReasonableSet::argerr];$Failed);
ReasonableSet[game_] := Block[{assr},
     ReasonableOutcome[game];
    assr = (Clear[Global`r]; MapThread[Set, {ImplementReas[game], LargestAmount[game]}]);
    Append[ReasonableConst, ParetoOptimality]
    ];
 
(* strong epsilon core section ends *) 



NewShapley[args___]:=(Message[NewShapley::argerr];$Failed);
NewShapley[game_]:=Block[{pot},
                   pot=Potential[game];
                   Last[pot,1]-Part[pot,-#-1] &/@ T
		   ];

Potential[args___]:=(Message[Potential::argerr];$Failed);
Potential[game_]:=rho[#] &/@ Subsets[T];

rho[{}]:=0;
rho[S_List /; Length[S]==1]:=rho[S]=v[S];
rho[S_List /; Length[S]>1]:=rho[S]=(v[S]+Total[rho[DeleteCases[S,#]] &/@ S])/Length[S];


ShapleyValueML[args___]:=(Message[ShapleyValueML::argerr];$Failed);
ShapleyValueML[game_]:=Block[{vars,tv,rl,F,dmat,G},
     vars=x[#] &/@ T;			      
     tv=Array[t &,Length[T]];
     rl=MapThread[Rule,{vars,tv}];			      
     F=MLExtension[game];
     dmat=D[F,#] &/@ vars;
     G=dmat /. rl;
     NIntegrate[#,{t,0,1}] &/@ G			      
		];

MLExtension[args___]:=(Message[MLExtension::argerr];$Failed);
MLExtension[game_]:=Block[{ss,cS,ms,ns,smd},
   ss=Subsets[T];
   cS=Reverse[ss];
   ms=MapThread[x,{#}] &/@ ss;			   
   ns=MapThread[x,{#}] &/@ cS;
   smd=Table[(Apply[Times,ms[[i]]]*Apply[Times,Subtract[1,#] &/@ ns[[i]]])*v[ss[[i]]],{i,Length[ms]}];
   Total[smd]			   
		    ];


PrintRemark[payoff_List]:= (
      Print["Dimensions is equal to ",Dimensions[payoff]];
      Print["Depth is equal to ",Depth[payoff]];
      Print["Usage: MaxExcessBalanced[game,payoff] and ExcessPayoff[game,payoff]"];
      Print["The variable 'payoff' has not the correct input format."];
      Print["The variable 'payoff' must be a list of payoff vectors or a single payoff vector."]
);

ExcessPayoff[args___]:=(Message[ExcessPayoff::argerr];$Failed);
ExcessPayoff[game_,payoff_List, opts:OptionsPattern[ExcessPayoff]]:= Block[{dispmat,assg,li,res},
  dispmat = OptionValue[DisplayMatrixForm];    
  If[Depth[payoff] === 2 || Depth[payoff] === 3,
    li = If[Length[Dimensions[payoff]]===1,{payoff},payoff];
    assg = MapThread[Rule,{Map[x,T],#}] & /@ li;
    res = ReplaceAll[(v[#]-x[#])& /@ Subsets[T], #] & /@ assg;
    Which[dispmat == False, res, True, DisplayErgb[res]],
            PrintRemark[payoff]
		]
  ];

DisplayErgb[payoff_List]:= Block[{exc,coal,mpc},
    exc = payoff;
    coal = Subsets[T];
    mpc = Map[Global`Co,coal];
    MatrixForm[PrependTo[exc,mpc]]
];

MaxExcessSets[args___]:=(Message[MaxExcessSets::argerr];$Failed);
MaxExcessSets[game_, payoff_List] := Block[{exclist, propexc, maxexc, pos},
    exclist = ExcessPayoff[game, payoff];
    propexc = Drop[Drop[#, 1], -1] & /@ exclist;
    maxexc = Max[#] & /@ propexc;
    pos = MapThread[Position[#1, #2] &, {propexc, maxexc}];
    Extract[ProperCoalitions, #] & /@ pos
    ];

IntersectionOfMaxExcessSets[args___]:=(Message[IntersectionOfMaxExcessSets::argerr];$Failed);
IntersectionOfMaxExcessSets[game_, payoff_List] := Block[{dsets},
   dsets = MaxExcessSets[game, payoff];
   Which[GrandCoalitionLargestValueQ[game]===False,DisplayMessFalse[game,payoff],
         True, DisplayMessTrue[game,payoff]];
   Apply[Intersection, #] & /@ dsets
  ];

DisplayMessFalse[game_,payoff_List] := 
                 (Print["Grand Coalition has not largest value."];
                  Print["Payoff vector/s is/are kernel element(s)? ", KernelImputationListQ[game,payoff]];);
DisplayMessTrue[game_,payoff_List] := 
                  (Print["If kernel payoff, then the intersection set is empty."];
                   Print["Payoff vector/s is/are kernel element(s)? ", KernelImputationListQ[game,payoff]];);


TIJsets[args___]:=(Message[TIJsets::argerr];$Failed);
TIJsets[i_Integer, j_Integer]:=DeleteCases[Cases[ProperCoalitions,{___,i,___}],{___,j,___}];


MaxExcessBalanced[args___]:=(Message[MaxExcessBalanced::argerr];$Failed);
MaxExcessBalanced[game_, payoff_List,opts:OptionsPattern[MaxExcessBalanced]]:= Block[{rattol,dimpay},
    rattol = OptionValue[RationalTol];
    dimpay = Dimensions[payoff];
    Which[Length[dimpay] === 2,
         Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), MaxExcessBalCheck[game, #,RationalTol->rattol] & /@ payoff, 
                       True, PrintRemark[payoff]], 
   Length[dimpay] === 1,
            Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), MaxExcessBalCheck[game, payoff,RationalTol->rattol], 
                         True,  PrintRemark[payoff]], 
   True, PrintRemark[payoff]]
];

MaxExcessBalCheck[game_,payoff_List,opts:OptionsPattern[MaxExcessBalanced]]:= 
 Block[{rattol,plpr,rvpr,asspay,sij,sji,msrplij,msrplji,msrij,msrji,lthij,tolvec,sysij,sysji,eqQ},
    rattol = OptionValue[RationalTol];
    plpr = PlayerPairs[T];
    rvpr = Reverse[#] & /@ plpr;
    asspay = AssgPay[payoff];
    sij = TIJsets[#[[1]], #[[2]]] & /@ plpr;
    sji = TIJsets[#[[1]], #[[2]]] & /@ rvpr;
    {msrplij,msrplji}= {MaxExcess[sij, asspay],MaxExcess[sji, asspay]};
    {msrij,msrji} = {msrplij - msrplji,msrplji - msrplij};
    lthij = Binomial[Length[T],2];
    tolvec = Array[1.5*rattol &, lthij];
    sysij = Union[MapThread[LessEqual, {Abs[N[msrij]], tolvec}]];
    sysji = Union[MapThread[LessEqual, {Abs[N[msrji]], tolvec}]];
    eqQ = Apply[Join, {sysij, sysji}];
    Apply[And, eqQ]
];

MinExcessBalanced[args___]:=(Message[MinExcessBalanced::argerr];$Failed);
MinExcessBalanced[game_, payoff_List,opts:OptionsPattern[MaxExcessBalanced]]:= Block[{rattol,dimpay},
    rattol = OptionValue[RationalTol]; 
    dimpay = Dimensions[payoff];
    Which[Length[dimpay] === 2,
         Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), MinExcessBalCheck[game, #,RationalTol->rattol] & /@ payoff, 
                       True, PrintRemark[payoff]], 
   Length[dimpay] === 1,
            Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), MinExcessBalCheck[game, payoff,RationalTol->rattol], 
                         True,  PrintRemark[payoff]], 
   True, PrintRemark[payoff]]
];

MinExcessBalCheck[game_,payoff_List,opts:OptionsPattern[MinExcessBalanced]]:= 
 Block[{rattol,plpr, rvpr, asspay,sij,sji,msrplij,msrplji,msrij, msrji,lthij,tolvec,sysij,sysji,eqQ},
    rattol = OptionValue[RationalTol];
    plpr = PlayerPairs[T];
    rvpr = Reverse[#] & /@ plpr;
    asspay = AssgPay[payoff];
    sij = TIJsets[#[[1]], #[[2]]] & /@ plpr;
    sji = TIJsets[#[[1]], #[[2]]] & /@ rvpr;
    {msrplij,msrplji} = {MinExcess[sij, asspay],MinExcess[sji, asspay]};
    {msrij,msrji} = {msrplij - msrplji,msrplji - msrplij};
    lthij = Binomial[Length[T],2];
    tolvec = Table[1.5*rattol, {i, lthij}];
    sysij = Union[MapThread[LessEqual, {Abs[msrij], tolvec}]];
    sysji = Union[MapThread[LessEqual, {Abs[msrji], tolvec}]];
    eqQ = Apply[Join, {sysij, sysji}];
    Apply[And, eqQ]
];

Quota[args___]:=(Message[Quota::argerr];$Failed);
Quota[game_]:= Block[{secsize,matrix},
		 secsize = Reverse[v[DeleteCases[T,#]] & /@ T];
		 matrix = Reverse[Table[If[i==j,0,1],{i,Length[T]},{j,Length[T]}]];   
                 LinearSolve[matrix,secsize]
		   ];

VerticesCore[args___]:=(Message[VerticesCore::argerr];$Failed);
VerticesCore[game_]:=
   Block[{liste,mat,values},
   liste = Table[If[i>=j,1,0],{i,Length[T]},{j,Length[T]}];
   mat = Flatten[Permutations[#] & /@ liste,1];
   AppendTo[mat, -Last[mat]];
   values =v[#]& /@ Rest[Coalitions] ;
   AppendTo[values, -Last[values]];
   VertexEnumeration[-mat,-values]
	  ];


(* Nucleolus/Kernel section starts *)
(* See M. Maschler 1992 for a detailed description of the algorithm (Kopelowitz Algorithm). *)

ModifiedNucleolus[args___]:=(Message[ModifiedNucleolus::argerr];$Failed);
ModifiedNucleolus[game_, opts:OptionsPattern[ModifiedNucleolus]] :=
  Block[{essgQ,propsets,const01,const02,const,var,obf,cmat,bvect,pra,minf,bds,ubds,blg,pbd,zv,rl},
    essgQ=EssentialQ[game];
    If[SameQ[essgQ,False],Print["No solution can be found. Game not essential"];Return[{}]];
    propsets = ProperCoalitions;
    const01 = Flatten[x[{#}] + Global`\[Alpha] >=  v[#] & /@ propsets];
    const02 = MapThread[Equal, {{Total[x[#] & /@ T]}, {v[T]}}];
    const = FlattenAt[Append[const01, const02], Length[const01] + 1];
    var = FlattenAt[{Global`\[Alpha], x /@ T}, 2];
    {obf, cmat, bvect} = LPtoMatrix[Global`\[Alpha], const, var];
    pra = LargestAmount[game];
    minf = v[{#}] &/@ T;
    bds=MapThread[List,{minf,pra}];
    ubds=Union[#] &/@ bds;
    blg = Length[#] &/@ ubds;
    pbd = Position[blg,1];
    If[SameQ[pbd=={},False], 
             zv = Array[Infinity &, Length[pbd]];
             rl = MapThread[Rule,{Flatten[pbd],zv}];
             pra=ReplacePart[pra,rl];
             bds=MapThread[List,{minf,pra}];
      ]; 
    bds = FlattenAt[{{-Infinity,Infinity},bds},2];
    SeqLP[obf, cmat, bvect,bds,{},opts]
    ];

 
ModifiedKernel[args___]:=(Message[ModifiedKernel::argerr];$Failed);
ModifiedKernel[game_, opts:OptionsPattern[ModifiedKernel]] :=
  Block[{essgQ,propsets,const01,const02,const,var,obf,cmat,bvect,pra,minf,bds,ubds,blg,pbd,zv,rl},
    essgQ=EssentialQ[game];
    If[SameQ[essgQ,False],Print["No solution can be found. Game not essential"];Return[{}]];
    propsets = ProperCoalitions;
    const01 = Flatten[x[{#}] + Global`\[Alpha] >=  v[#] & /@ propsets];
    const02 = MapThread[Equal, {{Total[x[#] & /@ T]}, {v[T]}}];
    const = FlattenAt[Append[const01, const02], Length[const01] + 1];
    var = FlattenAt[{Global`\[Alpha], x /@ T}, 2];
    {obf, cmat, bvect} = LPtoMatrix[Global`\[Alpha], const, var];
    pra = LargestAmount[game];
    minf = v[{#}] &/@ T;
    bds=MapThread[List,{minf,pra}];
    ubds=Union[#] &/@ bds;
    blg = Length[#] &/@ ubds;
    pbd = Position[blg,1];
    If[SameQ[pbd=={},False], 
             zv = Array[Infinity &, Length[pbd]];
             rl = MapThread[Rule,{Flatten[pbd],zv}];
             pra=ReplacePart[pra,rl];
             bds=MapThread[List,{minf,pra}];
      ];
    bds = FlattenAt[{{-Infinity,Infinity},bds},2];
    SeqLP2[game,obf, cmat, bvect,bds,{},opts]
    ];


PreNucleolus[args___]:=(Message[PreNucleolus::argerr];$Failed);
PreNucleolus[game_, opts:OptionsPattern[PreNucleolus]] :=
  Block[{propsets,const01,const02,const, var,obf, cmat, bvect,pra,minf,mv,bds},
    propsets = ProperCoalitions;
    const01 = Flatten[x[{#}] + Global`\[Alpha] >=  v[#] & /@ propsets];
    const02 = MapThread[Equal, {{Total[x[#] & /@ T]}, {v[T]}}];
    const = FlattenAt[Append[const01, const02], Length[const01] + 1];
    var = FlattenAt[{Global`\[Alpha], x /@ T}, 2];
    {obf, cmat, bvect} = LPtoMatrix[Global`\[Alpha], const, var];
    pra = LargestAmount[game];
    minf = SmallestContributionVector[game];
    mv=v[{#}] &/@ T;
    If[Min[minf]>Max[mv],minf=mv,True];
(*    minf=Array[-Infinity &, Length[T]]; *)
    bds=MapThread[List,{minf,pra}];
    bds = FlattenAt[{{-Infinity,Infinity},bds},2];
    SeqLP[obf, cmat, bvect,bds,{},opts]
    ];
  

LexiCenter[args___]:=(Message[LexiCenter::argerr];$Failed);
LexiCenter[game_, opts:OptionsPattern[LexiCenter]] := ModifiedNucleolus[game,opts];



EssentialQ[game_]:=Block[{indrat,sumirat,zeroess}, 
   indrat= v[{#}] &/@T;  
   sumirat = Total[indrat];
   zeroess = sumirat<=v[T] 
   ];

(* Formula of the Nucleolus for Three Person Games (cf. Leng and Parlar, 2010)*)

NucleolusThreePerson[args___]:=(Message[NucleolusThreePerson::argerr];$Failed);
NucleolusThreePerson[game_] := 
  Block[{dmQ,cl2,ci,cdi,xd3,cd1,pcd1,ptk,cd4a,cd4b,cd4,pcd4,pcd4b,tkl,tk2,ch,cd2,cd2a,cd2b,tc,cd3a,cd3b,cd3,ccik,pstrQ,cik,ext,sl1,sl2,rl1,rl2,rl3,its,cmp,pk,svl,cl},
    dmQ=SameQ[2^Length[T],2^3];
    If[dmQ,True,Print["Game has incorrect dimension!"];Return[]];
    cl2=Drop[Take[Subsets[T],-4],-1];
    ci=Cases[cl2,{___,#,___}] &/@ T;
    cdi=DeleteCases[cl2,{___,#,___}] &/@ T;
    xd3=First[(v[T] + #)/3] &/@ MapThread[Subtract[#1,#2] &,{Total[Map[v,#]] &/@ ci,2*Map[v,#] &/@ cdi}];
    (* Defining Cases  *)
    If[SameQ[CoreQ[game],False],Print["Case 0"];xd3,
      cd1=GreaterEqual[v[T],3*v[#]] &/@ cl2;
      pcd1=Position[cd1,False];
      ptk=Extract[cl2,pcd1];
      cd4a=Total[2*v[#]] &/@ DeleteCases[cl2,#] &/@ cl2;
      cd4b=v[T]+v[#] &/@ cl2;
      cd4=MapThread[GreaterEqual[#1,#2] &,{cd4b,Total[#] &/@ cd4a}];
      pcd4=Extract[cl2,Position[cd4,True]];
      tk2=Extract[cl2,Position[cd1,False]];
      tkl = Which[SameQ[tk2, {}], {},
                  SameQ[pcd4, {}], {},
                  True, First[Intersection[tk2, pcd4]]];
      ch=Cases[ci,{___,tkl,___}];
      tc=First[Complement[#,{tkl}]] &/@ ch;
      cd2=MapThread[GreaterEqual[#1,#2] &,{{v[T]},#}] &/@ # &/@  (v[#] + 2*(v[#] &/@ DeleteCases[cl2,{___,#,___}] &/@ #) &/@ cl2);
      cd2a=v[T] >= v[tkl] + 2*v[#] &/@ tc;
      cd2b=Apply[Or,cd2a];
      cd3a=GreaterEqual[v[tkl],#] &/@ Map[v[#]&, tc];
      cd3b=Position[cd3a,True];
      cd3=SameQ[cd3b,{}];
      pstrQ=Position[Apply[Or,Flatten[#]] &/@ cd2,True];
      cik = If[SameQ[pstrQ, {}], First[DeleteCases[ci, {___, tkl, ___}]], Extract[ci, pstrQ] // First];
      (*Assigning Payoffs to the Players  *)
      Which[Apply[And,cd1],
                 Print["Case 1"];Array[v[T]/3 &,3],
            SameQ[Apply[Or,cd1],True] && Apply[And, cd2a],
                 Print["Case 2"];
                 ext=Extract[cl2,pcd1];
                 sl1=(v[T] + v[#])/4 &/@ ext;
                 sl2=(v[T] - v[#])/2 &/@ ext;
                 rl1=MapThread[Rule,{{#},sl1}] &/@ Flatten[ext];
                 rl2=MapThread[Rule,{Complement[T,Flatten[ext]],sl2}];
                 T /. Flatten[AppendTo[rl1,rl2]],
            SameQ[cd3,False] && SameQ[cd2b,True],
	        Print["Case 3"];
                ptk = If[Length[ptk] == 1,
                        If[Length[pcd4] == 1,
                           pcd4b = Extract[cl2, Position[cd4, False]];
                           svl = v[#] & /@ pcd4b;
                           cl = First[Extract[pcd4b, Position[svl, Max[svl]]]];
                           {cl, tkl} , pcd4], ptk];
                (* ptk = If[Length[ptk] == 1, pcd4, ptk]; *)
                its=Apply[Intersection,ptk];
                rl1=MapThread[Rule,{its,{Total[v[#] &/@ ptk]/2}}];
                cmp=Complement[tkl,its];
                ccik=Complement[ptk,{tkl}];
                rl2=MapThread[Rule,{cmp,(v[T] - v[#])/2 &/@ ccik}];
                rl3=MapThread[Rule,{Complement[T,tkl],{(v[T] - v[tkl])/2}}];
                T /. Flatten[{rl1, rl2, rl3}],
            Apply[Or,cd4] && SameQ[cd2b,False],
                Print["Case 4"];
                pk=Complement[T,tkl];
                its=First[tkl] //List;
                rl2 = MapThread[Rule,{its,{(v[T] + v[tkl] + 2*Apply[Subtract,v[#] &/@ tc])/4}}];
                cmp=Last[tkl] //List;
                rl1 = MapThread[Rule,{cmp,{(v[T] + v[tkl] - 2*Apply[Subtract,v[#] &/@ tc])/4}}];
                rl3=MapThread[Rule,{pk,{(v[T] - v[tkl])/2}}];
                T /. Flatten[{rl1, rl2, rl3}],
           True,Print["Case 5"];xd3
           ]
      ]
 ];

(* 
 The next function translates the definition of the Nucleolus into
 a sequence of linear programs on the pre-imputation set. 
 To obtain a pre-kernel solution the recursion stops, in general, before
 the nucleolus of the game has been computed. One stopping criterion of 
 the recursion procedure is if the set of new equal constraints is empty. 
 C.f. Owen 1974 and Owen (1995, pp.322-334.)
*)

SeqLP[obf_, cmat_List, bvect_List,bds_List,bA_:{},opts:OptionsPattern[ModifiedNucleolus]] :=
   Block[{filopts,mthd,cmat0,cmat1,meq,beq,lw,up,idm,res,res1,bv,yineq,yeq,zf,bv0,rl2,gr,ps,al1,psal1,ov,ps1,zv,rl,bA1,lb,bA2,ons,wghs,mr,pw,pwQ,extb,bvect1,twv,ps2,rl3,zQ},
    mthd=OptionValue[Method];
    meq=If[SameQ[bA,{}],{Last[cmat]},DeleteCases[DeleteDuplicates[bA],{}]];
    beq=-First[#] &/@ Cases[bvect,{_,0}];
    idm=Drop[IdentityMatrix[Length[T] + 1],1];
    cmat0=Join[Join[cmat,-idm],idm];
    cmat0=SparseArray[cmat0];
    lw=First[#] &/@ Drop[bds,1];
    up=Last[#] &/@ Drop[bds,1];
    bv=-First[#] &/@ bvect;
    bv0=Join[Join[bv,up],-lw];  
    (* ConstraintSensitivity cannot be used with GUROBI. *)
    {res1,{yineq,yeq},zf}=LinearOptimization[obf,{cmat0,bv0},{meq,beq},{"PrimalMinimizer","ConstraintSensitivity","PrimalMinimumValue"},Method->mthd];
    res=Drop[res1,1];
    If[SameQ[zf,-Infinity],Return[Rationalize[res,10^(-9)]]];
    gr=Less[#,0] &/@ yineq;
    ps = Flatten[Position[gr,True]];
    al1 = First[#] &/@ cmat;
    psal1 = Flatten[Position[al1,0]];
    ps = Complement[ps,psal1];
    If[SameQ[ps,{}],Return[Rationalize[res,10^(-9)]]];
    slc=Position[Less[#,First[Dimensions[cmat]]] & /@ ps,True];
    ps=Extract[ps,slc]; 
    ov = Array[1 &,Length[ps]];
    ps1 = MapThread[List,{ps,ov}];
    zv = Array[0 &,Length[ps]];
    rl = MapThread[Rule,{ps1,zv}];
    cmat1=ReplacePart[cmat,rl];
    bA1=Cases[cmat1,{0,___}];
    lb = Length[bA];
    bA2=FlattenAt[Append[bA,bA1],lb+1];
    bA2=Drop[#,1] &/@ bA2;
    ons = Array[1 &,Length[T]];
    wghs=PseudoInverse[Transpose[bA2]].ons;
    mr = MatrixRank[bA2];
    pw=Positive[wghs];
    pwQ=Apply[And,pw];
    If[SameQ[mr,Length[T]] && SameQ[pwQ,True],Return[Rationalize[res,10^(-9)]]];
    (* cmat1=Complement[cmat1, bA1];*)
    bA1=If[SameQ[bA,{}],Join[bA1,{Drop[meq,1]}],bA1];
    bA1=DeleteCases[bA1,{}];
    extb=Extract[bvect,ps1]-Rationalize[res1[[1]],10^(-9)];
    rl2 = MapThread[Rule,{ps1,extb}];
    bvect1=ReplacePart[bvect,rl2];
    twv = Array[2 &,Length[ps]];
    ps2 = MapThread[List,{ps,twv}];
    rl3 = MapThread[Rule,{ps2,zv}];
    bvect1=ReplacePart[bvect1,rl3];
    zQ = Select[First[#] &/@ cmat1,#==1 &];
    If[SameQ[zQ,{}],res,SeqLP[obf,cmat1,bvect1,bds,bA1,Method->mthd]]
];


SeqLP2[game_,obf_, cmat_List, bvect_List,bds_List,bA_:{},opts:OptionsPattern[ModifiedKernel]] :=
      Block[{filopts,mthd,cmat1,dl1,dl2,dl3,dl4,pkQ,gr,ps,al1,psal1,ov,rl2,res,ps1,zv,rl,bA1,lb,bA2,ons,wghs,mr,pw,pwQ,extb,bvect1,twv,ps2,rl3,zQ},
    mthd=OptionValue[Method];
    meq=If[SameQ[bA,{}],{Last[cmat]},DeleteCases[DeleteDuplicates[bA],{}]];
    beq=-First[#] &/@ Cases[bvect,{_,0}];
    idm=Drop[IdentityMatrix[Length[T] + 1],1];
    cmat0=Join[Join[cmat,-idm],idm];
    cmat0=SparseArray[cmat0];
    lw=First[#] &/@ Drop[bds,1];
    up=Last[#] &/@ Drop[bds,1];
    bv=-First[#] &/@ bvect;
    bv0=Join[Join[bv,up],-lw]; 
    {res1,{yineq,yeq},zf}=LinearOptimization[obf,{cmat0,bv0},{meq,beq},{"PrimalMinimizer","ConstraintSensitivity","PrimalMinimumValue"},Method->mthd];
    res=Drop[res1,1];
    pkQ = KernelImputationQ[game,Rationalize[res,10^(-9)]];
    If[SameQ[pkQ,True],Return[Rationalize[res,10^(-9)]]];
    If[SameQ[zf,-Infinity],Return[Rationalize[res,10^(-9)]]];
    gr=Less[#,0] &/@ yineq;
    ps = Flatten[Position[gr,True]];
    al1 = First[#] &/@ cmat;
    psal1 = Flatten[Position[al1,0]];
    ps = Complement[ps,psal1];
    If[SameQ[ps,{}],Return[Rationalize[res,10^(-9)]]];
    slc=Position[Less[#,First[Dimensions[cmat]]] & /@ ps,True];
    ps=Extract[ps,slc];
    ov = Array[1 &,Length[ps]];
    ps1 = MapThread[List,{ps,ov}];
    zv = Array[0 &,Length[ps]];
    rl = MapThread[Rule,{ps1,zv}];
    cmat1=ReplacePart[cmat,rl];
    bA1=Cases[cmat1,{0,___}];
    lb = Length[bA];
    bA2=FlattenAt[Append[bA,bA1],lb+1];
    bA2=Developer`ToPackedArray[Drop[#,1] &/@ bA2];
    ons = Array[1 &,Length[T]];
    wghs=PseudoInverse[Transpose[bA2]].ons;
    mr = MatrixRank[bA2];
    pw=Positive[wghs];
    pwQ=Apply[And,pw];
    If[SameQ[mr,Length[T]] && SameQ[pwQ,True],Return[Rationalize[res,10^(-9)]]];
    bA1=If[SameQ[bA,{}],Join[bA1,{Drop[meq,1]}],bA1];
    bA1=DeleteCases[bA1,{}];
    extb=Extract[bvect,ps1]-Rationalize[res1[[1]],10^(-9)];
    rl2 = MapThread[Rule,{ps1,extb}];
    bvect1=ReplacePart[bvect,rl2];
    twv = Array[2 &,Length[ps]];
    ps2 = MapThread[List,{ps,twv}];
    rl3 = MapThread[Rule,{ps2,zv}];
    bvect1=ReplacePart[bvect1,rl3];
    zQ = Select[First[#] &/@ cmat1,#==1 &];
    If[SameQ[zQ,{}],res,SeqLP2[game,obf,cmat1,bvect1,bds,bA1,Method->mthd]]
];


(*
In this section, we provide two functions to calculate the pre-nucleolus as well as the nucleolus, which have been invented by L. M. Ruiz, F. Valenciano, and J. M. Zarzuelo (1996).
*)   

LSPreNuc[args___]:=(Message[LSPreNuc::argerr];$Failed);
LSPreNuc[game_]:=Block[{av,lt,pd,sS,Si,Sni,vi,vni,lci,lcni,pdi,pdni,sm1,sm2,sd1},
		 lt=Length[T];
                 av=v[T]/lt;
	         pd=(1/(lt*2^(lt-2)));
	         sS=Delete[Subsets[T],1];
	         Si=Cases[sS,{___,#,___}] &/@ T;
                 Sni=DeleteCases[sS,{___,#,___}] &/@ T;
		 vi=Map[v[#] &/@ Si[[#]] &,T ];
		 vni=Map[v[#] &/@ Sni[[#]] &,T ];
		 lci=Map[lt-Length[#] &/@ Si[[#]] &,T];
		 lcni=Map[Length[#] &/@ Sni[[#]] &,T];
		 pdi=vi[[#]]*lci[[#]] &/@ T;
		 pdni=vni[[#]]*lcni[[#]] &/@ T;
		 sm1=(Plus @@ #) &/@ pdi; 
		 sm2=(Plus @@ #) &/@ pdni;
		 sd1=av+pd*(sm1-sm2)
		 ];

LSNuc[args___]:=(Message[LSNuc::argerr];$Failed);
LSNuc[game_]:=Block[{lt,av,sV,sN,sS,Si,vi,lci,nV,py,ngQ,cM,mM},
                 lt=Length[T];
                 av=v[T]/lt;
		 sN=2^(lt-2);
	         sS=Delete[Subsets[T],1];
	         Si=Cases[sS,{___,#,___}] &/@ T;
		 vi=Map[v[#] &/@ Si[[#]] &,T ];
		 lci=Map[Length[#] &/@ Si[[#]] &,T];
                 sV=Map[Plus @@ # &,vi];
		 nV=Plus @@ sV;    
		 py=av+(lt*sV-nV)/(lt*sN);
		 ngQ=Negative[#] &/@ py;
		 mM=Flatten[Position[ngQ,True]];
		 If[SameQ[mM,{}],Return[py],
                 cM=Complement[T,mM];
                 fLSnc[py,cM,mM,lt]
		 ]      
		 

	      ];


fLSnc[pyf_List,cmpM_List,stM_List,n_]:=Block[{M0,xm,lm,zv,cpM,pyM,tpy,cmpPy,rlcmp,rlp,py,pcM,ngQ,mM,nM,cM},
          M0=stM;
          py=If[SameQ[SameQ[cmpM,{}],False],
	     pyM=Extract[pyf,Partition[stM,1]];	
	     xm=Plus @@ pyM;
	     lm=Length[stM];
	     zv=Table[0,lm];
	     pcM=Partition[cmpM,1];
	     tpy=Extract[pyf,pcM];
	     cmpPy=tpy + xm/(n-lm);
	     rlcmp=MapThread[Rule,{cmpM,cmpPy}];
	     rlp=MapThread[Rule,{stM,zv}];
	     ReplacePart[ReplacePart[pyf,rlcmp],rlp],True];
          ngQ=Negative[#] &/@ py;					      
          mM=Flatten[Position[ngQ,True]];
          nM=Sort[Flatten[Append[stM,mM]]];
	  cM=Complement[T,nM];				      
	  If[SameQ[M0,nM],Return[py],fLSnc[py,cM,nM,n]]				      

	 ];


(*
In this section, we introduce a set of functions to compute the pre-nucleolus by a Fenchel Transform Method. This is just a conjecture,
and it is a combination of the the approach discussed in Meinhardt (2013) and Kido (2004,2005,2008).

*)   

FTPreNuc[game_,tol_:10^(-2),jj_:2]:=Block[{pk,vars,xpk,mcl,tol1,pmcl,clm,lcm,cex,rC,rexc,sme,mtr,smtr,slc,sC,lc,ls,sz},
                      pk=PreKernel[game];
		      vars=x[#] &/@ T;
                      pmcl=FTCoalArray[game,pk,tol];
		      Print["pmcl=",pmcl];
		      clm=pmcl[[1]];
		      lcm=pmcl[[2]];
		      cex=pmcl[[3]];
		      rC=pmcl[[4]];
		      rexc=pmcl[[5]];
		      If[SameQ[Last[lcm],1],
			 sme=Last[Sort[rexc],1]; (*Sorting is ascending order. *) 
			 mtr=Abs[Subtract[#,sme]]<=tol &/@ rexc;
	                 smtr=Position[mtr,True];			 
			 {slc,sC}=Extract[#,smtr] &/@ {rexc,rC};
			 {ls,lc,sz}=Length[#] &/@ {clm,sC,lcm};
			 {clm,cex}=MapThread[Append,{{clm,cex},{sC,slc}}];
			 clm=FlattenAt[clm,ls+1];
			 lcm=ReplacePart[lcm,sz->lc+1];,
			 False];
		      mcl=MapThread[Prepend,{{clm,lcm,cex},{T,1,0}}];
		      tol1=10^(-jj);
                      If[clm=={} && jj<11,
			 FTPreNuc[game,tol1,jj+1],
			 If[SameQ[mcl,{{},{},{}}],
				 Return[$Failed],
				 FormPreNuc[game,tol1,jj,mcl,vars]
			 ]
		      ]
					     ];


FormPreNuc[game_,tol_,jj_,iim_List,xvars_List]:=Block[{lsg},
                      lsg=Flatten[FindSolX[iim,xvars]];
                      If[SameQ[lsg,{}] && jj <11,FTPreNuc[game,tol,jj+1],
		       If[SameQ[lsg,{}],Return[$Failed],xvars /. lsg]]
					   ];



FTCoalArray[game_,payoff_,tol_]:=Block[{sC,irQ,irc,slir,b0,I0,excpay,lI0,zv},
	        sC=Delete[Delete[Subsets[T],1],-1];
		lt=Length[T];				  
                excpay=Delete[Delete[Flatten[ExcessPayoff[game,payoff]],1],-1];
                PnSelectFTMCR[excpay,sC,lt,tol,{},{},{}]
				     ];


(* We set the default of blQ to True in order to allow a return if mrk==lt on the first iteration.*)
PnSelectFTMCR[exc_List,sC_,lt_,tol_,pIk_:{},plIk_:{},pslex_:{},blQ_:True,mtrk_:0]:=Block[{mtr,smtr,slc,sS,lS,sC1,Im,bQ,mt,mrk,exc1,slex1,lIm1},
                mtr=Abs[Subtract[#,Max[exc]]]<=tol &/@ exc;
	        smtr=Position[mtr,True];
	        {slc,sS}=Extract[#,smtr] &/@ {exc,sC};
		lS=Length[sS];				
		sC1=Delete[sC,smtr];
		Im=DeleteDuplicates[Join[pIk,sS]];
		lIm1=Join[plIk,{lS}];
                bQ=First[BalancedSystemQ[Im, T]];
	        (* bQ=BalancedSelectionQ[Im,tol,Tight->True]; *)
                mt = ConstVec[Im];
                mrk = MatrixRank[mt];
		(*
		  If blQ==True, but bQ==False with mrk==mtrk, then the new sets are still in the span.
		  However, if mrk>mtrk and bQ==False, the collection of sets ought to be
		  discarded during the next iteration.
		*)
		If[SameQ[blQ,True] && LessEqual[mtrk,mrk],bQ=True,False];
	        slex1=Flatten[Append[pslex,slc]];
		exc1=Delete[exc,smtr];
		If[SameQ[mrk,lt] && SameQ[bQ,True],
		   {Im,lIm1,slex1,sC1,exc1},
		   If[SameQ[bQ,True],
		      PnSelectFTMCR[exc1,sC1,lt,tol,Im,lIm1,slex1,bQ,mrk],
		      {{},{},{}}
		   ]
		]
							     ];






(*
In this section, we provide a set of functions that compute the nucleolus by a non-linear optimization method (cf. Kido 2003,2005,2008). Based on this idea, we extend this approach to the pre-nucleolus too.

*)   

NonLinPreNuc[game_,p_,k_,opts:OptionsPattern[NonLinNuc]]:=Block[{mthd},
     mthd=OptionValue[Method];
     NonLinPreNuc[game,p,k,10^(-2),2,Method->mthd]
];



NonLinPreNuc[game_,p_,k_,tol_:10^(-2),jj_:2,opts:OptionsPattern[NonLinPreNuc]]:=Block[{mthd,sar,vars,xpk,mcl,tol1,pmcl,clm,lcm,cex},
                      mthd=OptionValue[Method];
                      sar=ApproxPreNuc[game,p,k,Method->mthd];
                      vars=x[#] &/@ T;
                      xpk=vars /. sar[[2]];
                      pmcl=PnModCoalArray[game,xpk,tol];
                      clm=pmcl[[1]];
                      lcm=pmcl[[2]];
                      cex=pmcl[[3]];
                      PrependTo[clm,T];
                      PrependTo[lcm,1];
                      PrependTo[cex,0];
                      mcl={clm,lcm,cex};
                      (* mcl=MapThread[Prepend,{pmcl,{T,1,0}}]; *)
                      tol1=10^(-jj);
                      If[clm=={} && jj<11,
                         NonLinPreNuc[game,p,k,tol1,jj+1,Method->mthd],
                         If[SameQ[mcl,{{},{},{}}],
                                 Return[$Failed],
                                 FormatPreNuc[game,p,k,tol1,jj,mcl,vars]
                         ]
                      ]
                                                                           
           ];


FormatPreNuc[game_,p_,k_,tol_,jj_,iim_List,xvars_List]:=Block[{lsg},
                      lsg=Flatten[FindSolX[iim,xvars]];
                      If[SameQ[lsg,{}] && jj <11,NonLinPreNuc[game,p,k,tol,jj+1],
                       If[SameQ[lsg,{}],Return[$Failed],xvars /. lsg]]
            ];

NonLinNuc[game_,p_,k_,opts:OptionsPattern[NonLinNuc]]:=Block[{mthd},
     mthd=OptionValue[Method];
     NonLinNuc[game,p,k,10^(-2),2,Method->mthd]
];

NonLinNuc[game_,p_,k_,tol_:10^(-2),jj_:2,opts:OptionsPattern[NonLinNuc]]:=Block[{sar,vars,xpk,mcl,tol1,mthd},
                      mthd=OptionValue[Method];
                      sar=ApproxNuc[game,p,k,Method->mthd];
                      vars=x[#] &/@ T;
                      xpk=vars /. sar[[2]];
                      mcl=ModCoalArray[game,xpk,tol];
                      tol1=10^(-jj);
                      If[mcl=={} && jj<11,NonLinNuc[game,p,k,tol1,jj+1,Method->mthd],FormatSol[game,p,k,tol1,jj,mcl,vars]]
        ];


FormatSol[game_,p_,k_,tol_,jj_,iim_List,xvars_List]:=Block[{lsg},
                      lsg=Flatten[FindSolX[iim,xvars]];
                      If[SameQ[lsg,{}] && jj <11,NonLinNuc[game,p,k,tol,jj+1],
                       If[SameQ[lsg,{}],Return[$Failed],xvars /. lsg]]
        ];


FormatPreNuc[game_,p_,k_,tol_,jj_,iim_List,xvars_List]:=Block[{lsg},
                      lsg=Flatten[FindSolX[iim,xvars]];
                      If[SameQ[lsg,{}] && jj <11,NonLinPreNuc[game,p,k,tol,jj+1],
                       If[SameQ[lsg,{}],Return[$Failed],xvars /. lsg]]
            ];


FindSolX[ssz_List,vars_List]:=Block[{sys,eqsys},
                           sys=(v[#]-x[#]) &/@ ssz[[1]];  
                           eqsys=SolveSys[sys,ssz[[2]],ssz[[3]]];
                           If[NumberQ[eqsys],Return[{}],Solve[eqsys,vars]]
        ];

SolveSys[bsys_List,iim_List,exc_List,glsys_:{},idx_:1]:=Block[{lg,gls,eq,zv,vexc,rsys,nwgl,riim,rexc},
                     gls=Take[bsys,First[iim]];
                     lg=Length[gls];
                     If[exc=={} && lg==1,True,vexc=Take[exc,First[iim]]];
                     eq=If[idx==1,
                           zv=Table[0,lg];
                           MapThread[Equal,{gls,zv}],
                           If[lg>1,Apply[Equal,gls],
                             Print["Warning:: An isolated excess found!"];
                             Print["Solution might not be correct!!!"];
                             MapThread[Equal,{gls,vexc}]]
                        ];
                     nwgl=Append[glsys,eq];                                   
                     rsys=Drop[bsys,First[iim]];
                     rexc=Drop[exc,First[iim]];
                     riim=Delete[iim,1];                     
                     If[riim=={},
                        Flatten[nwgl],
                        SolveSys[rsys,riim,rexc,nwgl,idx+1]
                      ]
                     ];



ApproxNuc[game_,p_,k_,opts:OptionsPattern[ApproxNuc]]:=Block[{mthd,lt,obj,const,rl,vars,sC,pexc,vi,eq},
                        mthd=OptionValue[Method];
                        vars = x[#] &/@ T;
                        lt=Length[T];       
                        sC=Delete[Subsets[T],1];
                        pexc=(v[#]-x[#]-k1)^p1 &/@ sC;
                        rl=MapThread[Rule,{{p1,k1},{p,k}}];
                        obj = Total[pexc] /. rl;
                        vi=v[#] &/@ Take[sC,lt];
                        const=Apply[And,MapThread[GreaterEqual,{vars,vi}]];
                        eq=Total[vars]==v[T];
                        AppendTo[const,eq];
                        NMinimize[Prepend[{const},obj],vars,Method->mthd]
                        ];

ModCoalArray[args___]:=(Message[ModCoalArray::argerr];$Failed);
ModCoalArray[game_,payoff_,tol_:10^(-7)]:=Block[{sC,lt,prl,irQ,irc,slir,b0,I0,excpay,lI0,zv},
    sC=Delete[Delete[Subsets[T],1],-1];
    lt=Length[T];                             
    prl=Payoff[payoff];
    irQ=Map[Abs[v[{#}]-x[#]]<=tol &,T] /.prl;
    irc={#} &/@ T;
    slir=Position[irQ,True];
    b0=Extract[irc,slir];
    I0=Union[{T},b0];
    lI0=Length[I0];
    zv=Table[0,lI0];
    excpay=Delete[Delete[Flatten[ExcessPayoff[game,payoff]],1],-1];
    SelectMCR[excpay,sC,lt,tol,I0,{lI0},zv]
 ];

PnModCoalArray[game_,payoff_,tol_]:=Block[{sC,lt,excpay},
    sC=Delete[Delete[Subsets[T],1],-1];
    lt=Length[T];                             
    excpay=Delete[Delete[Flatten[ExcessPayoff[game,payoff]],1],-1];
    PnSelectMCR[excpay,sC,lt,tol,{},{},{}]
   ];


SelectMCR[exc_List,sC_,lt_,tol_,Ik_:{},lIk_:{},slex_:{0},blQ_:False,mtrk_:0]:=Block[{mtr,smtr,slc,sS,lS,sC1,Im,mrk,bQ,mt,mkr,exc1,slex1,lIm1},
     mtr=Abs[Subtract[#,Max[exc]]]<=tol &/@ exc;
     smtr=Position[mtr,True];
     slc=Extract[exc,smtr];
     sS=Extract[sC,smtr];
     lS=Length[sS];                          
     sC1=Delete[sC,smtr];
     Im=Join[Ik,sS];
     lIm1=Join[lIk,{lS}];
     bQ=First[BalancedSystemQ[Im, T]];
     (* bQ=IIMBalancedSelectionQ[Im,tol,Tight->True]; *)
     mt = ConstVec[Im];
     mrk = MatrixRank[mt];
     (*
     If blQ==True, but bQ==False with mrk==mtrk, then the new sets are still in the span.
     However, if mrk>mtrk and bQ==False, the collection of sets ought to be
     discarded during the next iteration.
      *)
     If[SameQ[blQ,True] && LessEqual[mtrk,mrk],bQ=True,False];
     slex1=Flatten[Append[slex,slc]];
     exc1=Delete[exc,smtr];
     If[SameQ[mrk,lt] && SameQ[bQ,True],
       {Im,lIm1,slex1},
       If[bQ==True,
          SelectMCR[exc1,sC1,lt,tol,Im,lIm1,slex1,bQ,mrk],
          {}
       ]
     ]
 ];

PnSelectMCR[exc_List,sC_,lt_,tol_,pIk_:{},plIk_:{},pslex_:{},blQ_:False,mtrk_:0]:=Block[{mtr,smtr,slc,sS,lS,sC1,mrk,Im,bQ,mt,mkr,exc1,slex1,lIm1},
    mtr=Abs[Subtract[#,Max[exc]]]<=tol &/@ exc;
    smtr=Position[mtr,True];
    slc=Extract[exc,smtr];
    sS=Extract[sC,smtr];
    lS=Length[sS];                          
    sC1=Delete[sC,smtr];
    Im=Join[pIk,sS];
    lIm1=Join[plIk,{lS}];
    bQ=First[BalancedSystemQ[Im, T]];
(*    bQ=BalancedSelectionQ[Im,tol,Tight->True]; *)
    mt = ConstVec[Im];
    mrk = MatrixRank[mt];
    (*
     If blQ==True, but bQ==False with mrk==mtrk, then the new sets are still in the span.
     However, if mrk>mtrk and bQ==False, the collection of sets ought to be
     discarded during the next iteration.
     *)
     If[SameQ[blQ,True] && LessEqual[mtrk,mrk],bQ=True,False];
     slex1=Flatten[Append[pslex,slc]];
     exc1=Delete[exc,smtr];
     If[SameQ[mrk,lt] && SameQ[bQ,True],
       {Im,lIm1,slex1},
       If[SameQ[bQ,True],
         PnSelectMCR[exc1,sC1,lt,tol,Im,lIm1,slex1,bQ,mrk],
         {{},{},{}}
         ]
      ]
  ];



IIMBalancedSelectionQ[selcoal_List, tol_,opts:OptionsPattern[BalancedSelectionQ]]:= 
 Block[{tig,ufs,sysvec,lt,tol1,wghvec1,tolv,mrk,onesvec,wghvec,chres,poswghQ,posQ,addoneQ,oneQ,balcQ},
     tig =  OptionValue[Tight];
     ufs=Union[Flatten[selcoal]];
     If[SameQ[ufs,T],True,Return["False"]];
     sysvec = Developer`ToPackedArray[ConstVec[selcoal]];
     mrk = MatrixRank[sysvec];
     lt = Length[T];
     If[SameQ[tig,True],True,If[mrk<lt, Return["False"],True]]; 
     onesvec = Table[1, {i, Length[T]}];
     wghvec = PseudoInverse[Transpose[sysvec]].onesvec;
     tol1=Min[{tol,10^(-5)}];
     wghvec1=wghvec+tol1;
(* Trying to find a balanced sub-collection *)
     Which[MemberQ[wghvec1,0],{wghvec,sysvec}=ReduceMatrix[wghvec1,sysvec,T,onesvec],
          Apply[Or,Negative[wghvec1]],{wghvec,sysvec}=ReduceRkMatrix[wghvec1,sysvec,T,onesvec], 
          True,wghvec];
     chres =  Dot[Transpose[sysvec], wghvec];
     (* Print["chres=",chres];*)
     poswghQ = Apply[And, Positive[#] & /@ wghvec1];
     (* Print["wghvec=",wghvec];
     Print["poswghQ=",poswghQ];*)
     posQ = Apply[And, poswghQ];
     tolv=Table[tol1,{i,Length[T]}];
     addoneQ = MapThread[LessEqual,{Abs[Subtract[chres, onesvec]],tolv}];
     (* Print["addoneQ=",addoneQ]; *)
     oneQ = Apply[And, addoneQ];
     balcQ = And[posQ, oneQ];
     (* Print["balcQ=",balcQ];*)
     Return[balcQ];
];



ApproxPreNuc[game_,p_,k_,opts:OptionsPattern[ApproxPreNuc]]:=Block[{mthd,obj,const,lt,ra,rl,vars,sC,pexc,vi,eq},
      vars = x[#] &/@ T;
      mthd=OptionValue[Method];
      lt=Length[T];       
      sC=Delete[Subsets[T],1];
      pexc=(v[#]-x[#]-k1)^p1 &/@ sC;
      rl=MapThread[Rule,{{p1,k1},{p,k}}];
      obj = Total[pexc] /. rl;
      ra=ReasonableOutcome[game];
      const=Apply[And,MapThread[LessEqual,{vars,ra}]];
      (* Print["const=",const]; *)       
      eq=Total[vars]==v[T];
      AppendTo[const,eq];
      NMinimize[Prepend[{const},obj],vars,Method->mthd]
  ];



(* This section is designated to the Modiclus Modified and Proper Modified Pre-Kernel *) 


(* Thm (Sudhoelter 1997, Thm 1.4): The projection of the pre-nucleolus of the the dual cover game
   onto the player set T gives the modiclus of the original game.  *)

Modiclus[args___]:=(Message[Modiclus::argerr];$Failed);
Modiclus[game_,opts:OptionsPattern[Modiclus]] := 
 Block[{mthd,ovls, dcvals, lt, t0, t1, DCGame, mdnc},
  mthd=OptionValue[Method];
  ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
  t0 = T; (* Storing original game values. *)
  dcvals = DualCover[game];
  lt = Length[T];
  t1 = Range[2*lt];
  DCGame = DefineGame[t1, dcvals];
  mdnc = PreNucleolus[DCGame,Method->mthd];
  DefineGame[t0, ovls]; (* Redefine the original game. *)
  Take[mdnc, lt]
  ];

IsModiclusQ[args___]:=(Message[IsModiclusQ::argerr];$Failed);

IsModiclusQ[game_,payoff_List,opts:OptionsPattern[IsModiclusQ]] := 
 Block[{mthd,ovls, dcvals, lt, t0, t1, dpay, DCGame, bcQ},
  mthd=OptionValue[Method];
  If[SameQ[Total[payoff] - v[T], 0] && Apply[And,NumericQ[#] &/@ payoff], True, Return[False]];
  ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
  t0 = T; (* Storing original game values. *)
  dcvals = DualCover[game];
  lt = Length[T];
  t1 = Range[2*lt];
  DCGame = DefineGame[t1, dcvals];
  dpay= Flatten[{payoff,payoff}];
  bcQ = BalancedCollectionQ[DCGame,dpay,Method->mthd];
  DefineGame[t0, ovls]; (* Redefine the original game. *)
  Return[bcQ]
  ];


ModPreKernel[args___]:=(Message[ModPreKernel::argerr];$Failed);
ModPreKernel[game_,opts:OptionsPattern[ModPreKernel]] := 
  Block[{pay},
  pay = Table[v[T],{Length[T]}]/Length[T];
  ModPreKernel[game,pay,opts]
 ];

ModPreKernel[game_, payoff_List, opts:OptionsPattern[ModPreKernel]] := Block[{dimpay,rclim}, 
      dimpay = Dimensions[payoff]; 
      rclim=If[Length[T] > 11,1024,512];
      Which[Length[dimpay]===2, 
                       Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), Block[{$RecursionLimit = rclim}, FuncModPreKernel[game,#, opts]&/@ payoff //Union],
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), Block[{$RecursionLimit = rclim},FuncModPreKernel[game, payoff,  opts]], 
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];

(* Main Functions *)

FuncModPreKernel[game_, payoff_List, opts:OptionsPattern[ModPreKernel]] := 
Block[{sil, smc, optst, pinv, ovls, t0, dcvals, dcgame, doi, optstep, itpay,tol,brc},
    sil = OptionValue[Silent];
    smc = OptionValue[SmallestCardinality];     
    optst = OptionValue[CalcStepSize];
    pinv = OptionValue[PseudoInv];
    ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
    t0 = T; (* Storing original game values. *)
    dcvals = ECCoverGame[game,payoff];
    dcgame = DefineGame[t0, dcvals];       
    {optstep, doi} = Developer`ToPackedArray[DirectionOfImprovement[dcgame, payoff, MaximumSurpluses -> False, CalcStepSize -> optst, PseudoInv->pinv,Silent -> sil, SmallestCardinality -> smc]];
    If[SameQ[sil,False], Print["doi=", doi], True];
    If[SameQ[sil,False], Print["optstep=", optstep], True];
    itpay =  payoff + optstep*doi;
    If[SameQ[sil,False], Print["itpay=", itpay], True];
    If[Depth[itpay]!=2,Return[payoff],True];
    tol=Table[1.5*10^(-6),{Length[T]}];
    brc=Apply[And,MapThread[LessEqual[#1,#2] &,{Abs[doi],tol}]];
    DefineGame[t0, ovls];   
    If[SameQ[brc,True], Rationalize[N[itpay],10^(-6)], FuncModPreKernel[game, itpay, CalcStepSize -> optst, Silent -> sil, SmallestCardinality -> smc]] 
];

ProperModPreKernel[args___]:=(Message[ProperModPreKernel::argerr];$Failed);
ProperModPreKernel[game_,opts:OptionsPattern[ProperModPreKernel]] := Block[{ovls, dcvals, lt, t0, t1, dcpay,DCGame, mdnc},
  ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
  t0 = T; (* Storing original game values. *)
  dcvals = DualCover[game];
  lt = Length[T];
  t1 = Range[2*lt];
  dcpay=Table[v[T], Length[t1]]/2*Flatten[Append[{1, 1}, Array[0 &, Length[t1] - 2]]];
  DCGame = DefineGame[t1, dcvals];
  mdnc = PreKernelSolution[DCGame,dcpay,opts];
  DefineGame[t0, ovls]; (* Redefine the original game. *)
  Take[mdnc, lt]
  ];


ProperModPreKernel[game_,payoff_List,opts:OptionsPattern[ProperModPreKernel]] := Block[{ovls, dcvals, lt, t0, t1, DCGame, mdnc,dcpay},
  ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
  t0 = T; (* Storing original game values. *)
  dcvals = DualCover[game];
  lt = Length[T];
  t1 = Range[2*lt];
  dcpay=Flatten[{payoff,payoff}];
  DCGame = DefineGame[t1, dcvals];
  mdnc = PreKernelSolution[DCGame,dcpay,opts];
  DefineGame[t0, ovls]; (* Redefine the original game. *)
  Take[mdnc, lt]
];

IsModPreKernelQ[args___]:=(Message[IsModPreKernelQ::argerr];$Failed);

IsModPreKernelQ[game_, payoff_List] := 
 Block[{ovls, dcvals, lt, t0, t1, DCGame, pmpkQ},
  Which[SameQ[Total[payoff] - v[T], 0], True, 
        Apply[And,NumericQ[#] &/@ payoff], True, 
        True, Return[False]];
  ovls = v[#] & /@ Coalitions;(*Storing original game values.*)
  t0 = T;(*Storing original game values.*)
  dcvals = ECCoverGame[game, payoff];
  DCGame = DefineGame[t0, dcvals];
  pmpkQ = PreKernelQ[DCGame, payoff];
  DefineGame[t0, ovls];(*Redefine the original game.*)
  Return[pmpkQ]];

IsProperModPreKernelQ[args___]:=(Message[IsProperModPreKernelQ::argerr];$Failed);

IsProperModPreKernelQ[game_,payoff_List] := Block[{ovls, dcvals, lt, t0, t1, dpay, DCGame, pmpkQ},
  Which[SameQ[Total[payoff] - v[T], 0], True, 
        Apply[And,NumericQ[#] &/@ payoff], True, 
        True, Return[False]];
  ovls = v[#] & /@ Coalitions; (* Storing original game values. *)
  t0 = T; (* Storing original game values. *)
  dcvals = DualCover[game];
  lt = Length[T];
  t1 = Range[2*lt];
  DCGame = DefineGame[t1, dcvals];
  dpay= Flatten[{payoff,payoff}];
  pmpkQ = PreKernelQ[DCGame,dpay];
  DefineGame[t0, ovls]; (* Redefine the original game. *)
  Return[pmpkQ]
  ];

(* Dual Extension of the primal game *)

DualExtension[args___]:=(Message[DualExtension::argerr];$Failed);
DualExtension[game_] := Block[{lt, T1, cl1, clset, vlset, dlext,vals},
  lt = Length[T];
  T1 = Range[lt + 1, 2*lt];
  cl1 = Subsets[T1];
  clset = Table[Join[Coalitions[[i]], #] & /@ cl1, {i, 1, Length[cl1]}];
  vlset = Table[v[Coalitions[[i]]] + v[T] - v[Complement[T, #]] & /@ Coalitions, {i, 1, Length[cl1]}];
  dlext = Flatten[MapThread[MapThread[List[#1, #2] &, {#1, #2}] &, {clset, vlset}], 1] // Sort;
  vals = Last[#] & /@ dlext;
  {vals, dlext}
  ];


(* Primal Extension of the dual game *)
PrimalExtension[args___]:=(Message[PrimalExtension::argerr];$Failed);
PrimalExtension[game_] := 
 Block[{lt, T1, cl1, clset, vlset, plext,vals},
  lt = Length[T];
  T1 = Range[lt + 1, 2*lt];
  cl1 = Subsets[T1];
  clset = Table[Join[Coalitions[[i]], #] & /@ cl1, {i, 1, Length[cl1]}];
  vlset = Table[v[#] + v[T] - v[Complement[T, Coalitions[[i]]]] & /@ Coalitions, {i, 1, Length[cl1]}];
  plext = Flatten[MapThread[MapThread[List[#1, #2] &, {#1, #2}] &, {clset, vlset}], 1] // Sort;
  vals = Last[#] & /@ plext;
  {vals, plext}
 ];

DualCover[args___]:=(Message[DualCover::argerr];$Failed);
DualCover[game_] := Block[{dvals, dexts, pvals, pexts},
  {dvals, dexts} = DualExtension[game];
  {pvals, pexts} = PrimalExtension[game];
  MapThread[Max[#1, #2] &, {dvals, pvals}]
  ];



ModECCoverGame[game_, payoff_] := 
 Block[{exc, mexc, dv, sx, df, assg, dmexc, pvals, dvals, vals},
  exc = ExcessPayoff[game, payoff];
  mexc = Max[exc];
  dv = (v[T] - v[#]) & /@ Reverse[Coalitions];
  assg = MapThread[Rule, {Map[x, T], payoff}];
  sx = x[#] & /@ Coalitions /. assg;
  df = dv - sx;
  dmexc = Max[df];
  pvals = v[#] + dmexc & /@ Coalitions;
  dvals = dv + mexc;
  vals = MapThread[Max[#1, #2] &, {pvals, dvals}];
  vals = Drop[vals, -1];
  Flatten[{vals, v[T]}]
  ];

ECCoverGame[args___]:=(Message[ECCoverGame::argerr];$Failed);
ECCoverGame[game_, payoff_] := 
 Block[{exc, mexc, dv, sx, df, assg, dmexc, pvals, dvals, vals},
  exc = ExcessPayoff[game, payoff];
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

(* End of the section designated to the Modiclus Modified and Proper Modified Pre-Kernel *)

(* Start of the section related to the simplified modified pre-kernel/nucleolus of a game. *)

SMPreKernel[args___]:=(Message[SMPreKernel::argerr];$Failed);
SMPreKernel[game_] := Block[{ovls, dv, av, AVGame, smpk},
  ovls = v[#] & /@ Coalitions;(*Storing original game values.*)
  dv = DualGame[game];
  av = (ovls + dv)/2;
  AVGame = DefineGame[T, av];
  smpk = PreKernelElement[AVGame];
  DefineGame[T, ovls];(*Redefine the original game.*)
  Return[smpk];
  ];

IsSMPreKernelQ[args___]:=(Message[IsSMPreKernelQ::argerr];$Failed);
IsSMPreKernelQ[game_, payoff_] := Block[{ovls, dv, av, AVGame, smpkQ},
  ovls = v[#] & /@ Coalitions;(*Storing original game values.*)
  dv = DualGame[game];
  av = (ovls + dv)/2;
  AVGame = DefineGame[T, av];
  smpkQ = PreKernelQ[AVGame, payoff];
  DefineGame[T, ovls];(*Redefine the original game.*)
  Return[smpkQ];
  ];

SMPrenucleolus[args___]:=(Message[SMPrenucleolus::argerr];$Failed);
SMPrenucleolus[game_] := Block[{ovls, dv, av, AVGame, smpn},
  ovls = v[#] & /@ Coalitions;(*Storing original game values.*)
  dv = DualGame[game];
  av = (ovls + dv)/2;
  AVGame = DefineGame[T, av];
  smpn = PreNucleolus[AVGame];
  DefineGame[T, ovls];(*Redefine the original game.*)
  Return[smpn];
  ];

IsSMPrenucleolusQ[args___]:=(Message[IsSMPrenulceolusQ::argerr];$Failed);
IsSMPrenucleolusQ[game_, payoff_] := 
 Block[{ovls, dv, av, AVGame, smpnQ},
  ovls = v[#] & /@ Coalitions;(*Storing original game values.*)
  dv = DualGame[game];
  av = (ovls + dv)/2;
  AVGame = DefineGame[T, av];
  smpnQ = BalancedCollectionQ[AVGame, payoff];
  DefineGame[T, ovls];(*Redefine the original game.*)
  Return[smpnQ];
  ];


(* End of the section related to the simplified modified pre-kernel of a game. *)


(* The next function checks whether a pre-imputation is the pre-nucleolus of the game *)
(* It is based on Kolberg's Theorem *)
(* 
   Use the function with care. Not every result is correct!! This is a very crude, but quick checking
   of balancedness. We tried to implement some well known results like span and rank consideration
   without relying on an LP approach.
*)
(* User interface *)

BalancedSelectionQ[args___]:=(Message[BalancedSelectionQ::argerr];$Failed);

BalancedSelectionQ[game_, payoff_List, opts:OptionsPattern[BalancedSelectionQ]]:=Block[{dimpay,cc}, 
       dimpay = Dimensions[payoff]; 
      Which[Length[dimpay]===2, 
                        Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3) , 
                                       cc=BalancedSelctQ[game,#, opts]&/@ payoff;Simplify[cc],
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), 
                                        cc=BalancedSelctQ[game, payoff,  opts];Simplify[cc], 
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];


BalancedSelectionQ[selcoal_List, opts:OptionsPattern[BalancedSelectionQ]]:= 
 Block[{dispres,tig,ufs,sysvec,mrk,onesvec,wghvec,chres,poswghQ,posQ,addoneQ,oneQ,balcQ},
     dispres = OptionValue[DisplayAllResults];
     tig =  OptionValue[Tight];
     ufs=Union[Flatten[selcoal]];
     If[SameQ[ufs,T],True,Return["False"]];
     sysvec = Developer`ToPackedArray[ConstVec[selcoal]];
     mrk = MatrixRank[sysvec];
     lt = Length[T];
     If[SameQ[tig,True],True,If[mrk<lt, Return["False"],True]]; 
     onesvec = Table[1, {i, Length[T]}];
     wghvec = PseudoInverse[Transpose[sysvec]].onesvec; 
(* Trying to find a balanced subcollection *)
     Which[MemberQ[wghvec,0],{wghvec,sysvec}=ReduceMatrix[wghvec,sysvec,T,onesvec],
          Apply[Or,Negative[wghvec]],{wghs,smat}=ReduceRkMatrix[wghvec,sysvec,T,onesvec], 
          True,wghvec];
     chres =  Dot[Transpose[sysvec], wghvec];
     poswghQ = Apply[And, Positive[#] & /@ wghvec];
     posQ = Apply[And, poswghQ];
     addoneQ = SameQ[chres, onesvec];
     oneQ = Apply[And, addoneQ];
     balcQ = And[posQ, oneQ];
     If[SameQ[dispres,True], {balcQ, wghvec, sysvec, selcoal}, balcQ]
];


BalancedSelectionQ[selcoal_List, tol_, opts:OptionsPattern[BalancedSelectionQ]]:= 
 Block[{dispres,tig,ufs,sysvec,mrk,lt,onesvec,wghvec,chres,tol1,wghvec1,tolv,wghs,smat,poswghQ,posQ,addoneQ,oneQ,balcQ},
     dispres = OptionValue[DisplayAllResults];
     tig =  OptionValue[Tight];
     ufs=Union[Flatten[selcoal]];
     If[SameQ[ufs,T],True,Return["False"]];
     sysvec = Developer`ToPackedArray[ConstVec[selcoal]];
     mrk = MatrixRank[sysvec];
     lt = Length[T];
     If[SameQ[tig,True],True,If[mrk<lt, Return["False"],True]]; 
     onesvec = Table[1, {i, Length[T]}];
     wghvec = PseudoInverse[Transpose[sysvec]].onesvec;
     tol1=Min[{tol,10^(-5)}];
     wghvec1=wghvec+tol1;
(*	
     Print["wghvec=",wghvec];
     Print["wghvec1=",wghvec1];
*)
(* Trying to find a balanced sub-collection *)
     Which[MemberQ[wghvec1,0],{wghvec,sysvec}=ReduceMatrix[wghvec1,sysvec,T,onesvec],
          Apply[Or,Negative[wghvec1]],{wghs,smat}=ReduceRkMatrix[wghvec1,sysvec,T,onesvec], 
          True,wghvec];
     chres =  Dot[Transpose[sysvec], wghvec];
     poswghQ = Apply[And, Positive[#] & /@ wghvec1];
     posQ = Apply[And, poswghQ];
     tolv=Table[tol1,{i,Length[T]}];
     addoneQ = MapThread[LessEqual,{Abs[Subtract[chres, onesvec]],tolv}];
     oneQ = Apply[And, addoneQ];
     balcQ = And[posQ, oneQ];
     Return[balcQ];
];


(* Main Function related to BalancedSelctionQ[] *)


BalancedSelctQ[game_, payoff_List, opts:OptionsPattern[BalancedSelectionQ]] := 
  Block[{dispres,sil,tig,selc,ufs,lt,sysvec,onesvec,balcmat,mrk,wghs,fpQ,mbQ,nmbQ,rQ,flr,tk,extb,slc,smat,wghvec,chres,numch,btkm,posQ,newwghs,addoneQ,oneQ,balcQ},
    dispres = OptionValue[DisplayAllResults];
    sil =  OptionValue[Silent];
    tig =  OptionValue[Tight];
    selc = BalancedCollect[game, payoff];
    ufs=Union[Flatten[selc[[1]]]];
    If[SameQ[ufs,T],True,Return["False"]];
    sysvec = ConstVec[#] & /@ selc;
    lt = Length[T];
    onesvec = Table[1, {i, lt}];
    balcmat = DeleteCases[sysvec, {}];
    mrk = MatrixRank[#] & /@ balcmat;
(*  
To avoid wrong selections, the next condition is imposed. 
The disadvantage is that under certain conditions, we make no selection at all.  
*)
    If[SameQ[tig,True],True,If[First[mrk]<lt, Return["False"],True]]; 
    flr=Position[mrk,lt];
    tk=First[flr];
    If[Length[tk]==0,Return["False"],True];
    extb=Extract[balcmat,tk];
    slc=tk[[1]];
    smat=Developer`ToPackedArray[balcmat[[slc]]];
    wghs =PseudoInverse[Transpose[smat]].onesvec; 
(* Trying to find a balanced sub-collection *)
    Which[MemberQ[wghs,0],{wghs,smat}=ReduceMatrix[wghs,smat,T,onesvec],
          Apply[Or,Negative[wghs]],{wghs,smat}=ReduceRkMatrix[wghs,smat,T,onesvec],
          True,wghs];
    If[SameQ[sil,False], Print["wghvec=",wghs], True];
    posQ = Apply[And, Positive[wghs]];
    Which[slc===1,If[posQ,Return[posQ],True];,
         True,True];
    If[SameQ[sil,False], Print["wghvec=",wghs], True];
    btkm=Developer`ToPackedArray[Take[balcmat,slc]];
    wghvec = If[Depth[btkm]==4,PseudoInverse[Transpose[#]].onesvec & /@ btkm,
                PseudoInverse[Transpose[btkm]].onesvec];
    If[SameQ[sil,False], Print["posQ01=",posQ], True];
    newwghs = If[slc > 1, MapThread[NewWghs[#1,#2] &,{btkm, wghvec}], wghvec];
    If[SameQ[posQ,False], poswghQ = Apply[And, Positive[#]] & /@ newwghs; 
                          posQ = Apply[And, poswghQ], 
      posQ];
    If[SameQ[sil,False],
          Print["newwghs=",newwghs]; 
          Print["posQ03=",posQ];,
       True]; 
    Which[slc > 2,
            fpQ = Apply[And,Apply[And,Positive[#]] & /@ Take[newwghs,3]];
            mbQ = MemberQ[#,1] & /@ Take[newwghs,3];
            nmbQ = Not[Apply[Or,mbQ]];
            rQ=And[fpQ,nmbQ];,
          slc == 2, 
            fpQ = Apply[And,Apply[And,Positive[#]] & /@ Take[newwghs,2]];
            mbQ = MemberQ[#,1] & /@ Take[newwghs,2];
            nmbQ = Not[Apply[Or,mbQ]];
            rQ=And[fpQ,nmbQ];,
          True,True
          ]; 
    posQ = Which[slc > 1, If[rQ,Return[rQ],Apply[And,Apply[And, Positive[#]] & /@ newwghs]], 
                 True, posQ];
    chres =  MapThread[Dot[Transpose[#1], #2] &, {btkm,newwghs}];
    numch = Rationalize[N[#],10^(-1)] &/@ chres;
    addoneQ = SameQ[#, onesvec] & /@ numch;
    oneQ = Apply[And, addoneQ];
    balcQ = And[posQ, oneQ];
    If[SameQ[sil,False], Print["oneQ=", oneQ], True]; 
    If[dispres === True, {balcQ, newwghs, balcmat, selc}, balcQ]
];


NewWghs[mat_List,wghs_List] := Block[{poswghsQ,posQ, newwghs },
    poswghsQ = Positive[#] &/@ wghs;
    posQ = Apply[And,poswghsQ];
    If[SameQ[posQ,False], newwghs = DetPosWeights[mat,wghs], newwghs = wghs];
    poswghsQ = Positive[#] &/@ newwghs;
    posQ = Apply[And,poswghsQ];
   If[SameQ[posQ,False], NormMinimize[mat,wghs], newwghs] (* Floating Point Exception Ver. 7.x *) 
];

NormMinimize[mat_List, wghs_List]:=Block[{onesvec,zerolist,avars,constset,objfu,objsys,resmin,gw},
    onesvec = Table[1, {i, Length[T]}];
    zerolist = Table[0, {i, Length[mat]}];
    avars = Table[a[i], {i, Length[mat]}];
    constset = MapThread[Greater[#1, #2] &, {avars, zerolist}];
    objfu = Norm[Transpose[mat].avars - onesvec];
    objsys=Prepend[constset,objfu];
    If[SameQ[$OperatingSystem,"Unix"],resmin = NMinimize[objfu, avars],
             resmin = NMinimize[objsys, avars]];
    gw = Last[#] & /@ resmin[[2]];
    Rationalize[#,10^(-9)] & /@ gw
];



DetPosWeights[mat_List, wghs_List]:=Block[{nlsp,nlvec,nwghs01,nwghs02,negQ},
   nlsp = NullSpace[Transpose[mat]];
   nlvec = Total[nlsp];
   nwghs01 = wghs + (1/100) * nlvec;
   nwghs02 = wghs - (1/25) * nlvec;
   negQ = Apply[And, Positive[#] ] &/@ {nwghs01,nwghs02};
   Which[negQ[[1]] === True, nwghs01,
                 negQ[[2]] === True, nwghs02,
                 True, wghs
   ]
];

WeaklyBalancedSelectionQ[args___]:=(Message[WeaklyBalancedSelectionQ::argerr];$Failed);
WeaklyBalancedSelectionQ[game_, payoff_List, opts:OptionsPattern[WeaklyBalancedSelectionQ]]:=Block[{dimpay}, 
       dimpay = Dimensions[payoff]; 
      Which[Length[dimpay]===2, 
                        Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3) , WeakBalancedSelctQ[game,#, opts]&/@ payoff,
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), WeakBalancedSelctQ[game, payoff,  opts], 
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];



WeakBalancedSelctQ[game_, payoff_List, opts:OptionsPattern[WeaklyBalancedSelectionQ]] := 
  Block[{dispres,selc,ufs,lt,sysvec,onesvec,balcmat,mrk,sil,flr,trQ,wghvec,chres,numch,poswghQ,posQ,newwghs,addoneQ,oneQ,balcQ},
    dispres = OptionValue[DisplayAllResults];
    sil = OptionValue[Silent];
    selc = BalancedCollect[game, payoff];
    ufs=Union[Flatten[selc[[1]]]];
    If[SameQ[ufs,T],True,Return["False"]];
    sysvec = ConstVec[#] & /@ selc;
    lt = Length[T];
    onesvec = Table[1, {i,lt}];
    balcmat = Developer`ToPackedArray[DeleteCases[sysvec, {}]];
    mrk=MatrixRank[#] & /@ balcmat; 
    flr=Equal[#,lt] & /@ mrk;
    trQ=Apply[And,flr];
    If[trQ,True,Return[trQ]]; 
    wghvec = (PseudoInverse[Transpose[#]].onesvec ) & /@ balcmat;
    If[SameQ[sil,False], Print["wghvec=",wghvec], True];
    poswghQ = Apply[And, NonNegative[#]] & /@ wghvec;
    If[First[poswghQ],Return[First[poswghQ]],True]; 
    posQ = Apply[And, poswghQ];
    If[SameQ[sil,False], Print["posQ01=",posQ], True];
    If[SameQ[posQ,False], newwghs = MapThread[NewWeakWghs[#1,#2] &,{balcmat, wghvec}] ;, newwghs = wghvec];
    If[SameQ[posQ,False], poswghQ = Apply[And, NonNegative[#]] & /@ newwghs; posQ = Apply[And, poswghQ], posQ];
    If[SameQ[sil,False],
          Print["newwghs=",newwghs]; 
          Print["posQ03=",posQ];,
       True]; 
    chres =  MapThread[Dot[Transpose[#1], #2] &, {balcmat, newwghs}];
    numch = Rationalize[N[#],10^(-1)] &/@ chres;
    addoneQ = SameQ[#, onesvec] & /@ numch;
    oneQ = Apply[And, addoneQ];
    balcQ = And[posQ, oneQ];
    If[SameQ[sil,False], Print["oneQ=", oneQ], True]; 
    If[SameQ[dispres,True], {balcQ, newwghs, balcmat, selc}, balcQ]
];


NewWeakWghs[mat_List,wghs_List] := Block[{poswghsQ,posQ, newwghs },
    poswghsQ = NonNegative[#] &/@ wghs;
    posQ = Apply[And,poswghsQ];
    If[SameQ[posQ,False], newwghs = DetPosWeights[mat,wghs], newwghs = wghs];
    poswghsQ = Positive[#] &/@ newwghs;
    posQ = Apply[And,poswghsQ];
   If[SameQ[posQ,False], WeakNormMinimize[mat,wghs], newwghs] (* Floating Point Exception Ver. 7.x *) 
];

WeakNormMinimize[mat_List, wghs_List]:=Block[{onesvec,zerolist,avars,constset,objfu,objsys,resmin,gw},
    onesvec = Table[1, {i, Length[T]}];
    zerolist = Table[0, {i, Length[mat]}];
    avars = Table[a[i], {i, Length[mat]}];
    constset = MapThread[GreaterEqual[#1, #2] &, {avars, zerolist}];
    objfu = Norm[Transpose[mat].avars - onesvec];
    objsys=Prepend[constset,objfu];
    If[SameQ[$OperatingSystem,"Unix"],resmin = NMinimize[objfu, avars],
             resmin = NMinimize[objsys, avars]];
    gw = Last[#] & /@ resmin[[2]];
    Rationalize[#,10^(-9)] & /@ gw
];

CollectionOfDecreasingExcess[args___]:=(Message[CollectionOfDecreasingExcess::argerr];$Failed);
CollectionOfDecreasingExcess[game_,payoff_List]:=BalancedCollect[game,payoff];

BalancedCollect[game_, payoff_List] := Block[{levexc, redlev},
    levexc = Drop[Drop[ExcessPayoff[game, payoff][[1]],-1],1];
    redlev = Reverse[Union[Sort[levexc]]];
    Table[DeleteCases[DetBalancedCollec[#, payoff, redlev[[i]]] & /@ Drop[Drop[Subsets[T], -1],1], {}], {i, Length[redlev]}]
];

DetBalancedCollec[S_List, payoff_List, \[Alpha]_] := Block[{},
    If[GreaterEqual[Excess[payoff, S], \[Alpha]], S, {}]
];

ConstVec[meff_List] := Block[{zrv, onesvec, pscoal},
    zrv = Table[0, {i, Length[T]}];
    pscoal = Outer[List, #] & /@ meff;
    ReplacePart[zrv, 1, #] & /@ pscoal
];



(*  k-Balancedness Section, see I. Katsev and E. Yanovskaya (2009) *)
(* User interface for coalition structure. *)

kBalancednessQ[args___]:=(Message[kBalancednessQ::argerr];$Failed);
kBalancednessQ[selcoal_List, KC_List, opts:OptionsPattern[kBalancednessQ]]:= 
 Block[{dispres,sysvec,mrk,trQ,vecps,zrv,onesvec,wghvec,chres,poswghQ,posQ,addoneQ,oneQ,balcQ},
     dispres = OptionValue[DisplayAllResults];
     sysvec = Developer`ToPackedArray[ConstVec[selcoal]];
     mrk=MatrixRank[sysvec];
     trQ=Equal[mrk,Length[KC]];
     If[trQ===True,True,Return[trQ]]; 
     vecps=Outer[List,KC];
     zrv = Table[0,{i,Length[T]}];
     onesvec = ReplacePart[zrv,1,vecps];
     wghvec = (PseudoInverse[Transpose[sysvec]].onesvec ); 
     Print["wghvec=",wghvec];
(* Trying to find a balanced subcollection *)
     If[MemberQ[wghvec,0],{wghvec,sysvec}=ReduceMatrix[wghvec,sysvec,KC,onesvec],wghvec];
     chres =  Dot[Transpose[sysvec], wghvec];
     poswghQ = Apply[And, Positive[#] & /@ wghvec];
     posQ = Apply[And, poswghQ];
     addoneQ = SameQ[chres, onesvec];
     oneQ = Apply[And, addoneQ];
     balcQ = And[posQ, oneQ];
     If[SameQ[dispres,True], {balcQ, wghvec, sysvec, selcoal}, balcQ]
];


ReduceMatrix[wghs_List,mat_List,KC_List,onesv_List]:=Block[{lkc,adv,zrv,nwm},
     lkc = Length[KC];
     adv=Developer`ToPackedArray[If[Positive[#],1,0] & /@ wghs];
     nwm=adv*mat;
     zrv=Array[0 &, Length[T]];
     nwm=DeleteCases[nwm,zrv];
     If[SameQ[MatrixRank[nwm],lkc],{PseudoInverse[Transpose[nwm]].onesv,nwm},{wghs,mat}]
];


ReduceRkMatrix[wghs_List,mat_List,KC_List,onesv_List]:=
 Block[{lkc,adv,ctz,zrv,psz,pso,tk,nwm,nwm1,nwm2,swgh},
     lkc = Length[KC];
     adv = If[Positive[#],1,0] & /@ wghs;
     ctz = Count[adv,0];
     psz = Position[adv,0];
     pso = Position[adv,1];
     tk = Last[psz][[1]];
     If[ctz>0,nwm = Developer`ToPackedArray[Take[mat,tk]],nwm = Developer`ToPackedArray[mat]];
     Which[SameQ[MatrixRank[nwm],lkc],swgh = PseudoInverse[Transpose[nwm]].onesv;,
           SameQ[MatrixRank[nwm],lkc-1],
              Which[SameQ[ctz,2],fpsz=Sort[Append[pso,First[psz]]];
                                 lpsz=Sort[Append[pso,Last[psz]]];
                                 nwm1=Extract[mat,fpsz];
                                 nwm2=Extract[mat,lpsz];
                                 mrkQ=SameQ[MatrixRank[#],lkc] & /@ {nwm1,mwm2};
                                 Which[First[mrkQ],nwm=nwm1;swgh=PseudoInverse[Transpose[nwm]].onesv;,
				       Last[mrkQ], nwm=nwm2;swgh=PseudoInverse[Transpose[nwm]].onesv;,
                                       True,Return[{wghs,mat}] 
                                      ];,
                    True,Return[{wghs,mat}]],
           True,Return[{wghs,mat}]
          ];
     Return[{swgh,nwm}]
];



(*  User interface for payoff vectors. *)
SelectionKBalancedQ[game_, payoff_List, k_Integer, opts:OptionsPattern[SelectionKBalancedQ]]:=Block[{dispres, verb, dimpay, selc,binval,cc}, 
       dispres = OptionValue[DisplayAllResults];
       verb = OptionValue[Silent];
       dimpay = Dimensions[payoff]; 
      Which[Length[dimpay]===2, 
                        Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3) ,     
                                           selc = BalancedCollect[game, #] &/@ payoff; 
                                           If[dispres === True, CheckCoalStructure[#, k, DisplayAllResults-> True] &/@ selc, 
                                                                                 binval = CheckCoalStructure[# , k, DisplayAllResults-> False] &/@ selc; 
                                                                                 If[verb ===False,  Print["binval1=",binval], True];
                                                                                Simplify[Apply[And,#]&/@ binval] ]  , 
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ),  
                                          selc = BalancedCollect[game, payoff];  
                                          cc=CheckCoalStructure[# , k, opts ] &/@ selc;
                                          Apply[And,cc],  
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];





CheckCoalStructure[selcoal_List, k_Integer, opts:OptionsPattern[SelectionKBalancedQ]] := Block[{verb, cst},
    verb = OptionValue[Silent];
    If[verb === False, Print["selcoal=", selcoal ];, True ];
    Which[Depth[selcoal]  === 3,
                     Which[GreaterEqual[k, Length[T]] === True, First[BalancedSystemQ[selcoal, T, opts]],  
                                   GreaterEqual[k, 2] === True, SelctKBalacQ[selcoal, k, opts],
                                   True,  Print["The value of k must be an integer between 2 and ", Length[T]]],
                  Depth[selcoal]  === 4,
                       If[verb === False, Print["selcoal=", selcoal ];, True ];
                       cst = DeleteCases[selcoal,{}];
                       Which[GreaterEqual[k, Length[T]] === True,  bcQ=First[BalancedSystemQ[#, T, opts]] &/@ cst,  
                                     GreaterEqual[k, 2] === True, SelctKBalacQ[#, k, opts] &/@ cst,
                                     True,  Print["The value of k must be an integer between 2 and ", Length[T]]],
                   selcoal ==={}, True, (* Depth[selcoal] ==2 *) 
                  True, Print["The input dimension is not correct."]
                                      ]
  ];

(* User interface for coalition structures. *)


SelectionKBalancedQ[selcoal_List, k_Integer, opts:OptionsPattern[SelectionKBalancedQ]] := Block[{},
    Which[Depth[selcoal]  === 3,
                     Which[GreaterEqual[k, Length[T]] === True, First[BalancedSystemQ[selcoal, T, opts]],  
                                   GreaterEqual[k, 2] === True, SelctKBalacQ[selcoal, k, opts],
                                   True,  Print["The value of k must be an integer between 2 and ", Length[T]]],
                  Depth[selcoal]  === 4,
                       Which[GreaterEqual[k, Length[T]] === True, First[BalancedSystemQ[#, T, opts]] &/@ selcoal,  
                                     GreaterEqual[k, 2] === True, SelctKBalacQ[#, k, opts] &/@ selcoal,
                                     True,  Print["The value of k must be an integer between 2 and ", Length[T]]],
                  True, Print["The input dimension is not correct."]
       ]
];


SelctKBalacQ[selcoal_List, k_Integer, opts:OptionsPattern[SelectionKBalancedQ]] := 
  Block[{verb,dispres,onesvec,eqtok,ufs,bveq,kcoll,kbalsel,kbalmat,mrk,flr,trQ,kwghs,selkbalQ,redw,nkwghs,nkbalmat,kpos,kselall,
    kbalQ, kinprd, ksum, ksumeqQ, ksQ},
    dispres = OptionValue[DisplayAllResults];
    verb = OptionValue[Silent];
    If[SameQ[verb,False], Print["selcoal=",selcoal];, True ];
    onesvec = Table[1, {i, Length[T]}];
    eqtok = DeleteCases[If[Length[#] === k, #, {}] & /@ Subsets[T], {}];
    bveq = ConstVec[eqtok];
    kcoll = Table[If[MemberQ[selcoal, #] === True,  Intersection[eqtok[[i]], #], {}] & /@ selcoal, {i, Length[eqtok]}];
    kbalsel = DeleteCases[Union[DeleteCases[#, {}]] & /@ kcoll,{}];
    kbalmat = ConstVec[Union[#]] & /@ kbalsel;
    mrk = MatrixRank[#] & /@ kbalmat;
    flr = GreaterEqual[#,k] & /@ mrk;
    trQ = Apply[And,flr];
    If[SameQ[trQ,True],True,Return[trQ]];
    kwghs = MapThread[ComputeWeights[#1, #2, k] & , {kbalmat, bveq}];
    If[SameQ[verb,False], Print["kwghs=", kwghs];, True];
(* Trying to find a balanced subcollection *)
    redw=MapThread[If[MemberQ[#1,0],ReduceMatrix[#1,#2,#3,onesvec],{#1,#2}] &, {kwghs,kbalmat,eqtok}];
    nkwghs = First[#] & /@ redw;
    nkbalmat = Last[#] & /@ redw;
    If[SameQ[verb,False], Print["nkwghs=", nkwghs];, True];
    kpos = Table[Positive[#] & /@ nkwghs[[i]], {i, Length[nkwghs]}];
    kselall = Apply[And, #] & /@ kpos;
    kbalQ = Apply[And, kselall];
    kinprd = Which[Depth[nkbalmat]==4,MapThread[Dot[Transpose[#1], #2] &, {nkbalmat, nkwghs}],
                   Depth[nkbalmat]==3,Dot[Transpose[nkbalmat], nkwghs],
                   True, Dot[nkbalmat, nkwghs]];
    If[SameQ[verb,False], Print["kinprd=", kinprd];, True ];
    ksum = Dot[#, onesvec] & /@ kinprd;
    ksumeqQ = SameQ[#, k] & /@ ksum;
    ksQ = Apply[And, ksumeqQ];
    selkbalQ = And[ksQ, kbalQ];
    If[SameQ[dispres,True], {selkbalQ, nkwghs, nkbalmat, kbalsel}, selkbalQ]
 ];

ComputeWeights[kmatrix_List, onesv_List, k_Integer] := Block[{trkmat, d1, d2},
     trkmat = Transpose[kmatrix]; 
    {d1,d2} = Dimensions[trkmat];
    If[SameQ[{d1 ,d2},{k, k}], Inverse[trkmat].onesv, WghsPseudoInvers[trkmat, onesv] ]

];

WghsPseudoInvers[kmatrix_List, onesv_List] := Block[{psmat, wghs, psQ, trQ,tmat},
   tmat = Developer`ToPackedArray[kmatrix];						    
   psmat = PseudoInverse[tmat]; 
   wghs = psmat.onesv;
   psQ = Positive[#] &/@ wghs;
   trQ = Apply[And,psQ];
   If[SameQ[trQ,True], wghs , DetPositiveWeights[psmat, wghs]]     
];

DetPositiveWeights[kmatrix_List, wghs_List]:=Block[{nlsp,nlvec,nwghs01,nwghs02,negQ},
   nlsp = NullSpace[Transpose[kmatrix]];
   nlvec = Total[nlsp];
   nwghs01 = wghs + (1/100) * nlvec;
   nwghs02 = wghs - (1/100) * nlvec;
   negQ = Apply[And, Positive[#] ] &/@ {nwghs01,nwghs02};
   Which[SameQ[negQ[[1]],True], nwghs01,
                 SameQ[negQ[[2]],True], nwghs02,
                 True, wghs
   ]
];



(*Alternative Function to check a Kohlberg criterion*)


BalancedCollectionQ[args___] := (Message[BalancedCollectionQ::argerr]; $Failed);
BalancedCollectionQ[game_, payoff_List, opts:OptionsPattern[BalancedCollectionQ]] := 
  Block[{dimpay, cc}, dimpay = Dimensions[payoff];
   Which[Length[dimpay] === 2, 
    Which[(Last[dimpay] === Length[T] && Depth[payoff] === 3), 
      cc = BalancedCollMainQ[game, #, opts] & /@ payoff; Simplify[cc], 
      True, PrintRemark[payoff]], 
    Length[dimpay] === 1, 
       Which[(First[dimpay] === Length[T] && Depth[payoff] === 2), 
       cc = BalancedCollMainQ[game, payoff, opts]; Simplify[cc], 
       True, PrintRemark[payoff]], 
    True, PrintRemark[payoff]]];


BalancedCollMainQ[game_, payoff_, opts:OptionsPattern[BalancedCollectionQ]] := 
  Block[{cde, acde, rkQ, tk, lprs},
  If[SameQ[Total[payoff] - v[T], 0] && Apply[And,NumericQ[#] &/@ payoff], True, Return[False]];
   cde = CollectionOfDecreasingExcess[game, payoff];
   AppendTo[cde, {}];
   acde = FlattenAt[Append[{#}, T], 1] & /@ cde;
   rkQ = RankConQ[#, T] & /@ acde;
   tk = First[Position[rkQ, True]][[1]];
   lprs = First[BalancedSystemQ[#, T,opts]] & /@ Take[acde, tk];
   Apply[And, lprs]];


RankConQ[coll_List, T_List] := Block[{zvec, ovec, pos, mat, rk},
   zvec = Array[0 &, Length[T]];
   ovec = Array[1 &, Length[T]];
   pos = Outer[List, #] & /@ coll;
   mat = ReplacePart[zvec, 1, #] & /@ pos;
   AppendTo[mat, ovec];
   rk = MatrixRank[mat];
   SameQ[rk, Length[T]]];

WeaklyBalancedCollectionQ[args___] := (Message[WeaklyBalancedCollectionQ::argerr]; $Failed);
WeaklyBalancedCollectionQ[game_, payoff_List, opts:OptionsPattern[WeaklyBalancedCollectionQ]] :=
  Block[{dimpay, cc}, dimpay = Dimensions[payoff];
   Which[Length[dimpay] === 2,
    Which[(Last[dimpay] === Length[T] && Depth[payoff] === 3),
      cc = WeaklyBalancedCollMainQ[game, #, opts] & /@ payoff; Simplify[cc],
      True, PrintRemark[payoff]],
    Length[dimpay] === 1,
       Which[(First[dimpay] === Length[T] && Depth[payoff] === 2),
       cc = WeaklyBalancedCollMainQ[game, payoff, opts]; Simplify[cc],
       True, PrintRemark[payoff]],
    True, PrintRemark[payoff]]];


WeaklyBalancedCollMainQ[game_, payoff_, opts:OptionsPattern[WeaklyBalancedCollectionQ]] :=
  Block[{cde,excp,b0,ps0,jcl,acde, rkQ, tk, lprs},
   excp=First[ExcessPayoff[game,payoff]];
   b0=Take[Drop[Drop[excp,1],-1],Length[T]];
   If[Apply[And, LessEqual[#, 0] & /@ b0],True,Return[False]];
   If[SameQ[Total[payoff] - v[T], 0] && Apply[And,NumericQ[#] &/@ payoff], True, Return[False]];
   cde = CollectionOfDecreasingExcess[game, payoff];
   ps0=Position[Equal[Abs[#],0] &/@ b0,True];
   AppendTo[cde, {}];
   jcl = Join[#, ps0] & /@ cde;
   cde=DeleteDuplicates[#] & /@ jcl;
   acde = FlattenAt[Append[{#}, T], 1] & /@ cde;
   rkQ = RankConQ[#, T] & /@ acde;
   tk = First[Position[rkQ, True]][[1]];
   lprs = WeaklyBalancedSystemQ[#, ps0,T,opts] & /@ Take[acde, tk]; 
   Apply[And, lprs]];



(* Nucleolus/Kernel section ends *)


(* Kernel section starts *)

SmallestContributionVector[args___]:=(Message[SmallestContributionVector::argerr];$Failed);
SmallestContributionVector[game_]:=SmallestContribution[game,#] & /@ T;

SmallestContribution[args___]:=(Message[SmallestContribution::argerr];$Failed);
SmallestContribution[game_, i_Integer]:=
  Min[(v[#]-v[DeleteCases[#,i]])&/@Take[ W[i],-(Length[W[i]]-1)]];


Scrb[args___]:=(Message[Scrb::argerr];$Failed);
Scrb[game_, i_Integer]:= UpperPayoff[game,i] + (1/Length[T]) (v[T] - Total[UpperVector[game]]);

ScrbSolution[args___]:=(Message[ScrbSolution::argerr];$Failed);
ScrbSolution[game_]:= (Scrb[game,#] & ) /@ T;

(* Computing the Kernel by a convergence algorithm due to Maschler see Stearns (1968) 
or U. Faigle, W. Kern and J. Kuipers (1998) *)

FindPreKernelSolution[args___]:=(Message[FindPreKernelSolution::argerr];$Failed);
FindPreKernelSolution[game_,opts:OptionsPattern[FindPreKernelSolution]] := 
  Block[{pay},
  pay = Table[v[T],{Length[T]}]/Length[T];
  FindPreKernelSolution[game,pay,opts]
 ];



FindPreKernelSolution[game_, payoff_List, opts:OptionsPattern[FindPreKernelSolution]]:=
Block[{prec,rattol,reclim,setprk,sil,res},
       Off[$RecursionLimit::reclim]; (* Switching off all warnings that reclim is exceeded *)
       Off[General::stop];
       Off[MapThread::mptd];
       Off[MapThread::list];
       Off[ReplaceAll::reps];
       Off[Extract::psl];
       Off[Part::partw];
       Off[Part::pspec];
       Off[Part::partd];
       Off[ReplacePart::psl];
       prec = OptionValue[DigitPrecision];
       rattol = OptionValue[RationalTol];
       reclim = OptionValue[SetRecursionLimit];
       sil = OptionValue[Silent];
       setprk = Global`PRK;
       res = Block[{$RecursionLimit = reclim},
             Which[Depth[payoff] == 3, KernelSolution[game,#,prec,rattol,setprk,sil] &/@ payoff,
                   Depth[payoff] == 2, KernelSolution[game,payoff,prec,rattol,setprk,sil],
                   True, DisplayMessFindKernel[payoff]]];
       On[$RecursionLimit::reclim]; (*Switching on all warnings that have been turned off *)
       On[General::stop];
       On[MapThread::mptd];
       On[MapThread::list];
       On[ReplaceAll::reps];
       On[Extract::psl];
       On[Part::partw];
       On[Part::pspec];
       On[Part::partd];
       On[ReplacePart::psl];
       res = Which[Depth[res] == 2, res,
             Depth[res] == 3, If[Last[res] === 1, DisplayMessReclim[reclim]; First[res], res], 
             True, res];
       Which[Depth[res] == 2, Flatten[res],
             Depth[res] == 3, SolutionSelection[game,res],
             Depth[res] == 4, Map[SolutionSelection[game,#] &, #] & /@ res;Union[First[Union[res]]],
             True, res
       ]
];

FindKernelSolution[args___]:=(Message[FindKernelSolution::argerr];$Failed);
FindKernelSolution[game_,opts:OptionsPattern[FindKernelSolution]] := 
  Block[{pay},
  pay = Table[v[T],{Length[T]}]/Length[T];
  FindKernelSolution[game,pay,opts]
 ];


FindKernelSolution[game_, payoff_List, opts:OptionsPattern[FindKernelSolution]]:=
Block[{prec,rattol,reclim,setker,sil,res},
       Off[$RecursionLimit::reclim]; (*Switching off all warnings that reclim is exceeded *)
       Off[General::stop];
       Off[MapThread::mptd];
       Off[MapThread::list];
       Off[ReplaceAll::reps];
       Off[Extract::psl];
       Off[Part::partw];
       Off[Part::pspec];
       Off[Part::partd];
       Off[ReplacePart::psl];
       prec = OptionValue[DigitPrecision];
       rattol = OptionValue[RationalTol];
       reclim =  OptionValue[SetRecursionLimit];
       sil = OptionValue[Silent];
       setker = Global`KER;
       res = Block[{$RecursionLimit = reclim},
             Which[Depth[payoff] == 3, KernelSolution[game,#,prec,rattol,setker,sil] &/@ payoff,
                   Depth[payoff] == 2, KernelSolution[game,payoff,prec,rattol,setker,sil],
                   True, DisplayMessFindKernel[payoff]]];
       On[$RecursionLimit::reclim]; (*Switching on all warnings that have been turned off *)
       On[General::stop];
       On[MapThread::mptd];
       On[MapThread::list];
       On[ReplaceAll::reps];
       On[Extract::psl];
       On[Part::partw];
       On[Part::pspec];
       On[Part::partd];
       On[ReplacePart::psl];
       res = Which[Depth[res] == 2, res,
             Depth[res] == 3, If[Last[res] === 1, DisplayMessReclim[reclim]; First[res], res], 
             Depth[res] == 4, If[Last[#] === 1, DisplayMessReclim[reclim]; First[#], #]&/@ res, 
             True, res];
       Which[Depth[res] == 2, Flatten[res],
             Depth[res] == 3, SolutionSelection[game,res],
             Depth[res] == 4, res=Map[SolutionSelection[game,#] &, #] & /@ res;Union[First[Union[res]]],
             True, res
       ]
];

SolutionSelection[game_,payoff_List]:= Block[{bool,pos,lsg},
         bool = KernelImputationListQ[game,payoff];
         pos = Position[bool,True];
         lsg = If[Length[pos]===0,payoff,Extract[payoff,pos]];
      Which[Length[lsg]===1,Flatten[lsg],True,lsg]
];

KernelSolution[game_, payoff_List, prec_,rattol_,setk_,silent_,payold_:{}] := 
Block[{payvec, pold=payold,approx,ratnum},
    payvec = If[SameQ[Global`PRK,setk],ConvergenceToKernel[game, payoff],ConvergenceToKernel2[game, payoff]];
    pold = payoff;
    approx = N[payvec, prec];
    Which[SameQ[silent,False],Print["ConvergingQ: ",N[pold,prec]],True,True];
    ratnum = Rationalize[approx,rattol];
    If[Depth[payvec]<=3, 
      Which[SameQ[Global`PRK,setk], 
            Which[Apply[Or,PreKernelQ[game, {pold,ratnum}]] === False, 
                  KernelSolution[game, payvec, prec, rattol,setk,silent,ratnum],
           True, Union[{payvec,ratnum}]],
            SameQ[Global`KER,setk], Which[Apply[Or,KernelImputationListQ[game, {pold,ratnum}]] === False, 
                  KernelSolution[game, payvec, prec, rattol,setk,silent,ratnum],
           True, Union[{payvec,ratnum}]],True, Union[{payvec,ratnum}]],
      {pold,1}
     ]
    ];

(*
   Computing the Kernel by a convergence algorithm due to Stearns (1968), see also Algorithm 8.7.3
   of Meinhardt (2013) 
*)
ConvergenceToKernel2[game_,payoff_List] :=
    Block[{survec,rsrv,surpl,stdel,pairs,dps,prij,vc,rlp,nip,mn,trQ,dl,delta,idm,slp,sps,pij},
    survec = MaxSurpluses[game, payoff];
    rsrv=Reverse[#] &/@ survec;
    survec=Join[survec,rsrv];
    surpl = ReplaceAll[#, List -> Subtract] & /@ survec;
    stdel=Min[surpl];
    pairs = Partition[Flatten[{listIJ[T],listJI[T]}],2];
    dps=Position[surpl,stdel];
    prij= Extract[pairs,dps];
    vc = x[#] &/@ T;
    rlp=MapThread[Rule,{vc,payoff}];
    nip=(x[#] - v[{#}]) &/@ T /. rlp;
    mn=Negative[#] &/@ nip;
    trQ=Apply[Or,mn];
    If[trQ==True,
            slp=Position[mn,True] // Flatten;
            sps=Cases[pairs,{___,slp[[1]],___}];
            pij=Intersection[sps,prij];
            If[SameQ[pij,{}],pij=Last[prij],pij=Last[pij]],pij=Last[prij]];
    dl=Last[nip[[#]] &/@ pij];
    delta=If[Less[dl,stdel/2],dl,stdel/2];
    idm = IdentityMatrix[Length[T]];
    payoff + delta*Extract[idm, pij[[1]]] - delta*Extract[idm, pij[[2]]]	   
    ];

(* Computing the (Pre-)Kernel by a convergence algorithm due to U. Faigle, W. Kern and J. Kuipers (1998) *)
ConvergenceToKernel[game_, payoff_List] := 
  Block[{survec, surpl, deltavec, soldel, maxdel, posmdel, minpos, solvec,
      plpair, extr, trfij, numval, travec, nwpay, mp},
    survec = MaxSurpluses[game, payoff];
    surpl = ReplaceAll[#, List -> Subtract] & /@ survec;
    deltavec = Table[- 2 Global`\[Alpha], {i, Length[surpl]}];
    soldel = 
      MapThread[
        Flatten[Rationalize[Solve[#1 == #2, Global`\[Alpha]]]] &, {surpl, 
          deltavec}];
    solvec = Global`\[Alpha] /. soldel;
    maxdel = Max[Abs[solvec]];
    posmdel = Position[Abs[solvec], maxdel];
    minpos = Min[posmdel];
    plpair = Partition[listIJ[T],2];
    extr = Extract[plpair, minpos];
    trfij = Extract[payoff, Outer[List, extr]];
    numval = Flatten[posmdel][[1]];
    travec = {-solvec[[numval]], solvec[[numval]]};
    nwpay = trfij + travec;
    mp = MapThread[List,{nwpay,extr}];
    Rp[Rp[payoff,mp[[1,1]],mp[[1,2]]],mp[[2,1]],mp[[2,2]]]
    ];

Rp[vec_, nwcom_, posi_] := ReplacePart[vec, nwcom, posi];


(* Auxiliary functions to construct the (n (n-1)/2) initial LPs for KernelCalculation[] *)


DelRat[i_Integer, j_Integer, Global`\[Delta]_, eps_:0] := 
  x[#] + Global`\[Delta] >= v[#]  & /@ TIJsets[i, j];

TransferConstraints[args___]:=(Message[TransferConstraints::argerr];$Failed);
TransferConstraints[game_, i_Integer, j_Integer, eps_:0] := 
    Append[Core[game], {DelRat[i, j, -Global`\[Delta], eps], 
           DelRat[j, i, -Global`\[Delta], eps], 
           delconst}] // Flatten;


DeltaLP[args___]:=(Message[DeltaLP::argerr];$Failed);
DeltaLP[game_, i_Integer, j_Integer, eps_:0, ops:OptionsPattern[DeltaLP]] :=
    Block[{changesolver,mthd},
             mthd=OptionValue[Method];
             changesolver=OptionValue[CallMaximize];
             DeltaLP[game, i, j, eps,changesolver,Method->mthd]
];

DeltaLP[game_, i_Integer, j_Integer, eps_:0, changesolver_:False,ops:OptionsPattern[DeltaLP]] :=
   Block[{mthd},
        mthd=OptionValue[Method];
        Which[changesolver==False, 
                             {zf,res}=LinearOptimization[-Global`\[Delta], Union[TransferConstraints[game, i, j, eps]], Join[x /@ T, {Global`\[Delta]}],{"PrimalMinimumValue","PrimalMinimizer"}, Method->mthd];
                             Return[{zf,MapThread[Rule,{Join[x /@ T, {Global`\[Delta]}],res}]}],
              True, 
                  Chop[Rationalize[NMaximize[Prepend[{Union[TransferConstraints[game, i, j, eps]]},Global`\[Delta]], Join[x /@ T, {Global`\[Delta]}],Method->mthd]]]]
];

delconst = {Global`\[Delta] >=  0};


pay = x /@ T;

Transfer[args___]:=(Message[Transfer::argerr];$Failed);
Transfer[y_List, T_List, d_, i_Integer, j_Integer] := 
  Block[{idmat}, 
    idmat = IdentityMatrix[Length[T]];
    (x /@ T /. Payoff[y]) - d Extract[idmat, i] + d Extract[idmat, j]
   ];

MaxDeltaij[game_, eps_:0,changesolver_] := 
  Block[{anf = T, rest, pi, pj, erg = {}}, 
    While[Length[anf] > 1,
      pi = First[anf];
      rest = Drop[anf, 1];
      While[Length[rest] > 0,
        pj = First[rest];
        erg = Append[erg, DeltaLP[game, pi, pj, eps,changesolver]];
        rest = Drop[rest, 1];
        ];
      anf = Drop[anf, 1];];
    Return[erg]];

TijLoop[game_] := 
  Block[{anf = T, rest, pi, pj, menge = {}}, 
    While[Length[anf] > 1,
      pi = First[anf];
      rest = Drop[anf, 1];
      While[Length[rest] > 0,
        pj = First[rest];
        menge = Flatten[
        Append[menge, Union[TIJsets[pi, pj], TIJsets[pj, pi]]], 0];
        rest = Drop[rest, 1];
        ];
      anf = Drop[anf, 1];];
    Return[menge]];


NewIneq[ineq_, param_, liste_] := 
  Table[ineq[[i]] /. {lhs_ <= rhs_ :> 
          lhs <= rhs + param[[i]] /; rhs == Min[liste]}, {i, Length[param]}];

SortConstraints[ineq_, para_] := 
  Block[{pospattern, rg,extpos}, 
    pospattern = Position[ineq, Cases[ineq, _. + para, {2}][[1]], {2}];
    rg=Range[Length[pospattern]];
    extpos = Outer[List, pospattern[[#, 1]] & /@ rg];
    Extract[ineq, extpos]];


FeasibleConstraints[ineq_, delta_,changesolver_,mthd_] := 
  Block[{newungl,delexc = Sort[delta], creatpara, redpara, paramet, nebenbed, zf, fineq, feasbineq = {}, allineq, varb, sol, resl, setofineq},
    newungl = Drop[ineq, -1];
    creatpara = Array[a[#] &,{Length[delexc],Length[newungl]}];
    redpara = Union[Flatten[creatpara]];
    While[Length[delexc] > 0, 
      paramet = Take[creatpara, 1][[1]];
      nebenbed = NewIneq[newungl, paramet, delexc];
      fineq = SortConstraints[nebenbed, paramet[[1]]];
      feasbineq = Append[feasbineq, fineq] // Flatten;
      creatpara = Drop[creatpara, 1];
      delexc = Drop[delexc, 1];
      ];
    allineq = Rationalize[Flatten[Append[feasbineq, Last[ineq]]],10^(-9)];
    varb = Append[x /@ T, redpara] // Flatten;
    zf = Total[redpara];
    sol = Which[SameQ[changesolver,False], LinearOptimization[zf, allineq, varb,{"PrimalMinimumValue","PrimalMinimizer"},Method-> mthd], (*RevisedSimplex *)
                True, Rationalize[NMinimize[Prepend[{allineq},zf], varb,Method-> mthd]]];
    If[SameQ[changesolver,False],sol={zf,MapThread[Rule,{varb,Last[sol]}]},True];
    resl = x /@ T /. sol[[2]];
    setofineq = allineq /. Take[sol[[2]], -Length[redpara]];
    {resl, setofineq}
 ];




NewConstraints[sets_, constraints_, del_, eps_:0] := 
  Block[{Tijsys, delta, dij = del, mengsys = sets, exccon, const = constraints},
    While[Length[dij] > 0,
      delta = Take[dij, 1][[1]];
      Tijsys = Take[mengsys, 1];
      exccon = v[#] - x[#] <= -delta & /@ Tijsys[[1]];
      const = Append[const, exccon];
      dij = Drop[dij, 1];
      mengsys = Drop[mengsys, 1]]; 
      Return[const]];


(* Auxiliary functions to verify balancedness of the excess vector *)


CheckBalancedness[game_, pay_] := Block[{ balancedQ},
    balancedQ = MaxExcessBalanced[newgame, pay][[1]]
];


AssgPay[payoff_List] := Block[{vars},
    vars = x[#] & /@ T;
    MapThread[Rule, {vars, payoff}]
    ];

MaxExcess[mgij_List, asspay_List] := MaxExc[#, asspay] & /@ mgij;
MinExcess[mgij_List, asspay_List] := MinExc[#, asspay] & /@ mgij;

MaxExc[mg_List, asspay_List] := Max[ReplaceAll[(v[#] - x[#]) & /@ mg, asspay]];
MinExc[mg_List, asspay_List] := Min[ReplaceAll[(v[#] - x[#]) & /@ mg, asspay]];

ConstPlj[mngij_List, asspay_List] := Flatten[IndCont[#, asspay] & /@ mngij];

IndCont[plj_List, asspay_List] := (x[#] - v[{#}]) & /@ {Last[plj]} /. asspay;   


MaxSurplus[args___]:=(Message[MaxSurplus::argerr];$Failed);
MaxSurplus[game_, pi_, pj_, payoff_List] := 
    Block[{payass}, 
      payass = Which[Depth[payoff]==3, MapThread[Rule,{x /@ T,#}]& /@ payoff, 
                     Depth[payoff]==2, MapThread[Rule,{x /@ T,payoff}],
                     True, Print["The input 'payoff' is not a list."];Return[]];
      Which[Depth[payass] == 5,Max[ReplaceAll[(v[#] - x[#]) & /@ TIJsets[pi,pj],#]] &/@ payass,
            Depth[payass] == 4,Max[ReplaceAll[(v[#] - x[#]) & /@ TIJsets[pi,pj],payass]],
            True, Print["Wrong data format."];Return[]]
      ];


ModMaxSurplus[game_, sij_List, payass_List] := 
	Block[{},
          Max[ReplaceAll[Map[v[#] - x[#] &, sij],payass]]
      ];



AntiSurplus[game_, pi_, pj_, payoff_List] := 
    Block[{payass}, 
      payass = Which[Depth[payoff]==3, MapThread[Rule,{x /@ T,#}]& /@ payoff, 
                     Depth[payoff]==2, MapThread[Rule,{x /@ T,payoff}],
                     True, Print["The input 'payoff' is not a list."];Return[]];
      Which[Depth[payass] == 5,Min[ReplaceAll[(v[#] - x[#]) & /@ TIJsets[pi,pj],#]] &/@ payass,
            Depth[payass] == 4,Min[ReplaceAll[(v[#] - x[#]) & /@ TIJsets[pi,pj],payass]],
            True, Print["Wrong data format."];Return[]]
      ];


ModAntiSurplus[game_, sij_List, payass_List] := 
	Block[{},
          Min[ReplaceAll[Map[v[#] - x[#] &, sij],payass]]
      ];


MaxSurpluses[game_, payoff_List] := 
    Block[{dir,pli,plj,maxpi,maxpj,res}, 
      dir = Partition[listIJ[T],2];
      pli = First[#] &/@ dir;
      plj = #[[2]] &/@ dir;
      maxpi = MapThread[MaxSurplus[game,#1,#2,payoff]&,{pli,plj}];
      maxpj = MapThread[MaxSurplus[game,#1,#2,payoff]&,{plj,pli}];
      MapThread[List,{maxpi,maxpj}]
     ];

ModMaxSurpluses[game_, sij_List, sji_List,payoff_List] := 
    Block[{payass,maxpi,maxpj}, 
      maxpi = Map[ModMaxSurplus[game,#,payoff]&,sij];
      maxpj = Map[ModMaxSurplus[game,#,payoff]&,sji];
      MapThread[List,{maxpi,maxpj}]
     ];

AntiSurpluses[game_, payoff_List] := 
    Block[{dir,pli,plj,minpi,minpj,res}, 
      dir = Partition[listIJ[T],2];
      pli = First[#] &/@ dir;
      plj = #[[2]] &/@ dir;
      minpi = MapThread[AntiSurplus[game,#1,#2,payoff]&,{pli,plj}];
      minpj = MapThread[AntiSurplus[game,#1,#2,payoff]&,{plj,pli}];
      MapThread[List,{minpi,minpj}]
     ];


ModAntiSurpluses[game_,sij_List, sji_List, payoff_List] := 
    Block[{payass,minpi,minpj}, 
      minpi = Map[ModAntiSurplus[game,#,payass]&,sij];
      minpj = Map[ModAntiSurplus[game,#,payass]&,sji];
      MapThread[List,{minpi,minpj}]
     ];

AllMaxSurpluses[args___]:=(Message[AllMaxSurpluses::argerr];$Failed);
AllMaxSurpluses[game_,payoff_List, opts:OptionsPattern[AllMaxSurpluses]]:= Block[{dispmat,ausz,sol,mgij,mgji,ergb},
     dispmat = OptionValue[DisplayMatrixForm];    
     ausz = Which[Depth[payoff]==2,{payoff},
                  Depth[payoff]==3,payoff,
                  True, Print["The input 'payoff' is not a list."];Return[]];
     ergb = MaxSurpluses[game,#] &/@ ausz;
     Which[dispmat == False, ergb, True, DisplayResult[ergb]]
];


AllAntiSurpluses[args___]:=(Message[AllAntiSurpluses::argerr];$Failed);
AllAntiSurpluses[game_,payoff_List, opts:OptionsPattern[AllAntiSurpluses]]:= Block[{dispmat,ausz,sol,mgij,mgji,ergb},
     dispmat = OptionValue[DisplayMatrixForm];    
     ausz = Which[Depth[payoff]==2,{payoff},
                  Depth[payoff]==3,payoff,
                  True, Print["The input 'payoff' is not a list."];Return[]];
     ergb = AntiSurpluses[game,#] &/@ ausz;
     Which[dispmat == False, ergb, True, DisplayResult[ergb]]
];

DisplayResult[payoff_]:= Block[{surpl,dir,pli,plj,setij,setji,nwij,mgij},
    surpl = payoff; 
    setij = Partition[listIJ[T],2];
    setji = Partition[listJI[T],2];				
    nwij = MapThread[List,{setij,setji}];
    mgij = Map[Global`sij,#] &/@ nwij;
    MatrixForm[PrependTo[surpl,mgij]]
];


(* User interface to check for kernel elements. *)

KernelImputationQ[args___]:=(Message[KernelImputationQ::argerr];$Failed);

KernelImputationQ[game_, payoff_List] := Block[{dimpay},
    dimpay = Dimensions[payoff];
    Which[Length[dimpay] === 2,
         Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), KernelImputQ[game, #] & /@ payoff, 
                       True, PrintRemark[payoff]], 
   Length[dimpay] === 1,
            Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), KernelImputQ[game, payoff], 
                         True,  PrintRemark[payoff]], 
   True, PrintRemark[payoff]]
];

KernelImputQ[game_, payoff_List] := 
  Block[{ub,lb,plpr,rvpr,asspay,sij,sji,tmij,tmji,msrplij,msrplji,msrij,msrji,conj,coni,intvij,intvji,npij,npji,orij,orji,ntmj,ntmi,neq},
    ub=4*10^(-7);
    lb=-ub;
    plpr = PlayerPairs[T];
    rvpr = Reverse[#] & /@ plpr;
    asspay = AssgPay[payoff];
    {sij,sji} = {TIJsets[#[[1]], #[[2]]] & /@ plpr,TIJsets[#[[1]], #[[2]]] & /@ rvpr};
    {msrplij,msrplji} = {MaxExcess[sij, asspay],MaxExcess[sji, asspay]};
    {msrij,msrji} = {msrplij - msrplji,msrplji - msrplij};
    {conj,coni}= {ConstPlj[plpr, asspay], ConstPlj[rvpr, asspay]};
    {tmij,tmji} = {Times[msrij, conj],Times[msrji, coni]};
    intvij = (lb<= # <= ub) &/@ tmij;  
    intvji = (lb<= # <= ub) &/@ tmji;
    {npij,npji} = {NonPositive[tmij],NonPositive[tmji]};
    {orij,orji} = {MapThread[Or,{intvij,npij}],MapThread[Or,{intvji,npji}]}; 
    {ntmj,ntmi} = {Union[orij],Union[orji]};
    neq = Apply[Join, {ntmj, ntmi}];
    Apply[And, neq]
 ];


DisplayMessFindKernel[payoff_List]:=(
       Print["Depth is equal to ",Depth[payoff]];
       Print["Usage: FindKernelSolution[game,payoff]"];
       Print["Input format of the variable 'payoff' is not correct."];
       Print["The variable 'payoff' must be a single payoff vector or a list of payoffs."]
);

DisplayMess[payoff_List]:=(
       Print["Depth is equal to ",Depth[payoff]];
       Print["Usage: KernelImputationQ[game,payoff]"];
       Print["Input format of the variable 'payoff' is not correct."];
       Print["The variable 'payoff' must be a single payoff vector."];
       Print["Use the function KernelImputationListQ[game,payoff]"];
       Print["to check a list of payoff vectors."]
);

DisplayMessReclim[reclimval_]:=(
       Print["Warning:: Recursion limit exceeds threshold value: ", reclimval];
       Print["Use the function KernelImputationListQ[game,payoff]"];
       Print["to check if the result is a kernel solution."]       

);

KernelImputationListQ[args___]:=(Message[KernelImputationListQ::argerr];$Failed);

KernelImputationListQ[game_, payoff_List] := Block[{kerimpQ,impQ},
    Which[Depth[payoff] == 3, 
            kerimpQ = KernelImputationQ[game, #] &/@ payoff;
            impQ = CheckImputations[game, #] & /@ payoff;
            MapThread[And,{kerimpQ,impQ}],
          Depth[payoff] == 2, 
            kerimpQ = KernelImputationQ[game,payoff];
            impQ = CheckImputations[game,payoff];
            Apply[And,{kerimpQ,impQ}],
          True, DisplayMessage[payoff]
    
   ]
];


ImputationQ[args___]:=(Message[ImputationQ::argerr];$Failed);
ImputationQ[game_,payoff_List]:= Block[{},
   Which[Depth[payoff] == 3, CheckImputations[game, #] & /@ payoff,
         Depth[payoff] == 2, CheckImputations[game,payoff],
         True, DisplayMessage[payoff]
   ]
];


CheckImputations[game_,payoff_List]:= Block[{impQ},
    impQ = TolImputations[game] /. MapThread[Rule, {x[#] & /@ T, payoff}];
    Apply[And, impQ]
];

TolImputations[game_]:=Block[{tolv,indrat,eff},
    tolv=4*10^(-9);
    indrat=(x[#] - v[{#}])>=-tolv &/@ T;
    eff=LessEqual[Abs[x[T]-v[T]],tolv];
    Append[indrat,eff]
];


DisplayMessage[payoff_List]:=( 
       Print["Depth is equal to ",Depth[payoff]];
       Print["Usage: KernelImputationListQ[game,payoff] and PreKernelQ[game,payoff]"];
       Print["Input format of the variable 'payoff' is not correct."];
       Print["The variable 'payoff' must be a list of payoff vectors or a single payoff vector."]

);

(* User interface to check for (anti) pre-kernel element. *)

PreKernelQ[args___]:=(Message[PreKernelQ::argerr];$Failed);

PreKernelQ[game_, payoff_List,opts:OptionsPattern[PreKernelQ]] :=Block[{rattol,tolv,graval,dimpay},
       rattol = OptionValue[RationalTol]; 
       graval = v[T];
       dimpay = Dimensions[payoff];
       tolv=1.5*rattol;
    Which[Length[dimpay] === 2,
                                 Which[ (Last[dimpay]===Length[T] && Depth[payoff] ===3),MapThread[And,{(Abs[Total[#] - graval]<=tolv) & /@ payoff,MaxExcessBalanced[game, payoff,RationalTol->rattol]}],
                                               True, PrintRemark[payoff]],
                   Length[dimpay] === 1,
                              Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), MapThread[And,{{Abs[Total[payoff] - graval]<=tolv},{MaxExcessBalanced[game, payoff,RationalTol->rattol]}}], 
                                            True, PrintRemark[payoff]],
      True, PrintRemark[payoff]
            ]
 ];

AntiPreKernelQ[args___]:=(Message[AntiPreKernelQ::argerr];$Failed);
AntiPreKernelQ[game_, payoff_List,opts:OptionsPattern[AntiPreKernelQ]] :=Block[{rattol,tolv,graval,dimpay},
       rattol = OptionValue[RationalTol]; 
       graval = v[T];
       dimpay = Dimensions[payoff];
       tolv=1.5*rattol;
    Which[Length[dimpay] === 2,
                               Which[ (Last[dimpay]===Length[T] && Depth[payoff] ===3), MapThread[And,{(Abs[Total[#] - graval]<= tolv) & /@ payoff,MinExcessBalanced[game, payoff,RationalTol->rattol]}],
                                               True, PrintRemark[payoff]],
                   Length[dimpay] === 1,
                              Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), MapThread[And,{{Abs[Total[payoff] - graval]<=tolv},{MinExcessBalanced[game, payoff,RationalTol->rattol]}}], 
                                            True, PrintRemark[payoff]],
      True, PrintRemark[payoff]
            ]
 ];


(* User interface to calculate kernel elements of a Tu-game, cf. Meinhardt (2006). *)

KernelCalculation[args___]:=(Message[KernelCalculation::argerr];$Failed); 
KernelCalculation[game_, opts:OptionsPattern[KernelCalculation]] := 
 Block[{callm,changeps,dispres, epsi1, fieps, notzeromono, firstcrit,kernres, epsilon, zmonoQ, kernQ, avcQ, orggame, orgval},
  Off[Set::setraw];
  Off[Set::write];
  callm = OptionValue[CallMaximize];
  mth = OptionValue[Method];
  changeps = OptionValue[ChangeInternalEps];
  dispres = OptionValue[DisplayAllResults];
  epsi1 = OptionValue[EpsilonValue];
  notzeromono = OptionValue[SetGameToNonZeroMonotonic]; 
   If[Depth[epsi1]==1, 
    ClearProtected[Global`w];
    MapThread[Set, {{Global`w[#]}, {v[#]}}] & /@ Subsets[T];
    SetAttributes[Global`w, Protected];
    orgval = Rationalize[v[#] & /@ Subsets[T]]; 
(* ZeroMonotonQ[] changes the coalitional values. orgval stores the original values.  *)
    fieps= FirstCriticalVal[game][[1,2]];
(*    fieps= ThirdCriticalVal[game][[1,2]];*)
    epsilon = If[epsi1 < fieps,fieps,epsi1];
    zmonoQ = ZeroMonotoneQ[game];
    orggame := DefineGame[T,orgval]; (* Reconstruction of the original game. *)
    kernQ = CoreQ[orggame];
    avcQ = AvConvexQ[orggame];
    kernres = If[epsilon != 0, (* For zero-monotonic games with an nonempty core we can use KernelPoints[], 
                        otherwise we use the function Kernel[].
                        KernelPoints[] can run into infinite loops for 
                        non zero-monotonic games.
                        This function seems to be stable for non zero-monotonic games. *) 
                 If[ (zmonoQ || kernQ) == True, 
                 DisplayZmQKerQ01[zmonoQ,kernQ];
                 KernelPoints[orggame, {},callm,changeps, dispres, EpsilonValue -> epsilon, Method->mth,opts],
                 DisplayZmQKerQ02[zmonoQ,kernQ];
                 KernelSubCallZero[orggame, callm, changeps, dispres, EpsilonValue -> epsilon, SetGameToNonZeroMonotonic -> notzeromono, Method-> mth]
                 ],
           If[(zmonoQ || kernQ) == False,
              DisplayZmQKerQ02[zmonoQ,kernQ];
              KernelSubCallZero[orggame, callm, changeps,  dispres, EpsilonValue -> epsilon, SetGameToNonZeroMonotonic -> notzeromono, Method-> mth],
              If[kernQ == False,
                 DisplayZmQKerQ03[zmonoQ,kernQ];
                 KernelSubCallEmpty[orggame,callm, changeps,  dispres, EpsilonValue -> epsilon, SetGameToNonZeroMonotonic -> notzeromono, Method-> mth],
                 If[avcQ == True, 
                   DisplayAvcQ[avcQ];
                   KernelSubCall[orggame,callm, changeps, dispres, EpsilonValue -> epsilon, SetGameToNonZeroMonotonic -> notzeromono, Method-> mth],
                   DisplayAvcQ[avcQ];
                   KernelSubCall[orggame,callm, changeps, dispres, EpsilonValue -> epsilon, SetGameToNonZeroMonotonic -> notzeromono, Method-> mth]
                   ]
                ]
             ]
       ], DisplayRemark[epsilon]
   ];
   DefineGame[T,orgval]; (* Reconstruction of the original game. *)
   kernres
  ];
 
DisplayZmQKerQ01[zmQ_,coreQ_] := 
  Block[{},
          Print["Game is zero-monotone? ",zmQ];
          Print["Core is nonempty? ",coreQ];
          Print["Game is either zero-monotonic or has nonempty core"]
         ];
         
DisplayZmQKerQ02[zmQ_,coreQ_] := 
   Block[{},
          Print["Game is zero-monotone? ",zmQ];
          Print["Core is nonempty? ",coreQ];
          Print["Game is not zero-monotonic and has empty core"]
          ];
          
DisplayZmQKerQ03[zmQ_,coreQ_] :=
   Block[{},
          Print["Game is zero-monotone? ",zmQ];
          Print["Core is nonempty? ",coreQ];
          Print["Core is empty"];
       ];

DisplayAvcQ[avconQ_] := Print["Game is average-convex? ",avconQ];

DisplayRemark[eps_Real] := 
    Block[{},
      Print["Depth is equal to ",Depth[eps]];
      Print["Usage: Kernel[game,options]"];
      Print["and KernelCalculation[game,options]"];
      Print["The variable 'eps' has not the correct input format."];
      Print["The variable 'eps' must be a rational number and not a list."];
      Print["Use for instance the function FirstCriticalVal[] to find out such a number."]
      ];



KernelSubCallEmpty[game_,callm_,changeps_,dispres_,opts:OptionsPattern[KernelCalculation]] := 
     Block[{mth,epsi1,notzeromono,critical,kernres},
          epsi1 = OptionValue[EpsilonValue];
          notzeromono = OptionValue[SetGameToNonZeroMonotonic];
          mth = OptionValue[Method];
          critical = Which[changeps == False, epsi1, True, SecondCriticalVal[game][[1, 2]]];
          kernres = KernelPoints[game, {}, callm, changeps,  dispres, EpsilonValue -> critical, SetGameToNonZeroMonotonic -> notzeromono,Method->mth]


 ];

KernelSubCall[game_,callm_,changeps_,dispres_,opts:OptionsPattern[KernelCalculation]] := 
     Block[{mth,epsi1,notzeromono,critical,kernres},
          epsi1 = OptionValue[EpsilonValue];
          notzeromono = OptionValue[SetGameToNonZeroMonotonic];
          mth = OptionValue[Method]; 
          critical = Which[changeps == False, epsi1, True, FourthCriticalVal[game][[1, 2]]];
          kernres = KernelPoints[game, {}, callm, changeps,  dispres, EpsilonValue -> critical, SetGameToNonZeroMonotonic -> notzeromono,Method->mth]


 ];


KernelSubCallZero[game_,callm_,changeps_,dispres_,opts:OptionsPattern[KernelCalculation]] := 
     Block[{mth,epsi1,notzeromono,critical,kernres,kernsol},
          epsi1 = OptionValue[EpsilonValue];
          notzeromono = OptionValue[SetGameToNonZeroMonotonic]; 
          mth = OptionValue[Method];
          critical = Which[changeps == False, epsi1, True, StarCriticalVal[game][[1, 2]]];
(* 
The function KernelPoints[] is not stable for non zero-monotonic games.
We comment the function KernelPoints[] out and rely on the stable 
function Kernel[] to avoid infinite loops.
*)
(*
          kernres = KernelPoints[game, {}, critical]
*)
       Which[notzeromono == False,
             kernsol= Take[Kernel[game, Method->mth, DisplayAllResults -> True, EpsilonValue -> critical],3];
             kernres = Append[kernsol,kernsol[[1]]],
            True, KernelPoints[game, {}, callm, changeps, dispres, EpsilonValue -> critical, SetGameToNonZeroMonotonic -> notzeromono,Method->mth]
         ]
 ];



(* 
Main functions to determine kernel elements according to the algorithm 
as described in Meinhardt(2006). Recursive procedure. 
*)

KernelPoints[game_, storepay_:{}, callm_, changeps_, dispres_, opts:OptionsPattern[KernelCalculation]] := 
  Block[{epsi1, notzeromono, mth, ruf, zwerg, initialpay = storepay, folg, rf, del, alloc, po, newgame, maxsets, tijsets, mengsys, reslofSt2, constofSt2, const = {}, var, subres,sol, reddel,unpay, retval, objfunc, epsilon, leastgame},
    epsi1 = OptionValue[EpsilonValue];
    notzeromono = OptionValue[SetGameToNonZeroMonotonic]; 
    mth = OptionValue[Method];
    epsilon = epsi1;
    newgame = EpsValue[game, epsi1];
    ruf = MaxDeltaij[newgame, epsi1,callm];
    folg = (Length[T](Length[T] - 1))/2;
    rf=Range[folg];
    zwerg = Take[ruf[[#, 2]], Length[T]] & /@ rf;
    var = x /@ T;
    subres = (var) /. zwerg;
    initialpay = FlattenAt[Append[initialpay, Union[subres]], Length[initialpay] + 1];
    del = Global`\[Delta] /. Take[ruf[[#, 2]], -2] & /@ rf;
    del = Rationalize[#,10^(-9)] & /@ del;
    tijsets = TijLoop[newgame];
    po = MapThread[Position[Flatten[ExcessPayoff[newgame, #1]], -#2] &,{subres, del}]; 
    maxsets = Extract[Subsets[T], #] & /@ po;
    mengsys = MapThread[Intersection[#1,#2] &, {maxsets, tijsets}];
    const = NewConstraints[mengsys, const, del, epsi1];
    objfunc = Total[var];
    const = Flatten[Join[Append[const, objfunc <= v[T]]]];
    reddel = Sort[-Union[del]];
    {reslofSt2, constofSt2} = FeasibleConstraints[const, reddel, callm, mth];
    initialpay = Append[initialpay,reslofSt2];
    unpay = Union[initialpay];
    const = Rationalize[Union[constofSt2],10^(-9)];
    (* In the next line, we handle incorrectly specified opt-prob.  *)
    If[FreeQ[const, Indeterminate],True,Print["Warning: OPT-PROB incorrectly specified. Aborting Calculation!"];
                                        Return[Extract[subres,Position[KernelImputationListQ[game, subres], True]]]];
    sol = Which[SameQ[callm,False], LinearOptimization[-objfunc, const, var,{"PrimalMinimumValue","PrimalMinimizer"},Method->mth], (* RevisedSimplex *) 
                True, Rationalize[NMaximize[Prepend[{const}, objfunc], var, Method->mth],10^(-9)]];
    If[SameQ[callm,False],sol=ReplacePart[sol,{2}->MapThread[Rule,{var,sol[[2]]}]],True];
    alloc = var /. sol[[2]];
    retval=Apply[Or,Union[KernelImputationListQ[newgame,subres]]];
    If[SameQ[retval,True],Return[{alloc,Union[subres]}],True];
    If[Depth[alloc]!=2,{alloc,subres},True];
    retval = Which[notzeromono == False, KernelImputationQ[newgame, alloc], 
                        True, (PreKernelQ[newgame, alloc][[1]] || KernelImputationQ[newgame, alloc])];
    If[retval == True,
      Print["A Kernel solution is: ",MapThread[Rule,{var,alloc}]];
      Which[dispres == False, {alloc,unpay}, True, {alloc, objfunc, const, del-epsi1, unpay}],
      MessageKerPoints01[sol];
      If[epsi1 != 0,
         Print["epsi1=",epsi1];
         MessageKerPoints02;
         KernelPoints[newgame, initialpay,callm,changeps,dispres,EpsilonValue -> 0, SetGameToNonZeroMonotonic -> notzeromono, Method->mth],
           epsilon = FirstCriticalVal[newgame][[1, 2]];
           If[epsilon == 0,
                Print["eps=",epsilon];
                epsilon = SecondCriticalVal[newgame][[1, 2]];
                leastgame = EpsValue[newgame, epsilon];
                KernelPoints[leastgame, initialpay,callm,changeps,dispres,EpsilonValue -> epsilon, SetGameToNonZeroMonotonic -> notzeromono,Method->mth],
           leastgame = EpsValue[newgame, epsilon];
           KernelPoints[leastgame, initialpay,callm,changeps,dispres,EpsilonValue -> 0, SetGameToNonZeroMonotonic -> notzeromono,Method->mth]
              ]
         ]
       ]
    ];


MessageKerPoints01[erg_] := 
   Block[{},
         Print["At least one player outweighs another player."]; 
         Print["A further calculation loop is required.\n", erg];
   ];

MessageKerPoints02 :=
   Block[{},
        Print["Solution is not balanced."];
        Print["The solution found may be a Kernel element."];
        Print["Check solution with the function KernelImputationQ or MaxExcessBalanced."];
   ];

(* NewKernel section starts *)
(* Description of the algorithm can be found in section 5 in Meinhardt (2006) *)

Kernel[args___]:=(Message[Kernel::argerr];$Failed);
Kernel[game_,opts:OptionsPattern[Kernel]] := Block[{chopt, dispres, mth, eps, kersol, coreq,orgval,callm},
       dispres = OptionValue[DisplayAllResults];
       eps = OptionValue[EpsilonValue];
       callm = OptionValue[CallMaximize];
       mth = OptionValue[Method];
       orgval = Rationalize[v[#] & /@ Subsets[T]]; 
(* EpsValue[] changes the coalitional values. orgval store the original values.  *)
       kersol = If[Depth[eps]==1,
         coreq = CoreQ[game];
          If[eps == 0, 
             If[coreq == False, KernelSubCallFir[game,dispres,callm,mth], KernelSubCallSec[game,dispres,callm,mth]
               ], KernelSubCallThir[game,eps,dispres,callm,mth]
            ], DisplayRemark[eps]    
          ];
        DefineGame[T,orgval]; (* Reconstruction of the original game. *)
        Chop[Rationalize[kersol,10^(-9)]]
];

KernelSubCallFir[game_,dispres_,callm_,mthd_]:= 
Block[{firstcrit,seccrit,newgame,nb,alldelvar,dvar,objfunc,var,solut,kersol,tra},
        firstcrit = FirstCriticalVal[game][[1,2]];
        newgame = EpsValue[game, firstcrit];
        {nb,alldelvar,dvar} = AllConstraints[newgame];
        objfunc= Total[dvar];
        var= Union[x /@ T, alldelvar];
        solut = Which[SameQ[callm,False],LinearOptimization[-objfunc, nb, var,{"PrimalMinimumValue","PrimalMinimizer"},Method-> mthd], (*RevisedSimplex *)
                              True,Rationalize[NMaximize[Prepend[{nb},objfunc],var,Method-> mthd],10^(-12)]];
        If[SameQ[callm,False],solut=ReplacePart[solut,{2}->MapThread[Rule,{var,solut[[2]]}]],True];
        kersol=(x /@ T) /.Take[solut[[2]],Length[T]];
        tra= dvar /. Take[solut[[2]],-Length[alldelvar]];
        Which[SameQ[dispres,False], kersol, True, {kersol,objfunc,nb,var,tra}]
];


KernelSubCallSec[game_,dispres_,callm_,mthd_]:= 
Block[{nb,alldelvar,dvar,objfunc,var,solut,kersol,tra},
             {nb,alldelvar,dvar} = AllConstraints[game]; 
             objfunc= Total[dvar];
             var= Union[x /@ T, alldelvar];
             solut = Which[SameQ[callm,False],LinearOptimization[-objfunc, nb, var,{"PrimalMinimumValue","PrimalMinimizer"},Method-> mthd],  
                                   True,Rationalize[NMaximize[Prepend[{nb},objfunc],var,Method-> mthd],10^(-12)]];
             If[SameQ[callm,False],solut=ReplacePart[solut,{2}->MapThread[Rule,{var,solut[[2]]}]],True];
             kersol=(x /@ T) /.Take[solut[[2]],Length[T]];
             tra= dvar /. Take[solut[[2]],-Length[alldelvar]];
             Which[SameQ[dispres,False], kersol, True, {kersol,objfunc,nb,var,tra}]

];

KernelSubCallThir[game_,eps_,dispres_,callm_,mthd_]:= 
Block[{newgame,nb,alldelvar,dvar,objfunc,var,solut,kersol,tra},
      newgame = EpsValue[game, eps];
      {nb,alldelvar,dvar} = AllConstraints[newgame];
      objfunc= Total[dvar];
      var= Union[x /@ T, alldelvar];
      solut = Which[SameQ[callm,False],LinearOptimization[-objfunc, nb, var,{"PrimalMinimumValue","PrimalMinimizer"},Method-> mthd], 
                            True,Rationalize[NMaximize[Prepend[{nb},objfunc],var,Method-> mthd],10^(-12)]];
      If[SameQ[callm,False],solut=ReplacePart[solut,{2}->MapThread[Rule,{var,solut[[2]]}]],True];
      kersol=(x /@ T) /.Take[solut[[2]],Length[T]];
      tra= dvar /. Take[solut[[2]],-Length[alldelvar]];
      Which[SameQ[dispres,False], kersol, True, {kersol,objfunc,nb,var,tra}]

];


(* Constructing the one large LP for Kernel[] *)

AllConstraints[args___]:=(Message[AllConstraints::argerr];$Failed);
AllConstraints[game_]:=
  Block[{anf=T,rest,pi,pj,const,conset={},sub,deltaset={},deltavar={},newconst,constsys},
      While[Length[anf]>1,
      pi=First[anf];
      rest=Drop[anf,1];
      While[Length[rest]>0,pj=First[rest];
        const=TransferConstraints[game,pi,pj];
        sub=MapThread[Rule,{{ Global`\[Delta] }, {Global`\[Delta][pi,pj]}}];
        deltavar=Append[deltavar,{Global`\[Delta][pi,pj]}];
        newconst=const/.sub;
        conset=Append[conset,newconst];
        rest=Drop[rest,1];
        ];
      anf=Drop[anf,1];];
    constsys=Union[Flatten[conset]];
    {constsys,Flatten[deltavar],Flatten[deltavar]}
    ];

(* NewKernel section ends *)

(* Section starts to determine a Kernel Range from an LP. *)

KernelVertices[args___]:=(Message[KernelVertices::argerr];$Failed);
KernelVertices[game_, opts:OptionsPattern[KernelVertices]] := 
  Block[{callm, mthd, sil, epsval, fieps, kerli, ratkli, sol, obj, const, var, trans,kerQ,posker,prkQ,posprk,kl,pkl},
    callm = OptionValue[CallMaximize];
    mthd = OptionValue[Method];
    sil = OptionValue[Silent];
    epsval = OptionValue[EpsilonValue];
    fieps= FirstCriticalVal[game][[1,2]];
    epsval = If[epsval < fieps, fieps,epsval];
    {sol, obj, const, var, trans} = 
      Which[SameQ[callm,True],  Kernel[game, CallMaximize -> True, Method->mthd, EpsilonValue -> epsval, DisplayAllResults -> True], 
            True,  Kernel[game, CallMaximize -> False, Method->mthd, EpsilonValue -> epsval, DisplayAllResults -> True]];
    If[SameQ[sil,False], Print["sol: ", sol],True];
    kerli = DetermineAddVertices[{sol}, obj, const, var, T, callm,sil,mthd];
    If[SameQ[sil,False], Print["kerli: ", kerli], True];
    ratkli = Union[Rationalize[#,1.5*10^(-12)]&/@ kerli];
    kerQ=KernelImputationListQ[game,ratkli];
    prkQ=PreKernelQ[game,ratkli];
    posker=Position[kerQ,True];
    posprk=Position[prkQ,True];
    kl=Union[Extract[ratkli, posker]];
    pkl=Union[Extract[ratkli, posprk]];
    If[SameQ[kl,{}],If[SameQ[pkl,{}],{},Print["Pre-Kernel Element found!"];pkl],kl]
    ];


DetermineAddVertices[sol_, obj_, const_ , var_ , T_, callm_,sil_, mth_, zf_:{}] := 
  Block[{nwzf,dures,valzf,boolzf,dualvar,yset,duyp,newineq,nwsol,prmax,lngt,kersolQ,oldres=sol},
    nwzf = Total[var];
    dures = SolveDual[nwzf, const, var];
    valzf = First[dures];
    boolzf = SameQ[valzf,zf];
    Which[SameQ[boolzf,True], Return[oldres], True, True];
    dualvar = Global`y /@ Table[i, {i, Length[Last[dures]]}];
    yset = dualvar /. Last[dures];
    duyp = Position[yset, 0];
    newineq = Extract[const, duyp];
    nwsol = Which[SameQ[callm,True], Rationalize[NMaximize[Prepend[{newineq},nwzf],var,Method->mth]],
                    True, LinearOptimization[-nwzf, newineq, var,{"PrimalMinimumValue","PrimalMinimizer"},Method->mth]]; 
 (*   Print["nwsol=",nwsol]; *)
    Which[SameQ[First[nwsol],Infinity], Return[oldres],
          SameQ[First[nwsol],-Infinity], Return[oldres],  
          True,True];
    (* Print["nwsol2=",nwsol];*)
    prmax = First[nwsol];
    Which[SameQ[sil,False],Print["DualSol: ",{First[dures],Delete[Last[dures],duyp]}];
                           Print["PrimalSol: ",nwsol];,
                True,True];
    lngt = Length[T];
    kersolQ = Take[var, lngt] /. Take[Last[nwsol], lngt];
    AppendTo[oldres, kersolQ];
    oldres = Union[oldres];
    Which[(SameQ[sol,oldres] && Greater[2*prmax,valzf]), oldres, True, 
      DetermineAddVertices[oldres, obj, newineq, var, T, callm, sil, mth , valzf]]
];


(* Section ends to determine a Kernel Range from an LP. *)


(* Section starts to determine a PreKernel solution by a modified SDM-Method *)

(*
  First, we introduce the user interface to compute an anti-pre-kernel of the game.
  The anti-pre-kernel solution is just a reflection of the pre-kernel solution. Instead
  of balancing the maximum excesses among each pair of player, it balances the minimal
  excesses. A formal definition of the anti-pre-kernel can be found in Y. Funaki and
  H. Meinhardt (2006).
*)

AntiPreKernelSolution[args___]:=(Message[AntiPreKernelSolution::argerr];$Failed);
AntiPreKernelSolution[game_,opts:OptionsPattern[AntiPreKernelSolution]] := 
  Block[{pay},
  pay = Table[v[T],{Length[T]}]/Length[T];
  AntiPreKernelSolution[game,pay,opts]
 ];


AntiPreKernelSolution[game_, payoff_List, opts:OptionsPattern[AntiPreKernelSolution]] := 
    Block[{showzf,rattol,conjfu,sil,anti,mth,ext},
      showzf = OptionValue[ShowObjectiveFunction];
      rattol = OptionValue[RationalTol];
      conjfu = OptionValue[ConjugateFunction];
      sil = OptionValue[Silent];
      anti = OptionValue[AntiPreKernel];
      mth = OptionValue[Method]; 
      ext = OptionValue[SolutionExact];
      PreKernelSolution[game, payoff, AntiPreKernel -> anti, ConjugateFunction -> conjfu, Method -> mth, ShowObjectiveFunction -> showzf, RationalTol -> rattol, Silent -> sil, SolutionExact -> ext]
 ];

(* 
  User interface to calculate a pre-kernel solution by a mixture of Algorithm 8.1.1
  and 8.2.1 of Meinhardt (2013).
  The algorithms rely on the indirect function approach. See Meseguer-Artola (1997) and Meinhardt (2013).
  The indirect characteristic function is the conjugate (Fenchel transform) of the characteristic function.
  See Martinez-Legaz (1996).
*)

PreKernelSolution[args___]:=(Message[PreKernelSolution::argerr];$Failed);
PreKernelSolution[game_,opts:OptionsPattern[PreKernelSolution]] := 
  Block[{pay},
  pay = Table[v[T],{Length[T]}]/Length[T];
  PreKernelSolution[game,pay,opts]
 ];


PreKernelSolution[game_, payoff_List, opts:OptionsPattern[PreKernelSolution]] := 
  Block[{dimCorQ, showzf,rattol,conjfu,sil,anti,mth,ext,allres,ratres,res,detobj,grad,conj,smc,rclim},
      Off[FindMinimum::fmgz];
      dimCorQ = Which[Depth[payoff] === 3, If[SameQ[Length[#],Length[T]],True, False]&/@ payoff,
                      Depth[payoff] === 2, If[SameQ[Length[payoff],Length[T]],True, False], 
                      True, False
                ];
      If[Apply[And,dimCorQ]===False,WrongDimension;Return[],True];
      showzf = OptionValue[ShowObjectiveFunction];
      rattol = OptionValue[RationalTol];
      conjfu = OptionValue[ConjugateFunction];
      sil = OptionValue[Silent];
      anti = OptionValue[AntiPreKernel];
      mth = OptionValue[Method];
      ext = OptionValue[SolutionExact];
      smc = OptionValue[SmallestCardinality];
      rclim=If[Length[T] > 11,256,156];
      allres = Which[SameQ[Depth[payoff],3], 
                       Block[{$RecursionLimit = rclim},SDMPreKernel[game,#,Infinity,AntiPreKernel -> anti, Method -> mth, RationalTol->rattol, Silent -> sil, SmallestCardinality -> smc, SolutionExact -> ext] &/@ payoff],
                     SameQ[Depth[payoff],2], 
                       Block[{$RecursionLimit = rclim},SDMPreKernel[game, payoff,Infinity, AntiPreKernel -> anti, Method -> mth, RationalTol->rattol,  Silent -> sil, SmallestCardinality -> smc, SolutionExact -> ext]],
                     True, DisplayMessFindKernel[payoff]
                     ];
      If[SameQ[Head[allres],List],True, Return[Chop[Rationalize[N[payoff],rattol]]]];
      If[Apply[And,NumericQ[#]] &/@ allres,True,Return[Chop[Rationalize[N[payoff],rattol]]]];
      (*In the next line, we are trying to handle the exceeded depth of $RecursionLimit in case for SolutionExact -> False   *)
      If[SameQ[Head[First[allres]],ReplaceAll],allres=allres[[1, 1]] /. Table[Apply[Rule, allres[[i, 2]]], {i, 1, Length[T]}],True];
      ratres = Chop[Rationalize[N[allres],rattol]];
      res = Which[Depth[payoff] === 3, Union[ratres],
                  Depth[payoff] === 2, ratres,
                  True,ratres
                  ];
      detobj = Which[SameQ[showzf || conjfu,True],If[Depth[res]=== 3, DetObjFunc[game,#,AntiPreKernel -> anti, Silent -> sil]&/@ res, {DetObjFunc[game,res, AntiPreKernel -> anti, Silent -> sil]}],
                    True,{}];
      {grad,conj} = Which[SameQ[conjfu,True], 
                      Which[Length[detobj] === Length[res], FormatConjugateRes[game,detobj, Silent -> sil, SolutionExact -> ext ] ,
                            Length[detobj] === 1, ConvexConjugate[game,detobj, Silent -> sil, SolutionExact -> ext],
                            True,{{},{}}],
                      True,{{},{}}
                         ];
      grad = Which[Depth[grad] === 3, Union[grad],
                  Depth[grad] === 2, grad,
                  True,grad
                  ];
      detobj = If[Length[conj] === 0, detobj, 
                   Which[Length[detobj] === Length[res], MapThread[{{#1},#2}&,{detobj,conj}],
                         Length[detobj] === 1, FlattenAt[MapThread[{{#1},{#2}}&,{detobj,conj}],1],
                         True, MapThread[List,{detobj,conj}]
                         ]
                 ];
      On[FindMinimum::fmgz];
      If[SameQ[showzf,False], res, 
                 If[(SameQ[Depth[res],3] && SameQ[Length[res],1])===True,{Flatten[res], detobj,grad},{res,detobj,grad}]]
   ];

WrongDimension:=(Print["Payoff vector has not the correct dimension!"]); 
WrongCoordDimension[T_]:= Block[{},
      Print["List of unanimity coordinates of size 2 has not the correct length!"];
      Print["The correct dimension is: ", Binomial[Length[T],2]];
];
WrongCoordDimension[coord_List,T_]:= Block[{},
      Print["List of unanimity coordinates of length ", Length[coord]];
      Print["is not correct!"];
      Print["The correct dimension is: ", 2^Length[T]];
];



FormatConjugateRes[game_,detobj_List, opts:OptionsPattern[PreKernelSolution]]:= 
  Block[{sil,cr,gradv,cflist},
    sil = OptionValue[Silent];
    ext = OptionValue[SolutionExact];
    cr = ConvexConjugate[game,#, Silent -> sil, SolutionExact -> False]&/@ detobj;
    gradv = First[#] &/@ cr;
    cflist= Last[#] &/@ cr;
    {gradv,cflist}
];

(* 
 Based on Algorithm 8.1. and 8.2 of Meinhardt, (2013).
*)

SDMPreKernel[game_, payoff_List,optval_:Infinity, opts:OptionsPattern[PreKernelSolution]] := 
  Block[{smc,sil,anti,mth,rattol,ext,rl,obj,var,init,minval,nwpay,meff,matE,matQ,vmeff,ralpv,alpv,bvec,sumexc},
    anti = OptionValue[AntiPreKernel];
    ext = OptionValue[SolutionExact];
    mth = OptionValue[Method];
    rattol = OptionValue[RationalTol];
    smc = OptionValue[SmallestCardinality];
    sil = OptionValue[Silent];
    var = x[#] & /@ T;
    rl = MapThread[Rule, {var, payoff}];
    If[SameQ[ext,False],
       obj = DetObjFunc[game, payoff, AntiPreKernel -> anti, Silent -> sil, SmallestCardinality -> smc];
       obj = Which[SameQ[ToString[mth],"GUROBI"],{obj}, 
             SameQ[ToString[mth],"MOSEK"],{obj},
             SameQ[ToString[mth],"IPOPT"],{obj}, 
             True,obj];
       Which[SameQ[Head[obj],Plus],sumexc=First[{obj} /. rl], 
             SameQ[Head[First[obj]],Plus],
                        sil=True;
                        sumexc=First[obj /. rl],
             True,Return[payoff]];
       init = rl /. Rule -> List;,      
        meff = Bestcoalij01[game, payoff, AntiPreKernel -> anti, MaximumSurpluses -> False, SmallestCardinality -> smc]; 
        matE = Developer`ToPackedArray[-SetsToVec[meff, T, EffVector -> True]] //N;
        matQ = Transpose[matE].matE;
        vmeff=Map[v[#] &, #] & /@ meff;
        ralpv = {1., -1.}.# & /@ vmeff;
        alpv = Prepend[ralpv,v[T]];
        bvec = Transpose[matE].alpv;
        sumexc=Norm[matE.payoff+alpv]^2; 
       ];
    If[LessEqual[Abs[sumexc],rattol], Return[payoff],True];
    minval = Which[SameQ[ext,False], If[SameQ[sil,True], 
                                           Which[SameQ[ToString[mth],"GUROBI"],FindMinimum[obj, init, Method -> GUROBI],
                                                 SameQ[ToString[mth],"MOSEK"],FindMinimum[obj, init, Method -> MOSEK],
                                                 SameQ[ToString[mth],"IPOPT"],FindMinimum[obj, init, Method -> IPOPT], 
                                                 True,FindMinimum[obj, init, Method -> mth, AccuracyGoal -> 20, PrecisionGoal -> 18, WorkingPrecision->40]], (*Approximate solution *) 
                                           FindMinimum[obj, init, Method -> mth, AccuracyGoal -> 20, PrecisionGoal -> 18, WorkingPrecision->40, StepMonitor :> Print[init]]],
                  True, obj={};SolveLinEQ[matQ,bvec,var, Method -> "Automatic", Silent -> sil] (* Try to find an exact solution *)
             ];
    nwpay = var /. minval[[2]];
    If[SameQ[sil,False],MessageSDMKer[obj,minval,nwpay,First[minval],sumexc];
        If[SameQ[ext,False], SolveLinEQ[matQ,bvec,var, Method -> mth, Silent -> False],True],True];
    If[LessEqual[Abs[sumexc],rattol], nwpay,  
               SDMPreKernel[game, nwpay, sumexc, AntiPreKernel -> anti, Method -> mth, RationalTol->rattol,Silent -> sil,SmallestCardinality -> smc,SolutionExact -> ext]]
   ];

MessageSDMKer[zfc_:{},minw_,nwaz_, fucval_, addexc_] :=
  Block[{},
        Print["The objective function h is: ",zfc];
        Print["The local minimum of h is: ",N[minw[[1]]]];
        Print["The local minimum of the objective function h is at:\n ",nwaz];
(*        Print["The maximum surpluses are:\n", mexc];*)
        Print["The value of the original objective function H is:\n ",{addexc, N[addexc]}];
        Print["The difference between the original function H and h is: ",N[addexc - fucval]];
  ];


(* Solving a system of linear equations to find an exact solution.*)

SolveLinEQ[coefmat_List,bv_List,indvar_List,opts:OptionsPattern[PreKernelSolution]]:= 
   Block[{sil,mth,foc,syseq,rest,rl,sol,coefm},
    sil = OptionValue[Silent];
    mth = OptionValue[Method];
    coefm=Developer`ToPackedArray[coefmat];
    If[SameQ[sil,False], MessageSolveLinEQ[coefm,bv];, True];
    sol = If[Det[coefm] != 0, 
              Which[LUDecomposition[coefm][[3]] <= 10^(4),LinearSolve[coefm,-bv,Method -> mth],
                    True, matpr=SetPrecision[coefm, 30]; 
                          bvpr = SetPrecision[bv, 30];
                          LeastSquares[matpr,-bvpr, Tolerance -> 10^(-10)]
                          ], 
              PseudoInverse[coefm].(-bv)];
    rl = MapThread[Rule,{indvar,sol}];
    {rl,Rationalize[rl]}
     ];

MessageSolveLinEQ[cfmat_,bvec_] := 
  Block[{alpscal},
         alpscal = Norm[bvec]^2;
         Print["The matrix of the objective function is given by:\n", cfmat];
         Print["Is the matrix singular? \n", Det[cfmat]==0];
         Print["The column vector b of the objective function is given by:\n", bvec];
         Print["The scalar alpha of the objective function is given by:\n", alpscal];
  ];


(* Trying to determine the complete solution set of the objective function h whenever the coefficient matrix is singular *)

DetSolSet[dfconjugate_List, objf_, xvar_List, pvar_List]:= 
       Block[{objdf,orgmat,orgrest,bgvec,partsol,sparts,cgmat,gensol,solvecs,unsol,mpres},
         objdf = Developer`ToPackedArray[Simplify[D[objf[[1]],#]] &/@ xvar];
         orgmat = Coefficient[#, xvar] & /@ objdf;
         orgrest = objf[[1]] - (1/2) xvar.orgmat.xvar;
         bgvec =  Coefficient[orgrest,xvar];
         partsol=PseudoInverse[orgmat].(-bgvec);
         sparts=Total[partsol];
         cgmat=Coefficient[#, pvar] & /@ dfconjugate;
         gensol = Developer`ToPackedArray[NullSpace[cgmat][[1]]];
         solvecs = partsol + (IdentityMatrix[Length[pvar]] - PseudoInverse[orgmat].orgmat)gensol;
         unsol = Union[solvecs];
         unsol = DeleteCases[unsol,partsol];
         unsol = CheckGenRes[unsol,partsol,sparts];
         mpres=If[Length[unsol]===1,unsol[[1]],unsol];
         mpres
];

CheckGenRes[vecli_List,pvec_List,psum_?NumberQ]:=
        Block[{sumuns,cksum,psck,extps,res},
        sumuns= Which[Length[vecli]>1, Total[#] &/@ vecli,
                  True,Total[vecli]];
         cksum = Which[Length[sumuns]>1,Equal[psum,#] &/@ sumuns,
                  True, Equal[psum,sumuns]];
         psck = Position[cksum,True];
         extps = Extract[vecli,psck];
         res = If[Length[extps]===0,pvec,extps];
         res
];




(*
  Constructing for a particular payoff vector and 
  from the induced set of most effective an objective function.
*)

DetObjFunc[game_, payoff_List,opts:OptionsPattern[PreKernelSolution]] := 
   Block[{anti, smc, sil, bestc, maxsl, crlist, eqs, eff, obj},
    sil = OptionValue[Silent];
    anti = OptionValue[AntiPreKernel];
    smc = OptionValue[SmallestCardinality];
    bestc = Bestcoalij01[game, payoff, AntiPreKernel -> anti, SmallestCardinality -> smc];
    If[SameQ[sil,False], PrintMostEff[payoff, bestc],  True];
    maxsl = Map[Map[(v[#] - x[#]) &, #] &, bestc];
    crlist = Outer[List, #] & /@ Developer`ToPackedArray[maxsl];
(* 
   the sum of the quadratic differences of 
   max surpluses for each pair of players i,j in T. 
*)
    eqs = MapThread[Subtract[#1, #2]^2 &, #] & /@ Developer`ToPackedArray[crlist];
    obj = Total[eqs];
(* efficiency *)
    eff = (Total[x[#] & /@ T] - v[T])^2;
(* Meinhardt (2013) formula 7.7 *)
    First[obj] + eff 
    ];

(* 
  Next we define the user interface to compute the most
  effective coalitions to balance the maximum surpluses.
*)


PrintMostEff[payoff_List, meffc_List] := Block[{},
       Print["A set of most effective coalitions at payoff ", payoff, " is: \n",  meffc]; 
];

(* User interface to compute the set of significant coalitions at a proposal 'payoff'.  *)
BestCoalitions[args___]:=(Message[BestCoalitions::argerr];$Failed);
BestCoalitions[game_,payoff_List,opts:OptionsPattern[BestCoalitions]]:= 
  Block[{dimpay}, 
       dimpay = Dimensions[payoff]; 
      Which[Length[dimpay]===2, 
                        Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), Bestcoalij01[game,#,opts]&/@ payoff,
                                     True, WrongDimension],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ),Bestcoalij01[game,payoff,opts], 
                                     True, WrongDimension],
                    True, WrongDimension
                                   ]
];

(* 
   Here, we select the set of most effective coalitions w.r.t. payoff which induces
   the maximum surpluses.
*)

listIJ[T_List]:=Flatten[Table[Table[{i, j}, {j, i + 1, Length[T]}], {i, 1, Length[T]}]];
listJI[T_List]:=Flatten[Table[Table[{i, j}, {i, j + 1, Length[T]}], {j, 1, Length[T]}]];

Bestcoalij01[game_, payoff_List,opts:OptionsPattern[BestCoalitions]] :=  
  Block[{anti, maxsurp, allc,plvec,sij,sji,plj,pli,amax,ramax,exc,exvec,intcoal,payass,selcij,selcji,sigcoal},
    anti = OptionValue[AntiPreKernel];
    allc = OptionValue[AllCoalitions];
    maxsurp = OptionValue[MaximumSurpluses];
    plvec = Developer`ToPackedArray[Partition[listIJ[T],2]];
    pli = First[#] &/@ plvec;
    plj = #[[2]] &/@ plvec;
    sij=MapThread[TIJsets[#1,#2] &,{pli,plj}];
    sji=MapThread[TIJsets[#1,#2] &,{plj,pli}];
    payass = MapThread[Rule,{x /@ T,payoff}];
    If[SameQ[anti,False],amax = ModMaxSurpluses[game,sij,sji,payass],amax=ModAntiSurpluses[game,sij,sji,payass]];
    sij=Developer`ToPackedArray[sij];
    sji=Developer`ToPackedArray[sji];
    amax=Developer`ToPackedArray[amax];
    exc = First[ExcessPayoff[game, payoff]];
    exvec = Drop[Drop[exc, 1], -1];
    intcoal = Drop[Drop[Subsets[T], 1], -1];
    ramax = Reverse[#] &/@ amax;
    ramax=Developer`ToPackedArray[ramax];
    selcij = MapThread[SelCoal[#1, intcoal, exvec, #2, opts] &, {sij, amax}];
    selcji = MapThread[SelCoal[#1, intcoal, exvec, #2, opts] &, {sji, ramax}];
    sigcoal = If[SameQ[allc,False], MapThread[{Flatten[#1], Flatten[#2]} &,{selcij, selcji}],{selcij, selcji}];
    If[SameQ[maxsurp,False], sigcoal,{sigcoal,amax}]
    ];



SelCoal[setsij_List, coal_List, redexc_List, maxexc_List, opts:OptionsPattern[BestCoalitions]] := 
  Block[{allc, smc, detpos, extval, poscoal, extcoal},
    allc = OptionValue[AllCoalitions];
    smc = OptionValue[SmallestCardinality];
    (* The subsequent two lines consume 80% of the computation time of an pre-kernel element!!! *)
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




(*
Next, we construct an equivalence matrix from the set of most effective coalitions 
as described in Meinhardt (2013).
*)

(* User interface to compute an equivalence matrix and its intermediate results.  *)
ImputationToMatrix[args___]:=(Message[ImputationToMatrix::argerr];$Failed);
ImputationToMatrix[game_, payoff_List,  opts:OptionsPattern[BestCoalToMatrix]] := Block[{dimpay}, 
       dimpay = Dimensions[payoff]; 
      Which[Length[dimpay]===2, 
                        Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3) , ImputToMatrixMain[game,#, opts]&/@ payoff //Union,
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), ImputToMatrixMain[game, payoff,  opts], 
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];


ImputToMatrixMain[game_, payoff_List, opts:OptionsPattern[BestCoalToMatrix]]:= Block[{meff},
     meff = BestCoalitions[game, payoff, opts]; 
     BestCoalToMatrix[meff, T, opts]
];

BestCoalToMatrix[args___]:=(Message[BestCoalToMatrix::argerr];$Failed);
BestCoalToMatrix[coal_List, T_List, opts:OptionsPattern[BestCoalToMatrix]] := 
  Block[{allsol,dismat,zrv, pscoal, replzr, vecij, allmij, detQij, sumQij, detsum, mQ,
      detq},
    allsol =  OptionValue[DisplayAllResults];
    dismat = OptionValue[DisplayMatrixForm];
    vecij = SetsToVec[coal,T,EffVector -> False];
(* Tensor Product *)
    allmij = Outer[Times,#,#] &/@ vecij;
    detQij = Det[#] & /@ allmij;
    sumQij = Sum[allmij[[i]], {i, Length[allmij]}];
    detsum = Det[sumQij];
    mQ = 2*sumQij + 2 ; 
    detq = Det[mQ];
    Which[allsol === False,                         
      Which[dismat === False, {{mQ, detq}, {sumQij, detsum}}, 
        True, {{mQ, MatrixForm[mQ], detq}, {sumQij, detsum, 
            MatrixForm[sumQij]}}],   True, 
      Which[dismat === False, {{mQ, detq}, {sumQij, detsum}, {allmij, detQij}}, 
         True, {{mQ, MatrixForm[mQ], detq}, {sumQij , MatrixForm[sumQij], 
            detsum}, {allmij, MatrixForm[#] & /@ allmij, detQij}}]]
    ];

(* User interface to compute a strength matrix. (see Meinhardt 2013)  *)

ImputationToVec[args___]:=(Message[ImputationToVec::argerr];$Failed);
ImputationToVec[game_, payoff_List,  opts:OptionsPattern[ImputationToVec]] := Block[{dimpay},  
       dimpay = Dimensions[payoff]; 
      Which[Length[dimpay]===2, 
                        Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3) , ImputToVecMain[game,#, opts]&/@ payoff //Union, 
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), ImputToVecMain[game, payoff,  opts],  
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];


ImputToVecMain[game_, payoff_List, opts:OptionsPattern[ImputationToVec]]:= Block[{allr, fav, meff, stsv, skew},  
     allr = OptionValue[DisplayAllResults];
     fav = OptionValue[InFavor]; 
     meff = BestCoalitions[game, payoff, opts]; 
     stsv = SetsToVec[meff, T, opts];
     skew = If[(allr || fav)=== False, True, 
                        onesT = Table[1, {i,Length[T]}];   
                        stsv.onesT
                         ]; 
      Which[allr === True, {stsv, skew},
                     True,  If[fav === False, stsv, skew] 
                   ]
];

SetsToVec[args___]:=(Message[SetsToVec::argerr];$Failed);
SetsToVec[mg_List, T_List, opts:OptionsPattern[SetsToVec]] := 
    Block[{effvec, zrv, pscoal, replzr,coasts, onesoft},
    effvec = OptionValue[EffVector];
    zrv = Array[0 &, Length[T]];
    pscoal = Outer[List, #] & /@ Developer`ToPackedArray[mg];
    replzr = Map[ReplacePart[zrv, 1, #] &, #] & /@ pscoal;
    coasts = MapThread[Subtract[#1, #2] &, #] & /@ replzr;
    onesoft = Array[1 &, Length[T]];
    If[SameQ[effvec,True], Prepend[coasts,onesoft], coasts]
];

(* 
Replicates from the difference of unanimity coordinates the
set of best/most effective coalitions. The input is a 
 (Binom(n,2) x 2^n - 1)-matrix. 
 *)

(* User interface to determine an equivalence class from an imputation.  *)
ImputationToEqClass[args___]:=(Message[ImputationToEqClass::argerr];$Failed);
ImputationToEqClass[game_, payoff_List, opts:OptionsPattern[ImputationToEqClass]] := Block[{dimpay}, 
       dimpay = Dimensions[payoff]; 
      Which[Length[dimpay]===2, 
                        Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3) , EqClassMain[game,#, opts]&/@ payoff //Union,
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), EqClassMain[game, payoff, opts], 
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];


EqClassMain[game_, payoff_, opts:OptionsPattern[ImputationToEqClass]]:= Block[{unmatQ, unm},
    unmatQ = OptionValue[BargUnanMat];   
    unm = BargainUnanMatrix[game,payoff, EffVector -> False]; 
    If[unmatQ === False, DetEqClass[unm, T],{DetEqClass[unm, T], unm}] 
];

DetEqClass[args___]:=(Message[DetEqClass::argerr];$Failed);
DetEqClass[mat_List,T_]:= Block[{},
     Which[Dimensions[mat]==={Binomial[ Length[T],2], 2^Length[T]-1}, 
                                  FuncDetEqClass[mat, T],
                    True, WrongMatDimension[T]]

];

WrongMatDimension[T_]:= Block[{},
      Print["The unanimity matrix has not the correct dimension!"];
      Print["The correct dimension is: ", {Binomial[Length[T],2],2^Length[T]-1}];
];

FuncDetEqClass[mat_List, T_] := Block[{gb, clmat},
    gb = GameBasis[T];
    clmat = -mat.Inverse[gb];
    FindEqClass[#, T] & /@ clmat
 ];

FindEqClass[dir_List, T_] := Block[{pwmg, lhs, rhs},
    pwmg = Drop[Subsets[T], 1];
    lhs = Flatten[Position[dir, -1]];
    rhs = Flatten[Position[dir, 1]];
    Extract[pwmg, {lhs, rhs}]
];

BargainUnanMatrix[args___]:=(Message[BargainUnanMatrix::argerr];$Failed);
BargainUnanMatrix[game_, payoff_List, opts:OptionsPattern[BargainUnanMatrix]] := Block[{effvec,meff,detunan,onesv},   
    effvec = OptionValue[EffVector];   
    meff = BestCoalitions[game, payoff, EffVector -> effvec]; 
    detunan=DetUnanMat[meff, T]; 
    onesv= Table[1,{i,2^Length[T]-1}];
    If[effvec==True, Prepend[detunan,onesv], detunan]
];


DetUnanMat[bsccoal_List, T_] := Block[{powers},
    powers = Drop[Subsets[T], 1];
    DetDircSetIJ[#, powers] & /@ bsccoal
 ];


DetDircSetIJ[bsccoal_List, coal_List] := Block[{lvec, rvec},
    lvec = If[SubSetQ[#, bsccoal[[1]]], 1, 0] & /@ coal;
    rvec = If[SubSetQ[#, bsccoal[[2]]], -1, 0] & /@ coal;
    lvec + rvec
];

(* User interface to compute the value of excesses, that is, function h. (Meinhardt, 2013)  *)
ValueExcess[args___]:=(Message[ValueExcess::argerr];$Failed);
ValueExcess[excli_List] := Block[{subexc},
    subexc = Flatten[MapThread[Subtract[#1, #2] &, Outer[List, #]] & /@ excli[[1]]];
    Total[subexc^2] 
    ];

ValueExcess[game_, payoff_List] := Block[{dimpay}, 
       dimpay = Dimensions[payoff]; 
      Which[Length[dimpay]===2, 
                        Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3) , ValueExcessList[game,#]&/@ payoff,
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), ValueExcessList[game,payoff], 
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];


ValueExcessList[game_, payoff_List] := Block[{subexc, excli},
    excli = MaxSurpluses[game, payoff];
    subexc = Flatten[MapThread[Subtract[#1, #2] &, Outer[List, #]] & /@ excli];
    Total[subexc^2] 
    ];

(* User interface to compute an optimal step size.  *)
OptStepSize[args___]:=(Message[OptStepSize::argerr];$Failed);
OptStepSize[game_, payoff_List,  opts:OptionsPattern[OptStepSize]] := Block[{sil,smc,dimpay},
       sil = OptionValue[Silent];  
       smc = OptionValue[SmallestCardinality];      
       dimpay = Dimensions[payoff]; 
      Which[Length[dimpay]===2, 
                        Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3) , DirectionOfImprovement[game,#, CalcStepSize -> True, Silent -> sil, SmallestCardinality -> smc][[1]]&/@ payoff //Union,
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), DirectionOfImprovement[game,payoff, CalcStepSize -> True, Silent -> sil, SmallestCardinality -> smc][[1]], 
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];

(* Based on Algorithm 8.2.1 of Meinhardt (2013) *)
(* User interface to compute a pre-kernel element. *)
PreKernel[args___]:=(Message[PreKernel::argerr];$Failed);
PreKernel[game_,opts:OptionsPattern[PreKernel]] := 
  Block[{pay},
  pay = Table[v[T],{Length[T]}]/Length[T];
  PreKernel[game,pay,opts]
 ];


PreKernel[game_, payoff_List, opts:OptionsPattern[PreKernel]] := Block[{dimpay,rclim}, 
      dimpay = Dimensions[payoff]; 
      rclim=If[Length[T] > 11,256,156];
      Which[Length[dimpay]===2, 
                       Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), Block[{$RecursionLimit = rclim}, PreKernelAlg2[game,#, opts]&/@ payoff //Union],
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), Block[{$RecursionLimit = rclim},PreKernelAlg2[game, payoff,  opts]], 
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];


PreKernelAlg2[game_, payoff_List, opts:OptionsPattern[PreKernel]] := 
Block[{sil, smc, meff, matE, vlis, alpv,err,xvec},
  sil = OptionValue[Silent];
  smc = OptionValue[SmallestCardinality];
  meff = Bestcoalij01[game, payoff, MaximumSurpluses -> False, SmallestCardinality -> smc];
  matE = -SetsToVec[meff, T, EffVector -> True];
  vlis = MapThread[v[#1] &, {#}] &/@ meff;
  alpv = ReplaceAll[#, List -> Subtract] & /@ vlis;
  PrependTo[alpv,v[T]];
  err=Norm[matE.payoff+alpv]^2;
  If[LessEqual[err,1.5*10^(-12)],Return[payoff],     
     xvec=-PseudoInverse[matE].alpv;
               PreKernelAlg2[game,xvec,opts]]   
  ];


(* Based on Algorithm 8.3.1 of Meinhardt (2013) *)
(* User interface to compute a pre-kernel element. *)
PreKernelElement[args___]:=(Message[PreKernelElement::argerr];$Failed);
PreKernelElement[game_,opts:OptionsPattern[PreKernelElement]] := 
  Block[{pay},
  pay = Table[v[T],{Length[T]}]/Length[T];
  PreKernelElement[game,pay,opts]
 ];

PreKernelElement[game_, payoff_List, opts:OptionsPattern[PreKernelElement]] := Block[{dimpay,rclim}, 
      dimpay = Dimensions[payoff]; 
      rclim=If[Length[T] > 11,256,156];
      Which[Length[dimpay]===2, 
                       Which[(Last[dimpay]===Length[T] && Depth[payoff] ===3), Block[{$RecursionLimit = rclim}, FuncPreKernelElement[game,#, opts]&/@ payoff //Union],
                                     True, PrintRemark[payoff]],
                    Length[dimpay]===1, 
                        Which[(First[dimpay]===Length[T] && Depth[payoff] === 2 ), Block[{$RecursionLimit = rclim},FuncPreKernelElement[game, payoff,  opts]], 
                                     True, PrintRemark[payoff]],
                    True, PrintRemark[payoff]
                                   ]
      ];

(* Main Functions *)

FuncPreKernelElement[game_, payoff_List, opts:OptionsPattern[PreKernelElement]] := 
Block[{sil, rattol,smc, optst, doi, mex, optstep, itpay,tol,brc,pinv},
     sil = OptionValue[Silent];
     rattol = OptionValue[RationalTol];
     smc = OptionValue[SmallestCardinality];     
     optst = OptionValue[CalcStepSize];
     pinv = OptionValue[PseudoInv];
     {optstep, doi,mex} = Developer`ToPackedArray[DirectionOfImprovement[game, payoff, MaximumSurpluses -> True, CalcStepSize -> optst, PseudoInv->pinv,Silent -> sil, SmallestCardinality -> smc]];
     itpay =  payoff + optstep*doi;
     If[SameQ[sil,False], 
                 Print["doi=", doi];
                 Print["optstep=", optstep];
                 Print["itpay=", itpay];, 
             True];
    If[Depth[itpay]!=2,Return[payoff],True];
    tol=Table[1.5*rattol,{Length[T]}];
    brc=Apply[And,MapThread[LessEqual[#1,#2] &,{Abs[doi],tol}]];
    If[SameQ[brc,True], Rationalize[itpay,rattol], FuncPreKernelElement[game, Rationalize[itpay,rattol], CalcStepSize -> optst, Silent -> sil, SmallestCardinality -> smc]] 
];


DirectionOfImprovement[args___]:=(Message[DirectionOfImprovement::argerr];$Failed);
DirectionOfImprovement[game_, payoff_List, opts:OptionsPattern[DirectionOfImprovement]] := 
Block[{sil, smc, optst, meff, matE, matQ, matP, varpay, mex, mopt,submex, setpay, grmex, doi, optstep,pinv},
  sil = OptionValue[Silent];
  smc = OptionValue[SmallestCardinality];
  optst = OptionValue[CalcStepSize];
  pinv = OptionValue[PseudoInv];
  mopt= OptionValue[MaximumSurpluses];
  {meff, mex} = Bestcoalij01[game, payoff, MaximumSurpluses -> True, SmallestCardinality -> smc];
  matE = Developer`ToPackedArray[-SetsToVec[meff, T, EffVector -> True]] // N;
  submex = {1., -1.}.# & /@ mex;
  varpay = x[#] & /@ T;
  setpay = MapThread[Rule, {varpay, payoff}];
  grmex = v[T] - Total[x[#] & /@ T] /. setpay;
  PrependTo[submex, grmex];
  If[SameQ[sil,False], Print["submex=", submex],True];
  If[SameQ[pinv,False],
     doi = LeastSquares[matE,-submex,Tolerance -> 10^(-10)];,
     doi = -PseudoInverse[matE].submex];
  optstep = If[SameQ[optst,True], DelStar[doi, matE, submex], 1];
  If[SameQ[mopt,False],{optstep,doi},{optstep,doi,mex}]
  ];

DelStar[doi_List, matE_List, smex_List]:= 
  Block[{edvec,nrsq,tol},
  edvec = matE.doi; 
  nrsq =Norm[edvec]^2;
  tol=1.5*10^(-12);
  If[LessEqual[Abs[nrsq],tol], 0, - smex.edvec/nrsq]
];


(* 
   The convex conjugate h^{*} of the convex objective function h that characterizes
   a pre-kernel solution can be specified by the function ConvexConjugate[].
   The convex function can be obtained by the function PreKernelSolution[] 
   by invoking the option ShowObjectiveFunction -> True.
   See the Rockafellar book for the mathematical details.
*)

ConvexConjugate[args___]:=(Message[ConvexConjugate::argerr];$Failed);
ConvexConjugate[game_, confunc_,opts:OptionsPattern[ConvexConjugate]] := 
  Block[{sil, cfunc, var, norvar, zerovec, inprod, funchst, gradx, detsys, sol,coefm,solset, sol1, cgate,
      dpcgate, detsol, rlz, gradpv},
    sil = OptionValue[Silent];
    cfunc = If[Head[confunc]=== List, Flatten[confunc],{confunc}];
    cfunc = If[Length[cfunc]===1,cfunc,
              ConjugateMessage01[cfunc]; Return[]];
    var = x[#] & /@ T;
    norvar = Global`p[#] & /@ T;
    zerovec = Table[0, {i, Length[T]}];
    inprod = Total[MapThread[Times[#1, #2] &, {norvar, var}]];
    funchst = inprod - cfunc // Simplify;
    gradx = D[funchst[[1]], #] & /@ var;
    coefm=Coefficient[#,var] &/@ gradx;
    detsys = MapThread[Equal, {gradx, zerovec}];
    sol = Solve[detsys, var];
    sol1 = If[Length[sol]===0, SolSys[detsys,var],sol];
    If[Length[sol1]===0,MessageConjugate, True];
    cgate = If[Length[sol1]===0,funchst,funchst /. sol1 // Simplify];
    dpcgate = If[Length[sol1]===0,funchst,D[cgate[[1]], #] & /@ norvar];
    solset = If[Length[sol]===0, DetSolSet[dpcgate,cfunc, var, norvar], dpcgate];
    rlz = MapThread[Rule, {norvar, zerovec}];
    gradpv = If[Length[sol1]===0,funchst, If[Length[sol]!=0, Flatten[dpcgate /. rlz], solset]];
    Which[SameQ[sil,False], True,
          True, If[Length[sol]===0,ConjugateMessage02[gradpv],True]];
    If[SameQ[sil,False], ConjugateMessage03[cfunc, cgate, gradpv,sol],True];
    {gradpv, Flatten[cgate]}
    ];

MessageConjugate := Print["Warning: The system of linear equations to determine the conjugate of h has no solution."];

SolSys[eqsys_List,var_List]:=Block[{redsol},
    redsol = Reduce[eqsys,var];
    redsol = redsol /. Equal -> Rule;
    Apply[List,redsol]
];

ConjugateMessage01[hstfunc_] :=
 (Print["Wrong Dimension of the argument 'confunc'!"];
  Print["The Length of argument 'confunc' must be 1 and not ", Length[hstfunc]]);


ConjugateMessage02[gradp_List]:=
 (Print["A sub-gradient of the conjugate h^{*} at the zero vector is: \n", gradp];
  Print["The sub-gradient may not coincide with the solution of the objective function h,"];
  Print["which must be a pre-kernel solution."];
  Print["This result may be another pre-kernel solution!"];
  Print["The conjugate h^{*} is not differential at the zero vector and the solution is not a unique vector!"];
  Print["The pre-kernel solution may not be a singleton!"]
);


ConjugateMessage03[hfunc_, hstfunc_, gradhst_,sol_]:= 
    If[Length[sol]===0,ConjugateMessage03Case1[hfunc, hstfunc, gradhst],ConjugateMessage03Case2[hfunc, hstfunc, gradhst]];

ConjugateMessage03Case1[hfunc_, hstfunc_, gradhst_] := 
 (Print["The convex input function h\n", hfunc, "\n must be an objective function that determines a kernel solution."];
  Print["The conjugate function h^{*} of the convex function h is given by \n", hstfunc];
  Print["The solution\n", gradhst, "\n found for h^{*} at the zero vector is a subgradient of h^{*}."];
  Print["Thus, the conjugate h^{*} is not differentiable at the zero vector."];
  Print["Hence, the pre-kernel solution is not a singleton!"];
  Print["The subgradient found, could be a pre-kernel solution of the game."]);

ConjugateMessage03Case2[hfunc_, hstfunc_, gradhst_] := 
 (Print["The convex input function h\n", hfunc, "\n must be an objective function that determines a kernel solution."];
  Print["The conjugate function h^{*} of the convex function h is given by \n", hstfunc];
  Print["The solution\n", gradhst, "\n found for h^{*} at the zero vector is a gradient of h^{*}."];
  Print["Then the conjugate h^{*} is differentiable at the zero vector."];
  Print["The gradient must be a pre-kernel solution of the game."]);

(* Section ends to determine a PreKernel solution by a modified SDM-Method *)

(* Kernel section ends *)


(* Start mathlink section *)

(*If you have not installed cddmathlink then you should deactivate the \
functions AllVertices and all functions starting with 'Cdd'. *)		
		
		
AllVertices0[m_Integer, d_Integer, a_List] := ExternalCall[cddml,CallPacket[0,{m,d,a}]];
AllVertices[m_Integer, d_Integer, a_String] := ExternalCall[cddmlgmp,CallPacket[0,{m,d,a}]];
AllVertices2[m_Integer, d_Integer, a_String] :=ExternalCall[cddml2,CallPacket[0,{m,d,a}]];

AllVerticesWithAdjacency2[m_Integer, d_Integer, a_String] := ExternalCall[cddmlgmp,CallPacket[1,{m,d,a}]];

CddVerticesCore[args___]:=(Message[CddVerticesCore::argerr];$Failed);
CddVerticesCore[game_,opts:OptionsPattern[CddVerticesCore]] := 
  Block[{ratexact,liste,mat,values,extmat,string1,m,d1,vert1,linearity1,incidences1},
      ratexact = OptionValue[RationalExact]; 
      liste = Table[If[i>=j,1,0],{i,Length[T]},{j,Length[T]}];
      mat = Flatten[Permutations[#] & /@ liste,1];
      AppendTo[mat, -Last[mat]];
      values = v[#]& /@ Rest[Coalitions];
      AppendTo[values, -Last[values]];
      extmat=MapThread[Prepend,{mat,-values}];
      string1=ToString[extmat,InputForm];
	    {m,d1}=Dimensions[extmat];
	    {{vert1,linearity1},incidences1}=Which[SameQ[ratexact,False],AllVertices0[m,d1,Flatten[N[extmat]]], 
                                                       True,AllVertices[m,d1,string1]];
      vert1 = If[SameQ[Length[vert],1], vert1, Sort[vert1]];
      Map[Drop[ToExpression[#],1] &,  vert1]
];

CddVerticesImputationSet[args___]:=(Message[CddVerticesImputationSet::argerr];$Failed);
CddVerticesImputationSet[game_,opts:OptionsPattern[CddVerticesReasonableSet]] := 
  Block[{ratexact,liste, zwmat, finmat, bvec, extmat, string1, m, d1, vert1, linearity1, incidences1, sortlist},
   ratexact =  OptionValue[RationalExact];
   liste = Table[If[i >= j, 1, 0], {i, Length[T]}, {j, Length[T]}];
   zwmat = Flatten[Permutations[#] & /@ liste, 1];
   finmat = Append[Take[zwmat, Length[T]], Last[zwmat]];
   bvec = Append[v[{#}]&/@T, v[T]];
   extmat = MapThread[Prepend, {finmat, -bvec}];
   string1=ToString[extmat,InputForm];
   {m, d1} = Dimensions[extmat];
   {{vert1, linearity1}, incidences1} = Which[SameQ[ratexact,False],AllVertices0[m, d1, Flatten[N[extmat]]],
                                                      True,AllVertices[m, d1, string1]];
    sortlist = Which[SameQ[ratexact,False],Drop[Sort[vert1], Length[T]],
                                True,Drop[Sort[ToExpression[vert1]], Length[T]]];
   Drop[#, 1] & /@ sortlist
   ];

CddVerticesReasonableSet[args___]:=(Message[CddVerticesReasonableSet::argerr];$Failed);
CddVerticesReasonableSet[game_,opts:OptionsPattern[CddVerticesReasonableSet]] := 
  Block[{propcont,ratexact,liste, zwmat, finmat, bvec, extmat, string1, m, d1, vert1, linearity1, incidences1, sortlist},
   ratexact = OptionValue[RationalExact];
   propcont = OptionValue[ProperContribution];
   liste = Table[If[i >= j, 1, 0], {i, Length[T]}, {j, Length[T]}];
   zwmat = Flatten[Permutations[#] & /@ liste, 1];
   finmat = -Append[Take[zwmat, Length[T]], Last[zwmat]];
   bvec = Which[SameQ[propcont,False],Rationalize[Append[ReasonableOutcome[game], v[T]]],
           True,Rationalize[Append[ProperAmount[game], v[T]]]];
   extmat = MapThread[Prepend, {finmat, bvec}];
   {m, d1} = Dimensions[extmat];
   string1=ToString[extmat,InputForm];
   {{vert1, linearity1}, incidences1} = Which[SameQ[ratexact,False],AllVertices0[m, d1, Flatten[N[extmat]]],
                                                      True,AllVertices[m, d1, string1]];
   sortlist = Which[SameQ[ratexact,False],Drop[Sort[vert1], Length[T]],
                                True,Drop[Sort[ToExpression[vert1]], Length[T]]];
   Which[SameQ[Length[sortlist],1],Print["Upper Set is a unique point."],True,True];
   Drop[#, 1] & /@ sortlist
   ];



CddVerticesLowerSet[args___]:=(Message[CddVerticesLowerSet::argerr];$Failed);
CddVerticesLowerSet[game_,opts:OptionsPattern[CddVerticesLowerSet]] := 
  Block[{ratexact,liste, zwmat, finmat, bvec, smc, extmat, string1, m, d1, vert1, linearity1, incidences1, sortlist},
   ratexact = OptionValue[RationalExact];
   liste = Table[If[i >= j, 1, 0], {i, Length[T]}, {j, Length[T]}];
   zwmat = Flatten[Permutations[#] & /@ liste, 1];
   finmat = -Append[Take[zwmat, Length[T]], Last[zwmat]];
   smc = SmallestContributionVector[game];
   bvec = Rationalize[Append[smc, -v[T]]];
   extmat = MapThread[Prepend, {-finmat, bvec}];
   {m, d1} = Dimensions[extmat];
   string1=ToString[extmat,InputForm];
   {{vert1, linearity1}, incidences1}=Which[SameQ[ratexact,False],AllVertices0[m, d1, Flatten[N[extmat]]],
                                                      True,AllVertices[m, d1, string1]];
   sortlist = Which[SameQ[ratexact,False],Drop[Sort[vert1], Length[T]],
                                True,Drop[Sort[ToExpression[vert1]], Length[T]]];
   Which[SameQ[Length[sortlist],1],Print["Lower Set is a unique point."];,True,True];
   Drop[#, 1] & /@ sortlist
   ];



CddGmpVerticesCore[args___]:=(Message[CddGmpVerticesCore::argerr];$Failed);
CddGmpVerticesCore[game_,opts:OptionsPattern[CddGmpVerticesCore]] := 
   Block[{ratexact,withinc,liste,mat,values,extmat,string1,string2,m,d1,vert1,vertlist1,linearity1,incidences1,sortlist},
        ratexact = OptionValue[RationalExact]; 
        withinc = OptionValue[WithIncidences]; 
	      liste = Table[If[i>=j,1,0],{i,Length[T]},{j,Length[T]}];
	      mat = Flatten[Permutations[#] & /@ liste,1];
        AppendTo[mat, -Last[mat]];
        values = Rationalize[v[#]& /@ Rest[Coalitions]];
        AppendTo[values, -Last[values]];
        extmat=MapThread[Prepend,{mat,-values}];
        string1=ToString[extmat,InputForm];
        string2=ToString[N[extmat],InputForm];
	      {m,d1}=Dimensions[extmat];
	      {{vert1,linearity1},incidences1}= If[SameQ[ratexact,True], AllVertices[m,d1,string1],
                                            AllVertices2[m,d1,string2]];
        vert1 = If[SameQ[Length[vert1],1], vert1, Sort[vert1]];
        vertlist1 =  Map[Drop[ToExpression[#],1] &,  vert1];
        Which[(withinc == False) && (ratexact == False), Chop[vertlist1,10^(-12)],
              (withinc == False) && (ratexact == True),  vertlist1,
              (withinc == True) && (ratexact == False), {Chop[vertlist1,10^(-12)], incidences1},
              (withinc == True) && (ratexact == True), {vertlist1,incidences1},
              True, vertlist1
              ]
];


CddGmpPlotCore[args___]:=(Message[CddGmpPlotCore::argerr];$Failed);
CddGmpPlotCore[game_,opts:OptionsPattern[CddGmpPlotCore]] := 
   Block[{ratexact,liste,mat,values,extmat,string1,m1,d1,vert1,vertlist1,linearity1,sortlist1,ecdlist1,eadlist1,icdlist1,iadlist1},
     ratexact = OptionValue[RationalExact]; 
     liste = Table[If[i>=j,1,0],{i,Length[T]},{j,Length[T]}];
     mat = Flatten[Permutations[#] & /@ liste,1];
     AppendTo[mat, -Last[mat]];
     values = Rationalize[v[#]& /@ Rest[Coalitions]];
     AppendTo[values, -Last[values]];
     extmat=MapThread[Prepend,{mat,-values}];
     string1=ToString[extmat,InputForm];
     {m1,d1}=Dimensions[extmat];
	   {{vert1,linearity1},ecdlist1,eadlist1,icdlist1,iadlist1} = AllVerticesWithAdjacency2[m1,d1,string1];
     vertlist1 = Map[Drop[#,1]&, ToExpression[vert1]];
     {{vertlist1,linearity1},ecdlist1,eadlist1,icdlist1,iadlist1,extmat}
 ];

CddGmpPlotImputationSet[args___]:=(Message[CddGmpPlotImputationSet::argerr];$Failed);
CddGmpPlotImputationSet[game_] := 
  Block[{liste, zwmat, finmat, bvec, extmat, m, d1, vert1, string1, vertlist1, linearity1, sortlist, ecdlist1,eadlist1,icdlist1,iadlist1},
    liste = Table[If[i >= j, 1, 0], {i, Length[T]}, {j, Length[T]}];
    zwmat = Flatten[Permutations[#] & /@ liste, 1];
    finmat = Append[Take[zwmat, Length[T]], Last[zwmat]];
    bvec = Rationalize[Append[v[{#}]&/@T, v[T]]];
    extmat = MapThread[Prepend, {finmat, -bvec}];
    {m, d1} = Dimensions[extmat];
    string1=ToString[extmat,InputForm];
    {{vert1,linearity1},ecdlist1,eadlist1,icdlist1,iadlist1} = AllVerticesWithAdjacency2[m,d1,string1];
    vert1 = Drop[Sort[vert1],Length[T]];
    vertlist1 = Map[Drop[#,1]&, ToExpression[vert1]];
    {{vertlist1,linearity1},ecdlist1,eadlist1,icdlist1,iadlist1,extmat}
    ];

CddGmpImputationVertices[args___]:=(Message[CddGmpImputationVertices::argerr];$Failed);
CddGmpImputationVertices[game_] := 
  Block[{liste,zwmat,finmat,bvec,extmat,m,d1,vert1,string1,linearity1,sortlist,ecdlist1,eadlist1,icdlist1,iadlist1},
    liste = Table[If[i >= j, 1, 0], {i, Length[T]}, {j, Length[T]}];
    zwmat = Flatten[Permutations[#] & /@ liste, 1];
    finmat = Append[Take[zwmat, Length[T]], Last[zwmat]];
    bvec = Rationalize[Append[v[{#}]&/@T, v[T]]];
    extmat = MapThread[Prepend, {finmat, -bvec}];
    {m, d1} = Dimensions[extmat];
    string1=ToString[extmat,InputForm];
    {{vert1,linearity1},ecdlist1,eadlist1,icdlist1,iadlist1} = AllVerticesWithAdjacency2[m,d1,string1];
    vert1 = Drop[Sort[vert1],Length[T]];
    Map[Drop[#,1]&, ToExpression[vert1]]
     ];

CddGmpPlotReasonableSet[args___]:=(Message[CddGmpPlotReasonableSet::argerr];$Failed);
CddGmpPlotReasonableSet[game_,opts:OptionsPattern[CddGmpPlotReasonableSet]] := 
  Block[{propcont,liste, zwmat, finmat, reasout,propout,bvec, extmat, m, d1, vert1, vertlist1, string1, linearity1, incidences1, sortlist,ecdlist1,eadlist1,icdlist1,iadlist1},
    propcont =  OptionValue[ProperContribution];
    liste = Table[If[i >= j, 1, 0], {i, Length[T]}, {j, Length[T]}];
    zwmat = Flatten[Permutations[#] & /@ liste, 1];
    finmat = -Append[Take[zwmat, Length[T]], Last[zwmat]];
    reasout = ReasonableOutcome[game];
    propout = ProperAmount[game];
    Which[SameQ[reasout,propout],Print["Reasonable set coincides with the Upper set!"],True,True];
    bvec = Which[SameQ[propcont,False],Rationalize[Append[reasout, v[T]]],
                 True,Rationalize[Append[propout, v[T]]]];
    extmat = MapThread[Prepend, {finmat, bvec}];
    {m, d1} = Dimensions[extmat];
    string1=ToString[extmat,InputForm];
    {{vert1,linearity1},ecdlist1,eadlist1,icdlist1,iadlist1} = AllVerticesWithAdjacency2[m,d1,string1];
    vert1 = Drop[Sort[vert1],Length[T]];
    vertlist1 = Map[Drop[#,1]&, ToExpression[vert1]];
    Which[SameQ[Length[vertlist1],1],Print["Upper Set is a unique point."];,True,True];
    {{vertlist1,linearity1},ecdlist1,eadlist1,icdlist1,iadlist1,extmat}
    ];


CddGmpPlotLowerSet[args___]:=(Message[CddGmpPlotLowerSet::argerr];$Failed);
CddGmpPlotLowerSet[game_,opts:OptionsPattern[CddGmpPlotLowerSet]] := 
  Block[{liste, zwmat, finmat, bvec, smc, extmat, m, d1, vert1, vertlist1, string1, linearity1, incidences1, sortlist,ecdlist1,eadlist1,icdlist1,iadlist1},
    liste = Table[If[i >= j, 1, 0], {i, Length[T]}, {j, Length[T]}];
    zwmat = Flatten[Permutations[#] & /@ liste, 1];
    finmat = -Append[Take[zwmat, Length[T]], Last[zwmat]];
    smc = SmallestContributionVector[game];
    Which[SameQ[smc,Table[0,{i,Length[T]}]], Print["The Lower Set coincides with the Imputation Set!"],
                True,True];
    bvec = Rationalize[Append[smc, -v[T]]];
    extmat = MapThread[Prepend, {-finmat, bvec}];
    {m, d1} = Dimensions[extmat];
    string1=ToString[extmat,InputForm];
    {{vert1,linearity1},ecdlist1,eadlist1,icdlist1,iadlist1} = AllVerticesWithAdjacency2[m,d1,string1];
    vert1 = Drop[Sort[vert1],Length[T]];
    vertlist1 = Map[Drop[#,1]&, ToExpression[vert1]];
    Which[SameQ[Length[vertlist1],1],Print["Lower Set is a unique point."];,True,True];
    {{vertlist1,linearity1},ecdlist1,eadlist1,icdlist1,iadlist1,extmat}
    ];

BaryCenter[args___]:=(Message[BaryCenter::argerr];$Failed);
BaryCenter[game_]:=Block[{crv},
     crv=CddGmpVerticesCore[game];
     Total[crv]/Length[crv]
		   ];


AnimationKernelProperty2d[game_, opts:OptionsPattern[AnimationKernelProperty2d]] := 
 Block[{uppval,lowval,stpsize,detlow,manip,fs},
    fs  =  OptionValue[FigureSize];
    uppval = OptionValue[UpperCritVal];
    lowval = OptionValue[LowerCritVal];
    stpsize = OptionValue[IncSize];
    manip = OptionValue[UseManipulate];
    detlow = If[lowval=={},First[EpsCore[game]], lowval[[1]]];
    If[SameQ[manip,False],
             Table[StrongEpsCore2d[game, FigureSize -> fs, EpsilonValue -> t,Labeling -> False], {t, uppval[[1]], detlow, stpsize[[1]]}],
             Manipulate[StrongEpsCore2d[game, FigureSize -> fs,EpsilonValue -> t,Labeling -> False], {{t, uppval[[1]],"Epsilon"}, detlow, uppval[[1]], stpsize[[1]]}]
      ]
    ];


StrongEpsCore2d[args___]:=(Message[StrongEpsCore2d::argerr];$Failed);
StrongEpsCore2d[game_, opts:OptionsPattern[StrongEpsCore2d]] := 
 Block[{fs,lab,oldvls,epsval,epsvls,newgame,vertlist,vert,cvh,mv,vpts,lgd,origgame,gr1,gr2,gr2b,gr,grli},
     fs  =  OptionValue[FigureSize];
     epsval = OptionValue[EpsilonValue];
     lab = OptionValue[Labeling];
     oldvls= v[#] & /@ Subsets[T];
     gr1=FilledCoreV6[game,DisplayLegend -> False,Silent -> True];
     epsvls = EpsValue[game, epsval];
     epsvls = Prepend[epsvls,0];
     epsvls = Append[epsvls,Last[oldvls]];
     newgame= DefineGame[T,epsvls];
     vertlist=CddGmpVerticesCore[newgame];
     vert=Vec3DToSimplex[#] & /@ vertlist;
     cvh= ConvexHull[vert];
     AppendTo[cvh,First[cvh]];
     mv=Mean[vert];
     vpts = Point[#] &/@ vert;
     lgd = If[SameQ[lab,True],MapThread[Text[#1,1.15*#2-0.15*mv] &, {vertlist,vert}],{}];
     gr2=Graphics[{Thick, GraphicsComplex[vert, Line[cvh]]}];
     gr2b=If[SameQ[lgd,{}],{},Graphics[{{Brown,PointSize[0.015],vpts},lgd}]];
     origgame=DefineGame[T,oldvls];
     grli=Flatten[{gr1,gr2,gr2b}];
     gr=Show[grli,ImageSize -> fs,PlotLabel -> StringJoin["eps=",ToString[N[epsval]]]];
     Return[gr];
];

FilledCoreV6[args___]:=(Message[FilledCoreV6::argerr];$Failed);
FilledCoreV6[game_, opts:OptionsPattern[FilledCoreV6]] := 
  Block[{dlg,fs,sil,prim,vertlist,impext,solv,vert,mv1,mv2,imp,clm,lgd1,lgd2,vpts,ipts,spts,redead,rg,impred,dltr,cvh,tric,crdli,trpts,gr0,gr0b,gr1,gr1b,gr2,gr3,grli,gr},
    dlg  = OptionValue[DisplayLegend];
    fs  =  OptionValue[FigureSize];
    sil  = OptionValue[Silent];
    prim = OptionValue[PreImpSet];	 
    vertlist=CddGmpVerticesCore[game];
    impext= If[SameQ[prim,True],Permutations[{v[T],0,0}],CddGmpImputationVertices[game]];
    solv =  PointSol[game];
    vert = If[SameQ[vertlist,{}],
                      If[SameQ[sil,False],Print["Core is empty"],True];{},
                    Vec3DToSimplex[#] & /@ vertlist];
    imp = Vec3DToSimplex[#] & /@ impext;
    mv1 = If[SameQ[vert,{}],{},Mean[vert]];
    mv2 = Mean[imp];
    lgd1 = If[SameQ[vert,{}],{},MapThread[Text[#1,1.15*#2-0.15*mv1] &, {vertlist,vert}]];
    lgd2 = MapThread[Text[#1,1.1*#2-0.1*mv2] &, {impext,imp}];
    vpts = If[SameQ[vert,{}],{},Point[#] &/@ vert];
    ipts = Point[#] &/@ imp;
    spts = Point[#] &/@ solv;
    redead = Delete[T,#] &/@ T;
    rg = Range[3];
    impred=MapThread[Append,{redead,rg}];
    trpts = If[SameQ[vert,{}],{},
                        dltr = DelaunayTriangulation[vert];
                        cvh= ConvexHull[vert];
                        AppendTo[cvh,First[cvh]];
	                Flatten[Drop[#, 1]] & /@ dltr];
    gr0=Graphics[{Thick, GraphicsComplex[imp, Line[impred]]}];
    gr0b=Graphics[{{Gray,PointSize[0.015],ipts},lgd2}];
    gr1=If[GreaterEqual[$VersionNumber,10.],
	   If[SameQ[vert,{}],{}, ConvexHullMesh[vert]],
	   If[SameQ[vert,{}],{},Graphics[{LightBlue, GraphicsComplex[vert,Polygon[trpts]]}]]];
    gr1b=If[SameQ[vert,{}],{},Graphics[{{Blue,PointSize[0.015],vpts},lgd1}]];
    gr2=If[SameQ[vert,{}],{},Graphics[{Thick, GraphicsComplex[vert, Line[cvh]]}]];
    clm = {LightRed,Green,Blue,Red};
    gr3 = Flatten[MapThread[Graphics[{#1,PointSize[0.018],#2}] &,{clm,spts}]];
    grli = Flatten[{gr0,gr0b,gr1,gr1b,gr2,gr3}];
    gr = Show[grli,ImageSize -> fs];
    gr = If[SameQ[dlg,True], ShowLegend[gr,{{{Graphics[{Blue, Disk[{0, 0}, 0.005]}], "Shapley Value"}, {Graphics[{Green, Disk[{0, 0}, 0.005]}], "Nucleolus"}, {Graphics[{LightRed, Disk[{0, 0}, 0.005]}], "Kernel"},{Graphics[{Red, Disk[{0, 0}, 0.005]}], "Pre-Kernel"}}, LegendShadow -> None, LegendTextSpace -> 5,LegendPosition -> {1.1, -.4},LegendSize->{0.5,0.25}}],gr];
    Return[gr];
    ];

PointSol[game_] :=
  Block[{kr,nc,shv,prk},
    kr=Kernel[game];
    nc=ModifiedNucleolus[game];
    shv = ShapleyValue[game];
    prk = PreKernelSolution[game];
    nc = If[SameQ[nc,ker],nc,kr];
    Vec3DToSimplex[#] &/@ {kr,nc,shv,prk}
];



(* Function FilledCore[] is deprecated. Use TuGames Version 1.8 if you need this function. *)


Vec3DToSimplex[{x1_?NumberQ, x2_?NumberQ, x3_?NumberQ}] := 
  Block[{}, {(x2 - x1) Sqrt[3]/2, x3 - (x1 + x2)/2}];

(* Borrowed from
https://stackoverflow.com/questions/3506982/projecting-points-from-4d-space-into-3d-space-in-mathematica 
*)

Vec4DToSimplex[{x1_?NumberQ, x2_?NumberQ, x3_?NumberQ, x4_?NumberQ}] := 
  Block[{}, {x2 + 1/2 * (x3 + x4), Sqrt[3] * (x3/2 + x4/6), Sqrt[6] * x4/3}];

(* End mathlink section *)


(* section adjusted worth vector starts *)

AdjustedWorthVectors[args___]:=(Message[AdjustedWorthVectors::argerr];$Failed);

AdjustedWorthVectors[game_, k_Integer] := Block[{permliste},
   If[Depth[k]==1,
    permliste = Permutations[T];
      Table[If[SubCall1[#, i, k], 
          Map[v, PlayerIJoin[#, i]][[1]] - Map[v, PDeltaI[#, i]][[1]],
          If[SubCall2[#, i, k], UtopiaPayoff[game, i],
             v[T] - Map[v, PDeltaI[#, i]][[1]] - UtopiaSum[game, DeltaJSet[#, k]]]
             ], {i, Length[T]}] & /@ permliste, 
         DisplayRem[k]
    ]
   ];

DisplayRem[k_Integer]:=(
         Print["Depth is equal to ",Depth[k]];
         Print["Usage: AdjustedWorthVectors[game,k] and kCover[game,k]"];
         Print["The varibale 'k' has not the correct input format."];
         Print["The variable 'k' must be a natural number and not a list."]);

SubCall1[permele_, player_, k_Integer] := permele[[player]] < k;
SubCall2[permele_, player_, k_Integer] := permele[[player]] > k;

PDeltaI[list_, player_] := Block[{thresh, newlist, genlist = {}, retval},
    thresh = list[[player]];
    newlist = DeleteCases[list, list[[player]]];
    retval = If[# < thresh, Append[genlist, #], {}] & /@ newlist;
    pdel=List[Sort[Flatten[retval]]];
    If[Depth[pdel]==2,Union[pdel],Union[#] & /@ pdel]
    ];

PlayerIJoin[list_, player_] :=  Block[{pl},
  pl=List[Sort[Flatten[Append[PDeltaI[list, player], player]]]];
  If[Depth[pl]==2,Union[upl],Union[#] & /@ pl]
];

DeltaJSet[list_, k_Integer] := Block[{genlist = {}, pos, retval},
    pos = Flatten[If[# > k, Append[genlist, #], {}] & /@ list];
    retval = Sort[Flatten[Position[list, #] & /@ pos]];
    If[Depth[retval]==2,Union[retval],Union[#] & /@ retval]
    ];



(* section adjusted worth vector ends *)


(* section general k-convex functions starts *)


Nuc1convex[args___]:=(Message[Nuc1convex::argerr];$Failed);
Nuc1convex[game_ /; OneConvexQ[game]]:= UpperVector[game] - Extract[Gap[game],-1] / Length[T];

OneConvexQ[game_]:=Block[{},
			 If[SameQ[First[kConvexity[game]],1],Return[True],
			    Print["Game is not 1-convex! No solution can be retrieved!"];Return[False]];

		 ];

EANSCValue[args___]:=(Message[EANSCValue::argerr];$Failed);
EANSCValue[game_]:= UpperVector[game] - Extract[Gap[game],-1] / Length[T]; 


UtopiaPayoff[args___]:=(Message[UtopiaPayoff::argerr];$Failed);
UtopiaPayoff[i_]:= v[T] - v[DeleteCases[T,i]] /;
    Last[Gap[game]] > 0 && Gap[game][[i + 1]] > 0;

UtopiaPayoff[game_, i_] :=
    v[T] - v[DeleteCases[T, i]] /;
        Last[Gap[game]] > 0 && Gap[game][[i + 1]] >= 0;

UpperPayoff[args___]:=(Message[UpperPayoff::argerr];$Failed);
UpperPayoff[i_]:= v[T] - v[DeleteCases[T,i]];

UpperPayoff[game_, i_]:= v[T] - v[DeleteCases[T,i]];

UtopiaSum[args___]:=(Message[UtopiaSum::argerr];$Failed);
UtopiaSum[game_, S_List]:=  Plus  @@ UtopiaPayoff /@ S;

UtopiaVector[args___]:=(Message[UtopiaVector::argerr];$Failed);
UtopiaVector[game_]:= UtopiaPayoff[game,#] & /@ T;

UpperVector[args___]:=(Message[UpperVector::argerr];$Failed);
UpperVector[game_]:= UpperPayoff[game,#] & /@ T;

UpperSum[args___]:=(Message[UpperSum::argerr];$Failed);
UpperSum[game_, S_List]:=  Plus  @@ UpperPayoff /@ S;


Gap[args___]:=(Message[Gap::argerr];$Failed);
Gap[game_]:= (UpperSum[game,#] - v[#]) & /@ Coalitions;

(* Generalized Gap Function *)

GenConcession[args___]:=(Message[GenConcession::argerr];$Failed);

GenConcession[game_]:= Map[Min,Table[(GenUpperSum[game,#] - v[#]) &  /@ W[i],{i,Length[T]}]];

GenUtopiaPayoff[game_, i_] :=
    v[T] - v[DeleteCases[T, i]] /;
        Last[GenGap[game]] > 0 && GenGap[game][[i + 1]] >= 0;

GenUpperPayoff[args___]:=(Message[GenUpperPayoff::argerr];$Failed);
GenUpperPayoff[i_]:= Max[(v[#] - v[DeleteCases[#,i]]) &/@ Coalitions];

GenUpperPayoff[game_, i_]:= Max[(v[#] - v[DeleteCases[#,i]]) &/@ Coalitions];

GenUpperSum[args___]:=(Message[GenUpperSum::argerr];$Failed);
GenUpperSum[game_, S_List]:=  Plus  @@ GenUpperPayoff /@ S;

GenGap[args___]:=(Message[GenGap::argerr];$Failed);
GenGap[game_]:= (GenUpperSum[game,#] - v[#]) & /@ Coalitions;

GenUpperVector[args___]:=(Message[UpperVector::argerr];$Failed);
GenUpperVector[game_]:= GenUpperPayoff[game,#] & /@ T;

vkS[game_,S_List]:= UpperSum[game,S] - Take[Gap[game],-1];

kCover[args___]:=(Message[kCover::argerr];$Failed);
kCover[game_,k_Integer]:= If[Depth[k]==1,
       Flatten[If[Length[#] < k, v[#], vkS[game,#]] & /@ Coalitions],
       DisplayRem[k]
  ];

kConvexity[args___]:=(Message[kConvexity::argerr];$Failed);
kConvexity[game_]:=
	Block[{kcov,clv,grQ,cvQ},
	  kcov=kCover[ExpGame,#] &/@ T;
	  clv=v[#] &/@ Subsets[T];
	  grQ=Apply[And ,#] &/@ (MapThread[GreaterEqual,{#,clv}] &/@ kcov);
	  cvQ=ConvexQ[DefineGame[T,#]] &/@ kcov;
	  DefineGame[T, clv];(*Redefine the original game.*)
	  T*MapThread[And,{cvQ,grQ}] /. True -> 1 /. False -> 0
  ];

AdjustedEffVector[args___]:=(Message[AdjustedEffVector::argerr];$Failed);

AdjustedEffVector[game_,i_Integer]:= UpperVector[game] - Last[Gap[game]] Extract[Permutations[
                      Prepend[Table[0 j,{j,Length[T]-1}],1]],i
];

AdjustedEffUpperVectors[args___]:=(Message[AdjustedEffUpperVectors::argerr];$Failed);

AdjustedEffUpperVectors[game_]:=AdjustedEffVector[game,#] & /@ T;


Concession[args___]:=(Message[Concession::argerr];$Failed);

Concession[game_]:= Map[Min,Table[(UpperSum[game,#] - v[#]) &  /@ W[i],{i,Length[T]}]];

DisagreeConvex[args___]:=(Message[DisagreeConvex::argerr];$Failed);

DisagreeConvex[game_]:=UpperPayoff[#]-Extract[Gap[game],#+1] & /@ T;


Disagreement[args___]:=(Message[Disagreement::argerr];$Failed);

Disagreement[game_]:= UpperVector[game] - Concession[game];


TauVal[game_]:= UpperVector[game] - (Extract[Gap[game],-1] Concession[game])/Total[Concession[game]];

TauValue[args___]:=(Message[TauValue::argerr];$Failed);

TauValue[game_]:= Which[Last[Gap[game]]==0,Tau[game],
			Last[Gap[game]]>0,TauVal[game],
		        True,Print["Game is not quasi-balanced!"];{}];
Tau[game_]:= UpperVector[game];

(* Chi-Value, it is a generalized Tau-Value. *)

ChiVal[game_]:= Block[{sc},
		      sc=Total[GenConcession[game]];
			       If[SameQ[sc,0],Print["Game is not essential!"];{},
				  GenUpperVector[game] - (Extract[GenGap[game],-1] GenConcession[game])/sc]
			 ];

ChiValue[args___]:=(Message[ChiValue::argerr];$Failed);

ChiValue[game_]:= Which[Last[GenGap[game]]==0,Chi[game],
			Last[GenGap[game]]>0,ChiVal[game],
		        True,Print["Game is not essential!"];{}];

ChiValue[game_]:= If[Last[GenGap[game]]==0,Chi[game],ChiVal[game]];
Chi[game_]:= GenUpperVector[game];


GatelyValue[args___]:=(Message[GatelyValue::argerr];$Failed);
GatelyValue[game_]:=Block[{dess,d,uv,vi},
			  vi=v[{#}] & /@ T;
			  dess = v[T] - Total[vi];
                          d=(Plus  @@ UpperPayoff /@ T -v[T])/dess;
			  uv=UpperPayoff[#] & /@ T;
			  If[SameQ[EssentialQ[game],True],
			     If[SameQ[d,-1],Print["Divison by Zero! No Gately Point can be retrieved!"];{},(uv+d*vi)/(d+1)],
			     Print["Game is not essential, Gately Point does not exist!"];{}]
		    ];




(* section general k-convex functions ends *)


(* Some Proportional Division Rules  *)
PDValue[args___]:=(Message[PDValue::argerr];$Failed);
PDValue[game_]:=Block[{vi,trQ},
		      vi=v[{#}] & /@ T;
		      trQ=Apply[And, Greater[#, 0] & /@ vi];
	              If[SameQ[trQ,True],
		        (vi/Total[vi])*v[T],
		          Print["Game is not individually positive! No PD-Value computed!"];{}]
		    ];

EPSDValue[args___]:=(Message[EPSDValue::argerr];$Failed);
EPSDValue[game_]:=Block[{vi,trQ},
		      vi=v[{#}] & /@ T;
		      trQ=Apply[And, Greater[#, 0] & /@ vi];
		      Svi=Total[vi];
	              If[SameQ[trQ,True],
		         (1/Length[T])*Svi + (vi/Svi)*(v[T]-Svi),
		          Print["Game is not individually positive! No EPSD-Value computed!"];{}]
		    ];



(* section miscellaneous functions starts *)

DuttaRay[args___]:=(Message[DuttaRay::argerr];$Failed);
DuttaRay[game_,opts:OptionsPattern[DuttaRay]] := 
 If[ConvexQ[game], DuttaRayMain[game,opts], 
  Print["Warning: Game is not convex!"]; {}];


DuttaRayMain[game_,opts:OptionsPattern[DuttaRay]] := Block[{dp,rap,vrs, vN, objf, cr, prob, sol},
  dp=OptionValue[DigitPrecision];
  rap=OptionValue[RationalApproximate];
  mthd=OptionValue[Method];							      
  vrs = x[#] & /@ T;
  vN = Table[v[T]/Length[T], {i, 1, Length[T]}];
  objf = Total[MapThread[Subtract, {vrs, vN}]^2];
  cr = Core[game];
  prob = Prepend[{cr}, objf];
  sol = Which[SameQ[ToString[mthd],"GUROBI"],NMinimize[prob, vrs, Method -> GUROBI],
        SameQ[ToString[mthd],"Gurobi"],NMinimize[prob, vrs, Method -> GUROBI],
        SameQ[ToString[mthd],"MOSEK"],NMinimize[prob, vrs, Method -> MOSEK],
        SameQ[ToString[mthd],"Mosek"],NMinimize[prob, vrs, Method -> MOSEK],
        SameQ[ToString[mthd],"IPOPT"],NMinimize[prob, vrs, Method -> IPOPT],
        SameQ[ToString[mthd],"Ipopt"],NMinimize[prob, vrs, Method -> IPOPT],
        True, NMinimize[prob, vrs,WorkingPrecision -> dp,Method -> mthd]
       ];
  sol = If[SameQ[rap,True],Rationalize[sol, 10^(-6)],sol];
  vrs /. Cases[sol, {__Rule}, \[Infinity]] // Flatten
  ];


LorenzSolution[args___]:=(Message[LorenzSolution::argerr];$Failed);
LorenzSolution[game_,opts:OptionsPattern[LorenzSolution]] := Block[{dp,rap,vrs, vN, objf, cr, prob, sol},
  dp=OptionValue[DigitPrecision];
  rap=OptionValue[RationalApproximate];
  mthd=OptionValue[Method];
  vrs = x[#] & /@ T;
  vN = Table[v[T]/Length[T], {i, 1, Length[T]}];
  objf = Total[MapThread[Subtract, {vrs, vN}]^2];
  cr = If[CoreQ[game],Core[game],{};Break[]];
  prob = Prepend[{cr}, objf];
  sol = Which[SameQ[ToString[mthd],"GUROBI"],NMinimize[prob, vrs, Method -> GUROBI],
        SameQ[ToString[mthd],"Gurobi"],NMinimize[prob, vrs, Method -> GUROBI],
        SameQ[ToString[mthd],"MOSEK"],NMinimize[prob, vrs, Method -> MOSEK],
        SameQ[ToString[mthd],"Mosek"],NMinimize[prob, vrs, Method -> MOSEK],
        SameQ[ToString[mthd],"IPOPT"],NMinimize[prob, vrs, Method -> IPOPT],
        SameQ[ToString[mthd],"Ipopt"],NMinimize[prob, vrs, Method -> IPOPT],
        True, NMinimize[prob, vrs,WorkingPrecision -> dp,Method -> mthd]
       ]; 
  sol = If[SameQ[rap,True],Rationalize[sol, 10^(-6)],sol];
  vrs /. Cases[sol, {__Rule}, \[Infinity]] // Flatten
  ];

MargValue[args___]:=(Message[MargValue::argerr];$Failed);
MargValue[game_]:=Block[{perm,list},
  list = T;
  perm = Permutations[list];
  MapThread[Subtract,{Map[v,pred[#]],Map[v,mengen[#]]}] & /@ perm
];

pred[list_]:= Block[{post,vorg,ober},
		post = Flatten[Flatten[Position[list,#]] & /@ T];
		vorg = Take[list,post[[#]]-1] & /@ T;
	        Sort[Extract[FlattenAt[MapThread[List,{vorg,T}],{#,1}],#]] & /@ T
		];

mengen[list_]:= Block[{post},
                post = Flatten[Flatten[Position[list,#]] & /@ T];
                Sort[Take[list,post[[#]]-1]] & /@ T
	];

CoreElementsQ[args___]:=(Message[CoreElementsQ::argerr];$Failed);

CoreElementsQ[game_,payoffs_List]:= Block[{},
  Which[Depth[payoffs] == 3, InCoreQ[#,game] & /@ payoffs,
        Depth[payoffs] == 2, InCoreQ[payoffs,game],
        True, DisplayUsageRem[payoffs]
    ]
   ];


(* The Balanced Inequality of a Game must be satisfied for all balanced systems to
   indicate that the core is non-empty.
   
   This function checks only if a balanced system satisfies the 
   Balanced Inequality of a Game.
*)

BalancedInequalityQ[args___]:=(Message[BalancedInequalityQ::argerr];$Failed);
BalancedInequalityQ[game_, coll_List] := Block[{bcQ, vS, cf, inQ},
   {bcQ, cf} = BalancedSystemQ[coll, T];
   vS = v[#] & /@ coll;
   inQ = If[SameQ[bcQ, True], LessEqual[vS.cf, v[T]], 
             Print["Collection of Sets is not balanced!!"]; False]; 
   Return[inQ];
   ];


(*
An imputation x is in the core iff x =< dual v.
*)
BelongToCoreQ[args___]:=(Message[BelongToCoreQ::argerr];$Failed);

BelongToCoreQ[game_, payoffs_List] := Block[{},
    Which[Depth[payoffs] == 3, PayList[game, payoffs],  
          Depth[payoffs] == 2, PaySole[game, payoffs],
          True,DisplayUsageRem[payoffs]
       ]
     ];

DisplayUsageRem[payoffs_List] := (      
       Print["Depth is equal to ",Depth[payoffs]];
       Print["Usage: BelongToCoreQ[game,payoffs] and CoreElementsQ[game,payoffs]"];
       Print["Input format of the variable 'payoffs' is not correct."];
       Print["The variable 'payoffs' must be a list of payoff vectors or a single payoff vector."]);


PayList[game_, list_] := 
  Block[{totsumS, imp, assalloc, ducoal, ins, trueli, wahrQ},
    totsumS := x[#] & /@ Coalitions; 
    imp = x[#] & /@ T;
    assalloc = MapThread[Rule, {imp, #}] & /@  list;
    ins = totsumS /. assalloc // Rationalize;
    ducoal = DualGame[game];
    trueli = MapThread[LessEqual, {#, ducoal}] & /@ ins;
    wahrQ = Apply[And, #] & /@ trueli;
    wahrQ
    ];



PaySole[game_, payoff_] := 
  Block[{totsumS, imp, assalloc, ducoal, ins, trueli, wahrQ},
    totsumS := x[#] & /@ Coalitions; 
    imp = x[#] & /@ T;
    assalloc = MapThread[Rule, {imp, payoff}];
    ins = totsumS /. assalloc // Rationalize;
    ducoal = DualGame[game];
    trueli = MapThread[LessEqual, {ins, ducoal}];
    wahrQ = Apply[And, trueli] ;
    wahrQ
    ];

exzess:=(v[#]-x[#])& /@ Coalitions;

GameBasis[args___]:=(Message[GameBasis::argerr];$Failed);
GameBasis[T_] := Block[{mgsys,gb},
    mgsys = Developer`ToPackedArray[Drop[Subsets[T], 1]];
    gb = Table[If[SubSetQ[mgsys[[i]], #], 1, 0] & /@ mgsys, {i, Length[mgsys]}]; 
    Transpose[gb]
];

CharacteristicValues[args___]:=(Message[CharacteristicValues::argerr];$Failed);
CharacteristicValues[coord_List,T_,opts:OptionsPattern[]]:= Block[{},
      Which[ Length[coord] === 2^Length[T] , DetWorth[coord,T] ,
                    True, WrongCoordDimension[coord, T]]
];


DetWorth[coord_List, T_, opts:OptionsPattern[]]:=Block[{tugb, cval},
                 tugb = GameBasis[T] //N;
                 cval = tugb.N[Drop[coord,1]];
                 Prepend[cval,0]
];

CoordS[args___]:=(Message[CoordS::argerr];$Failed);
CoordS[game_,S_List]:=Block[{liste,upper,iterat,mult,koeffient,value},
	liste=(Length[#])& /@ Subsets[S];
	upper=Table[Length[S],{Length[liste]}];
	iterat=MapThread[Subtract,{upper,liste}];
	mult= Table[-1,{Length[liste]}];
	koeffient=MapThread[Power,{mult,iterat}];
	value=(v[#])& /@ Subsets[S];
	Total[MapThread[Times,{koeffient,value}]]
];

UnanimityCoordinates[args___]:=(Message[UnanimityCoordinates::argerr];$Failed);
UnanimityCoordinates[game_]:=(CoordS[game,#])& /@ Coalitions;

HarsanyiDividends[args___]:=(Message[HarsanyiDividends::argerr];$Failed);
HarsanyiDividends[game_]:=Block[{gb,valvec,unc},
                  gb = GameBasis[T];
                  valvec = v[#] &/@ Subsets[T];
                  unc = Inverse[gb].Drop[valvec,1];
                  Prepend[unc,0]
];

UnanConvexQ[args___]:=(Message[UnanConvexQ::argerr];$Failed);
UnanConvexQ[coord_List,T_,opts:OptionsPattern[UnanConvexQ]]:=Block[{},
                 Which[Length[coord] != 2^Length[T] , WrongCoordDimension[coord, T];,
                               UnanSize2NonNegQ[coord,T] === True, UnanConvexIffCondQ[coord,T,opts],
                                True, Print["Game is not convex!"]; 
                                      Print["Negative input values of size 1 or 2 are detected!"];
                                      Return["False"];               
  ]
];



UnanConvexIffCondQ[coord_List, T_, opts:OptionsPattern[UnanConvexQ]] := 
  Block[{dispres, discrd, npr,plpairs, ineq, lam, rlcrd, nneg,pwsets,rtnneg,trq, trfl},
    dispres = OptionValue[DisplayAllResults];
    discrd = OptionValue[DisplayCoord];
    npr = OptionValue[NumericalPrec];
    pwsets = Subsets[T];
    plpairs = PlayerPairs[T];
    ineq = DetInEq[#, T] & /@ plpairs;
    lam = \[Lambda][#] & /@ pwsets;
    rlcrd = MapThread[Rule, {lam, coord}];
    nneg = ineq /. rlcrd;
    rtnneg = If[npr !=  10^(-12), Chop[nneg,npr], Chop[nneg,10^(-12)]];
    trq = Union[Flatten[NonNegative[rtnneg]]];
    trfl = Apply[And, trq];
    Which[dispres === True,  {trfl, rtnneg},
                  discrd === True,  rtnneg,
                  True, trfl
   ]
];


DetInEq[spij_List, T_] := Block[{pwset},
    pwset = Subsets[T];
    DeleteCases[InEqCond[spij, #] & /@ pwset, 0]
 ];

InEqCond[splij_List, submg_List] := 
  Block[{mgsys, incij, trps, extset, uncoord},
    mgsys = DeleteCases[DeleteCases[Subsets[submg], {_}], {}];
    incij = SubSetQ[splij, #] & /@ mgsys;
    trps = Position[incij, True];
    extset = Extract[mgsys, trps];
    uncoord = \[Lambda][#] & /@ extset;
    Total[uncoord]
 ];


(* See Solano and Rafels, 1996 *)
UnanAvConvexQ[args___]:=(Message[UnanAvConvexQ::argerr];$Failed);
UnanAvConvexQ[coord_List,T_,opts:OptionsPattern[UnanAvConvexQ]]:=Block[{},
                 Which[Length[coord] != 2^Length[T] , WrongCoordDimension[coord, T];,
                              True, UnanAvConvexIffCondQ[coord,T,opts]
  ]
];


UnanSize2NonNegQ[coord_List,T_]:=Block[{no,tkno},
               no = Length[T] + 1 + Binomial[Length[T],2];                
               tkno = Take[coord,no];
               Union[NonNegative[tkno]] === {True}
];


UnanAvConvexIffCondQ[coord_List, T_, opts:OptionsPattern[UnanAvConvexQ]] := 
  Block[{dispres, discrd, npr, pwsets, setsgr2, nneg,rtnneg, trq,trfl},
    dispres = OptionValue[DisplayAllResults];
    discrd = OptionValue[DisplayCoord];
    npr = OptionValue[NumericalPrec];
    pwsets = Drop[Subsets[T],1];
    nneg = UnanInEquality[#, coord] & /@ pwsets;
    rtnneg = If[npr !=  10^(-12), Chop[nneg,npr], Chop[nneg,10^(-12)]];
    trq = Union[Flatten[NonNegative[rtnneg]]];
    trfl = Apply[And, trq];
    Which[SameQ[dispres,True],{trfl, rtnneg},
          SameQ[discrd,True], rtnneg,
                  True, trfl
    ]
];


UnanInEquality[coal_List, coord_List] := 
  Block[{Sc,obmg,sysob,sysin,pos,pos2,extc,intc,lgtc,inlam,mltun,addcrd,lam,rlcrd},
    Sc = Complement[T,coal];
    obmg = Drop[OberMenge[coal,T],1];
    sysob = Subsets[#] & /@ obmg;
    sysin = Map[Intersection[#,Sc] &,#] & /@ sysob;
    pos = Position[#,{__}] & /@ sysin;
    pos2 = DeleteCases[#,{}] & /@ pos;
    extc = MapThread[Extract[#1, #2] &, {sysob,pos2}];
    intc = Map[Intersection[#1, coal] &, #] & /@ extc;
    lgtc = Map[Length[#] &, #] & /@ intc;
    inlam = Map[Global`\[Lambda][#] &,#] & /@ extc;
    mltun = Table[MapThread[Times, {lgtc[[i]], inlam[[i]]}], {i, Length[inlam]}];
    addcrd = Total[#] & /@ mltun;
    lam = Global`\[Lambda][#] & /@ Subsets[T];
    rlcrd = MapThread[Rule, {lam, coord}];
    (#  /. rlcrd) & /@ addcrd
];



(* See Meinhardt, 2009 *)
DetQuasiAvConvex[args___]:=(Message[DetQuasiAvConvex::argerr];$Failed);
DetQuasiAvConvex[game_]:= 
Block[{uncrd, lnsi2, lnT, anfpt, endpt, tkcd, avccrd},
  uncrd = HarsanyiDividends[game];
  lnsi2 = Binomial[Length[T], 2];
  lnT = Length[T];
  anfpt = lnT + 2;
  endpt = anfpt + lnsi2 - 1;
  tkcd = Take[uncrd, {anfpt, endpt}];
  avccrd = DetUCoord[tkcd, T];
  CharacteristicValues[avccrd, T]
];

DetUCoord[args___]:=(Message[DetUCoord::argerr];$Failed);
DetUCoord[coord_List,T_]:=
 Block[{},
     Which[{Binomial[Length[T],2]} != Dimensions[coord], WrongCoordDimension[T];,
                    Union[NonNegative[coord]] === {True},  AvCcoord[coord,T] , 
                    True, Print["Input error! \n Negative values are not allowed!"];
       ]
];

AvCcoord[coord_List, T_] := 
  Block[{uncrd, pwsts, setsgr2, mincrd, zvec, apz},
    uncrd = coord;
    pwsts = Subsets[T];
    setsgr2 = DeleteCases[If[Length[#] >= 3, #, {}] & /@ pwsts, {}];
    mincrd = MinCoordLarger2[coord, #, T] & /@ setsgr2;
    zvec = Table[0, {i, Length[T] + 1}];
    apz = Flatten[PrependTo[uncrd, zvec]];
    Flatten[AppendTo[apz, mincrd]]
    ];

PlayerPairs[args___]:=(Message[PlayerPairs::argerr];$Failed);
PlayerPairs[T_List] := Block[{mat,ijpair, crdpr01},
    mat=ConstantArray[#,Length[T]] &/@ T;
    ijpair = MapThread[If[#1 >= #2, {},{#1,#2}] &, {T,#}] &/@ mat;
    crdpr01 = DeleteCases[DeleteCases[#, {}] & /@ ijpair, {}];
    Sort[Apply[Join, crdpr01]]
    ];


MinCoordLarger2[coord_List, setsgr2_, T_] := 
  Block[{plp, plpsets, plpsys, pos, crdsys, lamsys, crdeq2, rlcdr, inscrd},
    plp = PlayerPairs[setsgr2];
    pos = Map[Position[plp, #] &, setsgr2];
    plpsets = Map[Extract[plp, First[#]] &, #] & /@ pos;
    crdsys = Map[\[Lambda][#] &, #] & /@ plpsets;
    lamsys = ((Total[#])/Length[#]-1) & /@ crdsys;
    crdeq2 = \[Lambda][#] & /@ PlayerPairs[T];
    rlcdr = MapThread[Rule, {crdeq2, coord}];
    inscrd = lamsys /. rlcdr;
    If[EvenQ[Length[setsgr2]], Min[inscrd], Max[-inscrd]]
    ];


MinUnanimityCoordinates[args___]:=(Message[MinUnanimityCoordinates::argerr];$Failed);
MinUnanimityCoordinates[game_]:=Block[{anz,sepset},
	anz=(Length[#])& /@ Subsets[T];
	sepset=Extract[Subsets[T],Position[anz,#]] & /@ T;
	Table[Min[(CoordS[game,#])& /@ sepset[[i]]],{i,1,Length[T]}]
		];

StrictlyConvexUnanConditionQ[args___]:=(Message[StrictlyConvexUnanConditionQ::argerr];$Failed);
StrictlyConvexUnanConditionQ[game_]:= Block[{unanc},
  unanc=EvalSumMinCoord[game];
  Apply[And,Positive[unanc]]
];

ConvexUnanConditionQ[args___]:=(Message[ConvexUnanConditionQ::argerr];$Failed);
ConvexUnanConditionQ[game_]:= Block[{unanc},
  unanc=EvalSumMinCoord[game];
  Apply[And,NonNegative[unanc]]
];


ConvexUnanIffCoord[game_] :=Block[{pij, dems, tog, lams, unc},
  pij = Table[If[i >=  j, {}, {i, j}], {i, Length[T]}, {j, Length[T]}];
  dems = DeleteCases[DeleteCases[#, {}] & /@ pij, {}];
  tog = Apply[Join, dems];
  lams = Table[ If[SubSetQ[tog[[i]], #], 1, 0] & /@ Subsets[T], {i, Length[tog]}];
  unc = UnanimityCoordinates[game];
  lams.unc
  ];


(* Cor. 2.1 in C. Rafels and N. Ybern (1995) *)

EvalSumMinCoord[args___]:=(Message[EvalSumMinCoord::argerr];$Failed);
EvalSumMinCoord[game_]:=
  Block[{smallestcoord,alphak,post,rg,firstneg,s0,restmin,alltrueQ,fac,retval,singleQ},
    smallestcoord=MinUnanimityCoordinates[game];
    alphak=Drop[smallestcoord,1];
    post=NonNegative[#]&/@ alphak;
    alltrueQ=Apply[And,post];
    If[alltrueQ == False,
      firstneg=Take[Flatten[Position[post,False]],1][[1]];
      s0=firstneg + 1;
      If[s0>Length[T]-2,
        DisplaySize[game,s0];
        smallestcoord,
        rg=Range[Length[alphak]];
        restmin=Take[alphak,#] & /@ rg;
        fac=Table[Table[(k!)/((j!)(k-j)!),{j,0,k}],{k,0,Length[T]-2}];
        Total[#] & /@ MapThread[Times,{fac,restmin}]
        ],
          singleQ=NonNegative[Take[smallestcoord,1]];
          alltrueQ=Apply[And,{alltrueQ,singleQ}][[1]];
          If[alltrueQ == True,
            PrintMessageFirst;smallestcoord,
               PrintMessageSec;smallestcoord] 
         ] 
       ];



DisplaySize[game_, s0_] := (
      Print["Minimum coalition size with negative unanimity coordinate is equal to ", s0];
      Print["Coalition size of T-2 is ", Length[T] - 2];
      Print[s0, " greater than ", Length[T] - 2];
      Print["No sum of minimum unanimity coordinates can be evaluated."];
      Print["The minimum unanimity coordinates are:"]
      );

PrintMessageFirst:=(
      Print["No negative unanimity coordinates found."];
      Print["Game is convex."];
      Print["The minimum unanimity coordinates are:"]);

PrintMessageSec:=(
      Print["No negative unanimity coordinates found."];
      Print["The minimum unanimity coordinates are:"]);

End[];

Protect[Global`Co,coal];
Protect[Global`sij];
(* Protect[x]; *)

If[SameQ[Global`$ParaMode,"False"],
Print["==================================================="];
Print["Package 'TuGames' loaded"];
Print["==================================================="];,
   True];

EndPackage[]









