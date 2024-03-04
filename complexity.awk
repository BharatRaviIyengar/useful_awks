#!/usr/bin/gawk -f

BEGIN{
	FS = OFS = "\t"
	if(seqtype == "P"){
		unused["B"]
		unused["J"]
		unused["U"]
		unused["X"]
		unused["Z"]
		nmono = 20
		maxwl = 5
	}
	else{
		unused["N"]
		unused["W"]
		unused["R"]
		unused["S"]
		unused["Y"]
		unused["K"]
		unused["M"]
		unused["D"]
		unused["B"]
		unused["V"]
		unused["H"]
		nmono = 4
		maxwl = 10
	}
	for(i=1;i<=maxwl;i++)
		nnxmer[i] = nmono^i
}

function min(a,b){
	if(a<b)
		return a
	else
		return b
}

function shannon(seq, w, j, nwords, val, word, lseq){
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

function lcomp(seq, w, j, nwords, val, word, lseq){
	val = 0
	lseq = length(seq)
	for(w=1;w<=maxwl;w++){
		nwords[w] = lseq-w+1
		for(j=1;j<=nwords[w];j++){
			word[w][substr(seq,j,w)]
		}
	}
	val = 1
	for(w in word){
		wc = 0
		for(j in word[w])
			wc++
		val*=wc/min(nwords[w],nnxmer[w])
	}
	return val
}

{
#	for(i in unused){
#		if($2~i)
#			next
#	}	
	if(FNR==1)
		print "name","ShannonH","lcomplexity"
	print $1, shannon($2),lcomp($2)
}

