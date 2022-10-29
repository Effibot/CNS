%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2022 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook
%
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybook}[2022/04/09 v4.3 ElegantBook document class]


%%%
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% ----- Colors -----
\DeclareStringOption[blue]{color}
\DeclareStringOption[en]{lang}
\DeclareStringOption[answer]{result}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[normal]{device}
\DeclareStringOption[cm]{math}
\DeclareStringOption[marginfalse]{marginpar}
\DeclareStringOption[onecol]{toc}
\DeclareStringOption{scheme}

% ----- backward compatibility
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{gray}{\ekv{color=gray}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{nocolor}{\ekv{color=none}}

% ----- Languages support -----
\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{it}{\ekv{lang=it}}

\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}

\DeclareVoidOption{answer}{\ekv{result=answer}}
\DeclareVoidOption{noanswer}{\ekv{result=noanswer}}

\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}

\DeclareStringOption[numeric-comp]{citestyle}
\DeclareStringOption[numeric]{bibstyle}

\DeclareVoidOption{newtx}{\ekv{math=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}
\DeclareVoidOption{cm}{\ekv{math=cm}}

\DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}


\DeclareVoidOption{onecol}{\ekv{toc=onecol}}
\DeclareVoidOption{twocol}{\ekv{toc=twocol}}

\DeclareStringOption[chapter]{thmcnt}
\DeclareVoidOption{chapter}{\ekv{thmcnt=chapter}}
\DeclareVoidOption{section}{\ekv{thmcnt=section}}

\DeclareStringOption[biber]{bibend}
\DeclareVoidOption{biber}{\ekv{bibend=biber}}
\DeclareVoidOption{bibtex}{\ekv{bibend=bibtex}}


% ----- Math option -----
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% ----- Title Style -----
\DeclareStringOption[hang]{titlestyle}[hang]
% ----- backward compatibility
\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}
% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessKeyvalOptions*\relax
% \ProcessOptions*\relax
\LoadClass[a4paper,oneside]{book}

\RequirePackage{setspace}

\RequirePackage{hyperref}
\hypersetup{
    breaklinks,
    unicode,
    linktoc=all,
    bookmarksnumbered=true,
    bookmarksopen=true,
    pdfkeywords={ElegantBook},
    colorlinks,
    linkcolor=steelblue,
    citecolor=steelblue,
    urlcolor=steelblue,
    plainpages=false,
    pdfstartview=FitH,
    pdfborder={0 0 0},
    linktocpage
}
\newif\ifELEGANT@Hy@later
\@ifpackagelater{hyperref}{2022/05/16}
{\ELEGANT@Hy@latertrue}
{\ELEGANT@Hy@laterfalse}

%% device settings
\RequirePackage{geometry}
\ifdefstring{\ELEGANT@device}{normal}{
    \geometry{
        a4paper,
        top=25.4mm, bottom=25.4mm,
        left=20mm, right=20mm,
        headheight=2.17cm,
        headsep=4mm,
        footskip=12mm
    }
    \ifdefstring{\ELEGANT@marginpar}{margintrue}{
        \geometry{
            marginparwidth=5cm, marginparsep=5mm,
            left=2cm,right=7cm}}{\relax}}{
    \relax}

\ifdefstring{\ELEGANT@device}{pad}{
    \geometry{
        paperwidth=7.5in,
        paperheight=10in,
        margin=16mm,
        headheight=2.17cm,
        footskip=4mm
    }}{\relax}


\RequirePackage{indentfirst,comment}
% fontsetting
\ifdefstring{\ELEGANT@math}{mtpro2}{
    \let\Bbbk\relax
    \RequirePackage[lite]{mtpro2}
}{\relax}

\usepackage{titletoc}
\setcounter{tocdepth}{2}
\renewcommand{\baselinestretch}{1.2}


\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage{iftex}

\ifpdftex
\RequirePackage{newtxtext}
%\RequirePackage[scaled=.90]{helvet}
\RequirePackage{tgadventor}
\else
\RequirePackage[no-math]{fontspec}
\setmainfont{TeXGyreTermesX}[
    UprightFont = *-Regular ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic ,
    Extension = .otf ,
    Scale = 1.0]

\setsansfont{texgyreheros}[
    UprightFont = *-regular ,
    BoldFont = *-bold ,
    ItalicFont = *-italic ,
    BoldItalicFont = *-bolditalic ,
    Extension = .otf ,
    Scale = 0.9]
\fi

