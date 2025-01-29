#!/usr/bin/gawk -f

BEGIN{
	OFS = "\t"
	n["A"]
	n["T"]
	n["G"]
	n["C"]
	if(w == 0)
		w = 20
	if(o == 0)
		o = 1
	while(w%o != 0)
		w++
	PROCINFO["sorted_in"] = "@ind_str_asc"
		
}

!/>/{
	l = length($0)
	$0 = toupper($0)
	q = l - w
	if(l< 2*w+5)
		next
	for(i=1;i<=w-o+1;i+=o){
		acc = substr($0,i,o)
		don = substr($0,q+i,o)
		if(!(acc~/N/))
			c[5][acc][i]++
		if(!(don~/N/))
			c[3][don][i]++
	}
	rec++
}

END{
	print "## flank size = " w ", offset size = "  o
	printf("End\tSeq")
	for(i=1;i<=w-o+1;i+=o)
		printf("\t%d",i)
	print ""
	for(j in c){
		for(z in c[j]){
			printf("%s\t%s",j,z)
			for(i=1;i<=w-o+1;i+=o){
					printf("\t%0.3f",100*c[j][z][i]/rec)
			}
			printf("\n")
		}
	}
}
