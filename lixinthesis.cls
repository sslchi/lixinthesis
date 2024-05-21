%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LIXIN Template
%% copyright (c) Guanjie Wang, <wangguanjie0@126.com>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{lixinthesis}[2024/05/13 v1.0 LIXIN G. Wang]

%将选项传给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}

% terminates the option processing 结束option进程
\ProcessOptions\relax

\LoadClass[a4paper,UTF8,zihao=-4]{ctexart}

\setmainfont{Times New Roman}
%\newCJKfontfamily\LIXINkaishu{simkai.ttf}[AutoFakeBold]
%\newCJKfontfamily\LIXINsongti{simsun.ttc}[AutoFakeBold]
%\newCJKfontfamily\LIXINtimes{times.ttf}[AutoFakeBold]

\newcommand{\LIXINkaishu}{\kaishu}
\newcommand{\LIXINsongti}{\songti}
\newcommand{\LIXINtimes}{\rmfamily}

\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,amsthm}
\RequirePackage{graphicx,color,CJKfntef,geometry,fancyhdr}
\RequirePackage[super,square,comma,sort&compress]{natbib} 

\RequirePackage{hyperref,titletoc,setspace}

%% 设置默认值
\def\value@cnabstract{摘\hspace{\ccwd}要}
\def\value@enabstract{Abstract}
\def\value@cnkeywords{\bfseries\LIXINsongti 关键词:}
\def\value@enkeywords{\bfseries\LIXINtimes Key words:~}
\def\value@thanks{致\hspace{\ccwd}谢}
\def\value@appendix{附\hspace{\ccwd}录}
\renewcommand{\figurename}{\songti\zihao{-4} 图}
\renewcommand{\tablename}{\songti\zihao{-4} 表}

\def\value@cntitle{（论~文~题~目）}
\def\value@entitle{(English title)}

\def\value@IDnumber{编号}
\def\value@cnauthor{（作~者~姓~名）}
\def\value@cnschool{信息科学与技术学院}
\def\value@cnmajor{专业（二级学科）}
\def\value@cnclass{班级}
\def\value@cnadvisor{指导老师}
\def\value@cnsubmityear{\the\year{}}
\def\value@cnsubmitmonth{\the\month{}}
\def\value@cnsubmitday{\the\day{}}


% 自定义宏命令，不需要可删除，也可自行添加需要的宏命令
\theoremstyle{plain}

\newtheorem{example}{例}[section]
\newtheorem{theorem}{定理}[section]
\newtheorem{remark}{注}[section]
\newtheorem{lemma}[theorem]{引理~}
\theoremstyle{definition}
\newtheorem{definition}{定义}[section]
\renewcommand{\proofname}{\bfseries 证明}


%\newtheorem*{proof}{证明}

%% 全局设置
\graphicspath{{pic/}}
\setlength{\parskip}{0pt}  % 段间距
\linespread{1.625}         % 行距，1.625对应word中的1.5倍行距。1.5*1.3/1.2=1.625
\hypersetup{colorlinks=true,linkcolor=black,citecolor={black}}

%% 小注用带圈字母
\RequirePackage{xpatch}
\renewcommand{\thefootnote}{\textcircled{\zihao{-6}\arabic{footnote}}}
\xpatchcmd\@makefntext
{{\hss\@makefnmark}}
{{\hss\@makefnmark@nosuperscript}\space}
{}{\fail}
\def\@makefnmark@nosuperscript{\lower -.3ex \hbox{\normalfont\@thefnmark}}
\let\lixin@footnotesize\footnotesize
\renewcommand\footnotesize{\lixin@footnotesize\zihao{-5}\linespread{1.625}}


% 页面设置
\geometry{a4paper,hcentering,ignoreall,nomarginpar}
\geometry{left=30mm,right=20mm,top=25mm,bottom=25mm,bindingoffset=0mm,%
	headheight=5mm,headsep=3mm,textheight=237mm,footskip=6mm}


%% 前文、正文、后文设置
\newcommand{\frontmatter}{\clearpage\pagenumbering{Roman}
	\ctexset{%
		section/name={,、},
		section/aftername = {},
		section/indent={28pt},
		section/number=\chinese{section},
		section/format = {\zihao{-3}},
		section/beforeskip = 15pt,
		section/afterskip = 7.5pt,
		subsection/name = {,},
		subsection/aftername = {},
		subsection/indent={28pt},
		subsection/number={（\chinese{subsection}）},
		subsection/format = {\heiti\zihao{-3}},
		subsection/beforeskip = 15pt,
		subsection/afterskip = 7.5pt,
		subsubsection/aftername = {},
		subsubsection/number={\arabic{subsubsection}.},
		subsubsection/format = {\heiti\zihao{4}},
		subsubsection/beforeskip = 0pt,
		subsubsection/afterskip = 0pt,
		subsubsection/indent={28pt},
		paragraph/aftername = {},
		paragraph/number={（\arabic{paragraph}）},
		paragraph/indent={28pt},
		paragraph/format = {\songti\zihao{-4}},
		paragraph/beforeskip = 0pt,
		paragraph/afterskip = 0pt,
		paragraph/runin=false,
	}	
}

