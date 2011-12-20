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
data = np.genfromtxt("../data2/omni_1h.dat")

print 'Loaded.'


def plotone(row, file, title):
	print title
	row = np.sort(row)
	size = np.size(row)
	d = size/100
	print size, d, row[d], row[size-d], row
	min = np.min(row)
	max = np.max(row)

	num = 20

	bins = np.linspace(min, max, num=200)
	hi, _ = np.histogram(row, bins=bins)
	m = np.max(hi)
	a=[[row[d],m],[row[d],.1],[row[size-d],.1],[row[size-d],m]]

	plt.subplot(2, 1, 1)
	plt.hist(row, bins=bins, log=False, histtype='bar')
	plt.plot(*zip(*a))
	plt.title(title)

	plt.subplot(2, 1, 2)
	plt.hist(row, bins=bins, log=True, histtype='bar')
	plt.plot(*zip(*a))
	plt.title("Extreme (1%%): %.2f, %.2f" % (row[d], row[size-d]) )

	plt.savefig("../out/"+file, dpi=100)
	plt.clf()

plotone(data[:,2], "pressure.png", "pressure, nP")
plotone(data[:,3], "speed.png", "speed, km/s")
plotone(data[:,4], "density.png", "proton density")
plotone(data[:,5], "bz_gsm.png", "BZ_GSM, nT")
plotone(data[:,6], "by_gsm.png", "BY_GSM, nT")
plotone(data[:,7], "sym_h.png", "SYM-H, nT")
