# Getting started with LaTeX
In this repository, you will find some basics to create pdf documents without spending more time on the layout than on the content :)

## LaTeX installation
The following packags are required to compile tex file and get pdf result:
```
aptitude install texlive texlive-latex-extra texlive-latex3
```

If you want language support, saying french supoprt for example:
```
aptitude install texlive-lang-french
```

In case your favorite editor is vi, you can install the following plugin to get autocompletion and some shortcuts:
```
aptitude install vim-latexsuite
vim-addons -w install latex-suite
```

## Getting started
### Starting a new document
The main document, the one you will compile is ... _main.tex_. Let start by choosing what you want:
* type of document: uncomment 'article' or 'book' lines according to your needs.  
   _article_ for short document  
   _book_ for document with parts/chapters

* title and author:  
   _doctype/title/subtitle_  
   _author/authorTitle/authorEmail_

* watermark: if needed, uncomment _draft_ or _confidential_

* misc: fill _frontpage_ and _masthead_ according to your needs.

### Writing content
You can now write your content in _main.tex_ between _begin{document}_ and _end{document}_.

I recommend to split your content with one tex file per section, and include them in _main.tex_.
This way, collaboration is easier and you avoid having a file with thousands of lines to edit ...

### Inserting a figure
png format is mandatory here (LaTeX supports many other, but png will avoid lots of issues at compilation time). If needed, _imagemagick_ will help you.
```
convert image.XXX image.png
```

Let place all your images in _img/_ folder. You can insert a figure using the macro _fig_ and the following syntax:
```
\fig{height}{filename}{caption}{label}
```
* height in centimeter
* filename without the extension
* caption is a comment of your figure
* label is a flag to refer to your figure somewhere in your document using \ref{ }

Example in the current main.tex:
```
\fig{3cm}{sandwich}{illustrating sudo}{fig:sudo}
The figure \ref{fig:sudo} comes from xkcd.
```

### Inserting a table
The macro _tab_ is similar to _fig_ and has the following syntax:
```
\tab{columns scheme}{content}{caption}{label}
```
* columns scheme using _c_ (centered), _l_ (left aligned) or _r_ (right aligned)
* content using _hline_ and _&_ keywords 
* caption as for images
* label as for images

Tables can be really complex in latex (merging columns/rows, colors, etc). I just recommend to refer to the wiki LaTeX on purpose. 


Exemple in the current main.tex:
```
\tab{|c|l|r|}{
\hline
name & color & coat \\ 
\hline\hline
meow & white and black & short \\
\hline
}{Description of my cat}{tab:catdesc}
The table \ref{tab:catdesc} describes my lazzy cat.
```

### Inserting a bibliography
Generating a bibliography for your document requires three steps:
* fill _main.bib_, following the rules described in BibTex wiki 
* uncomment the three relevant lines in _main.tex_
* compile  
```
pdflatex main.tex
bibtex main.aux (2 times)
pdflatex main.tex
```

### Full example
Let compile the tex file in this repo.
```
pdflatex main.tex
```

Comparing the tex file _main.tex_ and the result _main.pdf_, you will learn the syntax to get most of the basics: list/ordered list/table/newline/section and subsections/table of contents/figure/...

### Reminder
* [LaTeX wiki](https://en.wikibooks.org/wiki/LaTeX/)
* [BibTex wiki](https://fr.wikipedia.org/wiki/BibTeX)
