#!/usr/bin/mawk -f

BEGIN{
	FS = OFS = "\t"
	maxwl = 5
}

function dkl(seq, w, j, nwords, val, word, wlen, lseq, xrfreq, aa){
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
		wlen = length(w)
		if(!(w in q)){
			split(w,aa,"")
			xrfreq = 1
			for(j in aa){
				xrfreq *= q[aa[j]]/rec
			}
			minqwf[wlen]/rec < 2*xrfreq? q[w]= 0.5*minqwf[wlen]/rec : q[w] = xrfreq
			if(q[w] == 0)
				print w, q[w], minqwf[wlen]/rec, xrfreq
		}
		val += freq[w]*log(rec*freq[w]/q[w])
	}

	delete freq
	return val
}

NR==FNR{
	for(i=1;i<=maxwl;i++){
		l = length($2)
		nwps = l-i+1
		minqwf[i]+=nwps	
		for(j=1;j<=nwps;j++){
			s = substr($2,j,i)
			q[s]+= 1/nwps
#			print s, nwps, q[s]
		}
	}
	rec++
	next
}

{
	print $1, dkl($2)
}