\newcommand{\mainmatter}{\clearpage\pagenumbering{arabic}\setcounter{page}{1}
\ctexset{%
	section/name={,、},
	section/aftername = {},
	section/indent={28pt},
	section/number=\chinese{section},
	section/format = {\heiti\zihao{-3}},
	section/beforeskip = 15pt,
	section/afterskip = 7.5pt,
	subsection/name = {,},
	subsection/aftername = {},
	subsection/indent={28pt},
	subsection/number={（\chinese{subsection}）},
	subsection/format = {\heiti\zihao{-3}},
	subsection/beforeskip = 15pt,
	subsection/afterskip = 7.5pt,
	subsubsection/aftername = {},
	subsubsection/number={\arabic{subsubsection}.},
	subsubsection/format = {\heiti\zihao{4}},
	subsubsection/beforeskip = 0pt,
	subsubsection/afterskip = 0pt,
	subsubsection/indent={28pt},
	paragraph/aftername = {},
	paragraph/number={（\arabic{paragraph}）},
	paragraph/indent={28pt},
	paragraph/format = {\songti\zihao{-4}},
	paragraph/beforeskip = 0pt,
	paragraph/afterskip = 0pt,
	paragraph/runin=false,
	}
}

\newcommand{\backmatter}{\clearpage
	\ctexset{%
		section/name={,、},
		section/aftername = {},
		section/indent={28pt},
		section/number=\chinese{section},
		section/format = {\centering\heiti\zihao{-3}},
		section/beforeskip = 15pt,
		section/afterskip = 7.5pt,
		subsection/name = {,},
		subsection/aftername = {},
		subsection/indent={28pt},
		subsection/number={（\chinese{subsection}）},
		subsection/format = {\heiti\zihao{-3}},
		subsection/beforeskip = 15pt,
		subsection/afterskip = 7.5pt,
		subsubsection/aftername = {},
		subsubsection/number={\arabic{subsubsection}.},
		subsubsection/format = {\heiti\zihao{4}},
		subsubsection/beforeskip = 0pt,
		subsubsection/afterskip = 0pt,
		subsubsection/indent={28pt},
		paragraph/aftername = {},
		paragraph/number={（\arabic{paragraph}）},
		paragraph/indent={28pt},
		paragraph/format = {\songti\zihao{-4}},
		paragraph/beforeskip = 0pt,
		paragraph/afterskip = 0pt,
		paragraph/runin=false,
	}
}


%%% 设置参考文献、目录
\setlength{\bibsep}{0cm}
\let\lixnbibliography\bibliography
\renewcommand{\bibliography}[1]{
\begin{spacing}{1.625}
	\lixnbibliography{book,journal}%
\end{spacing}
\addcontentsline{toc}{section}{参考文献}
}

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{4}

\contentsmargin{0.5em}
\titlecontents{section}
[0ex]
{\zihao{-4}\songti}
{\thecontentslabel}
{}
{\titlerule*[0.5pc]{$\cdot$}\contentspage}
[\addvspace{0pt}]%

\titlecontents{subsection}
[0ex]
{\zihao{-4}\songti}
{\thecontentslabel}
{}
{\titlerule*[0.5pc]{$\cdot$}\contentspage}
[\addvspace{0pt}]%
 
\let\mytableofcontents\tableofcontents

\renewcommand{\tableofcontents}{\clearpage\nointerlineskip\vspace*{-20pt}
	{\begin{spacing}{1.625}\mytableofcontents\end{spacing}}}
\renewcommand{\contentsname}{\heiti\zihao{-3}\centerline{目\hspace*{\ccwd}录}}
\renewcommand{\refname}{\heiti\zihao{-3}\centerline{参考文献}}


