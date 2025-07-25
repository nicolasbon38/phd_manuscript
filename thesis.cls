\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{thesis}[2015/06/22 Thesis class (E. Scifo), V1.0]

% base class = book 
\LoadClass[a4paper, 11pt]{book}

% packages 
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}

\RequirePackage{graphicx}
\RequirePackage{caption}
\renewcommand{\captionfont}{\it \small}



\RequirePackage[svgnames]{xcolor}

%% for tables
\RequirePackage{multirow}
\RequirePackage{multicol}

\RequirePackage[titletoc]{appendix}

\RequirePackage[left]{lineno} %% line numbers
\modulolinenumbers[5] %% numbers each 5 lines only


%% page geometry
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\pagestyle{fancy}
\fancyfoot[C]{\thepage}
\geometry{a4paper, body={160mm,245mm}}


%% Toc at begining of chapter
\RequirePackage[]{minitoc}
\mtcsettitle{minitoc}{Chapter content}




\RequirePackage{nameref}  
\RequirePackage[
	   backend=biber,
	   refsegment=chapter,
	   url=true,
	   backref=true,
	   %sorting=none,
	   %autocite=plain,
	   %style=numeric-comp %% use numeric-comp instead of just numeric in order to have compact mutiple citations, ie [1-4] instead of [1,2,3,4]
	   style=alphabetic,
     citestyle=alphabetic,
          maxnames=99,
     minnames=99
 ]{biblatex}
	

\PassOptionsToPackage{colorlinks=true, linkcolor=black, citecolor=blue}{hyperref}
\RequirePackage{hyperref}	

\makeatletter
\renewcommand{\@chapapp}{Chapter}
\makeatother

%% http://tex.stackexchange.com/questions/69139/refsegment-in-biblatex-broken-since-update-to-tl2012
%% \defbibheading{subbibliography}{\section*{References for  Chapter~\ref{refsegment:\therefsegment}: \nameref{refsegment:\therefsegment}} }
%\defbibheading{subbibliography}{\section*{References for  Chapter~\ref{refsegment:\therefsection\therefsegment}: \nameref{refsegment:\therefsection\therefsegment}}}

% \DefineBibliographyStrings{english}{%
%   backrefpage =  {{Cited on page}},% originally "cited on page"
%   backrefpages = {Cited on pages},% originally "cited on pages"
% }

% \renewbibmacro*{pageref}{% http://tex.stackexchange.com/questions/76133/bibliography-backref-on-new-line-with-smaller-font-size
%   \iflistundef{pageref}
%     {}
%     {\small \itshape \hfill {
%        \ifnumgreater{\value{pageref}}{1}
%          {\bibstring{backrefpages}\ppspace}
%      {\bibstring{backrefpage}\ppspace}%
%        \printlist[pageref][-\value{listtotal}]{pageref}}}}


%% Epigraph style
\RequirePackage{epigraph}
\renewcommand{\epigraphrule}{0.1pt} % bottom line width
\renewcommand{\textflush}{flushright}
\makeatletter
% Taken and updated from http://mirrors.ctan.org/macros/latex/contrib/epigraph/epigraph.dtx
\renewcommand{\@epitext}[1]{%
  \begin{minipage}{\epigraphwidth}\begin{\textflush} \hspace*{20pt} \itshape #1 \normalfont \\
      \ifdim\epigraphrule>\z@ \@epirule \else \vspace*{-.5\baselineskip} \fi
\end{\textflush}\end{minipage}}
\makeatother

%% Opening quotes
\RequirePackage{fancybox}
\newcommand*\openquote{\makebox(-15,-15){\scalebox{3}{``}}}
\newcommand*\closequote{\makebox(15,-15){\scalebox{3}{''}}}

