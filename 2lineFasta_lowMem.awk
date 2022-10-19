#!/usr/bin/mawk -f

/>/{
	if(h!="")
		print h "\n" seq
	h = $0
	seq = ""
	next
}

{
	seq = seq $0
}

END{
	print h "\n" seq
}
