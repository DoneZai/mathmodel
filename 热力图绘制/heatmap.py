import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import warnings
warnings.filterwarnings("ignore") 
from pyforest import *

data=pd.read_csv("D:\Code\mathmodel\ProblemD\cor.csv",encoding='utf-8')
data.head()

#图片显示中文
plt.rcParams['font.sans-serif']=['SimHei']
plt.rcParams['axes.unicode_minus'] =False

#计算各变量之间的相关系数
corr = data.corr()
corr

ax = plt.subplots(figsize=(20, 16))
ax = sns.heatmap(corr, vmin=-0,vmax=1, square=True, annot=True,cmap='coolwarm',annot_kws={"size": 25},center=0)#画热力图 
# 设置刻度字体大小
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)
# plt.show()
plt.savefig('heatmap.png')