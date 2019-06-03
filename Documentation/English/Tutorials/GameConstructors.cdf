(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 9.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1063,         20]
NotebookDataLength[    169995,       5174]
NotebookOptionsPosition[    144808,       4294]
NotebookOutlinePosition[    145165,       4310]
CellTagsIndexPosition[    145122,       4307]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Game Constructors : A basic Introduction", "Title",
 CellChangeTimes->{{3.55593387352129*^9, 3.5559338736578617`*^9}, 
   3.555933914923006*^9}],

Cell[CellGroupData[{

Cell["General Remarks", "Section",
 CellChangeTimes->{{3.5559339539131413`*^9, 3.555933966219924*^9}}],

Cell["\<\
In this Notebook we want discuss several game constructors, that is, some \
functions that helps the user to construct games for certain game classes. It \
will be demonstrated how one can derive from a vector of claims, weights, \
profit matrix, etc. the corresponding transferable utility game. In general, \
these functions should construct games of any size, or to be more precise, \
what is possible by Mathematica or your computer hardware. For instance, due \
to the enormous demands for physical memory by Mathematica, we weren' t able \
to derive from the Boehm - Bawerk horse market problem the corresponding \
assignment game, even though this can be done quite easily by hand. Moreover, \
you should keep in mind that the efficient and quick treatment of large/huge \
numerical data sets is not the real strength of Mathematica. In this respect, \
we observed even on HPCs that the elapsed computation time for games having \
14 person or more can lasts hours/days rather than seconds/minutes.\
\>", "Text",
 CellChangeTimes->{{3.556008117646902*^9, 3.556008228511937*^9}, 
   3.556009052949423*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Getting Started", "Section",
 CellChangeTimes->{{3.555933987104163*^9, 3.555933998911886*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"Needs", "[", "\"\<coop`CooperativeGames`\>\"", "]"}], 
  ";"}]], "Input",
 CellChangeTimes->{{3.555934051222211*^9, 3.555934051293868*^9}, 
   3.555934081992056*^9}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Needs", "[", "\"\<TuGames`\>\"", "]"}], ";"}]], "Input",
 CellChangeTimes->{{3.555934051222211*^9, 3.555934051293868*^9}, {
  3.555934081992056*^9, 3.555934103593779*^9}}],

Cell[CellGroupData[{

Cell[BoxData["\<\"===================================================\"\>"], \
"Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.576936266472796*^9}],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\"Loading Package 'TuGames' for \"\>", 
   "\[InvisibleSpace]", "\<\"Unix\"\>"}],
  SequenceForm["Loading Package 'TuGames' for ", "Unix"],
  Editable->False]], "Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.576936271437048*^9}],

Cell[BoxData["\<\"===================================================\"\>"], \
"Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.576936271807248*^9}],

Cell[BoxData["\<\"TuGames V2.2 by Holger I. Meinhardt\"\>"], "Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.5769362722986803`*^9}],

Cell[BoxData["\<\"Release Date: 05.05.2013\"\>"], "Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.576936279567284*^9}],

Cell[BoxData["\<\"Program runs under Mathematica Version 8.0 or later\"\>"], \
"Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.576936279930621*^9}],

Cell[BoxData["\<\"Version 8.x or higher is recommended\"\>"], "Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.576936280422866*^9}],

Cell[BoxData["\<\"===================================================\"\>"], \
"Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.576936289006193*^9}],

Cell[BoxData["\<\"===================================================\"\>"], \
"Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.5769363014636593`*^9}],

Cell[BoxData["\<\"Package 'TuGames' loaded\"\>"], "Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.57693630201329*^9}],

Cell[BoxData["\<\"===================================================\"\>"], \
"Print",
 CellChangeTimes->{3.555944049932025*^9, 3.5559442554578743`*^9, 
  3.556006104500586*^9, 3.556016423141124*^9, 3.576405429867367*^9, 
  3.5769363025583973`*^9}]
}, Open  ]]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"Needs", "[", "\"\<TuGamesAux`\>\"", "]"}], ";"}]], "Input",
 CellChangeTimes->{{3.555934051222211*^9, 3.555934051293868*^9}, {
  3.555934081992056*^9, 3.555934125589796*^9}}],

Cell["\<\
First, we define the player set. In most examples, we rely on a 6 - person \
game. There are two exceptions with 8 players. In this respect, it is \
important to note that whenever the number of players has changed, the player \
set T must be updated.\
\>", "Text",
 CellChangeTimes->{{3.5560082834482517`*^9, 3.5560083424968224`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"T", "=", 
   RowBox[{"Range", "[", "6", "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.555934051222211*^9, 3.555934051293868*^9}, {
  3.555934081992056*^9, 3.555934146692333*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"SeedRandom", "[", "1236", "]"}], ";"}]], "Input",
 CellChangeTimes->{{3.555934051222211*^9, 3.555934051293868*^9}, {
  3.555934081992056*^9, 3.555934146692333*^9}}],