% define title and author   定义中英文title和author
\renewcommand{\title}[1]{\def\value@cntitle{#1}}
\newcommand{\englishtitle}[1]{\def\value@entitle{#1}}

% 作者  信息
\newcommand{\IDnumber}[1]{\def\value@IDnumber{#1}}
\renewcommand{\author}[1]{\def\value@cnauthor{#1}}
\newcommand{\school}[1]{\def\value@cnschool{#1}}
\newcommand{\major}[1]{\def\value@cnmajor{#1}}
\newcommand{\class}[1]{\def\value@cnclass{#1}}
\newcommand{\advisor}[1]{\def\value@cnadvisor{#1}}
\newcommand{\submityear}[1]{\def\value@cnsubmityear{#1}}
\newcommand{\submitmonth}[1]{\def\value@cnsubmitmonth{#1}}
\newcommand{\submitday}[1]{\def\value@cnsubmitday{#1}}



% 定义下划线的长度级线上内容
\providecommand{\CJKunderlinecolor}{\color{black}}
\def\LIXIN@underline[#1]#2{%
	\CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\LIXINunderline{\@ifnextchar[\LIXIN@underline\CJKunderline}



\renewcommand{\maketitle}{
	\cleardoublepage
	\thispagestyle{empty}
	\begin{center}
			$\,$
				
				\vspace{0.8cm}
				
				\includegraphics[width=11.62cm]{lixinlogo.jpg}  
				
				\vspace{0.6cm}
	
				{\noindent\heiti\zihao{-0}\selectfont \value@cnsubmityear 届本科毕业论文（设计）}
				{\linespread{1.25}\selectfont
					\bfseries\LIXINkaishu\zihao{2} \value@cntitle\par}
				
				{\linespread{1.25}\selectfont
					\bfseries\rmfamily\zihao{2}\selectfont \value@entitle\\}
				
				\quad\\
				
				\vfill
				{\zihao{3}\bfseries\LIXINsongti
					\begin{flushright}
					\begin{tabular}{rl}
						{\bfseries\LIXINkaishu \raisebox{0.2cm}{学\hspace{2\ccwd}号：}}&\LIXINunderline[280pt]{\raisebox{0.2cm}{\bfseries\LIXINtimes\value@IDnumber}}\\ [5mm]
						\bfseries\LIXINkaishu \raisebox{0.2cm}{学生姓名：}&\LIXINunderline[280pt]{\makebox[8.5cm]{\raisebox{0.2cm}{\value@cnauthor}}}\\ [5mm]
						\bfseries\LIXINkaishu \raisebox{0.2cm}{所在学院：}&\LIXINunderline[280pt]{\raisebox{0.2cm}{\value@cnschool}}\\ [5mm]
						\bfseries\LIXINkaishu \raisebox{0.2cm}{专\hspace{2\ccwd}业：}&\LIXINunderline[280pt]{\raisebox{0.2cm}{\value@cnmajor}}\\ [5mm]
						\bfseries\LIXINkaishu \raisebox{0.2cm}{班\hspace{2\ccwd}级：}&\LIXINunderline[280pt]{\raisebox{0.2cm}{\value@cnclass}}\\ [5mm]
						\bfseries\LIXINkaishu \raisebox{0.2cm}{指导老师：}&\LIXINunderline[280pt]{\raisebox{0.2cm}{\value@cnadvisor}}\\ [5mm]
					\end{tabular}
				\end{flushright}
			
				\vfill
					\begin{center}
						{\zihao{-2}\bfseries\LIXINsongti\value@cnsubmityear 年\value@cnsubmitmonth 月}
					\end{center}
				}
	\end{center}
}




%设置页眉页脚
\setlength{\headsep}{22pt}
\fancypagestyle{plain}{%
	\fancyhf{}%
%	\renewcommand{\headrulewidth}{0pt}%
%	\renewcommand{\footrulewidth}{0pt}%
	\fancyhead[C]{\linespread{1.625}\selectfont\zihao{5}\selectfont 上海立信会计金融学院普通本科生毕业论文（设计）}
	\fancyfoot[C]{\small ~\thepage~}
}

\fancypagestyle{empty}{%
	\fancyhf{}%
		\renewcommand{\headrulewidth}{0pt}%
		\renewcommand{\footrulewidth}{0pt}%
}




\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\linespread{1.625}\selectfont\zihao{5}\selectfont 上海立信会计金融学院普通本科生毕业论文（设计）}
\fancyfoot[C]{\small ~\thepage~}


\renewenvironment{abstract}{\clearpage{\centering\section*{\hspace*{-28pt}\heiti\value@cnabstract}}}{}

\newcommand\keywords[1]{%
	\vspace{2ex}\noindent{\value@cnkeywords} #1}


\newenvironment{englishabstract}{\clearpage{\centering\section*{\hspace*{-28pt}\rmfamily\value@enabstract}}}{}

\newcommand\englishkeywords[1]{%
	\vspace{2ex}\noindent{\value@enkeywords} #1}




\renewenvironment{appendix}{\clearpage{\centering\section*{\hspace*{-28pt}\heiti\value@appendix}}}{\addcontentsline{toc}{section}{\value@appendix}}
\renewenvironment{thanks}{\clearpage{\centering\section*{\hspace*{-28pt}\heiti\value@thanks}}}{\addcontentsline{toc}{section}{\value@thanks}}



\endinput
