#!/usr/bin/python
# -*- coding: utf-8 -*-

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt   # For plotting graphs.
import numpy as np
import subprocess                 # For issuing commands to the OS.
import os
import sys                        # For determining the Python version.

import random
from numpy.random import uniform, seed
from matplotlib.mlab import griddata

print 'Starting...'

def plotone(row, file, title, fraction):
	print title
	row = np.sort(row)
	if fraction:
		size = np.size(row)
		d = size/fraction
		# print size, d, row[d], row[size-d], row

	min = np.min(row)
	max = np.max(row)

	bins = np.linspace(min, max, num=200)
	hi, _ = np.histogram(row, bins=bins)

	if fraction:
		m = np.max(hi)
		a=[[row[d],m],[row[d],.1],[row[size-d],.1],[row[size-d],m]]

	plt.subplot(2, 1, 1)
	plt.hist(row, bins=bins, log=False, histtype='bar')
	plt.xlabel('value')
	plt.ylabel('counts')
	if fraction:
		plt.plot(*zip(*a))
	plt.title(title)

	plt.subplot(2, 1, 2)
	plt.hist(row, bins=bins, log=True, histtype='bar')
	plt.ylabel('counts, logscale')
	if fraction:
		plt.plot(*zip(*a))
		plt.xlabel("extreme values (%.1f%%): %.2f, %.2f" % (100.0/fraction, row[d], row[size-d]) )
	else:
		plt.xlabel('value')

	dir = os.path.dirname("../out/"+file+".png")
	if not os.path.exists(dir):
		os.mkdir(dir)
	plt.savefig("../out/"+file+".png", dpi=100)
	plt.clf()

def plotall(data, filename, fraction):
	print 'Loaded.'
	plotone(data[:,2],  filename % "pressure",	"pressure, nP",	 fraction)
	plotone(data[:,3],  filename % "speed",		"speed, km/s",	 fraction)
	plotone(data[:,4],  filename % "density",	"proton density",fraction)
	plotone(data[:,5],  filename % "bz_gsm",	"BZ_GSM, nT",	 fraction)
	plotone(data[:,6],  filename % "by_gsm",	"BY_GSM, nT",	 fraction)
	plotone(data[:,7],  filename % "sym_h",		"SYM-H, nT",	 fraction)
	plotone(data[:,8],  filename % "W1",		"W1",		 fraction)
	plotone(data[:,9],  filename % "W2",		"W2",		 fraction)
	plotone(data[:,10], filename % "W3",		"W3",		 fraction)
	plotone(data[:,11], filename % "W4",		"W4",		 fraction)
	plotone(data[:,12], filename % "W5",		"W5",		 fraction)
	plotone(data[:,13], filename % "W6",		"W6",		 fraction)

data = np.genfromtxt("../data2/omni_1h.dat")
plotall(data, "1hr/%s", 1000)
data = np.genfromtxt("../data2/omni_ts05_5m.dat")
plotall(data, "5min/%s", 1000)

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
	data = np.genfromtxt("../find_extreme/data_%s.dat" % i)
	plotall(data, i+"/%s", 0)
