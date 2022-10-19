#!/usr/bin/mawk -f

BEGIN{
	print "\n Please ensure that each fasta sequence occupies just one line\n i.e. 1 line for header + 1 line for sequence \n If not, run 2lineFasta.awk first\n"
	OFS = "\t"
}

FNR==1{
	if(FILENAME =="-")
		outfile = "/dev/stdout"
	else{
		outfile = FILENAME
		sub(/\..*$/,".tsq",outfile)
	}
}

/>/{
	h = substr($0,2)
	next
}

{
	print h, $0 > outfile
}
