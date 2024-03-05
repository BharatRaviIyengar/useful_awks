#!/usr/bin/gawk -f

BEGIN{
	x["A"];x["T"];x["G"];x["C"]
	W = 10
}
FNR%2==0{
	l = length($0)
	for(i=1;i<=W;i++){
		first[i][substr($0,i,1)]++
		last[W-i+1][substr($0,l-W+i,1)]++
	}
}
END{
	print "First"
	for(j in x)
		printf("\t%s",j)

	printf("\n")
	for(i=1;i<=W;i++){
		printf("%d",i)
		for(j in x)
			printf("\t%f",2*first[i][j]/FNR)
		printf("\n")
	}

	print "\nLast"
    for(j in x)
        printf("\t%s",j)

    printf("\n")
    for(i=1;i<=W;i++){
        printf("%d",i)
        for(j in x)
            printf("\t%f",2*last[i][j]/FNR)
		printf("\n")
    }

}
