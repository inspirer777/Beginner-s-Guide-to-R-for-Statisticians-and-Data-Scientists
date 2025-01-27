import math
import statistics
import numpy as np
import scipy.stats
import pandas as pd

x = [8.0, 1, 2.5, 4, 28.0]
x_with_nan = [8.0, 1, 2.5, math.nan, 4, 28.0]

print(x)

# MEAN 
y, y_with_nan = np.array(x), np.array(x_with_nan)
z, z_with_nan = pd.Series(x), pd.Series(x_with_nan)

mean_ = sum(x) / len(x)
print(mean_)

mean_ = statistics.mean(x)
print(mean_)

mean_ = np.mean(x)
print(mean_)

print(np.nanmean(x_with_nan))

# harmonic mean
#pure
hmean = len(x) / sum(1 / item for item in x)
print(hmean)

print(scipy.stats.hmean(y))

## geometric mea

print(scipy.stats.gmean(y))


## median
median_ = np.median(y)
print("median",median_)

# function statistics.variance():
var_ = statistics.variance(x)
print(var_)

print("variance",statistics.variance(x_with_nan))


var_ = np.var(y, ddof=1)
print("var _",var_)



## Summary of Descriptive Statistics
result = scipy.stats.describe(y, ddof=1)
print(result)

# DF
a = np.array([ [1,1,1],
[2,3,1],
[4,9,2],
      ])
row_name = ['first','second','third']
col = ['A','B','C']
df = pd.DataFrame(a,index = row_name, columns = col)
print(df)

result = df.describe()
print(result)


