#!/usr/bin/gawk -f

BEGIN{
	#print "Use only tab separated sequence file"
	FS = OFS = "\t"
	print "name\tmean\tmedian"
}

{
	name = $1
	seq = $2
	if(length(seq)<20)
		next
	cmd = "echo "seq" | ~/iupred3/iupred3.py /dev/stdin long | grep -v '#' | sort -nk3"
	l=0
	while((cmd | getline result)>0){
		split(result,s,"\t")
		x[++l]=s[3]
		total[name]+=s[3]
	}
	close(cmd)
	mean[name]=total[name]/l
	
	l%2==0? median[name] = 0.5*(x[l/2] + x[1+l/2]) : median[name] = x[(l+1)/2]  
	print name, mean[name], median[name]
}
