#!/usr/bin/python3
#
# xgboost 建模 shap 分析
#

import xgboost as xgb
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib
import shap

plt.style.use('seaborn')
# 中文绘图
matplotlib.rcParams[u'font.sans-serif'] = ['simhei']
matplotlib.rcParams['axes.unicode_minus'] = False

# 读取数据
data = pd.read_csv('data/factor.csv')

# 选择特征
# cols = ['population',  # 人口
#         'gdp_total', 'gdp_frs', 'gdp_eng', 'gdp_ids', 'gdp_tfk', 'gdp_cst',  # GDP
#         'engCons_total', 'engCons_frs', 'engCons_2total', 'engCons_3total', 'engCons_life',  # 能耗
#         'ecConsVarStr_coal_total', 'ecConsVarStr_oil_total', 'ecConsVarStr_gas_total', 'ecConsVarStr_newEle', 'ecConsVarStr_otherEle',  # 能源品种
#         'fossilProp_frs', 'fossilProp_2total', 'fossilProp_3total', 'fossilProp_life',  # 化石能源占比
#          # 碳排放因子  数据不太好，暂时不考虑
#         '人均GDP', '化石能源占比', '能源强度', '能源碳排强度', '碳排强度',
#         '人口增长率', 'GDP增长率', '人均GDP增长率', '能源强度增长率', '能源碳排强度增长率'
#         ]

cols = [
        'GDP增长率',
        '人口增长率',
        '人均能源消耗',
        '人均GDP增长率',
        '能源消耗增长率',
        '人均能源消耗增长率',
        'fossilProp_2total'
]

# 训练模型
model = xgb.XGBRegressor(max_depth=8, learning_rate=0.05, n_estimators=150)
model.fit(data[cols], data['carbEmisInc_total'].values)

# # 使用 feature importance 解释 xgboost
plt.figure(figsize=(10, 10))
plt.bar(range(len(cols)), model.feature_importances_)
plt.xticks(range(len(cols)), cols, rotation=-45, fontsize=14)
plt.title('特征重要程度', fontsize=14)
plt.show()

# 使用 shap 解释 xgboost
explainer = shap.TreeExplainer(model)
shap_values = explainer.shap_values(data[cols])
data['pred'] = model.predict(data[cols])

## 单个样本 shap 值   基于 JS  这个得在 jupyter 里运行
j = 0  # 样本序号
player_explainer = pd.DataFrame()
player_explainer['feature'] = cols
player_explainer['feature_value'] = data[cols].iloc[j].values
player_explainer['shap_value'] = shap_values[j]
shap.initjs()
shap.force_plot(explainer.expected_value, shap_values[j], data[cols].iloc[j])


## 总体分析
# 总体特征可视化
shap.summary_plot(shap_values, data[cols])
#
shap.summary_plot(shap_values, data[cols], plot_type="bar")


## 部分依赖图
for temp in cols:
    shap.dependence_plot(temp, shap_values, data[cols], interaction_index=None, show=False)

# 多个变量交互分析
shap_interaction_values = shap.TreeExplainer(model).shap_interaction_values(data[cols])
shap.summary_plot(shap_interaction_values, data[cols], max_display=4)


shap.dependence_plot('population', shap_values, data[cols], interaction_index='engCons_total', show=False)
