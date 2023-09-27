% 导入数据
population = y5';
% 创建ARIMA模型
Mdl = arima(1,2,0); % 这里选择ARIMA(1,1,1)模型作为示例，可以根据实际情况调整参数

% 拟合模型
EstMdl = estimate(Mdl, population);

% 预测未来五年的人口数量
nYears = 40;
Forecast = forecast(EstMdl, nYears, 'Y0', population);

% 显示结果
disp('预测结果：')
disp(Forecast)

% 绘制预测结果图
figure;
plot(2010:2020,population, 'b.-'); % 原始数据
hold on;
plot(2020:2060,[population(end); Forecast], 'r.-'); % 预测数据
legend('实际人口数量', '预测人口数量');
xlabel('年份');
ylabel('人口数量');
title('人口数量预测');