\newcommand\chapQuote[2]{
  \vskip-0.5cm
  \begin{flushright}
    \boxput*(0.35,-0.9){
      \colorbox{white}{#2}}{
      %\setlength{\fboxsep}{6pt}
      %\cornersize{4}
      \setlength{\fboxsep}{4mm}
      \colorbox{white}{\begin{minipage}{0.6\textwidth}
          \openquote
          \itshape #1
          \closequote
      \end{minipage}}
    }
  \end{flushright}
  \vskip1cm
}


%% Dedication
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

\newenvironment{dedication}
               {\cleardoublepage           % we want a new page
                 \thispagestyle{empty}% no header and footer
                 \vspace*{\stretch{1}}% some space at the top 
                 \itshape             % the text is in italics
                 \hspace{3cm}
                 \noindent%
                 \begin{minipage}{0.6\textwidth}
                   \noindent%
               }
               { \end{minipage}
                 \vspace{\stretch{3}} % space at bottom is three times that at the top
                 \cleardoublepage           % finish off the page
               }



%% customize chapter headings
%% Source : http://forum.mathematex.net/latex-f6/modification-du-style-de-chapitre-t7022.html
\makeatletter
\newlength{\chapter@number@width}
\def\@makechapterhead#1{%
  {\normalfont
    \setlength{\parindent}{0pt}%
    \vspace*{10pt}%
    \settowidth{\chapter@number@width}{%
      \hbox{\color{white}\Huge\bfseries
        \hspace{\dimexpr 1mm+3pt}%
        \thechapter
        \hspace{\dimexpr 1mm+3pt}%
    }}
    \hbox{%
      \vtop{%
        \hsize=\dimexpr\chapter@number@width+\tabcolsep+2\fboxrule+\tabcolsep
        \begin{tabular}[t]{@{}c}
          \strut\makebox[0pt]{\hspace{0pt plus 1 fill minus 1 fill}\@chapapp\hspace{0pt plus 1 fill minus 1 fill}} \\
          \fboxsep=0pt
          \colorbox{black}{\vbox{%
              \hbox{\vbox to \dimexpr 1mm+4pt{}}
              \hbox{\color{white}\Huge\bfseries
                \hspace{\dimexpr 1mm+3pt}%
                \thechapter
                \hspace{\dimexpr 1mm+3pt}%
              }
              \hrule height 0.4pt depth 0pt width 0pt
              \hbox{\vbox to 6pt{}}
              \hbox{\parbox{0pt}{\Huge\bfseries\vphantom{E}}}
          }}%
        \end{tabular}%
      }%
      \vtop{%
        \advance\hsize by -\dimexpr\chapter@number@width+2\fboxrule+\tabcolsep
        \hspace*{-0.5cm}\begin{tabular}[t]{c}
          \strut\vphantom{\@chapapp} \\
          \fboxsep=0pt
          \colorbox{white}{\vbox{%
              \hbox{\vbox to \dimexpr 1mm+3pt{}}
              \hbox{\LARGE\bfseries
                \hspace{\dimexpr 1mm+3pt}%
                \phantom{\thechapter}
                \hspace{\dimexpr 1mm+3pt}%
              }
              \hrule height 0.4pt depth 0pt width \hsize
              \hbox{\vbox to 6pt{}}
              \hbox{\hspace*{3pt}\parbox{\dimexpr\textwidth-2mm-6pt-\chapter@number@width-\tabcolsep-2\fboxrule-20pt}{\Huge\bfseries\raggedright #1}}
          }}%
        \end{tabular}%
      }%
    }%
    \vspace{50pt}%
  }
}
\def\@makeschapterhead#1{%
  {\normalfont
    \setlength{\parindent}{0pt}%
    \vspace*{10pt}%
    \settowidth{\chapter@number@width}{%
      \hbox{\color{white}\LARGE\bfseries
        \hspace{\dimexpr 1mm+3pt}%
        \thechapter
        \hspace{\dimexpr 1mm+3pt}%
    }}
    \hbox{%
      \vtop{%
        \hsize=\dimexpr\chapter@number@width+\tabcolsep+2\fboxrule+\tabcolsep
        \begin{tabular}[t]{@{}c}
          \scshape\strut\makebox[0pt]{\hspace{0pt plus 1 fill minus 1 fill}\phantom{\@chapapp}\hspace{0pt plus 1 fill minus 1 fill}} \\
          \fboxsep=0pt
          \colorbox{black}{\vbox{%
              \hbox{\vbox to \dimexpr 1mm+3pt{}}
              \hbox{\color{white}\LARGE\bfseries
                \hspace{\dimexpr 1mm+3pt}%
                \phantom{\thechapter}%
                \hspace{\dimexpr 1mm+3pt}%
              }
              \hrule height 0.4pt depth 0pt width 0pt
              \hbox{\vbox to 6pt{}}
              \hbox{\parbox{0pt}{\Huge\bfseries\vphantom{E}}}
          }}%
        \end{tabular}%
      }%
      \vtop{%
        \advance\hsize by -\dimexpr\chapter@number@width+2\fboxrule+\tabcolsep
        \hspace*{-0.5cm}\begin{tabular}[t]{c}
          \scshape\strut\vphantom{\@chapapp} \\
          \fboxsep=0pt
          \colorbox{white}{\vbox{%
              \hbox{\vbox to \dimexpr 1mm+3pt{}}
              \hbox{\LARGE\bfseries
                \hspace{\dimexpr 1mm+3pt}%
                \phantom{\thechapter}
                \hspace{\dimexpr 1mm+3pt}%
              }
              \hrule height 0.4pt depth 0pt width \hsize
              \hbox{\vbox to 6pt{}}
              \hbox{\hspace*{20pt}\parbox{\dimexpr\textwidth-2mm-6pt-\chapter@number@width-\tabcolsep-2\fboxrule-30pt}{\Huge\bfseries #1}}
          }}%
        \end{tabular}%
      }%
    }%
    \vspace{50pt}%
  }
}
%% remove the top line : http://tex.stackexchange.com/questions/19738/why-doesnt-pagestyleempty-work-on-the-first-page-of-a-chapter
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}% original style: plain
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}
\makeatother


%%% Header of chapter + sections at the top of each page
\fancyhead{}              % Clear all header fields
\fancyhead[LO,RE]{\leftmark} % Chapter name on Outside header (Left on Odd, Right on Even)
\fancyhead[LE,RO]{}       % Clear Inside headers
%\fancyfoot{}              % Optional: clear footers if undesired


