import pandas as pd
import numpy as np

# 读取Excel文件
df = pd.read_excel('data\表1-患者列表及临床信息.xlsx')

# 提取数据
data = df.to_numpy()

# 查看导入的数据
print(data[0])
