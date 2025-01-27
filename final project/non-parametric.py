import math
import statistics
import numpy as np
import scipy.stats
import pandas as pd
from scipy import stats

from scipy.stats import wilcoxon
from scipy.stats import binom
# 1
x = [0.11,0.14,0.16,0.19,0.26,0.28,0.33,0.38,0.38,0.52,0.58,0.62
     ,0.63,0.76,0.86,0.87,0.88,0.91,0.92,0.94,0.95,1.01,1.15,1.15,1.19,1]
x = sorted(x)
print(x)
p = 0.7
n =len(x)
r= math.floor((n+1)*p)
print(r)
#
w = (n+1)*p-r 
print(w)
qp = (1-w)*x[r]+w*x[r+1]
print(qp)
#   1 - B
a = 0.95
p = 0.5
i= {}
M= [[0],[n*(n-1)/2],[3]]
print (M)



# 2

x2 = [0.11,0.14,0.16,0.19,0.26,0.28,0.33,0.38,0.38,0.52,0.58,
      0.62,0.63,0.76,0.86,0.87,0.88,0.91,0.92,
      0.94,0.95,1.01,1.15,1.15,1.19,1]
print(scipy.stats.wilcoxon(x2))





##7
a = np.array([75,69.8,85.7,74,69,83.3,68.9,77.8,72.2,77.4])
b = np.array([85.4,83.1,80.2,74.5,70,81.5,75.4,78,85.4,80.4])
d = b-a
d = d[d!=0]
print("d")
print(d)

n = len(d)
print("n")
print(n)
print("B")
B= len(d[d>0])
print(B)
#n=10000
#p=10/19
#k=0
l1 =scipy.stats.binom.cdf(B,n,1/2)
l2 =1 - scipy.stats.binom.cdf(B-1,n,1/2)
ll = min(scipy.stats.binom.cdf(B,n,1/2),1 - scipy.stats.binom.cdf(B-1,n,1/2))
pval = 2*(ll)
print(ll)

###8
import itertools

for n1 in itertools.repeat(1,4):
      print(np.array([n1]))
for n2 in itertools.repeat(2,3):
      print(np.array([n2]))
for n3 in itertools.repeat(3,3):
      print(np.array([n3]))
a = itertools.repeat(n1,4):
      
print(a)