\RequirePackage{anyfontsize}
\ifdefstring{\ELEGANT@math}{newtx}{
    \let\oldencodingdefault\encodingdefault
    \let\oldrmdefault\rmdefault
    \let\oldsfdefault\sfdefault
    \let\oldttdefault\ttdefault
    \def\encodingdefault{T1}
    \renewcommand{\rmdefault}{ntxtlf}
    \renewcommand{\sfdefault}{qhv}
    \renewcommand{\ttdefault}{ntxtt}
    \RequirePackage{newtxmath}
    \let\encodingdefault\oldencodingdefault
    \let\rmdefault\oldrmdefault
    \let\sfdefault\oldsfdefault
    \let\ttdefault\oldttdefault
    \let\Bbbk\relax
    \RequirePackage{esint}

    \DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
    \let\sumop\relax\let\prodop\relax
    \DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
    \DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"51}
}{\relax}


% ----- Handle Colors -----

\RequirePackage[table]{xcolor}
\ifdefstring{\ELEGANT@color}{green}{
    \definecolor{structurecolor}{RGB}{0,120,2}%
    \definecolor{main}{RGB}{0,120,2}%
    \definecolor{second}{RGB}{230,90,7}%
    \definecolor{third}{RGB}{0,160,152}%
}{\relax}
\ifdefstring{\ELEGANT@color}{cyan}{
    \definecolor{structurecolor}{RGB}{31,186,190}%
    \definecolor{main}{RGB}{59,180,5}%
    \definecolor{second}{RGB}{175,153,8}%
    \definecolor{third}{RGB}{244,105,102}%
}{\relax}
\ifdefstring{\ELEGANT@color}{blue}{
    \definecolor{structurecolor}{RGB}{60,113,183}
    \definecolor{main}{RGB}{0,166,82}%
    \definecolor{second}{RGB}{255,134,24}%
    \definecolor{third}{RGB}{0,174,247}%
}{\relax}
\ifdefstring{\ELEGANT@color}{gray}{
    \definecolor{structurecolor}{RGB}{150,150,150}
    \definecolor{main}{RGB}{150,150,150}%
    \definecolor{second}{RGB}{150,150,150}%
    \definecolor{third}{RGB}{150,150,150}%
}{\relax}
\ifdefstring{\ELEGANT@color}{black}{
    \definecolor{structurecolor}{RGB}{0,0,0}
    \definecolor{main}{RGB}{0,0,0}%
    \definecolor{second}{RGB}{0,0,0}%
    \definecolor{third}{RGB}{0,0,0}%
}{\relax}

%green color
\definecolor{structure1}{RGB}{0,120,2}%
\definecolor{main1}{RGB}{0,120,2}%
\definecolor{second1}{RGB}{230,90,7}%
\definecolor{third1}{RGB}{0,160,152}%
%cyan color
\definecolor{structure2}{RGB}{31,186,190}%
\definecolor{main2}{RGB}{59,180,5}%
\definecolor{second2}{RGB}{175,153,8}%
\definecolor{third2}{RGB}{244,105,102}%
%blue color
\definecolor{structure3}{RGB}{60,113,183}
\definecolor{main3}{RGB}{0,166,82}%
\definecolor{second3}{RGB}{255,134,24}%
\definecolor{third3}{RGB}{0,174,247}%
% gray color
\definecolor{structure4}{RGB}{150,150,150}
\definecolor{main4}{RGB}{150,150,150}%
\definecolor{second4}{RGB}{150,150,150}%
\definecolor{third4}{RGB}{150,150,150}%
% black color
\definecolor{structure5}{RGB}{0,0,0}
\definecolor{main5}{RGB}{0,0,0}%
\definecolor{second5}{RGB}{0,0,0}%
\definecolor{third5}{RGB}{0,0,0}%

% corlor definition
\definecolor{blu}{RGB}{18,29,57}
\colorlet{coverlinecolor}{second}   % for cover line color
\definecolor{purpleheart}{RGB}{120,20,190}
\definecolor{indianred}{RGB}{205, 92, 92}
\definecolor{cadetblue}{RGB}{95, 158, 160}
\definecolor{olive}{RGB}{128, 128, 0}
\definecolor{steelblue}{RGB}{70, 130, 180}
\definecolor{chocolate}{RGB}{210, 105, 30}
\definecolor{mediumseagreen}{RGB}{60, 179, 113}
\definecolor{ocre}{RGB}{243,102,25}
\definecolor{limegreen}{RGB}{50, 205, 50}
\definecolor{burlywood}{RGB}{222, 184, 135}
\definecolor{palered}{RGB}{221,44,0}
\definecolor{frenchplum}{RGB}{190,20,83}
\definecolor{rosybrown}{RGB}{188, 143, 143}
\definecolor{mediumspringgreen}{RGB}{0, 250, 154}

\definecolor{lightgrey}{RGB}{112, 128, 144}
\definecolor{darkteal}{RGB}{0, 96, 100}
\definecolor{lightteal}{RGB}{119, 136, 153}
% ----- Title Style -----
\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}

% reference:
% https://tex.stackexchange.com/questions/58506/how-to-make-a-new-command-similar-to-author
% https://pastebin.com/C8W4axzV
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}

