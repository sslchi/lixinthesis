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

\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,amsthm}
\RequirePackage{graphicx,color,CJKfntef,geometry,fancyhdr}
\RequirePackage[super,square,comma,sort&compress]{natbib} 

\RequirePackage{hyperref,titletoc,setspace}
\RequirePackage{fontspec,ifplatform}
\RequirePackage{caption}

%% 全局设置
\graphicspath{{pic/}}
\setlength{\parskip}{0pt}  % 段间距
\linespread{1.625}         % 行距，1.625对应word中的1.5倍行距。1.5*1.3/1.2=1.625
\hypersetup{colorlinks=true,linkcolor=black,citecolor={black}}


%% 判断有无所需字体，有则使用，无则使用平台默认字体
\ifwindows
\setmainfont{times.ttf}[AutoFakeBold]
\setCJKmainfont{simsun.ttc}[AutoFakeBold]

\newfontfamily\digitfont{simhei.ttf}
\newfontfamily\LIXINtimesbd{timesbd.ttf}

\newCJKfontfamily\LIXINsongti{simsun.ttc}[AutoFakeBold]
\newCJKfontfamily\LIXINkaishu{simkai.ttf}[AutoFakeBold]
\newCJKfontfamily\LIXINheiti{simhei.ttf}[AutoFakeBold]
\newfontfamily\LIXINtimes{times.ttf}[AutoFakeBold]

\else
\IfFontExistsTF{simsun.ttc}
{
\newCJKfontfamily\LIXINsongti{simsun.ttc}[AutoFakeBold]
\setCJKmainfont{simsun.ttc}[AutoFakeBold]
}
{
\newcommand{\LIXINsongti}{\songti}
}

\IfFontExistsTF{times.ttf}
{
\setmainfont{times.ttf}[AutoFakeBold]
\newfontfamily\LIXINtimes{times.ttf}[AutoFakeBold]
}
{
\setmainfont{Times New Roman}
\newCJKfontfamily\LIXINtimes{Times New Roman}[AutoFakeBold]
}

\IfFontExistsTF{simkai.ttf}
{
\newCJKfontfamily\LIXINkaishu{simkai.ttf}[AutoFakeBold]
}
{
\newcommand{\LIXINkaishu}{\kaishu}
}

\IfFontExistsTF{simhei.ttf}
{
\newCJKfontfamily\LIXINheiti{simhei.ttf}[AutoFakeBold]
\newfontfamily\digitfont{simhei.ttf}
}
{
\newcommand{\LIXINheiti}{\heiti}
\newcommand{\digitfont}{\bfseries\heiti}
}

\IfFontExistsTF{timesbd.ttf}
{
\newfontfamily\LIXINtimesbd{timesbd.ttf}
}
{
\newcommand{\LIXINtimesbd}{\bfseries\LIXINtimes}
}

\fi

%\setmainfont{times.ttf}[AutoFakeBold]
%\setCJKmainfont{simsun.ttc}[AutoFakeBold]
%\newCJKfontfamily\LIXINsongti{simsun.ttc}[AutoFakeBold]
%\newCJKfontfamily\LIXINkaishu{simkai.ttf}[AutoFakeBold]
%\newCJKfontfamily\LIXINheiti{simhei.ttf}[AutoFakeBold]
%\newCJKfontfamily\LIXINtimes{times.ttf}[AutoFakeBold]

%% 设置默认值
\def\value@cnabstract{摘\hspace{\ccwd}要}
\def\value@enabstract{Abstract}
\def\value@cnkeywords{\bfseries\LIXINsongti 关键词:}
\def\value@enkeywords{\LIXINtimesbd Key words:~}
\def\value@thanks{致\hspace{\ccwd}谢}
\def\value@appendix{附\hspace{\ccwd}录}

\renewcommand{\figurename}{\LIXINsongti 图}
\renewcommand{\tablename}{\LIXINsongti 表}
\DeclareCaptionFont{whao}{\zihao{5}}
\captionsetup[figure]{font=whao}
\captionsetup[table]{font=whao}


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
\def\value@siganture{\begin{tabular}{p{240pt}p{33pt}p{24pt}p{30pt}}
        论文作者签名   &   年  & 月 &  日\\  
    \end{tabular}}








