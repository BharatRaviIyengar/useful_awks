#!/usr/bin/mawk -f

BEGIN{
	H["A"] = 0.17
	H["C"] = -0.24
	H["D"] = 1.23
	H["E"] = 2.02
	H["F"] = -1.13
	H["G"] = 0.01
	H["H"] = 0.96
	H["I"] = -0.31
	H["K"] = 0.99
	H["L"] = -0.56
	H["M"] = -0.23
	H["N"] = 0.42
	H["P"] = 0.45
	H["Q"] = 0.58
	H["R"] = 0.81
	H["S"] = 0.13
	H["T"] = 0.14
	H["V"] = 0.07
	H["W"] = -1.85
	H["Y"] = -0.94

	# Wimley and White
}

{
	hx = 0
	l=length($2)
	for(i=1;i<=l;i++)
		hx+=H[substr($2,i,1)]
	print $1, hx/l
}