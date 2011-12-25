#!/usr/bin/python
import numpy as np
import subprocess


files = ["pdyn_low",
	 "pdyn_hight",
	 "symh_low",
	 "symh_hight",
	 "bygsm_low",
	 "bygsm_hight",
	 "bzgsm_low",
	 "bzgsm_hight",
	 "speed_low",
	 "speed_hight"]


for i in files:
	print "hello data_"+i+".dat"
	data = np.genfromtxt("../find_extreme/data_"+i+".dat")
	pdyn	= data[1,2]
	speed	= data[1,3]
	den	= data[1,4]
	bzgsm	= data[1,5]
	bygsm	= data[1,6]
	symh	= data[1,7]
	w1	= data[1,8]
	w2	= data[1,9]
	w3	= data[1,10]
	w4	= data[1,11]
	w5	= data[1,12]
	w6	= data[1,13]
	print pdyn, symh, bygsm, bzgsm, w1, w2, w3, w4, w5, w6
	file = open("inputfile.dat", "w")
	file.write("%f %f %f %f %f %f %f %f %f %f\n" % (pdyn, symh, bygsm, bzgsm, w1, w2, w3, w4, w5, w6))
	file.close()
	command = ('make')
	subprocess.check_call(command)
	command = ('make', 'show')
	subprocess.check_call(command)
	command = ('cp', 'lines.png', i+"/")
	subprocess.check_call(command)