Cell["\<\
Now, we provide a short overview of the commands available under TuGamesAux. \
Click on the function name to learn more about the usage of the function you \
are interested in.\
\>", "Text",
 CellChangeTimes->{{3.5560085181963577`*^9, 3.556008553363097*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"?", "TuGamesAux`*"}]], "Input",
 CellChangeTimes->{{3.555934211921805*^9, 3.555934250537476*^9}, {
  3.555943586755251*^9, 3.55594359264493*^9}}],

Cell[BoxData[
 DynamicModuleBox[{Typeset`open$$ = True}, 
  PaneSelectorBox[{False->
   RowBox[{
    OpenerBox[Dynamic[Typeset`open$$],
     ImageSize->Small], 
    StyleBox["TuGamesAux`", "InfoHeading"]}], True->GridBox[{
     {
      RowBox[{
       OpenerBox[Dynamic[Typeset`open$$],
        ImageSize->Small], 
       StyleBox["TuGamesAux`", "InfoHeading"]}]},
     {GridBox[{
        {
         ButtonBox["AdjointMatrix",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"AdjointMatrix", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["EuclidianDistance",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"EuclidianDistance", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["LPtoMatrix",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"LPtoMatrix", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["SymGameSizeK",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"SymGameSizeK", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"]},
        {
         ButtonBox["Angle",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info3576943570-9084248", {"Angle", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["GenProfitMatrix",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"GenProfitMatrix", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["MarketParameter",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"MarketParameter", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["SymGameType2",
          BaseStyle->"InformationLink",
          ButtonData:>{
           "Info3576943570-9084248", {"SymGameType2", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"]},
        {
         ButtonBox["AssignmentProblem",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"AssignmentProblem", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["GetCardinalityGame",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"GetCardinalityGame", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["ModestBankruptcy",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"ModestBankruptcy", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["SymGameType3",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"SymGameType3", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"]},
        {
         ButtonBox["Coal2Dec",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info3576943570-9084248", {"Coal2Dec", "TuGamesAux`"}},
          
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["GreedyBankruptcy",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"GreedyBankruptcy", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["NearRingQ",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info3576943570-9084248", {"NearRingQ", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["SymGameType4",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"SymGameType4", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"]},
        {
         ButtonBox["ComplementaryMarket",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"ComplementaryMarket", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["IsHermitianMatrixQ",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"IsHermitianMatrixQ", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["SolveDual",
          BaseStyle->"InformationLink",
          ButtonData:>{"Info3576943570-9084248", {"SolveDual", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["TalmudicRule",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"TalmudicRule", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"]},
        {
         ButtonBox["ContestedGarment",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"ContestedGarment", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["LieBracket",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"LieBracket", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], 
         ButtonBox["SolvePrimal",
          BaseStyle->"InformationLink",
          
          ButtonData:>{
           "Info3576943570-9084248", {"SolvePrimal", "TuGamesAux`"}},
          ButtonNote->"TuGamesAux`"], ""}
       },
       DefaultBaseStyle->"InfoGrid",
       GridBoxItemSize->{"Columns" -> {{
            Scaled[0.2375]}}}]}
    },
    GridBoxAlignment->{"Columns" -> {{Left}}, "Rows" -> {{Baseline}}}]}, 
   Dynamic[Typeset`open$$],
   ImageSize->Automatic]]], "Print", "InfoCell",
 CellChangeTimes->{3.5769364058842697`*^9}]
}, Open  ]],

Cell["\<\
After having finished the set up procedure, we shall establish by a set of \
examples how one can derive games from randomly generated vectors; to derive \
games from a default game or from a certain subset of unanimity coordinates. \
Open one of the cooresponding cell to learn more about the construction of a \
game of the specified game class.\
\>", "Text",
 CellChangeTimes->{{3.55600862306418*^9, 3.5560086939821053`*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Weighted Majority", "Section",
 CellChangeTimes->{{3.555934272859879*^9, 3.555934285302112*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"wghs", "=", 
   RowBox[{"RandomInteger", "[", 
    RowBox[{"50", ",", 
     RowBox[{"Length", "[", "T", "]"}]}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934333571659*^9}, {
  3.556005705994361*^9, 3.556005750774077*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"th", "=", 
   RowBox[{"Ceiling", "[", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"2", "/", "3"}], ")"}], "*", 
     RowBox[{"Apply", "[", 
      RowBox[{"Plus", ",", "wghs"}], "]"}]}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.5559343553517647`*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PrependTo", "[", 
  RowBox[{"wghs", ",", "th"}], "]"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934377849517*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "137", ",", "30", ",", "44", ",", "24", ",", "47", ",", "48", ",", "12"}], 
  "}"}]], "Output",
 CellChangeTimes->{3.555942757609511*^9, 3.55594465040521*^9, 
  3.556006154313075*^9, 3.556016674671526*^9, 3.5764062390620527`*^9, 
  3.576936461600483*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"wm", "=", 
  RowBox[{"WeightedMajority", "[", 
   RowBox[{"T", ",", "wghs"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934403247991*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
   ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", 
   "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
   ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", 
   "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", ",", "0", ",", "0", 
   ",", "0", ",", "0", ",", "0", ",", "0", ",", "1", ",", "1", ",", "0", ",", 
   "1", ",", "0", ",", "0", ",", "1", ",", "0", ",", "0", ",", "1", ",", "1", 
   ",", "0", ",", "0", ",", "1", ",", "0", ",", "1", ",", "1", ",", "1", ",", 
   "1", ",", "1", ",", "1", ",", "1"}], "}"}]], "Output",
 CellChangeTimes->{3.555942761853826*^9, 3.555944652873692*^9, 
  3.5560061579580193`*^9, 3.556016678815858*^9, 3.576406250032078*^9, 
  3.576936477267515*^9}]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame01", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "wm"}], "]"}], ";"}], ")"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame01", "]"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, 
   3.555934457119258*^9}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555942770601994*^9, 3.555944655923623*^9, 
  3.556006165079114*^9, 3.5560166855229797`*^9, 3.576406297358148*^9, 
  3.5769365105115433`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame01", "]"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
  3.555934457119258*^9, 3.555934476949868*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555942774970351*^9, 3.5559446586659613`*^9, 
  3.5560061687199183`*^9, 3.556016691701758*^9, 3.5764063078524837`*^9, 
  3.5769365274336357`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame01", "]"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
   3.555934457119258*^9, 3.555934476949868*^9}, 3.555934549640152*^9}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.55594277921459*^9, 3.555944663259308*^9, 
  3.5560061723666983`*^9, 3.556016695240035*^9, 3.576406318947123*^9, 
  3.5769365426783037`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame01", "]"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
  3.555934457119258*^9, 3.555934476949868*^9}, {3.555934549640152*^9, 
  3.55593457530828*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559427834544067`*^9, 3.5559446665714684`*^9, 
  3.556006176011051*^9, 3.5560166987161503`*^9, 3.576406330912129*^9, 
  3.576936557569079*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame01", "]"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
  3.555934457119258*^9, 3.555934476949868*^9}, {3.555934549640152*^9, 
  3.555934597784284*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555942788120213*^9, 3.555944669974215*^9, 
  3.556006179655857*^9, 3.5560167026505823`*^9, 3.576406343719282*^9, 
  3.576936573493041*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame01", "]"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
  3.555934457119258*^9, 3.555934476949868*^9}, {3.555934549640152*^9, 
  3.5559346445173397`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555942792478389*^9, 3.555944673141885*^9, 
  3.5560061833100367`*^9, 3.556016706306682*^9, 3.5764063567380323`*^9, 
  3.576936588888153*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame01", "]"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
  3.555934457119258*^9, 3.555934476949868*^9}, {3.555934549640152*^9, 
  3.5559346445173397`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559427967279587`*^9, 3.555944675804974*^9, 
  3.556006186960289*^9, 3.556016709767976*^9, 3.576406369761203*^9, 
  3.576936604487994*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame01", "]"}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
  3.555934457119258*^9, 3.555934476949868*^9}, {3.555934549640152*^9, 
  3.555934620948675*^9}, {3.555934659870152*^9, 3.5559346748706703`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555942800963575*^9, 3.555944678855763*^9, 
  3.5560061905996227`*^9, 3.556016715930307*^9, 3.576406383820516*^9, 
  3.576936620225975*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv01", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame01", "]"}]}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
  3.555934457119258*^9, 3.555934476949868*^9}, {3.555934549640152*^9, 
  3.555934620948675*^9}, {3.555934659870152*^9, 3.555934700739623*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1", "6"], ",", 
   FractionBox["1", "5"], ",", 
   FractionBox["7", "60"], ",", 
   FractionBox["1", "4"], ",", 
   FractionBox["1", "4"], ",", 
   FractionBox["1", "60"]}], "}"}]], "Output",
 CellChangeTimes->{3.555942805765977*^9, 3.555944682297477*^9, 
  3.556006194235339*^9, 3.55601671922231*^9, 3.576406397531583*^9, 
  3.576936635168709*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc01"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame01", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
  3.555934457119258*^9, 3.555934476949868*^9}, {3.555934549640152*^9, 
  3.555934620948675*^9}, {3.555934659870152*^9, 3.5559347255590057`*^9}}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Solve", "::", "svars"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Equations may not give solutions for all \\\"solve\\\" \
variables. \\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\
\\\", ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/Solve/svars\\\", \
ButtonNote -> \\\"Solve::svars\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555942810201274*^9, 3.555944685842249*^9, 
  3.556006197894334*^9, 3.556016724869253*^9, 3.576406431144807*^9, 
  3.5769366644737587`*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "1.05346300000000003826983174803899601102`6.0432192000884655", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"x", "[", "1", "]"}], ",", 
     RowBox[{"x", "[", "2", "]"}], ",", 
     RowBox[{"x", "[", "3", "]"}], ",", 
     RowBox[{"x", "[", "4", "]"}], ",", 
     RowBox[{"x", "[", "5", "]"}], ",", 
     RowBox[{"1", "-", 
      RowBox[{"x", "[", "1", "]"}], "-", 
      RowBox[{"x", "[", "2", "]"}], "-", 
      RowBox[{"x", "[", "3", "]"}], "-", 
      RowBox[{"x", "[", "4", "]"}], "-", 
      RowBox[{"x", "[", "5", "]"}]}]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555942810443986*^9, 3.55594468608519*^9, 
  3.556006198136887*^9, 3.55601672511826*^9, 3.576406431640359*^9, 
  3.57693666490149*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc01"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame01", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
  3.555934457119258*^9, 3.555934476949868*^9}, {3.555934549640152*^9, 
  3.555934620948675*^9}, {3.555934659870152*^9, 3.5559347509385223`*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.66774100000000002896882733693928457797`5.8452079564699595", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1", "4"], ",", 
     FractionBox["1", "4"], ",", "0", ",", 
     FractionBox["1", "4"], ",", 
     FractionBox["1", "4"], ",", "0"}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555942815088253*^9, 3.55594468946824*^9, 
  3.556006204754492*^9, 3.556016728722262*^9, 3.576406465431101*^9, 
  3.57693669366201*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk01a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame01", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
   3.555934457119258*^9, 3.555934476949868*^9}, {3.555934549640152*^9, 
   3.555934620948675*^9}, {3.555934659870152*^9, 3.5559347509385223`*^9}, 
   3.555934781304831*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.62338300000000002043520908046048134565`5.815354867930647", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1", "4"], ",", 
     FractionBox["1", "4"], ",", "0", ",", 
     FractionBox["1", "4"], ",", 
     FractionBox["1", "4"], ",", "0"}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559428193415203`*^9, 3.555944692479561*^9, 
  3.5560062083974113`*^9, 3.556016732778455*^9, 3.576406499406197*^9, 
  3.5769367186331997`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk01b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame01", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555934311525859*^9, 3.555934426863432*^9}, {
   3.555934457119258*^9, 3.555934476949868*^9}, {3.555934549640152*^9, 
   3.555934620948675*^9}, {3.555934659870152*^9, 3.5559347509385223`*^9}, 
   3.555934781304831*^9, 3.556016214480274*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.18140300000000000868460858782782452181`5.279244378322732", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1", "4"], ",", 
     FractionBox["1", "4"], ",", "0", ",", 
     FractionBox["1", "4"], ",", 
     FractionBox["1", "4"], ",", "0"}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.556016736392866*^9, 3.5764065345225058`*^9, 
  3.576936743026669*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Unanimity Coordinates", "Section",
 CellChangeTimes->{{3.555934944681753*^9, 3.5559349447442636`*^9}, 
   3.555935033988544*^9, {3.5560160757027483`*^9, 3.556016083937985*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"T", "=", 
   RowBox[{"Range", "[", "6", "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"bn2", "=", 
   RowBox[{"Binomial", "[", 
    RowBox[{
     RowBox[{"Length", "[", "T", "]"}], ",", "2"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"avc", "=", 
   RowBox[{"RandomInteger", "[", 
    RowBox[{"20", ",", "bn2"}], "]"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.5560055677564373`*^9, 3.5560055678944893`*^9}, 
   3.5560056074106913`*^9}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"hd", "=", 
   RowBox[{"DetUCoord", "[", 
    RowBox[{"avc", ",", "T"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"gvec", "=", 
   RowBox[{"CharacteristicValues", "[", 
    RowBox[{"hd", ",", "T"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame02", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "gvec"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555935934710569*^9, 3.5559359347717457`*^9}, {
  3.555937151223473*^9, 3.555937194038527*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame02", "]"}]], "Input",
 CellChangeTimes->{{3.555935934710569*^9, 3.5559359347717457`*^9}, {
  3.555937151223473*^9, 3.555937216237081*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555942836162448*^9, 3.555944697283388*^9, 
  3.556006219438387*^9, 3.576406788069833*^9, 3.576936782354588*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame02", "]"}]], "Input",
 CellChangeTimes->{{3.555935934710569*^9, 3.5559359347717457`*^9}, {
  3.555937151223473*^9, 3.555937237538595*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555942841151185*^9, 3.555944700221743*^9, 
  3.5560062230765038`*^9, 3.576406794653048*^9, 3.57693679838624*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame02", "]"}]], "Input",
 CellChangeTimes->{{3.555935934710569*^9, 3.5559359347717457`*^9}, {
  3.555937151223473*^9, 3.555937259646599*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559428454248123`*^9, 3.555944702828068*^9, 
  3.556006226720766*^9, 3.5764068010891857`*^9, 3.576936813520164*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame02", "]"}]], "Input",
 CellChangeTimes->{{3.555935934710569*^9, 3.5559359347717457`*^9}, {
  3.555937151223473*^9, 3.5559372824413137`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559428496632566`*^9, 3.5559447054887733`*^9, 
  3.5560062303607903`*^9, 3.576406807537134*^9, 3.576936829838575*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame02", "]"}]], "Input",
 CellChangeTimes->{{3.555935934710569*^9, 3.5559359347717457`*^9}, {
  3.555937151223473*^9, 3.555937305878827*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.55594285390201*^9, 3.555944708157261*^9, 
  3.556006233998065*^9, 3.576406813988885*^9, 3.576936845318967*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame02", "]"}]], "Input",
 CellChangeTimes->{{3.555935934710569*^9, 3.5559359347717457`*^9}, {
  3.555937151223473*^9, 3.5559373300275183`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559428586488533`*^9, 3.555944710812024*^9, 
  3.556006237644622*^9, 3.5764068204199133`*^9, 3.576936860592696*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame02", "]"}]], "Input",
 CellChangeTimes->{{3.555935934710569*^9, 3.5559359347717457`*^9}, {
  3.555937151223473*^9, 3.555937352429083*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555942863002685*^9, 3.555944713478836*^9, 
  3.55600624148913*^9, 3.576406826873732*^9, 3.576936875865048*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame02", "]"}]], "Input",
 CellChangeTimes->{{3.555935934710569*^9, 3.5559359347717457`*^9}, {
  3.555937151223473*^9, 3.555937352429083*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559428672762213`*^9, 3.55594471623596*^9, 
  3.556006245136024*^9, 3.576406833318883*^9, 3.5769368903606043`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv02", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame02", "]"}]}]], "Input",
 CellChangeTimes->{{3.5559359569941998`*^9, 3.5559359570564117`*^9}, 
   3.555937376521865*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["269", "20"], ",", 
   FractionBox["713", "60"], ",", 
   FractionBox["959", "60"], ",", 
   FractionBox["977", "60"], ",", 
   FractionBox["268", "15"], ",", 
   FractionBox["273", "20"]}], "}"}]], "Output",
 CellChangeTimes->{3.555942871521326*^9, 3.55594471891593*^9, 
  3.5560062491149387`*^9, 3.5764068397640047`*^9, 3.5769369055671463`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc02"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame02", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559359569941998`*^9, 3.5559359570564117`*^9}, {
  3.555937376521865*^9, 3.555937401521976*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.19607199999999999628919056249287677929`5.31301549208906", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["218", "15"], ",", 
     FractionBox["163", "15"], ",", 
     FractionBox["319", "20"], ",", 
     FractionBox["491", "30"], ",", 
     FractionBox["1147", "60"], ",", 
     FractionBox["737", "60"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555942879837617*^9, 3.555944721935978*^9, 
  3.556006252880724*^9, 3.5764068560486393`*^9, 3.576936927707704*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc02"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame02", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559359569941998`*^9, 3.5559359570564117`*^9}, {
  3.555937376521865*^9, 3.555937427046336*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.29034100000000001573496888340741861612`5.4835082815827825", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["218", "15"], ",", 
     FractionBox["163", "15"], ",", 
     FractionBox["319", "20"], ",", 
     FractionBox["491", "30"], ",", 
     FractionBox["1147", "60"], ",", 
     FractionBox["737", "60"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555942884380855*^9, 3.555944725761424*^9, 
  3.556006259355056*^9, 3.576406872332136*^9, 3.57693694905578*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk02a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame02", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559359569941998`*^9, 3.5559359570564117`*^9}, {
  3.555937376521865*^9, 3.555937454176015*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.37822800000000000864019966684281826019`5.598353589547963", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["218", "15"], ",", 
     FractionBox["163", "15"], ",", 
     FractionBox["319", "20"], ",", 
     FractionBox["491", "30"], ",", 
     FractionBox["1147", "60"], ",", 
     FractionBox["737", "60"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559428886367893`*^9, 3.555944729288287*^9, 
  3.556006263218669*^9, 3.576406888762332*^9, 3.576936970712163*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk02b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame02", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559359569941998`*^9, 3.5559359570564117`*^9}, {
  3.555937376521865*^9, 3.555937454176015*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.39166200000000001013589212561782915145`5.613511350564339", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["218", "15"], ",", 
     FractionBox["163", "15"], ",", 
     FractionBox["319", "20"], ",", 
     FractionBox["491", "30"], ",", 
     FractionBox["1147", "60"], ",", 
     FractionBox["737", "60"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559428937088137`*^9, 3.5559447320384912`*^9, 
  3.5560062668634863`*^9, 3.576406905164175*^9, 3.576936992436448*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Modest Bankruptcy", "Section",
 CellChangeTimes->{{3.555935074139166*^9, 3.555935085367193*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"clms", "=", 
   RowBox[{"RandomInteger", "[", 
    RowBox[{"120", ",", "6"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"est", "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"5", "/", "6"}], ")"}], "*", 
    RowBox[{"Apply", "[", 
     RowBox[{"Plus", ",", "clms"}], "]"}]}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555936002811523*^9, 3.555936002873584*^9}, 
   3.555937605440033*^9}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"bv", "=", 
   RowBox[{"ModestBankruptcy", "[", 
    RowBox[{"est", ",", "clms"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame03", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "bv"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555936002811523*^9, 3.555936002873584*^9}, {
  3.555937605440033*^9, 3.55593762711092*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame03", "]"}]], "Input",
 CellChangeTimes->{{3.555936002811523*^9, 3.555936002873584*^9}, {
  3.555937605440033*^9, 3.555937648301543*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559428987238693`*^9, 3.555944735660357*^9, 
  3.556006277186343*^9, 3.576406942576571*^9, 3.576937034481804*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame03", "]"}]], "Input",
 CellChangeTimes->{{3.555936002811523*^9, 3.555936002873584*^9}, {
  3.555937605440033*^9, 3.555937671933085*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555942906415744*^9, 3.555944738355006*^9, 
  3.556006280995554*^9, 3.576406949021723*^9, 3.576937051208007*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame03", "]"}]], "Input",
 CellChangeTimes->{{3.555936002811523*^9, 3.555936002873584*^9}, {
  3.555937605440033*^9, 3.555937694015285*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555942911151102*^9, 3.555944740949696*^9, 
  3.5560062846442413`*^9, 3.576406955467079*^9, 3.576937065694068*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame03", "]"}]], "Input",
 CellChangeTimes->{{3.555936002811523*^9, 3.555936002873584*^9}, {
  3.555937605440033*^9, 3.555937715408606*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.55594291552813*^9, 3.5559447436059093`*^9, 
  3.5560062882935953`*^9, 3.576406961912031*^9, 3.576937082025848*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame03", "]"}]], "Input",
 CellChangeTimes->{{3.555936002811523*^9, 3.555936002873584*^9}, {
  3.555937605440033*^9, 3.555937737514501*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555942919773065*^9, 3.55594474628798*^9, 
  3.556006292198265*^9, 3.576406968346089*^9, 3.576937096149981*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame03", "]"}]], "Input",
 CellChangeTimes->{{3.555936002811523*^9, 3.555936002873584*^9}, {
  3.555937605440033*^9, 3.55593775899753*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555942924019114*^9, 3.5559447495289783`*^9, 
  3.556006295837015*^9, 3.576406974787507*^9, 3.576937112524529*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame03", "]"}]], "Input",
 CellChangeTimes->{{3.555936002811523*^9, 3.555936002873584*^9}, {
  3.555937605440033*^9, 3.555937780973948*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559429287017727`*^9, 3.55594475262381*^9, 
  3.556006299487317*^9, 3.5764069812321453`*^9, 3.576937144815679*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame03", "]"}]], "Input",
 CellChangeTimes->{{3.555936002811523*^9, 3.555936002873584*^9}, {
  3.555937605440033*^9, 3.555937780973948*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555942933114602*^9, 3.55594475527929*^9, 
  3.5560063031212397`*^9, 3.576406987669495*^9, 3.57693716155729*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv03", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame03", "]"}]}]], "Input",
 CellChangeTimes->{{3.5559360285638123`*^9, 3.555936028626008*^9}, 
   3.555937806287558*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1516", "15"], ",", 
   FractionBox["1799", "120"], ",", 
   FractionBox["46", "15"], ",", 
   FractionBox["571", "15"], ",", 
   FractionBox["3869", "120"], ",", 
   FractionBox["721", "15"]}], "}"}]], "Output",
 CellChangeTimes->{3.555942937354224*^9, 3.55594475794495*^9, 
  3.556006306773465*^9, 3.576406994099113*^9, 3.5769371701915817`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc03"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame03", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559360285638123`*^9, 3.555936028626008*^9}, {
  3.555937806287558*^9, 3.5559378321553373`*^9}, {3.556005362325409*^9, 
  3.556005365731612*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.18655700000000000060573768223548540846`5.291411462578949", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1029", "10"], ",", 
     FractionBox["99", "10"], ",", "2", ",", 
     FractionBox["399", "10"], ",", 
     FractionBox["329", "10"], ",", 
     FractionBox["499", "10"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555942945535612*^9, 3.555944761174371*^9, 
  3.556006310431052*^9, 3.576407010359415*^9, 3.5769371834589767`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc03"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame03", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559360285638123`*^9, 3.555936028626008*^9}, {
  3.555937806287558*^9, 3.5559378568222647`*^9}, {3.55600537938205*^9, 
  3.556005382742803*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.56240299999999998625810349039966240525`5.770647541934299", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1029", "10"], ",", 
     FractionBox["99", "10"], ",", "2", ",", 
     FractionBox["399", "10"], ",", 
     FractionBox["329", "10"], ",", 
     FractionBox["499", "10"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555942950151575*^9, 3.5559447649978247`*^9, 
  3.556006317443705*^9, 3.57640702670437*^9, 3.576937196113323*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk03a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame03", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559360285638123`*^9, 3.555936028626008*^9}, {
   3.555937806287558*^9, 3.5559378568222647`*^9}, 3.556007501350586*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.28221400000000002039612922999367583543`5.471178467602041", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1029", "10"], ",", 
     FractionBox["99", "10"], ",", "2", ",", 
     FractionBox["399", "10"], ",", 
     FractionBox["329", "10"], ",", 
     FractionBox["499", "10"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5560075633857393`*^9, 3.55600768846786*^9, 
  3.5764070431225567`*^9, 3.5769372079761267`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk03b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame03", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559360285638123`*^9, 3.555936028626008*^9}, {
   3.555937806287558*^9, 3.5559378568222647`*^9}, 3.556007501350586*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.20380100000000000992628201856859959662`5.329806223928523", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["1029", "10"], ",", 
     FractionBox["99", "10"], ",", "2", ",", 
     FractionBox["399", "10"], ",", 
     FractionBox["329", "10"], ",", 
     FractionBox["499", "10"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555942954756617*^9, 3.555944768611203*^9, 
  3.5560063211717453`*^9, 3.556007574434409*^9, 3.5560077137774277`*^9, 
  3.576407059432507*^9, 3.5769372176744957`*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Greedy Bankruptcy", "Section",
 CellChangeTimes->{{3.555935110332879*^9, 3.5559351230027943`*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"dv", "=", 
   RowBox[{"GreedyBankruptcy", "[", 
    RowBox[{"est", ",", "clms"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame04", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "dv"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.5559360712120457`*^9, 3.5559360712744303`*^9}, 
   3.555937935186934*^9}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame04", "]"}]], "Input",
 CellChangeTimes->{{3.5559360712120457`*^9, 3.5559360712744303`*^9}, {
  3.555937935186934*^9, 3.555937956948526*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559429596895742`*^9, 3.555944772468174*^9, 
  3.5560063292179747`*^9, 3.576407086298473*^9, 3.5769372341696053`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame04", "]"}]], "Input",
 CellChangeTimes->{{3.5559360712120457`*^9, 3.5559360712744303`*^9}, {
  3.555937935186934*^9, 3.555937979320571*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555942964736863*^9, 3.555944775009513*^9, 
  3.556006332954391*^9, 3.576407092744426*^9, 3.576937240518282*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame04", "]"}]], "Input",
 CellChangeTimes->{{3.5559360712120457`*^9, 3.5559360712744303`*^9}, {
  3.555937935186934*^9, 3.5559380008156*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559429690456867`*^9, 3.555944778485767*^9, 
  3.5560063366025143`*^9, 3.576407099184116*^9, 3.576937249642127*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame04", "]"}]], "Input",
 CellChangeTimes->{{3.5559360712120457`*^9, 3.5559360712744303`*^9}, {
  3.555937935186934*^9, 3.555938023421492*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555942973300727*^9, 3.555944781865678*^9, 
  3.5560063407580357`*^9, 3.576407105624256*^9, 3.57693725655905*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame04", "]"}]], "Input",
 CellChangeTimes->{{3.5559360712120457`*^9, 3.5559360712744303`*^9}, {
  3.555937935186934*^9, 3.555938047492215*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555942977548511*^9, 3.5559447846026*^9, 
  3.556006344542144*^9, 3.576407112068076*^9, 3.576937264951633*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame04", "]"}]], "Input",
 CellChangeTimes->{{3.5559360712120457`*^9, 3.5559360712744303`*^9}, {
  3.555937935186934*^9, 3.555938072229041*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555942982286372*^9, 3.555944787683909*^9, 
  3.55600634820415*^9, 3.5764071185124903`*^9, 3.576937272159483*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame04", "]"}]], "Input",
 CellChangeTimes->{{3.5559360712120457`*^9, 3.5559360712744303`*^9}, {
  3.555937935186934*^9, 3.555938093507166*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.55594298665287*^9, 3.555944790532049*^9, 
  3.55600635237805*^9, 3.57640712495957*^9, 3.5769372818718653`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame04", "]"}]], "Input",
 CellChangeTimes->{{3.5559360712120457`*^9, 3.5559360712744303`*^9}, {
  3.555937935186934*^9, 3.555938093507166*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.55594299091402*^9, 3.555944793187743*^9, 
  3.556006356167461*^9, 3.576407131403575*^9, 3.576937290847143*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv04", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame04", "]"}]}]], "Input",
 CellChangeTimes->{{3.555936094805966*^9, 3.555936094868134*^9}, 
   3.555938116172173*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1516", "15"], ",", 
   FractionBox["1799", "120"], ",", 
   FractionBox["46", "15"], ",", 
   FractionBox["571", "15"], ",", 
   FractionBox["3869", "120"], ",", 
   FractionBox["721", "15"]}], "}"}]], "Output",
 CellChangeTimes->{3.555942995162712*^9, 3.55594479585221*^9, 
  3.556006359824745*^9, 3.576407137835904*^9, 3.576937304295856*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc04"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame04", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936094805966*^9, 3.555936094868134*^9}, {
  3.555938116172173*^9, 3.555938163018914*^9}}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Solve", "::", "svars"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Equations may not give solutions for all \\\"solve\\\" \
variables. \\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\
\\\", ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/Solve/svars\\\", \
ButtonNote -> \\\"Solve::svars\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555943003429172*^9, 3.5559447986394672`*^9, 
  3.556006367329097*^9, 3.5764071541215963`*^9, 3.5769373173568983`*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.24840599999999998792610256259649759158`5.415761994862352", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"x", "[", "1", "]"}], ",", 
     RowBox[{"x", "[", "2", "]"}], ",", 
     RowBox[{"x", "[", "3", "]"}], ",", 
     RowBox[{"x", "[", "4", "]"}], ",", 
     RowBox[{"x", "[", "5", "]"}], ",", 
     RowBox[{
      FractionBox["475", "2"], "-", 
      RowBox[{"x", "[", "1", "]"}], "-", 
      RowBox[{"x", "[", "2", "]"}], "-", 
      RowBox[{"x", "[", "3", "]"}], "-", 
      RowBox[{"x", "[", "4", "]"}], "-", 
      RowBox[{"x", "[", "5", "]"}]}]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555943003671591*^9, 3.555944798986546*^9, 
  3.556006367864356*^9, 3.57640715435993*^9, 3.5769373177447243`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc04"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame04", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936094805966*^9, 3.555936094868134*^9}, {
  3.555938116172173*^9, 3.555938163018914*^9}}],

Cell[BoxData["\<\"No solution can be found. Game not essential\"\>"], "Print",
 CellChangeTimes->{3.576407170786282*^9, 3.576937331443774*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.03913099999999999911715065081807551906`4.613120859798567", ",", 
   RowBox[{"{", "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559430083223343`*^9, 3.5559448024008017`*^9, 
  3.556006377851171*^9, 3.576407176488052*^9, 3.576937335712503*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk04a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame04", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936094805966*^9, 3.555936094868134*^9}, {
   3.555938116172173*^9, 3.555938138280923*^9}, 3.555938185849038*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.28138499999999999623412350047146901488`5.469900855735636", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["801", "8"], ",", 
     FractionBox["73", "4"], ",", "4", ",", 
     FractionBox["297", "8"], ",", 
     FractionBox["247", "8"], ",", 
     FractionBox["377", "8"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555943012589548*^9, 3.555944805179563*^9, 
  3.5560063817804117`*^9, 3.57640719851797*^9, 3.576937351268218*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk04b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame04", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936094805966*^9, 3.555936094868134*^9}, {
   3.555938116172173*^9, 3.555938138280923*^9}, 3.555938185849038*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.28111300000000000176569869836384896189`5.469480843190579", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["801", "8"], ",", 
     FractionBox["73", "4"], ",", "4", ",", 
     FractionBox["297", "8"], ",", 
     FractionBox["247", "8"], ",", 
     FractionBox["377", "8"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555943017619911*^9, 3.55594480860671*^9, 
  3.556006385511116*^9, 3.5764072148268623`*^9, 3.576937362200021*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Dual Modest Bankruptcy/Greedy Bankruptcy", "Section",
 CellChangeTimes->{{3.555935147464713*^9, 3.5559351604699173`*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"dv02", "=", 
   RowBox[{"DualGame", "[", "ExpGame03", "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame05", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "dv02"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555936152495954*^9, 3.555936152558362*^9}, 
   3.555938255722364*^9}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame05", "]"}]], "Input",
 CellChangeTimes->{{3.555936152495954*^9, 3.555936152558362*^9}, {
  3.555938255722364*^9, 3.5559382768410797`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559430223592443`*^9, 3.555944812295301*^9, 
  3.556006389559188*^9, 3.57640724170474*^9, 3.57693738091105*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame05", "]"}]], "Input",
 CellChangeTimes->{{3.555936152495954*^9, 3.555936152558362*^9}, {
  3.555938255722364*^9, 3.555938318765325*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555943030054118*^9, 3.555944815545047*^9, 
  3.556006393785123*^9, 3.576407248154282*^9, 3.576937387047385*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame05", "]"}]], "Input",
 CellChangeTimes->{{3.555936152495954*^9, 3.555936152558362*^9}, {
  3.555938255722364*^9, 3.555938318765325*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943034432063*^9, 3.5559448187205963`*^9, 
  3.556006397486802*^9, 3.576407254599481*^9, 3.576937395481326*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame05", "]"}]], "Input",
 CellChangeTimes->{{3.555936152495954*^9, 3.555936152558362*^9}, {
   3.555938255722364*^9, 3.5559382978493958`*^9}, 3.555938340499617*^9}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555943038880148*^9, 3.555944821400218*^9, 
  3.5560064011335087`*^9, 3.576407261033471*^9, 3.576937407242886*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame05", "]"}]], "Input",
 CellChangeTimes->{{3.555936152495954*^9, 3.555936152558362*^9}, {
  3.555938255722364*^9, 3.5559382978493958`*^9}, {3.555938340499617*^9, 
  3.555938364016541*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555943043125059*^9, 3.555944824670735*^9, 
  3.5560064053087387`*^9, 3.576407267477067*^9, 3.576937415119687*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame05", "]"}]], "Input",
 CellChangeTimes->{{3.555936152495954*^9, 3.555936152558362*^9}, {
  3.555938255722364*^9, 3.5559382978493958`*^9}, {3.555938340499617*^9, 
  3.555938387481606*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559430474031563`*^9, 3.555944827359395*^9, 
  3.5560064090630207`*^9, 3.5764072739184*^9, 3.576937422320879*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame05", "]"}]], "Input",
 CellChangeTimes->{{3.555936152495954*^9, 3.555936152558362*^9}, {
  3.555938255722364*^9, 3.5559382978493958`*^9}, {3.555938340499617*^9, 
  3.555938411315754*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559430516582127`*^9, 3.555944830307818*^9, 
  3.556006412713068*^9, 3.5764072803610353`*^9, 3.576937433037319*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame05", "]"}]], "Input",
 CellChangeTimes->{{3.555936152495954*^9, 3.555936152558362*^9}, {
  3.555938255722364*^9, 3.5559382978493958`*^9}, {3.555938340499617*^9, 
  3.555938411315754*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.55594305590377*^9, 3.555944833348384*^9, 
  3.556006417128883*^9, 3.576407286807209*^9, 3.5769374414688797`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv05", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame05", "]"}]}]], "Input",
 CellChangeTimes->{{3.555936183289002*^9, 3.555936183351486*^9}, 
   3.555938434118326*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["1516", "15"], ",", 
   FractionBox["1799", "120"], ",", 
   FractionBox["46", "15"], ",", 
   FractionBox["571", "15"], ",", 
   FractionBox["3869", "120"], ",", 
   FractionBox["721", "15"]}], "}"}]], "Output",
 CellChangeTimes->{3.5559430601650352`*^9, 3.555944836017329*^9, 
  3.556006420883582*^9, 3.576407293254203*^9, 3.576937449301094*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc05"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame05", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936183289002*^9, 3.555936183351486*^9}, {
  3.555938434118326*^9, 3.555938483755808*^9}}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Solve", "::", "svars"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Equations may not give solutions for all \\\"solve\\\" \
variables. \\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\
\\\", ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/Solve/svars\\\", \
ButtonNote -> \\\"Solve::svars\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555943067845636*^9, 3.555944838688472*^9, 
  3.556006424602161*^9, 3.576407309545607*^9, 3.576937456337459*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.26874999999999998889776975374843459576`5.449948386203285", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"x", "[", "1", "]"}], ",", 
     RowBox[{"x", "[", "2", "]"}], ",", 
     RowBox[{"x", "[", "3", "]"}], ",", 
     RowBox[{"x", "[", "4", "]"}], ",", 
     RowBox[{"x", "[", "5", "]"}], ",", 
     RowBox[{
      FractionBox["475", "2"], "-", 
      RowBox[{"x", "[", "1", "]"}], "-", 
      RowBox[{"x", "[", "2", "]"}], "-", 
      RowBox[{"x", "[", "3", "]"}], "-", 
      RowBox[{"x", "[", "4", "]"}], "-", 
      RowBox[{"x", "[", "5", "]"}]}]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555943068087654*^9, 3.55594483893417*^9, 
  3.5560064248453703`*^9, 3.576407309783746*^9, 3.5769374567717133`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc05"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame05", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936183289002*^9, 3.555936183351486*^9}, {
  3.555938434118326*^9, 3.555938483755808*^9}}],

Cell[BoxData["\<\"No solution can be found. Game not essential\"\>"], "Print",
 CellChangeTimes->{3.576407326430851*^9, 3.576937474408065*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.02797099999999999933586458666923135752`4.467307906527037", ",", 
   RowBox[{"{", "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559430727311583`*^9, 3.5559448419144506`*^9, 
  3.556006429606887*^9, 3.5764073321639967`*^9, 3.576937477437645*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk05a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame05", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936183289002*^9, 3.555936183351486*^9}, {
   3.555938434118326*^9, 3.555938458547676*^9}, 3.5559385081637278`*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.30135600000000001275068939321499783546`5.49967975597571", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["801", "8"], ",", 
     FractionBox["73", "4"], ",", "4", ",", 
     FractionBox["297", "8"], ",", 
     FractionBox["247", "8"], ",", 
     FractionBox["377", "8"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555943076999447*^9, 3.555944845351022*^9, 
  3.556006433376362*^9, 3.576407354325919*^9, 3.576937490126502*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk05b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame05", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936183289002*^9, 3.555936183351486*^9}, {
   3.555938434118326*^9, 3.555938458547676*^9}, 3.5559385081637278`*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.32534299999999999331024014281865675002`5.532941380276722", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["801", "8"], ",", 
     FractionBox["73", "4"], ",", "4", ",", 
     FractionBox["297", "8"], ",", 
     FractionBox["247", "8"], ",", 
     FractionBox["377", "8"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559430815329933`*^9, 3.555944848253162*^9, 
  3.556006437030645*^9, 3.5764073706142273`*^9, 3.576937503233424*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"N", "[", "shv04", "]"}], "\n", 
 RowBox[{"N", "[", "shv05", "]"}]}], "Input",
 CellChangeTimes->{{3.555936205229192*^9, 3.555936205290975*^9}, 
   3.555938538875287*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "101.06666666666666`", ",", "14.991666666666667`", ",", 
   "3.066666666666667`", ",", "38.06666666666667`", ",", "32.24166666666667`",
    ",", "48.06666666666667`"}], "}"}]], "Output",
 CellChangeTimes->{3.555943085804305*^9, 3.555944850925744*^9, 
  3.556006441415452*^9, 3.5764073869070997`*^9, 3.576937515230769*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "101.06666666666666`", ",", "14.991666666666667`", ",", 
   "3.066666666666667`", ",", "38.06666666666667`", ",", "32.24166666666667`",
    ",", "48.06666666666667`"}], "}"}]], "Output",
 CellChangeTimes->{3.555943085804305*^9, 3.555944850925744*^9, 
  3.556006441415452*^9, 3.5764073869070997`*^9, 3.576937515597047*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"N", "[", "mnuc04", "]"}], "\n", 
 RowBox[{"N", "[", "mnuc05", "]"}]}], "Input",
 CellChangeTimes->{{3.555936205229192*^9, 3.555936205290975*^9}, 
   3.555938538875287*^9}],

Cell[BoxData[
 RowBox[{"{", "}"}]], "Output",
 CellChangeTimes->{3.555943090402316*^9, 3.555944854090721*^9, 
  3.556006445690126*^9, 3.5764073939605093`*^9, 3.5769375244554167`*^9}],

Cell[BoxData[
 RowBox[{"{", "}"}]], "Output",
 CellChangeTimes->{3.555943090402316*^9, 3.555944854090721*^9, 
  3.556006445690126*^9, 3.5764073939605093`*^9, 3.576937525003978*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Cardinality Game", "Section",
 CellChangeTimes->{{3.555935185358829*^9, 3.555935197866846*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"gc", "=", 
   RowBox[{"GetCardinalityGame", "[", 
    RowBox[{"T", ",", "3"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame06", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "gc"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555936254855083*^9, 3.555936254917241*^9}, 
   3.555938608393652*^9}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame06", "]"}]], "Input",
 CellChangeTimes->{{3.555936254855083*^9, 3.555936254917241*^9}, {
  3.555938608393652*^9, 3.555938629690937*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555943099032506*^9, 3.5559448606634617`*^9, 
  3.556006453702874*^9, 3.576407424314592*^9, 3.5769375428800163`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame06", "]"}]], "Input",
 CellChangeTimes->{{3.555936254855083*^9, 3.555936254917241*^9}, {
  3.555938608393652*^9, 3.555938650824787*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559431032845287`*^9, 3.555944864455379*^9, 
  3.556006457468947*^9, 3.576407430757265*^9, 3.576937550827921*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame06", "]"}]], "Input",
 CellChangeTimes->{{3.555936254855083*^9, 3.555936254917241*^9}, {
  3.555938608393652*^9, 3.5559386724753304`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943107535679*^9, 3.555944867627923*^9, 
  3.556006461118494*^9, 3.576407437201373*^9, 3.576937558879108*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame06", "]"}]], "Input",
 CellChangeTimes->{{3.555936254855083*^9, 3.555936254917241*^9}, {
  3.555938608393652*^9, 3.55593869434929*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943111786316*^9, 3.555944870512714*^9, 
  3.556006465485339*^9, 3.576407443656022*^9, 3.576937567425021*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame06", "]"}]], "Input",
 CellChangeTimes->{{3.555936254855083*^9, 3.555936254917241*^9}, {
  3.555938608393652*^9, 3.5559387172561913`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943116036737*^9, 3.555944874298147*^9, 
  3.5560064692400017`*^9, 3.576407450093857*^9, 3.57693757622572*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame06", "]"}]], "Input",
 CellChangeTimes->{{3.555936254855083*^9, 3.555936254917241*^9}, {
  3.555938608393652*^9, 3.555938741813425*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943120273099*^9, 3.55594487760322*^9, 
  3.556006472886326*^9, 3.5764074565333633`*^9, 3.576937583820848*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame06", "]"}]], "Input",
 CellChangeTimes->{{3.555936254855083*^9, 3.555936254917241*^9}, {
  3.555938608393652*^9, 3.555938766313506*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.55594312451742*^9, 3.555944881305564*^9, 
  3.556006477253847*^9, 3.576407462969817*^9, 3.576937595854372*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame06", "]"}]], "Input",
 CellChangeTimes->{{3.555936254855083*^9, 3.555936254917241*^9}, {
  3.555938608393652*^9, 3.555938766313506*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943128766383*^9, 3.555944884458272*^9, 
  3.556006481001195*^9, 3.576407469397273*^9, 3.576937644760539*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv06", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame06", "]"}]}]], "Input",
 CellChangeTimes->{{3.5559362763958693`*^9, 3.555936276457179*^9}, 
   3.555938790399543*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "1", ",", "1", ",", "1", ",", "1", ",", "1"}], 
  "}"}]], "Output",
 CellChangeTimes->{3.555943133027033*^9, 3.555944888654956*^9, 
  3.556006484660282*^9, 3.576407475841465*^9, 3.5769377787174807`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc06"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame06", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559362763958693`*^9, 3.555936276457179*^9}, {
  3.555938790399543*^9, 3.555938812897121*^9}}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Solve", "::", "svars"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Equations may not give solutions for all \\\"solve\\\" \
variables. \\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\
\\\", ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/Solve/svars\\\", \
ButtonNote -> \\\"Solve::svars\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555943140702407*^9, 3.555944891324518*^9, 
  3.55600648881523*^9, 3.576407492409576*^9, 3.576937881022707*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.87083999999999994745536469054059125483`5.960538282408791", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"x", "[", "1", "]"}], ",", 
     RowBox[{"2", "-", 
      RowBox[{"x", "[", "1", "]"}]}], ",", "1", ",", "1", ",", "1", ",", 
     "1"}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559431410309896`*^9, 3.555944891579115*^9, 
  3.5560064890572853`*^9, 3.576407492649281*^9, 3.576937926095509*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc06"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame06", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559362763958693`*^9, 3.555936276457179*^9}, {
  3.555938790399543*^9, 3.555938837629442*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.6080050000000000176569869836384896189`5.804507064038348", ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "1", ",", "1", ",", "1"}], "}"}]}], 
  "}"}]], "Output",
 CellChangeTimes->{3.555943145609621*^9, 3.555944895147161*^9, 
  3.556006495756885*^9, 3.576407514679227*^9, 3.576938059973287*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk06a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame06", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559362763958693`*^9, 3.555936276457179*^9}, {
  3.555938790399543*^9, 3.555938862217133*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.40906999999999998918198684805247467011`5.63239754405594", ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "1", ",", "1", ",", "1"}], "}"}]}], 
  "}"}]], "Output",
 CellChangeTimes->{3.5559431498808403`*^9, 3.5559448978442707`*^9, 
  3.5560064999315147`*^9, 3.57640753136055*^9, 3.576938223867298*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk06b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame06", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559362763958693`*^9, 3.555936276457179*^9}, {
  3.555938790399543*^9, 3.555938862217133*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.40263900000000002465938564455427695066`5.625515752050037", ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1", ",", "1", ",", "1", ",", "1", ",", "1"}], "}"}]}], 
  "}"}]], "Output",
 CellChangeTimes->{3.55594315414009*^9, 3.5559449010980797`*^9, 
  3.556006503695763*^9, 3.576407547767186*^9, 3.576938310777562*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Symmetric Game Type 2", "Section",
 CellChangeTimes->{{3.555935227061771*^9, 3.555935237831032*^9}, 
   3.556016114723621*^9}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"sym2", "=", 
   RowBox[{"SymGameType2", "[", 
    RowBox[{"T", ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "5", ",", "6"}], "}"}], ",", "7"}], "]"}]}], 
  ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame07", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "sym2"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555936326108437*^9, 3.555936326171665*^9}, 
   3.555938931154324*^9}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame07", "]"}]], "Input",
 CellChangeTimes->{{3.555936326108437*^9, 3.555936326171665*^9}, {
  3.555938931154324*^9, 3.555938954094088*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555943165850028*^9, 3.555944904624145*^9, 
  3.556006511204022*^9, 3.576407574646544*^9, 3.576938391150536*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame07", "]"}]], "Input",
 CellChangeTimes->{{3.555936326108437*^9, 3.555936326171665*^9}, {
  3.555938931154324*^9, 3.555938975563905*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555943170375733*^9, 3.5559449073717937`*^9, 
  3.556006514954503*^9, 3.576407581082292*^9, 3.576938410120803*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame07", "]"}]], "Input",
 CellChangeTimes->{{3.555936326108437*^9, 3.555936326171665*^9}, {
  3.555938931154324*^9, 3.555938998792431*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555943174577927*^9, 3.555944910475233*^9, 
  3.556006518611679*^9, 3.576407587524345*^9, 3.576938433490512*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame07", "]"}]], "Input",
 CellChangeTimes->{{3.555936326108437*^9, 3.555936326171665*^9}, {
  3.555938931154324*^9, 3.555939020988352*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555943178870455*^9, 3.5559449135074263`*^9, 
  3.556006522768231*^9, 3.576407593963806*^9, 3.576938442189107*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame07", "]"}]], "Input",
 CellChangeTimes->{{3.555936326108437*^9, 3.555936326171665*^9}, {
  3.555938931154324*^9, 3.555939042725033*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559431831195307`*^9, 3.555944916692017*^9, 
  3.556006526531137*^9, 3.5764076004040813`*^9, 3.576938451853578*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame07", "]"}]], "Input",
 CellChangeTimes->{{3.555936326108437*^9, 3.555936326171665*^9}, {
  3.555938931154324*^9, 3.5559390643680897`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555943187372553*^9, 3.5559449193917427`*^9, 
  3.5560065301823273`*^9, 3.576407606849353*^9, 3.5769384616624928`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame07", "]"}]], "Input",
 CellChangeTimes->{{3.555936326108437*^9, 3.555936326171665*^9}, {
  3.555938931154324*^9, 3.555939087811178*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555943191608348*^9, 3.555944922189839*^9, 
  3.556006534349918*^9, 3.576407613288557*^9, 3.5769384688476057`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame07", "]"}]], "Input",
 CellChangeTimes->{{3.555936326108437*^9, 3.555936326171665*^9}, {
  3.555938931154324*^9, 3.555939087811178*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559431958521147`*^9, 3.555944925450756*^9, 
  3.5560065381344967`*^9, 3.576407619729171*^9, 3.576938478011804*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv07", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame07", "]"}]}]], "Input",
 CellChangeTimes->{{3.555936358212524*^9, 3.555936358274912*^9}, 
   3.5559391107812653`*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["119", "60"], ",", 
   FractionBox["119", "60"], ",", 
   FractionBox["161", "60"], ",", 
   FractionBox["119", "60"], ",", 
   FractionBox["161", "60"], ",", 
   FractionBox["161", "60"]}], "}"}]], "Output",
 CellChangeTimes->{3.555943200085403*^9, 3.5559449283260937`*^9, 
  3.556006541785359*^9, 3.576407626176015*^9, 3.576938487532194*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc07"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame07", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936358212524*^9, 3.555936358274912*^9}, {
  3.5559391107812653`*^9, 3.555939136770504*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.24171100000000000918021214602049440145`5.403896328398056", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "9"], ",", 
     FractionBox["7", "9"], ",", 
     FractionBox["35", "9"], ",", 
     FractionBox["7", "9"], ",", 
     FractionBox["35", "9"], ",", 
     FractionBox["35", "9"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559432077780743`*^9, 3.555944930996813*^9, 
  3.5560065488538523`*^9, 3.576407642466709*^9, 3.5769384948049803`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc07"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame07", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936358212524*^9, 3.555936358274912*^9}, {
  3.5559391107812653`*^9, 3.555939161595551*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.14723300000000000276045852842798922211`5.188605074583185", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "9"], ",", 
     FractionBox["7", "9"], ",", 
     FractionBox["35", "9"], ",", 
     FractionBox["7", "9"], ",", 
     FractionBox["35", "9"], ",", 
     FractionBox["35", "9"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555943212727219*^9, 3.55594493385855*^9, 
  3.5560065527767963`*^9, 3.576407658765006*^9, 3.576938504478848*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk07a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame07", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936358212524*^9, 3.555936358274912*^9}, {
  3.5559391107812653`*^9, 3.555939188343709*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.33670200000000000128963506540458183736`5.547845609371854", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "9"], ",", 
     FractionBox["7", "9"], ",", 
     FractionBox["35", "9"], ",", 
     FractionBox["7", "9"], ",", 
     FractionBox["35", "9"], ",", 
     FractionBox["35", "9"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559432171109667`*^9, 3.555944937168497*^9, 
  3.556006556935704*^9, 3.576407675075365*^9, 3.576938514449012*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk07b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame07", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936358212524*^9, 3.555936358274912*^9}, {
  3.5559391107812653`*^9, 3.555939188343709*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.16627300000000000412825329476618207991`5.241421645944659", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "9"], ",", 
     FractionBox["7", "9"], ",", 
     FractionBox["35", "9"], ",", 
     FractionBox["7", "9"], ",", 
     FractionBox["35", "9"], ",", 
     FractionBox["35", "9"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555943221381702*^9, 3.5559449401832333`*^9, 
  3.5560065606222982`*^9, 3.576407691358536*^9, 3.576938522274485*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Symmetric Game Type 3", "Section",
 CellChangeTimes->{{3.5559352611712303`*^9, 3.5559352744021883`*^9}, 
   3.556016124452016*^9}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"sym3", "=", 
   RowBox[{"SymGameType3", "[", 
    RowBox[{"T", ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "5", ",", "6"}], "}"}], ",", "7"}], "]"}]}], 
  ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame08", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "sym3"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555936411372759*^9, 3.555936411435247*^9}, 
   3.5559392464074383`*^9}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame08", "]"}]], "Input",
 CellChangeTimes->{{3.555936411372759*^9, 3.555936411435247*^9}, {
  3.5559392464074383`*^9, 3.555939267737482*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943233715846*^9, 3.555944943587421*^9, 
  3.556006568123617*^9, 3.576407718317705*^9, 3.576938532204385*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame08", "]"}]], "Input",
 CellChangeTimes->{{3.555936411372759*^9, 3.555936411435247*^9}, {
  3.5559392464074383`*^9, 3.555939289161132*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559432379691353`*^9, 3.555944946490923*^9, 
  3.556006571907803*^9, 3.576407724765827*^9, 3.5769385423945208`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame08", "]"}]], "Input",
 CellChangeTimes->{{3.555936411372759*^9, 3.555936411435247*^9}, {
  3.5559392464074383`*^9, 3.555939312108296*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559432422175817`*^9, 3.555944949376829*^9, 
  3.556006575547571*^9, 3.576407731213079*^9, 3.576938549951099*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame08", "]"}]], "Input",
 CellChangeTimes->{{3.555936411372759*^9, 3.555936411435247*^9}, {
  3.5559392464074383`*^9, 3.555939337206929*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559432466614428`*^9, 3.5559449525368423`*^9, 
  3.556006579690892*^9, 3.576407737638143*^9, 3.576938558063327*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame08", "]"}]], "Input",
 CellChangeTimes->{{3.555936411372759*^9, 3.555936411435247*^9}, {
  3.5559392464074383`*^9, 3.555939362077387*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.55594325102575*^9, 3.555944956273161*^9, 
  3.5560065834355803`*^9, 3.57640774407697*^9, 3.576938567671585*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame08", "]"}]], "Input",
 CellChangeTimes->{{3.555936411372759*^9, 3.555936411435247*^9}, {
  3.5559392464074383`*^9, 3.555939385026455*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943255271806*^9, 3.55594495935349*^9, 
  3.5560065937508507`*^9, 3.576407798337554*^9, 3.576938577160759*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame08", "]"}]], "Input",
 CellChangeTimes->{{3.555936411372759*^9, 3.555936411435247*^9}, {
  3.5559392464074383`*^9, 3.5559394099119596`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943259545638*^9, 3.555944962777952*^9, 
  3.5560065980521517`*^9, 3.576407804157825*^9, 3.576938584401616*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame08", "]"}]], "Input",
 CellChangeTimes->{{3.555936411372759*^9, 3.555936411435247*^9}, {
  3.5559392464074383`*^9, 3.5559394099119596`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943263797402*^9, 3.555944966681975*^9, 
  3.556006601694016*^9, 3.576407809005879*^9, 3.5769385943587847`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv08", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame08", "]"}]}]], "Input",
 CellChangeTimes->{{3.5559364326972857`*^9, 3.5559364327594337`*^9}, 
   3.555939433068432*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["7", "3"], ",", 
   FractionBox["7", "3"], ",", 
   FractionBox["7", "3"], ",", 
   FractionBox["7", "3"], ",", 
   FractionBox["7", "3"], ",", 
   FractionBox["7", "3"]}], "}"}]], "Output",
 CellChangeTimes->{3.555943268049655*^9, 3.55594497003622*^9, 
  3.556006605704713*^9, 3.576407818302718*^9, 3.576938604730558*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc08"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame08", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559364326972857`*^9, 3.5559364327594337`*^9}, {
  3.555939433068432*^9, 3.5559394557680063`*^9}}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"ConstrainedMin", "::", "lpsub"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"This problem is unbounded. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/ConstrainedMin\\\", ButtonNote -> \
\\\"ConstrainedMin::lpsub\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559432757370253`*^9, 3.555944973846229*^9, 
  3.556006609896903*^9, 3.576407840120393*^9, 3.576938614681601*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "nmtx"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"The first two levels of the one-dimensional list \
\[NoBreak]\\!\\({}\\)\[NoBreak] cannot be transposed. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Transpose/nmtx\\\", ButtonNote -> \
\\\"Transpose::nmtx\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559432757370253`*^9, 3.555944973846229*^9, 
  3.556006609896903*^9, 3.576407840120393*^9, 3.5769386152303667`*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "argt"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"\[NoBreak]\\!\\(Transpose\\)\[NoBreak] called with \
\[NoBreak]\\!\\(0\\)\[NoBreak] arguments; \[NoBreak]\\!\\(1\\)\[NoBreak] or \
\[NoBreak]\\!\\(2\\)\[NoBreak] arguments are expected. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/argt\\\", \
ButtonNote -> \\\"Transpose::argt\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559432757370253`*^9, 3.555944973846229*^9, 
  3.556006609896903*^9, 3.576407840120393*^9, 3.576938616130123*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "nmtx"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"The first two levels of the one-dimensional list \
\[NoBreak]\\!\\({}\\)\[NoBreak] cannot be transposed. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Transpose/nmtx\\\", ButtonNote -> \
\\\"Transpose::nmtx\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559432757370253`*^9, 3.555944973846229*^9, 
  3.556006609896903*^9, 3.576407840120393*^9, 3.576938623753378*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"NullSpace", "::", "matrix"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Argument \[NoBreak]\\!\\({\\(\\(Transpose[]\\)\\), \
\\(\\(Transpose[\\(\\({}\\)\\)]\\)\\)}\\)\[NoBreak] at position \[NoBreak]\\!\
\\(1\\)\[NoBreak] is not a non-empty rectangular matrix. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/matrix\\\", \
ButtonNote -> \\\"NullSpace::matrix\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559432757370253`*^9, 3.555944973846229*^9, 
  3.556006609896903*^9, 3.576407840120393*^9, 3.576938624309412*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4.12582800000000027296209736960008740425`6.636111032164477", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555943277083503*^9, 3.555944975129052*^9, 
  3.556006611175487*^9, 3.5764078712617598`*^9, 3.5769386328551197`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc08"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame08", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559364326972857`*^9, 3.5559364327594337`*^9}, {
  3.555939433068432*^9, 3.55593948043576*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.28715099999999998958699620743573177606`5.478710246324899", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555943285174026*^9, 3.555944978115245*^9, 
  3.55600661521135*^9, 3.576407892055491*^9, 3.576938647868163*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk08a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame08", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559364326972857`*^9, 3.5559364327594337`*^9}, {
  3.555939433068432*^9, 3.555939506303726*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.28464600000000001012168127090262714773`5.474904998528425", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559432894480124`*^9, 3.5559449807830276`*^9, 
  3.5560066192344913`*^9, 3.5764079071974087`*^9, 3.5769386577879477`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk08b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame08", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559364326972857`*^9, 3.5559364327594337`*^9}, {
  3.555939433068432*^9, 3.555939506303726*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.12227799999999999780442294650129042566`5.107948239996522", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"], ",", 
     FractionBox["7", "3"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559432937102337`*^9, 3.5559449842872143`*^9, 
  3.556006623075173*^9, 3.576407922390698*^9, 3.576938666131937*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Symmetric Game Type 4", "Section",
 CellChangeTimes->{{3.555935309315487*^9, 3.5559353241578493`*^9}, 
   3.556016134345908*^9}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"sym4", "=", 
   RowBox[{"SymGameType4", "[", 
    RowBox[{"T", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "3", ",", "4", ",", "5"}], "}"}], ",", "5"}], "]"}]}],
   ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame09", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "sym4"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.5559365441702843`*^9, 3.555936544232634*^9}, 
   3.555939571220591*^9}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame09", "]"}]], "Input",
 CellChangeTimes->{{3.5559365441702843`*^9, 3.555936544232634*^9}, 
   3.555939571220591*^9, 3.555940700654203*^9}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559433054197187`*^9, 3.555944988449924*^9, 
  3.55600663042973*^9, 3.576407948214974*^9, 3.57693867725905*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame09", "]"}]], "Input",
 CellChangeTimes->{{3.5559365441702843`*^9, 3.555936544232634*^9}, 
   3.555939571220591*^9, {3.555940700654203*^9, 3.555940724524523*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943309920257*^9, 3.555944993890114*^9, 
  3.5560066342659073`*^9, 3.5764079533395967`*^9, 3.576938686284944*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame09", "]"}]], "Input",
 CellChangeTimes->{{3.5559365441702843`*^9, 3.555936544232634*^9}, 
   3.555939571220591*^9, {3.555940700654203*^9, 3.555940746818948*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943321175967*^9, 3.555944998130821*^9, 
  3.556006637908584*^9, 3.576407958441937*^9, 3.5769386945573683`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame09", "]"}]], "Input",
 CellChangeTimes->{{3.5559365441702843`*^9, 3.555936544232634*^9}, 
   3.555939571220591*^9, {3.555940700654203*^9, 3.555940769160419*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943325504444*^9, 3.555945000790946*^9, 
  3.5560066420634813`*^9, 3.576407963565977*^9, 3.576938701173098*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame09", "]"}]], "Input",
 CellChangeTimes->{{3.5559365441702843`*^9, 3.555936544232634*^9}, 
   3.555939571220591*^9, {3.555940700654203*^9, 3.555940795101269*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943330261064*^9, 3.555945005286845*^9, 
  3.556006645860358*^9, 3.576407968677541*^9, 3.5769387095584307`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame09", "]"}]], "Input",
 CellChangeTimes->{{3.5559365441702843`*^9, 3.555936544232634*^9}, 
   3.555939571220591*^9, {3.555940700654203*^9, 3.555940820081525*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943336079898*^9, 3.55594500797185*^9, 
  3.556006649510583*^9, 3.576407973810239*^9, 3.576938720368966*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame09", "]"}]], "Input",
 CellChangeTimes->{{3.5559365441702843`*^9, 3.555936544232634*^9}, 
   3.555939571220591*^9, {3.555940700654203*^9, 3.555940843418705*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555943342453148*^9, 3.555945010640843*^9, 
  3.5560066536625433`*^9, 3.5764079789968843`*^9, 3.576938728869812*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame09", "]"}]], "Input",
 CellChangeTimes->{{3.5559365441702843`*^9, 3.555936544232634*^9}, 
   3.555939571220591*^9, {3.555940700654203*^9, 3.555940843418705*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559450133080177`*^9, 3.556006657442189*^9, 
  3.5764079841746273`*^9, 3.5769387364326897`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv09", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame09", "]"}]}]], "Input",
 CellChangeTimes->{{3.555936565965622*^9, 3.555936566028006*^9}, 
   3.555940864933092*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["5", "3"], ",", 
   FractionBox["5", "3"], ",", 
   FractionBox["5", "3"], ",", 
   FractionBox["5", "3"], ",", 
   FractionBox["5", "3"], ",", 
   FractionBox["5", "3"]}], "}"}]], "Output",
 CellChangeTimes->{3.555945015983787*^9, 3.556006661082707*^9, 
  3.576407989314658*^9, 3.5769387453866777`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc09"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame09", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936565965622*^9, 3.555936566028006*^9}, {
  3.555940864933092*^9, 3.5559408903229933`*^9}}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"ConstrainedMin", "::", "lpsub"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"This problem is unbounded. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/ConstrainedMin\\\", ButtonNote -> \
\\\"ConstrainedMin::lpsub\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559450189490623`*^9, 3.5560066681892757`*^9, 
  3.576408005461067*^9, 3.576938755693944*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "nmtx"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"The first two levels of the one-dimensional list \
\[NoBreak]\\!\\({}\\)\[NoBreak] cannot be transposed. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Transpose/nmtx\\\", ButtonNote -> \
\\\"Transpose::nmtx\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559450189490623`*^9, 3.5560066681892757`*^9, 
  3.576408005461067*^9, 3.576938756271578*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "argt"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"\[NoBreak]\\!\\(Transpose\\)\[NoBreak] called with \
\[NoBreak]\\!\\(0\\)\[NoBreak] arguments; \[NoBreak]\\!\\(1\\)\[NoBreak] or \
\[NoBreak]\\!\\(2\\)\[NoBreak] arguments are expected. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/argt\\\", \
ButtonNote -> \\\"Transpose::argt\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559450189490623`*^9, 3.5560066681892757`*^9, 
  3.576408005461067*^9, 3.576938762157134*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "nmtx"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"The first two levels of the one-dimensional list \
\[NoBreak]\\!\\({}\\)\[NoBreak] cannot be transposed. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Transpose/nmtx\\\", ButtonNote -> \
\\\"Transpose::nmtx\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559450189490623`*^9, 3.5560066681892757`*^9, 
  3.576408005461067*^9, 3.576938762398439*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"NullSpace", "::", "matrix"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Argument \[NoBreak]\\!\\({\\(\\(Transpose[]\\)\\), \
\\(\\(Transpose[\\(\\({}\\)\\)]\\)\\)}\\)\[NoBreak] at position \[NoBreak]\\!\
\\(1\\)\[NoBreak] is not a non-empty rectangular matrix. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/matrix\\\", \
ButtonNote -> \\\"NullSpace::matrix\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559450189490623`*^9, 3.5560066681892757`*^9, 
  3.576408005461067*^9, 3.5769387627702293`*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.63805700000000009630696240492397919297`6.23492892325272", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945020233212*^9, 3.556006669542203*^9, 
  3.576408011076655*^9, 3.5769387695020247`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc09"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame09", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936565965622*^9, 3.555936566028006*^9}, {
  3.555940864933092*^9, 3.5559409153640633`*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.26923500000000000209610107049229554832`5.450731429897014", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945023250291*^9, 3.5560066766728487`*^9, 
  3.5764080307681026`*^9, 3.576938786892049*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk09a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame09", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936565965622*^9, 3.555936566028006*^9}, {
  3.555940864933092*^9, 3.555940940666753*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.21745400000000000839683877984498394653`5.3579673140689765", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945025938602*^9, 3.556006680735322*^9, 
  3.576408090907681*^9, 3.5769387945678463`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk09b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame09", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936565965622*^9, 3.555936566028006*^9}, {
  3.555940864933092*^9, 3.555940940666753*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.13823699999999999876720835345622617751`5.161224213518731", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"], ",", 
     FractionBox["5", "3"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945029404212*^9, 3.556006684387995*^9, 
  3.5764081667437468`*^9, 3.576938804668446*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Symmetric Game Type K", "Section",
 CellChangeTimes->{{3.555935352998393*^9, 3.555935367218616*^9}, 
   3.556016143952417*^9}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"symK", "=", 
   RowBox[{"SymGameSizeK", "[", 
    RowBox[{"T", ",", "4", ",", "5"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame10", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "symK"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.5559366184047947`*^9, 3.555936618466969*^9}, 
   3.555941004380753*^9}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame10", "]"}]], "Input",
 CellChangeTimes->{{3.5559366184047947`*^9, 3.555936618466969*^9}, {
  3.555941004380753*^9, 3.555941029292211*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.55594503576718*^9, 3.5560066948015747`*^9, 
  3.5764082211500397`*^9, 3.576409257198782*^9, 3.576938814238533*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame10", "]"}]], "Input",
 CellChangeTimes->{{3.5559366184047947`*^9, 3.555936618466969*^9}, {
  3.555941004380753*^9, 3.555941050332446*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559450384404907`*^9, 3.556006698997447*^9, 
  3.576409282725676*^9, 3.576938820879732*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame10", "]"}]], "Input",
 CellChangeTimes->{{3.5559366184047947`*^9, 3.555936618466969*^9}, {
  3.555941004380753*^9, 3.5559410728934727`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559450411063023`*^9, 3.556006702846108*^9, 
  3.5764093082340393`*^9, 3.576938827411929*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame10", "]"}]], "Input",
 CellChangeTimes->{{3.5559366184047947`*^9, 3.555936618466969*^9}, {
  3.555941004380753*^9, 3.555941095253278*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555945043769932*^9, 3.5560067064912453`*^9, 
  3.576409321369652*^9, 3.5769388339592257`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame10", "]"}]], "Input",
 CellChangeTimes->{{3.5559366184047947`*^9, 3.555936618466969*^9}, {
  3.555941004380753*^9, 3.555941118439796*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559450464317427`*^9, 3.556006710696157*^9, 
  3.576409334520402*^9, 3.576938840493546*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame10", "]"}]], "Input",
 CellChangeTimes->{{3.5559366184047947`*^9, 3.555936618466969*^9}, {
  3.555941004380753*^9, 3.5559411437731133`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559450490908117`*^9, 3.556006714450983*^9, 
  3.57640934715444*^9, 3.5769388489375887`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame10", "]"}]], "Input",
 CellChangeTimes->{{3.5559366184047947`*^9, 3.555936618466969*^9}, {
  3.555941004380753*^9, 3.5559411665368423`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555945051748742*^9, 3.55600671809126*^9, 
  3.576409359845593*^9, 3.576938855489805*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame10", "]"}]], "Input",
 CellChangeTimes->{{3.5559366184047947`*^9, 3.555936618466969*^9}, {
  3.555941004380753*^9, 3.5559411665368423`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555945054407251*^9, 3.5560067222909403`*^9, 
  3.5764093733427763`*^9, 3.576938862022455*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv10", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame10", "]"}]}]], "Input",
 CellChangeTimes->{{3.5559366398841543`*^9, 3.555936639946562*^9}, 
   3.555941189971586*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["5", "2"], ",", 
   FractionBox["5", "2"], ",", 
   FractionBox["5", "2"], ",", 
   FractionBox["5", "2"], ",", 
   FractionBox["5", "2"], ",", 
   FractionBox["5", "2"]}], "}"}]], "Output",
 CellChangeTimes->{3.555945057070345*^9, 3.556006726044684*^9, 
  3.57640938706732*^9, 3.5769388712234173`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc09"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame10", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559366398841543`*^9, 3.555936639946562*^9}, {
  3.555941189971586*^9, 3.555941212619841*^9}}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"ConstrainedMin", "::", "lpsub"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"This problem is unbounded. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/ConstrainedMin\\\", ButtonNote -> \
\\\"ConstrainedMin::lpsub\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555945060015657*^9, 3.5560067330305653`*^9, 
  3.576409420690322*^9, 3.576938882297884*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "nmtx"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"The first two levels of the one-dimensional list \
\[NoBreak]\\!\\({}\\)\[NoBreak] cannot be transposed. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Transpose/nmtx\\\", ButtonNote -> \
\\\"Transpose::nmtx\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555945060015657*^9, 3.5560067330305653`*^9, 
  3.576409420690322*^9, 3.576938882984627*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "argt"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"\[NoBreak]\\!\\(Transpose\\)\[NoBreak] called with \
\[NoBreak]\\!\\(0\\)\[NoBreak] arguments; \[NoBreak]\\!\\(1\\)\[NoBreak] or \
\[NoBreak]\\!\\(2\\)\[NoBreak] arguments are expected. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/argt\\\", \
ButtonNote -> \\\"Transpose::argt\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555945060015657*^9, 3.5560067330305653`*^9, 
  3.576409420690322*^9, 3.576938890012533*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "nmtx"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"The first two levels of the one-dimensional list \
\[NoBreak]\\!\\({}\\)\[NoBreak] cannot be transposed. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Transpose/nmtx\\\", ButtonNote -> \
\\\"Transpose::nmtx\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555945060015657*^9, 3.5560067330305653`*^9, 
  3.576409420690322*^9, 3.5769388905627203`*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"NullSpace", "::", "matrix"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Argument \[NoBreak]\\!\\({\\(\\(Transpose[]\\)\\), \
\\(\\(Transpose[\\(\\({}\\)\\)]\\)\\)}\\)\[NoBreak] at position \[NoBreak]\\!\
\\(1\\)\[NoBreak] is not a non-empty rectangular matrix. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/matrix\\\", \
ButtonNote -> \\\"NullSpace::matrix\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555945060015657*^9, 3.5560067330305653`*^9, 
  3.576409420690322*^9, 3.57693889646115*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.94945900000000005292122295941226184368`6.310514019045742", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559450612998466`*^9, 3.556006734325117*^9, 
  3.5764094436774883`*^9, 3.576938896739346*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc09"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame10", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559366398841543`*^9, 3.555936639946562*^9}, {
  3.555941189971586*^9, 3.555941237988881*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.21449699999999999322497501452744472772`5.352021135709193", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559450642757874`*^9, 3.556006738471554*^9, 
  3.576409457565331*^9, 3.576938905784567*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk09a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame10", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559366398841543`*^9, 3.555936639946562*^9}, {
  3.555941189971586*^9, 3.555941262792295*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.30496200000000001084643486137792933732`5.504845640434721", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945067152216*^9, 3.556006742335034*^9, 
  3.5764094714906054`*^9, 3.576938917176463*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk09b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame10", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559366398841543`*^9, 3.555936639946562*^9}, {
  3.555941189971586*^9, 3.555941262792295*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.15443100000000001270628047222999157384`5.209334396957937", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"], ",", 
     FractionBox["5", "2"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.55594506975609*^9, 3.556006746435689*^9, 
  3.576409484744519*^9, 3.576938925079154*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Assignment Game", "Section",
 CellChangeTimes->{{3.55593539127798*^9, 3.555935404095612*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"bys", "=", 
   RowBox[{"Range", "[", "3", "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"sls", "=", 
   RowBox[{"Range", "[", 
    RowBox[{"4", ",", "6"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"vlb", "=", 
   RowBox[{"RandomInteger", "[", 
    RowBox[{"35", ",", "3"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"vls", "=", 
   RowBox[{"RandomInteger", "[", 
    RowBox[{"18", ",", "3"}], "]"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555936693156654*^9, 3.555936693219606*^9}, {
  3.5559367789719877`*^9, 3.555936947972681*^9}, {3.5560162711471252`*^9, 
  3.5560163083696537`*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"pfm", "=", 
   RowBox[{"GenProfitMatrix", "[", 
    RowBox[{"vlb", ",", "vls"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"asp", "=", 
   RowBox[{"AssignmentProblem", "[", 
    RowBox[{"bys", ",", "sls", ",", "pfm"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame11", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "asp"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555936693156654*^9, 3.555936693219606*^9}, {
  3.5559367789719877`*^9, 3.555936947972681*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame11", "]"}]], "Input",
 CellChangeTimes->{{3.555936693156654*^9, 3.555936693219606*^9}, {
  3.5559367789719877`*^9, 3.55593692660283*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559450777200193`*^9, 3.5560067613079567`*^9, 
  3.576409627166314*^9, 3.5769389471347427`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame11", "]"}]], "Input",
 CellChangeTimes->{{3.555936693156654*^9, 3.555936693219606*^9}, {
  3.5559367789719877`*^9, 3.5559369063889713`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555945080426893*^9, 3.556006765220419*^9, 
  3.57640963179984*^9, 3.576938955848755*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame11", "]"}]], "Input",
 CellChangeTimes->{{3.555936693156654*^9, 3.555936693219606*^9}, {
  3.5559367789719877`*^9, 3.555936885680748*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555945083063287*^9, 3.556006769137156*^9, 
  3.576409636418692*^9, 3.576938964487073*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame11", "]"}]], "Input",
 CellChangeTimes->{{3.555936693156654*^9, 3.555936693219606*^9}, {
  3.5559367789719877`*^9, 3.555936861046135*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559450857437687`*^9, 3.556006772987145*^9, 
  3.576409641041724*^9, 3.576938973396636*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame11", "]"}]], "Input",
 CellChangeTimes->{{3.555936693156654*^9, 3.555936693219606*^9}, {
  3.5559367789719877`*^9, 3.555936839291492*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555945088415449*^9, 3.5560067766394577`*^9, 
  3.576409645657878*^9, 3.576938982800578*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame11", "]"}]], "Input",
 CellChangeTimes->{{3.555936693156654*^9, 3.555936693219606*^9}, {
  3.5559367789719877`*^9, 3.555936818746907*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555945091103567*^9, 3.55600678061794*^9, 
  3.576409650285162*^9, 3.576938990211952*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame11", "]"}]], "Input",
 CellChangeTimes->{{3.555936693156654*^9, 3.555936693219606*^9}, {
  3.5559367789719877`*^9, 3.555936798907722*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555945093787512*^9, 3.556006784732012*^9, 
  3.576409654910593*^9, 3.576939000690196*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame11", "]"}]], "Input",
 CellChangeTimes->{{3.555936693156654*^9, 3.555936693219606*^9}, 
   3.5559367789719877`*^9}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555945096466735*^9, 3.556006788316502*^9, 
  3.576409659537427*^9, 3.57693900993808*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv11", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame11", "]"}]}]], "Input",
 CellChangeTimes->{{3.555936720019137*^9, 3.5559367200813227`*^9}, 
   3.555936976232164*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["181", "20"], ",", 
   FractionBox["91", "20"], ",", 
   FractionBox["11", "10"], ",", 
   FractionBox["34", "5"], ",", 
   FractionBox["53", "10"], ",", 
   FractionBox["6", "5"]}], "}"}]], "Output",
 CellChangeTimes->{3.555945099140458*^9, 3.556006792220787*^9, 
  3.57640966416255*^9, 3.5769390166844893`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc11"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame11", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936720019137*^9, 3.5559367200813227`*^9}, {
  3.555936976232164*^9, 3.55593699853516*^9}}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Solve", "::", "svars"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Equations may not give solutions for all \\\"solve\\\" \
variables. \\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\
\\\", ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/Solve/svars\\\", \
ButtonNote -> \\\"Solve::svars\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.5559451018284388`*^9, 3.556006796066539*^9, 
  3.576409678633306*^9, 3.576939030963232*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2.59142900000000020455104277061764150858`6.434139227813222", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"x", "[", "1", "]"}], ",", 
     RowBox[{
      RowBox[{"-", "6"}], "+", 
      RowBox[{"x", "[", "1", "]"}]}], ",", "0", ",", 
     RowBox[{"18", "-", 
      RowBox[{"x", "[", "1", "]"}]}], ",", 
     RowBox[{"16", "-", 
      RowBox[{"x", "[", "1", "]"}]}], ",", "0"}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945102072464*^9, 3.5560067963107452`*^9, 
  3.576409678871455*^9, 3.576939031501659*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc11"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame11", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936720019137*^9, 3.5559367200813227`*^9}, {
  3.555936976232164*^9, 3.5559370208008213`*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"22.21001000000000047407411329913884401321`7.3671486673681175", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["21", "2"], ",", 
     FractionBox["9", "2"], ",", "0", ",", 
     FractionBox["15", "2"], ",", 
     FractionBox["11", "2"], ",", "0"}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.55594510499804*^9, 3.556006803434815*^9, 
  3.57640970685686*^9, 3.576939067417935*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk11a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame11", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936720019137*^9, 3.5559367200813227`*^9}, {
  3.555936976232164*^9, 3.55593704296909*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.94691599999999997994137856949237175286`5.996911368149299", ",", 
   RowBox[{"{", 
    RowBox[{"9", ",", "3", ",", "0", ",", "9", ",", "7", ",", "0"}], "}"}]}], 
  "}"}]], "Output",
 CellChangeTimes->{3.555945107705154*^9, 3.556006807179104*^9, 
  3.5764097214543943`*^9, 3.576939076132945*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk11b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame11", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555936720019137*^9, 3.5559367200813227`*^9}, {
  3.555936976232164*^9, 3.55593704296909*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.85340300000000002267341869810479693115`5.9517540784974985", ",", 
   RowBox[{"{", 
    RowBox[{"9", ",", "3", ",", "0", ",", "9", ",", "7", ",", "0"}], "}"}]}], 
  "}"}]], "Output",
 CellChangeTimes->{3.555945110911934*^9, 3.556006811164638*^9, 
  3.576409736377206*^9, 3.576939086317833*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Complementary Market", "Section",
 CellChangeTimes->{{3.5559354381096497`*^9, 3.555935452443371*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"Pl", "=", 
   RowBox[{"Range", "[", "3", "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.555935489288941*^9, 3.5559354893512163`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"Ql", "=", 
   RowBox[{"Range", "[", 
    RowBox[{"4", ",", "8"}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.555935508893491*^9, 3.555935508957038*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"T", "=", 
   RowBox[{"Range", "[", "8", "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.555935530270322*^9, 3.5559355303319597`*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"cpm", "=", 
   RowBox[{"ComplementaryMarket", "[", 
    RowBox[{"T", ",", "Pl", ",", "Ql"}], "]"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.555935554258953*^9, 3.555935554321542*^9}}],

Cell[BoxData[
 RowBox[{
  RowBox[{"ExpGame12", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "cpm"}], "]"}], ";"}], ")"}]}], ";"}]], "Input",
 CellChangeTimes->{{3.5559355710532837`*^9, 3.555935571115809*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame12", "]"}]], "Input",
 CellChangeTimes->{{3.555935586601446*^9, 3.555935586663107*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559451160032663`*^9, 3.556006823864459*^9, 
  3.576409789264695*^9, 3.576939098718334*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame12", "]"}]], "Input",
 CellChangeTimes->{{3.555935605745056*^9, 3.555935605807645*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555945118466864*^9, 3.556006828530202*^9, 
  3.576409799572567*^9, 3.576939109849408*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame12", "]"}]], "Input",
 CellChangeTimes->{{3.555935626372464*^9, 3.55593562643436*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555945121067914*^9, 3.556006832229897*^9, 
  3.576409804861854*^9, 3.5769391196938963`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame12", "]"}]], "Input",
 CellChangeTimes->{{3.555935648168298*^9, 3.5559356482314453`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559451240919933`*^9, 3.556006836242538*^9, 
  3.5764098097610083`*^9, 3.576939127927258*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame12", "]"}]], "Input",
 CellChangeTimes->{{3.5559357248338118`*^9, 3.5559357248960257`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559451267038727`*^9, 3.556006840328496*^9, 
  3.576409814516224*^9, 3.576939135535392*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame12", "]"}]], "Input",
 CellChangeTimes->{{3.5559356721547823`*^9, 3.5559356722173843`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559451293686247`*^9, 3.556006844023121*^9, 
  3.5764098191368723`*^9, 3.5769391434163446`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame12", "]"}]], "Input",
 CellChangeTimes->{{3.5559357476889563`*^9, 3.555935770402968*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.5559451320594254`*^9, 3.556006847674305*^9, 
  3.576409823764022*^9, 3.57693915440737*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame12", "]"}]], "Input",
 CellChangeTimes->{{3.5559357476889563`*^9, 3.555935770402968*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555945134775148*^9, 3.556006852091941*^9, 
  3.5764098283876247`*^9, 3.5769391619683237`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"shv12", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame12", "]"}]}], "\n", 
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc12"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame12", "]"}], "]"}]}]}], "Input",
 CellChangeTimes->{{3.555935793443492*^9, 3.555935821125061*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["5", "14"], ",", 
   FractionBox["5", "14"], ",", 
   FractionBox["5", "14"], ",", 
   FractionBox["2", "7"], ",", 
   FractionBox["2", "7"], ",", 
   FractionBox["2", "7"], ",", 
   FractionBox["2", "7"], ",", 
   FractionBox["2", "7"]}], "}"}]], "Output",
 CellChangeTimes->{3.555945137403204*^9, 3.556006855794154*^9, 
  3.576409833018667*^9, 3.576939171107148*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2.76452900000000001412558958691079169512`6.462221063341652", ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "0", ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945137403204*^9, 3.556006855794154*^9, 
  3.576409833018667*^9, 3.576939176113113*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc12"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame12", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555935793443492*^9, 3.5559358435901413`*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.80952000000000001733724275254644453526`5.928827496180431", ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "0", ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"], ",", 
     FractionBox["1", "2"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945142372821*^9, 3.5560068624669027`*^9, 
  3.57640985483724*^9, 3.57693919456721*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk12a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame12", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555935793443492*^9, 3.555935868650548*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.4321969999999999423323515657102689147`6.176602672961316", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945145982785*^9, 3.5560068675294857`*^9, 
  3.576409870176071*^9, 3.5769392055777493`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk12b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame12", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.555935793443492*^9, 3.555935868650548*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "1.83836599999999994459187746542738750577`6.2850318925584885", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"], ",", 
     FractionBox["5", "16"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945148668804*^9, 3.556006871381257*^9, 
  3.576409886227009*^9, 3.5769392172127943`*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Cost Saving Game", "Section",
 CellChangeTimes->{{3.555945353620729*^9, 3.5559453928570843`*^9}}],

Cell[BoxData[{
 RowBox[{
  RowBox[{"nc", "=", 
   RowBox[{"2", "^", 
    RowBox[{"Length", "[", "T", "]"}]}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"cv", "=", 
   RowBox[{"RandomInteger", "[", 
    RowBox[{"140", ",", "nc"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"csv", "=", 
   RowBox[{"CostSaving", "[", 
    RowBox[{"cv", ",", "T"}], "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame13", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "csv"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555945437641498*^9, 3.5559454377043867`*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame13", "]"}]], "Input",
 CellChangeTimes->{{3.5559454540997543`*^9, 3.5559454541620913`*^9}, 
   3.5559455404029093`*^9}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555945808452997*^9, 3.556006879170041*^9, 
  3.576409911437002*^9, 3.576939226617692*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame13", "]"}]], "Input",
 CellChangeTimes->{{3.5559454540997543`*^9, 3.5559454541620913`*^9}, {
  3.5559455404029093`*^9, 3.55594556165901*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555945814360333*^9, 3.556006883386641*^9, 
  3.576409916629959*^9, 3.576939235070318*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame13", "]"}]], "Input",
 CellChangeTimes->{{3.5559454540997543`*^9, 3.5559454541620913`*^9}, {
  3.5559455404029093`*^9, 3.555945583669368*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555945817866026*^9, 3.556006886982481*^9, 
  3.576409921390877*^9, 3.576939244164938*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame13", "]"}]], "Input",
 CellChangeTimes->{{3.5559454540997543`*^9, 3.5559454541620913`*^9}, {
  3.5559455404029093`*^9, 3.5559456061066217`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555945823761042*^9, 3.5560068914902143`*^9, 
  3.576409926298633*^9, 3.576939253839529*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame13", "]"}]], "Input",
 CellChangeTimes->{{3.5559454540997543`*^9, 3.5559454541620913`*^9}, {
  3.5559455404029093`*^9, 3.5559456283523684`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555945827119134*^9, 3.556006895138893*^9, 
  3.576409931037528*^9, 3.576939262122511*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame13", "]"}]], "Input",
 CellChangeTimes->{{3.5559454540997543`*^9, 3.5559454541620913`*^9}, {
  3.5559455404029093`*^9, 3.555945651511078*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559458305299797`*^9, 3.55600689879169*^9, 
  3.576409935653957*^9, 3.576939271787209*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame13", "]"}]], "Input",
 CellChangeTimes->{{3.5559454540997543`*^9, 3.5559454541620913`*^9}, {
  3.5559455404029093`*^9, 3.5559456726247063`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555945833930574*^9, 3.5560069032258463`*^9, 
  3.576409940273141*^9, 3.5769392809049788`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame13", "]"}]], "Input",
 CellChangeTimes->{{3.5559454540997543`*^9, 3.5559454541620913`*^9}, {
  3.5559455404029093`*^9, 3.5559456726247063`*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.5559458397983027`*^9, 3.556006907164007*^9, 
  3.5764099449683523`*^9, 3.5769392876590242`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv13", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame13", "]"}]}]], "Input",
 CellChangeTimes->{{3.5559454668447104`*^9, 3.555945466907011*^9}, 
   3.5559456962744904`*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["21199", "168"], ",", 
   FractionBox["78433", "840"], ",", 
   FractionBox["15997", "168"], ",", 
   FractionBox["51143", "840"], ",", 
   FractionBox["93797", "840"], ",", 
   FractionBox["64943", "840"], ",", 
   FractionBox["25787", "280"], ",", 
   FractionBox["33823", "840"]}], "}"}]], "Output",
 CellChangeTimes->{3.555945843252768*^9, 3.5560069107483997`*^9, 
  3.576409949748075*^9, 3.576939297948504*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc13"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame13", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559454668447104`*^9, 3.555945466907011*^9}, {
  3.5559456962744904`*^9, 3.5559457207218437`*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.75546400000000002439293211864423938096`5.898813687085232", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["2753", "22"], ",", 
     FractionBox["1149", "11"], ",", 
     FractionBox["2339", "22"], ",", 
     FractionBox["925", "22"], ",", 
     FractionBox["1048", "11"], ",", 
     FractionBox["1941", "22"], ",", 
     FractionBox["1979", "22"], ",", 
     FractionBox["1003", "22"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.5559458494996977`*^9, 3.5560069210572233`*^9, 
  3.576409964285759*^9, 3.5769393090593853`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc13"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame13", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559454668447104`*^9, 3.555945466907011*^9}, {
  3.5559456962744904`*^9, 3.555945745094145*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.45913599999999998857447280897758901119`5.682541259603459", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["2753", "22"], ",", 
     FractionBox["1149", "11"], ",", 
     FractionBox["2339", "22"], ",", 
     FractionBox["925", "22"], ",", 
     FractionBox["1048", "11"], ",", 
     FractionBox["1941", "22"], ",", 
     FractionBox["1979", "22"], ",", 
     FractionBox["1003", "22"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945853432968*^9, 3.556006925897344*^9, 
  3.57640997900447*^9, 3.5769393167802277`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk13a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame13", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559454668447104`*^9, 3.555945466907011*^9}, {
  3.5559456962744904`*^9, 3.555945769309765*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "4.30102100000000042712144932011142373085`6.6541714763084565", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["499", "4"], ",", 
     FractionBox["1679", "16"], ",", 
     FractionBox["849", "8"], ",", 
     FractionBox["665", "16"], ",", 
     FractionBox["1529", "16"], ",", 
     FractionBox["1407", "16"], ",", 
     FractionBox["1447", "16"], ",", 
     FractionBox["731", "16"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945860323751*^9, 3.556006933188203*^9, 
  3.576409995897293*^9, 3.5769393294152193`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk13b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame13", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559454668447104`*^9, 3.555945466907011*^9}, {
  3.5559456962744904`*^9, 3.555945769309765*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2.69679000000000002046363078989088535309`6.451447042382842", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["499", "4"], ",", 
     FractionBox["1679", "16"], ",", 
     FractionBox["849", "8"], ",", 
     FractionBox["665", "16"], ",", 
     FractionBox["1529", "16"], ",", 
     FractionBox["1407", "16"], ",", 
     FractionBox["1447", "16"], ",", 
     FractionBox["731", "16"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555945864212748*^9, 3.5560069395491447`*^9, 
  3.57641001239148*^9, 3.576939342190189*^9}]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Determine (Average) - Convex Game", "Section",
 CellChangeTimes->{{3.5559455050151157`*^9, 3.555945518093081*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame12", "]"}]], "Input",
 CellChangeTimes->{{3.555946293658721*^9, 3.555946316909493*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555946352183448*^9, 3.5560069435538807`*^9, 
  3.576410027021755*^9, 3.576939350216254*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame12", "]"}]], "Input",
 CellChangeTimes->{{3.555946293658721*^9, 3.555946316909493*^9}}],

Cell[BoxData["False"], "Output",
 CellChangeTimes->{3.555946359348822*^9, 3.556006948170022*^9, 
  3.576410032230377*^9, 3.576939361266836*^9}]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"davc", "=", 
   RowBox[{"DetQuasiAvConvex", "[", "ExpGame12", "]"}]}], ";"}], "\n", 
 RowBox[{
  RowBox[{"ExpGame14", ":=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"DefineGame", "[", 
      RowBox[{"T", ",", "davc"}], "]"}], ";"}], ")"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.555945961351986*^9, 3.555945961414213*^9}}],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ConvexQ", "[", "ExpGame14", "]"}]], "Input",
 CellChangeTimes->{{3.555945974636155*^9, 3.5559459746983633`*^9}, 
   3.555946015715361*^9}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555946369644713*^9, 3.55600696059059*^9, 
  3.5764100496375313`*^9, 3.576939375232315*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"AvConvexQ", "[", "ExpGame14", "]"}]], "Input",
 CellChangeTimes->{{3.555945974636155*^9, 3.5559459746983633`*^9}, {
  3.555946015715361*^9, 3.5559460361755342`*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555946375943252*^9, 3.556006967963209*^9, 
  3.576410054876276*^9, 3.576939383529633*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GameMonotoneQ", "[", "ExpGame14", "]"}]], "Input",
 CellChangeTimes->{{3.555945974636155*^9, 3.5559459746983633`*^9}, {
  3.555946015715361*^9, 3.555946056620426*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555946379510524*^9, 3.556006972714579*^9, 
  3.576410059624579*^9, 3.576939393969989*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SuperAdditiveQ", "[", "ExpGame14", "]"}]], "Input",
 CellChangeTimes->{{3.555945974636155*^9, 3.5559459746983633`*^9}, {
  3.555946015715361*^9, 3.555946077275424*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555946386406126*^9, 3.556006977375127*^9, 
  3.576410064539226*^9, 3.576939404171081*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"WeaklySuperAdditiveQ", "[", "ExpGame14", "]"}]], "Input",
 CellChangeTimes->{{3.555945974636155*^9, 3.5559459746983633`*^9}, {
  3.555946015715361*^9, 3.555946100478243*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.55594638996646*^9, 3.556006982127431*^9, 
  3.5764100692889547`*^9, 3.576939411411519*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ZeroMonotoneQ", "[", "ExpGame14", "]"}]], "Input",
 CellChangeTimes->{{3.555945974636155*^9, 3.5559459746983633`*^9}, {
  3.555946015715361*^9, 3.555946124296341*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555946393461385*^9, 3.556006987059535*^9, 
  3.576410073923218*^9, 3.576939420888357*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"PreKernelEqualsKernelQ", "[", "ExpGame14", "]"}]], "Input",
 CellChangeTimes->{{3.555945974636155*^9, 3.5559459746983633`*^9}, {
  3.555946015715361*^9, 3.555946146219737*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555946397064452*^9, 3.556006993431612*^9, 
  3.576410078548365*^9, 3.576939431865343*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"CoreQ", "[", "ExpGame14", "]"}]], "Input",
 CellChangeTimes->{{3.555945974636155*^9, 3.5559459746983633`*^9}, {
  3.555946015715361*^9, 3.555946146219737*^9}}],

Cell[BoxData["True"], "Output",
 CellChangeTimes->{3.555946403507092*^9, 3.55600699801532*^9, 
  3.576410083181422*^9, 3.576939439047677*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"shv14", "=", 
  RowBox[{"ShapleyValue", "[", "ExpGame14", "]"}]}]], "Input",
 CellChangeTimes->{{3.5559459886437283`*^9, 3.5559459887063007`*^9}, 
   3.555946168423126*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   FractionBox["5923", "1680"], ",", 
   FractionBox["5923", "1680"], ",", 
   FractionBox["5923", "1680"], ",", 
   FractionBox["739", "240"], ",", 
   FractionBox["739", "240"], ",", 
   FractionBox["739", "240"], ",", 
   FractionBox["739", "240"], ",", 
   FractionBox["739", "240"]}], "}"}]], "Output",
 CellChangeTimes->{3.555946445959427*^9, 3.556007002888077*^9, 
  3.57641008780569*^9, 3.5769394477791567`*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time0", ",", "nuc14"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"Nucleolus", "[", "ExpGame14", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559459886437283`*^9, 3.5559459887063007`*^9}, {
  3.555946168423126*^9, 3.5559461908885*^9}}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"ConstrainedMin", "::", "lpsub"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"This problem is unbounded. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/ConstrainedMin\\\", ButtonNote -> \
\\\"ConstrainedMin::lpsub\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555946459276194*^9, 3.556007016717613*^9, 
  3.576410119952636*^9, 3.5769394818980417`*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "nmtx"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"The first two levels of the one-dimensional list \
\[NoBreak]\\!\\({}\\)\[NoBreak] cannot be transposed. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Transpose/nmtx\\\", ButtonNote -> \
\\\"Transpose::nmtx\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555946459276194*^9, 3.556007016717613*^9, 
  3.576410119952636*^9, 3.576939482695669*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "argt"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"\[NoBreak]\\!\\(Transpose\\)\[NoBreak] called with \
\[NoBreak]\\!\\(0\\)\[NoBreak] arguments; \[NoBreak]\\!\\(1\\)\[NoBreak] or \
\[NoBreak]\\!\\(2\\)\[NoBreak] arguments are expected. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/argt\\\", \
ButtonNote -> \\\"Transpose::argt\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555946459276194*^9, 3.556007016717613*^9, 
  3.576410119952636*^9, 3.5769394917201366`*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Transpose", "::", "nmtx"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"The first two levels of the one-dimensional list \
\[NoBreak]\\!\\({}\\)\[NoBreak] cannot be transposed. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Transpose/nmtx\\\", ButtonNote -> \
\\\"Transpose::nmtx\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555946459276194*^9, 3.556007016717613*^9, 
  3.576410119952636*^9, 3.57693949216914*^9}],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"NullSpace", "::", "matrix"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Argument \[NoBreak]\\!\\({\\(\\(Transpose[]\\)\\), \
\\(\\(Transpose[\\(\\({}\\)\\)]\\)\\)}\\)\[NoBreak] at position \[NoBreak]\\!\
\\(1\\)\[NoBreak] is not a non-empty rectangular matrix. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/matrix\\\", \
ButtonNote -> \\\"NullSpace::matrix\\\"]\\)\"\>"}]], "Message", "MSG",
 CellChangeTimes->{3.555946459276194*^9, 3.556007016717613*^9, 
  3.576410119952636*^9, 3.576939498253277*^9}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "23.33719100000000068462213675957173109055`7.388648493925743", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.55594648271216*^9, 3.5560070393750267`*^9, 
  3.576410128982367*^9, 3.576939498673208*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time1", ",", "mnuc14"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"ModifiedNucleolus", "[", "ExpGame14", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559459886437283`*^9, 3.5559459887063007`*^9}, {
  3.555946168423126*^9, 3.555946239094598*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.4397960000000000202469152554840547964`5.663851188359358", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555946528315567*^9, 3.556007046294042*^9, 
  3.576410147815341*^9, 3.576939513008786*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time2", ",", "prk14a"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelSolution", "[", "ExpGame14", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559459886437283`*^9, 3.5559459887063007`*^9}, {
  3.555946168423126*^9, 3.555946239094598*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.19729299999999994064125985460123047233`6.09880035667844", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555946533858498*^9, 3.55600705072476*^9, 
  3.5764101631736794`*^9, 3.576939523669372*^9}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{"time3", ",", "prk14b"}], "}"}], "=", 
  RowBox[{"AbsoluteTiming", "[", 
   RowBox[{"PreKernelElement", "[", "ExpGame14", "]"}], "]"}]}]], "Input",
 CellChangeTimes->{{3.5559459886437283`*^9, 3.5559459887063007`*^9}, {
  3.555946168423126*^9, 3.555946215531884*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.45345900000000000096278540695493575186`5.677137939232052", ",", 
   RowBox[{"{", 
    RowBox[{
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"], ",", 
     FractionBox["21817", "6720"]}], "}"}]}], "}"}]], "Output",
 CellChangeTimes->{3.555946537222382*^9, 3.5560070554133463`*^9, 
  3.576410177999526*^9, 3.5769395311143093`*^9}]
}, Open  ]]
}, Closed]]
}, Open  ]]
},
WindowSize->{838, 695},
WindowMargins->{{Automatic, 44}, {Automatic, 0}},
ShowSelection->True,
FrontEndVersion->"9.0 for Linux x86 (64-bit) (November 20, 2012)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1485, 35, 150, 2, 146, "Title"],
Cell[CellGroupData[{
Cell[1660, 41, 102, 1, 80, "Section"],
Cell[1765, 44, 1121, 16, 231, "Text"]
}, Open  ]],
Cell[CellGroupData[{
Cell[2923, 65, 100, 1, 80, "Section"],
Cell[3026, 68, 200, 5, 32, "Input"],
Cell[CellGroupData[{
Cell[3251, 77, 206, 4, 32, "Input"],
Cell[CellGroupData[{
Cell[3482, 85, 247, 4, 23, "Print"],
Cell[3732, 91, 376, 8, 23, "Print"],
Cell[4111, 101, 247, 4, 23, "Print"],
Cell[4361, 107, 231, 3, 23, "Print"],
Cell[4595, 112, 218, 3, 23, "Print"],
Cell[4816, 117, 247, 4, 23, "Print"],
Cell[5066, 123, 230, 3, 23, "Print"],
Cell[5299, 128, 247, 4, 23, "Print"],
Cell[5549, 134, 249, 4, 23, "Print"],
Cell[5801, 140, 217, 3, 23, "Print"],
Cell[6021, 145, 249, 4, 23, "Print"]
}, Open  ]]
}, Open  ]],
Cell[6297, 153, 209, 4, 32, "Input"],
Cell[6509, 159, 345, 6, 71, "Text"],
Cell[6857, 167, 215, 5, 32, "Input"],
Cell[7075, 174, 199, 4, 32, "Input"],
Cell[7277, 180, 268, 5, 51, "Text"],
Cell[CellGroupData[{
Cell[7570, 189, 169, 3, 32, "Input"],
Cell[7742, 194, 5785, 157, 177, "Print"]
}, Open  ]],
Cell[13542, 354, 438, 7, 91, "Text"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14017, 366, 102, 1, 80, "Section"],
Cell[14122, 369, 288, 7, 32, "Input"],
Cell[14413, 378, 317, 9, 32, "Input"],
Cell[CellGroupData[{
Cell[14755, 391, 155, 3, 32, "Input"],
Cell[14913, 396, 296, 7, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15246, 408, 186, 4, 32, "Input"],
Cell[15435, 414, 888, 14, 70, "Output"]
}, Open  ]],
Cell[16338, 431, 254, 7, 32, "Input"],
Cell[CellGroupData[{
Cell[16617, 442, 160, 3, 32, "Input"],
Cell[16780, 447, 194, 3, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17011, 455, 185, 3, 32, "Input"],
Cell[17199, 460, 198, 3, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17434, 468, 212, 3, 32, "Input"],
Cell[17649, 473, 192, 3, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17878, 481, 238, 4, 32, "Input"],
Cell[18119, 487, 195, 3, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18351, 495, 245, 4, 32, "Input"],
Cell[18599, 501, 191, 3, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18827, 509, 240, 4, 32, "Input"],
Cell[19070, 515, 193, 3, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19300, 523, 249, 4, 32, "Input"],
Cell[19552, 529, 191, 3, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19780, 537, 278, 4, 32, "Input"],
Cell[20061, 543, 192, 3, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20290, 551, 310, 5, 32, "Input"],
Cell[20603, 558, 404, 11, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21044, 574, 402, 8, 32, "Input"],
Cell[21449, 584, 560, 11, 70, "Message"],
Cell[22012, 597, 759, 19, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22808, 621, 411, 8, 32, "Input"],
Cell[23222, 631, 475, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23734, 648, 439, 9, 32, "Input"],
Cell[24176, 659, 479, 11, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24692, 675, 460, 9, 32, "Input"],
Cell[25155, 686, 406, 10, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[25610, 702, 182, 2, 50, "Section"],
Cell[25795, 706, 472, 14, 77, "Input"],
Cell[26270, 722, 553, 16, 77, "Input"],
Cell[CellGroupData[{
Cell[26848, 742, 185, 3, 32, "Input"],
Cell[27036, 747, 165, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27238, 754, 187, 3, 32, "Input"],
Cell[27428, 759, 166, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27631, 766, 191, 3, 32, "Input"],
Cell[27825, 771, 168, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28030, 778, 194, 3, 32, "Input"],
Cell[28227, 783, 170, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28434, 790, 198, 3, 32, "Input"],
Cell[28635, 795, 163, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28835, 802, 193, 3, 32, "Input"],
Cell[29031, 807, 168, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29236, 814, 200, 3, 32, "Input"],
Cell[29439, 819, 163, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29639, 826, 183, 3, 32, "Input"],
Cell[29825, 831, 167, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30029, 838, 196, 4, 32, "Input"],
Cell[30228, 844, 401, 10, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30666, 859, 309, 7, 32, "Input"],
Cell[30978, 868, 516, 12, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31531, 885, 318, 7, 32, "Input"],
Cell[31852, 894, 518, 13, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[32407, 912, 318, 7, 32, "Input"],
Cell[32728, 921, 517, 12, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33282, 938, 317, 7, 32, "Input"],
Cell[33602, 947, 521, 12, 47, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[34172, 965, 102, 1, 50, "Section"],
Cell[34277, 968, 426, 13, 50, "Input"],
Cell[34706, 983, 430, 12, 50, "Input"],
Cell[CellGroupData[{
Cell[35161, 999, 183, 3, 30, "Input"],
Cell[35347, 1004, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35550, 1011, 185, 3, 30, "Input"],
Cell[35738, 1016, 164, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35939, 1023, 189, 3, 30, "Input"],
Cell[36131, 1028, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[36334, 1035, 190, 3, 30, "Input"],
Cell[36527, 1040, 167, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[36731, 1047, 196, 3, 30, "Input"],
Cell[36930, 1052, 163, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[37130, 1059, 188, 3, 30, "Input"],
Cell[37321, 1064, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[37524, 1071, 198, 3, 30, "Input"],
Cell[37725, 1076, 167, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[37929, 1083, 181, 3, 30, "Input"],
Cell[38113, 1088, 164, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[38314, 1095, 194, 4, 30, "Input"],
Cell[38511, 1101, 401, 10, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[38949, 1116, 358, 8, 30, "Input"],
Cell[39310, 1126, 489, 11, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[39836, 1142, 366, 8, 30, "Input"],
Cell[40205, 1152, 488, 11, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[40730, 1168, 341, 7, 30, "Input"],
Cell[41074, 1177, 470, 11, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[41581, 1193, 340, 7, 30, "Input"],
Cell[41924, 1202, 540, 12, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[42513, 1220, 104, 1, 50, "Section"],
Cell[42620, 1223, 412, 12, 55, "Input"],
Cell[CellGroupData[{
Cell[43057, 1239, 187, 3, 32, "Input"],
Cell[43247, 1244, 171, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[43455, 1251, 189, 3, 32, "Input"],
Cell[43647, 1256, 165, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[43849, 1263, 191, 3, 32, "Input"],
Cell[44043, 1268, 168, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44248, 1275, 194, 3, 32, "Input"],
Cell[44445, 1280, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44648, 1287, 200, 3, 32, "Input"],
Cell[44851, 1292, 163, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45051, 1299, 193, 3, 32, "Input"],
Cell[45247, 1304, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45450, 1311, 202, 3, 32, "Input"],
Cell[45655, 1316, 164, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45856, 1323, 185, 3, 32, "Input"],
Cell[46044, 1328, 164, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46245, 1335, 192, 4, 32, "Input"],
Cell[46440, 1341, 399, 10, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46876, 1356, 305, 7, 32, "Input"],
Cell[47184, 1365, 539, 10, 70, "Message"],
Cell[47726, 1377, 761, 18, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[48524, 1400, 314, 7, 32, "Input"],
Cell[48841, 1409, 142, 1, 70, "Print"],
Cell[48986, 1412, 286, 5, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[49309, 1422, 337, 7, 32, "Input"],
Cell[49649, 1431, 482, 11, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[50168, 1447, 336, 7, 32, "Input"],
Cell[50507, 1456, 482, 11, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[51038, 1473, 127, 1, 50, "Section"],
Cell[51168, 1476, 382, 11, 55, "Input"],
Cell[CellGroupData[{
Cell[51575, 1491, 185, 3, 32, "Input"],
Cell[51763, 1496, 165, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[51965, 1503, 185, 3, 32, "Input"],
Cell[52153, 1508, 165, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[52355, 1515, 189, 3, 32, "Input"],
Cell[52547, 1520, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[52750, 1527, 215, 3, 32, "Input"],
Cell[52968, 1532, 167, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[53172, 1539, 247, 4, 32, "Input"],
Cell[53422, 1545, 167, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[53626, 1552, 240, 4, 32, "Input"],
Cell[53869, 1558, 167, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[54073, 1565, 249, 4, 32, "Input"],
Cell[54325, 1571, 169, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[54531, 1578, 232, 4, 32, "Input"],
Cell[54766, 1584, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[54969, 1591, 192, 4, 32, "Input"],
Cell[55164, 1597, 402, 10, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[55603, 1612, 305, 7, 32, "Input"],
Cell[55911, 1621, 533, 10, 70, "Message"],
Cell[56447, 1633, 763, 18, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[57247, 1656, 314, 7, 32, "Input"],
Cell[57564, 1665, 142, 1, 70, "Print"],
Cell[57709, 1668, 288, 5, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[58034, 1678, 339, 7, 32, "Input"],
Cell[58376, 1687, 480, 11, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[58893, 1703, 338, 7, 32, "Input"],
Cell[59234, 1712, 485, 11, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[59756, 1728, 194, 4, 55, "Input"],
Cell[59953, 1734, 363, 7, 70, "Output"],
Cell[60319, 1743, 363, 7, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[60719, 1755, 196, 4, 55, "Input"],
Cell[60918, 1761, 182, 3, 70, "Output"],
Cell[61103, 1766, 180, 3, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[61332, 1775, 101, 1, 50, "Section"],
Cell[61436, 1778, 405, 12, 55, "Input"],
Cell[CellGroupData[{
Cell[61866, 1794, 183, 3, 32, "Input"],
Cell[62052, 1799, 169, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[62258, 1806, 185, 3, 32, "Input"],
Cell[62446, 1811, 167, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[62650, 1818, 191, 3, 32, "Input"],
Cell[62844, 1823, 164, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[63045, 1830, 189, 3, 32, "Input"],
Cell[63237, 1835, 164, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[63438, 1842, 198, 3, 32, "Input"],
Cell[63639, 1847, 165, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[63841, 1854, 189, 3, 32, "Input"],
Cell[64033, 1859, 165, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[64235, 1866, 198, 3, 32, "Input"],
Cell[64436, 1871, 163, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[64636, 1878, 181, 3, 32, "Input"],
Cell[64820, 1883, 164, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[65021, 1890, 194, 4, 32, "Input"],
Cell[65218, 1896, 251, 5, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[65506, 1906, 307, 7, 32, "Input"],
Cell[65816, 1915, 532, 10, 24, "Message"],
Cell[66351, 1927, 451, 10, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[66839, 1942, 316, 7, 32, "Input"],
Cell[67158, 1951, 354, 7, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[67549, 1963, 316, 7, 32, "Input"],
Cell[67868, 1972, 359, 7, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[68264, 1984, 315, 7, 32, "Input"],
Cell[68582, 1993, 356, 7, 32, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[68987, 2006, 132, 2, 50, "Section"],
Cell[69122, 2010, 479, 15, 55, "Input"],
Cell[CellGroupData[{
Cell[69626, 2029, 183, 3, 32, "Input"],
Cell[69812, 2034, 165, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[70014, 2041, 185, 3, 32, "Input"],
Cell[70202, 2046, 167, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[70406, 2053, 189, 3, 32, "Input"],
Cell[70598, 2058, 165, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[70800, 2065, 190, 3, 32, "Input"],
Cell[70993, 2070, 167, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[71197, 2077, 196, 3, 32, "Input"],
Cell[71396, 2082, 168, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[71601, 2089, 191, 3, 32, "Input"],
Cell[71795, 2094, 171, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[72003, 2101, 198, 3, 32, "Input"],
Cell[72204, 2106, 167, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[72408, 2113, 181, 3, 32, "Input"],
Cell[72592, 2118, 168, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[72797, 2125, 194, 4, 32, "Input"],
Cell[72994, 2131, 398, 10, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[73429, 2146, 307, 7, 32, "Input"],
Cell[73739, 2155, 505, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[74281, 2172, 316, 7, 32, "Input"],
Cell[74600, 2181, 500, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[75137, 2198, 316, 7, 32, "Input"],
Cell[75456, 2207, 501, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[75994, 2224, 315, 7, 32, "Input"],
Cell[76312, 2233, 503, 12, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[76864, 2251, 136, 2, 50, "Section"],
Cell[77003, 2255, 481, 15, 55, "Input"],
Cell[CellGroupData[{
Cell[77509, 2274, 185, 3, 32, "Input"],
Cell[77697, 2279, 164, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[77898, 2286, 187, 3, 32, "Input"],
Cell[78088, 2291, 168, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[78293, 2298, 191, 3, 32, "Input"],
Cell[78487, 2303, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[78690, 2310, 192, 3, 32, "Input"],
Cell[78885, 2315, 168, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[79090, 2322, 198, 3, 32, "Input"],
Cell[79291, 2327, 164, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[79492, 2334, 191, 3, 32, "Input"],
Cell[79686, 2339, 165, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[79888, 2346, 202, 3, 32, "Input"],
Cell[80093, 2351, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[80296, 2358, 185, 3, 32, "Input"],
Cell[80484, 2363, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[80687, 2370, 196, 4, 32, "Input"],
Cell[80886, 2376, 377, 10, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[81300, 2391, 311, 7, 32, "Input"],
Cell[81614, 2400, 509, 10, 70, "Message"],
Cell[82126, 2412, 585, 11, 70, "Message"],
Cell[82714, 2425, 662, 12, 70, "Message"],
Cell[83379, 2439, 583, 11, 70, "Message"],
Cell[83965, 2452, 671, 12, 70, "Message"],
Cell[84639, 2466, 500, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[85176, 2483, 317, 7, 32, "Input"],
Cell[85496, 2492, 495, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[86028, 2509, 318, 7, 32, "Input"],
Cell[86349, 2518, 506, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[86892, 2535, 317, 7, 32, "Input"],
Cell[87212, 2544, 500, 12, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[87761, 2562, 134, 2, 50, "Section"],
Cell[87898, 2566, 491, 15, 55, "Input"],
Cell[CellGroupData[{
Cell[88414, 2585, 184, 3, 32, "Input"],
Cell[88601, 2590, 164, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[88802, 2597, 210, 3, 32, "Input"],
Cell[89015, 2602, 168, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[89220, 2609, 214, 3, 32, "Input"],
Cell[89437, 2614, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[89640, 2621, 215, 3, 32, "Input"],
Cell[89858, 2626, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[90061, 2633, 221, 3, 32, "Input"],
Cell[90285, 2638, 166, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[90488, 2645, 214, 3, 32, "Input"],
Cell[90705, 2650, 163, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[90905, 2657, 223, 3, 32, "Input"],
Cell[91131, 2662, 168, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[91336, 2669, 206, 3, 32, "Input"],
Cell[91545, 2674, 148, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[91730, 2681, 192, 4, 32, "Input"],
Cell[91925, 2687, 358, 10, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[92320, 2702, 307, 7, 32, "Input"],
Cell[92630, 2711, 489, 10, 70, "Message"],
Cell[93122, 2723, 563, 11, 70, "Message"],
Cell[93688, 2736, 642, 12, 70, "Message"],
Cell[94333, 2750, 563, 11, 70, "Message"],
Cell[94899, 2763, 653, 12, 70, "Message"],
Cell[95555, 2777, 475, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[96067, 2794, 316, 7, 32, "Input"],
Cell[96386, 2803, 478, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[96901, 2820, 314, 7, 32, "Input"],
Cell[97218, 2829, 480, 13, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[97735, 2847, 313, 7, 32, "Input"],
Cell[98051, 2856, 476, 12, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[98576, 2874, 132, 2, 50, "Section"],
Cell[98711, 2878, 415, 12, 55, "Input"],
Cell[CellGroupData[{
Cell[99151, 2894, 185, 3, 32, "Input"],
Cell[99339, 2899, 168, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[99544, 2906, 187, 3, 32, "Input"],
Cell[99734, 2911, 145, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[99916, 2918, 193, 3, 32, "Input"],
Cell[100112, 2923, 147, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[100296, 2930, 192, 3, 32, "Input"],
Cell[100491, 2935, 147, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[100675, 2942, 198, 3, 32, "Input"],
Cell[100876, 2947, 144, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[101057, 2954, 193, 3, 32, "Input"],
Cell[101253, 2959, 146, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[101436, 2966, 202, 3, 32, "Input"],
Cell[101641, 2971, 142, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[101820, 2978, 185, 3, 32, "Input"],
Cell[102008, 2983, 146, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[102191, 2990, 194, 4, 32, "Input"],
Cell[102388, 2996, 357, 10, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[102782, 3011, 307, 7, 32, "Input"],
Cell[103092, 3020, 487, 10, 70, "Message"],
Cell[103582, 3032, 561, 11, 70, "Message"],
Cell[104146, 3045, 640, 12, 70, "Message"],
Cell[104789, 3059, 563, 11, 70, "Message"],
Cell[105355, 3072, 648, 12, 70, "Message"],
Cell[106006, 3086, 478, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[106521, 3103, 316, 7, 32, "Input"],
Cell[106840, 3112, 476, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[107353, 3129, 316, 7, 32, "Input"],
Cell[107672, 3138, 476, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[108185, 3155, 315, 7, 32, "Input"],
Cell[108503, 3164, 473, 12, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[109025, 3182, 99, 1, 50, "Section"],
Cell[109127, 3185, 625, 18, 99, "Input"],
Cell[109755, 3205, 572, 16, 77, "Input"],
Cell[CellGroupData[{
Cell[110352, 3225, 184, 3, 32, "Input"],
Cell[110539, 3230, 149, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[110725, 3237, 189, 3, 32, "Input"],
Cell[110917, 3242, 142, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[111096, 3249, 191, 3, 32, "Input"],
Cell[111290, 3254, 142, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[111469, 3261, 192, 3, 32, "Input"],
Cell[111664, 3266, 144, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[111845, 3273, 198, 3, 32, "Input"],
Cell[112046, 3278, 144, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[112227, 3285, 191, 3, 32, "Input"],
Cell[112421, 3290, 141, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[112599, 3297, 200, 3, 32, "Input"],
Cell[112802, 3302, 142, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[112981, 3309, 160, 3, 32, "Input"],
Cell[113144, 3314, 141, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[113322, 3321, 194, 4, 32, "Input"],
Cell[113519, 3327, 367, 10, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[113923, 3342, 306, 7, 32, "Input"],
Cell[114232, 3351, 513, 10, 24, "Message"],
Cell[114748, 3363, 561, 14, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[115346, 3382, 318, 7, 32, "Input"],
Cell[115667, 3391, 429, 10, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[116133, 3406, 315, 7, 32, "Input"],
Cell[116451, 3415, 335, 7, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[116823, 3427, 314, 7, 32, "Input"],
Cell[117140, 3436, 337, 8, 32, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[117526, 3450, 107, 1, 50, "Section"],
Cell[117636, 3453, 169, 4, 32, "Input"],
Cell[117808, 3459, 192, 5, 32, "Input"],
Cell[118003, 3466, 168, 4, 32, "Input"],
Cell[118174, 3472, 219, 5, 32, "Input"],
Cell[118396, 3479, 257, 7, 32, "Input"],
Cell[CellGroupData[{
Cell[118678, 3490, 134, 2, 32, "Input"],
Cell[118815, 3494, 145, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[118997, 3501, 136, 2, 32, "Input"],
Cell[119136, 3505, 143, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[119316, 3512, 139, 2, 32, "Input"],
Cell[119458, 3516, 144, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[119639, 3523, 143, 2, 32, "Input"],
Cell[119785, 3527, 146, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[119968, 3534, 151, 2, 32, "Input"],
Cell[120122, 3538, 144, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[120303, 3545, 144, 2, 32, "Input"],
Cell[120450, 3549, 148, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[120635, 3556, 151, 2, 32, "Input"],
Cell[120789, 3560, 143, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[120969, 3567, 134, 2, 32, "Input"],
Cell[121106, 3571, 146, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[121289, 3578, 342, 8, 55, "Input"],
Cell[121634, 3588, 423, 12, 70, "Output"],
Cell[122060, 3602, 470, 11, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[122567, 3618, 267, 6, 32, "Input"],
Cell[122837, 3626, 470, 11, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[123344, 3642, 265, 6, 32, "Input"],
Cell[123612, 3650, 553, 14, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[124202, 3669, 264, 6, 32, "Input"],
Cell[124469, 3677, 556, 15, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[125074, 3698, 103, 1, 50, "Section"],
Cell[125180, 3701, 608, 19, 99, "Input"],
Cell[CellGroupData[{
Cell[125813, 3724, 166, 3, 32, "Input"],
Cell[125982, 3729, 143, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[126162, 3736, 190, 3, 32, "Input"],
Cell[126355, 3741, 143, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[126535, 3748, 195, 3, 32, "Input"],
Cell[126733, 3753, 143, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[126913, 3760, 198, 3, 32, "Input"],
Cell[127114, 3765, 145, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[127296, 3772, 204, 3, 32, "Input"],
Cell[127503, 3777, 143, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[127683, 3784, 195, 3, 32, "Input"],
Cell[127881, 3789, 144, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[128062, 3796, 206, 3, 32, "Input"],
Cell[128271, 3801, 147, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[128455, 3808, 189, 3, 32, "Input"],
Cell[128647, 3813, 149, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[128833, 3820, 196, 4, 32, "Input"],
Cell[129032, 3826, 470, 12, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[129539, 3843, 311, 7, 32, "Input"],
Cell[129853, 3852, 579, 14, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[130469, 3871, 318, 7, 32, "Input"],
Cell[130790, 3880, 574, 14, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[131401, 3899, 318, 7, 32, "Input"],
Cell[131722, 3908, 574, 15, 47, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[132333, 3928, 317, 7, 32, "Input"],
Cell[132653, 3937, 569, 14, 47, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[133271, 3957, 120, 1, 50, "Section"],
Cell[CellGroupData[{
Cell[133416, 3962, 134, 2, 30, "Input"],
Cell[133553, 3966, 145, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[133735, 3973, 136, 2, 30, "Input"],
Cell[133874, 3977, 143, 2, 70, "Output"]
}, Open  ]],
Cell[134032, 3982, 364, 10, 50, "Input"],
Cell[CellGroupData[{
Cell[134421, 3996, 162, 3, 30, "Input"],
Cell[134586, 4001, 143, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[134766, 4008, 189, 3, 30, "Input"],
Cell[134958, 4013, 142, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[135137, 4020, 191, 3, 30, "Input"],
Cell[135331, 4025, 142, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[135510, 4032, 192, 3, 30, "Input"],
Cell[135705, 4037, 142, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[135884, 4044, 198, 3, 30, "Input"],
Cell[136085, 4049, 143, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[136265, 4056, 191, 3, 30, "Input"],
Cell[136459, 4061, 142, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[136638, 4068, 200, 3, 30, "Input"],
Cell[136841, 4073, 142, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[137020, 4080, 183, 3, 30, "Input"],
Cell[137206, 4085, 141, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[137384, 4092, 196, 4, 30, "Input"],
Cell[137583, 4098, 459, 12, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[138079, 4115, 307, 7, 30, "Input"],
Cell[138389, 4124, 487, 10, 70, "Message"],
Cell[138879, 4136, 559, 11, 70, "Message"],
Cell[139441, 4149, 640, 12, 70, "Message"],
Cell[140084, 4163, 558, 11, 70, "Message"],
Cell[140645, 4176, 647, 12, 70, "Message"],
Cell[141295, 4190, 603, 15, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[141935, 4210, 318, 7, 24, "Input"],
Cell[142256, 4219, 597, 14, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[142890, 4238, 318, 7, 30, "Input"],
Cell[143211, 4247, 598, 14, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[143846, 4266, 317, 7, 30, "Input"],
Cell[144166, 4275, 602, 14, 70, "Output"]
}, Open  ]]
}, Closed]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature OvpzB#O@Tln3LBK97XproXPb *)
