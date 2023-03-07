#!/usr/bin/mawk -f

BEGIN{
	FS = OFS = "\t"
	c["A"] = "T"
	c["T"] = "A"
	c["G"] = "C"
	c["C"] = "G"
	if(w == 0 || w == ""){
		print "kmer length (w) unspecified;\n using 1"
		w = 1
	}
	if(strand !=2 && strand != 1){
		print "strand unspecified (values 1 or 2);\n using 1"
        strand = 1
	}
}

function rc(str){
	if(str == "")
		return str
	else
		return rc(substr(str,2)) c[substr(str,1,1)]
}

{
	l = length($2)
	for(i=1;i<=l-w+1;i++){
		s = substr($2,i,w)
		if(!(s~/N/)){
			k[s]++
			t++
			if(strand == 2){
				k[rc(s)]++
				t++
			}
		}
	}
}

END{
	print "kmer(" w ")", "Counts(/" t ")", "Frequency"
	for(i in k)
		print i, k[i], k[i]/t
}