% 自定义宏命令，不需要可删除，也可自行添加需要的宏命令
\theoremstyle{plain}

\newtheorem{example}{例}[section]
\newtheorem{theorem}{定理}[section]
\newtheorem{remark}{注}[section]
\newtheorem{lemma}[theorem]{引理}
\theoremstyle{definition}
\newtheorem{definition}{定义}[section]
\renewcommand{\proofname}{\bfseries 证明}


%\newtheorem*{proof}{证明}



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
		subsection/format = {\LIXINheiti\zihao{-3}},
		subsection/beforeskip = 15pt,
		subsection/afterskip = 7.5pt,
		subsubsection/aftername = {},
		subsubsection/number={\arabic{subsubsection}.},
		subsubsection/format = {\LIXINheiti\zihao{4}},
		subsubsection/beforeskip = 0pt,
		subsubsection/afterskip = 0pt,
		subsubsection/indent={28pt},
		paragraph/aftername = {},
		paragraph/number={（\arabic{paragraph}）},
		paragraph/indent={28pt},
		paragraph/format = {\LIXINsongti\zihao{-4}},
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
	section/format = {\LIXINheiti\zihao{-3}},
	section/beforeskip = 15pt,
	section/afterskip = 7.5pt,
	subsection/name = {,},
	subsection/aftername = {},
	subsection/indent={28pt},
	subsection/number={（\chinese{subsection}）},
	subsection/format = {\LIXINheiti\zihao{-3}},
	subsection/beforeskip = 15pt,
	subsection/afterskip = 7.5pt,
	subsubsection/aftername = {},
	subsubsection/number={\arabic{subsubsection}.},
	subsubsection/format = {\LIXINheiti\zihao{4}},
	subsubsection/beforeskip = 0pt,
	subsubsection/afterskip = 0pt,
	subsubsection/indent={28pt},
	paragraph/aftername = {},
	paragraph/number={（\arabic{paragraph}）},
	paragraph/indent={28pt},
	paragraph/format = {\LIXINsongti\zihao{-4}},
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
		section/format = {\centering\LIXINheiti\zihao{-3}},
		section/beforeskip = 15pt,
		section/afterskip = 7.5pt,
		subsection/name = {,},
		subsection/aftername = {},
		subsection/indent={28pt},
		subsection/number={（\chinese{subsection}）},
		subsection/format = {\LIXINheiti\zihao{-3}},
		subsection/beforeskip = 15pt,
		subsection/afterskip = 7.5pt,
		subsubsection/aftername = {},
		subsubsection/number={\arabic{subsubsection}.},
		subsubsection/format = {\LIXINheiti\zihao{4}},
		subsubsection/beforeskip = 0pt,
		subsubsection/afterskip = 0pt,
		subsubsection/indent={28pt},
		paragraph/aftername = {},
		paragraph/number={（\arabic{paragraph}）},
		paragraph/indent={28pt},
		paragraph/format = {\LIXINsongti\zihao{-4}},
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
	\lixnbibliography{#1}%
\end{spacing}
\addcontentsline{toc}{section}{参考文献}
}

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{4}

\contentsmargin{0.5em}
\titlecontents{section}
[0ex]
{\zihao{-4}\LIXINsongti}
{\thecontentslabel}
{}
{\titlerule*[0.5pc]{$\cdot$}\contentspage}
[\addvspace{0pt}]%

\titlecontents{subsection}
[0ex]
{\zihao{-4}\LIXINsongti}
{\thecontentslabel}
{}
{\titlerule*[0.5pc]{$\cdot$}\contentspage}
[\addvspace{0pt}]%
 
\let\mytableofcontents\tableofcontents

\renewcommand{\tableofcontents}{\clearpage\nointerlineskip\vspace*{-20pt}
	{\begin{spacing}{1.625}\mytableofcontents\end{spacing}}}
