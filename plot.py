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
# data = np.genfromtxt("omni_new.dat")
data = np.genfromtxt("omni_truncated.dat")
print 'Loaded.'


def plotone(row, file, title):
	print title
	min = np.min(row)
	max = np.max(row)

	num = 20

	bins = np.linspace(min, max, num=200)

	plt.subplot(2, 1, 1)
	plt.hist(row, bins=bins, log=False, histtype='stepfilled')
	plt.title(title)

	plt.subplot(2, 1, 2)
	plt.hist(row, bins=bins, log=True, histtype='stepfilled')

	plt.savefig(file, dpi=100)
	plt.clf()

plotone(data[:,0], "pressure.png", "pressure, nP")
plotone(data[:,1], "speed.png", "speed, km/s")
plotone(data[:,2], "density.png", "proton density")
plotone(data[:,3], "bz_gsm.png", "BZ_GSM")
plotone(data[:,4], "by_gsm.png", "BY_GSM")
plotone(data[:,5], "mach.png", "Mach_number")
