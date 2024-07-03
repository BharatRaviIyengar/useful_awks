#!/usr/bin/mawk -f

BEGIN{
	H["A"] = 0.5
	H["C"] = -0.02
	H["D"] = 3.64
	H["E"] = 3.63
	H["F"] = -1.71
	H["G"] = 1.15
	H["H"] = 2.33
	H["I"] = -1.12
	H["K"] = 2.8
	H["L"] = -1.25
	H["M"] = -0.67
	H["N"] = 0.85
	H["P"] = 0.14
	H["Q"] = 0.77
	H["R"] = 1.81
	H["S"] = 0.46
	H["T"] = 0.25
	H["V"] = -0.46
	H["W"] = -2.09
	H["Y"] = -0.71

	# Wimley and White
	FS = OFS = "\t"
}

{
	hx = 0
	l=length($2)
	for(i=1;i<=l;i++)
		hx+=H[substr($2,i,1)]
	print $1, hx/l
}
