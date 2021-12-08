[![GitHub (pre-)release](https://img.shields.io/github/release/himeinhardt/TuGames/all.svg)](https://github.com/himeinhardt/TuGames/releases)
[![Mathematica 8.0 - 12.3.1](https://img.shields.io/badge/Mathematica-8.0_--_12.3.1-brightgreen.svg)](#compatibility)
[![license MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/himeinhardt/TuGames/blob/master/LICENSE.md)
#   :Title: TuGames
##  :Version History:
###    Version 1.0: without options
###    Version 1.1: with options
###    Version 1.3
#### 1. Code Revision
*	Minor code revision.

*  Some robustness problems with the function family `ModifiedNucleolus[]` have been fixed but it is not completely solved. For convex games or inessential games the solution computed might still be wrong.

#### 2.  Modification

Some new functions to compute the pre-kernel, anti-pre-kernel and some related functions were incorporated. The function names are `PreKernelSolution[]` and `AntiPreKernelSolution[]`. These functions are based on an algorithm that relies on the indirect function approach to compute pre-kernel solutions. In order to check if the solution is an anti-pre-kernel, the functions `MinExcessBalanced[], AntiPreKernelQ[]` and `AllAntiSurpluses[]` have been added.

###   Version 1.5
#### 1. Code Revision
*	Some code revision.

*  The functions `DefineGame[], MaxExcessBalanced[], MinExcessBalanced[], KernelImputationQ[], SuperAdditiveQ[]` and `AvConvex[]` have been completely rewritten. For this reason the  functions: `AvSumCheck[], ContributionSum[]` have been deprecated.

*  The function `AverageConvexQ[]` is the same as `AvConvexQ[]`, but it allows to issue an option.

*  The functions `PreKernelQ[]` and `AntiPreKernelQ[]` have been modified.

#### 2.  Modification

Some new functions related to unanimity coordinates have been added. For instance

* `DetUCoord[]` to get the unanimity coordinates from a set of positive coordinates.

* `HarsanyiDividends[]` provides an alternative approach to compute the unanimity coordinates (Harsanyi dividends) of the game.

* `CharacteristicValues[]` computes the characteristic values of the game from the unanimity coordinates.

*  The functions `UnanConvexQ[], UnanAvConvexQ[]` provide alternative approaches to check convexity and average-convexity.

###    Version 1.6

#### 1. Bug fixes
* `AverageConvexQ[]`        - Fix incorrect computation and a precision problem.
* `DetUCoord[]`             - Fix incorrect computation.
* `UnanAvConvexIffCondQ[]`  - Fix incorrect computation and a precision problem.
* `AdjustedWorthVectors[]`  - Fix incorrect computation.

#### 2. Modification

*  Some general code revision.

*   We added some new functions related to the prenucleolus, like `BalancedSelectionQ[]`.

*  First code adjustment to use this package in parallel.

*  Furthermore, some basic functions can now be called within a running *MATLAB* session while using our *MATLAB* toolbox *MatTuGames*, which is available from the following URL:

	[MatTuGames](http://www.mathworks.cn/matlabcentral/fileexchange/35933?product=EL)

###    Version 1.7

#### 1. Bug fixes
* `PreKernelElement[]`        - Fix a precision problem.
* `KernelVertices[]`          - Fix a precision problem.
* `DirectionOfImprovement[]`  - Fix a precision problem.
* `MaxExcessBalanced[]`       - Fix a precision problem.
* `MinExcessBalanced[]`       - Fix a precision problem.
* `KernelImputationQ[]`       - Fix a precision problem.
* `KernelImputationListQ[]`   - Fix a precision problem.
* `ModifiedNucleolus[]`       - Fix incorrect computation with games having empty core.
* `ModifiedKernel[]`          - Fix incorrect computation with games having empty core.
* `LexiCenter[]`              - Fix incorrect computation with games having empty core.
* `PreNucleolus[]`            - Fix incorrect computation with games having empty core.

#### 2. Modification

The parallel mode has been optimized. For more details see the README file and/or the notebook file TuGamesParallel.nb in the Documentation folder.

Tested up to 32 SubKernels. For running even the *Cddmathlink* libraries in parallel see the explanation in the *README* file and/or for an example the notebook file `TuGamesMovieParaModeV6.nb` in the Documentation directory.

To keep track our package with the new graphic concept of Mathematica 6.x and higher, the following functions have been added or modified to depict solutions for three person games:

* `AnimationKernelProperty2d[]`  - new function, dedicated for Mathematica 6.x and higher only!
* `StrongEpsCore2d[]`            - new function, dedicated for Mathematica 6.x and higher only!
* `FilledCoreV6[]`               - is an upgrade of FilledCore[] for version 6.x and higher.

The graphical functions to plot game solutions for four person games reside in the package `IOTuGamesV6.m`. To use the old graphic concept one has to load the package `IOTuGames.m` in connection with << Version5`Graphics`. All graphical extensions require the *Cddmathlink* libraries.

###    Version 1.8
#### 1.  Revision
* `ModifiedNucleolus[]`       - Complete code revision to get rid of large round-off errors. We use now a fast simplex method instead of an interior point method to increase its reliability.
* `ModifiedKernel[]`          - See `ModifiedNucleolus[]`.
* `LexiCenter[]`              - See `ModifiedNucleolus[]`.
* `PreNucleolus[]`            - See `ModifiedNucleolus[]`.

The behavior of these functions have changed. Options are obsolete now. `ModifiedNucleolus[]` does not compute anymore the pre-nucleolus for inessential games, it returns the empty set instead.


###    Version 2.2
#### 1. Modification 

* Transcription of the old option rules to the new ones invented by Mathematica 8.x. This package is now exclusively dedicated to Mathematica version 8.x and higher.

* `FilledCore[]` is deprecated now. Using the old graphic concept Version 1.8 is required.

###    Version 2.3
#### 1. Modification

Change protected command `SubsetQ[]` to `SubSetQ[]` from the VertexEnum package. Order is reversed to `SubsetQ[]` which is new in Mathematica version 10.x.

#### 2. Revision

Some minor code revision.

#### 3. New Functions
* `MLExtension[]`           - Computes the multi-linear extension of the game.
* `ShapleyValueML[]`        - Computes the Shapley value from the multi-linear extension of the game.
* `PreKernel[]`             - Computes a pre-kernel point by Algorithm 8.2.1 of Meinhardt (2013).

#### 4. Bug fixes

* `FindKernelSolution[]` convergence process to the kernel should be now more robust.

###    Version 2.4
#### 1. Revision

Some minor code revision.

###    Version 2.5
#### 1. Modification

Adding the function `ApproxNuc[]` to compute the (p,k)-nucleolus which is an approximation of the nucleolus by a non-linear optimization approach, i.e., minimizes a p-norm. The function `NonLinNuc[]` is based on this function to compute the nucleolus. We extended this idea to the pre-nucleolus through the commands `ApproxPreNuc[]` and `NonLinPreNuc[]`. In addition, we added the least square computation of the (pre-)nucleolus by the functions `LSNuc[]` and `LSPreNuc[]`.

Functions to compute the barycenter of the extreme points of the core, dual cover game, dual extension, primal extension, modiclus, a proper modified pre-kernel element, potential of a game, the Lorenz solution, and Dutta-Ray solution for convex games have been added.

#### 2. Bug fixes

An insufficient coloring of the function FilledCoreV6[] caused by an incomplete delaunay triangulation of the Mathematica built-in function DelaunayTriangulation[] has been fixed.



###    Version 2.5.1
#### 1. Modification

* Installation procedure has changed. The package is now distributed as a Paclet. The documentation was revised and extended. About 230 pages were added to the documentation. The error handling of functions was improved.
* The functions to compute the modiclus and related solutions have been parallelized, and are part the `ParaTuGames` package.

#### 2. Bug fixes

Some minor code revision and bug fixes.

###   Version 2.5.2
#### 1. Modification

We have revised the Install procedure of the *Cddmathlink* library, which makes it not anymore necessary to explicitly formulate some conditions for all operating systems. Moreover, some default binaries for *RHEL* 7.5 and *Mathematica* 11.3 ship now with the package. Alternatively, we also added some for *RHEL* systems for *Mathematica* 10 and later. These binaries must be copied into the pre-specified folder.

#### 2. Bug fixes

Some minor code revision and bug fixes.

###    Version 2.5.3
#### 1. Modification

* Adding some binaries for Mathematica 10.0 or later on OS X 10.9 or later. We are very grateful to Szabolcs Horvát for providing these to the community.
* Change of the License to the MIT License terms.

###    Version 2.5.4
#### 1. Modification
* Functions to compute and to verify the simplified modified pre-kernel/nucleolus are added. They are called `SMPrenucleolus[],IsSMPrenuceolusQ[],SMPreKernel[],IsSMPreKernelQ[]`. For the last two commands we implemented parallel counterparts called `ParaSMPreKernel[]`,and `ParaIsSMPreKernelQ[]` respectively.
* Adding the function `BalancedCollectionQ[]` that should replace in the future the function `BalancedSelectionQ[]`.
        For n=>4 the function returns incorrect results, probably caused by a bug of the `DualLinearProgramming[]` function.


#### 2. Example of incorrect results:

Consider the collection of sets given by
```
        cS4={{1}, {2}, {3}, {1, 2}, {1, 3}, {2, 4}, {3, 4}, {2, 3, 4}};
```
then the return value is false
```
         In[29]:= First[BalancedSystemQ[cS4, Range[4]]]

         Out[29]= False
```
However, the system is balanced, since the balancing weights are given by

```
        whgs = {3,1,1,1,1,2,2,1}/5
```

Related to this context we provide the function `BalancedInequalityQ[]` to check whether a balanced system satisfies a balanced inequality of a TU-game. Notice that if all balanced systems satisfying this property non-emptiness of the core is guaranteed. Recall that for n=4 we need to check 9 equivalence classes, however, for n=6 we have to check 158 classes.


###    Version 2.6.0
#### 1. Modification

* Adding functions to compute the Chi-Value, EPSD-Value, Gately-Value, PD-Value, and the nucleolus by the Leng and Parlar (2010) formulae for three person zero-normalized and super-additive games. Changing the package extension from *.m to *.wl.

#### 2. Bug fixes and Revision

* Performing some code maintenance and minor bug fixes.

###    Version 2.6.1

#### 1. Revision

* Code revision and optimization. The (anti-)pre-kernel computation is now faster up to a factor 3 in serial as well as in parallel.

###    Version 2.6.2
#### 1. Modification:
	
   Adding functions
	
*  `AlmostConvexQ[]` to check if the game is almost convex.
*  `AlmostConcaveQ[]` to check if the game is almost concave.
*  `ADMCGameQ[]` to check the property if the game satisfies almost diminishing marginal contributions.
*  `AIMCGameQ[]` to check the property if the game satisfies almost increasing marginal contributions.
*  `kConvexity[]` to check if the game is k-convex.
*  `EANSCValue[]` to compute the Equal Allocation of Non-Separable Contribution/Cost value.

#### 2. Revision
Revised the functions:
	
`ConvexQ[], ConcaveQ[], Nuc1convex[]`.
#### 3. Bug Fixes
	
Minor Bug fixes and code revision.

###    Version 3.0.0

#### 1. Synopsis
	
Not anymore backward compatible to Mathematica versions smaller than 12 due to the port to the new collection of algorithms for solving convex problems introduced in version 12.

#### 2. Modification

`ConstrainedMax/ConstrainedMin` and `LinearProgramming/DualLinearProgramming` are replaced by `LinearOptimization`.

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


The function `WeaklyBalancedCollectionQ` replaces `WeaklyBalancedSelectionQ`, the latter will be deprecated in a future version.

###  Version 3.0.1
	
#### 1. Revision
	
Improved exception handling for functions using `LinearOptimization`. Performance improving of revised functions in Version 3.
	
#### 2. Bug Fixes
	
Some minor bug fixes.

###  Version 3.0.2 

#### 1.Revision

Adjusting the functions

       ApproxPreNuc                -- Part of TuGames,
       ApproxNuc                   -- Part of TuGames,
       DuttaRay                    -- Part of TuGames,
       LorenzSolution              -- Part of TuGames,
       NonLinPreNuc                -- Part of TuGames,
       NonLinNuc                   -- Part of TuGames,
       PreKernelSolution           -- Part of TuGames

to the new set of optimization algorithms.

Adding options to the functions:

      PreKernelQ                  -- Part of TuGames,
      MaxExcessBalanced           -- Part of TuGames,
      AntiPreKernelQ              -- Part of TuGames,
      MinExcessBalanced           -- Part of TuGames,
      ParaPreKernelQ              -- Part of ParaTuGames,
      ParaMaxExcessBalanced       -- Part of ParaTuGames,
      ParaAntiPreKernelQ          -- Part of ParaTuGames,
      ParaMinExcessBalanced       -- Part of ParaTuGames.

Improving the performance of `PreKernelSolution`.

#### 2. Bug Fixes

Some minor bug fixes and code revision.


