revealjs:
	rsync imgs/*[.jpg,.svg] docs/imgs/
	pandoc -t revealjs -s -f markdown -V history:true --biblio references.bib --katex=https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0/ --filter pandoc-crossref --csl res/chicago-author-date.csl --template=./templates/default -V theme:metropolis -V history:true presentation.md -o docs/index.html
