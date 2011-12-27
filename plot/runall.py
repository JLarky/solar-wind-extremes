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
	pdyn	= np.average(data[:,2])
	speed	= np.average(data[:,3])
	den	= np.average(data[:,4])
	bzgsm	= np.average(data[:,5])
	bygsm	= np.average(data[:,6])
	symh	= np.average(data[:,7])
	w1	= np.average(data[:,8])
	w2	= np.average(data[:,9])
	w3	= np.average(data[:,10])
	w4	= np.average(data[:,11])
	w5	= np.average(data[:,12])
	w6	= np.average(data[:,13])
	print pdyn, symh, bygsm, bzgsm, w1, w2, w3, w4, w5, w6
	file = open("inputfile.dat", "w")
	file.write("%f %f %f %f %f %f %f %f %f %f\n" % (pdyn, symh, bygsm, bzgsm, w1, w2, w3, w4, w5, w6))
	file.close()
	command = ('make')
	subprocess.check_call(command)
	command = ('make', 'show')
	subprocess.check_call(command)
	command = ('cp', 'lines.png', 'inputfile.dat', 'points.dat', i+"/")
	subprocess.check_call(command)
	command = ('taadaa')
	subprocess.check_call(command)


