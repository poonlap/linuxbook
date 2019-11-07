dvi:
	latex --translate-file=cp8bit.tcx linux > /dev/null
	./wordcut.sh >& /dev/null
	latex --translate-file=cp8bit.tcx linux > /dev/null
all:
	latex --translate-file=cp8bit.tcx linux
	./wordcut.sh
	latex --translate-file=cp8bit.tcx linux
	./makeindex -s book.ist -T general
	./makeindex -s book.ist -T command
	./makeindex -s nomencl.ist linux.glo -o linux.gls
	latex --translate-file=cp8bit.tcx linux
	latex --translate-file=cp8bit.tcx linux
index:
	./makeindex -T -s book.ist general
	./makeindex -T -s book.ist command

glossary:
	./makeindex -T -s nomencl.ist linux.glo -o linux.gls

bib:
	bibtex linux

linux.pdf: linux.dvi
	dvips -Ppdf -Poutline -Pcmz -t a4 -o linux.ps linux.dvi
	ps2pdf -dPDFSETTINGS=/printer -dEncodeColorImages=false linux.ps
#	rm -f linux.ps
clean: 
	rm -f *.wbr *~
	LANG=th_TH latex --translate-file=cp8bit.tcx linux > /dev/null
#	for i in *.th;do  w=`echo $${i} | sed -e s/\.th/\.wbr/`; cttex -W < $${i} > $${w} 2> /dev/null ; done
	./wordcut.sh
	LANG=th_TH latex --translate-file=cp8bit.tcx linux > /dev/null