\renewcommand{\contentsname}{\LIXINheiti\zihao{-3}\centerline{目\hspace*{\ccwd}录}}
\renewcommand{\refname}{\LIXINheiti\zihao{-3}\centerline{参考文献}}


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
\newcommand{\makesignature}{\def\value@siganture{\begin{tabular}{p{8.5cm}p{5cm}}
            论文作者签名 \raisebox{-10pt}{\includegraphics[height=28pt]{signature}}  &  \value@cnsubmityear 年 \value@cnsubmitmonth 月 \value@cnsubmitday 日\\  
    \end{tabular}}}


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
				
				\vspace{0.7cm}
				
				\includegraphics[width=11.62cm]{lixinlogo.png}
				
				\vspace{0.4cm}
	
				{\noindent\LIXINheiti\zihao{-0}\selectfont {\digitfont\value@cnsubmityear} 届本科毕业论文（设计）}
				{\linespread{1.25}\selectfont
					\bfseries\LIXINkaishu\zihao{2} \value@cntitle\par}     %% 不知道为什么，1.25更接近word1.5倍行距
				\vspace{-1mm}
				{\linespread{1.25}\selectfont
					\LIXINtimesbd\zihao{2}\selectfont \value@entitle\\}
				
				\vfill
				{\zihao{3}\bfseries\LIXINsongti\hspace*{102\ccwd}
					\begin{center}
					\begin{tabular}{rl}
						{\bfseries\LIXINkaishu \raisebox{0.3cm}{学\hspace{2\ccwd}号：}}&\LIXINunderline[280pt]{\raisebox{0.3cm}{\LIXINtimesbd\value@IDnumber}}\\ [5mm]
						\bfseries\LIXINkaishu \raisebox{0.3cm}{学生姓名：}&\LIXINunderline[280pt]{\makebox[8.5cm]{\raisebox{0.3cm}{\value@cnauthor}}}\\ [5mm]
						\bfseries\LIXINkaishu \raisebox{0.3cm}{所在学院：}&\LIXINunderline[280pt]{\raisebox{0.3cm}{\value@cnschool}}\\ [5mm]
						\bfseries\LIXINkaishu \raisebox{0.3cm}{专\hspace{2\ccwd}业：}&\LIXINunderline[280pt]{\raisebox{0.3cm}{\value@cnmajor}}\\ [5mm]
						\bfseries\LIXINkaishu \raisebox{0.3cm}{班\hspace{2\ccwd}级：}&\LIXINunderline[280pt]{\raisebox{0.3cm}{\value@cnclass}}\\ [5mm]
						\bfseries\LIXINkaishu \raisebox{0.3cm}{指导老师：}&\LIXINunderline[280pt]{\raisebox{0.3cm}{\value@cnadvisor}}\\ [5mm]
					\end{tabular}
				\end{center}
			
				\vfill
					\begin{center}
						{\zihao{-2}\bfseries\LIXINsongti\value@cnsubmityear 年\value@cnsubmitmonth 月}
					\end{center}
                \vspace{0.5cm}
				}
	\end{center}

\clearpage
\thispagestyle{empty}

\
\newline
\begin{center}
   {\LIXINheiti\zihao{3}声明及论文使用的授权}%
\end{center}
\vspace{1cm}

本人郑重声明：所呈交的论文是本人在导师的指导下取得的研究成果，论文写作严格遵循学术规范。除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写的研究成果。因本毕业论文引起的法律结果完全由本人承担。上海立信会计金融学院享有本毕业论文的研究成果。
\newline
\newline

\value@siganture


\vskip 4cm
本人同意上海立信会计金融学院保留使用学位论文的规定，即：学校有权保留送交论文的复印件，允许论文被查阅和借阅；学校可以上网公布全部内容，可以采用影印、缩印或其他复制手段保存论文。
\newline
\newline

\value@siganture
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


\renewenvironment{abstract}{\clearpage{\centering\section*{\hspace*{-28pt}\LIXINheiti\value@cnabstract}}}{}

\newcommand\keywords[1]{%
	\vspace{2ex}\noindent{\value@cnkeywords} #1}


\newenvironment{englishabstract}{\clearpage{\centering\section*{\hspace*{-28pt}\LIXINtimes\value@enabstract}}}{}

\newcommand\englishkeywords[1]{%
	\vspace{2ex}\noindent{\value@enkeywords} #1}




\renewenvironment{appendix}{\clearpage{\centering\section*{\hspace*{-28pt}\LIXINheiti\value@appendix}}}{\addcontentsline{toc}{section}{\value@appendix}}
\renewenvironment{thanks}{\clearpage{\centering\section*{\hspace*{-28pt}\LIXINheiti\value@thanks}}}{\addcontentsline{toc}{section}{\value@thanks}}



\endinput
