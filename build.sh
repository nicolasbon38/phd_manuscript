pdflatex -interaction=nonstopmode thesis.tex
biber thesis
makeglossaries thesis
pdflatex -interaction=nonstopmode thesis.tex
pdflatex -interaction=nonstopmode thesis.tex