\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}
\newcommand{\extrainfo}[1]{\gdef\@extrainfo{#1}}

\RequirePackage{mwe}
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\cover}[1]{\gdef\@cover{#1}}

\newcommand{\question}[1]{{\par #1}\\[0.2ex]}

\RequirePackage{enumerate}
% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}

\RequirePackage[labelfont={bf,color=structurecolor}]{caption}
\RequirePackage{subcaption}

\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

\AtBeginDocument{
    \setlength{\abovedisplayskip}{3pt}
    \setlength{\belowdisplayskip}{3pt}
    \RequirePackage[flushmargin,stable]{footmisc}
    \setlength{\footnotesep}{12pt}
}

\RequirePackage{graphicx}
\setkeys{Gin}{width=\linewidth}
\RequirePackage{wrapfig}
\RequirePackage{cancel}
\RequirePackage{physics}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb,mathtools,halloweenmath,cases}
\providecommand\qed{}
\renewcommand{\qed}{\hfill\ensuremath{\blacksquare}}
\RequirePackage{booktabs}
\RequirePackage{multicol,multirow}

\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,hologo}

\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}


\RequirePackage[
    backend=\ELEGANT@bibend,
    citestyle=\ELEGANT@citestyle,
    bibstyle=\ELEGANT@bibstyle]{biblatex}

\ifdefstring{\ELEGANT@lang}{en}{
    \setlength\parindent{2em}
    \newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
    \newcommand\tabref[1]{\textbf{Table}~\ref{#1}}
    \renewcommand{\chaptername}{Chapter}
    \renewcommand{\partname}{\color{structurecolor} Part}
    \newcommand{\authorname}{\textbf{Author: }}
    \newcommand{\institutename}{\textbf{Institute: }}
    \newcommand{\datename}{\textbf{Date: }}
    \newcommand{\versionname}{\textbf{Version: }}
    \newcommand{\notename}{Note}
    \newcommand{\proofname}{Proof}
    \newcommand{\problemname}{Problem}
    \newcommand{\definitionname}{Definition}
    \newcommand{\theoremname}{Theorem}
    \newcommand{\axiomname}{Axiom}
    \newcommand{\postulatename}{Postulate}
    \newcommand{\lemmaname}{Lemma}
    \newcommand{\propositionname}{Proposition}
    \newcommand{\corollaryname}{Corollary}
    \newcommand{\examplename}{Example}
    \newcommand{\exercisename}{Exercise}
    \newcommand{\remarkname}{Remark}
    \newcommand{\assumptionname}{Assumption}
    \newcommand{\conclusionname}{Conclusion}
    \newcommand{\solutionname}{Solution}
    \newcommand{\propertyname}{Property}
    \newcommand{\introductionname}{Introduction}
    \renewcommand{\appendixname}{Appendix}
    \newcommand{\ebibname}{Bibliography}
    % \newcommand{\problemsetname}{Exercise}
    \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
    \newcommand{\updatename}{Updates:}
    \newcommand{\historyname}{Version History}
}{\relax}

\ifdefstring{\ELEGANT@lang}{it}{
    %\RequirePackage[utf8]{inputenc}
    \RequirePackage[italian]{babel}
    \RequirePackage[T1]{fontenc}
    \setlength\parindent{2em}
    \newcommand\figref[1]{\textbf{Figura}~\ref{#1}}
    \newcommand\tabref[1]{\textbf{Tabella}~\ref{#1}}
    \renewcommand{\chaptername}{Capitolo: }
    \newcommand{\authorname}{\textbf{Autore: }}
    \newcommand{\institutename}{\textbf{Istituto: }}
    \newcommand{\datename}{\textbf{Data: }}
    \newcommand{\versionname}{\textbf{Versione: }}
    \newcommand{\notename}{Nota}
    \newcommand{\proofname}{Dimostrazione}
    \newcommand{\problemname}{Problema}
    \newcommand{\definitionname}{Definizione}
    \newcommand{\theoremname}{Teorema}
    \newcommand{\axiomname}{Assioma}
    \newcommand{\postulatename}{Postulato}
    \newcommand{\lemmaname}{Lemma}
    \newcommand{\propositionname}{Proposizione}
    \newcommand{\corollaryname}{Corollario}
    \newcommand{\examplename}{Esempio}
    \newcommand{\exercisename}{Esercizio}
    \newcommand{\remarkname}{Osservazione}
    \newcommand{\assumptionname}{Assunzione}
    \newcommand{\conclusionname}{Conclusione}
    \newcommand{\solutionname}{Soluzione}
    \newcommand{\propertyname}{Proprietà}
    \newcommand{\introductionname}{Introduzione}
    \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
    \newcommand{\updatename}{Aggiornamenti:}
    \newcommand{\ebibname}{Bibliografia}
    \newcommand{\historyname}{Cronologia delle versioni}
}{\relax}
\RequirePackage{csquotes}

\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{tikz} %% load tikz without tikz
\usetikzlibrary{backgrounds,calc,shadows,positioning,fit}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
    \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
%  https://tex.stackexchange.com/questions/7032/good-way-to-make-textcircled-numbers

\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=structurecolor,draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=structurecolor,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=structurecolor,draw=none] circle (2pt);}
\setlist[enumerate,1]{label=\color{structurecolor}\arabic*.}
\setlist[enumerate,2]{label=\color{structurecolor}(\alph*).}
\setlist[enumerate,3]{label=\color{structurecolor}\Roman*.}
\setlist[enumerate,4]{label=\color{structurecolor}\Alph*.}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

\RequirePackage{apptools}

% appendix chapter:

\newcommand{\xchaptertitle}{\chaptername~\thechapter~}

\setcounter{secnumdepth}{5}
\titleformat{\chapter}[\style]{\bfseries}{
    \filcenter\LARGE\enspace\bfseries{\color{structurecolor} \IfAppendix{\appendixname\;\thechapter\;}{\xchaptertitle\;}}}{1pt}{
    \LARGE\bfseries\color{structurecolor}\filcenter}[]
\titleformat{\section}[hang]{\bfseries}{
    \Large    \bfseries{\color{structurecolor}\thesection}\enspace}{1pt}{%
    \color{structurecolor}\Large\bfseries\filright}
\titleformat{\subsection}[hang]{\bfseries}{
    \large\bfseries\color{structurecolor}\thesubsection\enspace}{1pt}{%
    \color{structurecolor}\large\bfseries\filright}
\titleformat{\subsubsection}[hang]{\bfseries}{
    \large\bfseries\color{structurecolor}\thesubsubsection\enspace}{1pt}{%
    \color{structurecolor}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}



%%define the
%%definition theorem postulate axiom corollary lemma proposition
%%and proof environment
\RequirePackage{pifont,manfnt,bbding}
\RequirePackage[most]{tcolorbox}
% \newlength{\normalparindent}
% \setlength{\normalparindent}{\parindent}
\ifdefstring{\ELEGANT@mode}{fancy}{
    \tcbset{
        common/.style={
            fontupper=\small\sffamily,
            lower separated=false,
            % before upper={\setlength{\parindent}{\normalparindent}},
            coltitle=white,
            colback=gray!5,
            boxrule=0.5pt,
            fonttitle=\sffamily,
            enhanced,
            breakable,
            top=8pt,
            before skip=8pt,
            attach boxed title to top left={
                yshift=-0.11in,
                xshift=0.15in},
            boxed title style={
                boxrule=0pt,
                colframe=white,
                arc=1pt,
                outer arc=0pt},
            separator sign={.},
        },
        defstyle/.style={
            common,
            colframe=mediumseagreen,
            colback=mediumseagreen!5,
            colbacktitle=mediumseagreen,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {\textcolor{mediumseagreen}{\qed}};}
        },
        thmstyle/.style={
            common,
            colframe=chocolate,
            colback=chocolate!5,
            colbacktitle=chocolate,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {\textcolor{chocolate}{\qed}};}
        },
        prostyle/.style={
            common,
            colframe=limegreen,
            colback=limegreen!5,
            colbacktitle=limegreen,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {\textcolor{limegreen}{\qed}};}
        },
        propertystyle/.style={
            common,
            colframe=indianred,
            colback=indianred!5,
            colbacktitle=indianred,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0)
                    {\textcolor{indianred}{\qed}};}
        },
        lemmastyle/.style={
            common,
            colframe=cadetblue,
            colback=cadetblue!5,
            colbacktitle=cadetblue,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {\textcolor{cadetblue}{\qed}};}
        },
        problemstyle/.style={
            common,
            colframe=purpleheart,
            colback=purpleheart!5,
            colbacktitle=purpleheart,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
                    \textcolor{purpleheart}{\qed}};}
        },
        corollarystyle/.style={
            common,
            colframe=steelblue,
            colback=steelblue!5,
            colbacktitle=steelblue,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {\textcolor{steelblue}{\qed}};}
        },
        proofstyle/.style={
            common,
            colframe=olive,
            colback=olive!5,
            colbacktitle=olive,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {\textcolor{olive}{\qed}};}
        },
        common2/.style={
            leftrule = 2mm,
            toprule = -0.1mm,
            bottomrule = -0.1mm,
            rightrule= -0.1mm,
            top=4pt,
            bottom=4pt,
            before skip=5pt,
            arc=0.5pt, outer arc = 0pt,
            lower separated=false,
            fontupper=\small\sffamily,
            fonttitle=\small\sffamily,
            attach boxed title to top right= {yshift=-2.5mm, yshifttext=-1.5mm, xshift=-0.5cm},
        },
        remarkstyle/.style={
            common2,
            colframe=darkteal!90,
            colback=lightgrey!60,
            breakable,enhanced,
            coltitle=darkteal,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {\textcolor{darkteal!90}{\qed}};},
            boxed title style={
                colback=lightgrey!60,
                colframe = darkteal,
                arc=0pt, outer arc = 0pt,
                size = small
            },
            title = \remarkname
        },
        exerstyle/.style={
            common2,
            colframe=rosybrown,
            colback=lightgrey!60,
            breakable,enhanced,
            coltitle=rosybrown,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {\textcolor{rosybrown}{\qed}};},
            boxed title style={
                colback=lightgrey!60,
                colframe=rosybrown,
                arc=0pt, outer arc = 0pt,
                size = small
            },
            title = \exercisename
        },
        examstyle/.style={
            common2,
            colframe=burlywood,
            colback=lightgrey!60,
            breakable,enhanced,
            coltitle=burlywood,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {\textcolor{burlywood}{\qed}};},
            boxed title style={
                colback=lightgrey!60,
                colframe=burlywood,
                arc=0pt, outer arc = 0pt,
                size = small
            },
            title = \examplename
        },
        notestyle/.style={
            common2,
            colframe=burlywood,
            colback=lightgrey!60,
            breakable,enhanced,
            coltitle=burlywood,
            overlay unbroken and last={
                \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {\textcolor{burlywood}{\qed}};},
            boxed title style={
                colback=lightgrey!60,
                colframe=burlywood,
                arc=0pt, outer arc = 0pt,
                size = small
            },
            title = \notename
        },
        ELEGANT@title/.code n args={2}{
            \ifblank{#2}
            {\tcbset{title={\csname #1name\endcsname~\thetcbcounter}}}
            {\tcbset{title={\csname #1name\endcsname~\thetcbcounter\ (#2)}}}
        },
        ELEGANT@label/.code n args={2}{
            \ifblank{#2}{}{\tcbset{label={#1:#2}}}
        }
    }

    % define an internal control sequence \ELEGANT@newtheorem for fancy mode's newtheorem
    % #1 is the environment name, #2 is the prefix of label, #3 is the style
    % style: thmstyle, defstyle, prostyle
    % e.g. \ELEGANT@newtheorem{theorem}{thm}{thmstyle}
    % will define two environments: numbered ``theorem'' and no-numbered ``theorem*''
    % WARNING FOR MULTILINGUAL: this cs will automatically find \theoremname's definition,
    % WARNING FOR MULTILINGUAL: it should be defined in language settings.
    \newcommand{\ELEGANT@newtheorem}[3]{
        \ifcsundef{#1name}{%
            \ClassError{elegantbook}{%
                \ #1name undefined, \MessageBreak
                Please check in language setting
            }{}
        }{\relax}
        \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{#1}{ g o t\label g }{
            common,#3,
            IfValueTF={##1}
                {ELEGANT@title={#1}{##1}}
                {
                IfValueTF={##2}
                    {ELEGANT@title={#1}{##2}}
                    {ELEGANT@title={#1}{}}
            },
            IfValueT={##4}
                {
                IfBooleanTF={##3}
                    {label={##4}}
                    {ELEGANT@label={#2}{##4}}
            }
        }
        \DeclareTColorBox{#1*}{ g o }{
            common,#3,
            IfValueTF={##1}
                {ELEGANT@title={#1}{##1}}
                {
                IfValueTF={##2}
                    {ELEGANT@title={#1}{##2}}
                    {ELEGANT@title={#1}{}}
            },
        }
    }

    % define several environment
    % we define headers like \definitionname before
    \ELEGANT@newtheorem{definition}{def}{defstyle}
    \ELEGANT@newtheorem{theorem}{thm}{thmstyle}
    \ELEGANT@newtheorem{postulate}{pos}{thmstyle}
    \ELEGANT@newtheorem{problem}{prob}{problemstyle}
    \ELEGANT@newtheorem{axiom}{axi}{thmstyle}
    \ELEGANT@newtheorem{corollary}{cor}{corollarystyle}
    \ELEGANT@newtheorem{lemma}{lem}{lemmastyle}
    \ELEGANT@newtheorem{proposition}{pro}{prostyle}
    \ELEGANT@newtheorem{property}{prop}{propertystyle}
    \ELEGANT@newtheorem{proof}{proof}{proofstyle}
    \ELEGANT@newtheorem{remark}{remark}{remarkstyle}
    \ELEGANT@newtheorem{example}{exam}{examstyle}
    \ELEGANT@newtheorem{exercise}{exer}{exerstyle}
    \ELEGANT@newtheorem{note}{note}{examstyle}
}{\relax}

% define an user control sequence \elegantnewtheorem
% #1 is the evironment, #2 is the theorem header
% #3 is the style       #4 is the prefix for fancy mode
% style: thmstyle, defstyle, prostyle
% if #4 is given in simple mode, an error will be raised
% if #4 isn't given in fancy mode, the prefix will be set equal to #1,
%   and a warning will be raised
\newcommand{\ELEGANT@newtheorem@warning}{}
\newcommand{\ELEGANT@newtheorem@error}{}
\NewDocumentCommand\elegantnewtheorem{ m m m g }
{
    \renewcommand{\ELEGANT@newtheorem@warning}{
        \ClassWarning{elegantbook}{%
            Because you didn't provide a prefix. \MessageBreak
            We use #1 as the default prefix. \MessageBreak
            You have to use \MessageBreak
            \ref{#1:label} to refer a \MessageBreak
            \begin{#1}{name}{label} environment. \MessageBreak
        }
    }
    \renewcommand{\ELEGANT@newtheorem@error}{
        \ClassError{elegantbook}{%
            You can't set a prefix in mode ``simple''.\MessageBreak
            Just use \MessageBreak
            \elegantnewtheorem{#1}{#2}{#3}
        }{%
            We are using ``amsthm'' package to \MessageBreak
            generate theorem-like theorem. \MessageBreak
            The 4th parameter ``prefix'' isn't allowed.
        }
    }
    \expandafter\def\csname #1name\endcsname{#2}
    \ifdefstring{\ELEGANT@mode}{fancy}{%
        \IfValueTF{#4}
        {
            \def\ELEGANT@temp@prefix{#4}
            \ifdefempty{\ELEGANT@temp@prefix}
            {
                \ELEGANT@newtheorem{#1}{#1}{#3}
                \ELEGANT@newtheorem@warning
            }
            {\ELEGANT@newtheorem{#1}{#4}{#3}}
        }
        {
            \ELEGANT@newtheorem{#1}{#1}{#3}
            \ELEGANT@newtheorem@warning
        }
    }{\relax}
}


% custom assumption environment
\newenvironment{assumption}[1][]{\par\noindent\textbf{\color{darkteal}{\assumptionname:\space{#1}}}\newline\sffamily}{\par}

%\newenvironment{custom}[1]{\par\noindent\textbf{\color{third} #1} }{\par}

\RequirePackage{multicol}
\tcbset{
    introductionsty/.style={
        enhanced,
        breakable,
        colback=structurecolor!10,
        colframe=structurecolor,
        fonttitle=\bfseries,
        colbacktitle=structurecolor,
        fontupper=,
        attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
        boxrule=0pt,
        toprule=0.5pt,
        bottomrule=0.5pt,
        top=8pt,
        before skip=8pt,
        sharp corners
    },
}


\newenvironment{introduction}[1][\introductionname]{
    \begin{tcolorbox}[introductionsty,title={#1}]
        \begin{multicols}{2}
            \begin{itemize}[label=\textcolor{structurecolor}{\upshape\scriptsize\SquareShadowBottomRight}]}{
            \end{itemize}
        \end{multicols}
    \end{tcolorbox}}

\RequirePackage{adforn}

\newenvironment{problemset}[1][\xchaptertitle~\exercisename]{
    \vspace*{10pt}
    \begin{center}
        \phantomsection\addcontentsline{toc}{section}{\texorpdfstring{\xchaptertitle~\exercisename}{\exercisename}}
        % \markboth{#1}{\rightmark}
        \markright{#1}
        \textcolor{structurecolor}{\Large\bfseries\adftripleflourishleft~#1~\adftripleflourishright}
    \end{center}
    \begin{enumerate}}{
    \end{enumerate}}

\def\relsec{\endgroup start}
\def\endrelsec{end\begingroup\def \@currenvir {relsec}}

\RequirePackage{fancyhdr}
\fancyhf{}


\fancyfoot[c]{\color{structurecolor}\small\thepage}
\if@twoside
\fancyhead[EL]{\color{structurecolor}\leftmark}
\fancyhead[OR]{\color{structurecolor}\rightmark}
\else
\fancyhead[R]{\color{structurecolor}\rightmark}
\fi

\renewcommand{\headrule}{\color{structurecolor}\hrule width\textwidth}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{1pt}
% \renewcommand{\headrule}{}
\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\, #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{\xchaptertitle\, #1}{}}


\renewcommand*{\maketitle}{%
    \hypersetup{pageanchor=false}
    \pagenumbering{Alph}
    \begin{titlepage}
        \newgeometry{margin = 0in}
        \parindent=0pt
        \ifdefstring{\ELEGANT@device}{normal}{
            \ifcsname @cover\endcsname
            \includegraphics[width=\linewidth]{\@cover}
            \else
            \includegraphics[width=\linewidth]{example-image}
            \fi
        }{\relax}
        \ifdefstring{\ELEGANT@device}{pad}{
            \ifcsname @cover\endcsname
            \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{\@cover}
            \else
            \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{example-image}
            \fi
        }{\relax}
        \setlength{\fboxsep}{0pt}
        % coverlinecolor
        \colorbox{coverlinecolor}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
        \vfill
        \vskip-2ex
        \hspace{2em}
        \parbox{0.8\textwidth}{
            \bfseries\Huge
            \ifcsname @title\endcsname \@title \fi
            \par}
        \vfill
        \vspace{-1.0cm}
        \setstretch{2.5}
        \hspace{2.5em}
        \begin{minipage}[c]{0.67\linewidth}
        {\color{darkgray}\bfseries\Large
        \ifcsname @subtitle\endcsname\@subtitle\\[2ex]\fi}
            \color{gray}\normalsize
            {\renewcommand{\arraystretch}{0.618}
                \begin{tabular}{l}
                    % \ifcsname @author\endcsname \authorname \@author\\\fi
                    \ifx\@author\empty\else\authorname\@author\\ \fi
                    \ifcsname @institute\endcsname \institutename \@institute\\ \fi
                    % \ifcsname @date\endcsname  \@date\\\fi
                    \ifx\@date\empty\else\datename\@date \\ \fi
                    \ifcsname @version\endcsname \versionname\@version\\ \fi
                    \ifcsname @bioinfo\endcsname \@bioinfo\\ \fi
                \end{tabular}}
        \end{minipage}
        \begin{minipage}[c]{0.27\linewidth}
            \begin{tikzpicture}[remember picture,overlay]
                \begin{pgfonlayer}{background}
                    \node[opacity=0.8,
                        anchor=south east,
                        outer sep=0pt,
                        inner sep=0pt] at ($(current page.south east) +(-0.8in,1.5in)$) {
                        \ifcsname @logo\endcsname\includegraphics[width=4.2cm]{\@logo}\fi};
                \end{pgfonlayer}
            \end{tikzpicture}
        \end{minipage}
        \vfill
        \begin{center}
            \setstretch{1.3}
            \parbox[t]{0.7\textwidth}{\centering
            \ifcsname @extrainfo\endcsname\@extrainfo\fi}
        \end{center}
        \vfill
    \end{titlepage}
    \restoregeometry
    \thispagestyle{empty}}


\newcommand{\dollar}{\mbox{\textdollar}}

\RequirePackage{listings}
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
    basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle,breaklines=true}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
    texcsstyle=*\color{steelblue},
    numbers=none,
    mathescape=false,
    breaklines=true,
    keywordstyle=\color{steelblue},
    commentstyle=\color{gray},
    emph={elegantpaper,fontenc,fontspec,xeCJK,citestyle,FiraMono,xunicode,figure,fig,image,img,table,itemize,enumerate,ctex,microtype,description,times,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm,tcolorbox,titlestyle,cite,ctex,listings,base,math,scheme,toc,esint,chinesefont,amsmath,bibstyle,natbib,pgfornament},
    emphstyle={\color{frenchplum}},
    morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,extrainfo,logo,cover,subtitle,appendix,chapter,section,hypersetup,mainmatter,frontmatter,tableofcontents,elegantpar,lstset,pagecolor,zhnumber,marginpar,part,equote,marginnote,bioinfo,datechange,listofchange,lvert,lastpage,songti,setCJKfamilyfont,textbf,elegantnewtheorem,thmcnt,colorlet},
    frame=single,
    tabsize=2,
    rulecolor=\color{structurecolor},
    framerule=0.2pt,
    columns=flexible,
    backgroundcolor=\color{lightgrey}
}

\newcommand\bmmax{0}
\RequirePackage{bm}

% add the list of change history
\newcommand{\dateinfoline}[2]{
    \noindent\makebox[0pt][r]{%
        \makebox[-3em][r]{%
            \small
            \textbf{\textcolor{structurecolor}{#1}}}\;\;}%
    {\updatename\ignorespaces#2}}

\newcommand{\datechange}[2]{%
    \noindent{\makebox[\textwidth][r]{\color{structurecolor}\rule{1.15\textwidth}{.4pt}}}
    \dateinfoline{#1}{#2}
    \addcontentsline{dates}{section}{#1 -- #2}}

\newcommand{\listofchanges}{%
    \begingroup
    \renewcommand{\contentsname}{\historyname}
    \let\old@starttoc\@starttoc
    \def\@starttoc##1{
        \old@starttoc{dates}}
    \tableofcontents%
    \endgroup}
% https://tex.stackexchange.com/questions/472931/list-of-all-dates-in-a-document

\newenvironment{change}{
    \begin{enumerate}[label=\small\protect\circled{\arabic*}]}{
    \end{enumerate}}



\renewcommand\tableofcontents{%
    \hypersetup{linktoc=all, linkcolor=black}
    \if@twocolumn
    \@restonecoltrue\onecolumn
    \else
    \@restonecolfalse
    \fi
    \chapter*{\contentsname
    \@mkboth{%
        \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \ifdefstring{\ELEGANT@toc}{twocol}{
        \setlength{\columnsep}{2em}
        \begin{multicols}{2}%
            \@starttoc{toc}
        \end{multicols}}{
        \@starttoc{toc}}
    \if@restonecol\twocolumn\fi
    \hypersetup{linkcolor=steelblue}}


\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}%
\thispagestyle{empty}%
beforechap\newpage%
\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% https://tex.stackexchange.com/questions/56839/chaptername-is-used-even-for-appendix-chapters-in-toc
\RequirePackage{calc}
\RequirePackage[titles]{tocloft}
\renewcommand{\cftchappresnum}{\chaptername\space}
\renewcommand{\cftchapaftersnum}{\space}
\setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~9}}}
\g@addto@macro\appendix{%
    \addtocontents{toc}{%
        \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
        \protect\renewcommand{\protect\cftchapaftersnum}{}%
        \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~999}}}
    }%
}


% restore the tt default family to lmodern tt family
\renewcommand\ttdefault{lmtt}
\usepackage{algorithm}% http://ctan.org/pkg/algorithms
\usepackage{algpseudocode}% http://ctan.org/pkg/algorithmicx
\usepackage{float}
\usepackage{pgfplots}\pgfplotsset{compat = newest}
\usepackage{tgadventor}
\usepackage[nospace]{varioref}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[italian]{cleveref}
\crefname{tcb@cnt@problem}{prob.}{probs.}
\Crefname{tcb@cnt@problem}{Prob.}{Probs.}
\crefname{tcb@cnt@lemma}{lemma}{lemmi}
\Crefname{tcb@cnt@lemma}{Lemma}{lemmi}
\crefname{tcb@cnt@property}{prop.}{props.}
\Crefname{tcb@cnt@property}{Prop.}{Props.}
\crefname{tcb@cnt@definition}{def.}{defs.}
\Crefname{tcb@cnt@definition}{Def.}{Defs.}
\crefname{tcb@cnt@theorem}{thm.}{thms.}
\Crefname{tcb@cnt@theorem}{Thm.}{Thms.}
\crefname{tcb@cnt@proposition}{prop.}{props.}
\Crefname{tcb@cnt@proposition}{Prop.}{Props.}
\crefname{tcb@cnt@corollary}{cor.}{cors}
\Crefname{tcb@cnt@corollary}{Cor.}{Cors.}
% ------ TOC customizations --------------------------------
\contentsmargin{0cm}
\titlecontents{chapter} % Section type being modified
[1.25cm] % Left indentation
{\addvspace{12pt}\large\sffamily\bfseries\hypersetup{linkcolor=structurecolor}} % Before code
{\color{structurecolor}\contentslabel[\Large\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
{} % Formatting of numberless sections of this type
{\color{structurecolor!60}\normalsize\;\titlerule*[6pt]{.}\;\color{structurecolor}\thecontentspage} % Formatting of the filler to the right of the heading and the page number
[] % After code

\titlecontents{section} % Section type being modified
[1.25cm] % Left indentation
{\addvspace{3pt}\sffamily\bfseries} % Before code
{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
{} % Formatting of numberless sections of this type
{~{\normalfont\titlerule*[6pt]{.}}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
[] % After code

%------------------------------------------------

\titlecontents{subsection} % Section type being modified
[1.25cm] % Left indentation
{\addvspace{1pt}\sffamily\small} % Before code
{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
{} % Formatting of numberless sections of this type
{~\titlerule*[6pt]{.}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
[] % After code

%------------------------------------------------

\titlecontents{subsubsection} % Section type being modified
[1.75cm] % Left indentation
{\sffamily\small} % Before code
{\contentslabel[\thecontentslabel]{1.75cm}} % Formatting of numbered sections of this type
{} % Formatting of numberless sections of this type
{~\titlerule*[6pt]{.}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
[] % After code

\titlecontents{lsection} % Section headings on part pages
[0cm] % Left indentation
{\sffamily\small} % Before code
{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
{} % Formatting of numberless sections of this type
{~{\normalfont\titlerule*[6pt]{.}}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number

\titlecontents{lsubsection} % Subsection headings on part pages
[0cm] % Left indentation
{\sffamily\footnotesize} % Before code
{\contentslabel[\thecontentslabel]{1.25cm}\hspace{0.5cm}} % Formatting of numbered sections of this type
{} % Formatting of numberless sections of this type
{~{\normalfont\titlerule*[6pt]{.}}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
% ------ custom command file imports --------------------------------
\input{mycmd.tex}

% ----- setup base property -------
\author{Andrea Efficace\quad(\url{https://github.com/Effibot})}
\date{\today}
\bibliography{reference.bib}
