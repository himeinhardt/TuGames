(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 11.3' *)

(***************************************************************************)
(*                                                                         *)
(*                                                                         *)
(*  Under the Wolfram FreeCDF terms of use, this file and its content are  *)
(*  bound by the Creative Commons BY-SA Attribution-ShareAlike license.    *)
(*                                                                         *)
(*        For additional information concerning CDF licensing, see:        *)
(*                                                                         *)
(*         www.wolfram.com/cdf/adopting-cdf/licensing-options.html         *)
(*                                                                         *)
(*                                                                         *)
(***************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1088,         20]
NotebookDataLength[    641376,      17327]
NotebookOptionsPosition[    542749,      15708]
NotebookOutlinePosition[    557289,      15984]
CellTagsIndexPosition[    555450,      15924]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[TextData[StyleBox["TuGames  v1.1",
 FontSlant->"Italic"]], "Title",ExpressionUUID->"19095de7-ee5f-4539-af3d-7a0f110ab020"],

Cell["by Holger I. Meinhardt (2004)", "Author",ExpressionUUID->"e9a07404-112c-48aa-b2ce-c94a62aca9cf"],

Cell[CellGroupData[{

Cell["Contents", "Section",ExpressionUUID->"20bb2461-ee21-4c5d-8685-d3d97e350234"],

Cell[TextData[{
 "1. ",
 ButtonBox["Introduction",
  BaseStyle->"Hyperlink",
  ButtonData:>"Introduction"],
 "\n2. ",
 ButtonBox["Installation",
  BaseStyle->"Hyperlink",
  ButtonData:>"Installation"],
 "\n2.1. ",
 ButtonBox["Unix",
  BaseStyle->"Hyperlink",
  ButtonData:>"Unix"],
 "\n2.2. ",
 ButtonBox["Windows",
  BaseStyle->"Hyperlink",
  ButtonData:>"Windows"],
 "\n2.3. ",
 ButtonBox["Mac OS",
  BaseStyle->"Hyperlink",
  ButtonData:>"Mac OS"],
 "\n3. ",
 ButtonBox["Getting Started",
  BaseStyle->"Hyperlink",
  ButtonData:>"Getting Started"],
 " \n3.1. ",
 ButtonBox["How to define Games?",
  BaseStyle->"Hyperlink",
  ButtonData:>"How to define Games?"],
 "\n4. ",
 ButtonBox["Some Functions",
  BaseStyle->"Hyperlink",
  ButtonData:>"Some Functions"],
 "\n4.1. ",
 ButtonBox["Basic Functions",
  BaseStyle->"Hyperlink",
  ButtonData:>"Basic Functions"],
 "\n4.2. ",
 ButtonBox["k-Convexity",
  BaseStyle->"Hyperlink",
  ButtonData:>"k-convexity"],
 "\n4.3. ",
 ButtonBox["Kernel",
  BaseStyle->"Hyperlink",
  ButtonData:>"Kernel"],
 "\n4.4. ",
 ButtonBox["Unanimity Coordinates",
  BaseStyle->"Hyperlink",
  ButtonData:>"Unanimity Coordinates"],
 "\n5. ",
 ButtonBox["Computing the Vertices of the Core",
  BaseStyle->"Hyperlink",
  ButtonData:>"5"],
 "\n6. ",
 ButtonBox["Concluding Remarks and Limitations",
  BaseStyle->"Hyperlink",
  ButtonData:>"Concluding Remarks and Limitations"],
 "\n7. ",
 ButtonBox["References",
  BaseStyle->"Hyperlink",
  ButtonData:>"References"]
}], "Text",
 CellTags->{
  "1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", 
   "4.4.", "5.", "6.", "7.", "3.1.", 
   "Vertices"},ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["1.Introduction",
 BaseStyle->"Hyperlink",
 ButtonData:>"1."]], "Section",
 CellTags->
  "Introduction",ExpressionUUID->"7050b662-8152-4594-885b-73ef738c1cc4"],

Cell[TextData[{
 StyleBox["TuGames",
  FontSlant->"Italic"],
 " is a ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " package to determine and to check some game properties of transferable \
utility games. It provides about 70 different functions and it can calculate, \
for instance, kernel elements, excess payoffs, marginal values, the \
tau-value, and the vertices of a core. Moreover, it verifies if the game is \
convex, average-convex  or superadditive just to mention some interesting \
functions. This package is an extension of the package ",
 StyleBox["CooperativeGames",
  FontSlant->"Italic"],
 " that has been developed by ",
 ButtonBox["M. Carter",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Carter"],
 ". It must be mentioned in this place that some commands of ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 " require routines that have been provided by the package ",
 StyleBox["CooperativeGames",
  FontSlant->"Italic"],
 ".  Therefore, you have also to install the package ",
 StyleBox["CooperativeGames",
  FontSlant->"Italic"],
 " to use the new functions properly. A description of the package ",
 StyleBox["CooperativeGames",
  FontSlant->"Italic"],
 " can be found in Economic and Financial Modeling with ",
 StyleBox["Mathematica,",
  FontSlant->"Italic"],
 " ed. ",
 ButtonBox["Hal. R. Varian",
  BaseStyle->"Hyperlink",
  ButtonData:>"Hal R. Varian"],
 ", Telos  Springer Publisher,1993, Chapter 8. Furthermore, if one is \
interested in computing the vertices of a core the ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " package ",
 StyleBox["VertexEnum",
  FontSlant->"Italic"],
 " written by ",
 ButtonBox["K. Fukuda",
  BaseStyle->"Hyperlink",
  ButtonData:>"http://www.ifor.math.ethz.ch/staff/fukuda/fukuda.html"],
 " and I. Mizukoshi must also be installed on the computer.  But note that \
this function is very slow in computing all vertices of a core on old \
computers like Pentium II systems.  You can overcome these shortcomings of \
VertexEnum by installing the C-library cddmathlink written by the same \
authors to perform the same computational task more efficiently. It can be \
found under http://www.cs.mcgill.ca/ fukuda/ for various UNIX and forWindow \
systems. The library is linked via MathLink with the ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " Kernel. For Windows Operating Systems pre-build binaries are available and \
are included in the subdirectory cddml. Note that the functions that based on \
this library are not activated. To use these functions on your operating \
systems you must comment them out in the package TuGames. Moreover, you have \
to adjust the $Path variable where the library can be found. The default \
value is set to \"/usr/local/bin\" for UNIX systems. For changing this value \
edit the file ",
 StyleBox["TUGames",
  FontSlant->"Italic"],
 " with an editor of your choice and search for ",
 StyleBox["SetDirectory[]",
  FontWeight->"Bold"],
 ". The package ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 " can be used under Windows XP/2000/NT, MacOS and UNIX platforms running ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " Version 3.0 or later. The author has tested the functions extensively \
under LINUX x86, HP-UX  and AIX. For Windows XP/2000/NT and Mac OS the author \
has no experience. But the programming language of ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " is system independent, thus, there should no problems occur on these \
operating systems. "
}], "Text",
 CellFrame->{{0, 0}, {0, 0.5}},
 TextAlignment->Left,
 TextJustification->1,
 CellTags->{
  "http://www.ifor.math.ethz.ch/staff/fukuda/fukuda.html", "1993", 
   "1993C"},ExpressionUUID->"912525f5-9211-48c0-850f-47c7c3a70fa3"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["2. Installation",
 BaseStyle->"Hyperlink",
 ButtonData:>"2."]], "Section",
 CellTags->
  "Installation",ExpressionUUID->"10587ea2-1bc7-4a13-a84c-be4a6205b9e8"],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["2.1. Unix",
 BaseStyle->"Hyperlink",
 ButtonData:>"2.1."]], "Subsubsection",
 CellTags->"Unix",ExpressionUUID->"81a61f5e-4afc-4131-b5e6-03e10c0a62e7"],

Cell[TextData[{
 "1. Create  a directory \"",
 StyleBox["TuGames",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 "\" in your",
 StyleBox["  $HOME/.",
  FontWeight->"Bold"],
 StyleBox["Mathematica",
  FontWeight->"Bold",
  FontSlant->"Italic"],
 StyleBox["/3.0/AddOns/Applications",
  FontWeight->"Bold"],
 " directory. Copy now all files in the directory \"",
 StyleBox["TuGames",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 "\", but for the file ",
 StyleBox["CooperativeGames.m",
  FontSlant->"Italic"],
 " create a subdirectory \"",
 StyleBox["coop",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 "\" in ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 " and move the file in this subdirectory.\n2. Create the variable ",
 StyleBox["$TuGamesPath",
  FontWeight->"Bold"],
 " in the ",
 StyleBox["init.m",
  FontSlant->"Italic"],
 " file in your ",
 StyleBox["$HOME/.",
  FontWeight->"Bold"],
 StyleBox["Mathematica",
  FontWeight->"Bold",
  FontSlant->"Italic"],
 StyleBox["/3.0/Kernel",
  FontWeight->"Bold"],
 " directory. If no ",
 StyleBox["init.m",
  FontSlant->"Italic"],
 " file exists, create the file. Set this variable to\n",
 StyleBox["$TuGamesPath = \
$HomeDirectory<>\".Mathematica/3.0/AddOns/Applications/TuGames\"",
  FontWeight->"Bold"],
 "\n3. Add to the global variable ",
 StyleBox["$Path",
  FontWeight->"Bold"],
 " in the",
 StyleBox[" ",
  FontWeight->"Bold"],
 StyleBox["init.m",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 " file the location of ",
 StyleBox["TuGames ",
  FontSlant->"Italic"],
 StyleBox["by",
  FontVariations->{"CompatibilityType"->0}],
 "\n",
 StyleBox["AppendTo[$Path, $TuGamesPath]",
  FontWeight->"Bold"],
 "\nNow you can start ",
 StyleBox["TuGames.",
  FontSlant->"Italic"]
}], "Text",ExpressionUUID->"d1d032d3-88b3-46b0-8dcf-f6aa54b1dc9c"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["2.2. Windows",
 BaseStyle->"Hyperlink",
 ButtonData:>"2.2."]], "Subsubsection",
 CellTags->"Windows",ExpressionUUID->"27c5367b-8fb3-411c-be30-0348e2815ade"],

Cell[TextData[{
 "1. Create the directory \"",
 StyleBox["AddOns\\Applications\\TuGames",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 "\" at the location where your ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " files are located.  This can be find out by typing\n",
 StyleBox["$TopDirectory",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 "\nin your ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " Notebook. \n2. Copy now all files in this directory. \n2.1 Create for the \
file ",
 StyleBox["CooperativeGames.m",
  FontSlant->"Italic"],
 " the subdirectory \"",
 StyleBox["coop",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 "\" and move the file in this directory.\n2.2 Create for the file \
VertexEnum.m the subdirectory \"vertex\" and move the file in this directory. \
\n2.3 Create for the library cddml_w32new the subdirectory \"cddml\" and move \
the file in this directory.\n3. Create in your ",
 StyleBox["init.m",
  FontSlant->"Italic"],
 " file the variable ",
 StyleBox["$TuGamesPath",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 " to locate the various packages. Set this variable to \n",
 StyleBox["$TuGamesPath = $TopDirectory<>\"\\AddOns\\Applications\\TuGames\"",
  
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 "\n4. Add to the variable ",
 StyleBox["$Path",
  FontWeight->"Bold"],
 " in the ",
 StyleBox["init.m",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 " file the location of ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 "\n",
 StyleBox["AppendTo[$Path, $TuGamesPath]",
  FontWeight->"Bold"],
 "\nNow you can start ",
 StyleBox["TuGames. ",
  FontSlant->"Italic"],
 "In cases that you have problems with the init.m file consult the README \
file."
}], "Text",ExpressionUUID->"ff0d2283-458e-477a-8323-8e474e7affd6"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["2.3. Mac OS ",
 BaseStyle->"Hyperlink",
 ButtonData:>"2.3."]], "Subsubsection",
 CellTags->"Mac OS",ExpressionUUID->"139111de-5469-4d31-b828-584f1fe378fb"],

Cell["\<\
Sorry, but at the moment no installation instruction for Mac OS is available. \
\>", "Text",ExpressionUUID->"35547645-21d7-4d93-b5c4-7917d2154aa0"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["3. Getting Started",
 BaseStyle->"Hyperlink",
 ButtonData:>"3."]], "Section",
 CellTags->
  "Getting Started",ExpressionUUID->"3c85833c-6e0a-4dfb-b75b-9f9dc2376db7"],

Cell["\<\
In the next step we assume that you have installed properly the files \
mentioned above on your computer. To start with the calculation, we have \
first to load some packages. This can be done by the following commands. \
\>", "Text",ExpressionUUID->"0d199661-944d-4b5d-9efd-4e3561e14361"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Needs", "[", "\"\<TUG`\>\"", "]"}]], "Input",ExpressionUUID->"d8a3e6ff-0aed-41ee-9966-682626a945d5"],

Cell[CellGroupData[{

Cell[BoxData["\<\"===================================================\"\>"], \
"Print",ExpressionUUID->"5d8e3636-ec54-4d48-ae4f-479c08227d03"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Loading Package 'TuGames' for \"\>", 
   "\[InvisibleSpace]", "\<\"Unix\"\>"}],
  SequenceForm["Loading Package 'TuGames' for ", "Unix"],
  Editable->False]], "Print",ExpressionUUID->"a191e8d3-89e7-445f-a401-\
06edcb01c354"],

Cell[BoxData["\<\"===================================================\"\>"], \
"Print",ExpressionUUID->"36374a08-f4fc-4874-bfe5-919f9aac98a9"],

Cell[BoxData["\<\"TuGames V2.5 by Holger I. Meinhardt\"\>"], "Print",ExpressionUUID->"456ebe61-de6d-467f-8f96-d8c6ddc14373"],

Cell[BoxData["\<\"Release Date: 21.01.2019\"\>"], "Print",ExpressionUUID->"2835c6a1-b331-4c89-95b8-c9dbdd6f0e95"],

Cell[BoxData["\<\"Program runs under Mathematica Version 8.0 or later\"\>"], \
"Print",ExpressionUUID->"66524094-c59b-4840-a4c7-68ab7015ad6e"],

Cell[BoxData["\<\"Version 8.x or higher is recommended\"\>"], "Print",ExpressionUUID->"929cc2d1-15ab-4688-936f-386c685cc08d"],

Cell[BoxData["\<\"===================================================\"\>"], \
"Print",ExpressionUUID->"8f3b048e-1328-4cbb-96e8-ae91cbb9501b"],

Cell[BoxData["\<\"===================================================\"\>"], \
"Print",ExpressionUUID->"10c12380-edcb-49c3-8af5-11d51802f0fa"],

Cell[BoxData["\<\"Package 'TuGames' loaded\"\>"], "Print",ExpressionUUID->"58d23f98-97a0-4d59-8f24-3b6352dea8b9"],

Cell[BoxData["\<\"===================================================\"\>"], \
"Print",ExpressionUUID->"3e8e4892-80db-4cf1-b826-efaaf2a3533f"]
}, Open  ]]
}, Open  ]],

Cell["To get an overview of all available functions call just", "Text",ExpressionUUID->"15675f09-91ca-4d31-9eae-17b68be52777"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"funcname", "=", 
  RowBox[{"Names", "[", "\"\<TUG`TuGames`*\>\"", "]"}]}]], "Input",ExpressionU\
UID->"e70ce38a-7169-4209-b699-ae75836c8ad3"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"\<\"AdjustedEffUpperVectors\"\>", ",", "\<\"AdjustedEffVector\"\>",
    ",", "\<\"AdjustedWorthVectors\"\>", ",", "\<\"AllAntiSurpluses\"\>", 
   ",", "\<\"AllCoalitions\"\>", ",", "\<\"AllConstraints\"\>", 
   ",", "\<\"AllMaxSurpluses\"\>", ",", "\<\"AnimationKernelProperty2d\"\>", 
   ",", "\<\"AntiPreKernel\"\>", ",", "\<\"AntiPreKernelQ\"\>", 
   ",", "\<\"AntiPreKernelSolution\"\>", ",", "\<\"ApproxNuc\"\>", 
   ",", "\<\"ApproxPreNuc\"\>", ",", "\<\"AvConvexQ\"\>", 
   ",", "\<\"AverageConvexQ\"\>", ",", "\<\"BalancedSelectionQ\"\>", 
   ",", "\<\"BargainUnanMatrix\"\>", ",", "\<\"BargUnanMat\"\>", 
   ",", "\<\"BaryCenter\"\>", ",", "\<\"BelongToCoreQ\"\>", 
   ",", "\<\"BestCoalitions\"\>", ",", "\<\"BestCoalToMatrix\"\>", 
   ",", "\<\"CalcStepSize\"\>", ",", "\<\"CallMaximize\"\>", 
   ",", "\<\"CddGmpPlotCore\"\>", ",", "\<\"CddGmpPlotImputationSet\"\>", 
   ",", "\<\"CddGmpPlotLowerSet\"\>", ",", "\<\"CddGmpPlotReasonableSet\"\>", 
   ",", "\<\"CddGmpVerticesCore\"\>", ",", "\<\"CddVerticesCore\"\>", 
   ",", "\<\"CddVerticesImputationSet\"\>", 
   ",", "\<\"CddVerticesLowerSet\"\>", 
   ",", "\<\"CddVerticesReasonableSet\"\>", ",", "\<\"ChangeInternalEps\"\>", 
   ",", "\<\"CharacteristicValues\"\>", ",", "\<\"coal\"\>", 
   ",", "\<\"CollectionOfDecreasingExcess\"\>", ",", "\<\"Concession\"\>", 
   ",", "\<\"ConjugateFunction\"\>", ",", "\<\"ConvCheck\"\>", 
   ",", "\<\"ConvexConjugate\"\>", ",", "\<\"ConvexQ\"\>", 
   ",", "\<\"ConvexStrQ\"\>", ",", "\<\"ConvexUnanConditionQ\"\>", 
   ",", "\<\"ConvStrQ\"\>", ",", "\<\"CoordS\"\>", 
   ",", "\<\"CoreElementsQ\"\>", ",", "\<\"CostSaving\"\>", 
   ",", "\<\"DefineGame\"\>", ",", "\<\"DeltaLP\"\>", 
   ",", "\<\"DetEqClass\"\>", ",", "\<\"DetQuasiAvConvex\"\>", 
   ",", "\<\"DetUCoord\"\>", ",", "\<\"DigitPrecision\"\>", 
   ",", "\<\"DirectionOfImprovement\"\>", ",", "\<\"DisagreeConvex\"\>", 
   ",", "\<\"Disagreement\"\>", ",", "\<\"DisplayAllResults\"\>", 
   ",", "\<\"DisplayCoord\"\>", ",", "\<\"DisplayLegend\"\>", 
   ",", "\<\"DisplayMatrixForm\"\>", ",", "\<\"DualCover\"\>", 
   ",", "\<\"DualExtension\"\>", ",", "\<\"DualGame\"\>", 
   ",", "\<\"DuttaRay\"\>", ",", "\<\"ECCoverGame\"\>", 
   ",", "\<\"EffVector\"\>", ",", "\<\"EpsCore\"\>", 
   ",", "\<\"EpsilonValue\"\>", ",", "\<\"EpsValue\"\>", 
   ",", "\<\"EvalSumMinCoord\"\>", ",", "\<\"ExcessPayoff\"\>", 
   ",", "\<\"FifthCriticalVal\"\>", ",", "\<\"FigureSize\"\>", 
   ",", "\<\"FilledCoreV6\"\>", ",", "\<\"FindKernelSolution\"\>", 
   ",", "\<\"FindPreKernelSolution\"\>", ",", "\<\"FirstCriticalVal\"\>", 
   ",", "\<\"FourthCriticalVal\"\>", ",", "\<\"FTPreNuc\"\>", 
   ",", "\<\"GameBasis\"\>", ",", "\<\"GameMonotoneQ\"\>", ",", "\<\"Gap\"\>",
    ",", "\<\"GrandCoalitionLargestValueQ\"\>", 
   ",", "\<\"HarsanyiDividends\"\>", ",", "\<\"ImputationQ\"\>", 
   ",", "\<\"ImputationToEqClass\"\>", ",", "\<\"ImputationToMatrix\"\>", 
   ",", "\<\"ImputationToVec\"\>", ",", "\<\"IncreasingMargContributions\"\>",
    ",", "\<\"IncSize\"\>", ",", "\<\"InFavor\"\>", 
   ",", "\<\"IntersectionOfMaxExcessSets\"\>", 
   ",", "\<\"IntersectionUpperLowerSetQ\"\>", ",", "\<\"IsModiclusQ\"\>", 
   ",", "\<\"IsModPreKernelQ\"\>", ",", "\<\"IsProperModPreKernelQ\"\>", 
   ",", "\<\"kBalancednessQ\"\>", ",", "\<\"kCover\"\>", 
   ",", "\<\"Kernel\"\>", ",", "\<\"KernelCalculation\"\>", 
   ",", "\<\"KernelImputationListQ\"\>", ",", "\<\"KernelImputationQ\"\>", 
   ",", "\<\"KernelRange\"\>", ",", "\<\"KernelVertices\"\>", 
   ",", "\<\"Labeling\"\>", ",", "\<\"LargestAmount\"\>", 
   ",", "\<\"LexiCenter\"\>", ",", "\<\"LorenzSolution\"\>", 
   ",", "\<\"LowerCritVal\"\>", ",", "\<\"LowerSetIncImputationQ\"\>", 
   ",", "\<\"LowerSetQ\"\>", ",", "\<\"LSNuc\"\>", ",", "\<\"LSPreNuc\"\>", 
   ",", "\<\"MargValue\"\>", ",", "\<\"MaxExcessBalanced\"\>", 
   ",", "\<\"MaxExcessSets\"\>", ",", "\<\"MaximumSurpluses\"\>", 
   ",", "\<\"MaxSurplus\"\>", ",", "\<\"MinExcessBalanced\"\>", 
   ",", "\<\"MinUnanimityCoordinates\"\>", ",", "\<\"MLExtension\"\>", 
   ",", "\<\"ModCoalArray\"\>", ",", "\<\"Modiclus\"\>", 
   ",", "\<\"ModifiedKernel\"\>", ",", "\<\"ModifiedNucleolus\"\>", 
   ",", "\<\"ModPreKernel\"\>", ",", "\<\"MonotoneQ\"\>", 
   ",", "\<\"NewShapley\"\>", ",", "\<\"NonLinNuc\"\>", 
   ",", "\<\"NonLinPreNuc\"\>", ",", "\<\"Nuc1convex\"\>", 
   ",", "\<\"NumericalPrec\"\>", ",", "\<\"OneNormalization\"\>", 
   ",", "\<\"OptStepSize\"\>", ",", "\<\"PlayerPairs\"\>", 
   ",", "\<\"Potential\"\>", ",", "\<\"PreImpSet\"\>", 
   ",", "\<\"PreKernel\"\>", ",", "\<\"PreKernelElement\"\>", 
   ",", "\<\"PreKernelEqualsKernelQ\"\>", ",", "\<\"PreKernelQ\"\>", 
   ",", "\<\"PreKernelSolution\"\>", ",", "\<\"PreNucleolus\"\>", 
   ",", "\<\"PrimalExtension\"\>", ",", "\<\"ProperAmount\"\>", 
   ",", "\<\"ProperContribution\"\>", ",", "\<\"ProperModPreKernel\"\>", 
   ",", "\<\"PseudoInv\"\>", ",", "\<\"Quota\"\>", 
   ",", "\<\"RationalApproximate\"\>", ",", "\<\"RationalExact\"\>", 
   ",", "\<\"RationalTol\"\>", ",", "\<\"ReasonableOutcome\"\>", 
   ",", "\<\"ReasonableSet\"\>", ",", "\<\"Scrb\"\>", 
   ",", "\<\"ScrbSolution\"\>", ",", "\<\"SecondCriticalVal\"\>", 
   ",", "\<\"SecondStarCriticalVal\"\>", ",", "\<\"SelectionKBalancedQ\"\>", 
   ",", "\<\"SelectSuperSets\"\>", ",", "\<\"SetGameToNonZeroMonotonic\"\>", 
   ",", "\<\"SetRecursionLimit\"\>", ",", "\<\"SetsToVec\"\>", 
   ",", "\<\"ShapleyValueML\"\>", ",", "\<\"ShowObjectiveFunction\"\>", 
   ",", "\<\"Silent\"\>", ",", "\<\"SmallestCardinality\"\>", 
   ",", "\<\"SmallestContribution\"\>", 
   ",", "\<\"SmallestContributionVector\"\>", ",", "\<\"SolutionExact\"\>", 
   ",", "\<\"StarCriticalVal\"\>", 
   ",", "\<\"StrictlyConvexUnanConditionQ\"\>", 
   ",", "\<\"StrIncreasMargContrib\"\>", ",", "\<\"StrongEpsCore2d\"\>", 
   ",", "\<\"SuperAdditiveQ\"\>", ",", "\<\"TauValue\"\>", 
   ",", "\<\"ThirdCriticalVal\"\>", ",", "\<\"ThirdStarCriticalVal\"\>", 
   ",", "\<\"Tight\"\>", ",", "\<\"TIJsets\"\>", ",", "\<\"Transfer\"\>", 
   ",", "\<\"TransferConstraints\"\>", ",", "\<\"UnanAvConvexQ\"\>", 
   ",", "\<\"UnanConvexQ\"\>", ",", "\<\"UnanimityCoordinates\"\>", 
   ",", "\<\"UpperCritVal\"\>", ",", "\<\"UpperSetIncImputationQ\"\>", 
   ",", "\<\"UpperSetQ\"\>", ",", "\<\"UseManipulate\"\>", 
   ",", "\<\"UtopiaPayoff\"\>", ",", "\<\"UtopiaSum\"\>", 
   ",", "\<\"UtopiaVector\"\>", ",", "\<\"ValueExcess\"\>", 
   ",", "\<\"Vec3DToSimplex\"\>", ",", "\<\"VerticesCore\"\>", 
   ",", "\<\"WeaklyBalancedSelectionQ\"\>", 
   ",", "\<\"WeaklySuperAdditiveQ\"\>", ",", "\<\"WeightedMajority\"\>", 
   ",", "\<\"WithIncidences\"\>", ",", "\<\"ZeroMonotoneQ\"\>", 
   ",", "\<\"ZeroNormalization\"\>", ",", "\<\"ZeroOneNormalization\"\>"}], 
  "}"}]], "Output",ExpressionUUID->"6074f8cb-fd44-403a-9e4f-021757dbdd3c"]
}, Open  ]],

Cell[TextData[{
 "For getting a short listing of all available functions in the package ",
 StyleBox["TUGames",
  FontSlant->"Italic"],
 " type"
}], "Text",ExpressionUUID->"d82cacb3-c04f-49e1-a2de-3837fa068ee3"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"?", "TUG`TuGames`* "}]], "Input",ExpressionUUID->"93e51ab0-bd0b-4a12-97d4-c2439e48bd04"],

Cell[BoxData[
 DynamicModuleBox[{Typeset`open$$ = True}, 
  PaneSelectorBox[{False->
   RowBox[{
    OpenerBox[Dynamic[Typeset`open$$],
     ImageSize->Small], 
    StyleBox["TUG`TuGames`", "InfoHeading"]}], True->GridBox[{
     {
      RowBox[{
       OpenerBox[Dynamic[Typeset`open$$],
        ImageSize->Small], 
       StyleBox["TUG`TuGames`", "InfoHeading"]}]},
     {GridBox[{
        {
         ButtonBox["AdjustedEffUpperVectors",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "AdjustedEffUpperVectors", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["EpsilonValue",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"EpsilonValue", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Potential",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"Potential", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AdjustedEffVector",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"AdjustedEffVector", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["EpsValue",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"EpsValue", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["PreImpSet",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"PreImpSet", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AdjustedWorthVectors",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "AdjustedWorthVectors", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["EvalSumMinCoord",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"EvalSumMinCoord", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["PreKernel",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"PreKernel", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AllAntiSurpluses",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"AllAntiSurpluses", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ExcessPayoff",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ExcessPayoff", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["PreKernelElement",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"PreKernelElement", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AllCoalitions",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"AllCoalitions", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["FifthCriticalVal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"FifthCriticalVal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["PreKernelEqualsKernelQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "PreKernelEqualsKernelQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AllConstraints",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"AllConstraints", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["FigureSize",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"FigureSize", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["PreKernelQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"PreKernelQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AllMaxSurpluses",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"AllMaxSurpluses", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["FilledCoreV6",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"FilledCoreV6", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["PreKernelSolution",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"PreKernelSolution", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AnimationKernelProperty2d",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "AnimationKernelProperty2d", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["FindKernelSolution",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"FindKernelSolution", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["PreNucleolus",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"PreNucleolus", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AntiPreKernel",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"AntiPreKernel", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["FindPreKernelSolution",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "FindPreKernelSolution", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["PrimalExtension",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"PrimalExtension", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AntiPreKernelQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"AntiPreKernelQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["FirstCriticalVal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"FirstCriticalVal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ProperAmount",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ProperAmount", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AntiPreKernelSolution",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "AntiPreKernelSolution", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["FourthCriticalVal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"FourthCriticalVal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ProperContribution",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ProperContribution", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ApproxNuc",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ApproxNuc", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["FTPreNuc",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"FTPreNuc", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ProperModPreKernel",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ProperModPreKernel", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ApproxPreNuc",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ApproxPreNuc", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["GameBasis",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"GameBasis", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["PseudoInv",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"PseudoInv", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AvConvexQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"AvConvexQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["GameMonotoneQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"GameMonotoneQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Quota",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"Quota", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["AverageConvexQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"AverageConvexQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Gap",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"Gap", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["RationalApproximate",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"RationalApproximate", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["BalancedSelectionQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"BalancedSelectionQ", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["GrandCoalitionLargestValueQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "GrandCoalitionLargestValueQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["RationalExact",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"RationalExact", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["BargainUnanMatrix",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"BargainUnanMatrix", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["HarsanyiDividends",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"HarsanyiDividends", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["RationalTol",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"RationalTol", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["BargUnanMat",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"BargUnanMat", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ImputationQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ImputationQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ReasonableOutcome",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ReasonableOutcome", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["BaryCenter",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"BaryCenter", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ImputationToEqClass",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ImputationToEqClass", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ReasonableSet",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ReasonableSet", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["BelongToCoreQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"BelongToCoreQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ImputationToMatrix",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ImputationToMatrix", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Scrb",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"Scrb", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["BestCoalitions",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"BestCoalitions", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ImputationToVec",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ImputationToVec", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ScrbSolution",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ScrbSolution", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["BestCoalToMatrix",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"BestCoalToMatrix", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["IncreasingMargContributions",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "IncreasingMargContributions", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SecondCriticalVal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"SecondCriticalVal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CalcStepSize",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"CalcStepSize", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["IncSize",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"IncSize", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SecondStarCriticalVal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "SecondStarCriticalVal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CallMaximize",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"CallMaximize", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["InFavor",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"InFavor", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SelectionKBalancedQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"SelectionKBalancedQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CddGmpPlotCore",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"CddGmpPlotCore", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["IntersectionOfMaxExcessSets",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "IntersectionOfMaxExcessSets", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SelectSuperSets",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"SelectSuperSets", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CddGmpPlotImputationSet",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "CddGmpPlotImputationSet", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["IntersectionUpperLowerSetQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "IntersectionUpperLowerSetQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SetGameToNonZeroMonotonic",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "SetGameToNonZeroMonotonic", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CddGmpPlotLowerSet",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"CddGmpPlotLowerSet", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["IsModiclusQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"IsModiclusQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SetRecursionLimit",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"SetRecursionLimit", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CddGmpPlotReasonableSet",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "CddGmpPlotReasonableSet", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["IsModPreKernelQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"IsModPreKernelQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SetsToVec",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"SetsToVec", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CddGmpVerticesCore",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"CddGmpVerticesCore", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["IsProperModPreKernelQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "IsProperModPreKernelQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ShapleyValueML",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ShapleyValueML", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CddVerticesCore",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"CddVerticesCore", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["kBalancednessQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"kBalancednessQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ShowObjectiveFunction",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "ShowObjectiveFunction", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CddVerticesImputationSet",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "CddVerticesImputationSet", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["kCover",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"kCover", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Silent",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"Silent", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CddVerticesLowerSet",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"CddVerticesLowerSet", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Kernel",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"Kernel", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SmallestCardinality",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"SmallestCardinality", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CddVerticesReasonableSet",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "CddVerticesReasonableSet", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["KernelCalculation",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"KernelCalculation", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SmallestContribution",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "SmallestContribution", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ChangeInternalEps",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ChangeInternalEps", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["KernelImputationListQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "KernelImputationListQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SmallestContributionVector",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "SmallestContributionVector", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CharacteristicValues",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "CharacteristicValues", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["KernelImputationQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"KernelImputationQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SolutionExact",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"SolutionExact", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["coal",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"coal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["KernelRange",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"KernelRange", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["StarCriticalVal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"StarCriticalVal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CollectionOfDecreasingExcess",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "CollectionOfDecreasingExcess", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["KernelVertices",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"KernelVertices", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["StrictlyConvexUnanConditionQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "StrictlyConvexUnanConditionQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["Concession",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"Concession", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Labeling",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"Labeling", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["StrIncreasMargContrib",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "StrIncreasMargContrib", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ConjugateFunction",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ConjugateFunction", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["LargestAmount",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"LargestAmount", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["StrongEpsCore2d",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"StrongEpsCore2d", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ConvCheck",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ConvCheck", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["LexiCenter",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"LexiCenter", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["SuperAdditiveQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"SuperAdditiveQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ConvexConjugate",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ConvexConjugate", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["LorenzSolution",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"LorenzSolution", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["TauValue",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"TauValue", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ConvexQ",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"ConvexQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["LowerCritVal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"LowerCritVal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ThirdCriticalVal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ThirdCriticalVal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ConvexStrQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ConvexStrQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["LowerSetIncImputationQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "LowerSetIncImputationQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ThirdStarCriticalVal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "ThirdStarCriticalVal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ConvexUnanConditionQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "ConvexUnanConditionQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["LowerSetQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"LowerSetQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Tight",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"Tight", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ConvStrQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ConvStrQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["LSNuc",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"LSNuc", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["TIJsets",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"TIJsets", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CoordS",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"CoordS", "TUG`TuGames`"}},
          
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["LSPreNuc",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"LSPreNuc", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Transfer",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"Transfer", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CoreElementsQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"CoreElementsQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["MargValue",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"MargValue", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["TransferConstraints",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"TransferConstraints", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["CostSaving",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"CostSaving", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["MaxExcessBalanced",
          BaseStyle->"InformationLink",
          ButtonData:>{
           "Info33757086647-2696204", {"MaxExcessBalanced", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["UnanAvConvexQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"UnanAvConvexQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DefineGame",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DefineGame", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["MaxExcessSets",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"MaxExcessSets", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["UnanConvexQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"UnanConvexQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DeltaLP",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"DeltaLP", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["MaximumSurpluses",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"MaximumSurpluses", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["UnanimityCoordinates",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "UnanimityCoordinates", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DetEqClass",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DetEqClass", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["MaxSurplus",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"MaxSurplus", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["UpperCritVal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"UpperCritVal", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DetQuasiAvConvex",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DetQuasiAvConvex", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["MinExcessBalanced",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"MinExcessBalanced", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["UpperSetIncImputationQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "UpperSetIncImputationQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DetUCoord",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DetUCoord", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["MinUnanimityCoordinates",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "MinUnanimityCoordinates", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["UpperSetQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"UpperSetQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DigitPrecision",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DigitPrecision", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["MLExtension",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"MLExtension", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["UseManipulate",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"UseManipulate", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DirectionOfImprovement",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "DirectionOfImprovement", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ModCoalArray",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ModCoalArray", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["UtopiaPayoff",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"UtopiaPayoff", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DisagreeConvex",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DisagreeConvex", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Modiclus",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"Modiclus", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["UtopiaSum",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"UtopiaSum", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["Disagreement",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"Disagreement", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ModifiedKernel",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ModifiedKernel", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["UtopiaVector",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"UtopiaVector", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DisplayAllResults",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DisplayAllResults", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ModifiedNucleolus",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ModifiedNucleolus", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ValueExcess",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ValueExcess", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DisplayCoord",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DisplayCoord", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ModPreKernel",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ModPreKernel", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Vec3DToSimplex",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"Vec3DToSimplex", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DisplayLegend",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DisplayLegend", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["MonotoneQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"MonotoneQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["VerticesCore",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"VerticesCore", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DisplayMatrixForm",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DisplayMatrixForm", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["NewShapley",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"NewShapley", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["WeaklyBalancedSelectionQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "WeaklyBalancedSelectionQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DualCover",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DualCover", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["NonLinNuc",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"NonLinNuc", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["WeaklySuperAdditiveQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "WeaklySuperAdditiveQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DualExtension",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DualExtension", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["NonLinPreNuc",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"NonLinPreNuc", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["WeightedMajority",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"WeightedMajority", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DualGame",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DualGame", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["Nuc1convex",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"Nuc1convex", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["WithIncidences",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"WithIncidences", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["DuttaRay",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"DuttaRay", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["NumericalPrec",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"NumericalPrec", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ZeroMonotoneQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ZeroMonotoneQ", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["ECCoverGame",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"ECCoverGame", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["OneNormalization",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"OneNormalization", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ZeroNormalization",
          BaseStyle->"InformationLink",
          ButtonData:>{
           "Info33757086647-2696204", {"ZeroNormalization", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["EffVector",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"EffVector", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["OptStepSize",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"OptStepSize", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["ZeroOneNormalization",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {
            "ZeroOneNormalization", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"]},
        {
         ButtonBox["EpsCore",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info33757086647-2696204", {"EpsCore", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], 
         ButtonBox["PlayerPairs",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info33757086647-2696204", {"PlayerPairs", "TUG`TuGames`"}},
          ButtonNote->"TUG`TuGames`"], ""}
       },
       DefaultBaseStyle->"InfoGrid",
       GridBoxItemSize->{"Columns" -> {{
            Scaled[0.31666666666666665`]}}}]}
    },
    GridBoxAlignment->{"Columns" -> {{Left}}, "Rows" -> {{Baseline}}}]}, 
   Dynamic[Typeset`open$$],
   ImageSize->Automatic]]], "Print", \
"InfoCell",ExpressionUUID->"c2334a6d-f785-4b69-90bd-55e21e2d4e79"]
}, Open  ]],

Cell["\<\
Just click with your mouse pointer on the functions name to get a short \
description how to use it.  \
\>", "Text",ExpressionUUID->"daf4a500-d9c1-4e67-bd0b-d30f407b6219"],

Cell[BoxData["\<\"ConvexQ[game] checks if the Tu-game is convex.\\n  It \
returns the value 'True' or 'False'.\"\>"], "Print",
 CellTags->
  "Info3264939207-8254035",ExpressionUUID->"2fa85c85-63fd-407e-b43c-\
6c01d0de944e"],

Cell["\<\
To obtain a brief documentation about individual functions type \
\>", "Text",ExpressionUUID->"33486ce1-059c-4937-8acd-394fab339358"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"?", "TUG`TuGames`ConvexQ"}]], "Input",ExpressionUUID->"997f2bfe-eb75-4aec-adc7-c02d726e0cac"],

Cell[BoxData["\<\"ConvexQ[game] checks if the Tu-game is convex. It returns \
the value 'True' or 'False'.\"\>"], "Print", "PrintUsage",
 CellTags->
  "Info43757086656-2696204",ExpressionUUID->"cc496c95-5e82-4c83-918b-\
0ba1b63c8157"]
}, Open  ]],

Cell[TextData[{
 "if you are interested in a specific function name like",
 StyleBox[" ConvexQ[]",
  FontWeight->"Bold"],
 "."
}], "Text",ExpressionUUID->"f9b63f97-1e7c-4f0b-bb6e-9fe7cb7beb61"],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["3.1. How to define Games?",
 BaseStyle->"Hyperlink",
 ButtonData:>"3.1."]], "Subsubsection",
 CellTags->
  "How to define \
Games?",ExpressionUUID->"4244e44e-d670-4746-9f63-76a2f56da346"],

Cell[TextData[{
 "Note first that in the sequel we indicate the whole player set in the \
commands with the symbol  ",
 StyleBox["T",
  FontSlant->"Italic"],
 " instead of ",
 StyleBox["N. ",
  FontSlant->"Italic"],
 "We must deviate from the general game theoretical convention, since under \
",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " the symbol ",
 StyleBox["N",
  FontSlant->"Italic"],
 " is already occupied by the built-in function ",
 StyleBox["N[] ",
  FontWeight->"Bold"],
 "to evaluate an expression numerically. Whereas in the definitions and \
results we use the symbol ",
 StyleBox["N",
  FontSlant->"Italic"],
 " in the usual convention. \nWe can define a game in two different ways. The \
first one is the way as it was implemented by ",
 ButtonBox["Carter",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Carter"],
 " in his ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " package ",
 StyleBox["CooperativeGames",
  FontSlant->"Italic"],
 ". This procedure becomes very inconvenient for large games. The package ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 " provides, in addition, the function ",
 StyleBox["DefineGame[]",
  FontWeight->"Bold"],
 " to assign the values of the characteristic function for large games. Let \
us now present the representation of a TU-game used by ",
 ButtonBox["Carter",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Carter"],
 ". The values of the characteristic function are assigned by"
}], "Text",
 TextJustification->1,
 CellTags->
  "DefineGame",ExpressionUUID->"ea453bd5-c39b-4d7f-afb3-5bbea51fdb05"],

Cell[BoxData[
 RowBox[{"ExpGame1", ":=", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{"T", "=", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", "3", ",", "4"}], "}"}]}], ";", 
    RowBox[{"Clear", "[", "v", "]"}], ";", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", "}"}], "]"}], "=", "0"}], ";", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", "1", "}"}], "]"}], "=", "0"}], ";", "\[IndentingNewLine]", 
    
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", "2", "}"}], "]"}], "=", "0"}], ";", "\[IndentingNewLine]", 
    
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", "3", "}"}], "]"}], "=", "0"}], ";", "\[IndentingNewLine]", 
    
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", "4", "}"}], "]"}], "=", "0"}], ";", "\[IndentingNewLine]", 
    
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"1", ",", "2"}], "}"}], "]"}], "=", "0"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"1", ",", "3"}], "}"}], "]"}], "=", "0"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"1", ",", "4"}], "}"}], "]"}], "=", "0"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"2", ",", "3"}], "}"}], "]"}], "=", "0"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"2", ",", "4"}], "}"}], "]"}], "=", "0"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"3", ",", "4"}], "}"}], "]"}], "=", "0"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"1", ",", "2", ",", "3"}], "}"}], "]"}], "=", "40"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"1", ",", "2", ",", "4"}], "}"}], "]"}], "=", "0"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"1", ",", "3", ",", "4"}], "}"}], "]"}], "=", "40"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"2", ",", "3", ",", "4"}], "}"}], "]"}], "=", "0"}], ";", 
    RowBox[{
     RowBox[{"v", "[", "T", "]"}], "=", "90"}], ";"}], ")"}]}]], "Input",Expre\
ssionUUID->"e2765e7a-8943-4371-b55a-50bbc2d38c2a"],

Cell[TextData[{
 "To call the function ",
 StyleBox["DefineGame[]",
  FontWeight->"Bold"],
 " we define in a first step the player set and create a vector with zeros of \
length ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["2", "n"], TraditionalForm]],ExpressionUUID->
  "a08e856f-0923-4cd8-9dec-d29e5c9f3b1a"],
 ". "
}], "Text",ExpressionUUID->"baeef5e8-a68d-4d83-9e64-9ed565476082"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"T2", "=", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3", ",", "4"}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"vec2", "=", 
   RowBox[{"Table", "[", 
    RowBox[{"0", ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", "16"}], "}"}]}], "]"}]}], ";"}]}], "Input",ExpressionU\
UID->"5779ad86-08a4-481e-a09f-084b1079d525"],

Cell[TextData[{
 "Then we can assign positive values to some or all coalitions. It is also \
possible to assign coalition values directly to the vector, but in this case \
you have to know the exact order how the components of the vector are \
assigned to the coalitions. Note that you should not assign negative or \
floating point values to the coalitions. The commands in the package ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 " require nonnegative  or rational numbers for the coalitional values to \
perform the computational task correctly.  For instance, if you use floating \
point numbers some functions can run into an infinite loop and never \
terminate. In this case choose from the menu ",
 StyleBox["Kernel",
  FontWeight->"Bold"],
 " ",
 StyleBox["->",
  FontWeight->"Bold"],
 "  ",
 StyleBox["Abort Evaluation",
  FontWeight->"Bold"],
 "."
}], "Text",
 TextJustification->1,ExpressionUUID->"aab50f46-f3cd-49f2-88af-a019fe88aef5"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame2", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T2", ",", "vec2"}], "]"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "3"}], "}"}], "]"}], "=", "40"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3", ",", "4"}], "}"}], "]"}], "=", "40"}], ";", 
     RowBox[{
      RowBox[{"v", "[", "T", "]"}], "=", "90"}], ";"}], ")"}]}], 
  ";"}]], "Input",ExpressionUUID->"584ee116-cfff-4dde-9dc8-dff414c5dfac"],

Cell[TextData[{
 "Here is an example with five players. The example is borrowed from ",
 ButtonBox["Maschler, Peleg and Shapley",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Maschler"],
 " (1979) (cf. p. 317)."
}], "Text",
 CellTags->"(1979)",ExpressionUUID->"fbdc55aa-1330-4335-9b17-f50c6300de5a"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"T3", "=", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3", ",", "4", ",", "5"}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"vec3", "=", 
   RowBox[{"Table", "[", 
    RowBox[{"0", ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", "32"}], "}"}]}], "]"}]}], ";"}]}], "Input",ExpressionU\
UID->"7e70a5bb-086e-4cff-88a5-fa079ec7a147"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame3", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T3", ",", "vec3"}], "]"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "4"}], "}"}], "]"}], "=", "4"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "5"}], "}"}], "]"}], "=", "4"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3", ",", "4"}], "}"}], "]"}], "=", "4"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3", ",", "5"}], "}"}], "]"}], "=", "4"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3", ",", "4"}], "}"}], "]"}], "=", "4"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3", ",", "5"}], "}"}], "]"}], "=", "4"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"4", ",", "5"}], "}"}], "]"}], "=", "4"}], ";", 
     RowBox[{
      RowBox[{"v", "[", "T", "]"}], "=", "7"}], ";"}], ")"}]}], 
  ";"}]], "Input",ExpressionUUID->"10b0cb09-6437-4091-954c-570b984b073e"],

Cell["Next an average-convex  game:", "Text",ExpressionUUID->"3e448a07-7171-43fc-8dfb-2228f5d9c2eb"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame4", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T2", ",", "vec2"}], "]"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2"}], "}"}], "]"}], "=", 
      FractionBox["1", "4"]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "4"}], "}"}], "]"}], "=", 
      FractionBox["1", "4"]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3"}], "}"}], "]"}], "=", 
      FractionBox["1", "4"]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4"}], "}"}], "]"}], "=", 
      FractionBox["3", "8"]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "3"}], "}"}], "]"}], "=", 
      FractionBox["1", "2"]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "4"}], "}"}], "]"}], "=", 
      FractionBox["1", "2"]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3", ",", "4"}], "}"}], "]"}], "=", 
      FractionBox["1", "2"]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3", ",", "4"}], "}"}], "]"}], "=", 
      FractionBox["1", "2"]}], ";", 
     RowBox[{
      RowBox[{"v", "[", "T", "]"}], "=", "1"}], ";"}], ")"}]}], 
  ";"}]], "Input",ExpressionUUID->"f7ba916c-589f-4329-9577-ad3b6b73fb76"],

Cell[TextData[{
 "Note that we have just assigned the values to the characteristic functions, \
but these values are at the moment not evaluated. Since under the operator \
\":=\" the right hand side, that means, in our case the game, is maintained \
in an unevaluated form. The game is at that moment evaluated when a function \
is invoked that requires as an input the pattern ",
 StyleBox["game_name, ",
  FontSlant->"Italic"],
 " that is, in the case that the left hand expression ",
 StyleBox["game_name",
  FontSlant->"Italic"],
 " appears, it is replaced by the right hand expression, the game.",
 StyleBox[" ",
  FontSlant->"Italic"],
 " To see that at the moment no game is really evaluated type "
}], "Text",
 TextJustification->1,ExpressionUUID->"a6182cf8-d3f0-48ab-87ca-208c53ec7a56"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"??", "v"}]], "Input",ExpressionUUID->"2ee4a91d-efa3-422b-b76d-2b2c59d993e6"],

Cell[BoxData["\<\"v[S] describes the worth of coalition S\"\>"], "Print", "PrintUsage",
 CellTags->
  "Info133757086683-2696204",ExpressionUUID->"ae20088c-465d-4464-aa90-\
f79e22bb2344"]
}, Open  ]],

Cell[TextData[{
 "Due to the fact that nothing is evaluated at the moment you get a short \
function description back. Problems encountered with the operator \":=\" in \
the context of our package is briefly discussed in ",
 ButtonBox["Section 6",
  BaseStyle->"Hyperlink",
  ButtonData:>"Concluding Remarks and Limitations"],
 ". "
}], "Text",
 TextJustification->1,ExpressionUUID->"e3753de6-5c01-4fd2-ad9f-fa66e795bb17"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["4. Some Functions",
 BaseStyle->"Hyperlink",
 ButtonData:>"4."]], "Section",
 CellTags->
  "Some Functions",ExpressionUUID->"6a911259-b386-4611-8e1a-afb9bbcf33f5"],

Cell[TextData[{
 "In this section we will discuss some basic functions provided by ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 " to examine some game properties like convexity, average-convexity, \
superadditvity, monotonicity and zero-monotonicity. Furthermore, ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 " will also enable us to evaluated solutions of a game like the Shapley \
value, tau-value  or the kernel.  In the sequel of the section we will \
discuss as well functions related to the notion of ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-convexity and unanimity coordinates. At this place some remarks are \
required concerning the presentation of the material in this notebook. The \
purpose of this notebook is to give the potential user a short description at \
hand how to use the new commands related to transferable utility games \
correctly. We will not embed the descriptions of the commands in a thorough \
game theoretical presentation of definitions and results on which the \
commands are based on. We just introduce definitions and results in cases \
where it is according to our opinion useful to do so. This is done to mention \
differences between functions that do ostensible the same or where we have \
used special results in our functions that are not quite common. In addition, \
we will also dispense from any code presentation and discussion. Users \
interested in this material should examine and try out for themselves the \
code presented in the package ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 ". Moreover, we assume that users bring along good knowledge in cooperative \
game theory to asses the results correctly in a game theoretical context. \
Nevertheless, we hope that the package might be useful for research as well \
as for teaching purpose in constructing examples in both of these fields. \
Certainly, it is assumed that users have some experience with ",
 StyleBox["Mathematica, ",
  FontSlant->"Italic"],
 "but it is not a prerequisite for the use of the package."
}], "Text",
 TextJustification->1,ExpressionUUID->"05d6877f-4996-40e2-84a3-c1f2c4485114"],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["4.1. Basic Functions",
 BaseStyle->"Hyperlink",
 ButtonData:>"4.1."]], "Subsubsection",
 FontSize->16,
 CellTags->
  "Basic Functions",ExpressionUUID->"47bf0c18-37a4-4a2b-ae12-ae68e74ea64f"],

Cell[TextData[{
 "In general, functions are invoked by the function name and its parameters, \
in most cases a function needs as an input parameter the ",
 StyleBox["game_name",
  FontSlant->"Italic"],
 ", a list of imputations (payoffs), a set of coalitions or a player from the \
player set. To make the point more precise let us first start with some \
functions that need just one parameter to examine some well known game \
properties. The function that examines the convexity condition of the game is \
called ",
 StyleBox["ConvexQ[]",
  FontWeight->"Bold"],
 " and it needs just one parameter, namely the ",
 StyleBox["game_name",
  FontSlant->"Italic"],
 " to perform the necessary calculations to check on this game property. We \
can verify convexity by invoking"
}], "Text",
 TextJustification->1,ExpressionUUID->"46ed9f3c-32ad-4bbb-b346-1712b96cf286"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"4164757e-194c-49e6-a9f6-aa8b53ef8448"],

Cell[BoxData["True"], "Output",ExpressionUUID->"b8838919-5bd6-4b85-bb4c-abb8239ec82b"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame2", "]"}]], "Input",ExpressionUUID->"c0338946-50be-40d8-aabe-b90f078cc839"],

Cell[BoxData["True"], "Output",ExpressionUUID->"7832dd30-a489-4d28-9b9e-34d521c0fb84"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"bd4bd202-169d-4590-85e7-b1badeac50e5"],

Cell[BoxData["False"], "Output",ExpressionUUID->"851cebf0-6437-424b-bee1-0aa2ae73c842"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame4", "]"}]], "Input",ExpressionUUID->"e6f7aee8-ef9e-4353-a46d-02e616008a7e"],

Cell[BoxData["False"], "Output",ExpressionUUID->"a0e97c99-7a66-4377-806b-928a7b35a665"]
}, Open  ]],

Cell[TextData[{
 "Additionally to the possibility to check whether a game is convex, we are \
also able to examine with the command ",
 StyleBox["AvConvexQ[]",
  FontWeight->"Bold"],
 " a generalized convexity property, the so-called  average convexity. Since, \
average-convexity generalize convexity it should be clear that convexity \
implies average-convexity, but the converse is not true. The property of \
average-convexity has been introduced by ",
 ButtonBox["Inarra and Usategui ",
  BaseStyle->"Hyperlink",
  ButtonData:>"E. Inarra"],
 "(1993) in the literature. Before we will discuss this command note first \
that average-convexity  is defined as follows"
}], "Text",
 TextJustification->1,
 CellTags->"(1993)",ExpressionUUID->"e3fc2368-7c99-4863-b4bc-c29f4a066be9"],

Cell[TextData[{
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{
     SubscriptBox["\[Sum]", 
      RowBox[{"i", " ", "\[Element]", "S", " "}]], 
     RowBox[{"[", 
      RowBox[{
       RowBox[{"v", "(", "S", ")"}], " ", "-", 
       RowBox[{"v", "(", 
        RowBox[{"S", "\\", "i"}], ")"}]}], "]"}]}], "   ", "\[LessEqual]", 
    " ", 
    RowBox[{
     SubscriptBox["\[Sum]", 
      RowBox[{"i", " ", "\[Element]", "S", " "}]], 
     RowBox[{"[", 
      RowBox[{
       RowBox[{"v", "(", "R", ")"}], "-", 
       RowBox[{"v", "(", 
        RowBox[{"R", "\\", "i"}], ")"}]}], "]"}], "    "}]}], 
   TraditionalForm]],ExpressionUUID->"6d506a03-ff9d-44f4-a123-2635c9c7feff"],
 "for all ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{
    "S", " ", "\[SubsetEqual]", " ", "R", " ", "\[SubsetEqual]", " ", "N"}], 
    ",", " ", 
    RowBox[{"S", " ", "\[NotEqual]", 
     RowBox[{"\[Phi]", ".", "  "}]}]}], TraditionalForm]],ExpressionUUID->
  "ca4c0ebf-3b47-4d4e-82d1-5e7028df5861"]
}], "Text",
 TextAlignment->Center,
 TextJustification->0,ExpressionUUID->"d99a13f1-6f7b-447e-bff4-4d9efa245b9b"],

Cell[TextData[{
 "Similar to the function",
 StyleBox[" ConvexQ[]",
  FontWeight->"Bold"],
 " the function ",
 StyleBox["AvConvexQ[]",
  FontWeight->"Bold"],
 " that test the average-convexity  condition of the game is called with one \
parameter, the ",
 StyleBox["game_name",
  FontSlant->"Italic"],
 ".  Hence, we need just to type"
}], "Text",
 TextJustification->1,ExpressionUUID->"70c488ba-4399-4d7f-a08b-bfd076468f3a"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"dbcbe7ae-7ecb-46f3-a32a-b6836f9c3b11"],

Cell[BoxData["True"], "Output",ExpressionUUID->"3d387d9c-9148-484d-9f13-e4ad1b637840"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame2", "]"}]], "Input",ExpressionUUID->"147d66ae-0697-4115-89ae-a8a3c7ff89ca"],

Cell[BoxData["True"], "Output",ExpressionUUID->"2e4d1383-8602-4b60-91f2-56dbbceed275"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"4f9d3b03-1119-463f-bb30-9d3924ad3c06"],

Cell[BoxData["False"], "Output",ExpressionUUID->"559e2bdc-13a6-4a61-9331-6f80411941eb"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame4", "]"}]], "Input",ExpressionUUID->"2e453eb2-36ba-464d-99d5-794d0f3fee44"],

Cell[BoxData["True"], "Output",ExpressionUUID->"653b7df0-d9ee-4ef0-bb37-c4ddcf76720a"]
}, Open  ]],

Cell["Superadditivity can be checked by ", "Text",ExpressionUUID->"f3d66646-5f48-4be2-93bf-68d5c8f421af"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"428ebec2-3e31-4bc3-8ab7-8e67f872338c"],

Cell[BoxData["True"], "Output",ExpressionUUID->"42674b1c-e011-4ae2-a0da-960f38c1af1e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame2", "]"}]], "Input",ExpressionUUID->"74133b00-8603-4d22-ab19-b306f629f466"],

Cell[BoxData["True"], "Output",ExpressionUUID->"e199116d-9bcb-448c-9b85-10a7a44b8a30"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"6758882a-064b-4f58-93b0-138f1890f399"],

Cell[BoxData["True"], "Output",ExpressionUUID->"14308376-7ede-4b89-8e81-d7dee3cb12de"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame4", "]"}]], "Input",ExpressionUUID->"65081ecd-2ca3-4a6a-8be0-faf4f106c1bc"],

Cell[BoxData["True"], "Output",ExpressionUUID->"4b19b973-7c3a-4aa6-8b10-07afc8daeb3c"]
}, Open  ]],

Cell[TextData[{
 "Let the coalitions ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["S", "1"], ",", "...", ",", 
    SubscriptBox["S", "k"]}], TraditionalForm]],ExpressionUUID->
  "0ec1bb21-cabf-4cfa-a267-f64dc8c2b7eb"],
 "  partition the grand coalition ",
 StyleBox["T",
  FontSlant->"Italic"],
 ".  A necessary condition for the core ",
 StyleBox["C(v)",
  FontSlant->"Italic"],
 " of a game ",
 StyleBox["v",
  FontSlant->"Italic"],
 " to be nonempty is that the condition"
}], "Text",ExpressionUUID->"4f34972d-0dd2-4068-bcc1-96ea934e4c8a"],

Cell[TextData[Cell[BoxData[
 FormBox[
  RowBox[{
   RowBox[{
    UnderoverscriptBox["\[Sum]", 
     RowBox[{"i", "=", "1"}], "k"], 
    RowBox[{"v", "(", 
     SubscriptBox["S", "i"], ")"}]}], " ", "\[LessEqual]", " ", 
   RowBox[{"v", "(", "N", ")"}]}], 
  TraditionalForm]],ExpressionUUID->"67f0416f-6169-4261-8607-d8b5483a1c26"]], \
"Text",
 TextAlignment->Center,ExpressionUUID->"5135245e-a501-4f72-8031-d32051964678"],

Cell[TextData[{
 "is satisfied. This property is captured by the function ",
 StyleBox["WeaklySuperAdditiveQ[].",
  FontWeight->"Bold"]
}], "Text",ExpressionUUID->"c70ae09c-0110-4413-bf59-b393e2056c52"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame1", "]"}]], "Input",ExpressionUU\
ID->"8b8e5059-68a2-4017-ac54-20a5a2844f43"],

Cell[BoxData["True"], "Output",ExpressionUUID->"0906a604-e40c-45f8-b770-d6eaaffb5e37"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame2", "]"}]], "Input",ExpressionUU\
ID->"9f805f37-11c4-45c4-a775-6b8808528cda"],

Cell[BoxData["True"], "Output",ExpressionUUID->"0d7d37f6-3180-4302-b780-13757983ff8c"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame3", "]"}]], "Input",ExpressionUU\
ID->"78366b9f-6e51-4c87-8092-f855e92a8880"],

Cell[BoxData["True"], "Output",ExpressionUUID->"0e77b80f-351c-409f-bf3b-07f14582d2db"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame4", "]"}]], "Input",ExpressionUU\
ID->"cd2b15bc-0ea2-46da-b7fb-e36e0fd98825"],

Cell[BoxData["True"], "Output",ExpressionUUID->"20e256f4-bca2-43ea-8dfe-105715839764"]
}, Open  ]],

Cell[TextData[{
 "Certainly, we can also verify on monotonicity and zero-monotonicity  of the \
game. The commands are ",
 StyleBox["GameMonotoneQ[],",
  FontWeight->"Bold"],
 " ",
 StyleBox["MonotoneQ[]",
  FontWeight->"Bold"],
 " and ",
 StyleBox["ZeroMonotoneQ[]",
  FontWeight->"Bold"],
 "."
}], "Text",
 TextJustification->1,ExpressionUUID->"bf71d04a-09db-42cf-96be-1d6e61a3068d"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"0629bc6d-676a-4500-b278-1638cfecb9db"],

Cell[BoxData["True"], "Output",ExpressionUUID->"add0086a-a5b2-4fba-afcc-f82a6f57dc9c"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MonotoneQ", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"2101476e-f249-469c-b406-e0ce60030ce3"],

Cell[BoxData["True"], "Output",ExpressionUUID->"c1ebf57a-6b3b-49a0-a59e-b479c9e31980"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"af3d06df-148e-4270-98ef-fed9bd3ac4b4"],

Cell[BoxData["True"], "Output",ExpressionUUID->"6ff3fcd2-d902-45b0-9721-59b7aa506232"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame2", "]"}]], "Input",ExpressionUUID->"b8a4943e-20fe-4814-9105-85d903b4570a"],

Cell[BoxData["True"], "Output",ExpressionUUID->"1b797c13-09cf-47d9-be2f-2c7fa059ad11"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MonotoneQ", "[", "ExpGame2", "]"}]], "Input",ExpressionUUID->"f7f95c2d-e947-4bb9-b7b8-4940f08b8246"],

Cell[BoxData["True"], "Output",ExpressionUUID->"e213b62c-a322-4eec-a441-73c0d26d40d5"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame2", "]"}]], "Input",ExpressionUUID->"331f6a45-50e7-42ef-9361-c6d6daa42599"],

Cell[BoxData["True"], "Output",ExpressionUUID->"a6972f90-bb2f-460f-bb34-adbc35a3d454"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"eb07fe66-e755-4982-ba9a-ca216a60eba9"],

Cell[BoxData["False"], "Output",ExpressionUUID->"a0d2bf92-53af-4b76-b1dd-33e1dcad4f67"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MonotoneQ", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"ff44464e-cf54-4d8e-988a-acebf5fce1bc"],

Cell[BoxData["False"], "Output",ExpressionUUID->"e589a811-83d7-44a4-bae9-c81c4b82d358"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"cb2df0fc-e017-427e-bb58-381ffc94a258"],

Cell[BoxData["False"], "Output",ExpressionUUID->"9432c17e-c24b-4d6a-864b-a65f7d6201a6"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame4", "]"}]], "Input",ExpressionUUID->"f490c4c9-3011-4d32-804f-ca6f4b58ed14"],

Cell[BoxData["True"], "Output",ExpressionUUID->"17513f18-7329-45ff-859e-1833d3f36d13"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MonotoneQ", "[", "ExpGame4", "]"}]], "Input",ExpressionUUID->"911510f6-f786-470b-b5be-1be4699a0973"],

Cell[BoxData["True"], "Output",ExpressionUUID->"1ba0d4bb-e219-4c29-bcd2-06ad4b0f45af"]
}, Open  ]],

Cell[TextData[{
 "To demonstrate that the package ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 " works properly together with ",
 StyleBox["CooperativeGames",
  FontSlant->"Italic"],
 " let us now call the command ",
 StyleBox["CoreQ[]",
  FontWeight->"Bold"],
 " written by ",
 ButtonBox["Carter",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Carter"],
 "."
}], "Text",ExpressionUUID->"efca523b-65d0-4811-91d2-3e95b2fab356"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"582f4157-00e7-4c87-b5a8-5477a4503c5a"],

Cell[BoxData["True"], "Output",ExpressionUUID->"009551cb-9c4e-4e1d-b967-8fb05fb1039d"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame2", "]"}]], "Input",ExpressionUUID->"fdf0f0d4-14c9-4ecf-95ea-75001f75f675"],

Cell[BoxData["True"], "Output",ExpressionUUID->"b0a935dd-eba1-4650-9446-edd476cafe36"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"9171a69d-6443-4839-a824-cfcc4d286a79"],

Cell[BoxData["True"], "Output",ExpressionUUID->"a9083402-ef55-4e43-b196-3f28e47d0057"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame4", "]"}]], "Input",ExpressionUUID->"d9c875e5-7ebf-4dac-8220-11b93a3a2163"],

Cell[BoxData["True"], "Output",ExpressionUUID->"efebe716-d1ed-4a58-8137-7d2483243614"]
}, Open  ]],

Cell["Now determine the quotas of the games", "Text",ExpressionUUID->"04cef77d-4256-4e0f-84d5-96015d2c8dd6"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Quota", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"78c44c3a-8760-4822-a97b-49d9908a0af7"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["80", "3"], ",", 
   RowBox[{"-", 
    FractionBox["40", "3"]}], ",", 
   FractionBox["80", "3"], ",", 
   RowBox[{"-", 
    FractionBox["40", "3"]}]}], "}"}]], "Output",ExpressionUUID->"d95b2f85-\
66fa-4e81-b145-91568f047bc4"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Quota", "[", "ExpGame2", "]"}]], "Input",ExpressionUUID->"5af80c9a-8636-4ff7-991e-66e4c71b509d"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["80", "3"], ",", 
   RowBox[{"-", 
    FractionBox["40", "3"]}], ",", 
   FractionBox["80", "3"], ",", 
   RowBox[{"-", 
    FractionBox["40", "3"]}]}], "}"}]], "Output",ExpressionUUID->"d688fe35-\
a685-43f4-bb87-917cbbaf8f63"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Quota", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"3fcb2a66-89aa-49ea-9f68-2674f2e40128"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}]], "Output",Expr\
essionUUID->"044a0ec7-8793-4ea2-8831-449c0a61b03e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Quota", "[", "ExpGame4", "]"}]], "Input",ExpressionUUID->"411ed33e-b784-46ba-a161-4bcc13910400"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1", "6"], ",", 
   FractionBox["1", "6"], ",", 
   FractionBox["1", "6"], ",", 
   FractionBox["1", "6"]}], "}"}]], "Output",ExpressionUUID->"e1892beb-8a51-\
4356-bb5e-2e593d8fb6e9"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["4.2 k-convexity",
 BaseStyle->"Hyperlink",
 ButtonData:>"4.2."]], "Subsubsection",
 FontSize->16,
 CellTags->
  "k-convexity",ExpressionUUID->"de46248f-54a6-46b2-90c8-0e709b5e5b30"],

Cell[TextData[{
 StyleBox["In this section we present some basic functions related to the \
notion of ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["k",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["-convexity  that has been introduced by ",
  FontVariations->{"CompatibilityType"->0}],
 ButtonBox["Driessen",
  BaseStyle->"Hyperlink",
  ButtonData:>"Theo Driessen"],
 StyleBox[". The usefulness of this notion stems from the fact that TU-games  \
with this property having similar properties like convex games, although \
convexity does not imply ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["k",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["-convexity, and the converse is also not true in general. There is \
just a small subclass of games that satisfy both properties, for instance, \
bankruptcy games are convex as well as ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["k",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["-convex. The package ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["TuGames ",
  FontSlant->"Italic"],
 "provides some useful functions to determine properties of ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-convex  games. To demonstrate some of these functions, let us define to \
this end four new games. The first three games have been borrowed from ",
 ButtonBox["Driessen",
  BaseStyle->"Hyperlink",
  ButtonData:>"Theo Driessen"],
 " (1988), whereas two of them are 2-convex ( Exp. 4.5 on page 198 and Exp \
5.3 on page 202) and one of them is 1-convex \"",
 StyleBox["ExpGame7",
  FontSlant->"Italic"],
 "\" (cf. Exp. 5.6 on page 75). The last game presented in the series below \
is discussed in ",
 ButtonBox["Meinhardt",
  BaseStyle->"Hyperlink",
  ButtonData:>"H. Meinhardt"],
 " (2002) and satisfies also the property of 2-convexity."
}], "Text",
 TextJustification->1,
 CellTags->{
  "(1988)", "(2002a)"},ExpressionUUID->"e37224d0-86d4-4193-88ad-344131ad7610"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame5", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T2", ",", 
       RowBox[{"Table", "[", 
        RowBox[{"0", ",", 
         RowBox[{"{", 
          RowBox[{"i", ",", 
           RowBox[{"2", "^", 
            RowBox[{"Length", "[", "T2", "]"}]}]}], "}"}]}], "]"}]}], "]"}], 
     ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2"}], "}"}], "]"}], "=", 
      RowBox[{
       RowBox[{"v", "[", 
        RowBox[{"{", 
         RowBox[{"1", ",", "3"}], "}"}], "]"}], "=", "1"}]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3"}], "}"}], "]"}], "=", "4"}], ";", " ", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "4"}], "}"}], "]"}], "=", " ", "6"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "4"}], "}"}], "]"}], "=", "3"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4"}], "}"}], "]"}], "=", " ", "7"}], ";", " ", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "3"}], "}"}], "]"}], "=", "9"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "4"}], "}"}], "]"}], "=", "12"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", " ", 
        RowBox[{"1", ",", "3", ",", "4"}], "}"}], "]"}], "=", " ", "13"}], 
     ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3", ",", "4"}], "}"}], "]"}], "=", "15"}], ";", 
     RowBox[{
      RowBox[{"v", "[", "T", "]"}], "=", "20"}], ";"}], ")"}]}], 
  ";"}]], "Input",ExpressionUUID->"1f828355-fe91-40e7-a32e-a997377b67fc"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame6", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T2", ",", 
       RowBox[{"Table", "[", 
        RowBox[{"0", ",", 
         RowBox[{"{", 
          RowBox[{"i", ",", 
           RowBox[{"2", "^", 
            RowBox[{"Length", "[", "T2", "]"}]}]}], "}"}]}], "]"}]}], "]"}], 
     ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "3"}], "}"}], "]"}], "=", 
      RowBox[{
       RowBox[{"v", "[", 
        RowBox[{"{", 
         RowBox[{"1", ",", "2", ",", "4"}], "}"}], "]"}], "=", 
       RowBox[{
        RowBox[{"v", "[", 
         RowBox[{"{", 
          RowBox[{"1", ",", "3", ",", "4"}], "}"}], "]"}], "=", 
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"2", ",", "3", ",", "4"}], "}"}], "]"}], "=", "3"}]}]}]}], 
     ";", 
     RowBox[{
      RowBox[{"v", "[", "T", "]"}], "=", "5"}], ";"}], ")"}]}], 
  ";"}]], "Input",ExpressionUUID->"4470fbae-e589-40ad-a848-e15824ba7328"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"T4", "=", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3"}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"vec4", "=", 
   RowBox[{"Table", "[", 
    RowBox[{"0", ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", 
       RowBox[{"2", "^", 
        RowBox[{"Length", "[", "T4", "]"}]}]}], "}"}]}], "]"}]}], 
  ";"}]}], "Input",ExpressionUUID->"518187e2-889e-43b5-bce0-ceb235ac73a0"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame7", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T4", ",", 
       RowBox[{"Table", "[", 
        RowBox[{"0", ",", 
         RowBox[{"{", 
          RowBox[{"i", ",", 
           RowBox[{"2", "^", 
            RowBox[{"Length", "[", "T4", "]"}]}]}], "}"}]}], "]"}]}], "]"}], 
     ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", "2", "}"}], "]"}], "=", 
      RowBox[{
       RowBox[{"v", "[", 
        RowBox[{"{", "3", "}"}], "]"}], "=", "6"}]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2"}], "}"}], "]"}], "=", 
      RowBox[{
       RowBox[{"v", "[", 
        RowBox[{"{", 
         RowBox[{"1", ",", "3"}], "}"}], "]"}], "=", "9"}]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3"}], "}"}], "]"}], "=", "15"}], ";", 
     RowBox[{
      RowBox[{"v", "[", "T", "]"}], "=", "18"}], ";"}], ")"}]}], 
  ";"}]], "Input",ExpressionUUID->"5bbac853-bd33-42e0-98b2-411b4177ee73"],

Cell[TextData[{
 "As mentioned above you could assign the values of the characteristic \
function directly by constructing a vector of length ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["2", "n"], TraditionalForm]],ExpressionUUID->
  "865c91b1-3e1d-474c-b9b7-98a98dd36877"],
 "simply by"
}], "Text",ExpressionUUID->"e800518f-904f-4b40-9003-ee67e79b9dfd"],

Cell[BoxData[
 RowBox[{
  RowBox[{"coalval", "=", 
   RowBox[{"{", 
    RowBox[{"0", ",", "26.7", ",", "26.7", ",", "26.7", ",", "26.7", ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["1600", "3"], ",", 
     FractionBox["1600", "3"], ",", 
     FractionBox["1600", "3"], ",", 
     FractionBox["1600", "3"], ",", "800"}], "}"}]}], ";"}]], "Input",Expressi\
onUUID->"f13461eb-e0e0-4309-bb27-c42cd600a50d"],

Cell["The order of the coalitions is obtained by the functions", "Text",ExpressionUUID->"a15a4350-edaa-4c06-9928-9d2202a581f4"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Subsets", "[", "T2", "]"}]], "Input",ExpressionUUID->"0ba8d3b7-e91d-4e4b-8a01-94bbfcfd5e72"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", "1", "}"}], ",", 
   RowBox[{"{", "2", "}"}], ",", 
   RowBox[{"{", "3", "}"}], ",", 
   RowBox[{"{", "4", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "3", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "3", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3", ",", "4"}], "}"}]}], "}"}]], "Output",Exp\
ressionUUID->"627d7ba9-e6a8-41a2-bddb-5db0f23bbca3"]
}, Open  ]],

Cell[TextData[{
 "To define a game you need no more than the player set ",
 StyleBox["T2",
  FontSlant->"Italic"],
 " and the vector of the values of the game, that is, ",
 StyleBox["coalval",
  FontSlant->"Italic"],
 ". "
}], "Text",ExpressionUUID->"b56816ce-fffe-4599-8983-3ae26b8edad9"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Options", "[", "DefineGame", "]"}]], "Input",ExpressionUUID->"d1f0c668-8125-404d-a41c-b07599fc6774"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"RationalApproximate", "\[Rule]", "True"}], "}"}]], "Output",Express\
ionUUID->"e82f3fce-e48c-4c27-9f2d-85b92ad79e8b"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame8", ":=", 
   RowBox[{"(", 
    RowBox[{"DefineGame", "[", 
     RowBox[{"T2", ",", "coalval"}], "]"}], ")"}]}], ";"}]], "Input",Expressio\
nUUID->"b6aaf0dd-93f4-4187-8caa-d1d1ac635ef0"],

Cell["\<\
Let us first check whether some of them have an empty or non-empty  core.\
\>", "Text",ExpressionUUID->"b85a308f-05b8-411c-b603-d18255c042c5"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame5", "]"}]], "Input",ExpressionUUID->"34663e54-f21f-4d1c-96d4-9beebf2c287d"],

Cell[BoxData["True"], "Output",ExpressionUUID->"2e8a7186-9e34-4d4d-9627-82fa2bcaadcc"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame6", "]"}]], "Input",ExpressionUUID->"81c3dc6d-a8ee-4a27-a4b5-bc60f2680598"],

Cell[BoxData["True"], "Output",ExpressionUUID->"d11ffac5-e02f-4518-b0a4-1917e4b45c8e"]
}, Open  ]],

Cell[TextData[{
 "Let ",
 StyleBox["k \[Epsilon] ",
  FontSlant->"Italic"],
 StyleBox["\[DoubleStruckCapitalN]",
  FontVariations->{"CompatibilityType"->0}],
 ". Note that an  ",
 StyleBox["n",
  FontSlant->"Italic"],
 "-person  game ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["v", "k"], TraditionalForm]],ExpressionUUID->
  "83e8b830-5510-414c-98b5-9501be30106c"],
 " is called the ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-cover  of the game ",
 StyleBox["v",
  FontSlant->"Italic"],
 " if the original game ",
 StyleBox["v",
  FontSlant->"Italic"],
 StyleBox[" satisfies the condition",
  FontVariations->{"CompatibilityType"->0}]
}], "Text",
 CellTags->"1988",ExpressionUUID->"ff740967-b815-45db-9a3f-33b03d545437"],

Cell[TextData[{
 StyleBox["(1)   ",
  FontVariations->{"CompatibilityType"->0}],
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{
        SuperscriptBox["g", "v"], "(", "S", ")"}], " ", "\[GreaterEqual]", 
       " ", 
       RowBox[{
        RowBox[{
         SuperscriptBox["g", "v"], "(", "N", ")"}], "     ", "for", " ", 
        "all", " ", "S"}]}], " ", "\[Subset]", " ", 
      RowBox[{"N", " ", "with"}]}], " ", "|", "S", "|", "  ", 
     RowBox[{"\[GreaterEqual]", " ", "k"}]}], ","}], TraditionalForm]],
  ExpressionUUID->"d842ef2f-dd3c-4521-8754-5bd4e13bdfae"],
 " (cf. ",
 ButtonBox["Driessen",
  BaseStyle->"Hyperlink",
  ButtonData:>"Theo Driessen"],
 " 1988, pp. 173)"
}], "Text",
 TextAlignment->Center,
 CellTags->"1988",ExpressionUUID->"9e9a8098-160d-4818-ae4b-1a1462d2f086"],

Cell[TextData[{
 "where ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{
     SuperscriptBox["g", "v"], "(", "S", ")"}], " ", ":=", " ", 
    RowBox[{
     RowBox[{
      SubscriptBox["\[Sum]", 
       RowBox[{"j", " ", "\[Epsilon]", " ", "S"}]], " ", 
      SubsuperscriptBox["b", "j", "v"]}], " ", "-", " ", 
     RowBox[{"v", "(", "S", ")"}]}]}], TraditionalForm]],ExpressionUUID->
  "d7a5d32b-1bbc-466b-9d99-74922c47131e"],
 " and ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SubsuperscriptBox["b", "j", "v"], " ", "=", " ", 
    RowBox[{
     RowBox[{"v", "(", "N", ")"}], " ", "-", " ", 
     RowBox[{
      RowBox[{"v", "(", 
       RowBox[{"N", "\\", "i"}], ")"}], "."}]}]}], TraditionalForm]],
  ExpressionUUID->"faa53dab-8cb4-493f-8e44-9e5a81a66ac3"],
 "  ",
 StyleBox["A TU-game  ",
  FontVariations->{"CompatibilityType"->0}],
 Cell[BoxData[
  FormBox[
   SubscriptBox["v", "k"], TraditionalForm]],ExpressionUUID->
  "9dc606e7-4bea-4244-9bd3-7191befd9706"],
 " ",
 StyleBox["is defined as follows",
  FontVariations->{"CompatibilityType"->0}]
}], "Text",
 TextAlignment->Left,
 CellTags->"1988",ExpressionUUID->"e3e6ccf3-cb30-44a1-9fbb-742a43bc0834"],

Cell[TextData[{
 StyleBox["(2)  ",
  FontVariations->{"CompatibilityType"->0}],
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{
     SubscriptBox["v", "k"], "(", "S", ")"}], " ", ":=", " ", 
    RowBox[{"v", "(", "S", ")"}]}], TraditionalForm]],ExpressionUUID->
  "6d83ac53-8112-4a99-987e-4ba7ea6def85"],
 " if ",
 StyleBox[" ",
  FontVariations->{"CompatibilityType"->0}],
 "|S|  <",
 StyleBox[" k",
  FontSlant->"Italic"],
 StyleBox[" and ",
  FontVariations->{"CompatibilityType"->0}],
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{
     SubscriptBox["v", "k"], "(", " ", "S", ")"}], ":=", " ", 
    RowBox[{
     RowBox[{
      SubscriptBox["\[Sum]", 
       RowBox[{"j", " ", "\[Epsilon]", " ", "S"}]], " ", 
      SubsuperscriptBox["b", "j", "v"]}], " ", "-", " ", 
     RowBox[{
      SuperscriptBox["g", "v"], "(", "N", ")"}]}]}], TraditionalForm]],
  ExpressionUUID->"7e3e1690-b4f9-41d7-8418-546185abd1a9"],
 " if |S|  \[GreaterEqual] ",
 StyleBox["k",
  FontSlant->"Italic"],
 ".  "
}], "Text",
 TextAlignment->Center,
 CellTags->"1988",ExpressionUUID->"a1e010fc-732b-4c5b-af0f-3180d3bef8f0"],

Cell[TextData[{
 "A TU-game  ",
 StyleBox["v",
  FontSlant->"Italic"],
 " is called ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-convex if the ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-cover  of the game is convex, that is, the condition (1) is fulfilled and \
the TU-game ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["v", "k"], TraditionalForm]],ExpressionUUID->
  "6b582286-acae-49c3-ba20-d19f5c277418"],
 " is convex. The ",
 StyleBox["k-",
  FontSlant->"Italic"],
 StyleBox["cover of the game ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["v",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox[" can be verified by calling the function ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["Gap[]",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox[". The output of the function ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["Gap[]",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox[" is the value of ",
  FontVariations->{"CompatibilityType"->0}],
 Cell[BoxData[
  FormBox[
   RowBox[{
    SuperscriptBox["g", "v"], "(", "S", ")"}], TraditionalForm]],
  ExpressionUUID->"d6146c65-d704-462e-bc48-e8eee7c71fbf"],
 " for each coalition in the order set by the command ",
 StyleBox["Subsets[]",
  FontWeight->"Bold"],
 ". In the example given below the coalition size two starts at position 6 \
whereas coalition size 3 starts at position 12. "
}], "Text",
 TextJustification->1,
 CellTags->"1988",ExpressionUUID->"5c5d5a90-6d74-4ea7-9c91-7861afa1d568"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Gap", "[", "ExpGame5", "]"}]], "Input",ExpressionUUID->"948131e5-2873-458e-bea2-3f0dcd4c8abe"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "5", ",", "7", ",", "8", ",", "11", ",", "11", ",", "12", ",", 
   "13", ",", "11", ",", "12", ",", "12", ",", "11", ",", "11", ",", "11", 
   ",", "11", ",", "11"}], "}"}]], "Output",ExpressionUUID->"2a22f61d-32eb-\
4f6f-971c-91e5f60074e4"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Gap", "[", "ExpGame6", "]"}]], "Input",ExpressionUUID->"eb2d1382-7273-46ce-a57e-aa75082b9c89"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "2", ",", "2", ",", "2", ",", "2", ",", "4", ",", "4", ",", "4", 
   ",", "4", ",", "4", ",", "4", ",", "3", ",", "3", ",", "3", ",", "3", ",", 
   "3"}], "}"}]], "Output",ExpressionUUID->"d3f26423-69b8-482c-9040-\
e9f39ccf1d76"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Gap", "[", "ExpGame7", "]"}]], "Input",ExpressionUUID->"9872bbc5-4b59-4b31-8151-77c8062c3241"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "3", ",", "3", ",", "3", ",", "3", ",", "3", ",", "3", ",", "3"}],
   "}"}]], "Output",ExpressionUUID->"6286c042-d96c-4933-8125-52e38a02e163"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Gap", "[", "ExpGame8", "]"}]], "Input",ExpressionUUID->"ad116a61-9dd8-4fb9-a22d-80f8d7829b8e"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", 
   FractionBox["7199", "30"], ",", 
   FractionBox["7199", "30"], ",", 
   FractionBox["7199", "30"], ",", 
   FractionBox["7199", "30"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"]}], "}"}]], "Output",ExpressionUUID->"48610cb7-25dd-\
4083-980b-151f583fa349"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Gap", "[", "ExpGame8", "]"}], "//", "N"}]], "Input",ExpressionUUID-\
>"bf8ce512-f294-4602-8085-f666c1eae810"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.`", ",", "239.96666666666667`", ",", "239.96666666666667`", ",", 
   "239.96666666666667`", ",", "239.96666666666667`", ",", 
   "266.6666666666667`", ",", "266.6666666666667`", ",", "266.6666666666667`",
    ",", "266.6666666666667`", ",", "266.6666666666667`", ",", 
   "266.6666666666667`", ",", "266.6666666666667`", ",", "266.6666666666667`",
    ",", "266.6666666666667`", ",", "266.6666666666667`", ",", 
   "266.6666666666667`"}], "}"}]], "Output",ExpressionUUID->"c22e5991-e039-\
43e2-a8f6-84bc9cdab70d"]
}, Open  ]],

Cell[TextData[{
 "Game \"",
 StyleBox["ExpGame7",
  FontSlant->"Italic"],
 "\" satisfies the condition of a 1-cover, whereas for the other games the \
condition of a 2-cover  is satisfied. In the next step, we have to verify \
that the associated ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["v", "k"], TraditionalForm]],ExpressionUUID->
  "ec7da286-3102-4f4f-a310-63c666d95239"],
 " game is convex. By doing so, we can derive the associated ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["v", "k"], TraditionalForm]],ExpressionUUID->
  "aea6c2e6-01c5-42e6-b67f-fdadab8a9144"],
 " game by using the function ",
 StyleBox["kCover[]",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox[" and by setting ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["k=2",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox[". ",
  FontVariations->{"CompatibilityType"->0}],
 "First, we have to generate the coalitional values of the ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["v", "2"], TraditionalForm]],ExpressionUUID->
  "d9f7e71d-b7e2-4249-9a17-fcf3d1cc30f9"],
 " games, this is done by calling"
}], "Text",
 TextJustification->1,ExpressionUUID->"92f78098-990a-42ef-a015-20a81e4c5dfb"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kval1", "=", 
  RowBox[{"kCover", "[", 
   RowBox[{"ExpGame5", ",", "2"}], "]"}]}]], "Input",ExpressionUUID->\
"4a285501-9137-4aad-a95a-df360c2fdbc3"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", ",", "2", ",", "5", 
   ",", "4", ",", "7", ",", "8", ",", "9", ",", "12", ",", "13", ",", "15", 
   ",", "20"}], "}"}]], "Output",ExpressionUUID->"425e1618-a80e-49cc-a31b-\
8038c806f567"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kval2", "=", 
  RowBox[{"kCover", "[", 
   RowBox[{"ExpGame6", ",", "2"}], "]"}]}]], "Input",ExpressionUUID->\
"47973022-f1ff-462f-a9de-da3951169f2b"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", ",", "1", ",", "1", 
   ",", "1", ",", "1", ",", "1", ",", "3", ",", "3", ",", "3", ",", "3", ",", 
   "5"}], "}"}]], "Output",ExpressionUUID->"143dd918-a7ab-44f3-bb87-\
3535bad74c57"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kval3", "=", 
  RowBox[{"kCover", "[", 
   RowBox[{"ExpGame7", ",", "1"}], "]"}]}]], "Input",ExpressionUUID->\
"241b6454-074a-40c0-80f2-fbb03e3997c2"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "0", ",", "6", ",", "6", ",", "9", ",", "9", ",", "15", ",", 
   "18"}], "}"}]], "Output",ExpressionUUID->"60283aa1-ce66-4272-81ed-\
5483e60b5746"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kval4", "=", 
  RowBox[{"kCover", "[", 
   RowBox[{"ExpGame8", ",", "2"}], "]"}]}]], "Input",ExpressionUUID->\
"64c50362-6578-4e63-b336-bc49d218e16e"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", 
   FractionBox["267", "10"], ",", 
   FractionBox["267", "10"], ",", 
   FractionBox["267", "10"], ",", 
   FractionBox["267", "10"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["800", "3"], ",", 
   FractionBox["1600", "3"], ",", 
   FractionBox["1600", "3"], ",", 
   FractionBox["1600", "3"], ",", 
   FractionBox["1600", "3"], ",", "800"}], "}"}]], "Output",ExpressionUUID->\
"a35e1b90-ce5a-4ca1-a960-6eed74844547"]
}, Open  ]],

Cell[TextData[{
 "In the second step we define new TU-games  ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["v", "2"], TraditionalForm]],ExpressionUUID->
  "14ccd6bf-6c88-4d91-904c-b4b83f657b6e"],
 " for \"",
 StyleBox["ExpGame5",
  FontSlant->"Italic"],
 ", ",
 StyleBox["ExpGame6, ExpGame7",
  FontSlant->"Italic"],
 "\" and \"",
 StyleBox["ExpGame8",
  FontSlant->"Italic"],
 "\" respectively, by the function ",
 StyleBox["DefineGame[] ",
  FontWeight->"Bold"],
 "and by using the associated vectors of coalitional values which we have \
determined in the previous step. These games are defined simply by typing"
}], "Text",
 TextJustification->1,ExpressionUUID->"0b7d4397-ce6a-4768-84d9-b7b944810604"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Gamevk1", ":=", 
   RowBox[{"(", 
    RowBox[{"DefineGame", "[", 
     RowBox[{"T2", ",", "kval1"}], "]"}], ")"}]}], ";"}]], "Input",ExpressionU\
UID->"c0930b21-2f7a-4ff1-b4b3-623a242211d8"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Gamevk2", ":=", 
   RowBox[{"(", 
    RowBox[{"DefineGame", "[", 
     RowBox[{"T2", ",", "kval2"}], "]"}], ")"}]}], ";"}]], "Input",ExpressionU\
UID->"0546faed-94e5-4757-b75b-4ec2de82ac5e"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Gamevk3", ":=", 
   RowBox[{"(", 
    RowBox[{"DefineGame", "[", 
     RowBox[{"T4", ",", "kval3"}], "]"}], ")"}]}], ";"}]], "Input",ExpressionU\
UID->"581573eb-c6ce-4dd1-9001-3f80129de58d"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Gamevk4", ":=", 
   RowBox[{"(", 
    RowBox[{"DefineGame", "[", 
     RowBox[{"T2", ",", "kval4"}], "]"}], ")"}]}], ";"}]], "Input",ExpressionU\
UID->"685a5972-f741-44d6-be4f-ce0af78820f8"],

Cell[TextData[{
 "We have already found out that the original games satisfy condition (1), \
hence, it remains to check whether the corresponding games ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["v", "k"], TraditionalForm]],ExpressionUUID->
  "f3e0c9eb-63e5-4d55-ab71-3f05e3570b35"],
 " are convex to conclude that the games under considerations are 2-convex. \
To this end, we call the function ",
 StyleBox["ConvexQ[].",
  FontWeight->"Bold"]
}], "Text",
 TextJustification->1,ExpressionUUID->"b1c42647-85d1-4ff3-afcb-bce6c2d6bc6e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "Gamevk1", "]"}]], "Input",ExpressionUUID->"21629c35-c58f-4a27-bf26-77b10aba660b"],

Cell[BoxData["True"], "Output",ExpressionUUID->"7977475d-8b27-450a-8b49-d5d5b297564e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame5", "]"}]], "Input",ExpressionUUID->"af196d46-b796-42f6-a942-c7ffdda28d59"],

Cell[BoxData["False"], "Output",ExpressionUUID->"19c9838d-52f9-4355-8416-f6e651da7b32"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "Gamevk2", "]"}]], "Input",ExpressionUUID->"c7e0fdbe-fe87-46d4-8391-524366a743ab"],

Cell[BoxData["True"], "Output",ExpressionUUID->"56130328-1ebc-4afd-9cd9-ac3d9102f6db"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame6", "]"}]], "Input",ExpressionUUID->"8db45f20-5699-4b6e-ab0b-e5367f769486"],

Cell[BoxData["False"], "Output",ExpressionUUID->"86f18ecb-86a3-4e06-ae3b-4aea2360f595"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "Gamevk3", "]"}]], "Input",ExpressionUUID->"4695ff47-10de-45d0-aebc-39867ca13a6c"],

Cell[BoxData["True"], "Output",ExpressionUUID->"a9834ca0-a04a-4825-820b-370211200130"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame7", "]"}]], "Input",ExpressionUUID->"54667662-61db-4238-960e-a97fc309d42a"],

Cell[BoxData["True"], "Output",ExpressionUUID->"05ff6411-6398-4f2a-abc6-251b90d3fef6"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "Gamevk4", "]"}]], "Input",ExpressionUUID->"6183c227-c719-415b-b0e2-83b7d9cea0af"],

Cell[BoxData["True"], "Output",ExpressionUUID->"0f6a7733-dbab-4311-ad52-1ce73a81a746"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame8", "]"}]], "Input",ExpressionUUID->"c10892c8-1510-4a54-8cc9-d3ae25ebc42a"],

Cell[BoxData["True"], "Output",ExpressionUUID->"78a3f40e-8e0c-4eda-9685-89490a3c688f"]
}, Open  ]],

Cell[TextData[{
 "Since the condition (1) and the convexity condition are fulfilled, all \
games under consideration are ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-convex.  Exemplary, we demonstrate that the game \"",
 StyleBox["ExpGame5",
  FontSlant->"Italic"],
 "\" is not 1-convex. "
}], "Text",
 TextJustification->1,ExpressionUUID->"54f9df15-c3ae-4a73-b457-a510faf68a78"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kval5", "=", 
  RowBox[{"kCover", "[", 
   RowBox[{"ExpGame5", ",", "1"}], "]"}]}]], "Input",ExpressionUUID->\
"3ac77d9b-29bf-48df-8fba-ac44d48bb533"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", 
   RowBox[{"-", "6"}], ",", 
   RowBox[{"-", "4"}], ",", 
   RowBox[{"-", "3"}], ",", "0", ",", "1", ",", "2", ",", "5", ",", "4", ",", 
   "7", ",", "8", ",", "9", ",", "12", ",", "13", ",", "15", ",", "20"}], 
  "}"}]], "Output",ExpressionUUID->"6336d5f0-748e-4076-be05-0a8bdc464d4c"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"Gamevk5", ":=", 
   RowBox[{"(", 
    RowBox[{"DefineGame", "[", 
     RowBox[{"T2", ",", "kval5"}], "]"}], ")"}]}], ";"}]], "Input",ExpressionU\
UID->"943fecbe-ad72-49fc-94ce-76416a20dede"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame5", "]"}]], "Input",ExpressionUUID->"0530386e-b422-4b8c-b96d-2649ed9da027"],

Cell[BoxData["False"], "Output",ExpressionUUID->"068e756f-7d3d-4238-ab11-d189067596b2"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "Gamevk3", "]"}]], "Input",ExpressionUUID->"9a1cdef8-9324-4720-8255-88e32e62dcfb"],

Cell[BoxData["True"], "Output",ExpressionUUID->"b1066d57-e6d5-4f95-8885-d8443f7f833c"]
}, Open  ]],

Cell[TextData[{
 "The convexity condition holds, but recall that the ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-cover  of the game \"",
 StyleBox["ExpGame5",
  FontSlant->"Italic"],
 "\" is not an 1-cover,  it is just a 2-cover."
}], "Text",ExpressionUUID->"27f5e757-3d61-4f2a-9685-29db9109e75d"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Gap", "[", "ExpGame5", "]"}]], "Input",ExpressionUUID->"be802cda-7d49-48d7-99aa-b59db3eab6a0"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "5", ",", "7", ",", "8", ",", "11", ",", "11", ",", "12", ",", 
   "13", ",", "11", ",", "12", ",", "12", ",", "11", ",", "11", ",", "11", 
   ",", "11", ",", "11"}], "}"}]], "Output",ExpressionUUID->"8ae9162e-6f56-\
41d9-936d-6b63ad9bfab3"]
}, Open  ]],

Cell[TextData[{
 "In this case condition (1) does not hold and therefore the game \"",
 StyleBox["ExpGame5",
  FontSlant->"Italic"],
 "\" is not 1-convex."
}], "Text",ExpressionUUID->"b4aba363-ba14-4f34-9cda-586c7d4c7e32"],

Cell["\<\
Furthermore, we can calculate the upper or utopia payoff that represents an \
upper bound of the core by \
\>", "Text",ExpressionUUID->"7cebbef9-3031-413b-8174-e92be52a2825"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"UtopiaVector", "[", "ExpGame5", "]"}]], "Input",ExpressionUUID->"6ef35c4a-449e-4b56-8518-56f5911b43db"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "7", ",", "8", ",", "11"}], "}"}]], "Output",ExpressionUUI\
D->"f3e37bec-c460-4ba5-aa65-1cb07c54380f"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"UtopiaVector", "[", "ExpGame6", "]"}]], "Input",ExpressionUUID->"ad9c3e34-71fe-4b6e-8170-29cd31b21feb"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2", ",", "2", ",", "2", ",", "2"}], "}"}]], "Output",ExpressionUUID\
->"745672a6-6a05-488b-be2b-cd9524c96c7a"]
}, Open  ]],

Cell["\<\
A lower bound of the core is the so-called  disagreement vector and it can be \
computed by calling \
\>", "Text",ExpressionUUID->"4ab218b8-5b2c-48c7-b010-224cb8e727b7"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Disagreement", "[", "ExpGame5", "]"}]], "Input",ExpressionUUID->"7645dcdb-a9be-42de-aba6-90e7f03958d6"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]], "Output",ExpressionUUID\
->"319afc98-2b4d-40b6-8f6f-7f7b7aadc326"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Disagreement", "[", "ExpGame6", "]"}]], "Input",ExpressionUUID->"07c11f2f-6f96-49f0-86b8-515d7f8ab9ba"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]], "Output",ExpressionUUID\
->"460c4528-0257-496e-ab11-03057c446a72"]
}, Open  ]],

Cell[TextData[{
 "Since the tau-value  can be regarded as some fair compromise between the \
utopia and the disagreement vector,",
 StyleBox[" we are now in the position to compute the tau-value  of the \
previous games. ",
  FontVariations->{"CompatibilityType"->0}]
}], "Text",
 TextJustification->1,ExpressionUUID->"88246b08-7367-46eb-8f0c-b2bd824bcb0e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"tau1", "=", 
  RowBox[{"TauValue", "[", "ExpGame5", "]"}]}]], "Input",ExpressionUUID->\
"b9c51d4f-e792-4b73-8a17-f98bf37c3d78"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["100", "31"], ",", 
   FractionBox["140", "31"], ",", 
   FractionBox["160", "31"], ",", 
   FractionBox["220", "31"]}], "}"}]], "Output",ExpressionUUID->"b2144298-\
fcd4-4322-8fcd-75aeba5a19cb"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"tau2", "=", 
  RowBox[{"TauValue", "[", "ExpGame6", "]"}]}]], "Input",ExpressionUUID->\
"a357fbba-924c-4b45-b509-688af247d355"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["5", "4"], ",", 
   FractionBox["5", "4"], ",", 
   FractionBox["5", "4"], ",", 
   FractionBox["5", "4"]}], "}"}]], "Output",ExpressionUUID->"e5899fcc-33bb-\
4032-b724-6c8174ada061"]
}, Open  ]],

Cell[TextData[{
 "In the next step, we want to verify if the computed tau-values  are \
contained in the corresponding cores of the game \"",
 StyleBox["ExpGame5",
  FontSlant->"Italic"],
 "\" and \"",
 StyleBox["ExpGame6",
  FontSlant->"Italic"],
 "\", respectively.  For this purpose we us call the command ",
 StyleBox["InCoreQ[]",
  FontWeight->"Bold"],
 " provided by the package ",
 StyleBox["CooperativeGames. ",
  FontSlant->"Italic"],
 "The command requires as an input one imputation and the ",
 StyleBox["game_name.",
  FontSlant->"Italic"]
}], "Text",
 TextJustification->1,ExpressionUUID->"5f356fa6-04c7-40d1-a396-ef0f6b928536"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"InCoreQ", "[", 
  RowBox[{"tau1", ",", "ExpGame5"}], "]"}]], "Input",ExpressionUUID->\
"09aae02d-03b3-47fb-9e26-57d62c059782"],

Cell[BoxData["True"], "Output",ExpressionUUID->"76a2d0d2-b994-404c-8495-daa7557de785"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"InCoreQ", "[", 
  RowBox[{"tau2", ",", "ExpGame6"}], "]"}]], "Input",ExpressionUUID->\
"27b3955d-09ab-4913-ba8b-19d152c7d32e"],

Cell[BoxData["True"], "Output",ExpressionUUID->"63b840ca-12d2-444a-a1a2-c0f64c4e9ca2"]
}, Open  ]],

Cell[TextData[{
 "It is well known that for convexity of an ",
 StyleBox["n",
  FontSlant->"Italic"],
 "-person  Tu-game  it is necessary and sufficient that the core of the game \
contains all ",
 StyleBox["n",
  FontSlant->"Italic"],
 "! marginal worth vectors. A similar result holds for ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-convex  games. For ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-convexity it is necessary and sufficient that all ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"n", "-", "k"}], ")"}], "!"}], ")"}], 
     RowBox[{"-", "1"}]], " ", 
    RowBox[{"n", "!"}]}], TraditionalForm]],ExpressionUUID->
  "74b62e9d-5cb6-4b01-b75c-d45476b6d2e0"],
 " adjusted marginal worth vectors are contained in the core of the game (cf. \
",
 ButtonBox["Driessen",
  BaseStyle->"Hyperlink",
  ButtonData:>"Theo Driessen"],
 " 1988). The adjusted marginal worth vectors of ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-convex  games can be evaluated with the function ",
 StyleBox["AdjustedWorthVectors[]",
  FontWeight->"Bold"],
 " . There is also a special function available to compute the adjusted worth \
vectors of 1-convex games. The function name in this case is ",
 StyleBox["AdjustedEffUpperVectors[]",
  FontWeight->"Bold"],
 ". Let us now calculate for the above games the adjusted marginal worth \
vectors. "
}], "Text",
 TextJustification->1,ExpressionUUID->"fe0545f0-ccd1-43a3-9a80-c6f131d3281f"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"v5", "=", 
  RowBox[{"AdjustedWorthVectors", "[", 
   RowBox[{"ExpGame5", ",", "2"}], "]"}]}]], "Input",ExpressionUUID->\
"74cea722-a56e-4dd5-bf66-f2f561a58625"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "1", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "1", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "2", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "8", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "2", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "8", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "7", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "7", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "4", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "8", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "4", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "0", ",", "8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "4", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "8", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "4", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "0", ",", "8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}]}], "}"}]], "Output",Exp\
ressionUUID->"b6d10d52-b002-4c9f-8064-08018e7a303d"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"u5", "=", 
  RowBox[{"v5", "//", "Union"}]}]], "Input",ExpressionUUID->"c61c1ad4-ac29-4449-97c6-6e514e6567df"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "1", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "2", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "8", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "7", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "4", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "8", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "4", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "0", ",", "8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}]}], "}"}]], "Output",Exp\
ressionUUID->"bef75ba7-848b-45ba-a23e-789d062b9ebe"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", "u5", "]"}]], "Input",ExpressionUUID->"c57cdb76-902b-4e19-8d75-6514c4c823d6"],

Cell[BoxData["10"], "Output",ExpressionUUID->"ba1903f6-618f-4248-8c28-d127052905ef"]
}, Open  ]],

Cell[TextData[{
 "As expected the number of marginal worth vectors does not exceed the \
threshold value of ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SuperscriptBox[
     RowBox[{"(", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"n", "-", "k"}], ")"}], "!"}], ")"}], 
     RowBox[{"-", "1"}]], " ", 
    RowBox[{"n", "!"}]}], TraditionalForm]],ExpressionUUID->
  "73cf3035-d529-44fb-9665-b50bbd4e8920"],
 " vertices. For 2-convex  games the maximal number of marginal worth vectors \
is 12. All adjusted marginal worth vectors must be contained in the core. We \
check this by"
}], "Text",
 TextJustification->1,ExpressionUUID->"7c4f3bdc-b1a5-4f29-abf8-23b7cf6a51a2"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreElementsQ", "[", 
  RowBox[{"ExpGame5", ",", "u5"}], "]"}]], "Input",ExpressionUUID->"1440ca94-\
9b45-46fc-8382-6a1613a19016"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True"}], "}"}]], "Output",Expr\
essionUUID->"204abdfa-0495-438b-bd42-905e9937eec4"]
}, Open  ]],

Cell[TextData[{
 "As well as for the class of convex games the class of ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-convex  games can be characterized by the vertices of the core, it is \
necessary and sufficient for the ",
 StyleBox["k",
  FontSlant->"Italic"],
 "-convexity  property that the vertices of the core coincide exactly with \
the adjusted marginal worth vectors. We are able to check on this property by \
using the following steps: first, we compute the vertices of the core. In a \
second step we find out the imputations that are contained in the core and \
examine if the imputations we have selected are really core elements. Then we \
compute the adjusted marginal worth vectors and compare the result with our \
vertex result. To compute core vertices, we can perform this task with the \
command ",
 StyleBox["VerticesCore[]",
  FontWeight->"Bold"],
 ". The command returns two output values, the vertices and a list of \
\"active-variable\" sets, indicating which inequalities are satisfied with \
equalities at each vertex  (cf. ",
 StyleBox["VertexEnum",
  FontSlant->"Italic"],
 ").  In our example below, the symbol ",
 StyleBox["cvert5",
  FontSlant->"Italic"],
 " captures the informations associated with the vertices and the symbol ",
 StyleBox["nonvert5",
  FontSlant->"Italic"],
 " grabs all informations of the \"active -variable\" set. "
}], "Text",
 TextJustification->1,ExpressionUUID->"7a0744c4-fb95-4e53-90a4-e26c2de7d8a0"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"cvert5", ",", "nonvert5"}], "}"}], "=", 
  RowBox[{"VerticesCore", "[", "ExpGame5", "]"}]}]], "Input",ExpressionUUID->\
"b05b5c16-f211-485e-81a0-f963e399d94f"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"5", ",", "7", ",", "0", ",", "8"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "7", ",", "0", ",", "11"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"5", ",", "4", ",", "0", ",", "11"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "7", ",", "8", ",", "5"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "7", ",", "2", ",", "11"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "1", ",", "8", ",", "11"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"5", ",", "0", ",", "8", ",", "7"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"5", ",", "0", ",", "4", ",", "11"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "0", ",", "8", ",", "11"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"20", ",", "18", ",", "7", ",", "17", ",", "3", ",", "19"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"20", ",", "15", ",", "7", ",", "17", ",", "3", ",", "19"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
      "20", ",", "18", ",", "7", ",", "15", ",", "3", ",", "19", ",", "12"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"16", ",", "20", ",", "5", ",", "17", ",", "19", ",", "1"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"15", ",", "20", ",", "5", ",", "17", ",", "19", ",", "1"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
      "16", ",", "20", ",", "5", ",", "15", ",", "19", ",", "9", ",", "1"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"16", ",", "18", ",", "6", ",", "20", ",", "19", ",", "2"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
      "15", ",", "18", ",", "6", ",", "20", ",", "19", ",", "2", ",", "12"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
      "16", ",", "15", ",", "6", ",", "20", ",", "19", ",", "2", ",", "9"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
      "16", ",", "18", ",", "20", ",", "17", ",", "8", ",", "4", ",", "19"}], 
      "}"}]}], "}"}]}], "}"}]], "Output",ExpressionUUID->"2ef6e887-491d-4adb-\
8b8e-2a0c7f0d0974"]
}, Open  ]],

Cell[TextData[{
 "The package provides two different functions to check whether a list of \
imputations is contained in the core. In addition to the function ",
 StyleBox["CoreElementsQ[]",
  FontWeight->"Bold"],
 StyleBox[" which we have already introduced above and that is based on the \
function ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["InCoreQ[]",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox[" by ",
  FontVariations->{"CompatibilityType"->0}],
 ButtonBox["Carter",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Carter"],
 ButtonBox[",",
  BaseStyle->"Hyperlink",
  ButtonData:>"Hal Varian"],
 StyleBox[" we provide a second function that is called ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["BelongToCoreQ[]",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox[" which is based on the property that an imputation ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["x",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox[" belongs to the core ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["C(v) ",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["iff ",
  FontVariations->{"CompatibilityType"->0}]
}], "Text",
 TextJustification->1,ExpressionUUID->"cda76e94-0b3f-4358-a37b-c98c2917a428"],

Cell[TextData[{
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{"x", "(", "S", ")"}], "=", 
    RowBox[{
     RowBox[{
      SubscriptBox["\[Sum]", 
       RowBox[{"i", " ", "\[Epsilon]", " ", "S"}]], " ", 
      SubscriptBox["x", "i"]}], "  ", "\[LessEqual]", " ", 
     RowBox[{
      RowBox[{"v", "(", "N", ")"}], " ", "-", " ", 
      RowBox[{"v", "(", "S", ")"}]}]}]}], TraditionalForm]],ExpressionUUID->
  "2e1b0122-219e-44d3-9cb1-9567c161dea5"],
 " for all",
 StyleBox[" S \[Subset] N",
  FontSlant->"Italic"],
 ".  "
}], "Text",
 TextAlignment->Center,
 TextJustification->1,ExpressionUUID->"b3c671b0-21cf-45da-abb6-2dc95ea296dc"],

Cell[TextData[{
 "We demonstrate how the function ",
 StyleBox["BelongToCoreQ[]",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 " works in comparison to the function ",
 StyleBox["CoreElementsQ[]",
  FontWeight->"Bold"],
 " before we proceed on our problem. The difference between the function is \
discussed in more detail in ",
 ButtonBox["Section 5",
  BaseStyle->"Hyperlink",
  ButtonData:>"Unix Functions"],
 "."
}], "Text",
 TextJustification->1,ExpressionUUID->"271141e4-6872-453a-bce0-82e2ddae720c"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"cor5", "=", 
  RowBox[{"CoreElementsQ", "[", 
   RowBox[{"ExpGame5", ",", "cvert5"}], "]"}]}]], "Input",ExpressionUUID->\
"bad94547-37ff-46d3-abeb-44b200962bfd"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True"}], "}"}]], "Output",Expr\
essionUUID->"7aa2b5ec-7808-4529-9818-8627d580f4ca"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"blcor5", "=", 
  RowBox[{"BelongToCoreQ", "[", 
   RowBox[{"ExpGame5", ",", "cvert5"}], "]"}]}]], "Input",ExpressionUUID->\
"bf429dad-1235-401e-8bcd-c9cd5cd5de42"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True"}], "}"}]], "Output",Expr\
essionUUID->"0b6ccc4d-df3b-435f-92a2-5178439e15c1"]
}, Open  ]],

Cell["\<\
Since, some of imputations aren't contained in the core, we select the core \
imputations by using the command\
\>", "Text",ExpressionUUID->"a4d80f90-9c75-4ead-8dd7-f5e3c0fcf88e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"pos5", "=", 
  RowBox[{"Position", "[", 
   RowBox[{"cor5", ",", "True"}], "]"}]}]], "Input",ExpressionUUID->"c28f8450-\
38d9-4759-8da1-a5462536dfbd"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "1", "}"}], ",", 
   RowBox[{"{", "2", "}"}], ",", 
   RowBox[{"{", "3", "}"}], ",", 
   RowBox[{"{", "4", "}"}], ",", 
   RowBox[{"{", "5", "}"}], ",", 
   RowBox[{"{", "6", "}"}], ",", 
   RowBox[{"{", "7", "}"}], ",", 
   RowBox[{"{", "8", "}"}], ",", 
   RowBox[{"{", "9", "}"}], ",", 
   RowBox[{"{", "10", "}"}]}], "}"}]], "Output",ExpressionUUID->"2482aad7-\
55e9-4d42-b07f-7cce88e7de6b"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"bcs5", "=", 
  RowBox[{"Position", "[", 
   RowBox[{"blcor5", ",", "True"}], "]"}]}]], "Input",ExpressionUUID->\
"9f816998-e7e1-414d-af97-e26318713fc3"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "1", "}"}], ",", 
   RowBox[{"{", "2", "}"}], ",", 
   RowBox[{"{", "3", "}"}], ",", 
   RowBox[{"{", "4", "}"}], ",", 
   RowBox[{"{", "5", "}"}], ",", 
   RowBox[{"{", "6", "}"}], ",", 
   RowBox[{"{", "7", "}"}], ",", 
   RowBox[{"{", "8", "}"}], ",", 
   RowBox[{"{", "9", "}"}], ",", 
   RowBox[{"{", "10", "}"}]}], "}"}]], "Output",ExpressionUUID->"9eb9a91a-\
9107-476a-8b1b-7479e95031b7"]
}, Open  ]],

Cell[TextData[{
 "We got with the command ",
 StyleBox["Position[]",
  FontWeight->"Bold"],
 " the exact location of the core elements, we can use this information by \
extracting all core imputations typing "
}], "Text",ExpressionUUID->"1a25bc79-494f-441b-8f43-950d64f80acf"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ext5", "=", 
  RowBox[{"Extract", "[", 
   RowBox[{"cvert5", ",", "pos5"}], "]"}]}]], "Input",ExpressionUUID->\
"8bf50086-b886-448c-8673-5d5e8ecde5b2"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "0", ",", "8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "7", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "4", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "8", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "2", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "1", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "8", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "4", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}]}], "}"}]], "Output",Exp\
ressionUUID->"60f6ebd9-373d-4575-8abe-a4e3536a25a1"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"bcext5", "=", 
  RowBox[{"Extract", "[", 
   RowBox[{"cvert5", ",", "bcs5"}], "]"}]}]], "Input",ExpressionUUID->\
"e8e77a7c-6207-499d-b67a-f050f2fa43eb"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "0", ",", "8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "7", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "4", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "8", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "2", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "1", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "8", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "4", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}]}], "}"}]], "Output",Exp\
ressionUUID->"d54f8750-5118-4e11-ab81-37bb4d3288c2"]
}, Open  ]],

Cell["\<\
Let us verify that all the elements we have selected from our initial list \
are contained in the core.\
\>", "Text",ExpressionUUID->"ccb2dc0f-624b-4fae-a24f-58dbad3f051e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreElementsQ", "[", 
  RowBox[{"ExpGame5", ",", "ext5"}], "]"}]], "Input",ExpressionUUID->\
"79ad2e10-ec23-44b8-afbe-a90618e359da"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True"}], "}"}]], "Output",Expr\
essionUUID->"9a9418bf-ef14-42d4-8926-42498b9bb6fe"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BelongToCoreQ", "[", 
  RowBox[{"ExpGame5", ",", "bcext5"}], "]"}]], "Input",ExpressionUUID->\
"cca6e8c4-be7a-46e5-a429-1eda4de80151"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True"}], "}"}]], "Output",Expr\
essionUUID->"3dea6df3-b27c-43e8-949b-e9a538f67002"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", "ext5", "]"}]], "Input",ExpressionUUID->"20b8da92-34be-434b-acc4-ee5cbb428e47"],

Cell[BoxData["10"], "Output",ExpressionUUID->"b2cd0cbd-a696-41f1-b1fd-db98eb9e6aa2"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"to5", "=", 
  RowBox[{"Union", "[", 
   RowBox[{"ext5", ",", "u5"}], "]"}]}]], "Input",ExpressionUUID->"0c5f2203-\
708d-450c-bcd2-eda63107268b"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "1", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "2", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "7", ",", "8", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0", ",", "8", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "7", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "4", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "0", ",", "8", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "4", ",", "0", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "0", ",", "8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "7", ",", "8", ",", "0"}], "}"}]}], "}"}]], "Output",Exp\
ressionUUID->"68e9f3ac-9a58-4fdd-9a9b-5d111de9124a"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", "to5", "]"}]], "Input",ExpressionUUID->"fee435fe-0144-49b2-8fea-73f98bc582e3"],

Cell[BoxData["10"], "Output",ExpressionUUID->"bceb20ea-8aca-40c1-9244-543e08c3eab6"]
}, Open  ]],

Cell[TextData[{
 "To get more evidence that the function ",
 StyleBox["AdjustedWorthVectors[]",
  FontWeight->"Bold"],
 " computes the exact values. Let us consider the game \"",
 StyleBox["ExpGame8",
  FontSlant->"Italic"],
 "\"."
}], "Text",ExpressionUUID->"3da2b9cc-9fbf-4289-8712-b38a19c35c96"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"v8", "=", 
  RowBox[{"AdjustedWorthVectors", "[", 
   RowBox[{"ExpGame8", ",", "2"}], "]"}]}]], "Input",ExpressionUUID->\
"eeee7182-71d5-4ea9-8302-c3c0a3dbeafa"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"f879d6da-818f-45b6-b183-a46c7238f598"]
}, Open  ]],

Cell["Removing all duplicated results we obtain", "Text",ExpressionUUID->"ee50d668-7609-49e8-ae4f-d7843c4c0e75"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"u8", "=", 
  RowBox[{"v8", "//", "Union"}]}]], "Input",ExpressionUUID->"a84bc19e-92c1-49a2-b660-e82427254cc1"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"a35b4c7b-459a-4634-99aa-7ba43d60b4c0"]
}, Open  ]],

Cell["\<\
We obtain the expected number of adjusted marginal worth vectors, since\
\>", "Text",ExpressionUUID->"f6725966-89b4-4f10-a6b8-f1bec8b56d7a"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", "u8", "]"}]], "Input",ExpressionUUID->"b944f4cb-37cc-4a2c-984e-80162edd8f3d"],

Cell[BoxData["12"], "Output",ExpressionUUID->"392e1c81-568d-48a5-97cc-87d202f6b212"]
}, Open  ]],

Cell["\<\
For an intermediate step, let us verify that the computed vectors are all \
efficient. This could be done by\
\>", "Text",ExpressionUUID->"51bb5fec-3c5f-4c50-bb0d-3a38588ef0cf"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"Apply", "[", 
    RowBox[{"Plus", ",", "#"}], "]"}], " ", "&"}], " ", "/@", " ", 
  "u8"}]], "Input",ExpressionUUID->"98ac8e73-cf0b-4019-8bb8-9bef4a0724ba"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "800", ",", "800", ",", "800", ",", "800", ",", "800", ",", "800", ",", 
   "800", ",", "800", ",", "800", ",", "800", ",", "800", ",", "800"}], 
  "}"}]], "Output",ExpressionUUID->"1c35ea33-8d7e-46df-8033-6aba0ba55749"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"cvert8", ",", "nonvert8"}], "}"}], "=", 
  RowBox[{"VerticesCore", "[", "ExpGame8", "]"}]}]], "Input",ExpressionUUID->\
"dde95ce3-059d-4195-b87e-c4ae10cdb0a8"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       FractionBox["7199", "30"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["267", "10"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["267", "10"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["7199", "30"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["267", "10"], ",", 
       FractionBox["7199", "30"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["800", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["7199", "30"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["267", "10"], ",", 
       FractionBox["800", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["267", "10"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["7199", "30"], ",", 
       FractionBox["800", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["7199", "30"], ",", 
       FractionBox["267", "10"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["800", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["800", "3"], ",", 
       FractionBox["7199", "30"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["267", "10"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["800", "3"], ",", 
       FractionBox["267", "10"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["7199", "30"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["800", "3"], ",", 
       FractionBox["7199", "30"], ",", 
       FractionBox["267", "10"], ",", 
       FractionBox["800", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["800", "3"], ",", 
       FractionBox["267", "10"], ",", 
       FractionBox["7199", "30"], ",", 
       FractionBox["800", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["800", "3"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["267", "10"], ",", 
       FractionBox["7199", "30"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["800", "3"], ",", 
       FractionBox["800", "3"], ",", 
       FractionBox["7199", "30"], ",", 
       FractionBox["267", "10"]}], "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"16", ",", "20", ",", "8", ",", "17", ",", "19", ",", "11"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"16", ",", "20", ",", "5", ",", "17", ",", "19", ",", "11"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"15", ",", "20", ",", "5", ",", "16", ",", "19", ",", "9"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"15", ",", "20", ",", "7", ",", "17", ",", "10", ",", "19"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"15", ",", "20", ",", "5", ",", "17", ",", "10", ",", "19"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"15", ",", "16", ",", "6", ",", "20", ",", "19", ",", "9"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"16", ",", "18", ",", "8", ",", "20", ",", "13", ",", "19"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"16", ",", "18", ",", "6", ",", "20", ",", "13", ",", "19"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"15", ",", "18", ",", "7", ",", "20", ",", "19", ",", "12"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"15", ",", "18", ",", "6", ",", "20", ",", "19", ",", "12"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"20", ",", "18", ",", "7", ",", "17", ",", "14", ",", "19"}], 
      "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"20", ",", "18", ",", "8", ",", "17", ",", "14", ",", "19"}], 
      "}"}]}], "}"}]}], "}"}]], "Output",ExpressionUUID->"e85b0ff1-ab5b-4dd0-b4d9-6941e414f66f"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", "cvert8", "]"}]], "Input",ExpressionUUID->"88056c98-b9a0-4916-866a-cbc71b90dd6c"],

Cell[BoxData["12"], "Output",ExpressionUUID->"11564c8d-86ec-4806-8099-a0bc7633b1b3"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreElementsQ", "[", 
  RowBox[{"ExpGame8", ",", "cvert8"}], "]"}]], "Input",ExpressionUUID->\
"c313dd35-d75e-49e5-b086-4388fbc9dbf7"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", 
   "True"}], "}"}]], "Output",ExpressionUUID->"32fd73ab-7017-4640-8287-\
cd2fbadb128a"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BelongToCoreQ", "[", 
  RowBox[{"ExpGame8", ",", "cvert8"}], "]"}]], "Input",ExpressionUUID->\
"947b0e49-fe7d-43e3-8d8d-996501f172ce"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", 
   "True"}], "}"}]], "Output",ExpressionUUID->"83825637-f418-45cc-b5a1-\
72ee79733f44"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"to8", "=", 
  RowBox[{"Union", "[", 
   RowBox[{"cvert8", ",", "v8"}], "]"}]}]], "Input",ExpressionUUID->"a221db08-\
3bf5-42da-8c17-54230363d7dc"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"85aec3ef-0465-4e3f-9b68-f343e2dfb69c"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", "to8", "]"}]], "Input",ExpressionUUID->"62880333-4326-4917-8438-c21942dcf7dc"],

Cell[BoxData["12"], "Output",ExpressionUUID->"f903292c-0acc-44d5-84c4-7cf0db084595"]
}, Open  ]],

Cell[TextData[{
 "Do not try to use the function ",
 StyleBox["AdjustedEffUpperVectors[] ",
  FontWeight->"Bold"],
 StyleBox["for ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["k",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["-convex  games, with ",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["k",
  FontSlant->"Italic",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox["\[GreaterEqual] 2. In this case you will get wrong results.",
  FontVariations->{"CompatibilityType"->0}]
}], "Text",ExpressionUUID->"488252c3-e068-46c1-b64e-36600e7c72c9"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AdjustedEffUpperVectors", "[", "ExpGame8", "]"}]], "Input",Expressio\
nUUID->"4022adf2-5f6f-46e9-9408-e213c72a4d0c"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", "0", ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", "0", ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", "0"}], "}"}]}], "}"}]], "Output",Expression\
UUID->"1f9aaaf7-add9-4b02-8670-cfca57549c92"]
}, Open  ]],

Cell["\<\
You can just us this function simply to compute the adjusted marginal worth \
vectors for 1-convex  games as the next example will demonstrate it. \
\>", "Text",ExpressionUUID->"d2f742a4-060e-471d-a1d8-d37cb1e87ada"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AdjustedEffUpperVectors", "[", "ExpGame7", "]"}]], "Input",Expressio\
nUUID->"0ac5b3cb-2f5d-45e5-9da3-a89239a9ce02"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "9", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "6", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "9", ",", "6"}], "}"}]}], "}"}]], "Output",ExpressionUUI\
D->"3eed0f33-f4f1-47da-8c65-7f1f9a8e9da5"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"AdjustedWorthVectors", "[", 
   RowBox[{"ExpGame7", ",", "1"}], "]"}], "//", "Union"}]], "Input",Expression\
UUID->"275529d4-5534-47e9-8635-54fe52919c3e"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "9", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "6", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "9", ",", "6"}], "}"}]}], "}"}]], "Output",ExpressionUUI\
D->"b91f24e5-35df-41a2-b1c6-fb7168ff68c6"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"VerticesCore", "[", "ExpGame7", "]"}], "[", 
  RowBox[{"[", "1", "]"}], "]"}]], "Input",ExpressionUUID->"f8be4bf5-30a5-\
4741-b4e7-1daeb9ec2dd7"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "9", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "6", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "9", ",", "6"}], "}"}]}], "}"}]], "Output",ExpressionUUI\
D->"18071645-a140-4fd5-84af-33fc5b30210b"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["4.3 Kernel",
 BaseStyle->"Hyperlink",
 ButtonData:>"4.3."]], "Subsubsection",
 FontSize->16,
 CellTags->"Kernel",ExpressionUUID->"dfacf308-d438-4638-ac72-6c8715ee7e47"],

Cell[TextData[{
 "In this subsection we want to present some functions which will enable ",
 StyleBox["us",
  FontVariations->{"CompatibilityType"->0}],
 " to compute at least a kernel solution or in good cases the whole kernel of \
a game. The functions we will present in this subsection relying on the \
linear programming approach to determine outcomes that lie in the core (or \
strong epsilon core) as well as  in the kernel of the game, that is, outcomes \
that satisfy the bisection property.  Note, that for zero-monotonic  games \
the bisection property is necessary and sufficient that an imputation that \
belongs to the core (strong-epsilon core)  is also contained in the kernel of \
the game (cf. Th 3.7 ",
 ButtonBox["Maschler, Peleg and Shapley",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Maschler"],
 " (1979)). More informations about the algorithm can be found in ",
 ButtonBox["Meinhardt",
  BaseStyle->"Hyperlink",
  ButtonData:>"H. Meinhardt"],
 " (2004). To start off, let us first consider the command ",
 StyleBox["Kernel[game,opts]",
  FontWeight->"Bold"],
 " without an options to compute a kernel point of the game.  In the second \
case we make use of an optional parameter ",
 StyleBox["eps",
  FontWeight->"Bold"],
 " which is a critical value to generalize the bisection property to the \
strong epsilon-cores. You can omit the critical value ",
 StyleBox["eps",
  FontWeight->"Bold"],
 " in the command without harm, since the default value is set to zero. There \
are different functions available which determine the different types of \
critical values. One critical value can be calculated, for instance, by the \
function ",
 StyleBox["FirstCriticalVal[game]",
  FontWeight->"Bold"],
 ". This function and  all the rest of them will be discussed in the sequel \
of this subsection."
}], "Text",
 TextJustification->1,
 CellTags->"(2002b)",ExpressionUUID->"8fdfd491-8bd5-4840-9615-f8be3b740630"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ker1", "=", 
  RowBox[{"Kernel", "[", "ExpGame1", "]"}]}]], "Input",ExpressionUUID->\
"6b70918c-d13a-4956-9ad0-290f482f1837"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["45", "2"], ",", 
   FractionBox["45", "2"], ",", 
   FractionBox["45", "2"], ",", 
   FractionBox["45", "2"]}], "}"}]], "Output",ExpressionUUID->"d4b97e93-c707-\
4154-8006-ab6c65299436"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ker2", "=", 
  RowBox[{"Kernel", "[", "ExpGame2", "]"}]}]], "Input",ExpressionUUID->\
"0860bf55-1521-43b4-9b63-23e4b06435c2"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["45", "2"], ",", 
   FractionBox["45", "2"], ",", 
   FractionBox["45", "2"], ",", 
   FractionBox["45", "2"]}], "}"}]], "Output",ExpressionUUID->"7d6816d3-6f69-\
49f7-8cb5-8597361c1dfc"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ker3", "=", 
  RowBox[{"Kernel", "[", "ExpGame3", "]"}]}]], "Input",ExpressionUUID->\
"4c69231e-1dff-42f9-975c-57b034aede13"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}]], "Output",Expr\
essionUUID->"61fc2763-6019-418d-a47a-3d35cdf8019f"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ker4", "=", 
  RowBox[{"Kernel", "[", "ExpGame4", "]"}]}]], "Input",ExpressionUUID->\
"6fd893c3-92c9-4e22-81ec-13af1bac84c0"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["7", "32"], ",", 
   FractionBox["7", "32"], ",", 
   FractionBox["9", "32"], ",", 
   FractionBox["9", "32"]}], "}"}]], "Output",ExpressionUUID->"3279a935-8c13-\
42d2-a4f6-a4c0d705014c"]
}, Open  ]],

Cell["\<\
The next function verifies whether the payoff belongs to the kernel of the \
game.\
\>", "Text",ExpressionUUID->"f48eb62e-f107-410c-9bd7-767456e02ca8"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationQ", "[", 
  RowBox[{"ExpGame1", ",", "ker1"}], "]"}]], "Input",ExpressionUUID->\
"4b5c3540-a5d6-4cf5-948c-2ff6fc36296a"],

Cell[BoxData["True"], "Output",ExpressionUUID->"9335b483-67dd-41af-95a9-b6a554abed3e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationQ", "[", 
  RowBox[{"ExpGame2", ",", "ker2"}], "]"}]], "Input",ExpressionUUID->\
"4a1878fb-d077-4bca-ac28-2d3c611f2ef2"],

Cell[BoxData["True"], "Output",ExpressionUUID->"1aa81aa0-f747-4fa0-8d14-d240a354dbf9"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationQ", "[", 
  RowBox[{"ExpGame3", ",", "ker3"}], "]"}]], "Input",ExpressionUUID->\
"255fa489-5cd0-49b0-bd37-10375e743773"],

Cell[BoxData["True"], "Output",ExpressionUUID->"08317853-1886-431b-990a-e05762afd3b8"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationQ", "[", 
  RowBox[{"ExpGame4", ",", "ker4"}], "]"}]], "Input",ExpressionUUID->\
"3e84153e-d223-4b6d-baa3-4bd0d05ee7c2"],

Cell[BoxData["True"], "Output",ExpressionUUID->"c911cdf8-df29-427e-97aa-2acd3f521230"]
}, Open  ]],

Cell["Define some payoffs", "Text",ExpressionUUID->"010ee1f3-e839-44e9-bf9e-e7134a9effd8"],

Cell[BoxData[
 RowBox[{
  RowBox[{"pay", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"45", ",", "0", ",", "45", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"10", ",", "20", ",", "30", ",", "30"}], "}"}], ",", "ker1", 
     ",", "ker2"}], "}"}]}], ";"}]], "Input",ExpressionUUID->"1fd1c1a0-cc25-\
458b-9cf2-0eb59f10fead"],

Cell["\<\
If you want to test, if a list of payoffs belong to the kernel then use \
\>", "Text",ExpressionUUID->"12edde75-e77c-4a1e-b3f5-86279af73322"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationListQ", "[", 
  RowBox[{"ExpGame1", ",", "pay"}], "]"}]], "Input",ExpressionUUID->"3a45f7d0-\
78e8-4d12-bc3a-d641f7d5ac08"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"False", ",", "False", ",", "True", ",", "True"}], "}"}]], "Output",\
ExpressionUUID->"760f068f-7df4-4fc3-b190-88eb402d7d9f"]
}, Open  ]],

Cell[TextData[{
 "Specify now the arrangement of all subsets of the grand coalition ",
 StyleBox["N",
  FontSlant->"Italic"],
 "."
}], "Text",ExpressionUUID->"910b495e-30c3-4b67-9329-242bfc19f151"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Subsets", "[", 
  RowBox[{"{", 
   RowBox[{"1", ",", "2", ",", "3", ",", "4"}], "}"}], "]"}]], "Input",Express\
ionUUID->"7365864d-c74f-4eba-b33c-df760dd04903"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", "1", "}"}], ",", 
   RowBox[{"{", "2", "}"}], ",", 
   RowBox[{"{", "3", "}"}], ",", 
   RowBox[{"{", "4", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "3", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "3", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3", ",", "4"}], "}"}]}], "}"}]], "Output",Exp\
ressionUUID->"d2e3572a-0510-47d5-b914-9c71f46ad3dc"]
}, Open  ]],

Cell[TextData[{
 "The surpluses of an excess vector are arranged exactly in accordance with \
the above order of subsets of the grand coalition ",
 StyleBox["N",
  FontSlant->"Italic"],
 ". Here, we present the corresponding excess vectors related to the symbol \
\"",
 StyleBox["pay",
  FontSlant->"Italic"],
 "\"."
}], "Text",ExpressionUUID->"3f12fa84-93dd-48b2-9dc0-8245dd49bf43"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ExcessPayoff", "[", 
  RowBox[{"ExpGame1", ",", "pay", ",", 
   RowBox[{"DisplayMatrixForm", "\[Rule]", " ", "True"}]}], "]"}]], "Input",Ex\
pressionUUID->"89dd9010-a971-43f6-b764-73fb4e89e090"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"Co", "[", 
       RowBox[{"{", "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", "1", "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", "2", "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", "3", "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", "4", "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2"}], "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3"}], "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "4"}], "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3"}], "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "4"}], "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4"}], "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "3"}], "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "4"}], "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3", ",", "4"}], "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3", ",", "4"}], "}"}], "]"}], 
      RowBox[{"Co", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "3", ",", "4"}], "}"}], "]"}]},
     {"0", 
      RowBox[{"-", "45"}], "0", 
      RowBox[{"-", "45"}], "0", 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "90"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], "0", 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "50"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "50"}], 
      RowBox[{"-", "45"}], "0"},
     {"0", 
      RowBox[{"-", "10"}], 
      RowBox[{"-", "20"}], 
      RowBox[{"-", "30"}], 
      RowBox[{"-", "30"}], 
      RowBox[{"-", "30"}], 
      RowBox[{"-", "40"}], 
      RowBox[{"-", "40"}], 
      RowBox[{"-", "50"}], 
      RowBox[{"-", "50"}], 
      RowBox[{"-", "60"}], 
      RowBox[{"-", "20"}], 
      RowBox[{"-", "60"}], 
      RowBox[{"-", "30"}], 
      RowBox[{"-", "80"}], "0"},
     {"0", 
      RowBox[{"-", 
       FractionBox["45", "2"]}], 
      RowBox[{"-", 
       FractionBox["45", "2"]}], 
      RowBox[{"-", 
       FractionBox["45", "2"]}], 
      RowBox[{"-", 
       FractionBox["45", "2"]}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", 
       FractionBox["55", "2"]}], 
      RowBox[{"-", 
       FractionBox["135", "2"]}], 
      RowBox[{"-", 
       FractionBox["55", "2"]}], 
      RowBox[{"-", 
       FractionBox["135", "2"]}], "0"},
     {"0", 
      RowBox[{"-", 
       FractionBox["45", "2"]}], 
      RowBox[{"-", 
       FractionBox["45", "2"]}], 
      RowBox[{"-", 
       FractionBox["45", "2"]}], 
      RowBox[{"-", 
       FractionBox["45", "2"]}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", "45"}], 
      RowBox[{"-", 
       FractionBox["55", "2"]}], 
      RowBox[{"-", 
       FractionBox["135", "2"]}], 
      RowBox[{"-", 
       FractionBox["55", "2"]}], 
      RowBox[{"-", 
       FractionBox["135", "2"]}], "0"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"4146a97e-fda3-4257-\
b11c-8d8d7134d0ee"]
}, Open  ]],

Cell[TextData[{
 "To check if the kernel element coincides with the nucleolus, we use the \
function ",
 StyleBox["Nucleolus[]",
  FontWeight->"Bold"],
 " provided by ",
 StyleBox["CooperativeGames.",
  FontSlant->"Italic"]
}], "Text",ExpressionUUID->"a84582e9-db8b-416f-b71d-acefb56c926d"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Nucleolus", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"2180721c-646e-43fa-b66c-79834e903e09"],

Cell[BoxData[
 TemplateBox[{
  "ConstrainedMin","lpsub","\"This problem is unbounded.\"",2,136,1,
   17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"ee4cedaa-292f-4fbf-819d-9be1d4494309"],

Cell[BoxData[
 TemplateBox[{
  "Transpose","nmtx",
   "\"The first two levels of \\!\\(\\*RowBox[{\\\"{\\\", \\\"}\\\"}]\\) \
cannot be transposed.\"",2,136,2,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"8f845578-e94a-4ded-935f-a68278579efd"],

Cell[BoxData[
 TemplateBox[{
  "Transpose","argt",
   "\"\\!\\(\\*RowBox[{\\\"Transpose\\\"}]\\) called with \\!\\(\\*RowBox[{\\\
\"0\\\"}]\\) arguments; \\!\\(\\*RowBox[{\\\"1\\\"}]\\) or \
\\!\\(\\*RowBox[{\\\"2\\\"}]\\) arguments are expected.\"",2,136,3,
   17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"9f22cf38-534d-4355-bcda-e2efdd819359"],

Cell[BoxData[
 TemplateBox[{
  "Transpose","nmtx",
   "\"The first two levels of \\!\\(\\*RowBox[{\\\"{\\\", \\\"}\\\"}]\\) \
cannot be transposed.\"",2,136,4,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"4efdce4f-c92f-40b3-a6e9-7d4df9afb244"],

Cell[BoxData[
 TemplateBox[{
  "NullSpace","matrix",
   "\"Argument \\!\\(\\*RowBox[{\\\"{\\\", RowBox[{RowBox[{\\\"Transpose\\\", \
\\\"[\\\", \\\"]\\\"}], \\\",\\\", RowBox[{\\\"Transpose\\\", \\\"[\\\", \
RowBox[{\\\"{\\\", \\\"}\\\"}], \\\"]\\\"}]}], \\\"}\\\"}]\\) at position \\!\
\\(\\*RowBox[{\\\"1\\\"}]\\) is not a non-empty rectangular matrix.\"",2,136,
   5,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"ccee70bd-6448-4c26-b870-5b90f23a6d36"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["45", "2"], ",", 
   FractionBox["45", "2"], ",", 
   FractionBox["45", "2"], ",", 
   FractionBox["45", "2"]}], "}"}]], "Output",ExpressionUUID->"c289f50a-5589-\
44e9-bc27-c0a955dd60bb"]
}, Open  ]],

Cell[TextData[{
 "The game \"",
 StyleBox["ExpGame1",
  FontSlant->"Italic"],
 "\" is convex, in this case the kernel is an unique element that coincides \
with the Nucleolus."
}], "Text",ExpressionUUID->"7339e4a1-aa74-449e-a2fc-227a9c5441c6"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"8f3264f8-168b-4d2d-a687-c09a6d04964e"],

Cell[BoxData["True"], "Output",ExpressionUUID->"8b693c1d-39e6-49a9-88da-858248ae5a53"]
}, Open  ]],

Cell[TextData[{
 "Recall the kernel element from \"",
 StyleBox["ExpGame3",
  FontSlant->"Italic"],
 "\""
}], "Text",ExpressionUUID->"2d60e473-be98-4a2b-9d7c-8ee186d2eb2b"],

Cell[CellGroupData[{

Cell[BoxData["ker3"], "Input",ExpressionUUID->"fc42a14e-23bb-4105-a157-5ef7b5adf098"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}]], "Output",Expr\
essionUUID->"5de0226f-2e26-4810-b38e-a5d6013cc489"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"nuc3", "=", 
  RowBox[{"Nucleolus", "[", "ExpGame3", "]"}]}]], "Input",ExpressionUUID->\
"114a8938-59ae-4fb9-970e-c2b8e2f62199"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}]], "Output",Expr\
essionUUID->"048d77cf-6309-4402-8fdb-fad0df69f2e2"]
}, Open  ]],

Cell[TextData[{
 "If you are interested to find out more kernel elements the package provides \
the command ",
 StyleBox["KernelCalculation[]",
  FontWeight->"Bold"],
 ".  The function ",
 StyleBox["KernelCalculation[]",
  FontWeight->"Bold"],
 " computes a kernel element and candidates from ",
 StyleBox["(n(n-1)/2 + 1)",
  FontSlant->"Italic"],
 " LPs, whereas ",
 StyleBox["Kernel[]",
  FontWeight->"Bold"],
 " computes a kernel element from just one linear maximization problem.  ",
 "But due to the restriction that the built-in function ",
 StyleBox["ConstrainedMax[]",
  FontWeight->"Bold"],
 " find just one solution and not all solutions of a LP we are sometimes not \
able to specify the whole kernel with ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 ". That's why we follow the strategy that the above commands return also the \
final LP for further investigation outside of ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 ". "
}], "Text",
 TextJustification->1,ExpressionUUID->"628db8a8-452a-41b4-b0fc-04d4f909dd51"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"sol3", ",", "pay3"}], "}"}], "=", 
  RowBox[{"KernelCalculation", "[", 
   RowBox[{"ExpGame3", ",", 
    RowBox[{"EpsilonValue", "\[Rule]", " ", "2"}]}], "]"}]}]], "Input",Express\
ionUUID->"38e12275-c771-4210-b303-172ad995533f"],

Cell[CellGroupData[{

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Game is zero-monotone? \"\>", "\[InvisibleSpace]", "False"}],
  SequenceForm["Game is zero-monotone? ", False],
  Editable->False]], "Print",ExpressionUUID->"b3a0ee24-67e3-41a7-8681-\
da8e516b4b71"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Core is nonempty? \"\>", "\[InvisibleSpace]", "True"}],
  SequenceForm["Core is nonempty? ", True],
  Editable->False]], "Print",ExpressionUUID->"09c0f27e-fdf9-4190-825b-\
f24f19924e19"],

Cell[BoxData["\<\"Game is either zero-monotonic or has nonempty core\"\>"], \
"Print",ExpressionUUID->"2f694545-b77a-4919-9410-4522917c56f8"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"A Kernel solution is: \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"x", "[", "1", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "2", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "3", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "4", "]"}], "\[Rule]", "2"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "5", "]"}], "\[Rule]", "2"}]}], "}"}]}],
  SequenceForm[
  "A Kernel solution is: ", {
   TUG`coop`CooperativeGames`x[1] -> 1, TUG`coop`CooperativeGames`x[2] -> 1, 
    TUG`coop`CooperativeGames`x[3] -> 1, TUG`coop`CooperativeGames`x[4] -> 2, 
    TUG`coop`CooperativeGames`x[5] -> 2}],
  Editable->False]], "Print",ExpressionUUID->"8b498ea1-0411-4f56-a634-\
ad78241d4285"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "1", ",", "3", ",", "1", ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "3", ",", "1", ",", "1", ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["5", "3"], ",", 
       FractionBox["5", "3"], ",", 
       FractionBox["5", "3"], ",", "1", ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "1", ",", "1", ",", "1", ",", "1"}], "}"}]}], "}"}]}],
   "}"}]], "Output",ExpressionUUID->"a89feff3-5606-4e3c-a157-d48b74feb4fd"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationListQ", "[", 
  RowBox[{"ExpGame3", ",", "pay3"}], "]"}]], "Input",ExpressionUUID->\
"600bd092-578c-4b0e-8e49-32fe43636e12"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "False", ",", "False", ",", "True", ",", "False", ",", "False", ",", 
   "False", ",", "False", ",", "False", ",", "False", ",", "False", ",", 
   "False"}], "}"}]], "Output",ExpressionUUID->"f9aeb12c-9084-47d7-b855-\
d186147791c9"]
}, Open  ]],

Cell[TextData[{
 "All internal results can be obtained by invoking the option ",
 StyleBox["DisplayAllResults.",
  FontSlant->"Italic"]
}], "Text",ExpressionUUID->"99bd0d83-0d4d-4036-a019-d850a0b98835"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"sol3", ",", "obj3", ",", "con3", ",", "tra3", ",", " ", "pay3"}], 
   "}"}], "=", 
  RowBox[{"KernelCalculation", "[", 
   RowBox[{"ExpGame3", ",", 
    RowBox[{"EpsilonValue", "\[Rule]", " ", "2"}], ",", 
    RowBox[{"DisplayAllResults", "\[Rule]", " ", "True"}]}], "]"}]}]], "Input",\
ExpressionUUID->"8969b96e-77c3-4c00-a92c-ebc4c948f274"],

Cell[CellGroupData[{

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Game is zero-monotone? \"\>", "\[InvisibleSpace]", "False"}],
  SequenceForm["Game is zero-monotone? ", False],
  Editable->False]], "Print",ExpressionUUID->"54202641-7046-4e10-b94c-\
1c8534aab45f"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Core is nonempty? \"\>", "\[InvisibleSpace]", "True"}],
  SequenceForm["Core is nonempty? ", True],
  Editable->False]], "Print",ExpressionUUID->"f431d27e-b296-4141-8f06-\
60477460f492"],

Cell[BoxData["\<\"Game is either zero-monotonic or has nonempty core\"\>"], \
"Print",ExpressionUUID->"d6651008-379c-492a-ab87-9996f19b3528"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"A Kernel solution is: \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"x", "[", "1", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "2", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "3", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "4", "]"}], "\[Rule]", "2"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "5", "]"}], "\[Rule]", "2"}]}], "}"}]}],
  SequenceForm[
  "A Kernel solution is: ", {
   TUG`coop`CooperativeGames`x[1] -> 1, TUG`coop`CooperativeGames`x[2] -> 1, 
    TUG`coop`CooperativeGames`x[3] -> 1, TUG`coop`CooperativeGames`x[4] -> 2, 
    TUG`coop`CooperativeGames`x[5] -> 2}],
  Editable->False]], "Print",ExpressionUUID->"8cac3555-28f5-47bf-acae-\
64cf219317dd"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{
    RowBox[{"x", "[", "1", "]"}], "+", 
    RowBox[{"x", "[", "2", "]"}], "+", 
    RowBox[{"x", "[", "3", "]"}], "+", 
    RowBox[{"x", "[", "4", "]"}], "+", 
    RowBox[{"x", "[", "5", "]"}]}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"-", "2"}], "-", 
       RowBox[{"x", "[", "1", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "2"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "2"}], "-", 
       RowBox[{"x", "[", "2", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "2"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "2"}], "-", 
       RowBox[{"x", "[", "3", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "2"}]}], ",", 
     RowBox[{
      RowBox[{"2", "-", 
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "2"}]}], ",", 
     RowBox[{
      RowBox[{"2", "-", 
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "2"}]}], ",", 
     RowBox[{
      RowBox[{"2", "-", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "2"}]}], ",", 
     RowBox[{
      RowBox[{"2", "-", 
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "2"}]}], ",", 
     RowBox[{
      RowBox[{"2", "-", 
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "2"}]}], ",", 
     RowBox[{
      RowBox[{"2", "-", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "2"}]}], ",", 
     RowBox[{
      RowBox[{"2", "-", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "2"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", "7"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["1", "6"], ",", "1", ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["1", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "1", ",", "3", ",", "1", ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "3", ",", "1", ",", "1", ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["5", "3"], ",", 
       FractionBox["5", "3"], ",", 
       FractionBox["5", "3"], ",", "1", ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "1", ",", "1", ",", "1", ",", "1"}], "}"}]}], "}"}]}],
   "}"}]], "Output",ExpressionUUID->"6ee8635d-4056-4108-98ca-09030e97ada7"]
}, Open  ]],

Cell[TextData[{
 "The first return value is the kernel solution, the second the objective \
function, the third the constraint set, the fourth contains  values of the \
largest bi-symmetrical transfer and the last value returns in general a list \
of possible kernel candidates that have been computed from the ",
 StyleBox["n(n-1)/2",
  FontSlant->"Italic"],
 " initial LPs. Note, that according to this procedure the function becomes \
very slow for huge games.  A good strategy is to find out a first kernel \
element by the function ",
 StyleBox["Kernel[]",
  FontWeight->"Bold"],
 ". This function is in average 10 times faster than the function ",
 StyleBox["KernelCalculation[]",
  FontWeight->"Bold"],
 ".  Moreover, we have found out that you can also speed up the calculation \
with the above commands by providing one of the critical value that have been \
introduced by ",
 ButtonBox["Maschler, Peleg and Shapley",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Maschler"],
 " (1979) to vary the strong epsilon core instead of using the default value \
zero."
}], "Text",
 TextJustification->1,ExpressionUUID->"3d0d70de-fad8-4e45-9c51-6f1ca3ae58f3"],

Cell["The complete set of options can be seen by", "Text",ExpressionUUID->"65cf0a90-cf95-4dd0-84ed-6dbe6bd55682"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Options", "[", "KernelCalculation", "]"}]], "Input",ExpressionUUID->"ffba2452-494c-408d-80a8-fa744af4a132"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"CallMaximize", "\[Rule]", "False"}], ",", 
   RowBox[{"ChangeInternalEps", "\[Rule]", "False"}], ",", 
   RowBox[{"DisplayAllResults", "\[Rule]", "False"}], ",", 
   RowBox[{"EpsilonValue", "\[Rule]", "0"}], ",", 
   RowBox[{"SetGameToNonZeroMonotonic", "\[Rule]", "False"}]}], 
  "}"}]], "Output",ExpressionUUID->"1f07311c-6a00-476e-91a3-b6aa7657299c"]
}, Open  ]],

Cell["and for the function Kernel by calling", "Text",ExpressionUUID->"28bda26a-0b13-4062-bae1-251f4f025485"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Options", "[", "Kernel", "]"}]], "Input",ExpressionUUID->"4e3cd87d-bf70-48c3-9d91-715a80029ec2"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"CallMaximize", "\[Rule]", "False"}], ",", 
   RowBox[{"DisplayAllResults", "\[Rule]", "False"}], ",", 
   RowBox[{"EpsilonValue", "\[Rule]", "0"}]}], "}"}]], "Output",ExpressionUUID\
->"69075edd-72e1-4322-b716-c9e9367cd496"]
}, Open  ]],

Cell[TextData[{
 "Now have a look what returns the function ",
 StyleBox["Kernel[]  ",
  FontWeight->"Bold"],
 StyleBox["by invoking the option DispalyAllResults",
  FontVariations->{"CompatibilityType"->0}]
}], "Text",ExpressionUUID->"cf29e3b5-eb46-4f3b-bb71-b4feb79689dc"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"sol3", ",", "object3", ",", "con3", ",", "var3", ",", "trans3"}], 
   "}"}], "=", 
  RowBox[{"Kernel", "[", 
   RowBox[{"ExpGame3", ",", 
    RowBox[{"DisplayAllResults", "\[Rule]", " ", "True"}]}], "]"}]}]], "Input",\
ExpressionUUID->"8a9e5152-d028-4cee-92af-afa2c850f53b"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{
    RowBox[{"\[Delta]", "[", 
     RowBox[{"1", ",", "2"}], "]"}], "+", 
    RowBox[{"\[Delta]", "[", 
     RowBox[{"1", ",", "3"}], "]"}], "+", 
    RowBox[{"\[Delta]", "[", 
     RowBox[{"1", ",", "4"}], "]"}], "+", 
    RowBox[{"\[Delta]", "[", 
     RowBox[{"1", ",", "5"}], "]"}], "+", 
    RowBox[{"\[Delta]", "[", 
     RowBox[{"2", ",", "3"}], "]"}], "+", 
    RowBox[{"\[Delta]", "[", 
     RowBox[{"2", ",", "4"}], "]"}], "+", 
    RowBox[{"\[Delta]", "[", 
     RowBox[{"2", ",", "5"}], "]"}], "+", 
    RowBox[{"\[Delta]", "[", 
     RowBox[{"3", ",", "4"}], "]"}], "+", 
    RowBox[{"\[Delta]", "[", 
     RowBox[{"3", ",", "5"}], "]"}], "+", 
    RowBox[{"\[Delta]", "[", 
     RowBox[{"4", ",", "5"}], "]"}]}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[Equal]", "7"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "1", "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "2", "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "3", "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "4", "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "5", "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "2"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"\[Delta]", "[", 
       RowBox[{"1", ",", "2"}], "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"\[Delta]", "[", 
       RowBox[{"1", ",", "3"}], "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"\[Delta]", "[", 
       RowBox[{"1", ",", "4"}], "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"1", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"\[Delta]", "[", 
       RowBox[{"1", ",", "5"}], "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "3"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"\[Delta]", "[", 
       RowBox[{"2", ",", "3"}], "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"\[Delta]", "[", 
       RowBox[{"2", ",", "4"}], "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"2", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"\[Delta]", "[", 
       RowBox[{"2", ",", "5"}], "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "4"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"\[Delta]", "[", 
       RowBox[{"3", ",", "4"}], "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"3", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"\[Delta]", "[", 
       RowBox[{"3", ",", "5"}], "]"}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "4"}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}], "-", 
       RowBox[{"\[Delta]", "[", 
        RowBox[{"4", ",", "5"}], "]"}]}], "\[GreaterEqual]", "0"}], ",", 
     RowBox[{
      RowBox[{"\[Delta]", "[", 
       RowBox[{"4", ",", "5"}], "]"}], "\[GreaterEqual]", "0"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"x", "[", "1", "]"}], ",", 
     RowBox[{"x", "[", "2", "]"}], ",", 
     RowBox[{"x", "[", "3", "]"}], ",", 
     RowBox[{"x", "[", "4", "]"}], ",", 
     RowBox[{"x", "[", "5", "]"}], ",", 
     RowBox[{"\[Delta]", "[", 
      RowBox[{"1", ",", "2"}], "]"}], ",", 
     RowBox[{"\[Delta]", "[", 
      RowBox[{"1", ",", "3"}], "]"}], ",", 
     RowBox[{"\[Delta]", "[", 
      RowBox[{"1", ",", "4"}], "]"}], ",", 
     RowBox[{"\[Delta]", "[", 
      RowBox[{"1", ",", "5"}], "]"}], ",", 
     RowBox[{"\[Delta]", "[", 
      RowBox[{"2", ",", "3"}], "]"}], ",", 
     RowBox[{"\[Delta]", "[", 
      RowBox[{"2", ",", "4"}], "]"}], ",", 
     RowBox[{"\[Delta]", "[", 
      RowBox[{"2", ",", "5"}], "]"}], ",", 
     RowBox[{"\[Delta]", "[", 
      RowBox[{"3", ",", "4"}], "]"}], ",", 
     RowBox[{"\[Delta]", "[", 
      RowBox[{"3", ",", "5"}], "]"}], ",", 
     RowBox[{"\[Delta]", "[", 
      RowBox[{"4", ",", "5"}], "]"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0",
      ",", "0", ",", "0"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"29b12fb6-b7cd-4d6b-a079-5610e96fae3e"]
}, Open  ]],

Cell["\<\
The first three return values are the same as above. The last but one return \
value stores all variables of the LP and the last provides information about \
the transfers in each direction such that the endpoints of the line segment \
remain in the strong epsilon-core.\
\>", "Text",
 TextJustification->1,ExpressionUUID->"86a10d72-cc2f-471d-9f31-07ec5f6a71fb"],

Cell[CellGroupData[{

Cell[BoxData["trans3"], "Input",ExpressionUUID->"9d477fd2-2984-4bb6-a061-7095747157d9"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
   ",", "0", ",", "0"}], "}"}]], "Output",ExpressionUUID->"908227ee-ca0a-4e97-\
b983-2172af228b08"]
}, Open  ]],

Cell[TextData[{
 "The result states that it is not possible to transfer a positive amount in \
each direction without leaving the core. To check this, let us determine, if \
an endpoint of the line segment 1-2  belongs to the core if we transfer a \
half unit from player 1 to player 2 from the derived kernel solution. The \
function ",
 StyleBox["Transfer[]",
  FontWeight->"Bold"],
 " needs five input parameters, the initial imputation, the whole player set, \
the transfer amount, the player from whom we extract the transfer amount and \
the player who receives it."
}], "Text",
 TextJustification->1,ExpressionUUID->"e733b08a-4253-4261-8a3d-b8938904f5c2"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"tr1", "=", 
  RowBox[{"Transfer", "[", 
   RowBox[{"sol3", ",", "T3", ",", 
    FractionBox["1", "2"], ",", "1", ",", "2"}], "]"}]}]], "Input",ExpressionU\
UID->"b54e8361-528d-4f95-ac9c-5297cafdbb5c"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1", "2"], ",", 
   FractionBox["3", "2"], ",", "1", ",", "2", ",", "2"}], "}"}]], "Output",Exp\
ressionUUID->"5b663494-af1f-4240-b2bb-086cbcbbbe86"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"InCoreQ", "[", 
  RowBox[{"tr1", ",", "ExpGame3"}], "]"}]], "Input",ExpressionUUID->"b2100616-\
c62a-409d-af1c-f6029286baac"],

Cell[BoxData["False"], "Output",ExpressionUUID->"c95ebc25-e33c-4320-aef4-d6c508aa07b0"]
}, Open  ]],

Cell["Next let us remain in the initial payoff distribution.", "Text",ExpressionUUID->"352bfa15-305f-4a64-b6d5-03a82541d0d4"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"tr2", "=", 
  RowBox[{"Transfer", "[", 
   RowBox[{"sol3", ",", "T3", ",", "0", ",", "1", ",", "2"}], 
   "]"}]}]], "Input",ExpressionUUID->"fd6c9d5b-2aab-4fdc-91d0-30923ac35b1a"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}]], "Output",Expr\
essionUUID->"712316e4-ce74-4605-982b-681dc833b0a2"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"InCoreQ", "[", 
  RowBox[{"tr2", ",", "ExpGame3"}], "]"}]], "Input",ExpressionUUID->"47fa3750-\
ad79-4940-8174-d28cded8867e"],

Cell[BoxData["True"], "Output",ExpressionUUID->"7319d9e8-4cce-4586-a71f-7f1cb03e2c87"]
}, Open  ]],

Cell["\<\
In the last example we take from the initial distribution a half unit away \
from player 2 to give it player 1.\
\>", "Text",ExpressionUUID->"3eb4081e-0e71-4d76-a72f-7f5f5c6cec5d"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"tr3", "=", 
  RowBox[{"Transfer", "[", 
   RowBox[{"sol3", ",", "T3", ",", 
    FractionBox[
     RowBox[{"-", "1"}], "2"], ",", "1", ",", "2"}], "]"}]}]], "Input",Express\
ionUUID->"abdccee3-757a-4be4-9927-0b33c4bd659b"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["3", "2"], ",", 
   FractionBox["1", "2"], ",", "1", ",", "2", ",", "2"}], "}"}]], "Output",Exp\
ressionUUID->"03a3e997-fbab-452f-a218-48f9baa4bc4c"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"InCoreQ", "[", 
  RowBox[{"tr3", ",", "ExpGame3"}], "]"}]], "Input",ExpressionUUID->"86d92257-\
78b8-48ba-9bed-16101f9ffd1d"],

Cell[BoxData["False"], "Output",ExpressionUUID->"0f8a0ec5-9634-43c7-906f-7972bb9dfe9c"]
}, Open  ]],

Cell[TextData[{
 "Recall that all Kernel commands based on the built-in  ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " command ",
 StyleBox["ConstrainedMax[]",
  FontWeight->"Bold"],
 ". Unfortunately, this command offers no control on the solver. That's why, \
we let us also return the whole final LP that computes us a kernel element \
with the intention to export this final LP to a mathematical software that \
offers more control on the solver. In some respect one can overcome this \
shortcoming by computing kernel elements by varying the strong epsilon core. \
This can be done by calculating in a first step some critical values. For \
instance the command ",
 StyleBox["FirstCriticalVal[]",
  FontWeight->"Bold"],
 " calculates the smallest epsilon value such that the epsilon-core  is \
non-empty (cf. ",
 ButtonBox["Maschler, Peleg and Shapley",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Maschler"],
 " (1979)). "
}], "Text",
 TextJustification->1,ExpressionUUID->"0da088e9-2d66-4bf8-804f-00f523b9cb09"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FirstCriticalVal", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"cea5af68-0e65-440d-8178-5463c4d77720"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"eps1", "\[Rule]", 
   RowBox[{"-", 
    FractionBox["45", "2"]}]}], "}"}]], "Output",ExpressionUUID->"bc2d7a5a-\
3446-47c6-9525-c1dd6fe8b3dc"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FirstCriticalVal", "[", "ExpGame2", "]"}]], "Input",ExpressionUUID->"20bf82ec-7e63-4175-89ff-76cbca567be8"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"eps1", "\[Rule]", 
   RowBox[{"-", 
    FractionBox["45", "2"]}]}], "}"}]], "Output",ExpressionUUID->"4a1253a3-\
bf83-47e4-9564-1b19a8a0eb9a"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FirstCriticalVal", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"cd4cee39-d792-4c7b-8299-0ba9c5436c55"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"eps1", "\[Rule]", "0"}], "}"}]], "Output",ExpressionUUID->\
"bfede756-a2ce-422f-a992-b252f750385d"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FirstCriticalVal", "[", "ExpGame4", "]"}]], "Input",ExpressionUUID->"b9462375-8136-4394-9201-e0f47552b9c4"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"eps1", "\[Rule]", 
   RowBox[{"-", 
    FractionBox["3", "16"]}]}], "}"}]], "Output",ExpressionUUID->"db3735be-\
4d8b-4ad6-a73b-960746568d0d"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SecondCriticalVal", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"46b5222b-1faf-4ef2-9504-10f4e93bfdfb"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"eps2", "\[Rule]", "4"}], "}"}]], "Output",ExpressionUUID->\
"29aa1ef4-7a03-4eb5-bfcb-419e5b773837"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ThirdCriticalVal", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"8d9aaca6-5dbd-4026-9a40-2309d31ddd9e"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"eps3", "\[Rule]", "21"}], "}"}]], "Output",ExpressionUUID->\
"7d58dc04-d223-44e3-ad57-0f98cde74b18"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FourthCriticalVal", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"dc29ffdd-5fc3-4920-8ef1-084d78c1011f"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"eps4", "\[Rule]", "4"}], "}"}]], "Output",ExpressionUUID->\
"c73b7020-f83c-4771-9ed5-cc99a2d58166"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"StarCriticalVal", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"e4110aa6-f0ef-4897-9995-cee8853e3257"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"stareps", "\[Rule]", "4"}], "}"}]], "Output",ExpressionUUID->\
"5fe38793-8625-489a-824b-d7812cd7c591"]
}, Open  ]],

Cell["\<\
Now let us demonstrate that we are able to compute the complete kernel of a \
game.\
\>", "Text",ExpressionUUID->"db7a56b2-1c04-40f3-8c58-d5f84162c2ec"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame9", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T3", ",", "vec3"}], "]"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "5"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"3", ",", "5"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"4", ",", "5"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "3"}], "}"}], "]"}], "=", 
      FractionBox["11", "12"]}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "4"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "5"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3", ",", "4"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3", ",", "5"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "4", ",", "5"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3", ",", "4"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3", ",", "5"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "4", ",", "5"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4", ",", "5"}], "}"}], "]"}], "=", "1"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "3", ",", "4"}], "}"}], "]"}], "=", "1"}],
      ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "3", ",", "5"}], "}"}], "]"}], "=", "1"}],
      ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "4", ",", "5"}], "}"}], "]"}], "=", "1"}],
      ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3", ",", "4", ",", "5"}], "}"}], "]"}], "=", "1"}],
      ";", 
     RowBox[{
      RowBox[{"v", "[", "T3", "]"}], "=", "2"}], ";"}], ")"}]}], 
  ";"}]], "Input",ExpressionUUID->"832f5b12-41f4-4301-813f-e4ce4038281c"],

Cell[TextData[{
 "The kernel of this game is given by the union of the following three line \
segments (cf. ",
 ButtonBox["Maschler and Peleg",
  BaseStyle->"Hyperlink",
  ButtonData:>"References"],
 "  (1966,p.322)):\n",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["J", "1"], "=", 
    RowBox[{"[", " ", 
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0", ",", "1", ",", "1", ",", "1", ",", "1"}], "}"}], "/", 
       "2"}], ",", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"1", ",", "11", ",", "11", ",", "12", ",", "13"}], "}"}], "/",
        "24"}]}], "]"}]}], TraditionalForm]],ExpressionUUID->
  "247cefea-2b26-440e-b0a1-f64a9dc3efd9"],
 "\n",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["J", "2"], " ", "=", " ", 
    RowBox[{"[", 
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{"7", ",", "8", ",", "8", ",", "9", ",", "16"}], "}"}], "/", 
       "24"}], ",", " ", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"1", ",", "11", ",", "11", ",", "12", ",", "13"}], "}"}], "/",
        "24"}]}], "]"}]}], TraditionalForm]],ExpressionUUID->
  "19564bc7-b9ff-4893-be9f-1a3a01ec6ebc"],
 "\n",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["J", "3"], " ", "=", 
    RowBox[{"[", 
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{"7", ",", "8", ",", "8", ",", "9", ",", "16"}], "}"}], "/", 
       "24"}], ",", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"11", ",", "11", ",", "11", ",", "14", ",", "25"}], "}"}], 
       "/", "36"}]}], "]"}]}], TraditionalForm]],ExpressionUUID->
  "86158c7b-045f-4339-b5eb-cb9d1a14c097"]
}], "Text",
 TextJustification->1,
 CellTags->"MP66",ExpressionUUID->"8a324c01-cc18-4c5d-a6b9-7312e880f7f9"],

Cell[TextData[{
 "Note first that specifying an epsilon value can speed up the calculation \
time by using the ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " function ",
 StyleBox["ConstrainedMax[].",
  FontWeight->"Bold"]
}], "Text",ExpressionUUID->"ce4c1fd1-c08b-4206-9d1a-a0685ed30b09"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time9", ",", "ker9"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Kernel", "[", "ExpGame9", "]"}], "]"}]}]], "Input",ExpressionUUID-\
>"6a8bc4f1-961a-429f-9483-1c66701c2af8"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.035247`", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "24"], ",", 
     FractionBox["1", "3"], ",", 
     FractionBox["1", "3"], ",", 
     FractionBox["3", "8"], ",", 
     FractionBox["2", "3"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"e2f31b31-9057-450a-ade1-59736bcbb901"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time091", ",", "ker9"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Kernel", "[", 
    RowBox[{"ExpGame9", ",", 
     RowBox[{"EpsilonValue", "\[Rule]", " ", "3"}]}], "]"}], "]"}]}]], "Input",\
ExpressionUUID->"72b08d07-c812-441f-88c1-62cd484f6cd6"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.014114`", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "24"], ",", 
     FractionBox["1", "3"], ",", 
     FractionBox["1", "3"], ",", 
     FractionBox["3", "8"], ",", 
     FractionBox["2", "3"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"3bdd0039-57b9-49de-bf56-f566077e3ace"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time92", ",", 
    RowBox[{"{", 
     RowBox[{"sol9", ",", "pay9"}], "}"}]}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"KernelCalculation", "[", "ExpGame9", "]"}], "]"}]}]], "Input",Expr\
essionUUID->"eb52b2c8-f97a-4fe3-bddf-49097c535a2b"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Game is average-convex? \"\>", "\[InvisibleSpace]", "False"}],
  SequenceForm["Game is average-convex? ", False],
  Editable->False]], "Print",ExpressionUUID->"e80d274d-92ee-449a-9db8-\
4e86b0fb8f59"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.076663`", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       FractionBox["7", "24"], ",", 
       FractionBox["1", "3"], ",", 
       FractionBox["1", "3"], ",", 
       FractionBox["3", "8"], ",", 
       FractionBox["2", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0", ",", 
         FractionBox["11", "24"], ",", 
         FractionBox["11", "24"], ",", 
         FractionBox["13", "24"], ",", 
         FractionBox["13", "24"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", 
         FractionBox["1", "2"], ",", 
         FractionBox["1", "2"], ",", 
         FractionBox["1", "2"], ",", 
         FractionBox["1", "2"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         FractionBox["7", "24"], ",", 
         FractionBox["1", "3"], ",", 
         FractionBox["1", "3"], ",", 
         FractionBox["3", "8"], ",", 
         FractionBox["2", "3"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         FractionBox["11", "36"], ",", 
         FractionBox["11", "36"], ",", 
         FractionBox["11", "36"], ",", 
         FractionBox["7", "18"], ",", 
         FractionBox["25", "36"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         FractionBox["1", "3"], ",", 
         FractionBox["1", "3"], ",", 
         FractionBox["1", "3"], ",", 
         FractionBox["1", "3"], ",", 
         FractionBox["2", "3"]}], "}"}]}], "}"}]}], "}"}]}], "}"}]], "Output",\
ExpressionUUID->"f6223072-3626-4e35-8d23-3efae481b6ac"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kerli9", "=", 
  RowBox[{"KernelImputationListQ", "[", 
   RowBox[{"ExpGame9", ",", "pay9"}], "]"}]}]], "Input",ExpressionUUID->\
"9c4eff5b-fc9d-494a-adbd-b495e1d81a63"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"False", ",", "True", ",", "True", ",", "True", ",", "False"}], 
  "}"}]], "Output",ExpressionUUID->"5f086e53-1d5e-48f5-a8ff-944dd76de324"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ps", "=", 
  RowBox[{"Position", "[", 
   RowBox[{"kerli9", ",", "True"}], "]"}]}]], "Input",ExpressionUUID->\
"e3d58000-9bab-405f-89e1-d2ac656218c6"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "2", "}"}], ",", 
   RowBox[{"{", "3", "}"}], ",", 
   RowBox[{"{", "4", "}"}]}], "}"}]], "Output",ExpressionUUID->"94c87fb4-b96c-\
45bc-86a0-08d163852ec2"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kerel", "=", 
  RowBox[{"Extract", "[", 
   RowBox[{"pay9", ",", "ps"}], "]"}]}]], "Input",ExpressionUUID->"33d2cc0e-\
611f-463b-bb37-0b6954935f47"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "24"], ",", 
     FractionBox["1", "3"], ",", 
     FractionBox["1", "3"], ",", 
     FractionBox["3", "8"], ",", 
     FractionBox["2", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["11", "36"], ",", 
     FractionBox["11", "36"], ",", 
     FractionBox["11", "36"], ",", 
     FractionBox["7", "18"], ",", 
     FractionBox["25", "36"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"de056ff8-f863-46e2-8a35-27386401e577"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time9", ",", 
    RowBox[{"{", 
     RowBox[{"sol91", ",", "pay91"}], "}"}]}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"KernelCalculation", "[", 
    RowBox[{"ExpGame9", ",", 
     RowBox[{"EpsilonValue", "\[Rule]", "3"}]}], "]"}], "]"}]}]], "Input",Expr\
essionUUID->"6d28affd-8335-4a0e-839b-6c9d84c9fe1d"],

Cell[CellGroupData[{

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Game is zero-monotone? \"\>", "\[InvisibleSpace]", "False"}],
  SequenceForm["Game is zero-monotone? ", False],
  Editable->False]], "Print",ExpressionUUID->"b3fd06a1-5d06-4f15-9863-\
b90b15635550"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Core is nonempty? \"\>", "\[InvisibleSpace]", "True"}],
  SequenceForm["Core is nonempty? ", True],
  Editable->False]], "Print",ExpressionUUID->"df5ec943-70cb-43bd-b44c-\
ccea712e5c2e"],

Cell[BoxData["\<\"Game is either zero-monotonic or has nonempty core\"\>"], \
"Print",ExpressionUUID->"3c3326bc-5d9a-4b0c-bd70-a1c82cf9b23d"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.061949`", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       FractionBox["1", "24"], ",", 
       FractionBox["11", "24"], ",", 
       FractionBox["11", "24"], ",", 
       FractionBox["1", "2"], ",", 
       FractionBox["13", "24"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0", ",", "0", ",", "1", ",", "1", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", 
         FractionBox["1", "2"], ",", 
         FractionBox["1", "2"], ",", 
         FractionBox["1", "2"], ",", 
         FractionBox["1", "2"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", "1", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", "1", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         FractionBox["19", "24"], ",", 
         FractionBox["1", "12"], ",", 
         FractionBox["1", "12"], ",", 
         FractionBox["7", "8"], ",", 
         FractionBox["1", "6"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"1", ",", "0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"1", ",", "1", ",", "0", ",", "0", ",", "0"}], "}"}]}], 
      "}"}]}], "}"}]}], "}"}]], "Output",ExpressionUUID->"4afbb3fa-cb57-4cef-\
bc05-63f64cce3657"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AppendTo", "[", 
  RowBox[{"kerel", ",", "sol91"}], "]"}]], "Input",ExpressionUUID->"5553af50-\
1b57-454f-b32f-e6767b559466"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "24"], ",", 
     FractionBox["1", "3"], ",", 
     FractionBox["1", "3"], ",", 
     FractionBox["3", "8"], ",", 
     FractionBox["2", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["11", "36"], ",", 
     FractionBox["11", "36"], ",", 
     FractionBox["11", "36"], ",", 
     FractionBox["7", "18"], ",", 
     FractionBox["25", "36"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1", "24"], ",", 
     FractionBox["11", "24"], ",", 
     FractionBox["11", "24"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["13", "24"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"0263e31a-3e8b-486b-8cef-b9ac162a39e0"]
}, Open  ]],

Cell["This is exactly the kernel solution.", "Text",ExpressionUUID->"d5afde03-b9a6-4254-a1be-d1c29241187c"],

Cell[TextData[{
 "Instead of computing kernel solutions with an LP approach, we can also \
compute a kernel element by relying on a convergence algorithm. We \
implemented an algorithm that was due to Maschler by iteratively carrying out \
transfers between pairs of players. Details of the algorithm can be found in ",
 ButtonBox["Faigle, Kern and Kuipers",
  BaseStyle->"Hyperlink",
  ButtonData:>"References"],
 " (1998). Note that the algorithm is implemented by using recursion. The \
default value is set to 512 and can be changed with the option \
SetRecursionLimit. We invoke the algorithm by calling the function \
FindKernelSolution[game,payoff,options] and the options can be find out by \
calling"
}], "Text",
 TextJustification->1,
 CellTags->"Faigle98",ExpressionUUID->"1fa0b706-8727-48c8-8a47-c18f6fc233d9"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Options", "[", "FindKernelSolution", "]"}]], "Input",ExpressionUUID->"41b6478a-e1ac-44e6-96e6-b2cb438bf15e"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"DigitPrecision", "\[Rule]", "6"}], ",", 
   RowBox[{"RationalTol", "\[Rule]", 
    FractionBox["1", "10000000"]}], ",", 
   RowBox[{"SetRecursionLimit", "\[Rule]", "512"}], ",", 
   RowBox[{"Silent", "\[Rule]", "True"}]}], "}"}]], "Output",ExpressionUUID->\
"9b5a6ee6-f111-4f74-b7f5-a43ece5ebef8"]
}, Open  ]],

Cell["\<\
To check out how the function works, let us first construct some payoff \
vectors.\
\>", "Text",ExpressionUUID->"334dab50-c2e1-4b52-b199-b5410245e29a"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"c1", "=", 
   RowBox[{"{", 
    RowBox[{"2", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"c2", "=", 
   RowBox[{"Permutations", "[", "c1", "]"}]}], ";"}]}], "Input",ExpressionUUID\
->"e14354fa-6726-4149-a0a3-5c1ecb957b01"],

Cell["Computing a pre-kernel element can be done by", "Text",ExpressionUUID->"a0032892-f1a1-442e-88ae-bf177f6d386e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"tc1", ",", "c1kern1"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"FindKernelSolution", "[", 
    RowBox[{"ExpGame9", ",", "c1"}], "]"}], "]"}]}]], "Input",ExpressionUUID->\
"4a46e586-db65-4f84-814d-80d8bfd90862"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.07085`", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["13", "48"], ",", 
     FractionBox["11", "32"], ",", 
     FractionBox["11", "32"], ",", 
     FractionBox["37", "96"], ",", 
     FractionBox["21", "32"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"8fd86eae-c7e8-4f43-a7be-74cf0378540c"]
}, Open  ]],

Cell["or", "Text",ExpressionUUID->"7e2f208e-9ca0-483b-a036-ce0cc2d5e95e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"tc2", ",", "c1kern2"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"FindKernelSolution", "[", 
    RowBox[{"ExpGame9", ",", "c2"}], "]"}], "]"}]}]], "Input",ExpressionUUID->\
"b9a1dcd8-5822-494d-8b92-f3efe60b5e8e"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.266126`", ",", 
   RowBox[{"{", 
    RowBox[{"{", 
     RowBox[{"0", ",", 
      FractionBox["1", "2"], ",", 
      FractionBox["1", "2"], ",", 
      FractionBox["1", "2"], ",", 
      FractionBox["1", "2"]}], "}"}], "}"}]}], "}"}]], "Output",ExpressionUUID\
->"baa777a1-bee0-46f0-a6df-3290aba29bff"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"tc3", ",", "c1kern3"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"FindKernelSolution", "[", "ExpGame9", "]"}], "]"}]}]], "Input",Exp\
ressionUUID->"ba2556a6-34ea-48ed-bcf7-dbee80db2f89"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.022062`", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["19", "120"], ",", 
     FractionBox["2", "5"], ",", 
     FractionBox["2", "5"], ",", 
     FractionBox["53", "120"], ",", 
     FractionBox["3", "5"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"c4f878aa-6d37-481f-b9da-e45467ce3c18"]
}, Open  ]],

Cell["By using the kernel candidates of pay91 we compute", "Text",ExpressionUUID->"6add956a-e51f-4e53-b765-5965c5db406b"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"tc3", ",", "c1kern3"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"FindKernelSolution", "[", 
    RowBox[{"ExpGame9", ",", "pay91"}], "]"}], "]"}]}]], "Input",ExpressionUUI\
D->"6c0bc344-3da3-4562-890c-1acd710da527"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.263763`", ",", 
   RowBox[{"{", 
    RowBox[{"{", 
     RowBox[{"0", ",", 
      FractionBox["1", "2"], ",", 
      FractionBox["1", "2"], ",", 
      FractionBox["1", "2"], ",", 
      FractionBox["1", "2"]}], "}"}], "}"}]}], "}"}]], "Output",ExpressionUUID\
->"5dd49f9f-5083-49bc-a5f2-bacfd40a798e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"c2k2", "=", 
  RowBox[{"Union", "[", "c1kern2", "]"}]}]], "Input",ExpressionUUID->\
"06d029cb-87dd-4eb2-aec8-7c71cfbf65d8"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"0", ",", 
    FractionBox["1", "2"], ",", 
    FractionBox["1", "2"], ",", 
    FractionBox["1", "2"], ",", 
    FractionBox["1", "2"]}], "}"}], "}"}]], "Output",ExpressionUUID->\
"021ad68c-bbec-41dd-8f05-f83874302b5d"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"c2k3", "=", 
  RowBox[{"Union", "[", "c1kern3", "]"}]}]], "Input",ExpressionUUID->\
"8b4867c3-87b4-4a1f-8688-433544aaea88"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"0", ",", 
    FractionBox["1", "2"], ",", 
    FractionBox["1", "2"], ",", 
    FractionBox["1", "2"], ",", 
    FractionBox["1", "2"]}], "}"}], "}"}]], "Output",ExpressionUUID->\
"d1c33c8d-2764-4659-8bdc-037f85577b26"]
}, Open  ]],

Cell["\<\
Verifying that the computed solutions are really kernel elements can be done \
by\
\>", "Text",ExpressionUUID->"7fe50392-db90-4d3b-be2e-ab06873c0d53"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"KernelImputationListQ", "[", 
    RowBox[{"ExpGame9", ",", "#"}], "]"}], "&"}], "/@", 
  RowBox[{"{", 
   RowBox[{"c2k2", ",", "c2k3"}], "}"}]}]], "Input",ExpressionUUID->"e8588df1-\
1c91-4ff5-942d-49f3ac871ac9"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "True", "}"}], ",", 
   RowBox[{"{", "True", "}"}]}], "}"}]], "Output",ExpressionUUID->"4ec95400-\
19e7-4274-954a-5d1756a799b7"]
}, Open  ]],

Cell[TextData[{
 "For non-zero-monotonic games we are able to compute pre-kernel elements by \
invoking the function ",
 StyleBox["FindPreKernelSolution[]",
  FontWeight->"Bold"],
 ". The function works in the same vein as ",
 StyleBox["FindKernelSolution[]",
  FontWeight->"Bold"],
 ", since they are based on the same algorithm. Therefore, for zero-monotonic \
games they will compute the same results."
}], "Text",
 TextJustification->1,ExpressionUUID->"8fe9deac-1560-457b-95ef-feaef0553563"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"tc4", ",", "c1kern4"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"FindPreKernelSolution", "[", 
    RowBox[{"ExpGame9", ",", "pay91"}], "]"}], "]"}]}]], "Input",ExpressionUUI\
D->"8bdf7d24-2477-4795-9f97-7a1dc6643512"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.360421`", ",", 
   RowBox[{"{", 
    RowBox[{"{", 
     RowBox[{"0", ",", 
      FractionBox["1", "2"], ",", 
      FractionBox["1", "2"], ",", 
      FractionBox["1", "2"], ",", 
      FractionBox["1", "2"]}], "}"}], "}"}]}], "}"}]], "Output",ExpressionUUID\
->"8f5dde1e-2218-4227-918c-8389131ae710"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"c1kern3", "==", "c1kern4"}]], "Input",ExpressionUUID->"d3108413-f819-4bbe-8505-f2907956b905"],

Cell[BoxData["True"], "Output",ExpressionUUID->"cc629cb8-0c01-4455-b0ea-6ca6884a17a2"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"nuc9", "=", 
  RowBox[{"ModifiedNucleolus", "[", 
   RowBox[{"ExpGame9", ",", 
    RowBox[{"CallMinimize", " ", "\[Rule]", " ", "True"}]}], "]"}]}]], "Input",\
ExpressionUUID->"819bb69f-d4b3-4e1e-a05b-c989de628514"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["23", "120"], ",", 
   FractionBox["23", "60"], ",", 
   FractionBox["23", "60"], ",", 
   FractionBox["17", "40"], ",", 
   FractionBox["37", "60"]}], "}"}]], "Output",ExpressionUUID->"957424a5-8424-\
44bf-844b-565c08fdb027"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"nuc9", "=", 
  RowBox[{"Nucleolus", "[", "ExpGame9", "]"}]}]], "Input",ExpressionUUID->\
"73fce9ed-5629-4e11-969a-56525754e9ec"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["23", "120"], ",", 
   FractionBox["23", "60"], ",", 
   FractionBox["23", "60"], ",", 
   FractionBox["17", "40"], ",", 
   FractionBox["37", "60"]}], "}"}]], "Output",ExpressionUUID->"6d180d38-efc4-\
4ecd-8993-5975e01818ec"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelQ", "[", 
  RowBox[{"ExpGame9", ",", "nuc9"}], "]"}]], "Input",ExpressionUUID->\
"d2a45e35-9574-4249-ac48-5ba414b91560"],

Cell[BoxData[
 RowBox[{"{", "True", "}"}]], "Output",ExpressionUUID->"23cf4e37-b6e2-4bac-afd6-bb55445dbdcf"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BalancedSelectionQ", "[", 
  RowBox[{"ExpGame9", ",", "nuc9", ",", 
   RowBox[{"Tight", "\[Rule]", " ", "True"}]}], "]"}]], "Input",ExpressionUUID\
->"4d3011d0-871a-42c3-b461-17e7cae162da"],

Cell[BoxData["True"], "Output",ExpressionUUID->"f3a07497-3b6d-4ca5-9f7c-b221fbe5d816"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"prn9", "=", 
  RowBox[{"PreNucleolus", "[", 
   RowBox[{"ExpGame9", ",", 
    RowBox[{"CallMinimize", " ", "\[Rule]", " ", "True"}]}], "]"}]}]], "Input",\
ExpressionUUID->"ffd72cec-2d95-43f9-a835-a0f3cccf62e4"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["23", "120"], ",", 
   FractionBox["23", "60"], ",", 
   FractionBox["23", "60"], ",", 
   FractionBox["17", "40"], ",", 
   FractionBox["37", "60"]}], "}"}]], "Output",ExpressionUUID->"d2d7951d-fe44-\
4bf6-a81e-663ef8771739"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"prn9", "=", 
  RowBox[{"PreNucleolus", "[", 
   RowBox[{"ExpGame9", ",", 
    RowBox[{"CallMinimize", " ", "\[Rule]", " ", "False"}]}], 
   "]"}]}]], "Input",ExpressionUUID->"a14c2a00-8378-4e07-8894-95ed738790c3"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["23", "120"], ",", 
   FractionBox["23", "60"], ",", 
   FractionBox["23", "60"], ",", 
   FractionBox["17", "40"], ",", 
   FractionBox["37", "60"]}], "}"}]], "Output",ExpressionUUID->"95bcd4c6-03ff-\
45ab-a542-bdd3baa5751f"]
}, Open  ]],

Cell[TextData[{
 "For non-zero-monotonic games the pre-kernel and the kernel solution are \
different. Recall the following three person example given by ",
 ButtonBox["Maschler, Peleg and Shapley",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Maschler"],
 " (1979), p 316. The kernel solution is given by {20,0,15} satisfying \
individual rationality and the pre-kernel is found at {27.5,-5,17.5} where \
individual rationality is violated. Define the three person game by "
}], "Text",
 TextJustification->1,ExpressionUUID->"ae41f541-ec0c-4e55-a262-e76d99145c62"],

Cell[BoxData[
 RowBox[{"ExpGame91", ":=", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{"T", "=", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", "3"}], "}"}]}], ";", "\[IndentingNewLine]", 
    
    RowBox[{"Clear", "[", "v", "]"}], ";", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", "}"}], "]"}], "=", "0"}], ";", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", "1", "}"}], "]"}], "=", "0"}], ";", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", "2", "}"}], "]"}], "=", "0"}], ";", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", "3", "}"}], "]"}], "=", "0"}], ";", "\[IndentingNewLine]", 
    
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"1", ",", "2"}], "}"}], "]"}], "=", "20"}], ";", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"1", ",", "3"}], "}"}], "]"}], "=", "50"}], ";", 
    RowBox[{
     RowBox[{"v", "[", 
      RowBox[{"{", 
       RowBox[{"2", ",", "3"}], "}"}], "]"}], "=", "10"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"v", "[", "T", "]"}], "=", "40"}], ";"}], ")"}]}]], "Input",Expre\
ssionUUID->"b78e3d7a-979e-4e02-acf6-c16b8acfde28"],

Cell["\<\
and indeed we compute the kernel by relying on the LP approach\
\>", "Text",ExpressionUUID->"c7aed51f-0150-4cd3-ae32-1544e6509ff6"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Kernel", "[", "ExpGame91", "]"}]], "Input",ExpressionUUID->"378568ea-9858-4537-b812-259dceac99c1"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"25", ",", "0", ",", "15"}], "}"}]], "Output",ExpressionUUID->\
"83d564fe-1e41-4f02-b568-f03d0b06f3dc"]
}, Open  ]],

Cell["\<\
as well as by relying on the convergence algorithm by calling \
\>", "Text",ExpressionUUID->"ecd3e98e-8568-46cd-b44d-026da0ae4006"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ker91", "=", 
  RowBox[{"FindKernelSolution", "[", 
   RowBox[{"ExpGame91", ",", 
    RowBox[{"{", 
     RowBox[{"0", ",", "0", ",", "40"}], "}"}]}], "]"}]}]], "Input",Expression\
UUID->"3b56247f-d367-405d-a78f-ae8d0d9c79e7"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"25", ",", "0", ",", "15"}], "}"}]], "Output",ExpressionUUID->\
"dd826c87-50ce-41de-a1f8-0fa5aedcdeaa"]
}, Open  ]],

Cell["\<\
Invoking the function to compute the pre-kernel, we get exactly the required \
result.\
\>", "Text",ExpressionUUID->"6e00cf82-c5b7-43a0-813e-0b60a7be880e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"prk91", "=", 
  RowBox[{"FindPreKernelSolution", "[", 
   RowBox[{"ExpGame91", ",", 
    RowBox[{"{", 
     RowBox[{"40", ",", "0", ",", "0"}], "}"}]}], "]"}]}]], "Input",Expression\
UUID->"528519d1-4b25-452f-a90f-ea94a7af62ee"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["55", "2"], ",", 
   RowBox[{"-", "5"}], ",", 
   FractionBox["35", "2"]}], "}"}]], "Output",ExpressionUUID->"fbbb7b5c-2fcf-\
488c-927e-ecda283b4389"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"N", "[", "prk91", "]"}]], "Input",ExpressionUUID->"15badb5c-9811-4917-a70d-ce1ba8d19094"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"27.5`", ",", 
   RowBox[{"-", "5.`"}], ",", "17.5`"}], "}"}]], "Output",ExpressionUUID->\
"7668a2ce-ebed-40d9-93b6-7a22496c923f"]
}, Open  ]],

Cell[TextData[{
 "Now, we want to demonstrate some limitation of the Kernel computation \
associated with our approach by relying on the largest bi-symmetrical \
transfers. The core consists of a unique point",
 StyleBox[" ",
  FontWeight->"Bold"],
 "(1,1,1,2,2)",
 StyleBox[". ",
  FontWeight->"Bold"],
 " For this purpose, resume the game \"",
 StyleBox["ExpGame3",
  FontSlant->"Italic"],
 "\". ",
 ButtonBox["Maschler, Peleg and Shapley",
  BaseStyle->"Hyperlink",
  ButtonData:>"M. Maschler"],
 " (1979) found out that the Kernel is a line segment extending from the core \
point (1,1,1,2,2) to a boundary point of the imputation set. The Kernel of \
this game is"
}], "Text",
 TextJustification->1,ExpressionUUID->"10263290-f480-43dd-8d8b-5ec511142dbb"],

Cell[TextData[{
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{"K", "(", "\[CapitalGamma]", ")"}], " ", ":=", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{"t", ",", "t", ",", "t", ",", 
        FractionBox[
         RowBox[{"(", 
          RowBox[{"7", "-", 
           RowBox[{"3", " ", "t"}]}], ")"}], "2"], ",", 
        FractionBox[
         RowBox[{"(", 
          RowBox[{"7", "-", 
           RowBox[{"3", " ", "t"}]}], ")"}], "2"]}], "}"}], " ", ":", " ", 
      RowBox[{
      "0", "\[LessEqual]", " ", "t", " ", "\[LessEqual]", " ", "1"}]}], 
     "}"}]}], TraditionalForm]],ExpressionUUID->
  "3ef33cca-53f5-43f6-9e81-fe8beb1a06d9"],
 " and the pre-kernel  ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{
     SuperscriptBox["K", "*"], "(", "\[CapitalGamma]", ")"}], " ", ":=", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{"t", ",", "t", ",", "t", ",", 
        FractionBox[
         RowBox[{"(", 
          RowBox[{"7", "-", 
           RowBox[{"3", " ", "t"}]}], ")"}], "2"], ",", 
        FractionBox[
         RowBox[{"(", 
          RowBox[{"7", "-", 
           RowBox[{"3", " ", "t"}]}], ")"}], "2"]}], "}"}], " ", ":", " ", 
      RowBox[{
       RowBox[{"-", "0.2"}], "\[LessEqual]", " ", "t", " ", "\[LessEqual]", 
       " ", "1"}]}], "}"}]}], TraditionalForm]],ExpressionUUID->
  "1477142e-d62b-48be-bcca-5265bebd0dcb"],
 "."
}], "Text",
 TextAlignment->Center,ExpressionUUID->"4e85ec3e-ab64-4617-b9e4-3b0bc4d5bff2"],

Cell["\<\
According to the calculation of the first critical value, we see that the \
core of the game coincides with the least core of the game.  Let us construct \
some pre-kernel  elements from the line segment, this can be done by\
\>", "Text",
 TextJustification->1,ExpressionUUID->"ca1cf9cf-285b-4fc6-afc9-fbfdd2806214"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kerline", "=", 
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"t", ",", "t", ",", "t", ",", 
      FractionBox[
       RowBox[{"7", "-", " ", 
        RowBox[{"3", " ", "t"}]}], "2"], ",", 
      FractionBox[
       RowBox[{"7", "-", 
        RowBox[{"3", " ", "t", " "}]}], "2"]}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"t", ",", 
      FractionBox[
       RowBox[{"-", "3"}], "10"], ",", 
      FractionBox["11", "10"], ",", 
      FractionBox["1", "10"]}], "}"}]}], "]"}]}]], "Input",ExpressionUUID->\
"21e972c3-3506-4b92-aeee-529e2fffa7cc"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", 
      FractionBox["3", "10"]}], ",", 
     RowBox[{"-", 
      FractionBox["3", "10"]}], ",", 
     RowBox[{"-", 
      FractionBox["3", "10"]}], ",", 
     FractionBox["79", "20"], ",", 
     FractionBox["79", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", 
      FractionBox["1", "5"]}], ",", 
     RowBox[{"-", 
      FractionBox["1", "5"]}], ",", 
     RowBox[{"-", 
      FractionBox["1", "5"]}], ",", 
     FractionBox["19", "5"], ",", 
     FractionBox["19", "5"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", 
      FractionBox["1", "10"]}], ",", 
     RowBox[{"-", 
      FractionBox["1", "10"]}], ",", 
     RowBox[{"-", 
      FractionBox["1", "10"]}], ",", 
     FractionBox["73", "20"], ",", 
     FractionBox["73", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "0", ",", 
     FractionBox["7", "2"], ",", 
     FractionBox["7", "2"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1", "10"], ",", 
     FractionBox["1", "10"], ",", 
     FractionBox["1", "10"], ",", 
     FractionBox["67", "20"], ",", 
     FractionBox["67", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1", "5"], ",", 
     FractionBox["1", "5"], ",", 
     FractionBox["1", "5"], ",", 
     FractionBox["16", "5"], ",", 
     FractionBox["16", "5"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["3", "10"], ",", 
     FractionBox["3", "10"], ",", 
     FractionBox["3", "10"], ",", 
     FractionBox["61", "20"], ",", 
     FractionBox["61", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["2", "5"], ",", 
     FractionBox["2", "5"], ",", 
     FractionBox["2", "5"], ",", 
     FractionBox["29", "10"], ",", 
     FractionBox["29", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["11", "4"], ",", 
     FractionBox["11", "4"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["3", "5"], ",", 
     FractionBox["3", "5"], ",", 
     FractionBox["3", "5"], ",", 
     FractionBox["13", "5"], ",", 
     FractionBox["13", "5"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "10"], ",", 
     FractionBox["7", "10"], ",", 
     FractionBox["7", "10"], ",", 
     FractionBox["49", "20"], ",", 
     FractionBox["49", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["4", "5"], ",", 
     FractionBox["4", "5"], ",", 
     FractionBox["4", "5"], ",", 
     FractionBox["23", "10"], ",", 
     FractionBox["23", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["9", "10"], ",", 
     FractionBox["9", "10"], ",", 
     FractionBox["9", "10"], ",", 
     FractionBox["43", "20"], ",", 
     FractionBox["43", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["11", "10"], ",", 
     FractionBox["11", "10"], ",", 
     FractionBox["11", "10"], ",", 
     FractionBox["37", "20"], ",", 
     FractionBox["37", "20"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"170e46fe-259b-4284-b662-d87faadf1ef6"]
}, Open  ]],

Cell["\<\
Verifying that the constructed elements are really contained in the line \
segment that constitutes the kernel solution we use the function\
\>", "Text",ExpressionUUID->"736bbb3a-0de7-4163-ba4f-21ba97c26a2e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelQ", "[", 
  RowBox[{"ExpGame3", ",", "kerline"}], "]"}]], "Input",ExpressionUUID->\
"d8116da2-060e-45ef-9b55-62b4eef3df98"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "False", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", 
   "True", ",", "True", ",", "True", ",", "False"}], "}"}]], "Output",Expressi\
onUUID->"98d50a06-57e6-4682-b997-994ac86a6cf3"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationListQ", "[", 
  RowBox[{"ExpGame3", ",", "kerline"}], "]"}]], "Input",ExpressionUUID->\
"c92ffaa3-4846-4c23-92f7-7a6b93712e00"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "False", ",", "False", ",", "False", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", 
   "True", ",", "True", ",", "True", ",", "False"}], "}"}]], "Output",Expressi\
onUUID->"32b19417-b692-4b5a-bf31-6631bb26c696"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Kernel", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"c7095e21-1f68-43d2-90aa-f3af1365aad7"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}]], "Output",Expr\
essionUUID->"a83608c2-0f6d-44d3-b9c9-e0d489f3fd05"]
}, Open  ]],

Cell["\<\
This kernel solution is contained in the core and coincides with the \
Nucleolus of the game.\
\>", "Text",ExpressionUUID->"15b56be1-4001-46c8-9d65-5319db7378a4"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Nucleolus", "[", "ExpGame3", "]"}]], "Input",ExpressionUUID->"c63fa3e5-0697-4731-ae95-0da8e1e9fe39"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}]], "Output",Expr\
essionUUID->"aa90986d-75f4-493a-aad5-15de2ea0de42"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kersol", "=", 
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"Kernel", "[", 
     RowBox[{"ExpGame3", ",", 
      RowBox[{"EpsilonValue", "\[Rule]", " ", "j"}]}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"j", ",", "10"}], "}"}]}], "]"}]}]], "Input",ExpressionUUID->\
"25d716f6-34fd-4fe8-b5d8-9ee54e4a3035"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}]}], 
  "}"}]], "Output",ExpressionUUID->"c2ff9bcb-5bb2-4dac-baf6-1497ad57aabb"]
}, Open  ]],

Cell[TextData[{
 "By varying the critical value we see that we get in any case the same \
kernel result. This is caused due to the fact that the core consists of just \
a singleton. Enlarging the core by some epsilon values has no effect on the \
largest bi-symmetrical transfer and its associated midpoint. Clearly, the \
largest bi-symmetrical transfer varies if we enlarge the core by some epsilon \
values, but it still remains the largest transfer at the imputation computed. \
At the other kernel imputations the bi-symmetrical transfer is smaller than \
the value we will obtain at {1,1,1,2,2} ",
 ButtonBox["Meinhardt (2004)",
  BaseStyle->"Hyperlink",
  ButtonData:>"(2002b)"],
 ". The same happens if we rely on the function ",
 StyleBox["KernelCalculation[]",
  FontWeight->"Bold"],
 " that use a different procedure to compute kernel elements.  We obtain"
}], "Text",
 TextJustification->1,ExpressionUUID->"b09b9528-350d-4aca-95b7-0a0ec0d73706"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
   "sol31", ",", "obj31", ",", "const31", ",", "tra31", ",", "pay31"}], "}"}],
   "=", 
  RowBox[{"KernelCalculation", "[", 
   RowBox[{"ExpGame3", ",", 
    RowBox[{"EpsilonValue", "\[Rule]", " ", "4"}], ",", 
    RowBox[{"DisplayAllResults", "\[Rule]", " ", "True"}]}], "]"}]}]], "Input",\
ExpressionUUID->"2a00e29a-a1f8-4c86-ae4b-ae72c790fa0f"],

Cell[CellGroupData[{

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Game is zero-monotone? \"\>", "\[InvisibleSpace]", "False"}],
  SequenceForm["Game is zero-monotone? ", False],
  Editable->False]], "Print",ExpressionUUID->"b1360ff7-59a1-4b59-9a54-\
3b2e7cea65c5"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Core is nonempty? \"\>", "\[InvisibleSpace]", "True"}],
  SequenceForm["Core is nonempty? ", True],
  Editable->False]], "Print",ExpressionUUID->"7fdb2553-21bd-42cd-b042-\
c20b652bac0f"],

Cell[BoxData["\<\"Game is either zero-monotonic or has nonempty core\"\>"], \
"Print",ExpressionUUID->"9c677f24-8400-461b-8ed5-7301e6b6c957"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"A Kernel solution is: \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"x", "[", "1", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "2", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "3", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "4", "]"}], "\[Rule]", "2"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "5", "]"}], "\[Rule]", "2"}]}], "}"}]}],
  SequenceForm[
  "A Kernel solution is: ", {
   TUG`coop`CooperativeGames`x[1] -> 1, TUG`coop`CooperativeGames`x[2] -> 1, 
    TUG`coop`CooperativeGames`x[3] -> 1, TUG`coop`CooperativeGames`x[4] -> 2, 
    TUG`coop`CooperativeGames`x[5] -> 2}],
  Editable->False]], "Print",ExpressionUUID->"1204fde9-659b-4549-b6dd-\
e5d70efd2292"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{
    RowBox[{"x", "[", "1", "]"}], "+", 
    RowBox[{"x", "[", "2", "]"}], "+", 
    RowBox[{"x", "[", "3", "]"}], "+", 
    RowBox[{"x", "[", "4", "]"}], "+", 
    RowBox[{"x", "[", "5", "]"}]}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "1", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "2", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "3", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "4", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        RowBox[{"x", "[", "1", "]"}]}], "-", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        RowBox[{"x", "[", "1", "]"}]}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        RowBox[{"x", "[", "2", "]"}]}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        RowBox[{"x", "[", "1", "]"}]}], "-", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        RowBox[{"x", "[", "1", "]"}]}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        RowBox[{"x", "[", "2", "]"}]}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", 
        RowBox[{"x", "[", "4", "]"}]}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "1", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "2", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], "-", 
       RowBox[{"x", "[", "3", "]"}], "-", 
       RowBox[{"x", "[", "4", "]"}], "-", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", 
      RowBox[{"-", "4"}]}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"x", "[", "1", "]"}], "+", 
       RowBox[{"x", "[", "2", "]"}], "+", 
       RowBox[{"x", "[", "3", "]"}], "+", 
       RowBox[{"x", "[", "4", "]"}], "+", 
       RowBox[{"x", "[", "5", "]"}]}], "\[LessEqual]", "7"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["3", "2"], ",", 
     FractionBox["3", "2"], ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["3", "2"], ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["1", "6"], ",", 
     FractionBox["1", "2"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["3", "2"], ",", 
       FractionBox["3", "2"], ",", "4", ",", "0", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["3", "2"], ",", "4", ",", 
       FractionBox["3", "2"], ",", "0", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "2", ",", "2", ",", 
       FractionBox["1", "2"], ",", 
       FractionBox["1", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"4", ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["3", "2"], ",", "0", ",", "0"}], "}"}]}], "}"}]}], 
  "}"}]], "Output",ExpressionUUID->"8dff21fc-543d-4b8e-81c7-357f79522d2a"]
}, Open  ]],

Cell[TextData[{
 "In some case the ",
 StyleBox["n(n-1)/2",
  FontSlant->"Italic"],
 " initial LPs provide some additional kernel elements. These kernel \
candidates have been stored for the above example in the symbol ",
 StyleBox["pay31",
  FontSlant->"Italic"],
 " and we can test now with the command ",
 StyleBox["KernelImputationListQ[]",
  FontWeight->"Bold"],
 " if one or some of these candidates is an or are additional kernel \
element(s)."
}], "Text",
 TextJustification->1,ExpressionUUID->"7e5823ad-31ba-42f7-8c60-711d2f2815c9"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationListQ", "[", 
  RowBox[{"ExpGame3", ",", "pay31"}], "]"}]], "Input",ExpressionUUID->\
"8833e3d4-eac1-4561-b0c9-520613082d7a"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "False", ",", "False", ",", "True", ",", "False", ",", "False", ",", 
   "False", ",", "False", ",", "False", ",", "False", ",", "False", ",", 
   "False"}], "}"}]], "Output",ExpressionUUID->"60dcbbb4-7674-4858-857a-\
1f8a3724b07b"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"sol32", ",", "pay32"}], "}"}], "=", 
  RowBox[{"KernelCalculation", "[", 
   RowBox[{"ExpGame3", ",", 
    RowBox[{"EpsilonValue", "\[Rule]", " ", "21"}]}], "]"}]}]], "Input",Expres\
sionUUID->"84029e02-4587-41aa-8932-354043f00de8"],

Cell[CellGroupData[{

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Game is zero-monotone? \"\>", "\[InvisibleSpace]", "False"}],
  SequenceForm["Game is zero-monotone? ", False],
  Editable->False]], "Print",ExpressionUUID->"8b277636-bb83-41eb-a2cc-\
7ad4fef9b39c"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Core is nonempty? \"\>", "\[InvisibleSpace]", "True"}],
  SequenceForm["Core is nonempty? ", True],
  Editable->False]], "Print",ExpressionUUID->"1dc46c0b-b2e8-4f48-9f57-\
0798d006dcd7"],

Cell[BoxData["\<\"Game is either zero-monotonic or has nonempty core\"\>"], \
"Print",ExpressionUUID->"4149eb53-5d17-4b37-bd3e-8f966d729801"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"A Kernel solution is: \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"x", "[", "1", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "2", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "3", "]"}], "\[Rule]", "1"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "4", "]"}], "\[Rule]", "2"}], ",", 
     RowBox[{
      RowBox[{"x", "[", "5", "]"}], "\[Rule]", "2"}]}], "}"}]}],
  SequenceForm[
  "A Kernel solution is: ", {
   TUG`coop`CooperativeGames`x[1] -> 1, TUG`coop`CooperativeGames`x[2] -> 1, 
    TUG`coop`CooperativeGames`x[3] -> 1, TUG`coop`CooperativeGames`x[4] -> 2, 
    TUG`coop`CooperativeGames`x[5] -> 2}],
  Editable->False]], "Print",ExpressionUUID->"63e00126-4c66-4598-a4b0-\
04508e967130"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["8", "3"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["4", "3"], ",", 
       FractionBox["4", "3"], ",", 
       FractionBox["1", "6"], ",", 
       FractionBox["8", "3"], ",", 
       FractionBox["3", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["3", "2"], ",", 
       FractionBox["3", "2"], ",", "4", ",", "0", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["3", "2"], ",", "4", ",", 
       FractionBox["3", "2"], ",", "0", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "2", ",", "2", ",", 
       FractionBox["1", "2"], ",", 
       FractionBox["1", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"4", ",", 
       FractionBox["3", "2"], ",", 
       FractionBox["3", "2"], ",", "0", ",", "0"}], "}"}]}], "}"}]}], 
  "}"}]], "Output",ExpressionUUID->"8f94d247-2567-4ded-9a94-459f1350d9d6"]
}, Open  ]],

Cell["Let us look again on additional kernel elements.", "Text",ExpressionUUID->"8323a6ac-6c77-4e7b-be7e-f9764d83f2b9"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationListQ", "[", 
  RowBox[{"ExpGame3", ",", "pay32"}], "]"}]], "Input",ExpressionUUID->\
"15c616fb-01e2-495f-b769-ede8906acf6b"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "False", ",", "False", ",", "True", ",", "False", ",", "False", ",", 
   "False", ",", "False", ",", "False", ",", "False", ",", "False", ",", 
   "False"}], "}"}]], "Output",ExpressionUUID->"e0bccc18-346e-4d88-b859-\
8672fec1ce90"]
}, Open  ]],

Cell[TextData[{
 "In both cases we get the same kernel candidates by relying on the function ",
 StyleBox["KernelCalculation[]",
  FontWeight->"Bold"],
 "  which are not contained in the solution set.  Hence, we did not find any \
additional kernel solution, although the kernel is not a singleton.  But now \
we want provide a strategy to compute the complete kernel solution by using \
the dual game. This strategy could be successful in cases that the least core \
of the dual and the primal game are different. For a quick test we are \
looking on the nucleolus of the dual and the primal game. Let us define the \
dual game of ",
 StyleBox["ExpGame3.",
  FontSlant->"Italic"]
}], "Text",
 TextJustification->1,ExpressionUUID->"21d37f1c-ab9b-48ce-9510-45acf10e15f7"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"duvec", " ", "=", 
  RowBox[{"DualGame", "[", "ExpGame3", "]"}]}]], "Input",ExpressionUUID->\
"8b328a6f-6d94-4f43-b3d1-69cf418904c2"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "7", ",", "7", ",", "7", ",", "7", ",", "7", ",", "7", ",", "7", 
   ",", "3", ",", "3", ",", "7", ",", "3", ",", "3", ",", "3", ",", "3", ",", 
   "7", ",", "3", ",", "7", ",", "7", ",", "7", ",", "7", ",", "7", ",", "7", 
   ",", "7", ",", "7", ",", "7", ",", "7", ",", "7", ",", "7", ",", "7", ",", 
   "7", ",", "7"}], "}"}]], "Output",ExpressionUUID->"91231dae-a876-4f65-ad00-\
d7c4f1dcb959"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"DualExpGame3", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T3", ",", "duvec"}], "]"}], ";"}], ")"}]}], ";"}]], "Input",Exp\
ressionUUID->"2e814706-10d9-41c0-81a6-d417cc8b1bf3"],

Cell["The nucleolus of the dual is", "Text",ExpressionUUID->"2a0b3f6c-ed97-481b-9b53-e4f6ce8c04bf"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Nucleolus", "[", "DualExpGame3", "]"}]], "Input",ExpressionUUID->"5a13536c-da71-4a41-b9b2-20f96c54fe58"],

Cell[BoxData[
 TemplateBox[{
  "ConstrainedMin","lpsub","\"This problem is unbounded.\"",2,205,6,
   17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"f93b9cde-a73b-453c-8cec-ac97dcccb2fd"],

Cell[BoxData[
 TemplateBox[{
  "Transpose","nmtx",
   "\"The first two levels of \\!\\(\\*RowBox[{\\\"{\\\", \\\"}\\\"}]\\) \
cannot be transposed.\"",2,205,7,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"eda06db6-c326-4325-a373-b1e2be374db2"],

Cell[BoxData[
 TemplateBox[{
  "Transpose","argt",
   "\"\\!\\(\\*RowBox[{\\\"Transpose\\\"}]\\) called with \\!\\(\\*RowBox[{\\\
\"0\\\"}]\\) arguments; \\!\\(\\*RowBox[{\\\"1\\\"}]\\) or \
\\!\\(\\*RowBox[{\\\"2\\\"}]\\) arguments are expected.\"",2,205,8,
   17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"18629545-160a-4d3a-83ea-ed6ba102c973"],

Cell[BoxData[
 TemplateBox[{
  "Transpose","nmtx",
   "\"The first two levels of \\!\\(\\*RowBox[{\\\"{\\\", \\\"}\\\"}]\\) \
cannot be transposed.\"",2,205,9,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"70205776-e2ec-43d1-bb96-36a5825c90cb"],

Cell[BoxData[
 TemplateBox[{
  "NullSpace","matrix",
   "\"Argument \\!\\(\\*RowBox[{\\\"{\\\", RowBox[{RowBox[{\\\"Transpose\\\", \
\\\"[\\\", \\\"]\\\"}], \\\",\\\", RowBox[{\\\"Transpose\\\", \\\"[\\\", \
RowBox[{\\\"{\\\", \\\"}\\\"}], \\\"]\\\"}]}], \\\"}\\\"}]\\) at position \\!\
\\(\\*RowBox[{\\\"1\\\"}]\\) is not a non-empty rectangular matrix.\"",2,205,
   10,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"fb72415d-b662-4756-bd9a-054808713ca6"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["7", "5"], ",", 
   FractionBox["7", "5"], ",", 
   FractionBox["7", "5"], ",", 
   FractionBox["7", "5"], ",", 
   FractionBox["7", "5"]}], "}"}]], "Output",ExpressionUUID->"56776ee9-f320-\
45c9-a610-fc2559cc98ee"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData["nuc3"], "Input",ExpressionUUID->"3fae637d-9667-439f-96d9-39e3307d203d"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}]], "Output",Expr\
essionUUID->"a4c5e08c-4441-4e01-9423-7295aa2405ad"]
}, Open  ]],

Cell["Note first that the dual is not a zero-monotonic game.", "Text",ExpressionUUID->"d6af9c50-dd9f-4d2a-8bdd-92896f372d93"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "DualExpGame3", "]"}]], "Input",ExpressionUUID->"207884ab-fef6-4cd9-94c6-7e9bfa3a645d"],

Cell[BoxData["False"], "Output",ExpressionUUID->"2eb887a1-1979-4d89-88c8-c0d9e90c1530"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"duker3", ",", "dupay3"}], "}"}], "=", 
  RowBox[{"KernelCalculation", "[", 
   RowBox[{"DualExpGame3", ",", 
    RowBox[{"EpsilonValue", "\[Rule]", " ", "7"}], ",", 
    RowBox[{"SetGameToNonZeroMonotonic", "\[Rule]", " ", "True"}]}], 
   "]"}]}]], "Input",ExpressionUUID->"922d965d-8522-448c-964f-5745803166ec"],

Cell[CellGroupData[{

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Game is zero-monotone? \"\>", "\[InvisibleSpace]", "False"}],
  SequenceForm["Game is zero-monotone? ", False],
  Editable->False]], "Print",ExpressionUUID->"e3bc1432-f341-4020-8d12-\
42f21c2b8e37"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Core is nonempty? \"\>", "\[InvisibleSpace]", "False"}],
  SequenceForm["Core is nonempty? ", False],
  Editable->False]], "Print",ExpressionUUID->"24145bfb-38b1-4fa3-b65f-\
8070d98ba053"],

Cell[BoxData["\<\"Game is not zero-monotonic and has empty core\"\>"], "Print",ExpressionUUID->"c72cbd45-b5b5-493e-8ce1-f534d7ea2d3b"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"A Kernel solution is: \"\>", "\[InvisibleSpace]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"x", "[", "1", "]"}], "\[Rule]", 
      FractionBox["7", "5"]}], ",", 
     RowBox[{
      RowBox[{"x", "[", "2", "]"}], "\[Rule]", 
      FractionBox["7", "5"]}], ",", 
     RowBox[{
      RowBox[{"x", "[", "3", "]"}], "\[Rule]", 
      FractionBox["7", "5"]}], ",", 
     RowBox[{
      RowBox[{"x", "[", "4", "]"}], "\[Rule]", 
      FractionBox["7", "5"]}], ",", 
     RowBox[{
      RowBox[{"x", "[", "5", "]"}], "\[Rule]", 
      FractionBox["7", "5"]}]}], "}"}]}],
  SequenceForm[
  "A Kernel solution is: ", {
   TUG`coop`CooperativeGames`x[1] -> Rational[7, 5], 
    TUG`coop`CooperativeGames`x[2] -> Rational[7, 5], 
    TUG`coop`CooperativeGames`x[3] -> Rational[7, 5], 
    TUG`coop`CooperativeGames`x[4] -> Rational[7, 5], 
    TUG`coop`CooperativeGames`x[5] -> Rational[7, 5]}],
  Editable->False]], "Print",ExpressionUUID->"14e19600-3190-4f2b-bfa2-\
a733772760ca"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "5"], ",", 
     FractionBox["7", "5"], ",", 
     FractionBox["7", "5"], ",", 
     FractionBox["7", "5"], ",", 
     FractionBox["7", "5"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "0", ",", "0", ",", 
       FractionBox["7", "2"], ",", 
       FractionBox["7", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "0", ",", 
       FractionBox["7", "2"], ",", "0", ",", 
       FractionBox["7", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "0", ",", 
       FractionBox["7", "2"], ",", 
       FractionBox["7", "2"], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", 
       FractionBox["7", "2"], ",", "0", ",", "0", ",", 
       FractionBox["7", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", 
       FractionBox["7", "2"], ",", "0", ",", 
       FractionBox["7", "2"], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", 
       FractionBox["7", "2"], ",", 
       FractionBox["7", "2"], ",", "0", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["7", "5"], ",", 
       FractionBox["7", "5"], ",", 
       FractionBox["7", "5"], ",", 
       FractionBox["7", "5"], ",", 
       FractionBox["7", "5"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["7", "2"], ",", "0", ",", "0", ",", "0", ",", 
       FractionBox["7", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["7", "2"], ",", "0", ",", "0", ",", 
       FractionBox["7", "2"], ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["7", "2"], ",", "0", ",", 
       FractionBox["7", "2"], ",", "0", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["7", "2"], ",", 
       FractionBox["7", "2"], ",", "0", ",", "0", ",", "0"}], "}"}]}], 
    "}"}]}], "}"}]], "Output",ExpressionUUID->"3a20185c-c565-4c21-8551-\
f70f6d80eb28"]
}, Open  ]],

Cell["\<\
But note that you should use the option for non zero-monotonic games with \
care. The algorithm works quite well for zero-monotonic games, using the \
above option can cause an infinite loop for an non zero-monotonic game.  \
\>", "Text",
 TextAlignment->Left,
 TextJustification->1,ExpressionUUID->"45220a0c-5458-4a86-8b47-b87727ab074a"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationListQ", "[", 
  RowBox[{"ExpGame3", ",", "dupay3"}], "]"}]], "Input",ExpressionUUID->\
"49bcf303-9ea3-4c0b-bf1b-dcee611a9047"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "False", ",", "False", ",", "False", ",", "False", ",", 
   "False", ",", "False", ",", "False", ",", "False", ",", "False", ",", 
   "False"}], "}"}]], "Output",ExpressionUUID->"9209d42e-8e67-47f1-9370-\
d5ae6109739c"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"First", "[", "dupay3", "]"}]], "Input",ExpressionUUID->"6bc66c25-936e-4ef7-86ed-20ba502c3706"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", 
   FractionBox["7", "2"], ",", 
   FractionBox["7", "2"]}], "}"}]], "Output",ExpressionUUID->"346a79fc-65e1-\
4828-a94f-51837d272d53"]
}, Open  ]],

Cell["\<\
This is the second extreme point of the Kernel segment given by\
\>", "Text",ExpressionUUID->"19a71702-c24c-4836-abcf-b6aa1dee6339"],

Cell[CellGroupData[{

Cell[BoxData["kerline"], "Input",ExpressionUUID->"c72023c0-ea96-4f36-9962-cc6a285ac30a"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", 
      FractionBox["3", "10"]}], ",", 
     RowBox[{"-", 
      FractionBox["3", "10"]}], ",", 
     RowBox[{"-", 
      FractionBox["3", "10"]}], ",", 
     FractionBox["79", "20"], ",", 
     FractionBox["79", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", 
      FractionBox["1", "5"]}], ",", 
     RowBox[{"-", 
      FractionBox["1", "5"]}], ",", 
     RowBox[{"-", 
      FractionBox["1", "5"]}], ",", 
     FractionBox["19", "5"], ",", 
     FractionBox["19", "5"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", 
      FractionBox["1", "10"]}], ",", 
     RowBox[{"-", 
      FractionBox["1", "10"]}], ",", 
     RowBox[{"-", 
      FractionBox["1", "10"]}], ",", 
     FractionBox["73", "20"], ",", 
     FractionBox["73", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "0", ",", 
     FractionBox["7", "2"], ",", 
     FractionBox["7", "2"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1", "10"], ",", 
     FractionBox["1", "10"], ",", 
     FractionBox["1", "10"], ",", 
     FractionBox["67", "20"], ",", 
     FractionBox["67", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1", "5"], ",", 
     FractionBox["1", "5"], ",", 
     FractionBox["1", "5"], ",", 
     FractionBox["16", "5"], ",", 
     FractionBox["16", "5"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["3", "10"], ",", 
     FractionBox["3", "10"], ",", 
     FractionBox["3", "10"], ",", 
     FractionBox["61", "20"], ",", 
     FractionBox["61", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["2", "5"], ",", 
     FractionBox["2", "5"], ",", 
     FractionBox["2", "5"], ",", 
     FractionBox["29", "10"], ",", 
     FractionBox["29", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["11", "4"], ",", 
     FractionBox["11", "4"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["3", "5"], ",", 
     FractionBox["3", "5"], ",", 
     FractionBox["3", "5"], ",", 
     FractionBox["13", "5"], ",", 
     FractionBox["13", "5"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "10"], ",", 
     FractionBox["7", "10"], ",", 
     FractionBox["7", "10"], ",", 
     FractionBox["49", "20"], ",", 
     FractionBox["49", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["4", "5"], ",", 
     FractionBox["4", "5"], ",", 
     FractionBox["4", "5"], ",", 
     FractionBox["23", "10"], ",", 
     FractionBox["23", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["9", "10"], ",", 
     FractionBox["9", "10"], ",", 
     FractionBox["9", "10"], ",", 
     FractionBox["43", "20"], ",", 
     FractionBox["43", "20"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["11", "10"], ",", 
     FractionBox["11", "10"], ",", 
     FractionBox["11", "10"], ",", 
     FractionBox["37", "20"], ",", 
     FractionBox["37", "20"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"165f386a-c205-4c8c-8263-8d55d6e17f2e"]
}, Open  ]],

Cell["By invoking the function FindKernelSolution[] we find", "Text",ExpressionUUID->"683cf701-555e-4bd2-9db5-d17c10279c4c"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kersol30", "=", 
  RowBox[{"FindKernelSolution", "[", 
   RowBox[{"ExpGame3", ",", 
    RowBox[{"{", 
     RowBox[{"0", ",", "0", ",", "0", ",", "0", ",", "7"}], "}"}]}], 
   "]"}]}]], "Input",ExpressionUUID->"c3f5fe68-8f85-4b90-9aad-8e18255b25c7"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", 
   FractionBox["7", "2"], ",", 
   FractionBox["7", "2"]}], "}"}]], "Output",ExpressionUUID->"ef518fb4-a7c9-\
44e3-8f3c-957eff67c326"]
}, Open  ]],

Cell["\<\
and by computing kernel elements by the list of permutations from the vector \
{7,0,0,0,0} we get\
\>", "Text",ExpressionUUID->"1b693406-4f1a-4561-9c55-7757ea8da704"],

Cell[BoxData[
 RowBox[{
  RowBox[{"permut", "=", 
   RowBox[{"Permutations", "[", 
    RowBox[{"{", 
     RowBox[{"7", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}], "]"}]}], 
  ";"}]], "Input",ExpressionUUID->"8c442cc7-a549-44a3-b651-6b74d76587b2"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kerper", "=", 
  RowBox[{
   RowBox[{"FindKernelSolution", "[", 
    RowBox[{"ExpGame3", ",", "permut"}], "]"}], "//", "Union"}]}]], "Input",Ex\
pressionUUID->"262dd938-0067-48e6-a299-be56d565e933"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"0", ",", "0", ",", "0", ",", 
    FractionBox["7", "2"], ",", 
    FractionBox["7", "2"]}], "}"}], "}"}]], "Output",ExpressionUUID->\
"8f316b64-3a35-4574-9641-9670028cbd7e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationListQ", "[", 
  RowBox[{"ExpGame3", ",", "kerper"}], "]"}]], "Input",ExpressionUUID->\
"79936093-071e-471a-ace3-110903b8739b"],

Cell[BoxData[
 RowBox[{"{", "True", "}"}]], "Output",ExpressionUUID->"c96b666b-05e3-4995-98d6-7562b3368d85"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kersol31", "=", 
  RowBox[{
   RowBox[{"FindKernelSolution", "[", 
    RowBox[{"ExpGame3", ",", "pay31"}], "]"}], "//", "Union"}]}]], "Input",Exp\
ressionUUID->"f1a70ac5-2fb1-464d-a150-458e18cbdf41"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], 
  "}"}]], "Output",ExpressionUUID->"7e7dd9cb-c3d3-4426-ac7a-94edb0d3807e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"kersol32", "=", 
  RowBox[{
   RowBox[{"FindKernelSolution", "[", 
    RowBox[{"ExpGame3", ",", "pay32"}], "]"}], "//", "Union"}]}]], "Input",Exp\
ressionUUID->"5bd2be81-d86f-4794-a1d6-46aa92e66793"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"1", ",", "1", ",", "1", ",", "2", ",", "2"}], "}"}], 
  "}"}]], "Output",ExpressionUUID->"c1aac3f9-d33f-4534-93dc-9769308841d3"]
}, Open  ]],

Cell["\<\
Finally,we verify that the computed solutions are kernel elements by calling \
again\
\>", "Text",ExpressionUUID->"2eed489f-231a-4549-b0c2-2770b02969fa"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"KernelImputationListQ", "[", 
  RowBox[{"ExpGame3", ",", "kersol32"}], "]"}]], "Input",ExpressionUUID->\
"764ea187-8deb-40bc-867b-70f5d560ae3e"],

Cell[BoxData[
 RowBox[{"{", "True", "}"}]], "Output",ExpressionUUID->"5651dd87-6ef1-48e2-a1c7-7bb7d44e036e"]
}, Open  ]],

Cell["\<\
Now let us check whether the payoffs are balancing the excesses. We can check \
this by invoking the function \
\>", "Text",
 TextJustification->1,ExpressionUUID->"15378f69-97c2-41bf-96ba-61351ce124cc"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AllMaxSurpluses", "[", 
  RowBox[{"ExpGame3", ",", "kerline", ",", 
   RowBox[{"DisplayMatrixForm", "\[Rule]", " ", "True"}]}], "]"}]], "Input",Ex\
pressionUUID->"53c993a5-9e19-4484-b596-f3af4ff22230"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"1", ",", "2"}], "}"}], "]"}]},
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"2", ",", "1"}], "}"}], "]"}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"1", ",", "3"}], "}"}], "]"}]},
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"3", ",", "1"}], "}"}], "]"}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"1", ",", "4"}], "}"}], "]"}]},
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"4", ",", "1"}], "}"}], "]"}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"1", ",", "5"}], "}"}], "]"}]},
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"5", ",", "1"}], "}"}], "]"}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"2", ",", "3"}], "}"}], "]"}]},
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"3", ",", "2"}], "}"}], "]"}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"2", ",", "4"}], "}"}], "]"}]},
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"4", ",", "2"}], "}"}], "]"}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"2", ",", "5"}], "}"}], "]"}]},
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"5", ",", "2"}], "}"}], "]"}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"3", ",", "4"}], "}"}], "]"}]},
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"4", ",", "3"}], "}"}], "]"}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"3", ",", "5"}], "}"}], "]"}]},
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"5", ",", "3"}], "}"}], "]"}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"4", ",", "5"}], "}"}], "]"}]},
          {
           RowBox[{"sij", "[", 
            RowBox[{"{", 
             RowBox[{"5", ",", "4"}], "}"}], "]"}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["13", "20"]},
          {
           FractionBox["13", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["13", "20"]},
          {
           FractionBox["13", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "10"]},
          {
           FractionBox["13", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "10"]},
          {
           FractionBox["13", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["13", "20"]},
          {
           FractionBox["13", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "10"]},
          {
           FractionBox["13", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "10"]},
          {
           FractionBox["13", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "10"]},
          {
           FractionBox["13", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "10"]},
          {
           FractionBox["13", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["13", "20"]},
          {
           FractionBox["13", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "5"]},
          {
           FractionBox["3", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "5"]},
          {
           FractionBox["3", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "5"]},
          {
           FractionBox["3", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "5"]},
          {
           FractionBox["3", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "5"]},
          {
           FractionBox["3", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "5"]},
          {
           FractionBox["3", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "5"]},
          {
           FractionBox["3", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "5"]},
          {
           FractionBox["3", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "5"]},
          {
           FractionBox["3", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "5"]},
          {
           FractionBox["3", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["11", "20"]},
          {
           FractionBox["11", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["11", "20"]},
          {
           FractionBox["11", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["11", "20"]},
          {
           FractionBox["11", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["11", "20"]},
          {
           FractionBox["11", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["11", "20"]},
          {
           FractionBox["11", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["11", "20"]},
          {
           FractionBox["11", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["11", "20"]},
          {
           FractionBox["11", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["11", "20"]},
          {
           FractionBox["11", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["11", "20"]},
          {
           FractionBox["11", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["11", "20"]},
          {
           FractionBox["11", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "2"]},
          {
           FractionBox["1", "2"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "2"]},
          {
           FractionBox["1", "2"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "2"]},
          {
           FractionBox["1", "2"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "2"]},
          {
           FractionBox["1", "2"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "2"]},
          {
           FractionBox["1", "2"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "2"]},
          {
           FractionBox["1", "2"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "2"]},
          {
           FractionBox["1", "2"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "2"]},
          {
           FractionBox["1", "2"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "2"]},
          {
           FractionBox["1", "2"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "2"]},
          {
           FractionBox["1", "2"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "20"]},
          {
           FractionBox["9", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "20"]},
          {
           FractionBox["9", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "20"]},
          {
           FractionBox["9", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "20"]},
          {
           FractionBox["9", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "20"]},
          {
           FractionBox["9", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "20"]},
          {
           FractionBox["9", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "20"]},
          {
           FractionBox["9", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "20"]},
          {
           FractionBox["9", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "20"]},
          {
           FractionBox["9", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["9", "20"]},
          {
           FractionBox["9", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["2", "5"]},
          {
           FractionBox["2", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["2", "5"]},
          {
           FractionBox["2", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["2", "5"]},
          {
           FractionBox["2", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["2", "5"]},
          {
           FractionBox["2", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["2", "5"]},
          {
           FractionBox["2", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["2", "5"]},
          {
           FractionBox["2", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["2", "5"]},
          {
           FractionBox["2", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["2", "5"]},
          {
           FractionBox["2", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["2", "5"]},
          {
           FractionBox["2", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["2", "5"]},
          {
           FractionBox["2", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["7", "20"]},
          {
           FractionBox["7", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["7", "20"]},
          {
           FractionBox["7", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["7", "20"]},
          {
           FractionBox["7", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["7", "20"]},
          {
           FractionBox["7", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["7", "20"]},
          {
           FractionBox["7", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["7", "20"]},
          {
           FractionBox["7", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["7", "20"]},
          {
           FractionBox["7", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["7", "20"]},
          {
           FractionBox["7", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["7", "20"]},
          {
           FractionBox["7", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["7", "20"]},
          {
           FractionBox["7", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "10"]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "10"]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "10"]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "10"]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "10"]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "10"]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "10"]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "10"]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "10"]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "10"]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "4"]},
          {
           FractionBox["1", "4"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "4"]},
          {
           FractionBox["1", "4"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "4"]},
          {
           FractionBox["1", "4"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "4"]},
          {
           FractionBox["1", "4"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "4"]},
          {
           FractionBox["1", "4"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "4"]},
          {
           FractionBox["1", "4"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "4"]},
          {
           FractionBox["1", "4"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "4"]},
          {
           FractionBox["1", "4"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "4"]},
          {
           FractionBox["1", "4"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "4"]},
          {
           FractionBox["1", "4"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "5"]},
          {
           FractionBox["1", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "5"]},
          {
           FractionBox["1", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "5"]},
          {
           FractionBox["1", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "5"]},
          {
           FractionBox["1", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "5"]},
          {
           FractionBox["1", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "5"]},
          {
           FractionBox["1", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "5"]},
          {
           FractionBox["1", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "5"]},
          {
           FractionBox["1", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "5"]},
          {
           FractionBox["1", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "5"]},
          {
           FractionBox["1", "5"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "20"]},
          {
           FractionBox["3", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "20"]},
          {
           FractionBox["3", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "20"]},
          {
           FractionBox["3", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "20"]},
          {
           FractionBox["3", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "20"]},
          {
           FractionBox["3", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "20"]},
          {
           FractionBox["3", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "20"]},
          {
           FractionBox["3", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "20"]},
          {
           FractionBox["3", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "20"]},
          {
           FractionBox["3", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["3", "20"]},
          {
           FractionBox["3", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "10"]},
          {
           FractionBox["1", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "10"]},
          {
           FractionBox["1", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "10"]},
          {
           FractionBox["1", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "10"]},
          {
           FractionBox["1", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "10"]},
          {
           FractionBox["1", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "10"]},
          {
           FractionBox["1", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "10"]},
          {
           FractionBox["1", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "10"]},
          {
           FractionBox["1", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "10"]},
          {
           FractionBox["1", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "10"]},
          {
           FractionBox["1", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "20"]},
          {
           FractionBox["1", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "20"]},
          {
           FractionBox["1", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "20"]},
          {
           FractionBox["1", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "20"]},
          {
           FractionBox["1", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "20"]},
          {
           FractionBox["1", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "20"]},
          {
           FractionBox["1", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "20"]},
          {
           FractionBox["1", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "20"]},
          {
           FractionBox["1", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "20"]},
          {
           FractionBox["1", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           FractionBox["1", "20"]},
          {
           FractionBox["1", "20"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {"0"},
          {"0"}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {"0"},
          {"0"}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {"0"},
          {"0"}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {"0"},
          {"0"}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {"0"},
          {"0"}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {"0"},
          {"0"}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {"0"},
          {"0"}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {"0"},
          {"0"}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {"0"},
          {"0"}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {"0"},
          {"0"}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]},
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]},
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]},
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]},
          {
           FractionBox["3", "10"]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", 
       TagBox[GridBox[{
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]},
          {
           RowBox[{"-", 
            FractionBox["1", "20"]}]}
         },
         GridBoxAlignment->{
          "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
           "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
         GridBoxSpacings->{"Columns" -> {
             Offset[0.27999999999999997`], {
              Offset[0.5599999999999999]}, 
             Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
             Offset[0.2], {
              Offset[0.4]}, 
             Offset[0.2]}, "RowsIndexed" -> {}}],
        Column], "\[NoBreak]", ")"}]}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"58545167-8b6d-42f9-\
abab-3d7657fb4576"]
}, Open  ]],

Cell["\<\
If one is just interested in a special pair of players, in our example for \
the pair {3,4}, then one should call\
\>", "Text",
 TextJustification->1,ExpressionUUID->"7e54def8-864b-49cb-8bb2-8c63ae96a05d"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MaxSurplus", "[", 
  RowBox[{"ExpGame3", ",", "3", ",", "4", ",", "kerline"}], "]"}]], "Input",Ex\
pressionUUID->"50f7c592-5dcd-4415-9088-55f8b7c3f4af"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["9", "10"], ",", 
   FractionBox["3", "5"], ",", 
   FractionBox["11", "20"], ",", 
   FractionBox["1", "2"], ",", 
   FractionBox["9", "20"], ",", 
   FractionBox["2", "5"], ",", 
   FractionBox["7", "20"], ",", 
   FractionBox["3", "10"], ",", 
   FractionBox["1", "4"], ",", 
   FractionBox["1", "5"], ",", 
   FractionBox["3", "20"], ",", 
   FractionBox["1", "10"], ",", 
   FractionBox["1", "20"], ",", "0", ",", 
   RowBox[{"-", 
    FractionBox["1", "20"]}]}], "}"}]], "Output",ExpressionUUID->"560ff0a3-\
68c7-4330-9806-7a8f78179784"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MaxSurplus", "[", 
  RowBox[{"ExpGame3", ",", "4", ",", "3", ",", "kerline"}], "]"}]], "Input",Ex\
pressionUUID->"b9c2934b-14e7-460b-89f6-e2796fad22d9"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["13", "20"], ",", 
   FractionBox["3", "5"], ",", 
   FractionBox["11", "20"], ",", 
   FractionBox["1", "2"], ",", 
   FractionBox["9", "20"], ",", 
   FractionBox["2", "5"], ",", 
   FractionBox["7", "20"], ",", 
   FractionBox["3", "10"], ",", 
   FractionBox["1", "4"], ",", 
   FractionBox["1", "5"], ",", 
   FractionBox["3", "20"], ",", 
   FractionBox["1", "10"], ",", 
   FractionBox["1", "20"], ",", "0", ",", 
   FractionBox["3", "10"]}], "}"}]], "Output",ExpressionUUID->"d4b81db9-b0d7-\
4817-939b-cb05c3ff53df"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["4.4. Unanimity Coordinates",
 BaseStyle->"Hyperlink",
 ButtonData:>"4.4."]], "Subsubsection",
 CellTags->
  "Unanimity \
Coordinates",ExpressionUUID->"4be80269-b4e2-42bb-98fc-36976897c6ea"],

Cell[TextData[{
 "The package ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 " provides also a small set of functions related to unanimity coordinates. \
We want to demonstrate the use of these functions for an example given by ",
 ButtonBox["Rafels and Ybern",
  BaseStyle->"Hyperlink",
  ButtonData:>"C. Rafels"],
 " (1995) on page 120. The example is a 5-player  game with the following \
values:"
}], "Text",
 TextJustification->1,ExpressionUUID->"00268cef-6244-4fab-af89-3e9cac39b931"],

Cell[BoxData[
 RowBox[{
  RowBox[{"worth", "=", 
   RowBox[{"{", 
    RowBox[{
    "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "50.2", ",", 
     "49.7", ",", "47.1", ",", "55.8", ",", "53.3", ",", "101.3", ",", 
     "137.6", ",", "130.8", ",", "131.2", ",", "188.4", ",", "149.7", ",", 
     "229.5", ",", "259.6", ",", "239.3", ",", "278", ",", "428.2", ",", 
     "289.1", ",", "308.8", ",", "428.2", ",", "432.8", ",", "471.9", ",", 
     "555.7", ",", "756.5", ",", "772.5", ",", "712.8", ",", "1209.2"}], 
    "}"}]}], ";"}]], "Input",ExpressionUUID->"b2aae96d-a562-4695-932e-\
8a8a01a57189"],

Cell["The game is defined by ", "Text",ExpressionUUID->"6dc0ad26-58dc-47bb-8649-8a0df103455a"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame9", ":=", 
   RowBox[{"(", 
    RowBox[{"DefineGame", "[", 
     RowBox[{"T3", ",", "worth", ",", 
      RowBox[{"RationalApproximate", "\[Rule]", " ", "False"}]}], "]"}], 
    ")"}]}], ";"}]], "Input",ExpressionUUID->"07772a75-d0a7-4f7f-9109-\
013ba0c42d13"],

Cell[TextData[{
 "Among other things, we can evaluate all unanimity coordinates of the game \
\"",
 StyleBox["ExpGame9",
  FontSlant->"Italic"],
 "\" with the command"
}], "Text",ExpressionUUID->"7068849d-2704-4891-8c11-3c9a89d1b3d7"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"UnanimityCoordinates", "[", "ExpGame9", "]"}]], "Input",ExpressionUU\
ID->"caf2e94f-2e73-4e42-a4bc-ad2a61465604"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "50.2`", ",", 
   "49.7`", ",", "47.1`", ",", "55.8`", ",", "53.3`", ",", "101.3`", ",", 
   "137.6`", ",", "130.8`", ",", "131.2`", ",", "188.4`", ",", 
   RowBox[{"-", "3.500000000000014`"}], ",", "30.899999999999977`", ",", 
   "16.00000000000003`", ",", "11.699999999999989`", ",", 
   "41.30000000000001`", ",", "136.89999999999998`", ",", 
   "3.700000000000017`", ",", 
   RowBox[{"-", "13.299999999999955`"}], ",", "0.9000000000000057`", ",", 
   RowBox[{"-", "17.599999999999994`"}], ",", 
   RowBox[{"-", "3.30000000000004`"}], ",", "37.39999999999998`", ",", 
   RowBox[{"-", "8.599999999999937`"}], ",", 
   RowBox[{"-", "2.80000000000004`"}], ",", 
   RowBox[{"-", "3.500000000000057`"}], ",", "37.60000000000048`"}], 
  "}"}]], "Output",ExpressionUUID->"f51de328-738b-4bb4-8891-268f15cfabc9"]
}, Open  ]],

Cell["\<\
Furthermore, we can extract the minimum unanimity coordinates of each \
coalition size by\
\>", "Text",ExpressionUUID->"4b8f45d3-d328-45d7-8c7e-bf7d1678a110"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MinUnanimityCoordinates", "[", "ExpGame9", "]"}]], "Input",Expressio\
nUUID->"16071bea-8e37-413b-9e46-dc9c7be54cfe"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "47.1`", ",", 
   RowBox[{"-", "17.599999999999994`"}], ",", 
   RowBox[{"-", "8.599999999999937`"}], ",", "37.60000000000048`"}], 
  "}"}]], "Output",ExpressionUUID->"6d253b64-7762-48a3-a5ca-50efa412f0c3"]
}, Open  ]],

Cell[TextData[{
 "In addition to these functions we can also verify  the convexity property \
by relying on unanimity coordinates. The following sufficient condition of \
convexity worked out in ",
 ButtonBox["Rafels and Ybern",
  BaseStyle->"Hyperlink",
  ButtonData:>"C. Rafels"],
 " (1995) in Corollary 2.1 is implemented in the function ",
 StyleBox["EvalSumMinCoord[]. ",
  FontWeight->"Bold"],
 "First recall that the unanimity coordinates are defined by"
}], "Text",
 TextJustification->1,
 CellTags->"(1995)",ExpressionUUID->"13b575d7-c02f-442d-8df3-27d3d64dbd07"],

Cell[TextData[{
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{
     SubscriptBox["\[Lambda]", "R"], ":=", " ", 
     RowBox[{
      SubscriptBox["\[Sum]", 
       RowBox[{"S", " ", "\[Subset]", "R"}]], " ", 
      RowBox[{
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"-", "1"}], ")"}], 
        RowBox[{"r", "-", "s"}]], " ", 
       RowBox[{"v", "(", "S", ")"}]}]}]}], ","}], TraditionalForm]],
  ExpressionUUID->"b8ae487d-91f0-4b4a-8c8d-fbd1879efdc5"],
 " for all ",
 StyleBox["R \[SubsetEqual] N,S,R\[NotEqual]",
  FontSlant->"Italic"],
 "0."
}], "Text",
 TextAlignment->Center,
 CellTags->"(1995)",ExpressionUUID->"a0d6e87a-5c93-40cf-8f26-fd7555a3658a"],

Cell[TextData[{
 "A sufficient condition of convexity of a game ",
 StyleBox["v ",
  FontSlant->"Italic"],
 "in terms of unanimity coordinates is given by"
}], "Text",
 CellTags->"(1995)",ExpressionUUID->"0b263f13-749f-423f-8534-6e6493ee890f"],

Cell[TextData[{
 "if for all ",
 StyleBox["k",
  FontSlant->"Italic"],
 "=",
 StyleBox["0,...,n-2",
  FontSlant->"Italic"],
 " ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{
     UnderoverscriptBox["\[Sum]", 
      RowBox[{"j", "=", "0"}], "k"], 
     RowBox[{
      FractionBox[
       RowBox[{"k", "!"}], 
       RowBox[{
        RowBox[{"j", "!"}], " ", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"k", "-", "j"}], ")"}], "!"}]}]], " ", 
      SubscriptBox["\[Alpha]", "j"]}]}], " ", "\[GreaterEqual]", " ", "0"}], 
   TraditionalForm]],ExpressionUUID->"a0ef6928-ae2a-4cb3-a8d0-45e7fb4af712"],
 ", then the game is convex, where ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["\[Alpha]", "k"], ":=", " ", 
    RowBox[{
     SubscriptBox["min", 
      RowBox[{
       RowBox[{"|", "S", "|"}], " ", "=", " ", 
       RowBox[{"k", "+", "2"}]}]], " ", 
     SubscriptBox["\[Lambda]", "S"]}]}], TraditionalForm]],ExpressionUUID->
  "5abf2dad-0e73-46d3-89b0-786a3310f12b"],
 "."
}], "Text",
 TextAlignment->Center,
 CellTags->"(1995)",ExpressionUUID->"1eecdcd3-db10-4f1b-b780-0df234e27da5"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"EvalSumMinCoord", "[", "ExpGame9", "]"}]], "Input",ExpressionUUID->"0cccb94b-e948-4e90-b0bc-066304388c9d"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "47.1`", ",", "29.500000000000007`", ",", "3.3000000000000753`", ",", 
   "6.1000000000006835`"}], "}"}]], "Output",ExpressionUUID->"0a27af56-83e6-\
4b30-82ec-19771c0fea59"]
}, Open  ]],

Cell["\<\
All evaluated sums are strictly positive, hence we conclude that the game is \
convex. A fortiori, due its strictly positive values the game is even \
strictly convex. The functions presented next verify just whether the \
sufficient condition of convexity in terms of unanimity coordinates is \
satisfied. \
\>", "Text",
 TextJustification->1,ExpressionUUID->"887affe5-496c-4344-9949-a48d5dfe4ad3"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexUnanConditionQ", "[", "ExpGame9", "]"}]], "Input",ExpressionUU\
ID->"3950aef0-b032-42c0-adaf-874f17566ef9"],

Cell[BoxData["True"], "Output",ExpressionUUID->"a1b824a0-f136-48cb-8d2e-1ae039c46666"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"StrictlyConvexUnanConditionQ", "[", "ExpGame9", "]"}]], "Input",Expr\
essionUUID->"ccc53f59-861c-40a4-baee-c3d28c26cd8f"],

Cell[BoxData["True"], "Output",ExpressionUUID->"ad39de90-5a5f-44ba-8cf1-be4651bf5a31"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame9", "]"}]], "Input",ExpressionUUID->"e68fd1a7-3379-4506-93f7-108499dc3b7d"],

Cell[BoxData["True"], "Output",ExpressionUUID->"6d32e7c8-929c-46a6-9a7c-3348a2dad729"]
}, Open  ]],

Cell[TextData[{
 "In cases that all unanimity coordinates are nonnegative (i.e. the game is \
convex) or that the minimum size of coalition with negative unanimity \
coordinates is greater than ",
 StyleBox["N-2",
  FontSlant->"Italic"],
 " the return value of the function ",
 StyleBox["EvalSumMinCoord[]",
  FontWeight->"Bold"],
 " is the vector of minimum values of unanimity coordinates of each coalition \
size. In the former case we obtain, for instance,"
}], "Text",
 TextJustification->1,ExpressionUUID->"a8fea352-6b9c-417c-a485-f9cc0c4f88fb"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MinUnanimityCoordinates", "[", "ExpGame1", "]"}]], "Input",Expressio\
nUUID->"98c63606-5d19-4f6c-9bfb-f7d6f8c7d098"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "10"}], "}"}]], "Output",ExpressionUUI\
D->"3cfba134-afa9-42cd-a72f-4b71e8fa2d3e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"EvalSumMinCoord", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"f2293297-5499-44fe-b288-ab92e4dca2fc"],

Cell[CellGroupData[{

Cell[BoxData["\<\"No negative unanimity coordinates found.\"\>"], "Print",ExpressionUUID->"802297a7-8be1-46d8-80e8-9b3687d1bee0"],

Cell[BoxData["\<\"Game is convex.\"\>"], "Print",ExpressionUUID->"f64d8b51-ea46-4415-a571-62bfbed12bf0"],

Cell[BoxData["\<\"The minimum unanimity coordinates are:\"\>"], "Print",ExpressionUUID->"5e9d9f7f-5799-415f-8094-f483ae8f05a2"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "10"}], "}"}]], "Output",ExpressionUUI\
D->"3e04604b-4c50-4891-a57e-fd04261638a1"]
}, Open  ]],

Cell["and for the latter", "Text",ExpressionUUID->"05b2b620-b3d8-49dc-b902-43bdf423685f"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MinUnanimityCoordinates", "[", "ExpGame8", "]"}]], "Input",Expressio\
nUUID->"01e83374-6b2d-4a93-b98b-54a98c3b2432"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["267", "10"], ",", 
   FractionBox["3199", "15"], ",", 
   RowBox[{"-", 
    FractionBox["5597", "30"]}], ",", 
   FractionBox["2398", "15"]}], "}"}]], "Output",ExpressionUUID->"c56b631e-\
60da-43c7-afcd-64c21938325f"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"EvalSumMinCoord", "[", "ExpGame8", "]"}]], "Input",ExpressionUUID->"4145f0ab-cccb-41ba-8fbd-bb7bc981383c"],

Cell[CellGroupData[{

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Minimum coalition size with negative unanimity coordinate is \
equal to \"\>", "\[InvisibleSpace]", "3"}],
  SequenceForm[
  "Minimum coalition size with negative unanimity coordinate is equal to ", 3],
  Editable->False]], "Print",ExpressionUUID->"013a6d02-ff08-4e2d-92c0-\
a159c15f23a7"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Coalition size of T-2 is \"\>", "\[InvisibleSpace]", "2"}],
  SequenceForm["Coalition size of T-2 is ", 2],
  Editable->False]], "Print",ExpressionUUID->"7b82766d-d588-4abd-9975-\
1bc52cee2122"],

Cell[BoxData[
 InterpretationBox[
  RowBox[{
  "3", "\[InvisibleSpace]", "\<\" greater than \"\>", "\[InvisibleSpace]", 
   "2"}],
  SequenceForm[3, " greater than ", 2],
  Editable->False]], "Print",ExpressionUUID->"8df199d5-efef-45ae-8a65-\
eb66d04331e8"],

Cell[BoxData["\<\"No sum of minimum unanimity coordinates can be evaluated.\"\
\>"], "Print",ExpressionUUID->"0b1abe48-4174-47bd-acf2-c57b941f34ad"],

Cell[BoxData["\<\"The minimum unanimity coordinates are:\"\>"], "Print",ExpressionUUID->"ce5df580-946f-41c3-af69-4c085eeb2971"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["267", "10"], ",", 
   FractionBox["3199", "15"], ",", 
   RowBox[{"-", 
    FractionBox["5597", "30"]}], ",", 
   FractionBox["2398", "15"]}], "}"}]], "Output",ExpressionUUID->"23b028a4-\
c3e2-43dd-86d3-0d62a0d500b1"]
}, Open  ]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["5. Computing the Vertices of the Core",
 BaseStyle->"Hyperlink",
 ButtonData:>"Vertices"]], "Section",
 CellTags->"5",ExpressionUUID->"7c4f7010-cbb2-404b-9d76-135441ef4685"],

Cell[TextData[{
 "The next functions describe some interfaces that call the ",
 StyleBox["cddmathlink",
  FontSlant->"Italic"],
 " library via ",
 StyleBox["MathLink",
  FontSlant->"Italic"],
 " to speed up calculation. One can also use the command ",
 StyleBox["CoreVertices[]",
  FontWeight->"Bold"],
 " to obtain the same result as with the command ",
 StyleBox["CddVerticesCore[]",
  FontWeight->"Bold"],
 ". But this command is based on ",
 StyleBox["Mathematica-",
  FontSlant->"Italic"],
 "Code and it is very slow. That means that on old computers like a Pentium \
II system your game should not be greater than 6 player if you are interest \
to get the result in finite time.  The examples are performed on a Pentium II \
with 266 MHz under LINUX x86 and ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " Version 4.2.  "
}], "Text",
 TextJustification->1,ExpressionUUID->"1d440605-998e-4138-8e16-864d95c29606"],

Cell["\<\
If the package VertexEnum is properly installed on your OS, you can calculate \
the vertices of the core by using the command\
\>", "Text",ExpressionUUID->"4e7e0e34-147e-4fa9-9b92-ba54aa3fe3f2"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time", ",", 
    RowBox[{"{", 
     RowBox[{"vert1", ",", "nonvert1"}], "}"}]}], "}"}], "=", 
  RowBox[{"Timing", "[", 
   RowBox[{"VerticesCore", "[", "ExpGame1", "]"}], "]"}]}]], "Input",Expressio\
nUUID->"66ad7db0-cf42-49c1-813e-d08ba03c7465"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4.029042`", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0", ",", "50", ",", "40", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"40", ",", "50", ",", "0", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", "0", ",", "40", ",", "50"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"40", ",", "0", ",", "0", ",", "50"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", "40", ",", "0", ",", "50"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", "50", ",", "0", ",", "40"}], "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
        "17", ",", "8", ",", "11", ",", "20", ",", "5", ",", "1", ",", "4", 
         ",", "19"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
        "17", ",", "14", ",", "8", ",", "20", ",", "7", ",", "3", ",", "4", 
         ",", "19"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
        "16", ",", "11", ",", "13", ",", "20", ",", "5", ",", "6", ",", "8", 
         ",", "9", ",", "2", ",", "1", ",", "4", ",", "19"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
        "18", ",", "14", ",", "13", ",", "20", ",", "6", ",", "7", ",", "8", 
         ",", "12", ",", "3", ",", "2", ",", "4", ",", "19"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
        "15", ",", "6", ",", "9", ",", "20", ",", "5", ",", "2", ",", "1", 
         ",", "19"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
        "15", ",", "12", ",", "7", ",", "20", ",", "6", ",", "3", ",", "2", 
         ",", "19"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
        "15", ",", "10", ",", "7", ",", "20", ",", "5", ",", "3", ",", "1", 
         ",", "19"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
        "17", ",", "10", ",", "7", ",", "20", ",", "5", ",", "3", ",", "1", 
         ",", "19"}], "}"}]}], "}"}]}], "}"}]}], "}"}]], "Output",ExpressionUU\
ID->"13804de9-1f8c-4a69-9043-ba5b56783dd4"]
}, Open  ]],

Cell[TextData[{
 "Note, that the ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " Version 3.0 is even faster under the command ",
 StyleBox["CoreVertices[]",
  FontWeight->"Bold"],
 ", you get all vertices on the same platform in 52 seconds instead of 107 \
seconds."
}], "Text",ExpressionUUID->"1ff4541a-f940-408a-9d42-8c0206b2e6d4"],

Cell[TextData[{
 "By calling the ",
 StyleBox["cddmathlink",
  FontSlant->"Italic"],
 " library, we obtain the same result in 0.02 seconds."
}], "Text",ExpressionUUID->"3b763988-0c5f-4364-bc42-83c70c71e991"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time", ",", "vert2"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"CddVerticesCore", "[", "ExpGame1", "]"}], "]"}]}]], "Input",Expres\
sionUUID->"5e78d809-c02c-4a82-8ca5-7b3fb8b92787"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.003048`", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "0", ",", "40", ",", "50"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "40", ",", "0", ",", "50"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "50", ",", "0", ",", "40"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "50", ",", "40", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"40", ",", "0", ",", "0", ",", "50"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"40", ",", "50", ",", "0", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]}], 
  "}"}]], "Output",ExpressionUUID->"3ff53230-0a8f-47f8-b0ab-9c374f4278ba"]
}, Open  ]],

Cell["If you are interested in rational results, then call", "Text",ExpressionUUID->"d06c3151-ba17-48fa-863a-771b92623cbb"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time", ",", "vert3"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"CddGmpVerticesCore", "[", "ExpGame1", "]"}], "]"}]}]], "Input",Exp\
ressionUUID->"cb16de1e-df94-4fd9-95ed-6c66b866ca47"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.003712`", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0", ",", "0", ",", "40", ",", "50"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "40", ",", "0", ",", "50"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "50", ",", "0", ",", "40"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "50", ",", "40", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"40", ",", "0", ",", "0", ",", "50"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"40", ",", "50", ",", "0", ",", "0"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]}], 
  "}"}]], "Output",ExpressionUUID->"e1d44ee4-6fac-423e-aa59-250898b0f4f8"]
}, Open  ]],

Cell["\<\
Now let us check the result on core elements. This can be done by calling\
\>", "Text",ExpressionUUID->"a7661445-e457-4a79-8c6f-88af130e7460"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreElementsQ", "[", 
  RowBox[{"ExpGame1", ",", "vert1"}], "]"}]], "Input",ExpressionUUID->\
"72d42f44-b9d6-4628-810b-f0c3db8e8135"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True"}], "}"}]], "Output",ExpressionUUID->"074f33fc-\
5d50-4804-83cd-b35a65c2a8a3"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BelongToCoreQ", "[", 
  RowBox[{"ExpGame1", ",", "vert1"}], "]"}]], "Input",ExpressionUUID->\
"4319ed9d-1863-4ac4-b4c7-bbd9b7a69480"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True"}], "}"}]], "Output",ExpressionUUID->"f794f3e5-\
c0b0-48ef-909a-cebebffee01e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreElementsQ", "[", 
  RowBox[{"ExpGame1", ",", "vert2"}], "]"}]], "Input",ExpressionUUID->\
"807423d8-afde-4710-8668-cefd8d68fdb0"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True"}], "}"}]], "Output",ExpressionUUID->"9f0be8c1-\
025b-4d30-8b96-e856fd25150c"]
}, Open  ]],

Cell[TextData[{
 "This is the expected result since the game \"",
 StyleBox["ExpGame1\"",
  FontSlant->"Italic"],
 " is convex."
}], "Text",ExpressionUUID->"9c24e320-13e4-421b-9ed1-8e54985b307b"],

Cell["\<\
Since we have less than 24 vertices let us verify whether the game is \
strictly convex.\
\>", "Text",ExpressionUUID->"59d96517-4a87-484b-ac55-74c57e346287"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexStrQ", "[", "ExpGame1", "]"}]], "Input",ExpressionUUID->"017bb7e5-04b4-4b41-a9d0-58fd2b78327d"],

Cell[BoxData["False"], "Output",ExpressionUUID->"42e9d849-e03f-4ee4-adde-30960417aca8"]
}, Open  ]],

Cell[TextData[{
 "The game \"",
 StyleBox["ExpGame1\"",
  FontSlant->"Italic"],
 " is convex let us also compute the marginal values.  "
}], "Text",ExpressionUUID->"79e13280-42c2-4d4e-ba87-6bcba9094953"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"marv", "=", 
  RowBox[{"MargValue", "[", "ExpGame1", "]"}]}]], "Input",ExpressionUUID->\
"feae0ebc-bdc0-4c3c-96e0-65fb34148216"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "40", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "40", ",", "0", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "50", ",", "0", ",", "40"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "50", ",", "40", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "40", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"40", ",", "0", ",", "0", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "40", ",", "0", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "50", ",", "0", ",", "40"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"40", ",", "0", ",", "0", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"40", ",", "50", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "50", ",", "40", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"40", ",", "50", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]], "Output",Ex\
pressionUUID->"0c4cfb42-9b0d-4004-9ecb-0066aaba2595"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", "marv", "]"}]], "Input",ExpressionUUID->"65269056-a017-4f6a-af97-238e3facc114"],

Cell[BoxData["24"], "Output",ExpressionUUID->"a48e8a6f-11b5-4b4c-a606-ab7dd639e993"]
}, Open  ]],

Cell[TextData[{
 "This is the expected result for convex games that the number of marginal \
worth vectors is equal to ",
 StyleBox["n",
  FontSlant->"Italic"],
 "!. To demonstrate that the marginal worth vectors coincide with the \
vertices of the core, we remove all duplicated vectors by"
}], "Text",
 TextJustification->1,ExpressionUUID->"a8cc5258-0a99-41ed-851e-f8cb68a1c5ce"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"unmarv", "=", 
  RowBox[{"Union", "[", "marv", "]"}]}]], "Input",ExpressionUUID->"1cc93652-\
4d9e-4a00-9cdc-3ebb6f04f55e"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "40", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "40", ",", "0", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "50", ",", "0", ",", "40"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "50", ",", "40", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"40", ",", "0", ",", "0", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"40", ",", "50", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]], "Output",Ex\
pressionUUID->"190ece45-50d0-4336-b5c0-bc801ff033c8"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", 
  RowBox[{"Union", "[", "marv", "]"}], "]"}]], "Input",ExpressionUUID->\
"961174fc-c161-47be-bba4-3da90ea45da3"],

Cell[BoxData["8"], "Output",ExpressionUUID->"431ab8fb-93c2-4f74-af68-7beefea7301d"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreElementsQ", "[", 
  RowBox[{"ExpGame1", ",", "unmarv"}], "]"}]], "Input",ExpressionUUID->\
"f6181a5d-e020-4408-944b-026851b07c6b"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True"}], "}"}]], "Output",ExpressionUUID->"4975a5a9-\
5fb6-46b8-bcf7-bd62b02760ae"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BelongToCoreQ", "[", 
  RowBox[{"ExpGame1", ",", "unmarv"}], "]"}]], "Input",ExpressionUUID->\
"b6be38c3-0fd7-4d11-82c3-54c95151cd46"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True"}], "}"}]], "Output",ExpressionUUID->"c5043cdd-\
493d-4128-ab73-e32ac8910a5d"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"to1", "=", 
  RowBox[{"Union", "[", 
   RowBox[{"marv", ",", "vert1"}], "]"}]}]], "Input",ExpressionUUID->\
"1caf4da7-876c-438e-9b91-7ed7773b0a32"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "40", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "40", ",", "0", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "50", ",", "0", ",", "40"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "50", ",", "40", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"40", ",", "0", ",", "0", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"40", ",", "50", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]], "Output",Ex\
pressionUUID->"9c120ad4-278e-4a79-b022-6b93112a44b5"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", "to1", "]"}]], "Input",ExpressionUUID->"3b1a1c73-0fa3-4152-8d2c-40322cb39168"],

Cell[BoxData["8"], "Output",ExpressionUUID->"a4437fed-e12d-4470-9f97-0dba4888dc69"]
}, Open  ]],

Cell["\<\
Hence, we get the expected result, that the marginal worth vectors coincide \
with core vertices.  \
\>", "Text",ExpressionUUID->"a059ba8c-815a-4f01-ac50-e2386b3860c2"],

Cell["\<\
 In particular, you should handle very carefully floating point results by \
checking on core elements. We make this point more clear by the following \
example\
\>", "Text",ExpressionUUID->"79abd23e-9e89-4a0a-8ec5-659f8424b86e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ecken8", "=", 
  RowBox[{"CddVerticesCore", "[", "ExpGame8", "]"}]}]], "Input",ExpressionUUID\
->"560e21b1-ebfe-4cd1-a503-7393a3888191"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"cad3c963-8c4a-46d9-bae7-381203bdbac1"]
}, Open  ]],

Cell[TextData[{
 "These are exactly the core vertices we have already computed in the ",
 ButtonBox["Section 4.2",
  BaseStyle->"Hyperlink",
  ButtonData:>"k-convexity"],
 " . But if we check this result with the usual function ",
 StyleBox["CoreElementsQ[]",
  FontWeight->"Bold",
  FontVariations->{"CompatibilityType"->0}],
 StyleBox[" we obtain a wrong result by using floating point numbers. ",
  FontVariations->{"CompatibilityType"->0}]
}], "Text",
 TextJustification->1,ExpressionUUID->"ac47b4bb-95b5-4456-b03d-1669244fceb7"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreElementsQ", "[", 
  RowBox[{"ExpGame8", ",", "ecken8"}], "]"}]], "Input",ExpressionUUID->\
"af339bd0-f556-4a8a-9362-fb7325ff6270"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", 
   "True"}], "}"}]], "Output",ExpressionUUID->"26e25628-97d1-4c9c-8f2b-\
59aef25dcb51"]
}, Open  ]],

Cell[TextData[{
 "The correct result is delivered by the function ",
 StyleBox["BelongToCoreQ[]",
  FontWeight->"Bold"]
}], "Text",ExpressionUUID->"e5d4acf0-94fb-4933-bd37-8bf7ad447ec4"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BelongToCoreQ", "[", 
  RowBox[{"ExpGame8", ",", "ecken8"}], "]"}]], "Input",ExpressionUUID->\
"cf60bb82-b551-4bfd-8c96-bb32f75f55ad"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", 
   "True"}], "}"}]], "Output",ExpressionUUID->"38f9a4c3-0505-412c-b3a1-\
80a84fc24bcb"]
}, Open  ]],

Cell[TextData[{
 "To overcome problems associated with floating points result you should \
convert these results to rational numbers by using the ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " built-in function ",
 StyleBox["Rationalize[]",
  FontWeight->"Bold"],
 "."
}], "Text",ExpressionUUID->"29031229-6068-4b1b-89e7-ddbbaecdec8f"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ravert8", "=", 
  RowBox[{"Rationalize", "[", "ecken8", "]"}]}]], "Input",ExpressionUUID->\
"4a959e01-b900-4427-94a3-b9bb1d392c93"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["800", "3"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["267", "10"], ",", 
     FractionBox["7199", "30"]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["800", "3"], ",", 
     FractionBox["800", "3"], ",", 
     FractionBox["7199", "30"], ",", 
     FractionBox["267", "10"]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"85cb5cfa-513c-493a-bcc9-27f877a0904d"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", "ravert8", "]"}]], "Input",ExpressionUUID->"9244c957-9aa3-46d3-b309-bee8fa236f1b"],

Cell[BoxData["12"], "Output",ExpressionUUID->"80d42e4e-1b8e-4315-8157-28910b20c259"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreElementsQ", "[", 
  RowBox[{"ExpGame8", ",", "ravert8"}], "]"}]], "Input",ExpressionUUID->\
"b1834944-4cf7-42fd-928b-ae38353ef043"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", 
   "True"}], "}"}]], "Output",ExpressionUUID->"2f33856b-b455-4878-919a-\
6117235b0e52"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BelongToCoreQ", "[", 
  RowBox[{"ExpGame8", ",", "ravert8"}], "]"}]], "Input",ExpressionUUID->\
"917de9f8-7455-44c1-83b7-3b4bf3bab17a"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", 
   ",", "True", ",", "True", ",", "True", ",", "True", ",", "True", ",", 
   "True"}], "}"}]], "Output",ExpressionUUID->"4941f08b-af50-41cb-9014-\
28c1fbdc342c"]
}, Open  ]],

Cell[TextData[{
 "This is exactly the result we have already obtained in the ",
 ButtonBox["Section 4.2",
  BaseStyle->"Hyperlink",
  ButtonData:>"k-convexity"],
 "."
}], "Text",ExpressionUUID->"512986ee-5dd2-4940-8db8-741f2c1a7e37"],

Cell["\<\
You can also calculate the vertices of the imputation set and of the \
reasonable set by using\
\>", "Text",ExpressionUUID->"30c34844-de90-4301-8bd9-e966736a5f3b"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Rationalize", "[", 
  RowBox[{"CddVerticesImputationSet", "[", "ExpGame1", "]"}], "]"}]], "Input",\
ExpressionUUID->"f0877e40-fc65-47f8-a3ad-6a2dd90a9908"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "0", ",", "90"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "90", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "90", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]], "Output",Ex\
pressionUUID->"7af00ab5-9bf9-4ae2-982f-a615a0393d99"]
}, Open  ]],

Cell["and", "Text",ExpressionUUID->"16a6e1ce-9a58-4998-91d6-7822ce90e055"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Rationalize", "[", 
  RowBox[{"CddVerticesReasonableSet", "[", "ExpGame1", "]"}], "]"}]], "Input",\
ExpressionUUID->"e797ed42-7e52-49fc-8668-b288e26b76f1"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "100"}], ",", "50", ",", "90", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", 
     RowBox[{"-", "140"}], ",", "90", ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "50", ",", 
     RowBox[{"-", "100"}], ",", "50"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"90", ",", "50", ",", "90", ",", 
     RowBox[{"-", "140"}]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"8481f568-b99e-4624-ae38-e7f0dac9d338"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["6. Concluding Remarks and Limitations",
 BaseStyle->"Hyperlink",
 ButtonData:>"6."]], "Section",
 CellTags->
  "Concluding Remarks and \
Limitations",ExpressionUUID->"90fc73d9-0a6b-4c46-9ccd-f2ece9fefbf5"],

Cell[TextData[{
 "In this section we want to discuss some limitations that appear in the \
context of the package ",
 StyleBox["TuGames",
  FontSlant->"Italic"],
 ".  Note first that it is not possible to assign arbitrary names to the \
players. The players must be named with natural numbers. Naming players in \
the fashion as we did it in the example below does not work or produces wrong \
results in bad cases. "
}], "Text",
 TextJustification->1,ExpressionUUID->"ac6efc03-d6ba-4ad2-9d6d-6af47076d150"],

Cell[BoxData[
 RowBox[{"(*", " ", 
  RowBox[{"T10", "=", 
   RowBox[{"{", 
    RowBox[{"p1", ",", "p2", ",", "p3"}], "}"}]}]}]], "Input",
 EmphasizeSyntaxErrors->
  True,ExpressionUUID->"f2bc446f-05db-4627-bbf2-483e083fb1df"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"T11", "=", 
  RowBox[{"{", 
   RowBox[{"1", ",", "2", ",", "3"}], "}"}]}]], "Input",ExpressionUUID->\
"bef2493b-9f36-417c-a662-749956aefb8e"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "2", ",", "3"}], "}"}]], "Output",ExpressionUUID->\
"cb0a1161-af6e-425a-9eee-6b9faa1faef7"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"vec10", "=", 
   RowBox[{"Table", "[", 
    RowBox[{"0", ",", 
     RowBox[{"{", 
      RowBox[{"k", ",", 
       RowBox[{"2", "^", 
        RowBox[{"Length", "[", "T10", "]"}]}]}], "}"}]}], "]"}]}], 
  ";"}]], "Input",ExpressionUUID->"7476df27-514f-454a-aba2-400a4b6af94a"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame10", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T10", ",", "vec10"}], "]"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", "p2", "}"}], "]"}], "=", 
      RowBox[{
       RowBox[{"v", "[", 
        RowBox[{"{", "p3", "}"}], "]"}], "=", "45"}]}], ";", " ", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"p1", ",", "p2"}], "}"}], "]"}], "=", "40"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"p1", ",", "p3"}], "}"}], "]"}], "=", "40"}], ";", 
     RowBox[{
      RowBox[{"v", "[", "T", "]"}], "=", "90"}], ";"}], ")"}]}], 
  ";"}]], "Input",ExpressionUUID->"a8ffc997-c379-4da0-b0d0-555e10b20212"],

Cell["\<\
If we want to evaluate the Shapley value of the game with the chosen \
representation of the player set this will produce an error. \
\>", "Text",ExpressionUUID->"9e73c6bb-e7f3-4dbc-8762-574839896a6b"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"NewShapley", "[", "ExpGame10", "]"}]], "Input",ExpressionUUID->"00de94ae-56c5-4ab3-9d3d-4aa93d606b73"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["175", "6"], ",", 
   FractionBox["95", "6"], ",", 
   FractionBox["175", "6"], ",", 
   FractionBox["95", "6"]}], "}"}]], "Output",ExpressionUUID->"5f63fb5c-b965-\
4b2a-b060-470251a5d377"]
}, Open  ]],

Cell["\<\
Renaming the players with natural numbers helps to produce the correct \
results. \
\>", "Text",ExpressionUUID->"138b560c-9d28-4080-a4d0-cdd391a3d70c"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"T11", "=", 
  RowBox[{"MapThread", "[", 
   RowBox[{"Set", ",", 
    RowBox[{"{", 
     RowBox[{"T10", ",", 
      RowBox[{"{", 
       RowBox[{"1", ",", "2", ",", "3"}], "}"}]}], "}"}]}], "]"}]}]], "Input",\
ExpressionUUID->"6f13db94-6c7e-4199-9841-c452e552f4e6"],

Cell[BoxData[
 TemplateBox[{
  "MapThread","mptd",
   "\"Object \\!\\(\\*RowBox[{\\\"T10\\\"}]\\) at position {2, \
\\!\\(\\*RowBox[{\\\"1\\\"}]\\)} in \\!\\(\\*RowBox[{\\\"MapThread\\\", \\\"[\
\\\", RowBox[{\\\"Set\\\", \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"T10\\\", \
\\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\", \
\\\",\\\", \\\"3\\\"}], \\\"}\\\"}]}], \\\"}\\\"}]}], \\\"]\\\"}]\\) has only \
\\!\\(\\*RowBox[{\\\"0\\\"}]\\) of required \\!\\(\\*RowBox[{\\\"1\\\"}]\\) \
dimensions.\"",2,262,11,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"116b8669-af9d-4e48-b845-0477593e0d88"],

Cell[BoxData[
 RowBox[{"MapThread", "[", 
  RowBox[{"Set", ",", 
   RowBox[{"{", 
    RowBox[{"T10", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", "3"}], "}"}]}], "}"}]}], "]"}]], "Output",Ex\
pressionUUID->"f95f9243-1f6d-44fe-b493-4a9d821328d6"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"sh1", "=", 
  RowBox[{"NewShapley", "[", "ExpGame10", "]"}]}]], "Input",ExpressionUUID->\
"d36f7f22-142a-4b60-a1b8-123a232644e7"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["175", "6"], ",", 
   FractionBox["95", "6"], ",", 
   FractionBox["175", "6"], ",", 
   FractionBox["95", "6"]}], "}"}]], "Output",ExpressionUUID->"9576f8d5-2df2-\
4877-bd23-02d8110f518e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"sh2", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame10", "]"}]}]], "Input",ExpressionUUID->\
"021e5c91-963c-400c-befd-114e7aacbe95"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["175", "6"], ",", 
   FractionBox["95", "6"], ",", 
   FractionBox["175", "6"], ",", 
   FractionBox["95", "6"]}], "}"}]], "Output",ExpressionUUID->"6b405b5c-275c-\
4e94-ab8a-654bc28d116c"]
}, Open  ]],

Cell[TextData[{
 "Now, let us briefly discuss limitations that appear in relation to the \
operator \":=\" or ",
 StyleBox["SetDelayed[]",
  FontWeight->"Bold"],
 " command. To find out what will happen if the game in which we are \
interested in is not evaluated, we define for this purpose a new game with \
similar coalitional values like the game \"",
 StyleBox["ExpGame10",
  FontSlant->"Italic"],
 "\". Recall from the discussion of ",
 ButtonBox["Section 3.1",
  BaseStyle->"Hyperlink",
  ButtonData:>"How to define Games?"],
 " that the values of the characteristic function are evaluated at the moment \
when the ",
 StyleBox["game_name",
  FontSlant->"Italic"],
 " appears in the command. Just defining the game and invoking the return key \
is not enough to change the values of the characteristic function. "
}], "Text",
 TextJustification->1,ExpressionUUID->"dc0c293c-bac7-4208-9a53-ffc999eceffb"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame11", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"1", ",", "2", ",", "3"}], "}"}], ",", "vec10"}], "]"}], ";", 
     
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", "2", "}"}], "]"}], "=", 
      RowBox[{
       RowBox[{"v", "[", 
        RowBox[{"{", "3", "}"}], "]"}], "=", "30"}]}], ";", " ", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "2"}], "}"}], "]"}], "=", "40"}], ";", 
     RowBox[{
      RowBox[{"v", "[", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3"}], "}"}], "]"}], "=", "40"}], ";", 
     RowBox[{
      RowBox[{"v", "[", "T", "]"}], "=", "90"}], ";"}], ")"}]}], 
  ";"}]], "Input",ExpressionUUID->"8d242282-ddb1-4746-84c5-8e1b0a799f7a"],

Cell["\<\
To check out which coalitional values are currently assigned can be done by \
\>", "Text",ExpressionUUID->"b670deff-3c0d-4f52-ada2-9bcc17d80a21"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"??", "v"}]], "Input",ExpressionUUID->"fbbdff9b-f051-467b-8be5-ce007aedcf09"],

Cell[CellGroupData[{

Cell[BoxData["\<\"v[S] describes the worth of coalition S\"\>"], "Print", "PrintUsage",
 CellTags->
  "Info2663757087583-2696204",ExpressionUUID->"b3626335-3eee-4307-8c34-\
e4d0ca45192c"],

Cell[BoxData[
 InterpretationBox[GridBox[{
    {GridBox[{
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", "1", "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", "2", "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", "3", "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", "4", "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", "p2", "}"}], "]"}], "=", "45"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", "p3", "}"}], "]"}], "=", "45"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "2"}], "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "3"}], "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "4"}], "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"2", ",", "3"}], "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"2", ",", "4"}], "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"3", ",", "4"}], "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"p1", ",", "p2"}], "}"}], "]"}], "=", "40"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"p1", ",", "p3"}], "}"}], "]"}], "=", "40"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "2", ",", "3"}], "}"}], "]"}], "=", "40"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "2", ",", "4"}], "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "3", ",", "4"}], "}"}], "]"}], "=", "40"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"2", ",", "3", ",", "4"}], "}"}], "]"}], "=", "0"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "2", ",", "3", ",", "4"}], "}"}], "]"}], "=", 
         "90"}]}
      },
      BaselinePosition->{Baseline, {1, 1}},
      GridBoxAlignment->{
       "Columns" -> {{Left}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
        "RowsIndexed" -> {}},
      GridBoxItemSize->{"Columns" -> {{
           Scaled[0.999]}}, "ColumnsIndexed" -> {}, "Rows" -> {{1.}}, 
        "RowsIndexed" -> {}}]}
   },
   BaselinePosition->{Baseline, {1, 1}},
   GridBoxAlignment->{
    "Columns" -> {{Left}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
     "RowsIndexed" -> {}}],
  Definition[TUG`coop`CooperativeGames`v],
  Editable->False]], "Print",
 CellTags->
  "Info2663757087583-2696204",ExpressionUUID->"b529fa91-4587-4752-9a33-\
0251384bbc7e"]
}, Open  ]]
}, Open  ]],

Cell[TextData[{
 "We notice that still the coalitional values for the game \"",
 StyleBox["ExpGame10",
  FontSlant->"Italic"],
 "\" are present. If you want to evaluate, for example, the Shapley value for \
the game \"",
 StyleBox["ExpGame11",
  FontSlant->"Italic"],
 "\" but you make a typesetting error by forgetting the number 11 in our \
example, you will obtain the result of the Shapley value for the game \"",
 StyleBox["ExpGame10",
  FontSlant->"Italic"],
 "\", since there is no change in the characteristic function. "
}], "Text",
 TextJustification->1,ExpressionUUID->"f335139d-63e2-4b63-bc1f-ac9d711d483a"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"NewShapley", "[", "ExpGame", "]"}]], "Input",ExpressionUUID->"1faa42c2-aafa-4c16-8597-9bb7f99a0db5"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["175", "6"], ",", 
   FractionBox["95", "6"], ",", 
   FractionBox["175", "6"], ",", 
   FractionBox["95", "6"]}], "}"}]], "Output",ExpressionUUID->"168cbea2-434f-\
4d8d-8e34-f2eb81504d10"]
}, Open  ]],

Cell[TextData[{
 "There is at that moment a change in the values of the characteristic \
function when a new ",
 StyleBox["game_name",
  FontSlant->"Italic"],
 " appears in a command that requires as an input parameter a ",
 StyleBox["game_name",
  FontSlant->"Italic"],
 ". For our example, we get new values for the characteristic function when \
we call the command ",
 StyleBox["NewShapley[]",
  FontWeight->"Bold"],
 " with a ",
 StyleBox["game_name",
  FontSlant->"Italic"],
 " that has been previously defined elsewhere in the notebook.  "
}], "Text",
 TextJustification->1,ExpressionUUID->"41dc1814-45fb-4ef0-8ae8-83f24a2ef9a7"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"sh3", "=", 
  RowBox[{"NewShapley", "[", "ExpGame11", "]"}]}]], "Input",ExpressionUUID->\
"39a9f8b6-fd55-4c0a-88cd-bf63030e2662"],

Cell[BoxData[
 TemplateBox[{
  "MapThread","mptc",
   "\"Incompatible dimensions of objects at positions {2, \\!\\(\\*RowBox[{\\\
\"1\\\"}]\\)} and {2, \\!\\(\\*RowBox[{\\\"2\\\"}]\\)} of \\!\\(\\*RowBox[{\\\
\"MapThread\\\", \\\"[\\\", RowBox[{RowBox[{RowBox[{\\\"(\\\", \
RowBox[{RowBox[{\\\"v\\\", \\\"[\\\", \\\"#1\\\", \\\"]\\\"}], \\\"=\\\", \
\\\"#2\\\"}], \\\")\\\"}], \\\"&\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{RowBox[{\\\"{\\\", RowBox[{RowBox[{\\\"{\\\", \\\"}\\\"}], \\\",\\\", \
RowBox[{\\\"{\\\", \\\"1\\\", \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
\\\"2\\\", \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"3\\\", \\\"}\\\"}], \
\\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\"}], \
\\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \
\\\"3\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"2\\\", \\\
\",\\\", \\\"3\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\", \\\",\\\", \\\"3\\\"}], \
\\\"}\\\"}]}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"0\\\", \
\\\"}\\\"}]}], \\\"}\\\"}]}], \\\"]\\\"}]\\); dimensions are \
\\!\\(\\*RowBox[{\\\"8\\\"}]\\) and \\!\\(\\*RowBox[{\\\"1\\\"}]\\).\"",2,268,
   12,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"96e20fa9-8867-42f2-8549-4108c5def075"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["40", "3"], ",", 
   FractionBox["40", "3"], ",", 
   FractionBox["40", "3"]}], "}"}]], "Output",ExpressionUUID->"5a88c8d8-e61b-\
45af-9692-951c63411f6d"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"sh4", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame11", "]"}]}]], "Input",ExpressionUUID->\
"3410761e-b379-4034-9d70-8f4dec10822b"],

Cell[BoxData[
 TemplateBox[{
  "MapThread","mptc",
   "\"Incompatible dimensions of objects at positions {2, \\!\\(\\*RowBox[{\\\
\"1\\\"}]\\)} and {2, \\!\\(\\*RowBox[{\\\"2\\\"}]\\)} of \\!\\(\\*RowBox[{\\\
\"MapThread\\\", \\\"[\\\", RowBox[{RowBox[{RowBox[{\\\"(\\\", \
RowBox[{RowBox[{\\\"v\\\", \\\"[\\\", \\\"#1\\\", \\\"]\\\"}], \\\"=\\\", \
\\\"#2\\\"}], \\\")\\\"}], \\\"&\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{RowBox[{\\\"{\\\", RowBox[{RowBox[{\\\"{\\\", \\\"}\\\"}], \\\",\\\", \
RowBox[{\\\"{\\\", \\\"1\\\", \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
\\\"2\\\", \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"3\\\", \\\"}\\\"}], \
\\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\"}], \
\\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \
\\\"3\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"2\\\", \\\
\",\\\", \\\"3\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\", \\\",\\\", \\\"3\\\"}], \
\\\"}\\\"}]}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"0\\\", \
\\\"}\\\"}]}], \\\"}\\\"}]}], \\\"]\\\"}]\\); dimensions are \
\\!\\(\\*RowBox[{\\\"8\\\"}]\\) and \\!\\(\\*RowBox[{\\\"1\\\"}]\\).\"",2,269,
   13,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"84a2682b-b9b9-41db-9424-5859da0f8c50"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{
    RowBox[{
     FractionBox["1", "2"], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "60"}], "-", 
       RowBox[{"v", "[", 
        RowBox[{"{", 
         RowBox[{"2", ",", "3"}], "}"}], "]"}]}], ")"}]}], "+", 
    RowBox[{
     FractionBox["1", "3"], " ", 
     RowBox[{"(", 
      RowBox[{"160", "+", 
       RowBox[{"v", "[", 
        RowBox[{"{", "1", "}"}], "]"}], "+", 
       RowBox[{
        FractionBox["1", "2"], " ", 
        RowBox[{"(", 
         RowBox[{"60", "+", 
          RowBox[{"v", "[", 
           RowBox[{"{", 
            RowBox[{"2", ",", "3"}], "}"}], "]"}]}], ")"}]}]}], ")"}]}]}], 
   ",", 
   RowBox[{
    RowBox[{
     FractionBox["1", "2"], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "70"}], "-", 
       RowBox[{"v", "[", 
        RowBox[{"{", "1", "}"}], "]"}]}], ")"}]}], "+", 
    RowBox[{
     FractionBox["1", "3"], " ", 
     RowBox[{"(", 
      RowBox[{"160", "+", 
       RowBox[{"v", "[", 
        RowBox[{"{", "1", "}"}], "]"}], "+", 
       RowBox[{
        FractionBox["1", "2"], " ", 
        RowBox[{"(", 
         RowBox[{"60", "+", 
          RowBox[{"v", "[", 
           RowBox[{"{", 
            RowBox[{"2", ",", "3"}], "}"}], "]"}]}], ")"}]}]}], ")"}]}]}], 
   ",", 
   RowBox[{
    RowBox[{
     FractionBox["1", "2"], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "70"}], "-", 
       RowBox[{"v", "[", 
        RowBox[{"{", "1", "}"}], "]"}]}], ")"}]}], "+", 
    RowBox[{
     FractionBox["1", "3"], " ", 
     RowBox[{"(", 
      RowBox[{"160", "+", 
       RowBox[{"v", "[", 
        RowBox[{"{", "1", "}"}], "]"}], "+", 
       RowBox[{
        FractionBox["1", "2"], " ", 
        RowBox[{"(", 
         RowBox[{"60", "+", 
          RowBox[{"v", "[", 
           RowBox[{"{", 
            RowBox[{"2", ",", "3"}], "}"}], "]"}]}], ")"}]}]}], ")"}]}]}]}], 
  "}"}]], "Output",ExpressionUUID->"afa7d8f2-b1a1-4a16-8bab-032779c55fff"]
}, Open  ]],

Cell["\<\
Now let us again check out the values of the characteristic function by\
\>", "Text",ExpressionUUID->"2f338c42-8608-4015-897b-93ce53cccd92"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"??", "v"}]], "Input",ExpressionUUID->"25d361f7-a2e4-4ad1-bf42-202208d3dddb"],

Cell[CellGroupData[{

Cell[BoxData["\<\"v[S] describes the worth of coalition S\"\>"], "Print", "PrintUsage",
 CellTags->
  "Info2703757087594-2696204",ExpressionUUID->"e220bc78-9913-4af7-acf9-\
c540b2549689"],

Cell[BoxData[
 InterpretationBox[GridBox[{
    {GridBox[{
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", "2", "}"}], "]"}], "=", "30"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", "3", "}"}], "]"}], "=", "30"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "2"}], "}"}], "]"}], "=", "40"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "3"}], "}"}], "]"}], "=", "40"}]},
       {" "},
       {
        RowBox[{
         RowBox[{"v", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "2", ",", "3"}], "}"}], "]"}], "=", "90"}]}
      },
      BaselinePosition->{Baseline, {1, 1}},
      GridBoxAlignment->{
       "Columns" -> {{Left}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
        "RowsIndexed" -> {}},
      GridBoxItemSize->{"Columns" -> {{
           Scaled[0.999]}}, "ColumnsIndexed" -> {}, "Rows" -> {{1.}}, 
        "RowsIndexed" -> {}}]}
   },
   BaselinePosition->{Baseline, {1, 1}},
   GridBoxAlignment->{
    "Columns" -> {{Left}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
     "RowsIndexed" -> {}}],
  Definition[TUG`coop`CooperativeGames`v],
  Editable->False]], "Print",
 CellTags->
  "Info2703757087594-2696204",ExpressionUUID->"2858c6b9-e803-4494-b368-\
d06dcb051d5c"]
}, Open  ]]
}, Open  ]],

Cell["\<\
In cases that some unexpected or strange results have occurred after the \
calculation task has finished, you should check out by the above command \
which values are currently assigned to the characteristic function. \
\>", "Text",
 TextJustification->1,ExpressionUUID->"c458dea6-c40e-4e63-b04a-64f4b81c698e"],

Cell[TextData[{
 "We did also some effort to examine the data format of some functions to \
prevent that ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " is performing lengthy unnecessary computations. By avoiding such \
computations you can immediately correct the wrong input parameter instead of \
waiting some time till ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " has finished its evaluation. Here we present an small and simple example. \
First let us construct some payoffs."
}], "Text",
 TextJustification->1,ExpressionUUID->"6bf268e1-77d5-4bc1-b898-fa56270c5b96"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"sol11", "=", 
  RowBox[{"KernelCalculation", "[", "ExpGame11", "]"}]}]], "Input",ExpressionU\
UID->"5f8cd291-976d-47e7-af73-5e8bedc13106"],

Cell[BoxData[
 TemplateBox[{
  "MapThread","mptc",
   "\"Incompatible dimensions of objects at positions {2, \\!\\(\\*RowBox[{\\\
\"1\\\"}]\\)} and {2, \\!\\(\\*RowBox[{\\\"2\\\"}]\\)} of \\!\\(\\*RowBox[{\\\
\"MapThread\\\", \\\"[\\\", RowBox[{RowBox[{RowBox[{\\\"(\\\", \
RowBox[{RowBox[{\\\"v\\\", \\\"[\\\", \\\"#1\\\", \\\"]\\\"}], \\\"=\\\", \
\\\"#2\\\"}], \\\")\\\"}], \\\"&\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{RowBox[{\\\"{\\\", RowBox[{RowBox[{\\\"{\\\", \\\"}\\\"}], \\\",\\\", \
RowBox[{\\\"{\\\", \\\"1\\\", \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
\\\"2\\\", \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"3\\\", \\\"}\\\"}], \
\\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\"}], \
\\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \
\\\"3\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"2\\\", \\\
\",\\\", \\\"3\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\", \\\",\\\", \\\"3\\\"}], \
\\\"}\\\"}]}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"0\\\", \
\\\"}\\\"}]}], \\\"}\\\"}]}], \\\"]\\\"}]\\); dimensions are \
\\!\\(\\*RowBox[{\\\"8\\\"}]\\) and \\!\\(\\*RowBox[{\\\"1\\\"}]\\).\"",2,271,
   14,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"ea357c30-2ea1-4301-8dea-ad3fca68d17e"],

Cell[BoxData[
 TemplateBox[{
  "ConstrainedMin","lpnn",
   "\"Input data to linear programming algorithm \\!\\(\\*RowBox[{\\\"{\\\", \
RowBox[{RowBox[{\\\"{\\\", RowBox[{\\\"0\\\", \\\",\\\", \\\"0\\\", \
\\\",\\\", \\\"0\\\", \\\",\\\", \\\"1\\\", \\\",\\\", RowBox[{\\\"-\\\", \
\\\"1\\\"}]}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \\\"0\\\", \
\\\",\\\", \\\"0\\\", \\\",\\\", \\\"1\\\", \\\",\\\", RowBox[{\\\"-\\\", \
\\\"1\\\"}]}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"0\\\", \
\\\",\\\", \\\"1\\\", \\\",\\\", \\\"0\\\", \\\",\\\", \\\"1\\\", \\\",\\\", \
RowBox[{\\\"-\\\", \\\"1\\\"}]}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{\\\"1\\\", \\\",\\\", \\\"1\\\", \\\",\\\", \\\"0\\\", \\\",\\\", \
\\\"1\\\", \\\",\\\", RowBox[{\\\"-\\\", \\\"1\\\"}]}], \\\"}\\\"}], \
\\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"0\\\", \\\",\\\", \\\"0\\\", \
\\\",\\\", \\\"1\\\", \\\",\\\", \\\"1\\\", \\\",\\\", RowBox[{\\\"-\\\", \
\\\"1\\\"}]}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \
\\\",\\\", \\\"0\\\", \\\",\\\", \\\"1\\\", \\\",\\\", \\\"1\\\", \\\",\\\", \
RowBox[{\\\"-\\\", \\\"1\\\"}]}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{\\\"0\\\", \\\",\\\", \\\"1\\\", \\\",\\\", \\\"1\\\", \\\",\\\", \
\\\"1\\\", \\\",\\\", RowBox[{\\\"-\\\", \\\"1\\\"}]}], \\\"}\\\"}]}], \
\\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{RowBox[{\\\"v\\\", \\\"[\\\
\", RowBox[{\\\"{\\\", \\\"1\\\", \\\"}\\\"}], \\\"]\\\"}], \\\",\\\", \\\"30\
\\\", \\\",\\\", \\\"40\\\", \\\",\\\", \\\"30\\\", \\\",\\\", \\\"40\\\", \\\
\",\\\", RowBox[{\\\"v\\\", \\\"[\\\", RowBox[{\\\"{\\\", RowBox[{\\\"2\\\", \
\\\",\\\", \\\"3\\\"}], \\\"}\\\"}], \\\"]\\\"}]}], \\\"}\\\"}], \\\",\\\", \
RowBox[{\\\"{\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \
\\\"1\\\", \\\",\\\", \\\"1\\\", \\\",\\\", \\\"0\\\", \\\",\\\", \
\\\"0\\\"}], \\\"}\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"90\\\
\", \\\"}\\\"}]}], \\\"}\\\"}]\\) contains elements that are empty matrices, \
invalid vectors or matrices, or not real numbers.\"",2,271,15,
   17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"613341f2-7726-48de-82fc-7f9058b66923"],

Cell[BoxData[
 TemplateBox[{
  "$RecursionLimit","reclim2",
   "\"Recursion depth of \\!\\(\\*RowBox[{\\\"1024\\\"}]\\) exceeded during \
evaluation of \\!\\(\\*RowBox[{\\\"v\\\", \\\"[\\\", RowBox[{\\\"{\\\", \
RowBox[{\\\"2\\\", \\\",\\\", \\\"3\\\"}], \\\"}\\\"}], \\\"]\\\"}]\\).\"",2,
   271,16,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"1150c84d-6478-44ec-af4a-922d1afb2a84"],

Cell[BoxData[
 TemplateBox[{
  "$RecursionLimit","reclim2",
   "\"Recursion depth of \\!\\(\\*RowBox[{\\\"1024\\\"}]\\) exceeded during \
evaluation of \\!\\(\\*RowBox[{\\\"v\\\", \\\"[\\\", RowBox[{\\\"{\\\", \
RowBox[{\\\"2\\\", \\\",\\\", \\\"3\\\"}], \\\"}\\\"}], \\\"]\\\"}]\\).\"",2,
   271,17,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"e5248fad-cae0-431a-9a02-a4001c537d31"],

Cell[BoxData[
 TemplateBox[{
  "$RecursionLimit","reclim2",
   "\"Recursion depth of \\!\\(\\*RowBox[{\\\"1024\\\"}]\\) exceeded during \
evaluation of \\!\\(\\*RowBox[{\\\"v\\\", \\\"[\\\", RowBox[{\\\"{\\\", \
RowBox[{\\\"2\\\", \\\",\\\", \\\"3\\\"}], \\\"}\\\"}], \\\"]\\\"}]\\).\"",2,
   271,18,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"54a03758-ccab-444c-8823-94e185887d4c"],

Cell[BoxData[
 TemplateBox[{
  "General","stop",
   "\"Further output of \\!\\(\\*StyleBox[RowBox[{\\\"$RecursionLimit\\\", \\\
\"::\\\", \\\"reclim2\\\"}], \\\"MessageName\\\"]\\) will be suppressed \
during this calculation.\"",2,271,19,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"2b3d6cc0-e633-4872-85c5-ad194db641b3"],

Cell[BoxData[
 RowBox[{"If", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"If", "[", 
     RowBox[{
      RowBox[{"0", "<", 
       RowBox[{"TUG`TuGames`Private`e", "-", "TUG`TuGames`Private`f"}]}], ",",
       "TUG`TuGames`Private`fieps$36497", ",", 
      "TUG`TuGames`Private`epsi1$36497"}], "]"}], "\[NotEqual]", "0"}], ",", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"(", 
       RowBox[{
       "TUG`TuGames`Private`zmonoQ$36497", "||", 
        "TUG`TuGames`Private`kernQ$36497"}], ")"}], "\[Equal]", "True"}], ",", 
     RowBox[{
      RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ01", "[", 
       RowBox[{
       "TUG`TuGames`Private`zmonoQ$36497", ",", 
        "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
      RowBox[{"TUG`TuGames`Private`KernelPoints", "[", 
       RowBox[{"TUG`TuGames`Private`orggame$36497", ",", 
        RowBox[{"{", "}"}], ",", "TUG`TuGames`Private`callm$36497", ",", 
        "TUG`TuGames`Private`changeps$36497", ",", 
        "TUG`TuGames`Private`dispres$36497", ",", 
        RowBox[{
        "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}]}], 
       "]"}]}], ",", 
     RowBox[{
      RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ02", "[", 
       RowBox[{
       "TUG`TuGames`Private`zmonoQ$36497", ",", 
        "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
      RowBox[{"TUG`TuGames`Private`KernelSubCallZero", "[", 
       RowBox[{
       "TUG`TuGames`Private`orggame$36497", ",", 
        "TUG`TuGames`Private`callm$36497", ",", 
        "TUG`TuGames`Private`changeps$36497", ",", 
        "TUG`TuGames`Private`dispres$36497", ",", 
        RowBox[{
        "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], ",", 
        RowBox[{
        "SetGameToNonZeroMonotonic", "\[Rule]", 
         "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}]}], "]"}], ",", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"(", 
       RowBox[{
       "TUG`TuGames`Private`zmonoQ$36497", "||", 
        "TUG`TuGames`Private`kernQ$36497"}], ")"}], "\[Equal]", "False"}], 
     ",", 
     RowBox[{
      RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ02", "[", 
       RowBox[{
       "TUG`TuGames`Private`zmonoQ$36497", ",", 
        "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
      RowBox[{"TUG`TuGames`Private`KernelSubCallZero", "[", 
       RowBox[{
       "TUG`TuGames`Private`orggame$36497", ",", 
        "TUG`TuGames`Private`callm$36497", ",", 
        "TUG`TuGames`Private`changeps$36497", ",", 
        "TUG`TuGames`Private`dispres$36497", ",", 
        RowBox[{
        "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], ",", 
        RowBox[{
        "SetGameToNonZeroMonotonic", "\[Rule]", 
         "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{"TUG`TuGames`Private`kernQ$36497", "\[Equal]", "False"}], ",", 
       
       RowBox[{
        RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ03", "[", 
         RowBox[{
         "TUG`TuGames`Private`zmonoQ$36497", ",", 
          "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
        RowBox[{"TUG`TuGames`Private`KernelSubCallEmpty", "[", 
         RowBox[{
         "TUG`TuGames`Private`orggame$36497", ",", 
          "TUG`TuGames`Private`callm$36497", ",", 
          "TUG`TuGames`Private`changeps$36497", ",", 
          "TUG`TuGames`Private`dispres$36497", ",", 
          RowBox[{
          "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
          ",", 
          RowBox[{
          "SetGameToNonZeroMonotonic", "\[Rule]", 
           "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"TUG`TuGames`Private`avcQ$36497", "\[Equal]", "True"}], ",", 
         
         RowBox[{
          RowBox[{
          "TUG`TuGames`Private`DisplayAvcQ", "[", 
           "TUG`TuGames`Private`avcQ$36497", "]"}], ";", 
          RowBox[{"TUG`TuGames`Private`KernelSubCall", "[", 
           RowBox[{
           "TUG`TuGames`Private`orggame$36497", ",", 
            "TUG`TuGames`Private`callm$36497", ",", 
            "TUG`TuGames`Private`changeps$36497", ",", 
            "TUG`TuGames`Private`dispres$36497", ",", 
            RowBox[{
            "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
            ",", 
            RowBox[{
            "SetGameToNonZeroMonotonic", "\[Rule]", 
             "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
         RowBox[{
          RowBox[{
          "TUG`TuGames`Private`DisplayAvcQ", "[", 
           "TUG`TuGames`Private`avcQ$36497", "]"}], ";", 
          RowBox[{"TUG`TuGames`Private`KernelSubCall", "[", 
           RowBox[{
           "TUG`TuGames`Private`orggame$36497", ",", 
            "TUG`TuGames`Private`callm$36497", ",", 
            "TUG`TuGames`Private`changeps$36497", ",", 
            "TUG`TuGames`Private`dispres$36497", ",", 
            RowBox[{
            "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
            ",", 
            RowBox[{
            "SetGameToNonZeroMonotonic", "\[Rule]", 
             "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}]}], "]"}]}], 
      "]"}]}], "]"}]}], "]"}]], "Output",ExpressionUUID->"8a48dd0d-938a-4512-\
9fc5-86b6a576457b"]
}, Open  ]],

Cell[TextData[{
 "The list ",
 StyleBox["sol11 ",
  FontSlant->"Italic"],
 "captures all output informations. If we do not care about the data format \
of ",
 StyleBox["sol11 ",
  FontSlant->"Italic"],
 "and try to hand over the payoff informations contained in it to the \
function ",
 StyleBox["BelongToCoreQ[]",
  FontWeight->"Bold"],
 ", this produces"
}], "Text",
 TextJustification->1,ExpressionUUID->"f6ce9891-18a6-4a0c-a812-38a4a837d208"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BelongToCoreQ", "[", 
  RowBox[{"ExpGame11", ",", "sol11"}], "]"}]], "Input",ExpressionUUID->\
"5fbd2374-191d-43d4-abb0-a0a62c319a74"],

Cell[BoxData[
 TemplateBox[{
  "MapThread","mptc",
   "\"Incompatible dimensions of objects at positions {2, \\!\\(\\*RowBox[{\\\
\"1\\\"}]\\)} and {2, \\!\\(\\*RowBox[{\\\"2\\\"}]\\)} of \\!\\(\\*RowBox[{\\\
\"MapThread\\\", \\\"[\\\", RowBox[{RowBox[{RowBox[{\\\"(\\\", \
RowBox[{RowBox[{\\\"v\\\", \\\"[\\\", \\\"#1\\\", \\\"]\\\"}], \\\"=\\\", \
\\\"#2\\\"}], \\\")\\\"}], \\\"&\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{RowBox[{\\\"{\\\", RowBox[{RowBox[{\\\"{\\\", \\\"}\\\"}], \\\",\\\", \
RowBox[{\\\"{\\\", \\\"1\\\", \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
\\\"2\\\", \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"3\\\", \\\"}\\\"}], \
\\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\"}], \
\\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \
\\\"3\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"2\\\", \\\
\",\\\", \\\"3\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\", \\\",\\\", \\\"3\\\"}], \
\\\"}\\\"}]}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"0\\\", \
\\\"}\\\"}]}], \\\"}\\\"}]}], \\\"]\\\"}]\\); dimensions are \
\\!\\(\\*RowBox[{\\\"8\\\"}]\\) and \\!\\(\\*RowBox[{\\\"1\\\"}]\\).\"",2,272,
   20,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"ee165034-6ed5-4eb7-bf0a-aad86e85820e"],

Cell[BoxData[
 RowBox[{"BelongToCoreQ", "[", 
  RowBox[{"Null", ",", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"0", "<", 
         RowBox[{"TUG`TuGames`Private`e", "-", "TUG`TuGames`Private`f"}]}], 
        ",", "TUG`TuGames`Private`fieps$36497", ",", 
        "TUG`TuGames`Private`epsi1$36497"}], "]"}], "\[NotEqual]", "0"}], ",", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{
         "TUG`TuGames`Private`zmonoQ$36497", "||", 
          "TUG`TuGames`Private`kernQ$36497"}], ")"}], "\[Equal]", "True"}], 
       ",", 
       RowBox[{
        RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ01", "[", 
         RowBox[{
         "TUG`TuGames`Private`zmonoQ$36497", ",", 
          "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
        RowBox[{"TUG`TuGames`Private`KernelPoints", "[", 
         RowBox[{"TUG`TuGames`Private`orggame$36497", ",", 
          RowBox[{"{", "}"}], ",", "TUG`TuGames`Private`callm$36497", ",", 
          "TUG`TuGames`Private`changeps$36497", ",", 
          "TUG`TuGames`Private`dispres$36497", ",", 
          RowBox[{
          "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}]}], 
         "]"}]}], ",", 
       RowBox[{
        RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ02", "[", 
         RowBox[{
         "TUG`TuGames`Private`zmonoQ$36497", ",", 
          "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
        RowBox[{"TUG`TuGames`Private`KernelSubCallZero", "[", 
         RowBox[{
         "TUG`TuGames`Private`orggame$36497", ",", 
          "TUG`TuGames`Private`callm$36497", ",", 
          "TUG`TuGames`Private`changeps$36497", ",", 
          "TUG`TuGames`Private`dispres$36497", ",", 
          RowBox[{
          "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
          ",", 
          RowBox[{
          "SetGameToNonZeroMonotonic", "\[Rule]", 
           "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}]}], "]"}], ",", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"(", 
         RowBox[{
         "TUG`TuGames`Private`zmonoQ$36497", "||", 
          "TUG`TuGames`Private`kernQ$36497"}], ")"}], "\[Equal]", "False"}], 
       ",", 
       RowBox[{
        RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ02", "[", 
         RowBox[{
         "TUG`TuGames`Private`zmonoQ$36497", ",", 
          "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
        RowBox[{"TUG`TuGames`Private`KernelSubCallZero", "[", 
         RowBox[{
         "TUG`TuGames`Private`orggame$36497", ",", 
          "TUG`TuGames`Private`callm$36497", ",", 
          "TUG`TuGames`Private`changeps$36497", ",", 
          "TUG`TuGames`Private`dispres$36497", ",", 
          RowBox[{
          "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
          ",", 
          RowBox[{
          "SetGameToNonZeroMonotonic", "\[Rule]", 
           "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"TUG`TuGames`Private`kernQ$36497", "\[Equal]", "False"}], 
         ",", 
         RowBox[{
          RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ03", "[", 
           RowBox[{
           "TUG`TuGames`Private`zmonoQ$36497", ",", 
            "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
          RowBox[{"TUG`TuGames`Private`KernelSubCallEmpty", "[", 
           RowBox[{
           "TUG`TuGames`Private`orggame$36497", ",", 
            "TUG`TuGames`Private`callm$36497", ",", 
            "TUG`TuGames`Private`changeps$36497", ",", 
            "TUG`TuGames`Private`dispres$36497", ",", 
            RowBox[{
            "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
            ",", 
            RowBox[{
            "SetGameToNonZeroMonotonic", "\[Rule]", 
             "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"TUG`TuGames`Private`avcQ$36497", "\[Equal]", "True"}], 
           ",", 
           RowBox[{
            RowBox[{
            "TUG`TuGames`Private`DisplayAvcQ", "[", 
             "TUG`TuGames`Private`avcQ$36497", "]"}], ";", 
            RowBox[{"TUG`TuGames`Private`KernelSubCall", "[", 
             RowBox[{
             "TUG`TuGames`Private`orggame$36497", ",", 
              "TUG`TuGames`Private`callm$36497", ",", 
              "TUG`TuGames`Private`changeps$36497", ",", 
              "TUG`TuGames`Private`dispres$36497", ",", 
              RowBox[{
              "EpsilonValue", "\[Rule]", 
               "TUG`TuGames`Private`epsilon$36497"}], ",", 
              RowBox[{
              "SetGameToNonZeroMonotonic", "\[Rule]", 
               "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
           RowBox[{
            RowBox[{
            "TUG`TuGames`Private`DisplayAvcQ", "[", 
             "TUG`TuGames`Private`avcQ$36497", "]"}], ";", 
            RowBox[{"TUG`TuGames`Private`KernelSubCall", "[", 
             RowBox[{
             "TUG`TuGames`Private`orggame$36497", ",", 
              "TUG`TuGames`Private`callm$36497", ",", 
              "TUG`TuGames`Private`changeps$36497", ",", 
              "TUG`TuGames`Private`dispres$36497", ",", 
              RowBox[{
              "EpsilonValue", "\[Rule]", 
               "TUG`TuGames`Private`epsilon$36497"}], ",", 
              RowBox[{
              "SetGameToNonZeroMonotonic", "\[Rule]", 
               "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}]}], 
          "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}]], "Output",ExpressionUUID-\
>"852fb691-3cfd-42cc-a2fd-ab0142d02a3d"]
}, Open  ]],

Cell[TextData[{
 "The payoff informations in the list ",
 StyleBox["sol11",
  FontSlant->"Italic"],
 " are contained at the first and fourth position. To have access on these \
information one must extract these informations from the list. To extract \
informations located at the first or fourth position can be done by"
}], "Text",
 TextJustification->1,ExpressionUUID->"9759eaa7-91ca-4627-a9ce-8615aa252518"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"sol11", "[", 
  RowBox[{"[", "1", "]"}], "]"}]], "Input",ExpressionUUID->"35700bfb-f71b-\
41c0-a9e4-ab51e519f0ca"],

Cell[BoxData[
 RowBox[{
  RowBox[{"If", "[", 
   RowBox[{
    RowBox[{"0", "<", 
     RowBox[{"TUG`TuGames`Private`e", "-", "TUG`TuGames`Private`f"}]}], ",", 
    "TUG`TuGames`Private`fieps$36497", ",", 
    "TUG`TuGames`Private`epsi1$36497"}], "]"}], "\[NotEqual]", 
  "0"}]], "Output",ExpressionUUID->"d87c6e58-8670-4b77-81c1-f3e61b3c7619"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"sol11", "[", 
  RowBox[{"[", "4", "]"}], "]"}]], "Input",ExpressionUUID->"2a2deb01-891a-\
4b80-84ba-12dade055693"],

Cell[BoxData[
 TemplateBox[{
  "Part","partw",
   "\"Part \\!\\(\\*RowBox[{\\\"4\\\"}]\\) of \\!\\(\\*RowBox[{\\\"If\\\", \\\
\"[\\\", RowBox[{RowBox[{RowBox[{\\\"If\\\", \\\"[\\\", RowBox[{RowBox[{\\\"0\
\\\", \\\"<\\\", RowBox[{\\\"TUG`TuGames`Private`e\\\", \\\"-\\\", \
\\\"TUG`TuGames`Private`f\\\"}]}], \\\",\\\", \
\\\"TUG`TuGames`Private`fieps$36497\\\", \\\",\\\", \
\\\"TUG`TuGames`Private`epsi1$36497\\\"}], \\\"]\\\"}], \\\"\[NotEqual]\\\", \
\\\"0\\\"}], \\\",\\\", RowBox[{\\\"If\\\", \\\"[\\\", \
RowBox[{RowBox[{RowBox[{\\\"(\\\", \
RowBox[{\\\"TUG`TuGames`Private`zmonoQ$36497\\\", \\\"||\\\", \
\\\"TUG`TuGames`Private`kernQ$36497\\\"}], \\\")\\\"}], \\\"\[Equal]\\\", \
\\\"True\\\"}], \\\",\\\", RowBox[{\\\"\[LeftSkeleton]\\\", \\\"1\\\", \\\"\
\[RightSkeleton]\\\"}], \\\",\\\", \
RowBox[{RowBox[{\\\"TUG`TuGames`Private`DisplayZmQKerQ02\\\", \\\"[\\\", \
RowBox[{\\\"\[LeftSkeleton]\\\", \\\"1\\\", \\\"\[RightSkeleton]\\\"}], \\\"]\
\\\"}], \\\";\\\", RowBox[{\\\"\[LeftSkeleton]\\\", \\\"1\\\", \\\"\
\[RightSkeleton]\\\"}]}]}], \\\"]\\\"}], \\\",\\\", RowBox[{\\\"If\\\", \\\"[\
\\\", RowBox[{\\\"\[LeftSkeleton]\\\", \\\"1\\\", \\\"\[RightSkeleton]\\\"}], \
\\\"]\\\"}]}], \\\"]\\\"}]\\) does not exist.\"",2,274,21,
   17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"0d428952-1ec9-47a3-9ce5-6580edd77274"],

Cell[BoxData[
 RowBox[{
  RowBox[{"If", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{"0", "<", 
        RowBox[{"TUG`TuGames`Private`e", "-", "TUG`TuGames`Private`f"}]}], 
       ",", "TUG`TuGames`Private`fieps$36497", ",", 
       "TUG`TuGames`Private`epsi1$36497"}], "]"}], "\[NotEqual]", "0"}], ",", 
    
    RowBox[{"If", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"(", 
        RowBox[{
        "TUG`TuGames`Private`zmonoQ$36497", "||", 
         "TUG`TuGames`Private`kernQ$36497"}], ")"}], "\[Equal]", "True"}], 
      ",", 
      RowBox[{
       RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ01", "[", 
        RowBox[{
        "TUG`TuGames`Private`zmonoQ$36497", ",", 
         "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
       RowBox[{"TUG`TuGames`Private`KernelPoints", "[", 
        RowBox[{"TUG`TuGames`Private`orggame$36497", ",", 
         RowBox[{"{", "}"}], ",", "TUG`TuGames`Private`callm$36497", ",", 
         "TUG`TuGames`Private`changeps$36497", ",", 
         "TUG`TuGames`Private`dispres$36497", ",", 
         RowBox[{
         "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}]}], 
        "]"}]}], ",", 
      RowBox[{
       RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ02", "[", 
        RowBox[{
        "TUG`TuGames`Private`zmonoQ$36497", ",", 
         "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
       RowBox[{"TUG`TuGames`Private`KernelSubCallZero", "[", 
        RowBox[{
        "TUG`TuGames`Private`orggame$36497", ",", 
         "TUG`TuGames`Private`callm$36497", ",", 
         "TUG`TuGames`Private`changeps$36497", ",", 
         "TUG`TuGames`Private`dispres$36497", ",", 
         RowBox[{
         "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
         ",", 
         RowBox[{
         "SetGameToNonZeroMonotonic", "\[Rule]", 
          "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}]}], "]"}], ",", 
    
    RowBox[{"If", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"(", 
        RowBox[{
        "TUG`TuGames`Private`zmonoQ$36497", "||", 
         "TUG`TuGames`Private`kernQ$36497"}], ")"}], "\[Equal]", "False"}], 
      ",", 
      RowBox[{
       RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ02", "[", 
        RowBox[{
        "TUG`TuGames`Private`zmonoQ$36497", ",", 
         "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
       RowBox[{"TUG`TuGames`Private`KernelSubCallZero", "[", 
        RowBox[{
        "TUG`TuGames`Private`orggame$36497", ",", 
         "TUG`TuGames`Private`callm$36497", ",", 
         "TUG`TuGames`Private`changeps$36497", ",", 
         "TUG`TuGames`Private`dispres$36497", ",", 
         RowBox[{
         "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
         ",", 
         RowBox[{
         "SetGameToNonZeroMonotonic", "\[Rule]", 
          "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"TUG`TuGames`Private`kernQ$36497", "\[Equal]", "False"}], ",", 
        RowBox[{
         RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ03", "[", 
          RowBox[{
          "TUG`TuGames`Private`zmonoQ$36497", ",", 
           "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
         RowBox[{"TUG`TuGames`Private`KernelSubCallEmpty", "[", 
          RowBox[{
          "TUG`TuGames`Private`orggame$36497", ",", 
           "TUG`TuGames`Private`callm$36497", ",", 
           "TUG`TuGames`Private`changeps$36497", ",", 
           "TUG`TuGames`Private`dispres$36497", ",", 
           RowBox[{
           "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
           ",", 
           RowBox[{
           "SetGameToNonZeroMonotonic", "\[Rule]", 
            "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"TUG`TuGames`Private`avcQ$36497", "\[Equal]", "True"}], ",", 
          RowBox[{
           RowBox[{
           "TUG`TuGames`Private`DisplayAvcQ", "[", 
            "TUG`TuGames`Private`avcQ$36497", "]"}], ";", 
           RowBox[{"TUG`TuGames`Private`KernelSubCall", "[", 
            RowBox[{
            "TUG`TuGames`Private`orggame$36497", ",", 
             "TUG`TuGames`Private`callm$36497", ",", 
             "TUG`TuGames`Private`changeps$36497", ",", 
             "TUG`TuGames`Private`dispres$36497", ",", 
             RowBox[{
             "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}],
              ",", 
             RowBox[{
             "SetGameToNonZeroMonotonic", "\[Rule]", 
              "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
          RowBox[{
           RowBox[{
           "TUG`TuGames`Private`DisplayAvcQ", "[", 
            "TUG`TuGames`Private`avcQ$36497", "]"}], ";", 
           RowBox[{"TUG`TuGames`Private`KernelSubCall", "[", 
            RowBox[{
            "TUG`TuGames`Private`orggame$36497", ",", 
             "TUG`TuGames`Private`callm$36497", ",", 
             "TUG`TuGames`Private`changeps$36497", ",", 
             "TUG`TuGames`Private`dispres$36497", ",", 
             RowBox[{
             "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}],
              ",", 
             RowBox[{
             "SetGameToNonZeroMonotonic", "\[Rule]", 
              "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}]}], "]"}]}],
        "]"}]}], "]"}]}], "]"}], "\[LeftDoubleBracket]", "4", 
  "\[RightDoubleBracket]"}]], "Output",ExpressionUUID->"f882aeb1-9a2a-4057-\
bfb6-9d9db5149ea3"]
}, Open  ]],

Cell[TextData[{
 "These are the correct input formats to hand over to the function ",
 StyleBox["BelongToCoreQ[]",
  FontWeight->"Bold"],
 "."
}], "Text",ExpressionUUID->"2e8582a9-063d-4317-89e9-a894ffb5edee"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BelongToCoreQ", "[", 
  RowBox[{"ExpGame11", ",", 
   RowBox[{"sol11", "[", 
    RowBox[{"[", "4", "]"}], "]"}]}], "]"}]], "Input",ExpressionUUID->\
"bf9d5768-03b8-4129-94ed-d19164f717b4"],

Cell[BoxData[
 TemplateBox[{
  "MapThread","mptc",
   "\"Incompatible dimensions of objects at positions {2, \\!\\(\\*RowBox[{\\\
\"1\\\"}]\\)} and {2, \\!\\(\\*RowBox[{\\\"2\\\"}]\\)} of \\!\\(\\*RowBox[{\\\
\"MapThread\\\", \\\"[\\\", RowBox[{RowBox[{RowBox[{\\\"(\\\", \
RowBox[{RowBox[{\\\"v\\\", \\\"[\\\", \\\"#1\\\", \\\"]\\\"}], \\\"=\\\", \
\\\"#2\\\"}], \\\")\\\"}], \\\"&\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{RowBox[{\\\"{\\\", RowBox[{RowBox[{\\\"{\\\", \\\"}\\\"}], \\\",\\\", \
RowBox[{\\\"{\\\", \\\"1\\\", \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
\\\"2\\\", \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"3\\\", \\\"}\\\"}], \
\\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\"}], \
\\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"1\\\", \\\",\\\", \
\\\"3\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", RowBox[{\\\"2\\\", \\\
\",\\\", \\\"3\\\"}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \
RowBox[{\\\"1\\\", \\\",\\\", \\\"2\\\", \\\",\\\", \\\"3\\\"}], \
\\\"}\\\"}]}], \\\"}\\\"}], \\\",\\\", RowBox[{\\\"{\\\", \\\"0\\\", \
\\\"}\\\"}]}], \\\"}\\\"}]}], \\\"]\\\"}]\\); dimensions are \
\\!\\(\\*RowBox[{\\\"8\\\"}]\\) and \\!\\(\\*RowBox[{\\\"1\\\"}]\\).\"",2,275,
   22,17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"546506fe-ab97-4124-a3e5-95e58bd20508"],

Cell[BoxData[
 TemplateBox[{
  "Part","partw",
   "\"Part \\!\\(\\*RowBox[{\\\"4\\\"}]\\) of \\!\\(\\*RowBox[{\\\"If\\\", \\\
\"[\\\", RowBox[{RowBox[{RowBox[{\\\"If\\\", \\\"[\\\", RowBox[{RowBox[{\\\"0\
\\\", \\\"<\\\", RowBox[{\\\"TUG`TuGames`Private`e\\\", \\\"-\\\", \
\\\"TUG`TuGames`Private`f\\\"}]}], \\\",\\\", \
\\\"TUG`TuGames`Private`fieps$36497\\\", \\\",\\\", \
\\\"TUG`TuGames`Private`epsi1$36497\\\"}], \\\"]\\\"}], \\\"\[NotEqual]\\\", \
\\\"0\\\"}], \\\",\\\", RowBox[{\\\"If\\\", \\\"[\\\", \
RowBox[{RowBox[{RowBox[{\\\"(\\\", \
RowBox[{\\\"TUG`TuGames`Private`zmonoQ$36497\\\", \\\"||\\\", \
\\\"TUG`TuGames`Private`kernQ$36497\\\"}], \\\")\\\"}], \\\"\[Equal]\\\", \
\\\"True\\\"}], \\\",\\\", RowBox[{\\\"\[LeftSkeleton]\\\", \\\"1\\\", \\\"\
\[RightSkeleton]\\\"}], \\\",\\\", \
RowBox[{RowBox[{\\\"TUG`TuGames`Private`DisplayZmQKerQ02\\\", \\\"[\\\", \
RowBox[{\\\"\[LeftSkeleton]\\\", \\\"1\\\", \\\"\[RightSkeleton]\\\"}], \\\"]\
\\\"}], \\\";\\\", RowBox[{\\\"\[LeftSkeleton]\\\", \\\"1\\\", \\\"\
\[RightSkeleton]\\\"}]}]}], \\\"]\\\"}], \\\",\\\", RowBox[{\\\"If\\\", \\\"[\
\\\", RowBox[{\\\"\[LeftSkeleton]\\\", \\\"1\\\", \\\"\[RightSkeleton]\\\"}], \
\\\"]\\\"}]}], \\\"]\\\"}]\\) does not exist.\"",2,275,23,
   17069673192115507224,"Local"},
  "MessageTemplate"]], "Message", \
"MSG",ExpressionUUID->"29ef2fcb-62d2-4229-b1cb-a034bdf00ca7"],

Cell[BoxData[
 RowBox[{"BelongToCoreQ", "[", 
  RowBox[{"Null", ",", 
   RowBox[{
    RowBox[{"If", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"0", "<", 
          RowBox[{"TUG`TuGames`Private`e", "-", "TUG`TuGames`Private`f"}]}], 
         ",", "TUG`TuGames`Private`fieps$36497", ",", 
         "TUG`TuGames`Private`epsi1$36497"}], "]"}], "\[NotEqual]", "0"}], 
      ",", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{
          "TUG`TuGames`Private`zmonoQ$36497", "||", 
           "TUG`TuGames`Private`kernQ$36497"}], ")"}], "\[Equal]", "True"}], 
        ",", 
        RowBox[{
         RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ01", "[", 
          RowBox[{
          "TUG`TuGames`Private`zmonoQ$36497", ",", 
           "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
         RowBox[{"TUG`TuGames`Private`KernelPoints", "[", 
          RowBox[{"TUG`TuGames`Private`orggame$36497", ",", 
           RowBox[{"{", "}"}], ",", "TUG`TuGames`Private`callm$36497", ",", 
           "TUG`TuGames`Private`changeps$36497", ",", 
           "TUG`TuGames`Private`dispres$36497", ",", 
           RowBox[{
           "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}]}],
           "]"}]}], ",", 
        RowBox[{
         RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ02", "[", 
          RowBox[{
          "TUG`TuGames`Private`zmonoQ$36497", ",", 
           "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
         RowBox[{"TUG`TuGames`Private`KernelSubCallZero", "[", 
          RowBox[{
          "TUG`TuGames`Private`orggame$36497", ",", 
           "TUG`TuGames`Private`callm$36497", ",", 
           "TUG`TuGames`Private`changeps$36497", ",", 
           "TUG`TuGames`Private`dispres$36497", ",", 
           RowBox[{
           "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
           ",", 
           RowBox[{
           "SetGameToNonZeroMonotonic", "\[Rule]", 
            "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}]}], "]"}], 
      ",", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{
          "TUG`TuGames`Private`zmonoQ$36497", "||", 
           "TUG`TuGames`Private`kernQ$36497"}], ")"}], "\[Equal]", "False"}], 
        ",", 
        RowBox[{
         RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ02", "[", 
          RowBox[{
          "TUG`TuGames`Private`zmonoQ$36497", ",", 
           "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
         RowBox[{"TUG`TuGames`Private`KernelSubCallZero", "[", 
          RowBox[{
          "TUG`TuGames`Private`orggame$36497", ",", 
           "TUG`TuGames`Private`callm$36497", ",", 
           "TUG`TuGames`Private`changeps$36497", ",", 
           "TUG`TuGames`Private`dispres$36497", ",", 
           RowBox[{
           "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}], 
           ",", 
           RowBox[{
           "SetGameToNonZeroMonotonic", "\[Rule]", 
            "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"TUG`TuGames`Private`kernQ$36497", "\[Equal]", "False"}], 
          ",", 
          RowBox[{
           RowBox[{"TUG`TuGames`Private`DisplayZmQKerQ03", "[", 
            RowBox[{
            "TUG`TuGames`Private`zmonoQ$36497", ",", 
             "TUG`TuGames`Private`kernQ$36497"}], "]"}], ";", 
           RowBox[{"TUG`TuGames`Private`KernelSubCallEmpty", "[", 
            RowBox[{
            "TUG`TuGames`Private`orggame$36497", ",", 
             "TUG`TuGames`Private`callm$36497", ",", 
             "TUG`TuGames`Private`changeps$36497", ",", 
             "TUG`TuGames`Private`dispres$36497", ",", 
             RowBox[{
             "EpsilonValue", "\[Rule]", "TUG`TuGames`Private`epsilon$36497"}],
              ",", 
             RowBox[{
             "SetGameToNonZeroMonotonic", "\[Rule]", 
              "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{"TUG`TuGames`Private`avcQ$36497", "\[Equal]", "True"}], 
            ",", 
            RowBox[{
             RowBox[{
             "TUG`TuGames`Private`DisplayAvcQ", "[", 
              "TUG`TuGames`Private`avcQ$36497", "]"}], ";", 
             RowBox[{"TUG`TuGames`Private`KernelSubCall", "[", 
              RowBox[{
              "TUG`TuGames`Private`orggame$36497", ",", 
               "TUG`TuGames`Private`callm$36497", ",", 
               "TUG`TuGames`Private`changeps$36497", ",", 
               "TUG`TuGames`Private`dispres$36497", ",", 
               RowBox[{
               "EpsilonValue", "\[Rule]", 
                "TUG`TuGames`Private`epsilon$36497"}], ",", 
               RowBox[{
               "SetGameToNonZeroMonotonic", "\[Rule]", 
                "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}], ",", 
            RowBox[{
             RowBox[{
             "TUG`TuGames`Private`DisplayAvcQ", "[", 
              "TUG`TuGames`Private`avcQ$36497", "]"}], ";", 
             RowBox[{"TUG`TuGames`Private`KernelSubCall", "[", 
              RowBox[{
              "TUG`TuGames`Private`orggame$36497", ",", 
               "TUG`TuGames`Private`callm$36497", ",", 
               "TUG`TuGames`Private`changeps$36497", ",", 
               "TUG`TuGames`Private`dispres$36497", ",", 
               RowBox[{
               "EpsilonValue", "\[Rule]", 
                "TUG`TuGames`Private`epsilon$36497"}], ",", 
               RowBox[{
               "SetGameToNonZeroMonotonic", "\[Rule]", 
                "TUG`TuGames`Private`notzeromono$36497"}]}], "]"}]}]}], 
           "]"}]}], "]"}]}], "]"}]}], "]"}], "\[LeftDoubleBracket]", "4", 
    "\[RightDoubleBracket]"}]}], "]"}]], "Output",ExpressionUUID->"56d8fdb8-\
6fa6-4058-af95-6baa3ac87357"]
}, Open  ]],

Cell[TextData[{
 "At the end let us mention that ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " offers you the possibility to enhance your typesetting productivity. As \
you have already realized some commands have rather lengthy names that makes \
it very inconvenient to type in every letter in the notebook. To overcome \
these inconveniences ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " offers you a command and symbol-name completion. This can be achieved by \
invoking together the control key  (abbreviated by ",
 StyleBox["C^",
  FontWeight->"Bold"],
 ") and the key of the letter ",
 StyleBox["k",
  FontWeight->"Bold"],
 ". For instance to complete the command ",
 StyleBox["MinUnanimityCoordinates[]",
  FontWeight->"Bold"],
 " type the first four letters of the command and use the key combination ",
 StyleBox["C^k",
  FontWeight->"Bold"],
 " to complete the command. Hence"
}], "Text",
 TextJustification->1,ExpressionUUID->"11dc65f6-ae14-4c30-a524-b037e946a28e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MinU", " "}]], "Input",ExpressionUUID->"a187b1bc-11eb-47fa-a0b4-2516965a4c98"],

Cell[BoxData["MinU"], "Output",ExpressionUUID->"d9e7c403-f616-43b4-ae40-89e952c8e633"]
}, Open  ]],

Cell[TextData[{
 "Invoking ",
 StyleBox["C^k",
  FontWeight->"Bold"],
 " completes the command."
}], "Text",ExpressionUUID->"974fa306-ab65-4256-9b63-b77adfadd806"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MinUnanimityCoordinates", " "}]], "Input",ExpressionUUID->"e09e2a93-06e6-417e-9da9-f4d26c6150f6"],

Cell[BoxData["MinUnanimityCoordinates"], "Output",ExpressionUUID->"ae4c8ac6-1dfc-46e4-b42c-9cbab3effcc5"]
}, Open  ]],

Cell[TextData[{
 "Now introducing the ",
 StyleBox["game_name",
  FontSlant->"Italic"],
 " in the command can also be performed by the",
 StyleBox[" C^k",
  FontWeight->"Bold"],
 " key combination. In this case you must again type in the first four \
letters of the ",
 StyleBox["game_name",
  FontSlant->"Italic"],
 " "
}], "Text",
 TextJustification->1,ExpressionUUID->"e7cda174-487c-41ff-82ed-3b7da3f3a620"],

Cell[BoxData[
 RowBox[{"MinUnanimityCoordinates", "[", "ExpG", " "}]], "Input",
 EmphasizeSyntaxErrors->
  True,ExpressionUUID->"7ace3bf2-509c-4b27-8592-cd490d628ecf"],

Cell[TextData[{
 "then invoke ",
 StyleBox["C^k",
  FontWeight->"Bold"],
 " and you obtain"
}], "Text",ExpressionUUID->"749a9e5a-d19f-4fa6-ba10-a6b489e3a8f5"],

Cell[BoxData[
 RowBox[{" ", 
  RowBox[{"MinUnanimityCoordinates", "[", "ExpGame1", " "}]}]], "Input",
 EmphasizeSyntaxErrors->
  True,ExpressionUUID->"51abbca9-4bfd-4701-a631-e7cff7503c4d"],

Cell["\<\
Finally, type the last number and the missing bracket to finish the \
typesetting.\
\>", "Text",ExpressionUUID->"8b60fd03-f743-499f-ac5a-ef3257e7a491"],

Cell[BoxData[
 RowBox[{
  RowBox[{"MinUnanimityCoordinates", "[", "ExpGame11", "]"}], "  ", 
  "*)"}]], "Input",
 EmphasizeSyntaxErrors->
  True,ExpressionUUID->"7f393687-41d7-4625-b991-216971978ec1"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[ButtonBox["7. References",
 BaseStyle->"Hyperlink",
 ButtonData:>"7."]], "Section",
 CellTags->
  "References",ExpressionUUID->"2a0c49ab-e29a-450c-81c4-f63024d5bb74"],

Cell[TextData[{
 "\n",
 ButtonBox["M. Carter",
  BaseStyle->"Hyperlink",
  ButtonData:>"1993C"],
 ", ",
 StyleBox["Cooperative Games",
  FontSlant->"Italic"],
 " , in Economic and Financial Modeling with ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 ", editor Hal R. Varian, Springer Publisher, 167-191, 1993.\n",
 ButtonBox["Theo Driessen",
  BaseStyle->"Hyperlink",
  ButtonData:>"(1988)"],
 ", ",
 StyleBox["Cooperative Games,Solutions and Applications",
  FontSlant->"Italic"],
 ", Kluwer Academic Publishers, Dordrecht, 1988.\n",
 ButtonBox["U. Faigle, W. Kern and J. Kuipers",
  BaseStyle->"Hyperlink",
  ButtonData:>"Faigle98"],
 ", An efficient algorithm for nucleolus and prekernel computation in some \
classes of Tu Games, Memorandum No. 1464, Faculty of Mathematical Sciences, \
University of Twente, 1998.\n",
 ButtonBox["E. Inarra and J. Usategui",
  BaseStyle->"Hyperlink",
  ButtonData:>"(1993)"],
 ",  ",
 StyleBox["The Shapley value and average convex games",
  FontSlant->"Italic"],
 ",  IJGT, 22, 13-29, 1993.\n",
 ButtonBox["Maschler, M. and Peleg",
  BaseStyle->"Hyperlink",
  ButtonData:>"MP66"],
 ", B.,A Characterization, Existence Proof and Dimension Bounds for the \
Kernel of a Game , Pacific Journal of Mathematics 18(2), 289 328, 1966.\n",
 ButtonBox["M. Maschler,B. Peleg and L.S. Shapley",
  BaseStyle->"Hyperlink",
  ButtonData:>"(1979)"],
 ", ",
 StyleBox["Geometric Properties of Kernel, Nucleolus and related Concepts",
  FontSlant->"Italic"],
 ", in Mathematics of Operations Research, Vol.4, Nov. 1979, p.303-338.\n",
 ButtonBox["H. Meinhardt",
  BaseStyle->"Hyperlink",
  ButtonData:>"(2002a)"],
 ", ",
 StyleBox["Decision Making in Cooperative Common Pool Situations",
  FontSlant->"Italic"],
 ", Lecture Notes in Economics and ",
 StyleBox["Mathematical",
  FontVariations->{"CompatibilityType"->0}],
 " Systems, Vol. 517, 2002a, Springer, Heidelberg. \n",
 ButtonBox["H. Meinhardt",
  BaseStyle->"Hyperlink",
  ButtonData:>"(2002b)"],
 ", ",
 StyleBox["An LP approach to compute the pre-kernel for cooperative games,",
  FontSlant->"Italic"],
 " forthcoming in Computers and Operation Research, 2004. \n",
 ButtonBox["C. Rafels and N. Ybern",
  BaseStyle->"Hyperlink",
  ButtonData:>"(1995)"],
 ",  ",
 StyleBox["Even and Odd Marginal Worth Vectors, Owen's Multilinear Extension \
and Convex Games",
  FontSlant->"Italic"],
 ", IJGT, 113-126, 1995.\n",
 ButtonBox["Hal R. Varian",
  BaseStyle->"Hyperlink",
  ButtonData:>"1993"],
 " (Ed.), ",
 StyleBox["Economics and Financial Modeling with Mathematica",
  FontSlant->"Italic"],
 ", Springer,1993"
}], "Text",
 CellTags->{
  "M. Carter", "Theo Driessen", "E. Inarra", "M. Maschler", "H. Meinhardt", 
   "C. Rafels", 
   "Hal R. Varian"},ExpressionUUID->"158bbfc9-6f26-448d-aee5-d4f089358e3f"]
}, Open  ]]
},
ScreenStyleEnvironment->"Presentation",
WindowSize->{889, 630},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
PrintingPageRange->{Automatic, Automatic},
PrintingOptions->{"Magnification"->1,
"PaperOrientation"->"Portrait",
"PaperSize"->{597.562, 842.375},
"PostScriptOutputFile":>FrontEnd`FileName[{$RootDirectory, "home", "holger", 
   "mathe", "EntwPackages", "Documentation", "Englisch"}, 
  "ManualTuGames.nb.ps", CharacterEncoding -> "iso8859-1"]},
ShowCellBracket->Automatic,
ShowSelection->True,
Deployed->True,
CellContext->Notebook,
CellLabelAutoDelete->True,
TrackCellChangeTimes->False,
LineSpacing->{3, 1},
Magnification->1,
FrontEndVersion->"11.3 for Linux x86 (64-bit) (March 6, 2018)",
StyleDefinitions->"Demo.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{
 "1."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "2."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "2.1."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "2.2."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "2.3."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "3."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "4."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "4.1."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "4.2."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "4.3."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "4.4."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "5."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "6."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "7."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "3.1."->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "Vertices"->{
  Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
   CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]},
 "Introduction"->{
  Cell[3564, 112, 183, 4, 115, "Section",ExpressionUUID->"7050b662-8152-4594-885b-73ef738c1cc4",
   CellTags->"Introduction"]},
 "http://www.ifor.math.ethz.ch/staff/fukuda/fukuda.html"->{
  Cell[3750, 118, 3736, 88, 694, "Text",ExpressionUUID->"912525f5-9211-48c0-850f-47c7c3a70fa3",
   CellTags->{"http://www.ifor.math.ethz.ch/staff/fukuda/fukuda.html", "1993", "1993C"}]},
 "1993"->{
  Cell[3750, 118, 3736, 88, 694, "Text",ExpressionUUID->"912525f5-9211-48c0-850f-47c7c3a70fa3",
   CellTags->{"http://www.ifor.math.ethz.ch/staff/fukuda/fukuda.html", "1993", "1993C"}]},
 "1993C"->{
  Cell[3750, 118, 3736, 88, 694, "Text",ExpressionUUID->"912525f5-9211-48c0-850f-47c7c3a70fa3",
   CellTags->{"http://www.ifor.math.ethz.ch/staff/fukuda/fukuda.html", "1993", "1993C"}]},
 "Installation"->{
  Cell[7523, 211, 184, 4, 115, "Section",ExpressionUUID->"10587ea2-1bc7-4a13-a84c-be4a6205b9e8",
   CellTags->"Installation"]},
 "Unix"->{
  Cell[7732, 219, 175, 3, 56, "Subsubsection",ExpressionUUID->"81a61f5e-4afc-4131-b5e6-03e10c0a62e7",
   CellTags->"Unix"]},
 "Windows"->{
  Cell[9831, 297, 181, 3, 56, "Subsubsection",ExpressionUUID->"27c5367b-8fb3-411c-be30-0348e2815ade",
   CellTags->"Windows"]},
 "Mac OS"->{
  Cell[11951, 363, 180, 3, 56, "Subsubsection",ExpressionUUID->"139111de-5469-4d31-b828-584f1fe378fb",
   CellTags->"Mac OS"]},
 "Getting Started"->{
  Cell[12340, 376, 190, 4, 115, "Section",ExpressionUUID->"3c85833c-6e0a-4dfb-b75b-9f9dc2376db7",
   CellTags->"Getting Started"]},
 "Info3264939207-8254035"->{
  Cell[70143, 1888, 223, 4, 67, "Print",ExpressionUUID->"2fa85c85-63fd-407e-b43c-6c01d0de944e",
   CellTags->"Info3264939207-8254035"]},
 "Info43757086656-2696204"->{
  Cell[70657, 1903, 234, 4, 50, "Print",ExpressionUUID->"cc496c95-5e82-4c83-918b-0ba1b63c8157",
   CellTags->"Info43757086656-2696204"]},
 "How to define Games?"->{
  Cell[71124, 1919, 212, 5, 56, "Subsubsection",ExpressionUUID->"4244e44e-d670-4746-9f63-76a2f56da346",
   CellTags->"How to define Games?"]},
 "DefineGame"->{
  Cell[71339, 1926, 1574, 48, 280, "Text",ExpressionUUID->"ea453bd5-c39b-4d7f-afb3-5bbea51fdb05",
   CellTags->"DefineGame"]},
 "(1979)"->{
  Cell[77726, 2126, 298, 7, 68, "Text",ExpressionUUID->"fbdc55aa-1330-4335-9b17-f50c6300de5a",
   CellTags->"(1979)"]},
 "Info133757086683-2696204"->{
  Cell[82262, 2264, 186, 3, 50, "Print",ExpressionUUID->"ae20088c-465d-4464-aa90-f79e22bb2344",
   CellTags->"Info133757086683-2696204"]},
 "Some Functions"->{
  Cell[82934, 2285, 188, 4, 115, "Section",ExpressionUUID->"6a911259-b386-4611-8e1a-afb9bbcf33f5",
   CellTags->"Some Functions"]},
 "Basic Functions"->{
  Cell[85274, 2332, 215, 5, 51, "Subsubsection",ExpressionUUID->"47bf0c18-37a4-4a2b-ae12-ae68e74ea64f",
   CellTags->"Basic Functions"]},
 "(1993)"->{
  Cell[87352, 2391, 780, 16, 179, "Text",ExpressionUUID->"e3fc2368-7c99-4863-b4bc-c29f4a066be9",
   CellTags->"(1993)"]},
 "k-convexity"->{
  Cell[100371, 2818, 206, 5, 51, "Subsubsection",ExpressionUUID->"de46248f-54a6-46b2-90c8-0e709b5e5b30",
   CellTags->"k-convexity"]},
 "(1988)"->{
  Cell[100580, 2825, 2047, 51, 288, "Text",ExpressionUUID->"e37224d0-86d4-4193-88ad-344131ad7610",
   CellTags->{"(1988)", "(2002a)"}]},
 "(2002a)"->{
  Cell[100580, 2825, 2047, 51, 288, "Text",ExpressionUUID->"e37224d0-86d4-4193-88ad-344131ad7610",
   CellTags->{"(1988)", "(2002a)"}]},
 "1988"->{
  Cell[110789, 3140, 724, 26, 68, "Text",ExpressionUUID->"ff740967-b815-45db-9a3f-33b03d545437",
   CellTags->"1988"],
  Cell[111516, 3168, 840, 26, 48, "Text",ExpressionUUID->"9e9a8098-160d-4818-ae4b-1a1462d2f086",
   CellTags->"1988"],
  Cell[112359, 3196, 1167, 37, 75, "Text",ExpressionUUID->"e3e6ccf3-cb30-44a1-9fbb-742a43bc0834",
   CellTags->"1988"],
  Cell[113529, 3235, 1109, 37, 53, "Text",ExpressionUUID->"a1e010fc-732b-4c5b-af0f-3180d3bef8f0",
   CellTags->"1988"],
  Cell[114641, 3274, 1568, 48, 158, "Text",ExpressionUUID->"5c5d5a90-6d74-4ea7-9c91-7861afa1d568",
   CellTags->"1988"]},
 "Kernel"->{
  Cell[174030, 5157, 193, 4, 51, "Subsubsection",ExpressionUUID->"dfacf308-d438-4638-ac72-6c8715ee7e47",
   CellTags->"Kernel"]},
 "(2002b)"->{
  Cell[174226, 5163, 1935, 40, 380, "Text",ExpressionUUID->"8fdfd491-8bd5-4840-9615-f8be3b740630",
   CellTags->"(2002b)"]},
 "MP66"->{
  Cell[263154, 7713, 1741, 56, 170, "Text",ExpressionUUID->"8a324c01-cc18-4c5d-a6b9-7312e880f7f9",
   CellTags->"MP66"]},
 "Faigle98"->{
  Cell[274169, 8080, 822, 15, 200, "Text",ExpressionUUID->"1fa0b706-8727-48c8-8a47-c18f6fc233d9",
   CellTags->"Faigle98"]},
 "Unanimity Coordinates"->{
  Cell[442393, 12890, 214, 5, 56, "Subsubsection",ExpressionUUID->"4be80269-b4e2-42bb-98fc-36976897c6ea",
   CellTags->"Unanimity Coordinates"]},
 "(1995)"->{
  Cell[446052, 12989, 572, 13, 113, "Text",ExpressionUUID->"13b575d7-c02f-442d-8df3-27d3d64dbd07",
   CellTags->"(1995)"],
  Cell[446627, 13004, 679, 22, 46, "Text",ExpressionUUID->"a0d6e87a-5c93-40cf-8f26-fd7555a3658a",
   CellTags->"(1995)"],
  Cell[447309, 13028, 243, 6, 68, "Text",ExpressionUUID->"0b263f13-749f-423f-8534-6e6493ee890f",
   CellTags->"(1995)"],
  Cell[447555, 13036, 1120, 39, 92, "Text",ExpressionUUID->"1eecdcd3-db10-4f1b-b780-0df234e27da5",
   CellTags->"(1995)"]},
 "5"->{
  Cell[454062, 13243, 198, 3, 115, "Section",ExpressionUUID->"7c4f7010-cbb2-404b-9d76-135441ef4685",
   CellTags->"5"]},
 "Concluding Remarks and Limitations"->{
  Cell[479930, 14049, 230, 5, 115, "Section",ExpressionUUID->"90fc73d9-0a6b-4c46-9ccd-f2ece9fefbf5",
   CellTags->"Concluding Remarks and Limitations"]},
 "Info2663757087583-2696204"->{
  Cell[487297, 14282, 187, 3, 50, "Print",ExpressionUUID->"b3626335-3eee-4307-8c34-e4d0ca45192c",
   CellTags->"Info2663757087583-2696204"],
  Cell[487487, 14287, 3673, 133, 999, "Print",ExpressionUUID->"b529fa91-4587-4752-9a33-0251384bbc7e",
   CellTags->"Info2663757087583-2696204"]},
 "Info2703757087594-2696204"->{
  Cell[498484, 14626, 187, 3, 50, "Print",ExpressionUUID->"e220bc78-9913-4af7-acf9-c540b2549689",
   CellTags->"Info2703757087594-2696204"],
  Cell[498674, 14631, 1445, 47, 239, "Print",ExpressionUUID->"2858c6b9-e803-4494-b368-d06dcb051d5c",
   CellTags->"Info2703757087594-2696204"]},
 "References"->{
  Cell[539758, 15619, 180, 4, 115, "Section",ExpressionUUID->"2a0c49ab-e29a-450c-81c4-f63024d5bb74",
   CellTags->"References"]},
 "M. Carter"->{
  Cell[539941, 15625, 2792, 80, 606, "Text",ExpressionUUID->"158bbfc9-6f26-448d-aee5-d4f089358e3f",
   CellTags->{"M. Carter", "Theo Driessen", "E. Inarra", "M. Maschler", "H. Meinhardt", "C. Rafels", "Hal R. Varian"}]},
 "Theo Driessen"->{
  Cell[539941, 15625, 2792, 80, 606, "Text",ExpressionUUID->"158bbfc9-6f26-448d-aee5-d4f089358e3f",
   CellTags->{"M. Carter", "Theo Driessen", "E. Inarra", "M. Maschler", "H. Meinhardt", "C. Rafels", "Hal R. Varian"}]},
 "E. Inarra"->{
  Cell[539941, 15625, 2792, 80, 606, "Text",ExpressionUUID->"158bbfc9-6f26-448d-aee5-d4f089358e3f",
   CellTags->{"M. Carter", "Theo Driessen", "E. Inarra", "M. Maschler", "H. Meinhardt", "C. Rafels", "Hal R. Varian"}]},
 "M. Maschler"->{
  Cell[539941, 15625, 2792, 80, 606, "Text",ExpressionUUID->"158bbfc9-6f26-448d-aee5-d4f089358e3f",
   CellTags->{"M. Carter", "Theo Driessen", "E. Inarra", "M. Maschler", "H. Meinhardt", "C. Rafels", "Hal R. Varian"}]},
 "H. Meinhardt"->{
  Cell[539941, 15625, 2792, 80, 606, "Text",ExpressionUUID->"158bbfc9-6f26-448d-aee5-d4f089358e3f",
   CellTags->{"M. Carter", "Theo Driessen", "E. Inarra", "M. Maschler", "H. Meinhardt", "C. Rafels", "Hal R. Varian"}]},
 "C. Rafels"->{
  Cell[539941, 15625, 2792, 80, 606, "Text",ExpressionUUID->"158bbfc9-6f26-448d-aee5-d4f089358e3f",
   CellTags->{"M. Carter", "Theo Driessen", "E. Inarra", "M. Maschler", "H. Meinhardt", "C. Rafels", "Hal R. Varian"}]},
 "Hal R. Varian"->{
  Cell[539941, 15625, 2792, 80, 606, "Text",ExpressionUUID->"158bbfc9-6f26-448d-aee5-d4f089358e3f",
   CellTags->{"M. Carter", "Theo Driessen", "E. Inarra", "M. Maschler", "H. Meinhardt", "C. Rafels", "Hal R. Varian"}]}
 }
*)
(*CellTagsIndex
CellTagsIndex->{
 {"1.", 543603, 15735},
 {"2.", 543842, 15738},
 {"2.1.", 544083, 15741},
 {"2.2.", 544324, 15744},
 {"2.3.", 544565, 15747},
 {"3.", 544804, 15750},
 {"4.", 545043, 15753},
 {"4.1.", 545284, 15756},
 {"4.2.", 545525, 15759},
 {"4.3.", 545766, 15762},
 {"4.4.", 546007, 15765},
 {"5.", 546246, 15768},
 {"6.", 546485, 15771},
 {"7.", 546724, 15774},
 {"3.1.", 546965, 15777},
 {"Vertices", 547210, 15780},
 {"Introduction", 547459, 15783},
 {"http://www.ifor.math.ethz.ch/staff/fukuda/fukuda.html", 547647, 15786},
 {"1993", 547845, 15789},
 {"1993C", 548044, 15792},
 {"Installation", 548250, 15795},
 {"Unix", 548389, 15798},
 {"Windows", 548528, 15801},
 {"Mac OS", 548669, 15804},
 {"Getting Started", 548819, 15807},
 {"Info3264939207-8254035", 548980, 15810},
 {"Info43757086656-2696204", 549147, 15813},
 {"How to define Games?", 549312, 15816},
 {"DefineGame", 549472, 15819},
 {"(1979)", 549612, 15822},
 {"Info133757086683-2696204", 549763, 15825},
 {"Some Functions", 549923, 15828},
 {"Basic Functions", 550077, 15831},
 {"(1993)", 550228, 15834},
 {"k-convexity", 550368, 15837},
 {"(1988)", 550516, 15840},
 {"(2002a)", 550667, 15843},
 {"1988", 550815, 15846},
 {"Kernel", 551428, 15857},
 {"(2002b)", 551572, 15860},
 {"MP66", 551708, 15863},
 {"Faigle98", 551845, 15866},
 {"Unanimity Coordinates", 551998, 15869},
 {"(1995)", 552157, 15872},
 {"5", 552655, 15881},
 {"Concluding Remarks and Limitations", 552817, 15884},
 {"Info2663757087583-2696204", 553003, 15887},
 {"Info2703757087594-2696204", 553322, 15892},
 {"References", 553625, 15897},
 {"M. Carter", 553771, 15900},
 {"Theo Driessen", 554012, 15903},
 {"E. Inarra", 554249, 15906},
 {"M. Maschler", 554488, 15909},
 {"H. Meinhardt", 554728, 15912},
 {"C. Rafels", 554965, 15915},
 {"Hal R. Varian", 555206, 15918}
 }
*)
(*NotebookFileOutline
Notebook[{
Cell[1488, 33, 127, 1, 78, "Title",ExpressionUUID->"19095de7-ee5f-4539-af3d-7a0f110ab020"],
Cell[1618, 36, 102, 0, 82, "Author",ExpressionUUID->"e9a07404-112c-48aa-b2ce-c94a62aca9cf"],
Cell[CellGroupData[{
Cell[1745, 40, 82, 0, 115, "Section",ExpressionUUID->"20bb2461-ee21-4c5d-8685-d3d97e350234"],
Cell[1830, 42, 1697, 65, 522, "Text",ExpressionUUID->"21efdd25-2be1-4d79-b473-a06674cc144f",
 CellTags->{"1.", "2.", "2.1.", "2.2.", "2.3.", "3.", "4.", "4.1.", "4.2.", "4.3.", "4.4.", "5.", "6.", "7.", "3.1.", "Vertices"}]
}, Open  ]],
Cell[CellGroupData[{
Cell[3564, 112, 183, 4, 115, "Section",ExpressionUUID->"7050b662-8152-4594-885b-73ef738c1cc4",
 CellTags->"Introduction"],
Cell[3750, 118, 3736, 88, 694, "Text",ExpressionUUID->"912525f5-9211-48c0-850f-47c7c3a70fa3",
 CellTags->{"http://www.ifor.math.ethz.ch/staff/fukuda/fukuda.html", "1993", "1993C"}]
}, Open  ]],
Cell[CellGroupData[{
Cell[7523, 211, 184, 4, 115, "Section",ExpressionUUID->"10587ea2-1bc7-4a13-a84c-be4a6205b9e8",
 CellTags->"Installation"],
Cell[CellGroupData[{
Cell[7732, 219, 175, 3, 56, "Subsubsection",ExpressionUUID->"81a61f5e-4afc-4131-b5e6-03e10c0a62e7",
 CellTags->"Unix"],
Cell[7910, 224, 1884, 68, 355, "Text",ExpressionUUID->"d1d032d3-88b3-46b0-8dcf-f6aa54b1dc9c"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9831, 297, 181, 3, 56, "Subsubsection",ExpressionUUID->"27c5367b-8fb3-411c-be30-0348e2815ade",
 CellTags->"Windows"],
Cell[10015, 302, 1899, 56, 556, "Text",ExpressionUUID->"ff0d2283-458e-477a-8323-8e474e7affd6"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11951, 363, 180, 3, 56, "Subsubsection",ExpressionUUID->"139111de-5469-4d31-b828-584f1fe378fb",
 CellTags->"Mac OS"],
Cell[12134, 368, 157, 2, 46, "Text",ExpressionUUID->"35547645-21d7-4d93-b5c4-7917d2154aa0"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[12340, 376, 190, 4, 115, "Section",ExpressionUUID->"3c85833c-6e0a-4dfb-b75b-9f9dc2376db7",
 CellTags->"Getting Started"],
Cell[12533, 382, 299, 4, 90, "Text",ExpressionUUID->"0d199661-944d-4b5d-9efd-4e3561e14361"],
Cell[CellGroupData[{
Cell[12857, 390, 124, 1, 50, "Input",ExpressionUUID->"d8a3e6ff-0aed-41ee-9966-682626a945d5"],
Cell[CellGroupData[{
Cell[13006, 395, 142, 1, 36, "Print",ExpressionUUID->"5d8e3636-ec54-4d48-ae4f-479c08227d03"],
Cell[13151, 398, 273, 6, 36, "Print",ExpressionUUID->"a191e8d3-89e7-445f-a401-06edcb01c354"],
Cell[13427, 406, 142, 1, 36, "Print",ExpressionUUID->"36374a08-f4fc-4874-bfe5-919f9aac98a9"],
Cell[13572, 409, 124, 0, 36, "Print",ExpressionUUID->"456ebe61-de6d-467f-8f96-d8c6ddc14373"],
Cell[13699, 411, 113, 0, 36, "Print",ExpressionUUID->"2835c6a1-b331-4c89-95b8-c9dbdd6f0e95"],
Cell[13815, 413, 142, 1, 36, "Print",ExpressionUUID->"66524094-c59b-4840-a4c7-68ab7015ad6e"],
Cell[13960, 416, 125, 0, 36, "Print",ExpressionUUID->"929cc2d1-15ab-4688-936f-386c685cc08d"],
Cell[14088, 418, 142, 1, 36, "Print",ExpressionUUID->"8f3b048e-1328-4cbb-96e8-ae91cbb9501b"],
Cell[14233, 421, 142, 1, 36, "Print",ExpressionUUID->"10c12380-edcb-49c3-8af5-11d51802f0fa"],
Cell[14378, 424, 113, 0, 36, "Print",ExpressionUUID->"58d23f98-97a0-4d59-8f24-3b6352dea8b9"],
Cell[14494, 426, 142, 1, 36, "Print",ExpressionUUID->"3e8e4892-80db-4cf1-b826-efaaf2a3533f"]
}, Open  ]]
}, Open  ]],
Cell[14663, 431, 126, 0, 46, "Text",ExpressionUUID->"15675f09-91ca-4d31-9eae-17b68be52777"],
Cell[CellGroupData[{
Cell[14814, 435, 165, 3, 50, "Input",ExpressionUUID->"e70ce38a-7169-4209-b699-ae75836c8ad3"],
Cell[14982, 440, 6849, 106, 1804, "Output",ExpressionUUID->"6074f8cb-fd44-403a-9e4f-021757dbdd3c"]
}, Open  ]],
Cell[21846, 549, 211, 5, 46, "Text",ExpressionUUID->"d82cacb3-c04f-49e1-a2de-3837fa068ee3"],
Cell[CellGroupData[{
Cell[22082, 558, 112, 1, 50, "Input",ExpressionUUID->"93e51ab0-bd0b-4a12-97d4-c2439e48bd04"],
Cell[22197, 561, 47747, 1319, 1670, "Print",ExpressionUUID->"c2334a6d-f785-4b69-90bd-55e21e2d4e79"]
}, Open  ]],
Cell[69959, 1883, 181, 3, 68, "Text",ExpressionUUID->"daf4a500-d9c1-4e67-bd0b-d30f407b6219"],
Cell[70143, 1888, 223, 4, 67, "Print",ExpressionUUID->"2fa85c85-63fd-407e-b43c-6c01d0de944e",
 CellTags->"Info3264939207-8254035"],
Cell[70369, 1894, 143, 2, 46, "Text",ExpressionUUID->"33486ce1-059c-4937-8acd-394fab339358"],
Cell[CellGroupData[{
Cell[70537, 1900, 117, 1, 50, "Input",ExpressionUUID->"997f2bfe-eb75-4aec-adc7-c02d726e0cac"],
Cell[70657, 1903, 234, 4, 50, "Print",ExpressionUUID->"cc496c95-5e82-4c83-918b-0ba1b63c8157",
 CellTags->"Info43757086656-2696204"]
}, Open  ]],
Cell[70906, 1910, 193, 5, 47, "Text",ExpressionUUID->"f9b63f97-1e7c-4f0b-bb6e-9fe7cb7beb61"],
Cell[CellGroupData[{
Cell[71124, 1919, 212, 5, 56, "Subsubsection",ExpressionUUID->"4244e44e-d670-4746-9f63-76a2f56da346",
 CellTags->"How to define Games?"],
Cell[71339, 1926, 1574, 48, 280, "Text",ExpressionUUID->"ea453bd5-c39b-4d7f-afb3-5bbea51fdb05",
 CellTags->"DefineGame"],
Cell[72916, 1976, 2487, 78, 531, "Input",ExpressionUUID->"e2765e7a-8943-4371-b55a-50bbc2d38c2a"],
Cell[75406, 2056, 386, 11, 69, "Text",ExpressionUUID->"baeef5e8-a68d-4d83-9e64-9ed565476082"],
Cell[75795, 2069, 382, 12, 81, "Input",ExpressionUUID->"5779ad86-08a4-481e-a09f-084b1079d525"],
Cell[76180, 2083, 951, 22, 201, "Text",ExpressionUUID->"aab50f46-f3cd-49f2-88af-a019fe88aef5"],
Cell[77134, 2107, 589, 17, 141, "Input",ExpressionUUID->"584ee116-cfff-4dde-9dc8-dff414c5dfac"],
Cell[77726, 2126, 298, 7, 68, "Text",ExpressionUUID->"fbdc55aa-1330-4335-9b17-f50c6300de5a",
 CellTags->"(1979)"],
Cell[78027, 2135, 392, 12, 81, "Input",ExpressionUUID->"7e70a5bb-086e-4cff-88a5-fa079ec7a147"],
Cell[78422, 2149, 1251, 37, 291, "Input",ExpressionUUID->"10b0cb09-6437-4091-954c-570b984b073e"],
Cell[79676, 2188, 100, 0, 46, "Text",ExpressionUUID->"3e448a07-7171-43fc-8dfb-2228f5d9c2eb"],
Cell[79779, 2190, 1556, 49, 694, "Input",ExpressionUUID->"f7ba916c-589f-4329-9577-ad3b6b73fb76"],
Cell[81338, 2241, 796, 16, 178, "Text",ExpressionUUID->"a6182cf8-d3f0-48ab-87ca-208c53ec7a56"],
Cell[CellGroupData[{
Cell[82159, 2261, 100, 1, 50, "Input",ExpressionUUID->"2ee4a91d-efa3-422b-b76d-2b2c59d993e6"],
Cell[82262, 2264, 186, 3, 50, "Print",ExpressionUUID->"ae20088c-465d-4464-aa90-f79e22bb2344",
 CellTags->"Info133757086683-2696204"]
}, Open  ]],
Cell[82463, 2270, 422, 9, 90, "Text",ExpressionUUID->"e3753de6-5c01-4fd2-ad9f-fa66e795bb17"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[82934, 2285, 188, 4, 115, "Section",ExpressionUUID->"6a911259-b386-4611-8e1a-afb9bbcf33f5",
 CellTags->"Some Functions"],
Cell[83125, 2291, 2124, 37, 486, "Text",ExpressionUUID->"05d6877f-4996-40e2-84a3-c1f2c4485114"],
Cell[CellGroupData[{
Cell[85274, 2332, 215, 5, 51, "Subsubsection",ExpressionUUID->"47bf0c18-37a4-4a2b-ae12-ae68e74ea64f",
 CellTags->"Basic Functions"],
Cell[85492, 2339, 863, 18, 201, "Text",ExpressionUUID->"46ed9f3c-32ad-4bbb-b346-1712b96cf286"],
Cell[CellGroupData[{
Cell[86380, 2361, 122, 1, 50, "Input",ExpressionUUID->"4164757e-194c-49e6-a9f6-aa8b53ef8448"],
Cell[86505, 2364, 86, 0, 63, "Output",ExpressionUUID->"b8838919-5bd6-4b85-bb4c-abb8239ec82b"]
}, Open  ]],
Cell[CellGroupData[{
Cell[86628, 2369, 122, 1, 50, "Input",ExpressionUUID->"c0338946-50be-40d8-aabe-b90f078cc839"],
Cell[86753, 2372, 86, 0, 63, "Output",ExpressionUUID->"7832dd30-a489-4d28-9b9e-34d521c0fb84"]
}, Open  ]],
Cell[CellGroupData[{
Cell[86876, 2377, 122, 1, 50, "Input",ExpressionUUID->"bd4bd202-169d-4590-85e7-b1badeac50e5"],
Cell[87001, 2380, 87, 0, 63, "Output",ExpressionUUID->"851cebf0-6437-424b-bee1-0aa2ae73c842"]
}, Open  ]],
Cell[CellGroupData[{
Cell[87125, 2385, 122, 1, 50, "Input",ExpressionUUID->"e6f7aee8-ef9e-4353-a46d-02e616008a7e"],
Cell[87250, 2388, 87, 0, 63, "Output",ExpressionUUID->"a0e97c99-7a66-4377-806b-928a7b35a665"]
}, Open  ]],
Cell[87352, 2391, 780, 16, 179, "Text",ExpressionUUID->"e3fc2368-7c99-4863-b4bc-c29f4a066be9",
 CellTags->"(1993)"],
Cell[88135, 2409, 1105, 34, 46, "Text",ExpressionUUID->"d99a13f1-6f7b-447e-bff4-4d9efa245b9b"],
Cell[89243, 2445, 425, 13, 91, "Text",ExpressionUUID->"70c488ba-4399-4d7f-a08b-bfd076468f3a"],
Cell[CellGroupData[{
Cell[89693, 2462, 124, 1, 50, "Input",ExpressionUUID->"dbcbe7ae-7ecb-46f3-a32a-b6836f9c3b11"],
Cell[89820, 2465, 86, 0, 63, "Output",ExpressionUUID->"3d387d9c-9148-484d-9f13-e4ad1b637840"]
}, Open  ]],
Cell[CellGroupData[{
Cell[89943, 2470, 124, 1, 50, "Input",ExpressionUUID->"147d66ae-0697-4115-89ae-a8a3c7ff89ca"],
Cell[90070, 2473, 86, 0, 63, "Output",ExpressionUUID->"2e4d1383-8602-4b60-91f2-56dbbceed275"]
}, Open  ]],
Cell[CellGroupData[{
Cell[90193, 2478, 124, 1, 50, "Input",ExpressionUUID->"4f9d3b03-1119-463f-bb30-9d3924ad3c06"],
Cell[90320, 2481, 87, 0, 63, "Output",ExpressionUUID->"559e2bdc-13a6-4a61-9331-6f80411941eb"]
}, Open  ]],
Cell[CellGroupData[{
Cell[90444, 2486, 124, 1, 50, "Input",ExpressionUUID->"2e453eb2-36ba-464d-99d5-794d0f3fee44"],
Cell[90571, 2489, 86, 0, 63, "Output",ExpressionUUID->"653b7df0-d9ee-4ef0-bb37-c4ddcf76720a"]
}, Open  ]],
Cell[90672, 2492, 105, 0, 46, "Text",ExpressionUUID->"f3d66646-5f48-4be2-93bf-68d5c8f421af"],
Cell[CellGroupData[{
Cell[90802, 2496, 129, 1, 50, "Input",ExpressionUUID->"428ebec2-3e31-4bc3-8ab7-8e67f872338c"],
Cell[90934, 2499, 86, 0, 63, "Output",ExpressionUUID->"42674b1c-e011-4ae2-a0da-960f38c1af1e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[91057, 2504, 129, 1, 50, "Input",ExpressionUUID->"74133b00-8603-4d22-ab19-b306f629f466"],
Cell[91189, 2507, 86, 0, 63, "Output",ExpressionUUID->"e199116d-9bcb-448c-9b85-10a7a44b8a30"]
}, Open  ]],
Cell[CellGroupData[{
Cell[91312, 2512, 129, 1, 50, "Input",ExpressionUUID->"6758882a-064b-4f58-93b0-138f1890f399"],
Cell[91444, 2515, 86, 0, 63, "Output",ExpressionUUID->"14308376-7ede-4b89-8e81-d7dee3cb12de"]
}, Open  ]],
Cell[CellGroupData[{
Cell[91567, 2520, 129, 1, 50, "Input",ExpressionUUID->"65081ecd-2ca3-4a6a-8be0-faf4f106c1bc"],
Cell[91699, 2523, 86, 0, 63, "Output",ExpressionUUID->"4b19b973-7c3a-4aa6-8b10-07afc8daeb3c"]
}, Open  ]],
Cell[91800, 2526, 555, 18, 68, "Text",ExpressionUUID->"4f34972d-0dd2-4068-bcc1-96ea934e4c8a"],
Cell[92358, 2546, 422, 11, 53, "Text",ExpressionUUID->"5135245e-a501-4f72-8031-d32051964678"],
Cell[92783, 2559, 202, 4, 47, "Text",ExpressionUUID->"c70ae09c-0110-4413-bf59-b393e2056c52"],
Cell[CellGroupData[{
Cell[93010, 2567, 137, 2, 50, "Input",ExpressionUUID->"8b8e5059-68a2-4017-ac54-20a5a2844f43"],
Cell[93150, 2571, 86, 0, 63, "Output",ExpressionUUID->"0906a604-e40c-45f8-b770-d6eaaffb5e37"]
}, Open  ]],
Cell[CellGroupData[{
Cell[93273, 2576, 137, 2, 50, "Input",ExpressionUUID->"9f805f37-11c4-45c4-a775-6b8808528cda"],
Cell[93413, 2580, 86, 0, 63, "Output",ExpressionUUID->"0d7d37f6-3180-4302-b780-13757983ff8c"]
}, Open  ]],
Cell[CellGroupData[{
Cell[93536, 2585, 137, 2, 50, "Input",ExpressionUUID->"78366b9f-6e51-4c87-8092-f855e92a8880"],
Cell[93676, 2589, 86, 0, 63, "Output",ExpressionUUID->"0e77b80f-351c-409f-bf3b-07f14582d2db"]
}, Open  ]],
Cell[CellGroupData[{
Cell[93799, 2594, 137, 2, 50, "Input",ExpressionUUID->"cd2b15bc-0ea2-46da-b7fb-e36e0fd98825"],
Cell[93939, 2598, 86, 0, 63, "Output",ExpressionUUID->"20e256f4-bca2-43ea-8dfe-105715839764"]
}, Open  ]],
Cell[94040, 2601, 385, 13, 69, "Text",ExpressionUUID->"bf71d04a-09db-42cf-96be-1d6e61a3068d"],
Cell[CellGroupData[{
Cell[94450, 2618, 128, 1, 50, "Input",ExpressionUUID->"0629bc6d-676a-4500-b278-1638cfecb9db"],
Cell[94581, 2621, 86, 0, 63, "Output",ExpressionUUID->"add0086a-a5b2-4fba-afcc-f82a6f57dc9c"]
}, Open  ]],
Cell[CellGroupData[{
Cell[94704, 2626, 124, 1, 50, "Input",ExpressionUUID->"2101476e-f249-469c-b406-e0ce60030ce3"],
Cell[94831, 2629, 86, 0, 63, "Output",ExpressionUUID->"c1ebf57a-6b3b-49a0-a59e-b479c9e31980"]
}, Open  ]],
Cell[CellGroupData[{
Cell[94954, 2634, 128, 1, 50, "Input",ExpressionUUID->"af3d06df-148e-4270-98ef-fed9bd3ac4b4"],
Cell[95085, 2637, 86, 0, 63, "Output",ExpressionUUID->"6ff3fcd2-d902-45b0-9721-59b7aa506232"]
}, Open  ]],
Cell[CellGroupData[{
Cell[95208, 2642, 128, 1, 50, "Input",ExpressionUUID->"b8a4943e-20fe-4814-9105-85d903b4570a"],
Cell[95339, 2645, 86, 0, 63, "Output",ExpressionUUID->"1b797c13-09cf-47d9-be2f-2c7fa059ad11"]
}, Open  ]],
Cell[CellGroupData[{
Cell[95462, 2650, 124, 1, 50, "Input",ExpressionUUID->"f7f95c2d-e947-4bb9-b7b8-4940f08b8246"],
Cell[95589, 2653, 86, 0, 63, "Output",ExpressionUUID->"e213b62c-a322-4eec-a441-73c0d26d40d5"]
}, Open  ]],
Cell[CellGroupData[{
Cell[95712, 2658, 128, 1, 50, "Input",ExpressionUUID->"331f6a45-50e7-42ef-9361-c6d6daa42599"],
Cell[95843, 2661, 86, 0, 63, "Output",ExpressionUUID->"a6972f90-bb2f-460f-bb34-adbc35a3d454"]
}, Open  ]],
Cell[CellGroupData[{
Cell[95966, 2666, 128, 1, 50, "Input",ExpressionUUID->"eb07fe66-e755-4982-ba9a-ca216a60eba9"],
Cell[96097, 2669, 87, 0, 63, "Output",ExpressionUUID->"a0d2bf92-53af-4b76-b1dd-33e1dcad4f67"]
}, Open  ]],
Cell[CellGroupData[{
Cell[96221, 2674, 124, 1, 50, "Input",ExpressionUUID->"ff44464e-cf54-4d8e-988a-acebf5fce1bc"],
Cell[96348, 2677, 87, 0, 63, "Output",ExpressionUUID->"e589a811-83d7-44a4-bae9-c81c4b82d358"]
}, Open  ]],
Cell[CellGroupData[{
Cell[96472, 2682, 128, 1, 50, "Input",ExpressionUUID->"cb2df0fc-e017-427e-bb58-381ffc94a258"],
Cell[96603, 2685, 87, 0, 63, "Output",ExpressionUUID->"9432c17e-c24b-4d6a-864b-a65f7d6201a6"]
}, Open  ]],
Cell[CellGroupData[{
Cell[96727, 2690, 128, 1, 50, "Input",ExpressionUUID->"f490c4c9-3011-4d32-804f-ca6f4b58ed14"],
Cell[96858, 2693, 86, 0, 63, "Output",ExpressionUUID->"17513f18-7329-45ff-859e-1833d3f36d13"]
}, Open  ]],
Cell[CellGroupData[{
Cell[96981, 2698, 124, 1, 50, "Input",ExpressionUUID->"911510f6-f786-470b-b5be-1be4699a0973"],
Cell[97108, 2701, 86, 0, 63, "Output",ExpressionUUID->"1ba0d4bb-e219-4c29-bcd2-06ad4b0f45af"]
}, Open  ]],
Cell[97209, 2704, 428, 15, 69, "Text",ExpressionUUID->"efca523b-65d0-4811-91d2-3e95b2fab356"],
Cell[CellGroupData[{
Cell[97662, 2723, 120, 1, 50, "Input",ExpressionUUID->"582f4157-00e7-4c87-b5a8-5477a4503c5a"],
Cell[97785, 2726, 86, 0, 63, "Output",ExpressionUUID->"009551cb-9c4e-4e1d-b967-8fb05fb1039d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[97908, 2731, 120, 1, 50, "Input",ExpressionUUID->"fdf0f0d4-14c9-4ecf-95ea-75001f75f675"],
Cell[98031, 2734, 86, 0, 63, "Output",ExpressionUUID->"b0a935dd-eba1-4650-9446-edd476cafe36"]
}, Open  ]],
Cell[CellGroupData[{
Cell[98154, 2739, 120, 1, 50, "Input",ExpressionUUID->"9171a69d-6443-4839-a824-cfcc4d286a79"],
Cell[98277, 2742, 86, 0, 63, "Output",ExpressionUUID->"a9083402-ef55-4e43-b196-3f28e47d0057"]
}, Open  ]],
Cell[CellGroupData[{
Cell[98400, 2747, 120, 1, 50, "Input",ExpressionUUID->"d9c875e5-7ebf-4dac-8220-11b93a3a2163"],
Cell[98523, 2750, 86, 0, 63, "Output",ExpressionUUID->"efebe716-d1ed-4a58-8137-7d2483243614"]
}, Open  ]],
Cell[98624, 2753, 108, 0, 46, "Text",ExpressionUUID->"04cef77d-4256-4e0f-84d5-96015d2c8dd6"],
Cell[CellGroupData[{
Cell[98757, 2757, 120, 1, 50, "Input",ExpressionUUID->"78c44c3a-8760-4822-a97b-49d9908a0af7"],
Cell[98880, 2760, 282, 9, 82, "Output",ExpressionUUID->"d95b2f85-66fa-4e81-b145-91568f047bc4"]
}, Open  ]],
Cell[CellGroupData[{
Cell[99199, 2774, 120, 1, 50, "Input",ExpressionUUID->"5af80c9a-8636-4ff7-991e-66e4c71b509d"],
Cell[99322, 2777, 282, 9, 82, "Output",ExpressionUUID->"d688fe35-a685-43f4-bb87-917cbbaf8f63"]
}, Open  ]],
Cell[CellGroupData[{
Cell[99641, 2791, 120, 1, 50, "Input",ExpressionUUID->"3fcb2a66-89aa-49ea-9f68-2674f2e40128"],
Cell[99764, 2794, 160, 3, 63, "Output",ExpressionUUID->"044a0ec7-8793-4ea2-8831-449c0a61b03e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[99961, 2802, 120, 1, 50, "Input",ExpressionUUID->"411ed33e-b784-46ba-a161-4bcc13910400"],
Cell[100084, 2805, 238, 7, 82, "Output",ExpressionUUID->"e1892beb-8a51-4356-bb5e-2e593d8fb6e9"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[100371, 2818, 206, 5, 51, "Subsubsection",ExpressionUUID->"de46248f-54a6-46b2-90c8-0e709b5e5b30",
 CellTags->"k-convexity"],
Cell[100580, 2825, 2047, 51, 288, "Text",ExpressionUUID->"e37224d0-86d4-4193-88ad-344131ad7610",
 CellTags->{"(1988)", "(2002a)"}],
Cell[102630, 2878, 1846, 57, 291, "Input",ExpressionUUID->"1f828355-fe91-40e7-a32e-a997377b67fc"],
Cell[104479, 2937, 1062, 33, 111, "Input",ExpressionUUID->"4470fbae-e589-40ad-a848-e15824ba7328"],
Cell[105544, 2972, 440, 14, 81, "Input",ExpressionUUID->"518187e2-889e-43b5-bce0-ceb235ac73a0"],
Cell[105987, 2988, 1078, 34, 171, "Input",ExpressionUUID->"5bbac853-bd33-42e0-98b2-411b4177ee73"],
Cell[107068, 3024, 357, 8, 68, "Text",ExpressionUUID->"e800518f-904f-4b40-9003-ee67e79b9dfd"],
Cell[107428, 3034, 597, 15, 151, "Input",ExpressionUUID->"f13461eb-e0e0-4309-bb27-c42cd600a50d"],
Cell[108028, 3051, 127, 0, 46, "Text",ExpressionUUID->"a15a4350-edaa-4c06-9928-9d2202a581f4"],
Cell[CellGroupData[{
Cell[108180, 3055, 116, 1, 50, "Input",ExpressionUUID->"0ba8d3b7-e91d-4e4b-8a01-94bbfcfd5e72"],
Cell[108299, 3058, 984, 30, 94, "Output",ExpressionUUID->"627d7ba9-e6a8-41a2-bddb-5db0f23bbca3"]
}, Open  ]],
Cell[109298, 3091, 289, 8, 68, "Text",ExpressionUUID->"b56816ce-fffe-4599-8983-3ae26b8edad9"],
Cell[CellGroupData[{
Cell[109612, 3103, 124, 1, 50, "Input",ExpressionUUID->"d1f0c668-8125-404d-a41c-b07599fc6774"],
Cell[109739, 3106, 157, 3, 63, "Output",ExpressionUUID->"e82f3fce-e48c-4c27-9f2d-85b92ad79e8b"]
}, Open  ]],
Cell[109911, 3112, 228, 6, 50, "Input",ExpressionUUID->"b6aaf0dd-93f4-4187-8caa-d1d1ac635ef0"],
Cell[110142, 3120, 152, 2, 46, "Text",ExpressionUUID->"b85a308f-05b8-411c-b603-d18255c042c5"],
Cell[CellGroupData[{
Cell[110319, 3126, 120, 1, 50, "Input",ExpressionUUID->"34663e54-f21f-4d1c-96d4-9beebf2c287d"],
Cell[110442, 3129, 86, 0, 63, "Output",ExpressionUUID->"2e8a7186-9e34-4d4d-9627-82fa2bcaadcc"]
}, Open  ]],
Cell[CellGroupData[{
Cell[110565, 3134, 120, 1, 50, "Input",ExpressionUUID->"81c3dc6d-a8ee-4a27-a4b5-bc60f2680598"],
Cell[110688, 3137, 86, 0, 63, "Output",ExpressionUUID->"d11ffac5-e02f-4518-b0a4-1917e4b45c8e"]
}, Open  ]],
Cell[110789, 3140, 724, 26, 68, "Text",ExpressionUUID->"ff740967-b815-45db-9a3f-33b03d545437",
 CellTags->"1988"],
Cell[111516, 3168, 840, 26, 48, "Text",ExpressionUUID->"9e9a8098-160d-4818-ae4b-1a1462d2f086",
 CellTags->"1988"],
Cell[112359, 3196, 1167, 37, 75, "Text",ExpressionUUID->"e3e6ccf3-cb30-44a1-9fbb-742a43bc0834",
 CellTags->"1988"],
Cell[113529, 3235, 1109, 37, 53, "Text",ExpressionUUID->"a1e010fc-732b-4c5b-af0f-3180d3bef8f0",
 CellTags->"1988"],
Cell[114641, 3274, 1568, 48, 158, "Text",ExpressionUUID->"5c5d5a90-6d74-4ea7-9c91-7861afa1d568",
 CellTags->"1988"],
Cell[CellGroupData[{
Cell[116234, 3326, 118, 1, 50, "Input",ExpressionUUID->"948131e5-2873-458e-bea2-3f0dcd4c8abe"],
Cell[116355, 3329, 293, 6, 63, "Output",ExpressionUUID->"2a22f61d-32eb-4f6f-971c-91e5f60074e4"]
}, Open  ]],
Cell[CellGroupData[{
Cell[116685, 3340, 118, 1, 50, "Input",ExpressionUUID->"eb2d1382-7273-46ce-a57e-aa75082b9c89"],
Cell[116806, 3343, 281, 6, 63, "Output",ExpressionUUID->"d3f26423-69b8-482c-9040-e9f39ccf1d76"]
}, Open  ]],
Cell[CellGroupData[{
Cell[117124, 3354, 118, 1, 50, "Input",ExpressionUUID->"9872bbc5-4b59-4b31-8151-77c8062c3241"],
Cell[117245, 3357, 194, 4, 63, "Output",ExpressionUUID->"6286c042-d96c-4933-8125-52e38a02e163"]
}, Open  ]],
Cell[CellGroupData[{
Cell[117476, 3366, 118, 1, 50, "Input",ExpressionUUID->"ad116a61-9dd8-4fb9-a22d-80f8d7829b8e"],
Cell[117597, 3369, 638, 18, 132, "Output",ExpressionUUID->"48610cb7-25dd-4083-980b-151f583fa349"]
}, Open  ]],
Cell[CellGroupData[{
Cell[118272, 3392, 144, 3, 50, "Input",ExpressionUUID->"bf8ce512-f294-4602-8085-f666c1eae810"],
Cell[118419, 3397, 558, 10, 124, "Output",ExpressionUUID->"c22e5991-e039-43e2-a8f6-84bc9cdab70d"]
}, Open  ]],
Cell[118992, 3410, 1236, 34, 135, "Text",ExpressionUUID->"92f78098-990a-42ef-a015-20a81e4c5dfb"],
Cell[CellGroupData[{
Cell[120253, 3448, 174, 4, 50, "Input",ExpressionUUID->"4a285501-9137-4aad-a95a-df360c2fdbc3"],
Cell[120430, 3454, 285, 6, 63, "Output",ExpressionUUID->"425e1618-a80e-49cc-a31b-8038c806f567"]
}, Open  ]],
Cell[CellGroupData[{
Cell[120752, 3465, 174, 4, 50, "Input",ExpressionUUID->"47973022-f1ff-462f-a9de-da3951169f2b"],
Cell[120929, 3471, 281, 6, 63, "Output",ExpressionUUID->"143dd918-a7ab-44f3-bb87-3535bad74c57"]
}, Open  ]],
Cell[CellGroupData[{
Cell[121247, 3482, 174, 4, 50, "Input",ExpressionUUID->"241b6454-074a-40c0-80f2-fbb03e3997c2"],
Cell[121424, 3488, 199, 5, 63, "Output",ExpressionUUID->"60283aa1-ce66-4272-81ed-5483e60b5746"]
}, Open  ]],
Cell[CellGroupData[{
Cell[121660, 3498, 174, 4, 50, "Input",ExpressionUUID->"64c50362-6578-4e63-b336-bc49d218e16e"],
Cell[121837, 3504, 616, 17, 132, "Output",ExpressionUUID->"a35e1b90-ce5a-4ca1-a960-6eed74844547"]
}, Open  ]],
Cell[122468, 3524, 704, 21, 113, "Text",ExpressionUUID->"0b7d4397-ce6a-4768-84d9-b7b944810604"],
Cell[123175, 3547, 225, 6, 50, "Input",ExpressionUUID->"c0930b21-2f7a-4ff1-b4b3-623a242211d8"],
Cell[123403, 3555, 225, 6, 50, "Input",ExpressionUUID->"0546faed-94e5-4757-b75b-4ec2de82ac5e"],
Cell[123631, 3563, 225, 6, 50, "Input",ExpressionUUID->"581573eb-c6ce-4dd1-9001-3f80129de58d"],
Cell[123859, 3571, 225, 6, 50, "Input",ExpressionUUID->"685a5972-f741-44d6-be4f-ce0af78820f8"],
Cell[124087, 3579, 536, 12, 91, "Text",ExpressionUUID->"b1c42647-85d1-4ff3-afcb-bce6c2d6bc6e"],
Cell[CellGroupData[{
Cell[124648, 3595, 121, 1, 50, "Input",ExpressionUUID->"21629c35-c58f-4a27-bf26-77b10aba660b"],
Cell[124772, 3598, 86, 0, 63, "Output",ExpressionUUID->"7977475d-8b27-450a-8b49-d5d5b297564e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[124895, 3603, 122, 1, 50, "Input",ExpressionUUID->"af196d46-b796-42f6-a942-c7ffdda28d59"],
Cell[125020, 3606, 87, 0, 63, "Output",ExpressionUUID->"19c9838d-52f9-4355-8416-f6e651da7b32"]
}, Open  ]],
Cell[CellGroupData[{
Cell[125144, 3611, 121, 1, 50, "Input",ExpressionUUID->"c7e0fdbe-fe87-46d4-8391-524366a743ab"],
Cell[125268, 3614, 86, 0, 63, "Output",ExpressionUUID->"56130328-1ebc-4afd-9cd9-ac3d9102f6db"]
}, Open  ]],
Cell[CellGroupData[{
Cell[125391, 3619, 122, 1, 50, "Input",ExpressionUUID->"8db45f20-5699-4b6e-ab0b-e5367f769486"],
Cell[125516, 3622, 87, 0, 63, "Output",ExpressionUUID->"86f18ecb-86a3-4e06-ae3b-4aea2360f595"]
}, Open  ]],
Cell[CellGroupData[{
Cell[125640, 3627, 121, 1, 50, "Input",ExpressionUUID->"4695ff47-10de-45d0-aebc-39867ca13a6c"],
Cell[125764, 3630, 86, 0, 63, "Output",ExpressionUUID->"a9834ca0-a04a-4825-820b-370211200130"]
}, Open  ]],
Cell[CellGroupData[{
Cell[125887, 3635, 122, 1, 50, "Input",ExpressionUUID->"54667662-61db-4238-960e-a97fc309d42a"],
Cell[126012, 3638, 86, 0, 63, "Output",ExpressionUUID->"05ff6411-6398-4f2a-abc6-251b90d3fef6"]
}, Open  ]],
Cell[CellGroupData[{
Cell[126135, 3643, 121, 1, 50, "Input",ExpressionUUID->"6183c227-c719-415b-b0e2-83b7d9cea0af"],
Cell[126259, 3646, 86, 0, 63, "Output",ExpressionUUID->"0f6a7733-dbab-4311-ad52-1ce73a81a746"]
}, Open  ]],
Cell[CellGroupData[{
Cell[126382, 3651, 122, 1, 50, "Input",ExpressionUUID->"c10892c8-1510-4a54-8cc9-d3ae25ebc42a"],
Cell[126507, 3654, 86, 0, 63, "Output",ExpressionUUID->"78a3f40e-8e0c-4eda-9685-89490a3c688f"]
}, Open  ]],
Cell[126608, 3657, 379, 10, 90, "Text",ExpressionUUID->"54f9df15-c3ae-4a73-b457-a510faf68a78"],
Cell[CellGroupData[{
Cell[127012, 3671, 174, 4, 50, "Input",ExpressionUUID->"3ac77d9b-29bf-48df-8fba-ac44d48bb533"],
Cell[127189, 3677, 336, 7, 63, "Output",ExpressionUUID->"6336d5f0-748e-4076-be05-0a8bdc464d4c"]
}, Open  ]],
Cell[127540, 3687, 225, 6, 50, "Input",ExpressionUUID->"943fecbe-ad72-49fc-94ce-76416a20dede"],
Cell[CellGroupData[{
Cell[127790, 3697, 122, 1, 50, "Input",ExpressionUUID->"0530386e-b422-4b8c-b96d-2649ed9da027"],
Cell[127915, 3700, 87, 0, 63, "Output",ExpressionUUID->"068e756f-7d3d-4238-ab11-d189067596b2"]
}, Open  ]],
Cell[CellGroupData[{
Cell[128039, 3705, 121, 1, 50, "Input",ExpressionUUID->"9a1cdef8-9324-4720-8255-88e32e62dcfb"],
Cell[128163, 3708, 86, 0, 63, "Output",ExpressionUUID->"b1066d57-e6d5-4f95-8885-d8443f7f833c"]
}, Open  ]],
Cell[128264, 3711, 298, 8, 68, "Text",ExpressionUUID->"27f5e757-3d61-4f2a-9685-29db9109e75d"],
Cell[CellGroupData[{
Cell[128587, 3723, 118, 1, 50, "Input",ExpressionUUID->"be802cda-7d49-48d7-99aa-b59db3eab6a0"],
Cell[128708, 3726, 293, 6, 63, "Output",ExpressionUUID->"8ae9162e-6f56-41d9-936d-6b63ad9bfab3"]
}, Open  ]],
Cell[129016, 3735, 222, 5, 68, "Text",ExpressionUUID->"b4aba363-ba14-4f34-9cda-586c7d4c7e32"],
Cell[129241, 3742, 184, 3, 68, "Text",ExpressionUUID->"7cebbef9-3031-413b-8174-e92be52a2825"],
Cell[CellGroupData[{
Cell[129450, 3749, 127, 1, 50, "Input",ExpressionUUID->"6ef35c4a-449e-4b56-8518-56f5911b43db"],
Cell[129580, 3752, 151, 3, 63, "Output",ExpressionUUID->"f3e37bec-c460-4ba5-aa65-1cb07c54380f"]
}, Open  ]],
Cell[CellGroupData[{
Cell[129768, 3760, 127, 1, 50, "Input",ExpressionUUID->"ad9c3e34-71fe-4b6e-8170-29cd31b21feb"],
Cell[129898, 3763, 150, 3, 63, "Output",ExpressionUUID->"745672a6-6a05-488b-be2b-cd9524c96c7a"]
}, Open  ]],
Cell[130063, 3769, 179, 3, 68, "Text",ExpressionUUID->"4ab218b8-5b2c-48c7-b010-224cb8e727b7"],
Cell[CellGroupData[{
Cell[130267, 3776, 127, 1, 50, "Input",ExpressionUUID->"7645dcdb-a9be-42de-aba6-90e7f03958d6"],
Cell[130397, 3779, 150, 3, 63, "Output",ExpressionUUID->"319afc98-2b4d-40b6-8f6f-7f7b7aadc326"]
}, Open  ]],
Cell[CellGroupData[{
Cell[130584, 3787, 127, 1, 50, "Input",ExpressionUUID->"07c11f2f-6f96-49f0-86b8-515d7f8ab9ba"],
Cell[130714, 3790, 150, 3, 63, "Output",ExpressionUUID->"460c4528-0257-496e-ab11-03057c446a72"]
}, Open  ]],
Cell[130879, 3796, 357, 7, 90, "Text",ExpressionUUID->"88246b08-7367-46eb-8f0c-b2bd824bcb0e"],
Cell[CellGroupData[{
Cell[131261, 3807, 151, 3, 50, "Input",ExpressionUUID->"b9c51d4f-e792-4b73-8a17-f98bf37c3d78"],
Cell[131415, 3812, 250, 7, 82, "Output",ExpressionUUID->"b2144298-fcd4-4322-8fcd-75aeba5a19cb"]
}, Open  ]],
Cell[CellGroupData[{
Cell[131702, 3824, 151, 3, 50, "Input",ExpressionUUID->"a357fbba-924c-4b45-b509-688af247d355"],
Cell[131856, 3829, 238, 7, 82, "Output",ExpressionUUID->"e5899fcc-33bb-4032-b724-6c8174ada061"]
}, Open  ]],
Cell[132109, 3839, 641, 18, 113, "Text",ExpressionUUID->"5f356fa6-04c7-40d1-a396-ef0f6b928536"],
Cell[CellGroupData[{
Cell[132775, 3861, 150, 3, 50, "Input",ExpressionUUID->"09aae02d-03b3-47fb-9e26-57d62c059782"],
Cell[132928, 3866, 86, 0, 63, "Output",ExpressionUUID->"76a2d0d2-b994-404c-8495-daa7557de785"]
}, Open  ]],
Cell[CellGroupData[{
Cell[133051, 3871, 150, 3, 50, "Input",ExpressionUUID->"27b3955d-09ab-4913-ba8b-19d152c7d32e"],
Cell[133204, 3876, 86, 0, 63, "Output",ExpressionUUID->"63b840ca-12d2-444a-a1a2-c0f64c4e9ca2"]
}, Open  ]],
Cell[133305, 3879, 1507, 44, 227, "Text",ExpressionUUID->"fe0545f0-ccd1-43a3-9a80-c6f131d3281f"],
Cell[CellGroupData[{
Cell[134837, 3927, 185, 4, 50, "Input",ExpressionUUID->"74cea722-a56e-4dd5-bf66-f2f561a58625"],
Cell[135025, 3933, 2018, 51, 214, "Output",ExpressionUUID->"b6d10d52-b002-4c9f-8064-08018e7a303d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[137080, 3989, 134, 2, 50, "Input",ExpressionUUID->"c61c1ad4-ac29-4449-97c6-6e514e6567df"],
Cell[137217, 3993, 906, 23, 124, "Output",ExpressionUUID->"bef75ba7-848b-45ba-a23e-789d062b9ebe"]
}, Open  ]],
Cell[CellGroupData[{
Cell[138160, 4021, 115, 1, 50, "Input",ExpressionUUID->"c57cdb76-902b-4e19-8d75-6514c4c823d6"],
Cell[138278, 4024, 84, 0, 63, "Output",ExpressionUUID->"ba1903f6-618f-4248-8c28-d127052905ef"]
}, Open  ]],
Cell[138377, 4027, 678, 18, 115, "Text",ExpressionUUID->"7c4f3bdc-b1a5-4f29-abf8-23b7cf6a51a2"],
Cell[CellGroupData[{
Cell[139080, 4049, 154, 3, 50, "Input",ExpressionUUID->"1440ca94-9b45-46fc-8382-6a1613a19016"],
Cell[139237, 4054, 247, 5, 63, "Output",ExpressionUUID->"204abdfa-0495-438b-bd42-905e9937eec4"]
}, Open  ]],
Cell[139499, 4062, 1463, 31, 311, "Text",ExpressionUUID->"7a0744c4-fb95-4e53-90a4-e26c2de7d8a0"],
Cell[CellGroupData[{
Cell[140987, 4097, 211, 5, 50, "Input",ExpressionUUID->"b05b5c16-f211-485e-81a0-f963e399d94f"],
Cell[141201, 4104, 2252, 62, 274, "Output",ExpressionUUID->"2ef6e887-491d-4adb-8b8e-2a0c7f0d0974"]
}, Open  ]],
Cell[143468, 4169, 1358, 37, 137, "Text",ExpressionUUID->"cda76e94-0b3f-4358-a37b-c98c2917a428"],
Cell[144829, 4208, 640, 20, 46, "Text",ExpressionUUID->"b3c671b0-21cf-45da-abb6-2dc95ea296dc"],
Cell[145472, 4230, 529, 15, 92, "Text",ExpressionUUID->"271141e4-6872-453a-bce0-82e2ddae720c"],
Cell[CellGroupData[{
Cell[146026, 4249, 185, 4, 50, "Input",ExpressionUUID->"bad94547-37ff-46d3-abeb-44b200962bfd"],
Cell[146214, 4255, 247, 5, 63, "Output",ExpressionUUID->"7aa2b5ec-7808-4529-9818-8627d580f4ca"]
}, Open  ]],
Cell[CellGroupData[{
Cell[146498, 4265, 187, 4, 50, "Input",ExpressionUUID->"bf429dad-1235-401e-8bcd-c9cd5cd5de42"],
Cell[146688, 4271, 247, 5, 63, "Output",ExpressionUUID->"0b6ccc4d-df3b-435f-92a2-5178439e15c1"]
}, Open  ]],
Cell[146950, 4279, 189, 3, 68, "Text",ExpressionUUID->"a4d80f90-9c75-4ead-8dd7-f5e3c0fcf88e"],
Cell[CellGroupData[{
Cell[147164, 4286, 174, 4, 50, "Input",ExpressionUUID->"c28f8450-38d9-4759-8da1-a5462536dfbd"],
Cell[147341, 4292, 451, 13, 63, "Output",ExpressionUUID->"2482aad7-55e9-4d42-b07f-7cce88e7de6b"]
}, Open  ]],
Cell[CellGroupData[{
Cell[147829, 4310, 176, 4, 50, "Input",ExpressionUUID->"9f816998-e7e1-414d-af97-e26318713fc3"],
Cell[148008, 4316, 451, 13, 63, "Output",ExpressionUUID->"9eb9a91a-9107-476a-8b1b-7479e95031b7"]
}, Open  ]],
Cell[148474, 4332, 276, 6, 69, "Text",ExpressionUUID->"1a25bc79-494f-441b-8f43-950d64f80acf"],
Cell[CellGroupData[{
Cell[148775, 4342, 175, 4, 50, "Input",ExpressionUUID->"8bf50086-b886-448c-8673-5d5e8ecde5b2"],
Cell[148953, 4348, 906, 23, 124, "Output",ExpressionUUID->"60f6ebd9-373d-4575-8abe-a4e3536a25a1"]
}, Open  ]],
Cell[CellGroupData[{
Cell[149896, 4376, 177, 4, 50, "Input",ExpressionUUID->"e8e77a7c-6207-499d-b67a-f050f2fa43eb"],
Cell[150076, 4382, 906, 23, 124, "Output",ExpressionUUID->"d54f8750-5118-4e11-ab81-37bb4d3288c2"]
}, Open  ]],
Cell[150997, 4408, 182, 3, 68, "Text",ExpressionUUID->"ccb2dc0f-624b-4fae-a24f-58dbad3f051e"],
Cell[CellGroupData[{
Cell[151204, 4415, 156, 3, 50, "Input",ExpressionUUID->"79ad2e10-ec23-44b8-afbe-a90618e359da"],
Cell[151363, 4420, 247, 5, 63, "Output",ExpressionUUID->"9a9418bf-ef14-42d4-8926-42498b9bb6fe"]
}, Open  ]],
Cell[CellGroupData[{
Cell[151647, 4430, 158, 3, 50, "Input",ExpressionUUID->"cca6e8c4-be7a-46e5-a429-1eda4de80151"],
Cell[151808, 4435, 247, 5, 63, "Output",ExpressionUUID->"3dea6df3-b27c-43e8-949b-e9a538f67002"]
}, Open  ]],
Cell[CellGroupData[{
Cell[152092, 4445, 117, 1, 50, "Input",ExpressionUUID->"20b8da92-34be-434b-acc4-ee5cbb428e47"],
Cell[152212, 4448, 84, 0, 63, "Output",ExpressionUUID->"b2cd0cbd-a696-41f1-b1fd-db98eb9e6aa2"]
}, Open  ]],
Cell[CellGroupData[{
Cell[152333, 4453, 168, 4, 50, "Input",ExpressionUUID->"0c5f2203-708d-450c-bcd2-eda63107268b"],
Cell[152504, 4459, 906, 23, 124, "Output",ExpressionUUID->"68e9f3ac-9a58-4fdd-9a9b-5d111de9124a"]
}, Open  ]],
Cell[CellGroupData[{
Cell[153447, 4487, 116, 1, 50, "Input",ExpressionUUID->"fee435fe-0144-49b2-8fea-73f98bc582e3"],
Cell[153566, 4490, 84, 0, 63, "Output",ExpressionUUID->"bceb20ea-8aca-40c1-9244-543e08c3eab6"]
}, Open  ]],
Cell[153665, 4493, 298, 8, 69, "Text",ExpressionUUID->"3da2b9cc-9fbf-4289-8712-b38a19c35c96"],
Cell[CellGroupData[{
Cell[153988, 4505, 185, 4, 50, "Input",ExpressionUUID->"eeee7182-71d5-4ea9-8302-c3c0a3dbeafa"],
Cell[154176, 4511, 4574, 147, 632, "Output",ExpressionUUID->"f879d6da-818f-45b6-b183-a46c7238f598"]
}, Open  ]],
Cell[158765, 4661, 112, 0, 46, "Text",ExpressionUUID->"ee50d668-7609-49e8-ae4f-d7843c4c0e75"],
Cell[CellGroupData[{
Cell[158902, 4665, 134, 2, 50, "Input",ExpressionUUID->"a84bc19e-92c1-49a2-b660-e82427254cc1"],
Cell[159039, 4669, 2342, 75, 332, "Output",ExpressionUUID->"a35b4c7b-459a-4634-99aa-7ba43d60b4c0"]
}, Open  ]],
Cell[161396, 4747, 150, 2, 46, "Text",ExpressionUUID->"f6725966-89b4-4f10-a6b8-f1bec8b56d7a"],
Cell[CellGroupData[{
Cell[161571, 4753, 115, 1, 50, "Input",ExpressionUUID->"b944f4cb-37cc-4a2c-984e-80162edd8f3d"],
Cell[161689, 4756, 84, 0, 63, "Output",ExpressionUUID->"392e1c81-568d-48a5-97cc-87d202f6b212"]
}, Open  ]],
Cell[161788, 4759, 187, 3, 68, "Text",ExpressionUUID->"51bb5fec-3c5f-4c50-bb0d-3a38588ef0cf"],
Cell[CellGroupData[{
Cell[162000, 4766, 203, 5, 50, "Input",ExpressionUUID->"98ac8e73-cf0b-4019-8bb8-9bef4a0724ba"],
Cell[162206, 4773, 262, 5, 63, "Output",ExpressionUUID->"1c35ea33-8d7e-46df-8033-6aba0ba55749"]
}, Open  ]],
Cell[CellGroupData[{
Cell[162505, 4783, 211, 5, 50, "Input",ExpressionUUID->"dde95ce3-059d-4195-b87e-c4ae10cdb0a8"],
Cell[162719, 4790, 3940, 114, 527, "Output",ExpressionUUID->"e85b0ff1-ab5b-4dd0-b4d9-6941e414f66f"]
}, Open  ]],
Cell[CellGroupData[{
Cell[166696, 4909, 119, 1, 50, "Input",ExpressionUUID->"88056c98-b9a0-4916-866a-cbc71b90dd6c"],
Cell[166818, 4912, 84, 0, 63, "Output",ExpressionUUID->"11564c8d-86ec-4806-8099-a0bc7633b1b3"]
}, Open  ]],
Cell[CellGroupData[{
Cell[166939, 4917, 158, 3, 50, "Input",ExpressionUUID->"c313dd35-d75e-49e5-b086-4388fbc9dbf7"],
Cell[167100, 4922, 277, 6, 94, "Output",ExpressionUUID->"32fd73ab-7017-4640-8287-cd2fbadb128a"]
}, Open  ]],
Cell[CellGroupData[{
Cell[167414, 4933, 158, 3, 50, "Input",ExpressionUUID->"947b0e49-fe7d-43e3-8d8d-996501f172ce"],
Cell[167575, 4938, 277, 6, 94, "Output",ExpressionUUID->"83825637-f418-45cc-b5a1-72ee79733f44"]
}, Open  ]],
Cell[CellGroupData[{
Cell[167889, 4949, 170, 4, 50, "Input",ExpressionUUID->"a221db08-3bf5-42da-8c17-54230363d7dc"],
Cell[168062, 4955, 2342, 75, 332, "Output",ExpressionUUID->"85aec3ef-0465-4e3f-9b68-f343e2dfb69c"]
}, Open  ]],
Cell[CellGroupData[{
Cell[170441, 5035, 116, 1, 50, "Input",ExpressionUUID->"62880333-4326-4917-8438-c21942dcf7dc"],
Cell[170560, 5038, 84, 0, 63, "Output",ExpressionUUID->"f903292c-0acc-44d5-84c4-7cf0db084595"]
}, Open  ]],
Cell[170659, 5041, 607, 16, 69, "Text",ExpressionUUID->"488252c3-e068-46c1-b64e-36600e7c72c9"],
Cell[CellGroupData[{
Cell[171291, 5061, 140, 2, 50, "Input",ExpressionUUID->"4022adf2-5f6f-46e9-9408-e213c72a4d0c"],
Cell[171434, 5065, 738, 23, 132, "Output",ExpressionUUID->"1f9aaaf7-add9-4b02-8670-cfca57549c92"]
}, Open  ]],
Cell[172187, 5091, 226, 3, 68, "Text",ExpressionUUID->"d2f742a4-060e-471d-a1d8-d37cb1e87ada"],
Cell[CellGroupData[{
Cell[172438, 5098, 140, 2, 50, "Input",ExpressionUUID->"0ac5b3cb-2f5d-45e5-9da3-a89239a9ce02"],
Cell[172581, 5102, 317, 9, 63, "Output",ExpressionUUID->"3eed0f33-f4f1-47da-8c65-7f1f9a8e9da5"]
}, Open  ]],
Cell[CellGroupData[{
Cell[172935, 5116, 189, 4, 50, "Input",ExpressionUUID->"275529d4-5534-47e9-8635-54fe52919c3e"],
Cell[173127, 5122, 317, 9, 63, "Output",ExpressionUUID->"b91f24e5-35df-41a2-b1c6-fb7168ff68c6"]
}, Open  ]],
Cell[CellGroupData[{
Cell[173481, 5136, 180, 4, 50, "Input",ExpressionUUID->"f8be4bf5-30a5-4741-b4e7-1daeb9ec2dd7"],
Cell[173664, 5142, 317, 9, 63, "Output",ExpressionUUID->"18071645-a140-4fd5-84af-33fc5b30210b"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[174030, 5157, 193, 4, 51, "Subsubsection",ExpressionUUID->"dfacf308-d438-4638-ac72-6c8715ee7e47",
 CellTags->"Kernel"],
Cell[174226, 5163, 1935, 40, 380, "Text",ExpressionUUID->"8fdfd491-8bd5-4840-9615-f8be3b740630",
 CellTags->"(2002b)"],
Cell[CellGroupData[{
Cell[176186, 5207, 149, 3, 50, "Input",ExpressionUUID->"6b70918c-d13a-4956-9ad0-290f482f1837"],
Cell[176338, 5212, 242, 7, 82, "Output",ExpressionUUID->"d4b97e93-c707-4154-8006-ab6c65299436"]
}, Open  ]],
Cell[CellGroupData[{
Cell[176617, 5224, 149, 3, 50, "Input",ExpressionUUID->"0860bf55-1521-43b4-9b63-23e4b06435c2"],
Cell[176769, 5229, 242, 7, 82, "Output",ExpressionUUID->"7d6816d3-6f69-49f7-8cb5-8597361c1dfc"]
}, Open  ]],
Cell[CellGroupData[{
Cell[177048, 5241, 149, 3, 50, "Input",ExpressionUUID->"4c69231e-1dff-42f9-975c-57b034aede13"],
Cell[177200, 5246, 160, 3, 63, "Output",ExpressionUUID->"61fc2763-6019-418d-a47a-3d35cdf8019f"]
}, Open  ]],
Cell[CellGroupData[{
Cell[177397, 5254, 149, 3, 50, "Input",ExpressionUUID->"6fd893c3-92c9-4e22-81ec-13af1bac84c0"],
Cell[177549, 5259, 242, 7, 82, "Output",ExpressionUUID->"3279a935-8c13-42d2-a4f6-a4c0d705014c"]
}, Open  ]],
Cell[177806, 5269, 161, 3, 46, "Text",ExpressionUUID->"f48eb62e-f107-410c-9bd7-767456e02ca8"],
Cell[CellGroupData[{
Cell[177992, 5276, 160, 3, 50, "Input",ExpressionUUID->"4b5c3540-a5d6-4cf5-948c-2ff6fc36296a"],
Cell[178155, 5281, 86, 0, 63, "Output",ExpressionUUID->"9335b483-67dd-41af-95a9-b6a554abed3e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[178278, 5286, 160, 3, 50, "Input",ExpressionUUID->"4a1878fb-d077-4bca-ac28-2d3c611f2ef2"],
Cell[178441, 5291, 86, 0, 63, "Output",ExpressionUUID->"1aa81aa0-f747-4fa0-8d14-d240a354dbf9"]
}, Open  ]],
Cell[CellGroupData[{
Cell[178564, 5296, 160, 3, 50, "Input",ExpressionUUID->"255fa489-5cd0-49b0-bd37-10375e743773"],
Cell[178727, 5301, 86, 0, 63, "Output",ExpressionUUID->"08317853-1886-431b-990a-e05762afd3b8"]
}, Open  ]],
Cell[CellGroupData[{
Cell[178850, 5306, 160, 3, 50, "Input",ExpressionUUID->"3e84153e-d223-4b6d-baa3-4bd0d05ee7c2"],
Cell[179013, 5311, 86, 0, 63, "Output",ExpressionUUID->"c911cdf8-df29-427e-97aa-2acd3f521230"]
}, Open  ]],
Cell[179114, 5314, 90, 0, 46, "Text",ExpressionUUID->"010ee1f3-e839-44e9-bf9e-e7134a9effd8"],
Cell[179207, 5316, 359, 10, 50, "Input",ExpressionUUID->"1fd1c1a0-cc25-458b-9cf2-0eb59f10fead"],
Cell[179569, 5328, 151, 2, 46, "Text",ExpressionUUID->"12edde75-e77c-4a1e-b3f5-86279af73322"],
Cell[CellGroupData[{
Cell[179745, 5334, 163, 3, 50, "Input",ExpressionUUID->"3a45f7d0-78e8-4d12-bc3a-d641f7d5ac08"],
Cell[179911, 5339, 164, 3, 63, "Output",ExpressionUUID->"760f068f-7df4-4fc3-b190-88eb402d7d9f"]
}, Open  ]],
Cell[180090, 5345, 197, 5, 46, "Text",ExpressionUUID->"910b495e-30c3-4b67-9329-242bfc19f151"],
Cell[CellGroupData[{
Cell[180312, 5354, 184, 4, 50, "Input",ExpressionUUID->"7365864d-c74f-4eba-b33c-df760dd04903"],
Cell[180499, 5360, 984, 30, 94, "Output",ExpressionUUID->"d2e3572a-0510-47d5-b914-9c71f46ad3dc"]
}, Open  ]],
Cell[181498, 5393, 383, 10, 90, "Text",ExpressionUUID->"3f12fa84-93dd-48b2-9dc0-8245dd49bf43"],
Cell[CellGroupData[{
Cell[181906, 5407, 218, 4, 50, "Input",ExpressionUUID->"89dd9010-a971-43f6-b764-73fb4e89e090"],
Cell[182127, 5413, 4032, 133, 186, "Output",ExpressionUUID->"4146a97e-fda3-4257-b11c-8d8d7134d0ee"]
}, Open  ]],
Cell[186174, 5549, 290, 8, 69, "Text",ExpressionUUID->"a84582e9-db8b-416f-b71d-acefb56c926d"],
Cell[CellGroupData[{
Cell[186489, 5561, 124, 1, 50, "Input",ExpressionUUID->"2180721c-646e-43fa-b66c-79834e903e09"],
Cell[186616, 5564, 229, 5, 35, "Message",ExpressionUUID->"ee4cedaa-292f-4fbf-819d-9be1d4494309"],
Cell[186848, 5571, 287, 6, 35, "Message",ExpressionUUID->"8f845578-e94a-4ded-935f-a68278579efd"],
Cell[187138, 5579, 390, 8, 68, "Message",ExpressionUUID->"9f22cf38-534d-4355-bcda-e2efdd819359"],
Cell[187531, 5589, 287, 6, 35, "Message",ExpressionUUID->"4efdce4f-c92f-40b3-a6e9-7d4df9afb244"],
Cell[187821, 5597, 498, 9, 68, "Message",ExpressionUUID->"ccee70bd-6448-4c26-b870-5b90f23a6d36"],
Cell[188322, 5608, 242, 7, 82, "Output",ExpressionUUID->"c289f50a-5589-44e9-bc27-c0a955dd60bb"]
}, Open  ]],
Cell[188579, 5618, 243, 6, 68, "Text",ExpressionUUID->"7339e4a1-aa74-449e-a2fc-227a9c5441c6"],
Cell[CellGroupData[{
Cell[188847, 5628, 122, 1, 50, "Input",ExpressionUUID->"8f3264f8-168b-4d2d-a687-c09a6d04964e"],
Cell[188972, 5631, 86, 0, 63, "Output",ExpressionUUID->"8b693c1d-39e6-49a9-88da-858248ae5a53"]
}, Open  ]],
Cell[189073, 5634, 172, 5, 46, "Text",ExpressionUUID->"2d60e473-be98-4a2b-9d7c-8ee186d2eb2b"],
Cell[CellGroupData[{
Cell[189270, 5643, 85, 0, 50, "Input",ExpressionUUID->"fc42a14e-23bb-4105-a157-5ef7b5adf098"],
Cell[189358, 5645, 160, 3, 63, "Output",ExpressionUUID->"5de0226f-2e26-4810-b38e-a5d6013cc489"]
}, Open  ]],
Cell[CellGroupData[{
Cell[189555, 5653, 152, 3, 50, "Input",ExpressionUUID->"114a8938-59ae-4fb9-970e-c2b8e2f62199"],
Cell[189710, 5658, 160, 3, 63, "Output",ExpressionUUID->"048d77cf-6309-4402-8fdb-fad0df69f2e2"]
}, Open  ]],
Cell[189885, 5664, 1042, 28, 203, "Text",ExpressionUUID->"628db8a8-452a-41b4-b0fc-04d4f909dd51"],
Cell[CellGroupData[{
Cell[190952, 5696, 281, 7, 50, "Input",ExpressionUUID->"38e12275-c771-4210-b303-172ad995533f"],
Cell[CellGroupData[{
Cell[191258, 5707, 247, 5, 36, "Print",ExpressionUUID->"b3a0ee24-67e3-41a7-8681-da8e516b4b71"],
Cell[191508, 5714, 235, 5, 36, "Print",ExpressionUUID->"09c0f27e-fdf9-4190-825b-f24f19924e19"],
Cell[191746, 5721, 141, 1, 36, "Print",ExpressionUUID->"2f694545-b77a-4919-9410-4522917c56f8"],
Cell[191890, 5724, 837, 21, 67, "Print",ExpressionUUID->"8b498ea1-0411-4f56-a634-ad78241d4285"]
}, Open  ]],
Cell[192742, 5748, 2120, 62, 212, "Output",ExpressionUUID->"a89feff3-5606-4e3c-a157-d48b74feb4fd"]
}, Open  ]],
Cell[CellGroupData[{
Cell[194899, 5815, 164, 3, 50, "Input",ExpressionUUID->"600bd092-578c-4b0e-8e49-32fe43636e12"],
Cell[195066, 5820, 274, 6, 94, "Output",ExpressionUUID->"f9aeb12c-9084-47d7-b855-d186147791c9"]
}, Open  ]],
Cell[195355, 5829, 202, 4, 46, "Text",ExpressionUUID->"99bd0d83-0d4d-4036-a019-d850a0b98835"],
Cell[CellGroupData[{
Cell[195582, 5837, 394, 9, 111, "Input",ExpressionUUID->"8969b96e-77c3-4c00-a92c-ebc4c948f274"],
Cell[CellGroupData[{
Cell[196001, 5850, 247, 5, 36, "Print",ExpressionUUID->"54202641-7046-4e10-b94c-1c8534aab45f"],
Cell[196251, 5857, 235, 5, 36, "Print",ExpressionUUID->"f431d27e-b296-4141-8f06-60477460f492"],
Cell[196489, 5864, 141, 1, 36, "Print",ExpressionUUID->"d6651008-379c-492a-ab87-9996f19b3528"],
Cell[196633, 5867, 837, 21, 67, "Print",ExpressionUUID->"8cac3555-28f5-47bf-acae-64cf219317dd"]
}, Open  ]],
Cell[197485, 5891, 4867, 142, 456, "Output",ExpressionUUID->"6ee8635d-4056-4108-98ca-09030e97ada7"]
}, Open  ]],
Cell[202367, 6036, 1158, 24, 246, "Text",ExpressionUUID->"3d0d70de-fad8-4e45-9c51-6f1ca3ae58f3"],
Cell[203528, 6062, 113, 0, 46, "Text",ExpressionUUID->"65cf0a90-cf95-4dd0-84ed-6dbe6bd55682"],
Cell[CellGroupData[{
Cell[203666, 6066, 131, 1, 50, "Input",ExpressionUUID->"ffba2452-494c-408d-80a8-fa744af4a132"],
Cell[203800, 6069, 405, 8, 124, "Output",ExpressionUUID->"1f07311c-6a00-476e-91a3-b6aa7657299c"]
}, Open  ]],
Cell[204220, 6080, 109, 0, 46, "Text",ExpressionUUID->"28bda26a-0b13-4062-bae1-251f4f025485"],
Cell[CellGroupData[{
Cell[204354, 6084, 120, 1, 50, "Input",ExpressionUUID->"4e3cd87d-bf70-48c3-9d91-715a80029ec2"],
Cell[204477, 6087, 276, 6, 94, "Output",ExpressionUUID->"69075edd-72e1-4322-b716-c9e9367cd496"]
}, Open  ]],
Cell[204768, 6096, 274, 6, 69, "Text",ExpressionUUID->"cf29e3b5-eb46-4f3b-bb71-b4feb79689dc"],
Cell[CellGroupData[{
Cell[205067, 6106, 326, 8, 81, "Input",ExpressionUUID->"8a9e5152-d028-4cee-92af-afa2c850f53b"],
Cell[205396, 6116, 47366, 1266, 3184, "Output",ExpressionUUID->"29b12fb6-b7cd-4d6b-a079-5610e96fae3e"]
}, Open  ]],
Cell[252777, 7385, 372, 6, 90, "Text",ExpressionUUID->"86a10d72-cc2f-471d-9f31-07ec5f6a71fb"],
Cell[CellGroupData[{
Cell[253174, 7395, 87, 0, 50, "Input",ExpressionUUID->"9d477fd2-2984-4bb6-a061-7095747157d9"],
Cell[253264, 7397, 217, 5, 63, "Output",ExpressionUUID->"908227ee-ca0a-4e97-b983-2172af228b08"]
}, Open  ]],
Cell[253496, 7405, 662, 12, 157, "Text",ExpressionUUID->"e733b08a-4253-4261-8a3d-b8938904f5c2"],
Cell[CellGroupData[{
Cell[254183, 7421, 224, 5, 83, "Input",ExpressionUUID->"b54e8361-528d-4f95-ac9c-5297cafdbb5c"],
Cell[254410, 7428, 204, 5, 82, "Output",ExpressionUUID->"5b663494-af1f-4240-b2bb-086cbcbbbe86"]
}, Open  ]],
Cell[CellGroupData[{
Cell[254651, 7438, 149, 3, 50, "Input",ExpressionUUID->"b2100616-c62a-409d-af1c-f6029286baac"],
Cell[254803, 7443, 87, 0, 63, "Output",ExpressionUUID->"c95ebc25-e33c-4320-aef4-d6c508aa07b0"]
}, Open  ]],
Cell[254905, 7446, 125, 0, 46, "Text",ExpressionUUID->"352bfa15-305f-4a64-b6d5-03a82541d0d4"],
Cell[CellGroupData[{
Cell[255055, 7450, 203, 4, 50, "Input",ExpressionUUID->"fd6c9d5b-2aab-4fdc-91d0-30923ac35b1a"],
Cell[255261, 7456, 160, 3, 63, "Output",ExpressionUUID->"712316e4-ce74-4605-982b-681dc833b0a2"]
}, Open  ]],
Cell[CellGroupData[{
Cell[255458, 7464, 149, 3, 50, "Input",ExpressionUUID->"47fa3750-ad79-4940-8174-d28cded8867e"],
Cell[255610, 7469, 86, 0, 63, "Output",ExpressionUUID->"7319d9e8-4cce-4586-a71f-7f1cb03e2c87"]
}, Open  ]],
Cell[255711, 7472, 190, 3, 68, "Text",ExpressionUUID->"3eb4081e-0e71-4d76-a72f-7f5f5c6cec5d"],
Cell[CellGroupData[{
Cell[255926, 7479, 245, 6, 83, "Input",ExpressionUUID->"abdccee3-757a-4be4-9927-0b33c4bd659b"],
Cell[256174, 7487, 204, 5, 82, "Output",ExpressionUUID->"03a3e997-fbab-452f-a218-48f9baa4bc4c"]
}, Open  ]],
Cell[CellGroupData[{
Cell[256415, 7497, 149, 3, 50, "Input",ExpressionUUID->"86d92257-78b8-48ba-9bed-16101f9ffd1d"],
Cell[256567, 7502, 87, 0, 63, "Output",ExpressionUUID->"0f8a0ec5-9634-43c7-906f-7972bb9dfe9c"]
}, Open  ]],
Cell[256669, 7505, 1027, 23, 224, "Text",ExpressionUUID->"0da088e9-2d66-4bf8-804f-00f523b9cb09"],
Cell[CellGroupData[{
Cell[257721, 7532, 131, 1, 50, "Input",ExpressionUUID->"cea5af68-0e65-440d-8178-5463c4d77720"],
Cell[257855, 7535, 182, 5, 82, "Output",ExpressionUUID->"bc2d7a5a-3446-47c6-9525-c1dd6fe8b3dc"]
}, Open  ]],
Cell[CellGroupData[{
Cell[258074, 7545, 131, 1, 50, "Input",ExpressionUUID->"20bf82ec-7e63-4175-89ff-76cbca567be8"],
Cell[258208, 7548, 182, 5, 82, "Output",ExpressionUUID->"4a1253a3-bf83-47e4-9564-1b19a8a0eb9a"]
}, Open  ]],
Cell[CellGroupData[{
Cell[258427, 7558, 131, 1, 50, "Input",ExpressionUUID->"cd4cee39-d792-4c7b-8299-0ba9c5436c55"],
Cell[258561, 7561, 139, 3, 63, "Output",ExpressionUUID->"bfede756-a2ce-422f-a992-b252f750385d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[258737, 7569, 131, 1, 50, "Input",ExpressionUUID->"b9462375-8136-4394-9201-e0f47552b9c4"],
Cell[258871, 7572, 182, 5, 82, "Output",ExpressionUUID->"db3735be-4d8b-4ad6-a73b-960746568d0d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[259090, 7582, 132, 1, 50, "Input",ExpressionUUID->"46b5222b-1faf-4ef2-9504-10f4e93bfdfb"],
Cell[259225, 7585, 139, 3, 63, "Output",ExpressionUUID->"29aa1ef4-7a03-4eb5-bfcb-419e5b773837"]
}, Open  ]],
Cell[CellGroupData[{
Cell[259401, 7593, 131, 1, 50, "Input",ExpressionUUID->"8d9aaca6-5dbd-4026-9a40-2309d31ddd9e"],
Cell[259535, 7596, 140, 3, 63, "Output",ExpressionUUID->"7d58dc04-d223-44e3-ad57-0f98cde74b18"]
}, Open  ]],
Cell[CellGroupData[{
Cell[259712, 7604, 132, 1, 50, "Input",ExpressionUUID->"dc29ffdd-5fc3-4920-8ef1-084d78c1011f"],
Cell[259847, 7607, 139, 3, 63, "Output",ExpressionUUID->"c73b7020-f83c-4771-9ed5-cc99a2d58166"]
}, Open  ]],
Cell[CellGroupData[{
Cell[260023, 7615, 130, 1, 50, "Input",ExpressionUUID->"e4110aa6-f0ef-4897-9995-cee8853e3257"],
Cell[260156, 7618, 142, 3, 63, "Output",ExpressionUUID->"5fe38793-8625-489a-824b-d7812cd7c591"]
}, Open  ]],
Cell[260313, 7624, 162, 3, 46, "Text",ExpressionUUID->"db7a56b2-1c04-40f3-8c58-d5f84162c2ec"],
Cell[260478, 7629, 2673, 82, 699, "Input",ExpressionUUID->"832f5b12-41f4-4301-813f-e4ce4038281c"],
Cell[263154, 7713, 1741, 56, 170, "Text",ExpressionUUID->"8a324c01-cc18-4c5d-a6b9-7312e880f7f9",
 CellTags->"MP66"],
Cell[264898, 7771, 297, 8, 69, "Text",ExpressionUUID->"ce4c1fd1-c08b-4206-9d1a-a0685ed30b09"],
Cell[CellGroupData[{
Cell[265220, 7783, 242, 6, 50, "Input",ExpressionUUID->"6a8bc4f1-961a-429f-9483-1c66701c2af8"],
Cell[265465, 7791, 338, 10, 82, "Output",ExpressionUUID->"e2f31b31-9057-450a-ade1-59736bcbb901"]
}, Open  ]],
Cell[CellGroupData[{
Cell[265840, 7806, 317, 8, 81, "Input",ExpressionUUID->"72b08d07-c812-441f-88c1-62cd484f6cd6"],
Cell[266160, 7816, 338, 10, 82, "Output",ExpressionUUID->"3bdd0039-57b9-49de-bf56-f566077e3ace"]
}, Open  ]],
Cell[CellGroupData[{
Cell[266535, 7831, 308, 8, 81, "Input",ExpressionUUID->"eb52b2c8-f97a-4fe3-bddf-49097c535a2b"],
Cell[266846, 7841, 249, 5, 36, "Print",ExpressionUUID->"e80d274d-92ee-449a-9db8-4e86b0fb8f59"],
Cell[267098, 7848, 1581, 47, 182, "Output",ExpressionUUID->"f6223072-3626-4e35-8d23-3efae481b6ac"]
}, Open  ]],
Cell[CellGroupData[{
Cell[268716, 7900, 193, 4, 50, "Input",ExpressionUUID->"9c4eff5b-fc9d-494a-adbd-b495e1d81a63"],
Cell[268912, 7906, 178, 3, 63, "Output",ExpressionUUID->"5f086e53-1d5e-48f5-a8ff-944dd76de324"]
}, Open  ]],
Cell[CellGroupData[{
Cell[269127, 7914, 174, 4, 50, "Input",ExpressionUUID->"e3d58000-9bab-405f-89e1-d2ac656218c6"],
Cell[269304, 7920, 212, 6, 63, "Output",ExpressionUUID->"94c87fb4-b96c-45bc-86a0-08d163852ec2"]
}, Open  ]],
Cell[CellGroupData[{
Cell[269553, 7931, 172, 4, 50, "Input",ExpressionUUID->"33d2cc0e-611f-463b-bb37-0b6954935f47"],
Cell[269728, 7937, 723, 23, 82, "Output",ExpressionUUID->"de056ff8-f863-46e2-8a35-27386401e577"]
}, Open  ]],
Cell[CellGroupData[{
Cell[270488, 7965, 377, 10, 81, "Input",ExpressionUUID->"6d28affd-8335-4a0e-839b-6c9d84c9fe1d"],
Cell[CellGroupData[{
Cell[270890, 7979, 247, 5, 36, "Print",ExpressionUUID->"b3fd06a1-5d06-4f15-9863-b90b15635550"],
Cell[271140, 7986, 235, 5, 36, "Print",ExpressionUUID->"df5ec943-70cb-43bd-b44c-ccea712e5c2e"],
Cell[271378, 7993, 141, 1, 36, "Print",ExpressionUUID->"3c3326bc-5d9a-4b0c-bd70-a1c82cf9b23d"]
}, Open  ]],
Cell[271534, 7997, 1382, 38, 221, "Output",ExpressionUUID->"4afbb3fa-cb57-4cef-bc05-63f64cce3657"]
}, Open  ]],
Cell[CellGroupData[{
Cell[272953, 8040, 149, 3, 50, "Input",ExpressionUUID->"5553af50-1b57-454f-b32f-e6767b559466"],
Cell[273105, 8045, 939, 30, 132, "Output",ExpressionUUID->"0263e31a-3e8b-486b-8cef-b9ac162a39e0"]
}, Open  ]],
Cell[274059, 8078, 107, 0, 46, "Text",ExpressionUUID->"d5afde03-b9a6-4254-a1be-d1c29241187c"],
Cell[274169, 8080, 822, 15, 200, "Text",ExpressionUUID->"1fa0b706-8727-48c8-8a47-c18f6fc233d9",
 CellTags->"Faigle98"],
Cell[CellGroupData[{
Cell[275016, 8099, 132, 1, 50, "Input",ExpressionUUID->"41b6478a-e1ac-44e6-96e6-b2cb438bf15e"],
Cell[275151, 8102, 349, 8, 127, "Output",ExpressionUUID->"9b5a6ee6-f111-4f74-b7f5-a43ece5ebef8"]
}, Open  ]],
Cell[275515, 8113, 161, 3, 46, "Text",ExpressionUUID->"334dab50-c2e1-4b52-b199-b5410245e29a"],
Cell[275679, 8118, 319, 9, 81, "Input",ExpressionUUID->"e14354fa-6726-4149-a0a3-5c1ecb957b01"],
Cell[276001, 8129, 116, 0, 46, "Text",ExpressionUUID->"a0032892-f1a1-442e-88ae-bf177f6d386e"],
Cell[CellGroupData[{
Cell[276142, 8133, 281, 7, 50, "Input",ExpressionUUID->"4a46e586-db65-4f84-814d-80d8bfd90862"],
Cell[276426, 8142, 346, 10, 82, "Output",ExpressionUUID->"8fd86eae-c7e8-4f43-a7be-74cf0378540c"]
}, Open  ]],
Cell[276787, 8155, 73, 0, 46, "Text",ExpressionUUID->"7e2f208e-9ca0-483b-a036-ce0cc2d5e95e"],
Cell[CellGroupData[{
Cell[276885, 8159, 281, 7, 50, "Input",ExpressionUUID->"b9a1dcd8-5822-494d-8b92-f3efe60b5e8e"],
Cell[277169, 8168, 343, 10, 82, "Output",ExpressionUUID->"baa777a1-bee0-46f0-a6df-3290aba29bff"]
}, Open  ]],
Cell[CellGroupData[{
Cell[277549, 8183, 255, 6, 50, "Input",ExpressionUUID->"ba2556a6-34ea-48ed-bcf7-dbee80db2f89"],
Cell[277807, 8191, 343, 10, 82, "Output",ExpressionUUID->"c4f878aa-6d37-481f-b9da-e45467ce3c18"]
}, Open  ]],
Cell[278165, 8204, 121, 0, 46, "Text",ExpressionUUID->"6add956a-e51f-4e53-b765-5965c5db406b"],
Cell[CellGroupData[{
Cell[278311, 8208, 284, 7, 81, "Input",ExpressionUUID->"6c0bc344-3da3-4562-890c-1acd710da527"],
Cell[278598, 8217, 343, 10, 82, "Output",ExpressionUUID->"5dd49f9f-5083-49bc-a5f2-bacfd40a798e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[278978, 8232, 147, 3, 50, "Input",ExpressionUUID->"06d029cb-87dd-4eb2-aec8-7c71cfbf65d8"],
Cell[279128, 8237, 276, 8, 82, "Output",ExpressionUUID->"021ad68c-bbec-41dd-8f05-f83874302b5d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[279441, 8250, 147, 3, 50, "Input",ExpressionUUID->"8b4867c3-87b4-4a1f-8688-433544aaea88"],
Cell[279591, 8255, 276, 8, 82, "Output",ExpressionUUID->"d1c33c8d-2764-4659-8bdc-037f85577b26"]
}, Open  ]],
Cell[279882, 8266, 160, 3, 46, "Text",ExpressionUUID->"7fe50392-db90-4d3b-be2e-ab06873c0d53"],
Cell[CellGroupData[{
Cell[280067, 8273, 259, 7, 50, "Input",ExpressionUUID->"e8588df1-1c91-4ff5-942d-49f3ac871ac9"],
Cell[280329, 8282, 184, 5, 63, "Output",ExpressionUUID->"4ec95400-19e7-4274-954a-5d1756a799b7"]
}, Open  ]],
Cell[280528, 8290, 495, 11, 114, "Text",ExpressionUUID->"8fe9deac-1560-457b-95ef-feaef0553563"],
Cell[CellGroupData[{
Cell[281048, 8305, 287, 7, 81, "Input",ExpressionUUID->"8bdf7d24-2477-4795-9f97-7a1dc6643512"],
Cell[281338, 8314, 343, 10, 82, "Output",ExpressionUUID->"8f5dde1e-2218-4227-918c-8389131ae710"]
}, Open  ]],
Cell[CellGroupData[{
Cell[281718, 8329, 117, 1, 50, "Input",ExpressionUUID->"d3108413-f819-4bbe-8505-f2907956b905"],
Cell[281838, 8332, 86, 0, 63, "Output",ExpressionUUID->"cc629cb8-0c01-4455-b0ea-6ca6884a17a2"]
}, Open  ]],
Cell[CellGroupData[{
Cell[281961, 8337, 239, 5, 50, "Input",ExpressionUUID->"819bb69f-d4b3-4e1e-a05b-c989de628514"],
Cell[282203, 8344, 281, 8, 82, "Output",ExpressionUUID->"957424a5-8424-44bf-844b-565c08fdb027"]
}, Open  ]],
Cell[CellGroupData[{
Cell[282521, 8357, 152, 3, 50, "Input",ExpressionUUID->"73fce9ed-5629-4e11-969a-56525754e9ec"],
Cell[282676, 8362, 281, 8, 82, "Output",ExpressionUUID->"6d180d38-efc4-4ecd-8993-5975e01818ec"]
}, Open  ]],
Cell[CellGroupData[{
Cell[282994, 8375, 153, 3, 50, "Input",ExpressionUUID->"d2a45e35-9574-4249-ac48-5ba414b91560"],
Cell[283150, 8380, 108, 1, 63, "Output",ExpressionUUID->"23cf4e37-b6e2-4bac-afd6-bb55445dbdcf"]
}, Open  ]],
Cell[CellGroupData[{
Cell[283295, 8386, 213, 4, 50, "Input",ExpressionUUID->"4d3011d0-871a-42c3-b461-17e7cae162da"],
Cell[283511, 8392, 86, 0, 63, "Output",ExpressionUUID->"f3a07497-3b6d-4ca5-9f7c-b221fbe5d816"]
}, Open  ]],
Cell[CellGroupData[{
Cell[283634, 8397, 234, 5, 50, "Input",ExpressionUUID->"ffd72cec-2d95-43f9-a835-a0f3cccf62e4"],
Cell[283871, 8404, 281, 8, 82, "Output",ExpressionUUID->"d2d7951d-fe44-4bf6-a81e-663ef8771739"]
}, Open  ]],
Cell[CellGroupData[{
Cell[284189, 8417, 237, 5, 50, "Input",ExpressionUUID->"a14c2a00-8378-4e07-8894-95ed738790c3"],
Cell[284429, 8424, 281, 8, 82, "Output",ExpressionUUID->"95bcd4c6-03ff-45ab-a542-bdd3baa5751f"]
}, Open  ]],
Cell[284725, 8435, 564, 10, 134, "Text",ExpressionUUID->"ae41f541-ec0c-4e55-a262-e76d99145c62"],
Cell[285292, 8447, 1196, 37, 171, "Input",ExpressionUUID->"b78e3d7a-979e-4e02-acf6-c16b8acfde28"],
Cell[286491, 8486, 141, 2, 46, "Text",ExpressionUUID->"c7aed51f-0150-4cd3-ae32-1544e6509ff6"],
Cell[CellGroupData[{
Cell[286657, 8492, 122, 1, 50, "Input",ExpressionUUID->"378568ea-9858-4537-b812-259dceac99c1"],
Cell[286782, 8495, 142, 3, 63, "Output",ExpressionUUID->"83d564fe-1e41-4f02-b568-f03d0b06f3dc"]
}, Open  ]],
Cell[286939, 8501, 141, 2, 46, "Text",ExpressionUUID->"ecd3e98e-8568-46cd-b44d-026da0ae4006"],
Cell[CellGroupData[{
Cell[287105, 8507, 249, 6, 50, "Input",ExpressionUUID->"3b56247f-d367-405d-a78f-ae8d0d9c79e7"],
Cell[287357, 8515, 142, 3, 63, "Output",ExpressionUUID->"dd826c87-50ce-41de-a1f8-0fa5aedcdeaa"]
}, Open  ]],
Cell[287514, 8521, 165, 3, 46, "Text",ExpressionUUID->"6e00cf82-c5b7-43a0-813e-0b60a7be880e"],
Cell[CellGroupData[{
Cell[287704, 8528, 252, 6, 50, "Input",ExpressionUUID->"528519d1-4b25-452f-a90f-ea94a7af62ee"],
Cell[287959, 8536, 205, 6, 82, "Output",ExpressionUUID->"fbbb7b5c-2fcf-488c-927e-ecda283b4389"]
}, Open  ]],
Cell[CellGroupData[{
Cell[288201, 8547, 113, 1, 50, "Input",ExpressionUUID->"15badb5c-9811-4917-a70d-ce1ba8d19094"],
Cell[288317, 8550, 169, 4, 63, "Output",ExpressionUUID->"7668a2ce-ebed-40d9-93b6-7a22496c923f"]
}, Open  ]],
Cell[288501, 8557, 759, 20, 157, "Text",ExpressionUUID->"10263290-f480-43dd-8d8b-5ec511142dbb"],
Cell[289263, 8579, 1494, 45, 96, "Text",ExpressionUUID->"4e85ec3e-ab64-4617-b9e4-3b0bc4d5bff2"],
Cell[290760, 8626, 326, 5, 90, "Text",ExpressionUUID->"ca1cf9cf-285b-4fc6-afc9-fbfdd2806214"],
Cell[CellGroupData[{
Cell[291111, 8635, 596, 18, 83, "Input",ExpressionUUID->"21e972c3-3506-4b92-aeee-529e2fffa7cc"],
Cell[291710, 8655, 3319, 109, 382, "Output",ExpressionUUID->"170e46fe-259b-4284-b662-d87faadf1ef6"]
}, Open  ]],
Cell[295044, 8767, 218, 3, 68, "Text",ExpressionUUID->"736bbb3a-0de7-4163-ba4f-21ba97c26a2e"],
Cell[CellGroupData[{
Cell[295287, 8774, 156, 3, 50, "Input",ExpressionUUID->"d8116da2-060e-45ef-9b55-62b4eef3df98"],
Cell[295446, 8779, 318, 6, 94, "Output",ExpressionUUID->"98d50a06-57e6-4682-b997-994ac86a6cf3"]
}, Open  ]],
Cell[CellGroupData[{
Cell[295801, 8790, 167, 3, 50, "Input",ExpressionUUID->"c92ffaa3-4846-4c23-92f7-7a6b93712e00"],
Cell[295971, 8795, 320, 6, 94, "Output",ExpressionUUID->"32b19417-b692-4b5a-bf31-6631bb26c696"]
}, Open  ]],
Cell[CellGroupData[{
Cell[296328, 8806, 121, 1, 50, "Input",ExpressionUUID->"c7095e21-1f68-43d2-90aa-f3af1365aad7"],
Cell[296452, 8809, 160, 3, 63, "Output",ExpressionUUID->"a83608c2-0f6d-44d3-b9c9-e0d489f3fd05"]
}, Open  ]],
Cell[296627, 8815, 172, 3, 68, "Text",ExpressionUUID->"15b56be1-4001-46c8-9d65-5319db7378a4"],
Cell[CellGroupData[{
Cell[296824, 8822, 124, 1, 50, "Input",ExpressionUUID->"c63fa3e5-0697-4731-ae95-0da8e1e9fe39"],
Cell[296951, 8825, 160, 3, 63, "Output",ExpressionUUID->"aa90986d-75f4-493a-aad5-15de2ea0de42"]
}, Open  ]],
Cell[CellGroupData[{
Cell[297148, 8833, 336, 9, 50, "Input",ExpressionUUID->"25d716f6-34fd-4fe8-b5d8-9ee54e4a3035"],
Cell[297487, 8844, 1001, 23, 124, "Output",ExpressionUUID->"c2ff9bcb-5bb2-4dac-baf6-1497ad57aabb"]
}, Open  ]],
Cell[298503, 8870, 957, 17, 223, "Text",ExpressionUUID->"b09b9528-350d-4aca-95b7-0a0ec0d73706"],
Cell[CellGroupData[{
Cell[299485, 8891, 399, 10, 111, "Input",ExpressionUUID->"2a00e29a-a1f8-4c86-ae4b-ae72c790fa0f"],
Cell[CellGroupData[{
Cell[299909, 8905, 247, 5, 36, "Print",ExpressionUUID->"b1360ff7-59a1-4b59-9a54-3b2e7cea65c5"],
Cell[300159, 8912, 235, 5, 36, "Print",ExpressionUUID->"7fdb2553-21bd-42cd-b042-c20b652bac0f"],
Cell[300397, 8919, 141, 1, 36, "Print",ExpressionUUID->"9c677f24-8400-461b-8ed5-7301e6b6c957"],
Cell[300541, 8922, 837, 21, 67, "Print",ExpressionUUID->"1204fde9-659b-4549-b6dd-e5d70efd2292"]
}, Open  ]],
Cell[301393, 8946, 7355, 224, 566, "Output",ExpressionUUID->"8dff21fc-543d-4b8e-81c7-357f79522d2a"]
}, Open  ]],
Cell[308763, 9173, 541, 14, 113, "Text",ExpressionUUID->"7e5823ad-31ba-42f7-8c60-711d2f2815c9"],
Cell[CellGroupData[{
Cell[309329, 9191, 165, 3, 50, "Input",ExpressionUUID->"8833e3d4-eac1-4561-b0c9-520613082d7a"],
Cell[309497, 9196, 274, 6, 94, "Output",ExpressionUUID->"60dcbbb4-7674-4858-857a-1f8a3724b07b"]
}, Open  ]],
Cell[CellGroupData[{
Cell[309808, 9207, 284, 7, 50, "Input",ExpressionUUID->"84029e02-4587-41aa-8932-354043f00de8"],
Cell[CellGroupData[{
Cell[310117, 9218, 247, 5, 36, "Print",ExpressionUUID->"8b277636-bb83-41eb-a2cc-7ad4fef9b39c"],
Cell[310367, 9225, 235, 5, 36, "Print",ExpressionUUID->"1dc46c0b-b2e8-4f48-9f57-0798d006dcd7"],
Cell[310605, 9232, 141, 1, 36, "Print",ExpressionUUID->"4149eb53-5d17-4b37-bd3e-8f966d729801"],
Cell[310749, 9235, 837, 21, 67, "Print",ExpressionUUID->"63e00126-4c66-4598-a4b0-04508e967130"]
}, Open  ]],
Cell[311601, 9259, 2250, 67, 232, "Output",ExpressionUUID->"8f94d247-2567-4ded-9a94-459f1350d9d6"]
}, Open  ]],
Cell[313866, 9329, 119, 0, 46, "Text",ExpressionUUID->"8323a6ac-6c77-4e7b-be7e-f9764d83f2b9"],
Cell[CellGroupData[{
Cell[314010, 9333, 165, 3, 50, "Input",ExpressionUUID->"15c616fb-01e2-495f-b769-ede8906acf6b"],
Cell[314178, 9338, 274, 6, 94, "Output",ExpressionUUID->"e0bccc18-346e-4d88-b859-8672fec1ce90"]
}, Open  ]],
Cell[314467, 9347, 770, 14, 179, "Text",ExpressionUUID->"21d37f1c-ab9b-48ce-9510-45acf10e15f7"],
Cell[CellGroupData[{
Cell[315262, 9365, 157, 3, 50, "Input",ExpressionUUID->"8b328a6f-6d94-4f43-b3d1-69cf418904c2"],
Cell[315422, 9370, 449, 8, 94, "Output",ExpressionUUID->"91231dae-a876-4f65-ad00-d7c4f1dcb959"]
}, Open  ]],
Cell[315886, 9381, 252, 7, 50, "Input",ExpressionUUID->"2e814706-10d9-41c0-81a6-d417cc8b1bf3"],
Cell[316141, 9390, 99, 0, 46, "Text",ExpressionUUID->"2a0b3f6c-ed97-481b-9b53-e4f6ce8c04bf"],
Cell[CellGroupData[{
Cell[316265, 9394, 128, 1, 50, "Input",ExpressionUUID->"5a13536c-da71-4a41-b9b2-20f96c54fe58"],
Cell[316396, 9397, 229, 5, 35, "Message",ExpressionUUID->"f93b9cde-a73b-453c-8cec-ac97dcccb2fd"],
Cell[316628, 9404, 287, 6, 35, "Message",ExpressionUUID->"eda06db6-c326-4325-a373-b1e2be374db2"],
Cell[316918, 9412, 390, 8, 68, "Message",ExpressionUUID->"18629545-160a-4d3a-83ea-ed6ba102c973"],
Cell[317311, 9422, 287, 6, 35, "Message",ExpressionUUID->"70205776-e2ec-43d1-bb96-36a5825c90cb"],
Cell[317601, 9430, 499, 9, 68, "Message",ExpressionUUID->"fb72415d-b662-4756-bd9a-054808713ca6"],
Cell[318103, 9441, 270, 8, 82, "Output",ExpressionUUID->"56776ee9-f320-45c9-a610-fc2559cc98ee"]
}, Open  ]],
Cell[CellGroupData[{
Cell[318410, 9454, 85, 0, 50, "Input",ExpressionUUID->"3fae637d-9667-439f-96d9-39e3307d203d"],
Cell[318498, 9456, 160, 3, 63, "Output",ExpressionUUID->"a4c5e08c-4441-4e01-9423-7295aa2405ad"]
}, Open  ]],
Cell[318673, 9462, 125, 0, 46, "Text",ExpressionUUID->"d6af9c50-dd9f-4d2a-8bdd-92896f372d93"],
Cell[CellGroupData[{
Cell[318823, 9466, 132, 1, 50, "Input",ExpressionUUID->"207884ab-fef6-4cd9-94c6-7e9bfa3a645d"],
Cell[318958, 9469, 87, 0, 63, "Output",ExpressionUUID->"2eb887a1-1979-4d89-88c8-c0d9e90c1530"]
}, Open  ]],
Cell[CellGroupData[{
Cell[319082, 9474, 364, 8, 81, "Input",ExpressionUUID->"922d965d-8522-448c-964f-5745803166ec"],
Cell[CellGroupData[{
Cell[319471, 9486, 247, 5, 36, "Print",ExpressionUUID->"e3bc1432-f341-4020-8d12-42f21c2b8e37"],
Cell[319721, 9493, 237, 5, 36, "Print",ExpressionUUID->"24145bfb-38b1-4fa3-b65f-8070d98ba053"],
Cell[319961, 9500, 134, 0, 36, "Print",ExpressionUUID->"c72cbd45-b5b5-493e-8ce1-f534d7ea2d3b"],
Cell[320098, 9502, 1037, 28, 85, "Print",ExpressionUUID->"14e19600-3190-4f2b-bfa2-a733772760ca"]
}, Open  ]],
Cell[321150, 9533, 2036, 60, 232, "Output",ExpressionUUID->"3a20185c-c565-4c21-8551-f70f6d80eb28"]
}, Open  ]],
Cell[323201, 9596, 348, 6, 90, "Text",ExpressionUUID->"45220a0c-5458-4a86-8b47-b87727ab074a"],
Cell[CellGroupData[{
Cell[323574, 9606, 166, 3, 50, "Input",ExpressionUUID->"49bcf303-9ea3-4c0b-bf1b-dcee611a9047"],
Cell[323743, 9611, 274, 6, 94, "Output",ExpressionUUID->"9209d42e-8e67-47f1-9370-d5ae6109739c"]
}, Open  ]],
Cell[CellGroupData[{
Cell[324054, 9622, 118, 1, 50, "Input",ExpressionUUID->"6bc66c25-936e-4ef7-86ed-20ba502c3706"],
Cell[324175, 9625, 204, 5, 82, "Output",ExpressionUUID->"346a79fc-65e1-4828-a94f-51837d272d53"]
}, Open  ]],
Cell[324394, 9633, 142, 2, 46, "Text",ExpressionUUID->"19a71702-c24c-4836-abcf-b6aa1dee6339"],
Cell[CellGroupData[{
Cell[324561, 9639, 88, 0, 50, "Input",ExpressionUUID->"c72023c0-ea96-4f36-9962-cc6a285ac30a"],
Cell[324652, 9641, 3319, 109, 382, "Output",ExpressionUUID->"165f386a-c205-4c8c-8263-8d55d6e17f2e"]
}, Open  ]],
Cell[327986, 9753, 124, 0, 46, "Text",ExpressionUUID->"683cf701-555e-4bd2-9db5-d17c10279c4c"],
Cell[CellGroupData[{
Cell[328135, 9757, 272, 6, 50, "Input",ExpressionUUID->"c3f5fe68-8f85-4b90-9aad-8e18255b25c7"],
Cell[328410, 9765, 204, 5, 82, "Output",ExpressionUUID->"ef518fb4-a7c9-44e3-8f3c-957eff67c326"]
}, Open  ]],
Cell[328629, 9773, 176, 3, 68, "Text",ExpressionUUID->"1b693406-4f1a-4561-9c55-7757ea8da704"],
Cell[328808, 9778, 251, 6, 50, "Input",ExpressionUUID->"8c442cc7-a549-44a3-b651-6b74d76587b2"],
Cell[CellGroupData[{
Cell[329084, 9788, 222, 5, 50, "Input",ExpressionUUID->"262dd938-0067-48e6-a299-be56d565e933"],
Cell[329309, 9795, 230, 6, 82, "Output",ExpressionUUID->"8f316b64-3a35-4574-9641-9670028cbd7e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[329576, 9806, 166, 3, 50, "Input",ExpressionUUID->"79936093-071e-471a-ace3-110903b8739b"],
Cell[329745, 9811, 108, 1, 63, "Output",ExpressionUUID->"c96b666b-05e3-4995-98d6-7562b3368d85"]
}, Open  ]],
Cell[CellGroupData[{
Cell[329890, 9817, 223, 5, 50, "Input",ExpressionUUID->"f1a70ac5-2fb1-464d-a150-458e18cbdf41"],
Cell[330116, 9824, 185, 4, 63, "Output",ExpressionUUID->"7e7dd9cb-c3d3-4426-ac7a-94edb0d3807e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[330338, 9833, 223, 5, 50, "Input",ExpressionUUID->"5bd2be81-d86f-4794-a1d6-46aa92e66793"],
Cell[330564, 9840, 185, 4, 63, "Output",ExpressionUUID->"c1aac3f9-d33f-4534-93dc-9769308841d3"]
}, Open  ]],
Cell[330764, 9847, 163, 3, 46, "Text",ExpressionUUID->"2eed489f-231a-4549-b0c2-2770b02969fa"],
Cell[CellGroupData[{
Cell[330952, 9854, 168, 3, 50, "Input",ExpressionUUID->"764ea187-8deb-40bc-867b-70f5d560ae3e"],
Cell[331123, 9859, 108, 1, 63, "Output",ExpressionUUID->"5651dd87-6ef1-48e2-a1c7-7bb7d44e036e"]
}, Open  ]],
Cell[331246, 9863, 212, 4, 68, "Text",ExpressionUUID->"15378f69-97c2-41bf-96ba-61351ce124cc"],
Cell[CellGroupData[{
Cell[331483, 9871, 225, 4, 50, "Input",ExpressionUUID->"53c993a5-9e19-4484-b596-f3af4ff22230"],
Cell[331711, 9877, 108806, 2946, 1200, "Output",ExpressionUUID->"58545167-8b6d-42f9-abab-3d7657fb4576"]
}, Open  ]],
Cell[440532, 12826, 215, 4, 68, "Text",ExpressionUUID->"7e54def8-864b-49cb-8bb2-8c63ae96a05d"],
Cell[CellGroupData[{
Cell[440772, 12834, 176, 3, 50, "Input",ExpressionUUID->"50f7c592-5dcd-4415-9088-55f8b7c3f4af"],
Cell[440951, 12839, 598, 18, 82, "Output",ExpressionUUID->"560ff0a3-68c7-4330-9806-7a8f78179784"]
}, Open  ]],
Cell[CellGroupData[{
Cell[441586, 12862, 176, 3, 50, "Input",ExpressionUUID->"b9c2934b-14e7-460b-89f6-e2796fad22d9"],
Cell[441765, 12867, 579, 17, 82, "Output",ExpressionUUID->"d4b81db9-b0d7-4817-939b-cb05c3ff53df"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[442393, 12890, 214, 5, 56, "Subsubsection",ExpressionUUID->"4be80269-b4e2-42bb-98fc-36976897c6ea",
 CellTags->"Unanimity Coordinates"],
Cell[442610, 12897, 492, 12, 112, "Text",ExpressionUUID->"00268cef-6244-4fab-af89-3e9cac39b931"],
Cell[443105, 12911, 615, 12, 141, "Input",ExpressionUUID->"b2aae96d-a562-4695-932e-8a8a01a57189"],
Cell[443723, 12925, 94, 0, 46, "Text",ExpressionUUID->"6dc0ad26-58dc-47bb-8649-8a0df103455a"],
Cell[443820, 12927, 301, 8, 50, "Input",ExpressionUUID->"07772a75-d0a7-4f7f-9109-013ba0c42d13"],
Cell[444124, 12937, 234, 6, 68, "Text",ExpressionUUID->"7068849d-2704-4891-8c11-3c9a89d1b3d7"],
Cell[CellGroupData[{
Cell[444383, 12947, 137, 2, 50, "Input",ExpressionUUID->"caf2e94f-2e73-4e42-a4bc-ad2a61465604"],
Cell[444523, 12951, 908, 16, 124, "Output",ExpressionUUID->"f51de328-738b-4bb4-8891-268f15cfabc9"]
}, Open  ]],
Cell[445446, 12970, 168, 3, 68, "Text",ExpressionUUID->"4b8f45d3-d328-45d7-8c7e-bf7d1678a110"],
Cell[CellGroupData[{
Cell[445639, 12977, 140, 2, 50, "Input",ExpressionUUID->"16071bea-8e37-413b-9e46-dc9c7be54cfe"],
Cell[445782, 12981, 255, 5, 63, "Output",ExpressionUUID->"6d253b64-7762-48a3-a5ca-50efa412f0c3"]
}, Open  ]],
Cell[446052, 12989, 572, 13, 113, "Text",ExpressionUUID->"13b575d7-c02f-442d-8df3-27d3d64dbd07",
 CellTags->"(1995)"],
Cell[446627, 13004, 679, 22, 46, "Text",ExpressionUUID->"a0d6e87a-5c93-40cf-8f26-fd7555a3658a",
 CellTags->"(1995)"],
Cell[447309, 13028, 243, 6, 68, "Text",ExpressionUUID->"0b263f13-749f-423f-8534-6e6493ee890f",
 CellTags->"(1995)"],
Cell[447555, 13036, 1120, 39, 92, "Text",ExpressionUUID->"1eecdcd3-db10-4f1b-b780-0df234e27da5",
 CellTags->"(1995)"],
Cell[CellGroupData[{
Cell[448700, 13079, 130, 1, 50, "Input",ExpressionUUID->"0cccb94b-e948-4e90-b0bc-066304388c9d"],
Cell[448833, 13082, 215, 5, 63, "Output",ExpressionUUID->"0a27af56-83e6-4b30-82ec-19771c0fea59"]
}, Open  ]],
Cell[449063, 13090, 409, 7, 112, "Text",ExpressionUUID->"887affe5-496c-4344-9949-a48d5dfe4ad3"],
Cell[CellGroupData[{
Cell[449497, 13101, 137, 2, 50, "Input",ExpressionUUID->"3950aef0-b032-42c0-adaf-874f17566ef9"],
Cell[449637, 13105, 86, 0, 63, "Output",ExpressionUUID->"a1b824a0-f136-48cb-8d2e-1ae039c46666"]
}, Open  ]],
Cell[CellGroupData[{
Cell[449760, 13110, 145, 2, 50, "Input",ExpressionUUID->"ccc53f59-861c-40a4-baee-c3d28c26cd8f"],
Cell[449908, 13114, 86, 0, 63, "Output",ExpressionUUID->"ad39de90-5a5f-44ba-8cf1-be4651bf5a31"]
}, Open  ]],
Cell[CellGroupData[{
Cell[450031, 13119, 122, 1, 50, "Input",ExpressionUUID->"e68fd1a7-3379-4506-93f7-108499dc3b7d"],
Cell[450156, 13122, 86, 0, 63, "Output",ExpressionUUID->"6d32e7c8-929c-46a6-9a7c-3348a2dad729"]
}, Open  ]],
Cell[450257, 13125, 551, 12, 135, "Text",ExpressionUUID->"a8fea352-6b9c-417c-a485-f9cc0c4f88fb"],
Cell[CellGroupData[{
Cell[450833, 13141, 140, 2, 50, "Input",ExpressionUUID->"98c63606-5d19-4f6c-9bfb-f7d6f8c7d098"],
Cell[450976, 13145, 151, 3, 63, "Output",ExpressionUUID->"3cfba134-afa9-42cd-a72f-4b71e8fa2d3e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[451164, 13153, 130, 1, 50, "Input",ExpressionUUID->"f2293297-5499-44fe-b288-ab92e4dca2fc"],
Cell[CellGroupData[{
Cell[451319, 13158, 129, 0, 36, "Print",ExpressionUUID->"802297a7-8be1-46d8-80e8-9b3687d1bee0"],
Cell[451451, 13160, 104, 0, 36, "Print",ExpressionUUID->"f64d8b51-ea46-4415-a571-62bfbed12bf0"],
Cell[451558, 13162, 127, 0, 36, "Print",ExpressionUUID->"5e9d9f7f-5799-415f-8094-f483ae8f05a2"]
}, Open  ]],
Cell[451700, 13165, 151, 3, 63, "Output",ExpressionUUID->"3e04604b-4c50-4891-a57e-fd04261638a1"]
}, Open  ]],
Cell[451866, 13171, 89, 0, 46, "Text",ExpressionUUID->"05b2b620-b3d8-49dc-b902-43bdf423685f"],
Cell[CellGroupData[{
Cell[451980, 13175, 140, 2, 50, "Input",ExpressionUUID->"01e83374-6b2d-4a93-b98b-54a98c3b2432"],
Cell[452123, 13179, 273, 8, 82, "Output",ExpressionUUID->"c56b631e-60da-43c7-afcd-64c21938325f"]
}, Open  ]],
Cell[CellGroupData[{
Cell[452433, 13192, 130, 1, 50, "Input",ExpressionUUID->"4145f0ab-cccb-41ba-8fbd-bb7bc981383c"],
Cell[CellGroupData[{
Cell[452588, 13197, 338, 7, 67, "Print",ExpressionUUID->"013a6d02-ff08-4e2d-92c0-a159c15f23a7"],
Cell[452929, 13206, 243, 5, 36, "Print",ExpressionUUID->"7b82766d-d588-4abd-9975-1bc52cee2122"],
Cell[453175, 13213, 257, 7, 36, "Print",ExpressionUUID->"8df199d5-efef-45ae-8a65-eb66d04331e8"],
Cell[453435, 13222, 148, 1, 36, "Print",ExpressionUUID->"0b1abe48-4174-47bd-acf2-c57b941f34ad"],
Cell[453586, 13225, 127, 0, 36, "Print",ExpressionUUID->"ce5df580-946f-41c3-af69-4c085eeb2971"]
}, Open  ]],
Cell[453728, 13228, 273, 8, 82, "Output",ExpressionUUID->"23b028a4-c3e2-43dd-86d3-0d62a0d500b1"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[454062, 13243, 198, 3, 115, "Section",ExpressionUUID->"7c4f7010-cbb2-404b-9d76-135441ef4685",
 CellTags->"5"],
Cell[454263, 13248, 924, 24, 180, "Text",ExpressionUUID->"1d440605-998e-4138-8e16-864d95c29606"],
Cell[455190, 13274, 204, 3, 68, "Text",ExpressionUUID->"4e7e0e34-147e-4fa9-9b92-ba54aa3fe3f2"],
Cell[CellGroupData[{
Cell[455419, 13281, 298, 8, 50, "Input",ExpressionUUID->"66ad7db0-cf42-49c1-813e-d08ba03c7465"],
Cell[455720, 13291, 2245, 57, 274, "Output",ExpressionUUID->"13804de9-1f8c-4a69-9043-ba5b56783dd4"]
}, Open  ]],
Cell[457980, 13351, 340, 9, 92, "Text",ExpressionUUID->"1ff4541a-f940-408a-9d42-8c0206b2e6d4"],
Cell[458323, 13362, 207, 5, 46, "Text",ExpressionUUID->"3b763988-0c5f-4364-bc42-83c70c71e991"],
Cell[CellGroupData[{
Cell[458555, 13371, 251, 6, 50, "Input",ExpressionUUID->"5e78d809-c02c-4a82-8ca5-7b3fb8b92787"],
Cell[458809, 13379, 846, 21, 124, "Output",ExpressionUUID->"3ff53230-0a8f-47f8-b0ab-9c374f4278ba"]
}, Open  ]],
Cell[459670, 13403, 123, 0, 46, "Text",ExpressionUUID->"d06c3151-ba17-48fa-863a-771b92623cbb"],
Cell[CellGroupData[{
Cell[459818, 13407, 254, 6, 50, "Input",ExpressionUUID->"cb16de1e-df94-4fd9-95ed-6c66b866ca47"],
Cell[460075, 13415, 846, 21, 124, "Output",ExpressionUUID->"e1d44ee4-6fac-423e-aa59-250898b0f4f8"]
}, Open  ]],
Cell[460936, 13439, 152, 2, 46, "Text",ExpressionUUID->"a7661445-e457-4a79-8c6f-88af130e7460"],
Cell[CellGroupData[{
Cell[461113, 13445, 157, 3, 50, "Input",ExpressionUUID->"72d42f44-b9d6-4628-810b-f0c3db8e8135"],
Cell[461273, 13450, 221, 5, 63, "Output",ExpressionUUID->"074f33fc-5d50-4804-83cd-b35a65c2a8a3"]
}, Open  ]],
Cell[CellGroupData[{
Cell[461531, 13460, 157, 3, 50, "Input",ExpressionUUID->"4319ed9d-1863-4ac4-b4c7-bbd9b7a69480"],
Cell[461691, 13465, 221, 5, 63, "Output",ExpressionUUID->"f794f3e5-c0b0-48ef-909a-cebebffee01e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[461949, 13475, 157, 3, 50, "Input",ExpressionUUID->"807423d8-afde-4710-8668-cefd8d68fdb0"],
Cell[462109, 13480, 221, 5, 63, "Output",ExpressionUUID->"9f0be8c1-025b-4d30-8b96-e856fd25150c"]
}, Open  ]],
Cell[462345, 13488, 195, 5, 46, "Text",ExpressionUUID->"9c24e320-13e4-421b-9ed1-8e54985b307b"],
Cell[462543, 13495, 167, 3, 46, "Text",ExpressionUUID->"59d96517-4a87-484b-ac55-74c57e346287"],
Cell[CellGroupData[{
Cell[462735, 13502, 125, 1, 50, "Input",ExpressionUUID->"017bb7e5-04b4-4b41-a9d0-58fd2b78327d"],
Cell[462863, 13505, 87, 0, 63, "Output",ExpressionUUID->"42e9d849-e03f-4ee4-adde-30960417aca8"]
}, Open  ]],
Cell[462965, 13508, 203, 5, 46, "Text",ExpressionUUID->"79e13280-42c2-4d4e-ba87-6bcba9094953"],
Cell[CellGroupData[{
Cell[463193, 13517, 152, 3, 50, "Input",ExpressionUUID->"feae0ebc-bdc0-4c3c-96e0-65fb34148216"],
Cell[463348, 13522, 2042, 51, 214, "Output",ExpressionUUID->"0c4cfb42-9b0d-4004-9ecb-0066aaba2595"]
}, Open  ]],
Cell[CellGroupData[{
Cell[465427, 13578, 117, 1, 50, "Input",ExpressionUUID->"65269056-a017-4f6a-af97-238e3facc114"],
Cell[465547, 13581, 84, 0, 63, "Output",ExpressionUUID->"a48e8a6f-11b5-4b4c-a606-ab7dd639e993"]
}, Open  ]],
Cell[465646, 13584, 381, 8, 90, "Text",ExpressionUUID->"a8cc5258-0a99-41ed-851e-f8cb68a1c5ce"],
Cell[CellGroupData[{
Cell[466052, 13596, 146, 3, 50, "Input",ExpressionUUID->"1cc93652-4d9e-4a00-9cdc-3ebb6f04f55e"],
Cell[466201, 13601, 756, 19, 94, "Output",ExpressionUUID->"190ece45-50d0-4336-b5c0-bc801ff033c8"]
}, Open  ]],
Cell[CellGroupData[{
Cell[466994, 13625, 151, 3, 50, "Input",ExpressionUUID->"961174fc-c161-47be-bba4-3da90ea45da3"],
Cell[467148, 13630, 83, 0, 63, "Output",ExpressionUUID->"431ab8fb-93c2-4f74-af68-7beefea7301d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[467268, 13635, 158, 3, 50, "Input",ExpressionUUID->"f6181a5d-e020-4408-944b-026851b07c6b"],
Cell[467429, 13640, 221, 5, 63, "Output",ExpressionUUID->"4975a5a9-5fb6-46b8-bcf7-bd62b02760ae"]
}, Open  ]],
Cell[CellGroupData[{
Cell[467687, 13650, 158, 3, 50, "Input",ExpressionUUID->"b6be38c3-0fd7-4d11-82c3-54c95151cd46"],
Cell[467848, 13655, 221, 5, 63, "Output",ExpressionUUID->"c5043cdd-493d-4128-ab73-e32ac8910a5d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[468106, 13665, 171, 4, 50, "Input",ExpressionUUID->"1caf4da7-876c-438e-9b91-7ed7773b0a32"],
Cell[468280, 13671, 756, 19, 94, "Output",ExpressionUUID->"9c120ad4-278e-4a79-b022-6b93112a44b5"]
}, Open  ]],
Cell[CellGroupData[{
Cell[469073, 13695, 116, 1, 50, "Input",ExpressionUUID->"3b1a1c73-0fa3-4152-8d2c-40322cb39168"],
Cell[469192, 13698, 83, 0, 63, "Output",ExpressionUUID->"a4437fed-e12d-4470-9f97-0dba4888dc69"]
}, Open  ]],
Cell[469290, 13701, 178, 3, 68, "Text",ExpressionUUID->"a059ba8c-815a-4f01-ac50-e2386b3860c2"],
Cell[469471, 13706, 239, 4, 68, "Text",ExpressionUUID->"79abd23e-9e89-4a0a-8ec5-659f8424b86e"],
Cell[CellGroupData[{
Cell[469735, 13714, 160, 3, 50, "Input",ExpressionUUID->"560e21b1-ebfe-4cd1-a503-7393a3888191"],
Cell[469898, 13719, 2342, 75, 332, "Output",ExpressionUUID->"cad3c963-8c4a-46d9-bae7-381203bdbac1"]
}, Open  ]],
Cell[472255, 13797, 533, 12, 91, "Text",ExpressionUUID->"ac47b4bb-95b5-4456-b03d-1669244fceb7"],
Cell[CellGroupData[{
Cell[472813, 13813, 158, 3, 50, "Input",ExpressionUUID->"af339bd0-f556-4a8a-9362-fb7325ff6270"],
Cell[472974, 13818, 277, 6, 94, "Output",ExpressionUUID->"26e25628-97d1-4c9c-8f2b-59aef25dcb51"]
}, Open  ]],
Cell[473266, 13827, 186, 4, 47, "Text",ExpressionUUID->"e5d4acf0-94fb-4933-bd37-8bf7ad447ec4"],
Cell[CellGroupData[{
Cell[473477, 13835, 158, 3, 50, "Input",ExpressionUUID->"cf60bb82-b551-4bfd-8c96-bb32f75f55ad"],
Cell[473638, 13840, 277, 6, 94, "Output",ExpressionUUID->"38f9a4c3-0505-412c-b3a1-80a84fc24bcb"]
}, Open  ]],
Cell[473930, 13849, 343, 9, 69, "Text",ExpressionUUID->"29031229-6068-4b1b-89e7-ddbbaecdec8f"],
Cell[CellGroupData[{
Cell[474298, 13862, 155, 3, 50, "Input",ExpressionUUID->"4a959e01-b900-4427-94a3-b9bb1d392c93"],
Cell[474456, 13867, 2342, 75, 332, "Output",ExpressionUUID->"85cb5cfa-513c-493a-bcc9-27f877a0904d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[476835, 13947, 120, 1, 50, "Input",ExpressionUUID->"9244c957-9aa3-46d3-b309-bee8fa236f1b"],
Cell[476958, 13950, 84, 0, 63, "Output",ExpressionUUID->"80d42e4e-1b8e-4315-8157-28910b20c259"]
}, Open  ]],
Cell[CellGroupData[{
Cell[477079, 13955, 159, 3, 50, "Input",ExpressionUUID->"b1834944-4cf7-42fd-928b-ae38353ef043"],
Cell[477241, 13960, 277, 6, 94, "Output",ExpressionUUID->"2f33856b-b455-4878-919a-6117235b0e52"]
}, Open  ]],
Cell[CellGroupData[{
Cell[477555, 13971, 159, 3, 50, "Input",ExpressionUUID->"917de9f8-7455-44c1-83b7-3b4bf3bab17a"],
Cell[477717, 13976, 277, 6, 94, "Output",ExpressionUUID->"4941f08b-af50-41cb-9014-28c1fbdc342c"]
}, Open  ]],
Cell[478009, 13985, 233, 6, 46, "Text",ExpressionUUID->"512986ee-5dd2-4940-8db8-741f2c1a7e37"],
Cell[478245, 13993, 173, 3, 68, "Text",ExpressionUUID->"30c34844-de90-4301-8bd9-e966736a5f3b"],
Cell[CellGroupData[{
Cell[478443, 14000, 179, 3, 50, "Input",ExpressionUUID->"f0877e40-fc65-47f8-a3ad-6a2dd90a9908"],
Cell[478625, 14005, 430, 11, 63, "Output",ExpressionUUID->"7af00ab5-9bf9-4ae2-982f-a615a0393d99"]
}, Open  ]],
Cell[479070, 14019, 74, 0, 46, "Text",ExpressionUUID->"16a6e1ce-9a58-4998-91d6-7822ce90e055"],
Cell[CellGroupData[{
Cell[479169, 14023, 179, 3, 50, "Input",ExpressionUUID->"e797ed42-7e52-49fc-8668-b288e26b76f1"],
Cell[479351, 14028, 530, 15, 94, "Output",ExpressionUUID->"8481f568-b99e-4624-ae38-e7f0dac9d338"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[479930, 14049, 230, 5, 115, "Section",ExpressionUUID->"90fc73d9-0a6b-4c46-9ccd-f2ece9fefbf5",
 CellTags->"Concluding Remarks and Limitations"],
Cell[480163, 14056, 507, 10, 134, "Text",ExpressionUUID->"ac6efc03-d6ba-4ad2-9d6d-6af47076d150"],
Cell[480673, 14068, 225, 6, 50, "Input",ExpressionUUID->"f2bc446f-05db-4627-bbf2-483e083fb1df"],
Cell[CellGroupData[{
Cell[480923, 14078, 165, 4, 50, "Input",ExpressionUUID->"bef2493b-9f36-417c-a662-749956aefb8e"],
Cell[481091, 14084, 140, 3, 63, "Output",ExpressionUUID->"cb0a1161-af6e-425a-9eee-6b9faa1faef7"]
}, Open  ]],
Cell[481246, 14090, 309, 9, 50, "Input",ExpressionUUID->"7476df27-514f-454a-aba2-400a4b6af94a"],
Cell[481558, 14101, 769, 23, 141, "Input",ExpressionUUID->"a8ffc997-c379-4da0-b0d0-555e10b20212"],
Cell[482330, 14126, 211, 3, 68, "Text",ExpressionUUID->"9e73c6bb-e7f3-4dbc-8762-574839896a6b"],
Cell[CellGroupData[{
Cell[482566, 14133, 126, 1, 50, "Input",ExpressionUUID->"00de94ae-56c5-4ab3-9d3d-4aa93d606b73"],
Cell[482695, 14136, 244, 7, 82, "Output",ExpressionUUID->"5f63fb5c-b965-4b2a-b060-470251a5d377"]
}, Open  ]],
Cell[482954, 14146, 161, 3, 46, "Text",ExpressionUUID->"138b560c-9d28-4080-a4d0-cdd391a3d70c"],
Cell[CellGroupData[{
Cell[483140, 14153, 288, 8, 50, "Input",ExpressionUUID->"6f13db94-6c7e-4199-9841-c452e552f4e6"],
Cell[483431, 14163, 658, 11, 100, "Message",ExpressionUUID->"116b8669-af9d-4e48-b845-0477593e0d88"],
Cell[484092, 14176, 259, 7, 63, "Output",ExpressionUUID->"f95f9243-1f6d-44fe-b493-4a9d821328d6"]
}, Open  ]],
Cell[CellGroupData[{
Cell[484388, 14188, 153, 3, 50, "Input",ExpressionUUID->"d36f7f22-142a-4b60-a1b8-123a232644e7"],
Cell[484544, 14193, 244, 7, 82, "Output",ExpressionUUID->"9576f8d5-2df2-4877-bd23-02d8110f518e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[484825, 14205, 155, 3, 50, "Input",ExpressionUUID->"021e5c91-963c-400c-befd-114e7aacbe95"],
Cell[484983, 14210, 244, 7, 82, "Output",ExpressionUUID->"6b405b5c-275c-4e94-ab8a-654bc28d116c"]
}, Open  ]],
Cell[485242, 14220, 910, 21, 179, "Text",ExpressionUUID->"dc0c293c-bac7-4208-9a53-ffc999eceffb"],
Cell[486155, 14243, 834, 26, 141, "Input",ExpressionUUID->"8d242282-ddb1-4746-84c5-8e1b0a799f7a"],
Cell[486992, 14271, 155, 2, 46, "Text",ExpressionUUID->"b670deff-3c0d-4f52-ada2-9bcc17d80a21"],
Cell[CellGroupData[{
Cell[487172, 14277, 100, 1, 50, "Input",ExpressionUUID->"fbbdff9b-f051-467b-8be5-ce007aedcf09"],
Cell[CellGroupData[{
Cell[487297, 14282, 187, 3, 50, "Print",ExpressionUUID->"b3626335-3eee-4307-8c34-e4d0ca45192c",
 CellTags->"Info2663757087583-2696204"],
Cell[487487, 14287, 3673, 133, 999, "Print",ExpressionUUID->"b529fa91-4587-4752-9a33-0251384bbc7e",
 CellTags->"Info2663757087583-2696204"]
}, Open  ]]
}, Open  ]],
Cell[491187, 14424, 619, 14, 134, "Text",ExpressionUUID->"f335139d-63e2-4b63-bc1f-ac9d711d483a"],
Cell[CellGroupData[{
Cell[491831, 14442, 124, 1, 50, "Input",ExpressionUUID->"1faa42c2-aafa-4c16-8597-9bb7f99a0db5"],
Cell[491958, 14445, 244, 7, 82, "Output",ExpressionUUID->"168cbea2-434f-4d8d-8e34-f2eb81504d10"]
}, Open  ]],
Cell[492217, 14455, 636, 17, 135, "Text",ExpressionUUID->"41dc1814-45fb-4ef0-8ae8-83f24a2ef9a7"],
Cell[CellGroupData[{
Cell[492878, 14476, 153, 3, 50, "Input",ExpressionUUID->"39a9f8b6-fd55-4c0a-88cd-bf63030e2662"],
Cell[493034, 14481, 1367, 21, 164, "Message",ExpressionUUID->"96e20fa9-8867-42f2-8549-4108c5def075"],
Cell[494404, 14504, 209, 6, 82, "Output",ExpressionUUID->"5a88c8d8-e61b-45af-9692-951c63411f6d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[494650, 14515, 155, 3, 50, "Input",ExpressionUUID->"3410761e-b379-4034-9d70-8f4dec10822b"],
Cell[494808, 14520, 1367, 21, 164, "Message",ExpressionUUID->"84a2682b-b9b9-41db-9424-5859da0f8c50"],
Cell[496178, 14543, 1991, 69, 182, "Output",ExpressionUUID->"afa7d8f2-b1a1-4a16-8bab-032779c55fff"]
}, Open  ]],
Cell[498184, 14615, 150, 2, 46, "Text",ExpressionUUID->"2f338c42-8608-4015-897b-93ce53cccd92"],
Cell[CellGroupData[{
Cell[498359, 14621, 100, 1, 50, "Input",ExpressionUUID->"25d361f7-a2e4-4ad1-bf42-202208d3dddb"],
Cell[CellGroupData[{
Cell[498484, 14626, 187, 3, 50, "Print",ExpressionUUID->"e220bc78-9913-4af7-acf9-c540b2549689",
 CellTags->"Info2703757087594-2696204"],
Cell[498674, 14631, 1445, 47, 239, "Print",ExpressionUUID->"2858c6b9-e803-4494-b368-d06dcb051d5c",
 CellTags->"Info2703757087594-2696204"]
}, Open  ]]
}, Open  ]],
Cell[500146, 14682, 320, 5, 90, "Text",ExpressionUUID->"c458dea6-c40e-4e63-b04a-64f4b81c698e"],
Cell[500469, 14689, 588, 13, 134, "Text",ExpressionUUID->"6bf268e1-77d5-4bc1-b898-fa56270c5b96"],
Cell[CellGroupData[{
Cell[501082, 14706, 162, 3, 50, "Input",ExpressionUUID->"5f8cd291-976d-47e7-af73-5e8bedc13106"],
Cell[501247, 14711, 1367, 21, 164, "Message",ExpressionUUID->"ea357c30-2ea1-4301-8dea-ad3fca68d17e"],
Cell[502617, 14734, 2290, 33, 196, "Message",ExpressionUUID->"613341f2-7726-48de-82fc-7f9058b66923"],
Cell[504910, 14769, 428, 8, 68, "Message",ExpressionUUID->"1150c84d-6478-44ec-af4a-922d1afb2a84"],
Cell[505341, 14779, 428, 8, 68, "Message",ExpressionUUID->"e5248fad-cae0-431a-9a02-a4001c537d31"],
Cell[505772, 14789, 428, 8, 68, "Message",ExpressionUUID->"54a03758-ccab-444c-8823-94e185887d4c"],
Cell[506203, 14799, 367, 7, 68, "Message",ExpressionUUID->"2b3d6cc0-e633-4872-85c5-ad194db641b3"],
Cell[506573, 14808, 5330, 128, 2164, "Output",ExpressionUUID->"8a48dd0d-938a-4512-9fc5-86b6a576457b"]
}, Open  ]],
Cell[511918, 14939, 446, 14, 91, "Text",ExpressionUUID->"f6ce9891-18a6-4a0c-a812-38a4a837d208"],
Cell[CellGroupData[{
Cell[512389, 14957, 158, 3, 50, "Input",ExpressionUUID->"5fbd2374-191d-43d4-abb0-a0a62c319a74"],
Cell[512550, 14962, 1367, 21, 164, "Message",ExpressionUUID->"ee165034-6ed5-4eb7-bf0a-aad86e85820e"],
Cell[513920, 14985, 5683, 133, 2194, "Output",ExpressionUUID->"852fb691-3cfd-42cc-a2fd-ab0142d02a3d"]
}, Open  ]],
Cell[519618, 15121, 411, 8, 90, "Text",ExpressionUUID->"9759eaa7-91ca-4627-a9ce-8615aa252518"],
Cell[CellGroupData[{
Cell[520054, 15133, 138, 3, 50, "Input",ExpressionUUID->"35700bfb-f71b-41c0-a9e4-ab51e519f0ca"],
Cell[520195, 15138, 342, 8, 124, "Output",ExpressionUUID->"d87c6e58-8670-4b77-81c1-f3e61b3c7619"]
}, Open  ]],
Cell[CellGroupData[{
Cell[520574, 15151, 138, 3, 50, "Input",ExpressionUUID->"2a2deb01-891a-4b80-84ba-12dade055693"],
Cell[520715, 15156, 1375, 23, 260, "Message",ExpressionUUID->"0d428952-1ec9-47a3-9ce5-6580edd77274"],
Cell[522093, 15181, 5543, 133, 2164, "Output",ExpressionUUID->"f882aeb1-9a2a-4057-bfb6-9d9db5149ea3"]
}, Open  ]],
Cell[527651, 15317, 209, 5, 47, "Text",ExpressionUUID->"2e8582a9-063d-4317-89e9-a894ffb5edee"],
Cell[CellGroupData[{
Cell[527885, 15326, 212, 5, 50, "Input",ExpressionUUID->"bf9d5768-03b8-4129-94ed-d19164f717b4"],
Cell[528100, 15333, 1367, 21, 164, "Message",ExpressionUUID->"546506fe-ab97-4124-a3e5-95e58bd20508"],
Cell[529470, 15356, 1375, 23, 260, "Message",ExpressionUUID->"29ef2fcb-62d2-4229-b1cb-a034bdf00ca7"],
Cell[530848, 15381, 5900, 137, 2194, "Output",ExpressionUUID->"56d8fdb8-6fa6-4058-af95-6baa3ac87357"]
}, Open  ]],
Cell[536763, 15521, 995, 25, 203, "Text",ExpressionUUID->"11dc65f6-ae14-4c30-a524-b037e946a28e"],
Cell[CellGroupData[{
Cell[537783, 15550, 102, 1, 50, "Input",ExpressionUUID->"a187b1bc-11eb-47fa-a0b4-2516965a4c98"],
Cell[537888, 15553, 86, 0, 63, "Output",ExpressionUUID->"d9e7c403-f616-43b4-ae40-89e952c8e633"]
}, Open  ]],
Cell[537989, 15556, 163, 5, 47, "Text",ExpressionUUID->"974fa306-ab65-4256-9b63-b77adfadd806"],
Cell[CellGroupData[{
Cell[538177, 15565, 121, 1, 50, "Input",ExpressionUUID->"e09e2a93-06e6-417e-9da9-f4d26c6150f6"],
Cell[538301, 15568, 105, 0, 63, "Output",ExpressionUUID->"ae4c8ac6-1dfc-46e4-b42c-9cbab3effcc5"]
}, Open  ]],
Cell[538421, 15571, 410, 13, 69, "Text",ExpressionUUID->"e7cda174-487c-41ff-82ed-3b7da3f3a620"],
Cell[538834, 15586, 167, 3, 50, "Input",ExpressionUUID->"7ace3bf2-509c-4b27-8592-cd490d628ecf"],
Cell[539004, 15591, 158, 5, 47, "Text",ExpressionUUID->"749a9e5a-d19f-4fa6-ba10-a6b489e3a8f5"],
Cell[539165, 15598, 189, 4, 50, "Input",ExpressionUUID->"51abbca9-4bfd-4701-a631-e7cff7503c4d"],
Cell[539357, 15604, 161, 3, 46, "Text",ExpressionUUID->"8b60fd03-f743-499f-ac5a-ef3257e7a491"],
Cell[539521, 15609, 200, 5, 50, "Input",ExpressionUUID->"7f393687-41d7-4625-b991-216971978ec1"]
}, Open  ]],
Cell[CellGroupData[{
Cell[539758, 15619, 180, 4, 115, "Section",ExpressionUUID->"2a0c49ab-e29a-450c-81c4-f63024d5bb74",
 CellTags->"References"],
Cell[539941, 15625, 2792, 80, 606, "Text",ExpressionUUID->"158bbfc9-6f26-448d-aee5-d4f089358e3f",
 CellTags->{"M. Carter", "Theo Driessen", "E. Inarra", "M. Maschler", "H. Meinhardt", "C. Rafels", "Hal R. Varian"}]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature oxDPWarg3paKeAgXn3KXjg1e *)
