% gdp_percentage =  [gdp_nonglin_v./gdp_total_v, gdp_nenggong_v./gdp_total_v,gdp_gongye_v./gdp_total_v, gdp_jiaotong_v./gdp_total_v,gdp_jianzhu_v./gdp_total_v];
% 
% agriculture_ratio = gdp_nonglin./gdp_total;
% % 构建灰色预测模型
% n = length(agriculture_ratio);
% X0 = cumsum(agriculture_ratio); % 累加求和
% X1 = 0.5 * (X0(1:n-1) + X0(2:n)); % 紧邻均值（中间值）
% X = [X1; X0(2:n)]; % 构建矩阵
% 
% Y = agriculture_ratio(2:n); % 需要预测的值
% 
% % 使用最小二乘法拟合参数
% a = (X' * X) \ (X' * Y);
% 
% % 进行预测
% X_predict = cumsum([agriculture_ratio(end), a' * [0.5 * (X0(end) + X0(end-1)); X0(end)]]);
% 
% % 可视化预测结果
% years = 2021:2060; % 假设预测的年份范围
% 
% figure;
% plot(2010:2020, agriculture_ratio, 'b-o', 'LineWidth', 2);
% hold on;
% plot(years, X_predict, 'r--', 'LineWidth', 2);
% title('农业GDP占比预测');
% xlabel('年份');
% ylabel('GDP占比');
% legend('已知数据', '预测结果');
% grid on;

% %% 约束限制GDP
% % 假设已知2010-2020年的五个产业在GDP中的比例数据，存储在 industry_ratios 变量中
% 
% % 构建灰色预测模型
% industry_ratios = gdp_gongye_v./gdp_total_v;
% n = length(industry_ratios);
% X0 = cumsum(industry_ratios); % 累加求和
% X1 = 0.5 * (X0(1:n-1) + X0(2:n)); % 紧邻均值（中间值）
% X = [X1; X0(2:n)]; % 构建矩阵
% 
% Y = industry_ratios(2:n); % 需要预测的值
% 
% % 使用最小二乘法拟合参数
% a = (X' * X) \ (X' * Y);
% 
% % 进行预测
% X_predict = cumsum([industry_ratios(end), a' * [0.5 * (X0(end) + X0(end-1)); X0(end)]]);
% 
% % 根据限制条件进行调整
% X_predict(X_predict < 0.3) = 0.3; % 工业比例不低于30%
% X_predict(X_predict > 0.6) = 0.6; % 建筑比例不高于60%
% 
% % 可视化预测结果
% years = 2021:2060; % 假设预测的年份范围
% 
% figure;
% plot(2010:2020, industry_ratios, 'b-o', 'LineWidth', 2);
% hold on;
% plot(years, X_predict, 'r--', 'LineWidth', 2);
% title('产业在GDP中比例预测');
% xlabel('年份');
% ylabel('比例');
% legend('已知数据', '预测结果');
% grid on;


% 多项式拟合
% % 已知数据
% function GDP_fit = Q1_3(PreData,final)
% years = [2010:2030,2060]; % 年份
% GDP = [PreData,final]; % 对应的GDP数据

% % 多项式拟合
% degree = 2; % 设置多项式的阶数，可以根据实际情况调整
% p = polyfit(years, GDP, degree);
% 
% % 生成拟合后的数据
% years_fit = 2010:2060;
% GDP_fit = polyval(p, years_fit);
% 
% % 绘制拟合结果
% plot(years, GDP, 'r*', 'LineWidth', 2); hold on;
% plot(years_fit, GDP_fit, 'b-', 'LineWidth', 2);
% title('GDP总量拟合预测情况');
% xlabel('年份');
% ylabel('GDP总量');
% legend('已知数据', '拟合结果');
% grid on;


% % 输入数据
% years = [2010:2030, 2060]; % 年份数据
% gdp_data = [gongye_ratio,0.25]; % 替换为实际数据
% 
% % 指数拟合模型
% f = fit(years', gdp_data', 'exp1');
% 
% % 使用模型预测未来数据
% future_years = 2031:2059; % 2021到2059年
% predicted_gdp = feval(f, future_years);
% 
% % 将预测结果与已知数据合并
% all_years = [years, future_years];
% all_gdp_data = [gdp_data, predicted_gdp'];
% 
% % 绘制结果
% figure;
% plot(all_years, all_gdp_data, 'o', 'DisplayName', '实际数据');
% hold on;
% plot(future_years, predicted_gdp, 'r--', 'DisplayName', '预测结果');
% title('经济数据指数拟合与预测');
% xlabel('年份');
% ylabel('GDP');
% legend;
% 
% years = 2010:2020;
% % 人口多项式拟合
% degree = 2; % 设置多项式的阶数，可以根据实际情况调整
% p = polyfit(years, y5, degree);
% 
% % 生成拟合后的数据
% years_fit = 2010:2060;
% renkou_fit = polyval(p, years_fit);
% 
% % 绘制拟合结果
% plot(years, y5, 'r*', 'LineWidth', 2); hold on;
% plot(years_fit, renkou_fit, 'b-', 'LineWidth', 2);
% title('人口总量拟合预测情况');
% xlabel('年份');
% ylabel('人口总量');
% legend('已知数据', '拟合结果');
% grid on;

% 输入数据
years = 2010:2020; 
population_data =y5; % 请替换为实际的人口数据

% 负对数拟合模型
f = fit(years', log(population_data)', 'poly1');

% 使用模型预测未来数据
future_years = 2021:2060; % 2021到2060年
predicted_population = exp(feval(f, future_years));

% 将预测结果与已知数据合并
all_years = [years, future_years];
all_population_data = [population_data, predicted_population'];

% 绘制结果
figure;
semilogy(all_years, all_population_data, 'o', 'DisplayName', '实际数据'); % 使用对数坐标绘制
hold on;
semilogy(future_years, predicted_population, 'r--', 'DisplayName', '预测结果');
title('人口数据负对数拟合与预测');
xlabel('年份');
ylabel('人口');
legend;
