[![GitHub (pre-)release](https://img.shields.io/github/release/himeinhardt/TuGames/all.svg)](https://github.com/himeinhardt/TuGames/releases)
[![Mathematica 12.0 - 14.0.0](https://img.shields.io/badge/Mathematica-12.0_--_14.0.0-brightgreen.svg)](#compatibility)
[![license MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/himeinhardt/TuGames/blob/master/LICENSE.md)

# *Mathematica* Package: *TuGames* Version 3.1.4

```
Contents:
 1.  Introduction
 2.  Custom Installation
 3.  Getting Started
 3.1 Basic Example
 3.2 Using a different Solver
 4.  Running the Package in Parallel
 4.1 General Procedure
 4.2 Running the Cddmathlink libraries in Parallel
 5.  MATLink and MATtug (Matlab toolbox MatTuGames)
 6.  Documentation
 7.  Graphics
 8.  Acknowledgment
 9.  License
```

## 1. Introduction


*TuGames* is a *Mathematica* package to determine and to check some 
game properties of transferable utility games. It provides more 
than 200 different functions to calculate, for instance, (pre-)kernel 
elements, the (pre-)nucleolus, the modiclus, the modified and proper modified
pre-kernel, the Shapley value, Lorenz solution, Dutta-Ray solution,
excess payoffs, the tau-value, chi-value, Gately point, the vertices of a core, and much more.
Moreover, it verifies if the game is convex, average-convex or superadditive
just to mention some interesting game properties. It can be used in serial
as well as in parallel mode, and in conjunction with *MATLink* to build up a *Matlab* 
connection to invoke the toolbox *MatTuGames*. This package is exclusively 
dedicated to Mathematica version 12.x and higher, because `TUG-3.0.0` is the first
version that is transcribed to the new collection of algorithms for solving convex problems
introduced in version 12. For Mathematica versions smaller than 12.0 one should use `TUG-2.6.2`.
This version remains compatible with the most recent Mathematica version as long as
ConstrainedMax/ConstrainedMin and LinearProgramming/DualLinearProgramming are supported by Wolfram Research,
otherwise one has to switch to `TUG-3.0.0` or later. In this respect, the graphical
features should run on all platforms. As a highlight, a fast algorithm to seek for a
pre-kernel element is implemented in the updated package. This algorithm is described
in the book 

```
The Pre-Kernel as a Tractable Solution for Cooperative Games
An Exercise in Algorithmic Game Theory
Series: Theory and Decision Library C, Vol. 45
Meinhardt, Holger Ingmar
2014, XXXIII, 242 p. 8 illus., 4 illus. in color
```
More information can be found here:

* [Book](http://www.springer.com/economics/game+theory/book/978-3-642-39548-2) 
* [DOI](https://link.springer.com/book/10.1007%2F978-3-642-39549-9)

Moreover, we have included a new package called ParaTuGames to literally run the 
major commands of TuGames in parallel. Notice that this package has not passed
its stage of development. Hence, the user should use it with care and for testing
only. 

In addition, note that these functions/interfaces had to be provided in a Global context 
to call the parallel commands of Mathematica within a package. This design requires 
that during a running session with `ParaTuGames` no other variables of Global context
should be defined to avoid name conflicts and wrong results. Though use only the 
commands that start with the prefix `Para`, and which returns a description of how to 
use it. To get an idea of its usage, invoke in the panel of the Documentation Center `TUG`
and click then on hyperlink ` "ParaTuGames Package" ` to open the file
`TUG/Tutorials/ParaExpGamePers12` from the Documentation Center `(cf. Section 6)`.
Finally, this package does not require the configuration procedure as under `Section 4`.

A modified version of the package *CooperativeGames* that has been developed 
by *M. Carter* to run properly with Mathematica 12.x and higher is enclosed. 
It must be mentioned in this place that some commands of TuGames require 
routines that have been provided by the package CooperativeGames. A description
of the package CooperativeGames can be found in 

```
Hal R. Varian, Economic and Financial Modeling with Mathematica, 
Telos Springer Publisher,1993, Chapter 8. 
```

Furthermore, if one is interested in computing the vertices of a core 
the Mathematica package *VertexEnum* written by *K. Fukuda and I. Mizukoshi* 
must also be installed on the computer. But note that this function is very 
slow in computing all vertices of a core even for modern computers. You can 
overcome these shortcomings of VertexEnum by installing the C-library 
*Cddmathlink* written by the same authors to perform the same computational task 
more efficiently. It can be found under 

[Cddlib](https://inf.ethz.ch/personal/fukudak/cdd_home/)

for various UNIX, MacOSX and for Window systems. The library is linked via *MathLink* 
with the Mathematica Kernel. Under Linux and Mathematica 11.3 we complied successfully
the binaries using the following compiler flags

```
MLFLAGS = -lML64i4 -lpthread -lrt -luuid -ldl 
```

See also our post at 

[Vertex Enum](http://mathematica.stackexchange.com/questions/59660/any-packages-for-vertex-enumeration-on-mathematica)

to overcome possible pitfalls, which might occur during a compilation of the 
Cddmathlink binaries.

For Windows and MacOSX Operating Systems pre-build binaries are available under 

[Cddlibml Binary](ftp://ftp.math.ethz.ch/users/fukudak/cdd/cddlibml_binary/)

This C-library is required to use the graphical features of the package.
Notice that the functions that based on this library are activated. To deactivate them 
comment in the corresponding lines in the TuGames.m file (cf. Section 2).

In order to install the library, we recommend it to do so in the `TUG` directory tree.
We have provided several folders that should receive the Cddmathlink executables for
different Operating System ABIs. To retrieve your system ID execute in a Notebook

```
$SystemID
```

We have provided some executables for *RHEL 7.5, RHEL 8.2*, and *MacOSX*. Unfortunately, we are not experienced enough under *Windows* to provide any for those. Thus, we invite the community to fill that gap and to provide some.

In order check for *Mathematica* versions smaller than 12.1 the paths where you have to install the Cddmathlink library call the command

```
In[1]:= PacletInformation["TUG"]

Out[1]= {Name -> TUG, Version -> 3.1.4 BuildNumber -> , Qualifier -> , WolframVersion -> 12+,
         SystemID -> All, Description -> A Mathematica Package for Cooperative Game Theory,
	 Category -> , Creator -> Holger Ingmar Meinhardt <holger.meinhardt@partner.kit.edu>,
	 Publisher -> , Support -> , Internal -> False, Location -> /home/kit/xxx/xxxx/.Mathematica/Paclets/Repository/TUG-3.1.4
	 Context -> {TUG`coop`, TUG`vertex`, TUG`}, Enabled -> True, Loading -> Manual}
```

To get the same information and beyond that under *Mathematica* version 12.1, it is required to execute

```
In[1]:= PacletObject["TUG"][All]
```
```
Out[1]=  {"Name" -> "TUG", "Version" -> "3.1.4", "WolframVersion" -> "12+", 
          "Qualifier" -> "", "SystemID" -> All, "Description" -> "A Mathematica Package for Cooperative Game Theory",
          "Category" -> Missing["NotAvailable"], "Keywords" -> Missing["NotAvailable"], 
          "UUID" -> Missing["NotAvailable"], 
          "Creator" -> 
          "Holger Ingmar Meinhardt <holger.meinhardt@partner.kit.edu>", 
          "URL" -> "https://github.com/himeinhardt/TuGames", 
          "Internal" -> False, 
          "Context" -> {"TUG`coop`", "TUG`vertex`", "TUG`"}, 
          "Loading" -> Manual, "AutoUpdating" -> False, "Enabled" -> True, 
          "Location" -> "/home/kit/xxx/xxxx/.Mathematica/Paclets/Repository/TUG-3.1.4"}
```
or alternatively

```
Information[PacletObject["TUG"]]
```


Then open the directory for *Mathematica* versions smaller than 12.1 by

```
SystemOpen@Lookup[PacletInformation["TUG"], "Location"]
```

or for *Mathematica* version 12.1 one opens the directory via 

```
SystemOpen@Lookup[PacletObject["TUG"][All], "Location"]
```

This returns the root directory of `TUG`, and shows you the three folders
`cddmathlink, cddmathlink2` and `cddmathlink2gmp` that should receive the Cddmathlink
executables.

The author has tested the functions extensively under `LINUX x86/64, HP-UX` and `AIX`. 
Furthermore, the package was also be installed and tested successfully under `Windows XP` 
and `MacOSX`. For more recent Windows OS the author has no experience.  But the 
programming language of Mathematica is system independent, thus, there should no problems 
occur on these operating systems to run the basic functions of the package. 

## 2. Custom Installation

Since `Version 2.5.1` the package is distributed as a `Paclet`, which allows a custom installation. The latest version is `TUG-3.1.4`, which is only compatible for Mathematica version 12.0 or higher. This version is not any more usable for versions that are smaller than 12.0. Notice that `TUG-2.6.2` is the latest version that is compatible with Mathematica versions smaller than 12.0, and will remain compatible with the most recent Mathematica version as long as `ConstrainedMax/ConstrainedMin` and `LinearProgramming/DualLinearProgramming` are supported by Wolfram Research, otherwise one has to update to `TUG-3.0.0` or later.  The installation of the package requires about 90 MB free hard-disk space, and the Mathematica version should not be smaller than 10 while installing Version `TUG-2.6.2`. For Mathematica versions smaller than Version 10, a manual installation is requested. In that case one has to follow the guidelines related to the associated operating system that can be found from the Mathematica documentation. 

The simplest method is to install the `Paclet` directly from GitHub under Mathematica V12.0 or later while executing   

```
ResourceFunction["GitHubInstall"]["himeinhardt", "TuGames"]
```

For smaller versions than 12.0 start Mathematica, open a notebook, and execute therein 

```
PacletInstall["/full/Path/to/TUG-2.6.2.paclet"] 
```
to install TUG-2.6.2 the last version compatible with a Mathematica version smaller than 12.0. That should return the value

```
Paclet[TUG, 2.6.2, <>] 
```

to indicate a successful installation. Notice that 

```
"/full/Path/to/TUG-2.6.2.paclet"
```

indicates the directory where the `TUG-2.6.2.paclet` is located at your hard-disk.  

Alternatively, one can directly install the package from GitHub with the help of the *Mathematica-Tools* from 

[Mma Tools](https://github.com/b3m2a1/mathematica-tools)

For doing so, install first the package paclet generator and installer while executing within a running *Mathematica* session the command

```
Get["https://raw.githubusercontent.com/b3m2a1/mathematica-tools/master/PackageDataPacletInstall.m"]
```
After that, the current version of TuGames can be installed while calling from your notebook

```
PDInstallPaclet["https://github.com/himeinhardt/TuGames"]
```

The drawback of the foregoing procedure is that Linux (MacOSX?) users have to change the access permissions of the Cddmathlink executables. Follow the instructions from Section 1 to locate the Cddmathlink executables on your system after installation. Then change the file permissions in the associated folders by

```
chmod 755 cddmathlink
chmod 755 cddmathlink2
chmod 755 cddmathlink2gmp
```

within a Linux console. After this procedure, your Cddmathlink executables are available on your computer.  

In order to use the graphical features of the package, it is recommended to install the Cddmathlink executables in pre-defined folders as described in Section 1. This C-library must be compiled by yourself if the shipped executables are not binary compatible with your OS. Windows users should compile it with the help of *Cygwin*.

If you plan to install these libraries somewhere else, then insert the path to this library in the file TuGames.m after the line of 


```
:Comments for Windows OS ends:  
```

Notice that the C-library is not necessary to run the package, however, the graphical features are then disabled.

After these steps, the installation procedure is completed, and one can start a session while executing 

```
Needs["TUG`"]
```

All this does not affect an older installation. 

Finally, in order to see how to open the documentation and to run some example we refer the user to `Section 6` below.  



## 3. Getting Started

The forthcoming discussion assumes that you have properly installed the 
files mentioned above on your computer. 

### 3.1 Basic Example

To start with the calculation, we have to load some packages in a first step. This can be done by the following commands. 

```
In[1]:=  Needs["TUG`"]
===================================================
Loading Package 'TuGames' for Unix
===================================================
TuGames V3.1.4 by Holger I. Meinhardt
Release Date: 03.06.2024
Program runs under Mathematica Version 12.0 or later
Version 12.x or higher is recommended
===================================================
===================================================
Package 'TuGames' loaded
===================================================
```

Let us consider a small three-person TU-game. For this purpose define first the player set 

```
In[2]:= T={1,2,3};
```

and then the characteristic values through

```
In[3]:= clv={0,0,0,0,90,100,120,220};
```

These data are necessary to define the TU-game, which can be accomplished by

```
In[4]:= ExpGame = DefineGame[T,clv];
```

After that we are in position to impose some basic operations like

```
In[5]:= ConvexQ[ExpGame]
Out[5]= True

In[6]:= CoreQ[ExpGame]
Out[6]= True

In[7]:= AverageConvexQ[ExpGame]
Out[7]= True

In[8]:= GameMonotoneQ[ExpGame]                                                                                                                                                                                    
Out[8]= True

In[9]:= ker=Kernel[ExpGame]                                                                                                                                                                                       
         170  230  260
Out[9]= {---, ---, ---}
          3    3    3

In[10]:= shv=ShapleyValue[ExpGame]                                                                                                                                                                                
Out[10]= {65, 75, 80}

In[11]:= nc=Nucleolus[ExpGame]                                                                                                                                                                                    
          170  230  260
Out[11]= {---, ---, ---}
           3    3    3

In[12]:= WeaklyBalancedCollectionQ[ExpGame,nc]                                                                                                                                                                                                

Out[12]= True

In[13]:= prn=PreNucleolus[ExpGame]                                                                                                                                                                                
          170  230  260
Out[13]= {---, ---, ---}
           3    3    3

In[14]:= BalancedCollectionQ[ExpGame,prn]                                                                                                                                                                                                     

Out[14]= True


In[15]:= prk=PreKernelSolution[ExpGame]

          170  230  260
Out[15]= {---, ---, ---}
           3    3    3

In[16]:= mnc=Modiclus[ExpGame]                                                                                                                                                                                                                    

          220  220  220
Out[16]= {---, ---, ---}
           3    3    3

In[17]:= IsModiclusQ[ExpGame,mnc]                                                                                                                                                                                                             

Out[17]= True

```
### 3.2 Using a different Solver

Alternatively, one can also supply a different method to check the existence of the core or to find a (pre-)kernel element or the (pre-)nucleolus. This may be useful when one encounters numerical issues, the evaluation lasts too long or with the need to determine an additional (pre-)kernel element. Although, the latter case is not relevant for a three-person game, we nevertheless demonstrate its usage for the above example.  


```

In[18]:= CoreQ[ExpGame,Method->RevisedSimplex]

Out[18]= True


In[19]:= ker=Kernel[ExpGame,CallMaximize->False,Method->CLP]

         170  230  260
Out[19]= {---, ---, ---}
          3    3    3

In[20]:= nc=Nucleolus[ExpGame,CallMaximize->False,Method->RevisedSimplex]

          170  230  260
Out[20]= {---, ---, ---}
           3    3    3


In[21]:= prn=PreNucleolus[ExpGame,CallMaximize->False,Method->{InteriorPoint, Tolerance->10^-8}]

          1065164637  695287163  1514771007
Out[21]= {----------, ---------, ----------}
           18797023    9068963    17478127

In[22]:= WeaklyBalancedCollectionQ[ExpGame,prn]                                                                                                                                                                                               

Out[22]= False

In[23]:= BalancedCollectionQ[ExpGame,prn]                                                                                                                                                                                                     

Out[23]= False


In[24]:= prn=PreNucleolus[ExpGame,CallMaximize->False,Method->{InteriorPoint, Tolerance->10^-9}]

          170  230  260
Out[24]= {---, ---, ---}
           3    3    3

In[25]:= prk=PreKernelSolution[ExpGame,SolutionExact->False,Method->IPOPT]                                                                                                                                                                     

FindMinimum::sdir: Search direction has become too small.

FindMinimum::sdir: Search direction has become too small.

          170  230  260
Out[25]= {---, ---, ---}
           3    3    3


In[26]:= mnc=Modiclus[ExpGame,Method->{InteriorPoint, Tolerance->10^-7}]                                                                                                                                                                      

          297599353  80924213  63785847
Out[26]= {---------, --------, --------}
           4058173   1103512    869807

In[27]:= IsModiclusQ[ExpGame,mnc]                                                                                                                                                                                                             

Out[27]= False


In[28]:= Modiclus[ExpGame,Method->{InteriorPoint, Tolerance->10^-8}]                                                                                                                                                                          

          220  220  220
Out[28]= {---, ---, ---}
           3    3    3

```

Admissible methods for the presented commands `CoreQ, Kernel, Nucleolus`, `PreNucleolus` or `Modiclus` are: `RevisedSimplex, CLP, GUROBI, MOSEK`, or `Automatic`. The default setting is `Automatic`. This option must be used in connection with `CallMaximize->False`. One can even try `Method->{InteriorPoint, Tolerance->10^-7}` to get a more precise result whenever one encounters numerical issues. In contrast, admissible methods for the function `PreKernelSolution` are: `Automatic, Newton, QuasiNewton, InteriorPoint, ConjugateGradient, Gradient, PrincipalAxis, LevenbergMarquardt, MOSEK, GUROBI` or `IPOPT`. Here, one has in addition to set `SolutionExact->False` to change to the non-default setting. 
 
For more information see `TUG/Tutorials/GettingStarted` from the Documentation Center `(cf. Section 6)`.

 
## 4. Running the Package in Parallel

### 4.1 General Procedure


In order to run the TuGames package in parallel, we recommend putting at least in the Kernel 
init.m file a new variable called `$ParaMode` while setting its value to "False". For doing so, open 
the init.m  file under `~/.Mathematica/Kernel` by your favorite editor. Windows and MacOSX users should
consult `$UserBaseDirectory` to find their personal init.m. Then copy the variable 
below with its value at the end of your Kernel `init.m` file, that is,

```
# init.m 
$ParaMode="False";
```

Now open a notebook to start a Mathematica session. In order to run a session in parallel 
at the least the following commands must be invoked from your notebook:

`LaunchKernels[]`; or `LaunchKernels[8]`; or any other number reflecting the number of cores you can address. 
```
$KernelCount
Needs["TUG`coop`CooperativeGames`"];
Needs["TUG`TuGames`"];
Needs["TUG`TuGamesAux`"];
$ParaMode="True";
ParallelNeeds["TUG`coop`CooperativeGames`"];
ParallelNeeds["TUG`TuGames`"];
ParallelNeeds["TUG`TuGamesAux`"];
```

To be sure that everything is distributed correctly, we distribute the definitions of the packages 
to all SubKernels.

```
DistributeDefinitions["TUG`coop`CooperativeGames`*"];
```

Then define your game using `Set[]` rather than `SetDelayed[]`, let us say `ExpGame`, and invoke in addition:

```
SetSharedVariable[ExpGame];
```

Moreover, if some of the Mathematica packages which are used by TuGames are located on a different
folder, you probably have to invoke in addition

```
LaunchKernels[];
....
....
ParallelEvaluate[AppendTo[$Path,"/Path/to/the/required/Packages"]];
ParallelNeeds["TUG`coop`CooperativeGames`"];
ParallelNeeds["TUG`TuGames`"];
....
....
```

For more information have also a look on the notebook file `TUG/Guides/TuGamesParallelMamaV11d3` from 
the Documentation Center `(cf. Section 6)`. 


### 4.2 Running the Cddmathlink libraries in Parallel


If you plan to run even the Cddmathlink libraries in parallel, you have to set an additional variable
to the already set variable `$ParaMode` in the Kernel `init.m` file. For doing so, open again the init.m 
file under `~/.Mathematica/Kernel` by an editor. Then copy the variable `$NotebookMode` below with its 
assigned value at the end of your Kernel `init.m` file, that is,

```
# init.m 
$ParaMode="False";
$NotebookMode="True";
```

Here, we assumed that most people want to use the parallel mode within a notebook. In case that you
mostly use Mathematica from the command line or even on a compute node, then set the value of
the variable `$NotebookMode` to ` "False" `.

In the second step open now a notebook and put to the above commands under `4.1` the additional commands 
in between, hence

```
LaunchKernels[];
.....
.....
Needs["TuGames`"];
ParallelNeeds[$ParaMode="True"];
ParallelNeeds[$NotebookMode="True"];
ParallelNeeds["TUG`coop`CooperativeGames`"];
ParallelNeeds["TUG`TuGames`"]; 
.....
.....
SetSharedVariable[YourDefinedGame];
```

In case that you intend to run Cddmathlink libraries in parallel on a compute node or from the command
line, then you have to put into your input file the following commands:

```
LaunchKernels[];
.....
.....
Needs["TuGames`"] ;
ParallelNeeds[$ParaMode="True"];
ParallelNeeds[$NotebookMode="False"];
ParallelNeeds["TUG`coop`CooperativeGames`"];
ParallelNeeds["TUG`TuGames`"];
.....
.....     
SetSharedVariable[YourDefinedGame];
```
If you encounter problems with the Cddmathlink libraries in parallel, then the following site might also be helpful

[Run External Program in Parallel](http://mathematica.stackexchange.com/questions/25561/how-to-run-an-external-program-in-parallel-with-a-mathematica-package/25818#25818)

As an example, also consult the documentation `TUG/Guides/TuGamesMovieParaModeV6` from the Documentation Center `(cf. Section 6)`.



## 5. MATLink and MATtug 


If you want to use MATtug it is necessary to install MATLink from 

[MATLink](http://matlink.org)

that allows to open a Matlab connection from a running Mathematica session in order to be able 
to use the Matlab toolbox MatTuGames that is available under

[MatTuGames](http://www.mathworks.de/matlabcentral/fileexchange/35933-mattugames)

For more information consult `TUG/Guides/MATtug` from the Documentation Center `(cf. Section 6)`.
 

## 6. Documentation


Open the `Mathematica Documentation Center`, and enter into the panel just `TUG` or `guide/InstalledAddOns`, 
or scroll down, and click at the end of the page at the right corner on the field `Add-ons and Packages`. This directs 
you to the Documentation of the package from which several examples can be called up, or more detailed information 
can be retrieved. From there, one has access to about 230 pages of documentation.


## 7. Graphics

There are also some graphical capabilities available, which should work under all platforms
whenever the Cddmathlink libraries are installed. Features are for instance: plotting the
core and strong epsilon core skeleton together with the nucleolus, kernel and Shapley value 
up to four players.  

As an example, we visualize the geometric properties of the kernel and nucleolus (enlarged red dot) in the animation below. The Shapley value is the enlarged blue dot, which is given as a reference point.   

![](anim.gif)

For running the animation, a reload may be needed. 

Consult for more information `TUG/Guides/TuGamesView2dV6` or `TUG/Guides/TuGamesView3dV6` from the Documentation Center.

## 8. Acknowledgment

We are very thankful to *Szabolcs Horvát* for his helpful support, suggestion of improvements,
and of his piece of advice to follow best practice of publicizing a Mathematica package
that allows a custom installation for everyone. Moreover, we owe him some executables for
MacOSX, which ship with this version.

The author acknowledges support by the state of Baden-Württemberg through bwHPC.

Of course, the usual disclaimer applies.   

## 9. License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details or
[MIT](https://choosealicense.com/licenses/mit/)

## Author

**Holger I. Meinhardt**
Institute of Operations Research
University of Karlsruhe (KIT) 
E-mail: Holger.Meinhardt ät wiwi.uni-karlsruhe.de
        holger.meinhardt ät partner.kit.edu


