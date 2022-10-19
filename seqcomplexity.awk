#!/usr/bin/gawk -f

BEGIN{
	FS = OFS = "\t"
	maxwl = 5

	unused["B"]
	unused["J"]
	unused["U"]
	unused["X"]
	unused["Z"]
}

function lcomp(seq, w, j, nwords, val, word, lseq){
	val = 0
	lseq = length(seq)
	for(w=1;w<=maxwl;w++){
		nwords = lseq-w+1
		for(j=1;j<=nwords;j++){
			word = substr(seq,j,w)
			freq[word]+=(1/nwords)
		}
	}
	for(w in freq){
		val += -freq[w]*log(freq[w])
	}
	delete freq
	return val
}

{
	for(i in unused){
		if($2~i)
			next
	}
	
	print $1, lcomp($2)
}

