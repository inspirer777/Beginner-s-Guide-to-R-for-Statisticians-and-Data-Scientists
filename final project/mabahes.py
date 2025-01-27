import pandas as pd
import math
import statistics
import numpy as np
import scipy.stats
from scipy import stats
import csv
from plotnine import ggplot,facet_grid,aes, labs, geom_point
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
import statsmodels.api as sm
import seaborn as sns
from statsmodels.api import OLS
from matplotlib import pyplot
from scipy.optimize import curve_fit
from numpy import arange


## import data
df = pd.read_csv('E:/disk D/99/mabahes/end/dd.csv')
print(np.array(df))


## show as a dataframe
pddf = pd.DataFrame(df)
print(pddf)
a = np.array(df)
## mean 
d = np.mean(df)
print(d)
## mean 
print("var")
a2 = df.var(ddof=1)
print(a2)
## ks test
print('ks test')
print(stats.kstest(df['b'],df['g']))


## summary
print(df.describe())
result = scipy.stats.describe(a, ddof=1, bias=False)
print(result)
#####
### Curve
def objective(x, a, b):
	return a * x + b
# choose the input and output variables
data = df.values
# choose the input and output variables
x, y = data[:, 4], data[:, -1]
# curve fit
popt, _ = curve_fit(objective, x, y)
# summarize the parameter values
a, b = popt
print('y = %.5f * x + %.5f' % (a, b))
# plot input vs output
pyplot.scatter(x, y)
# define a sequence of inputs between the smallest and largest known inputs
x_line = arange(min(x), max(x), 1)
# calculate the output for the range
y_line = objective(x_line, a, b)
# create a line plot for the mapping function
pyplot.plot(x_line, y_line, '--', color='red')
pyplot.show()
########   regression
x = np.array(df['b'])
y = np.array(df['g'])
x, y = np.array(x.reshape(-1,1)), np.array(y)
model = LinearRegression().fit(x, y)
r_sq = model.score(x, y)
print('coefficient of determination:', r_sq)
print('intercept:', model.intercept_)
print('slope:', model.coef_)
y_pred = model.predict(x)
print('predicted response:', y_pred, sep='\n')
y_pred = model.intercept_ + np.sum(model.coef_ * x, axis=1)
print('predicted response:', y_pred, sep='\n')
##
result = sm.OLS(x,y).fit()
print('sm result',result.params)
######### all model plot #########
f, ax = plt.subplots(figsize=(10, 8))
corr = df.corr()
sns.heatmap(corr,
            xticklabels=corr.columns.values,
            yticklabels=corr.columns.values)
## 
s = df.drop(['b','g'], axis=1)
sns.pairplot(s)

plt.show()
uniform_data = df
ax = sns.heatmap(uniform_data)
plt.show()
########
# box plot
fig, ax = plt.subplots()
ax.boxplot((df), vert=False, showmeans=True, meanline=True,
            patch_artist=True,
           medianprops={'linewidth': 2, 'color': 'yellow'},
           meanprops={'linewidth': 2, 'color': 'red'})
plt.show()
#histogram
fig, ax = plt.subplots()
ax.hist(df, cumulative=False)
ax.set_xlabel('deg')
ax.set_ylabel('Frequency')
plt.show()

ax.set_ylabel('Frequency')
plt.show()
#####     plot    #######

plt.plot(df['g'])
plt.show()

plt.plot(df['b'])
plt.show()

plt.plot(df['gg'])
plt.show()

plt.plot(df['bb'])
plt.show()

plt.plot(df['ggg'])
plt.show()

plt.plot(df['bbb'])
plt.show()

plt.plot(df['gggg'])
plt.show()

plt.plot(df['bbbb'])
plt.show()









