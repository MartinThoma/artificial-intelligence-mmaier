SOURCE = Artificial_Intelligence

make:
	pdflatex $(SOURCE).tex -interaction=batchmode -output-format=pdf # aux-files for makeindex / makeglossaries
	#makeindex $(SOURCE)
	pdflatex $(SOURCE).tex -interaction=batchmode -output-format=pdf # include index
	pdflatex $(SOURCE).tex -interaction=batchmode -output-format=pdf # include symbol table
	make clean # remove intermediate files like *.log and *.aux

ebook:
	latexml --dest=$(SOURCE).xml $(SOURCE).tex
	latexmlpost -dest=$(SOURCE).html $(SOURCE).xml
	ebook-convert $(SOURCE).html $(SOURCE).epub --language de --no-default-epub-cover


clean:
	rm -rf  $(TARGET) *.class *.html *.log *.aux *.out *.thm *.idx *.toc *.ind *.ilg *.glg *.glo *.gls *.ist *.xdy *.fdb_latexmk *.bak
