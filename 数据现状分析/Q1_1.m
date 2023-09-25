%% 数据读取
years = 2010:2020;
y2=tb1GDP(1,:);
y3=tb1nengxiao(1,:);
y4=tb2tanpai(1,:);
y5=tb1renkou(1,:);
%%GDP相关数据
gdp_total = tb1GDP(1,:);
gdp_nonglin = tb1GDP(2,:);
gdp_nenggong = tb1GDP(4,:);
gdp_gongye = tb1GDP(5,:);
gdp_jiaotong = tb1GDP(7,:);
gdp_jianzhu = tb1GDP(8,:);
%人均GDP相关数据
avr_gdp_total = tb1GDP(1,:)./y5;
avr_gdp_nonglin = tb1GDP(2,:)./y5;
avr_gdp_nenggong = tb1GDP(4,:)./y5;
avr_gdp_gongye = tb1GDP(5,:)./y5;
avr_gdp_jiaotong = tb1GDP(7,:)./y5;
avr_gdp_jianzhu = tb1GDP(8,:)./y5;
%能源消费量相关
energy_total = tb1nengxiao(1,:);
energy_nonglin = tb1nengxiao(2,:);
energy_nenggong = sum(tb1nengxiao(4:7, :), 1);
energy_gongye = tb1nengxiao(8,:);
energy_jiaotong = tb1nengxiao(10,:);
energy_jianzhu = tb1nengxiao(11,:);
energy_jumin = tb1nengxiao(12,:);
%人均能源消费量相关
avr_energy_total = tb1nengxiao(1,:)./y5;
avr_energy_nonglin = tb1nengxiao(2,:)./y5;
avr_energy_nenggong = sum(tb1nengxiao(4:7, :), 1)./y5;
avr_energy_gongye = tb1nengxiao(8,:)./y5;
avr_energy_jiaotong = tb1nengxiao(10,:)./y5;
avr_energy_jianzhu = tb1nengxiao(11,:)./y5;
avr_energy_jumin = tb1nengxiao(12,:)./y5;
%单位GDP能耗相关 
avrGDP_energy_total = tb1nengxiao(1,:)./tb1GDP(1,:);
avrGDP_energy_nonglin = tb1nengxiao(2,:)./tb1GDP(2,:);
avrGDP_energy_nenggong = sum(tb1nengxiao(4:7, :), 1)./tb1GDP(4,:);
avrGDP_energy_gongye = tb1nengxiao(8,:)./tb1GDP(5,:);
avrGDP_energy_jiaotong = tb1nengxiao(10,:)./tb1GDP(7,:);
avrGDP_energy_jianzhu = tb1nengxiao(11,:)./tb1GDP(8,:);
%碳排放量相关

carbon_nenggong_meitan = tb2nenggong(1,:).*tb1pingzhong(2,:) + tb2nenggong(7,:).*tb1pingzhong(3,:)...
+ tb2nenggong(13,:).*tb1pingzhong(4,:)+ tb2nenggong(19,:).*tb1pingzhong(5,:);
carbon_nenggong_youping = tb2nenggong(2,:).*tb1pingzhong(8,:) + tb2nenggong(8,:).*tb1pingzhong(9,:)...
+ tb2nenggong(14,:).*tb1pingzhong(10,:)+ tb2nenggong(20,:).*tb1pingzhong(11,:);
carbon_nenggong_tianranqi = tb2nenggong(3,:).*tb1pingzhong(14,:) + tb2nenggong(9,:).*tb1pingzhong(15,:)...
+ tb2nenggong(15,:).*tb1pingzhong(16,:)+ tb2nenggong(21,:).*tb1pingzhong(17,:);
carbon_nenggong = carbon_nenggong_meitan+carbon_nenggong_youping+carbon_nenggong_tianranqi;

carbon_total = tb2tanpai(1,:)+carbon_nenggong;
carbon_nonglin = tb2tanpai(2,:);
carbon_gongye = tb2tanpai(3,:);
carbon_jiaotong = tb2tanpai(5,:);
carbon_jianzhu = tb2tanpai(6,:);
carbon_jvmin = tb2tanpai(7,:);

%单位GDP碳排放量相关
avr_carbon_nenggong = carbon_nenggong ./y5;
avrGDP_carbon_total = (tb2tanpai(1,:)+carbon_nenggong)./tb1GDP(1,:);
%人均碳排放量相关
avr_carbon_total = (tb2tanpai(1,:)+carbon_nenggong)./y5;
avr_carbon_nonglin = tb2tanpai(2,:)./y5;
avr_carbon_gongye = tb2tanpai(3,:)./y5;
avr_carbon_jiaotong = tb2tanpai(5,:)./y5;
avr_carbon_jianzhu = tb2tanpai(6,:)./y5;
avr_carbon_jvmin = tb2tanpai(7,:)./y5;

carbon_nenggong_meitan = tb2nenggong(1,:).*tb1pingzhong(2,:) + tb2nenggong(7,:).*tb1pingzhong(3,:)...
+ tb2nenggong(13,:).*tb1pingzhong(4,:)+ tb2nenggong(19,:).*tb1pingzhong(5,:);
carbon_nenggong_youping = tb2nenggong(2,:).*tb1pingzhong(8,:) + tb2nenggong(8,:).*tb1pingzhong(9,:)...
+ tb2nenggong(14,:).*tb1pingzhong(10,:)+ tb2nenggong(20,:).*tb1pingzhong(11,:);
carbon_nenggong_tianranqi = tb2nenggong(3,:).*tb1pingzhong(14,:) + tb2nenggong(9,:).*tb1pingzhong(15,:)...
+ tb2nenggong(15,:).*tb1pingzhong(16,:)+ tb2nenggong(21,:).*tb1pingzhong(17,:);
avr_carbon_nenggong = (carbon_nenggong_meitan+carbon_nenggong_youping+carbon_nenggong_tianranqi)./y5;
 
%% 计算缺失值，包括建筑消费部门煤炭两个因子、发电环节的热力两个因子
%建筑消费煤炭
year = [2010, 2011, 2013, 2014, 2015, 2016, 2017, 2018, 2019];
data =  [2.66367345989080	2.66367345989080	2.65251185562193	2.66367345989080	2.62265793011272	2.66367345989080	2.66367345989080	2.66367345989080	2.66367345989080]; % 对应的数据

% 需要插值的年份
x_interp = 2012;

% 使用牛顿插值法
interp_value = interp1(year, data, x_interp, 'linear');

%%平均
year = [2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019];
data =  [2.66367345989080	2.66367345989080 2.6581	2.65251185562193	2.66367345989080	2.62265793011272	2.66367345989080	2.66367345989080	2.66367345989080	2.66367345989080]; % 对应的数据


% 缺失的年份
missing_year = 2020;

% 使用指数平滑法
alpha = 0.2; % 平滑系数
smoothed_value = data(end) + alpha * (data(end) - data(end-1));


%发电热力
year = [2010, 2011, 2013, 2014, 2015, 2016, 2017, 2018, 2019 2020];
data =  [2.90611183899547	2.91631904625311	2.96658750617438	2.99762347293409	3.10658624342983	3.19042149678183	3.27768003162375	3.74493506499443	3.66180998190003	3.70500073865449];
% 需要插值的年份
x_interp = 2012;

% 使用线性插值法
interp_value = interp1(year, data, x_interp, 'linear');


%% 计算协方差矩阵
data_matrix = [y5', gdp_total', energy_total',carbon_total'];

% 计算协方差矩阵
covariance_matrix = corrcoef(data_matrix);
disp('协方差矩阵：');
disp(covariance_matrix);

%% 四个变量的主要折线
figure;
subplot(2, 2, 1);
plot(years,y2,'r*-','LineWidth',2);
xlabel('年份');
ylabel('GDP（单位：亿元）');
legend('GDP');
grid on;
hold on;

subplot(2, 2, 2);
plot(years,y3,'g*-','LineWidth',2);
xlabel('年份');
ylabel('能源消耗量（单位：万tce）');
legend('能源消耗量');
grid on;

subplot(2, 2, 3);
plot(years,y4,'b*-','LineWidth',2);
xlabel('年份');
ylabel('碳排放量（单位：万tCO2）');
legend('碳排放量');
grid on;

subplot(2, 2, 4);
plot(years,y5,'y*-','LineWidth',2);
xlabel('年份');
ylabel('人口总量（单位：万人）');
legend('人口');
grid on;

figure;
plot(years,y2./y5,'*-','LineWidth',2);
hold on;
plot(years,y3./y5,'*-','LineWidth',2);
plot(years,y4./y5,'*-','LineWidth',2);
legend('GDP', '能源消耗量', '碳排放');
grid on;

%% GDP柱+折线

figure;
bar(years, [gdp_total; gdp_nonglin;gdp_nenggong;gdp_gongye;gdp_jiaotong;gdp_jianzhu;]');
xlabel('年份');
ylabel('GDP（单位：亿元）');
title('生产总值及各部门数据');

hold on;

% 绘制总量的折线图
plot(years-0.33, gdp_total, 'b*-', 'LineWidth', 1);
legend('总量','农林消费部门', '能源供应部门', '工业消费部门', '交通运输部门','建筑消费部门');
grid on;
%% 人均GDP柱+折线

figure;
bar(years, [avr_gdp_total; avr_gdp_nonglin;avr_gdp_nenggong;avr_gdp_gongye;avr_gdp_jiaotong;avr_gdp_jianzhu;]');
xlabel('年份');
ylabel('GDP（单位：万元/人）');
title('人均GDP及各部门人均数据');

hold on;

% 绘制总量的折线图
plot(years-0.33, avr_gdp_total, 'b*-', 'LineWidth', 1);
legend('人均GDP','农林消费部门', '能源供应部门', '工业消费部门', '交通运输部门','建筑消费部门');
grid on;

%% 人口
plot(x,y5,'o-','LineWidth',2);

xlabel('年份');
ylabel('常住人口总量（单位：万人）');
title('2010-2020人口总量变化数据');
legend('常驻人口总量');
grid on;

%% 能源消费量


figure;
bar(years, [energy_total; energy_nonglin;energy_nenggong;energy_gongye;energy_jiaotong;energy_jianzhu;energy_jumin]');
xlabel('年份');
ylabel('（单位：万tce）');
title('2010-2020能源消费量总量及各部门数据');

hold on;

% 绘制总量的折线图
plot(years-0.34, energy_total, 'b*-', 'LineWidth', 1);
legend('总量','农林消费部门','能源供应部门','工业消费部门', '交通运输部门','建筑消费部门','居民生活消费');
grid on;

%% 人均能源消费量

figure;
bar(years, [avr_energy_total; avr_energy_nonglin;avr_energy_nenggong;avr_energy_gongye;avr_energy_jiaotong;avr_energy_jianzhu;avr_energy_jumin]');
xlabel('年份');
ylabel('（单位：tce/人）');
title('2010-2020人均能源消费量及各部门人均数据');

hold on;

绘制总量的折线图
plot(years-0.34, avr_energy_total, 'b*-', 'LineWidth', 1);
legend('人均能源消费量','农林消费部门','能源供应部门','工业消费部门', '交通运输部门','建筑消费部门','居民生活消费');
grid on;

%% 单位GDP能耗

figure;
% bar(years, [avrGDP_energy_total; avrGDP_energy_nonglin;avrGDP_energy_nenggong;avrGDP_energy_gongye;avrGDP_energy_jiaotong;avrGDP_energy_jianzhu]');
bar(years, avrGDP_energy_total);
xlabel('年份');
ylabel('（单位：万tce/亿元）');
title('2010-2020单位GDP能源消费量数据');

hold on;

% 绘制总量的折线图
plot(years-0, avrGDP_energy_total, 'r*-', 'LineWidth', 1);
legend('单位GDP能源消费总量');
grid on;

%% 碳排放量

figure;
bar(years, [carbon_total; carbon_nonglin;carbon_nenggong;carbon_gongye;carbon_jiaotong;carbon_jianzhu;carbon_jvmin]');
xlabel('年份');
ylabel('（单位：万tCO2）');
title('2010-2020碳排放量总量及各部门数据');

hold on;

% 绘制总量的折线图
plot(years-0.34, carbon_total, 'b*-', 'LineWidth', 1);
legend('总量','农林消费部门','能源供应部门', '工业消费部门', '交通运输部门','建筑消费部门','居民生活消费');
grid on;

%% 单位GDP碳排放量

figure;
bar(years, avrGDP_carbon_total);
xlabel('年份');
ylabel('（单位：万tCO2/亿元）');
title('2010-2020单位GDP碳排放量数据');
% axis([2009.5 2020.5 0 9.3]);
hold on;

% 绘制总量的折线图
plot(years-0, avrGDP_carbon_total, 'r*-', 'LineWidth', 1);
legend('单位GDP碳排放量');
grid on;

%% 人均碳排放量

figure;
bar(years, [avr_carbon_total; avr_carbon_nonglin;avr_carbon_nenggong;avr_carbon_gongye;avr_carbon_jiaotong;avr_carbon_jianzhu;avr_carbon_jvmin]');
xlabel('年份');
ylabel('（单位：tCO2/人）');
title('2010-2020人均碳排放量及各部门人均数据');
axis([2009.5 2020.5 0 9.3]);
hold on;

% 绘制总量的折线图
plot(years-0.34, avr_carbon_total, 'b*-', 'LineWidth', 1);
legend('人均碳排放量','农林消费部门','能源供应部门', '工业消费部门', '交通运输部门','建筑消费部门','居民生活消费');
grid on;


%% 分开
subplot(2, 2, 1);
plot(x, y1);
hold on;
scatter(x, y1, 'r', 'filled')
title('tb1__chanye');

subplot(2, 2, 2);
plot(x, y2);
hold on;
scatter(x, y2, 'r', 'filled')
title('tb1__GDP');

subplot(2, 2, 3);
plot(x, y3);
hold on;
scatter(x, y3, 'r', 'filled')
title('tb1__nengxiao');

subplot(2, 2, 4);
plot(x, y4);
hold on;
scatter(x, y4, 'r', 'filled')
title('tb1__pingzhong');

%% GDP与能源消费量关系

% 创建一个线性回归模型
mdl = fitlm(gdp_total, energy_total);

% 显示回归模型的统计信息
disp(mdl);

% 获取相关系数（Pearson相关系数）
corr_coefficient = corrcoef(gdp_total, energy_total);
disp(['GDP总量与能源消费总量相关系数=', num2str(corr_coefficient(1,2))]);
% 绘制散点图和回归线
figure;
% scatter(gdp_total, energy_total, 'filled');
hold on;
plot(mdl);

title('GDP总量与能源消费总量的关系');
xlabel('GDP总量数据');
ylabel('能源消费总量数据');
% legend('数据点', '回归线');

% 检查回归模型的拟合度
figure;
plotResiduals(mdl, 'fitted');
title('总量残差图');
legend('各点残差');


%% 单位能源消费量产生GDP(能源利用率）关系

figure;
% bar(years, [avrGDP_energy_total; avrGDP_energy_nonglin;avrGDP_energy_nenggong;avrGDP_energy_gongye;avrGDP_energy_jiaotong;avrGDP_energy_jianzhu]');
% bar(years, avrGDP_energy_total);
xlabel('年份');
ylabel('（单位：亿元/万tce）');
title('2010-2020能源利用效率');

hold on;

% 绘制总量的折线图
plot(years-0, 1./avrGDP_energy_total, 'b*-', 'LineWidth', 1);
legend('能源利用效率');
grid on;
%% 人均GDP与能源消费量关系

创建一个线性回归模型
mdl1 = fitlm(avr_gdp_total, avr_energy_total);

显示回归模型的统计信息
disp(mdl1);

获取相关系数（Pearson相关系数）
corr_coefficient = corrcoef(avr_gdp_total, avr_energy_total);
disp(['人均GDP与人均能源消费量相关系数=', num2str(corr_coefficient(1,2))]);
绘制散点图和回归线
figure;
hold on;
plot(mdl1);

title('人均GDP与人均能源消费量的关系');
xlabel('人均GDP数据');
ylabel('人均能源消费量数据');
legend('数据点', '回归线');

检查回归模型的拟合度
figure;
plotResiduals(mdl1, 'fitted');
title('人均残差图');
legend('各点残差');




%% 人均GDP与碳排放回归分析

% 计算各总量与碳排放量的相关系数
corr_economic = corrcoef(gdp_total, carbon_total);
corr_population = corrcoef(y5, carbon_total);
corr_energy = corrcoef(energy_total, carbon_total);
% 计算各人均量与碳排放量的相关系数
corr_avr_economic = corrcoef(avr_gdp_total, carbon_total);
corr_avr_energy = corrcoef(avr_energy_total, carbon_total);

disp(['GDP总量与碳排放的相关系数: ', num2str(corr_economic(1,2))]);
disp(['人口与碳排放的相关系数: ', num2str(corr_population(1,2))]);
disp(['能源消耗量与碳排放的相关系数: ', num2str(corr_energy(1,2))]);
disp(['人均GDP与碳排放的相关系数: ', num2str(corr_avr_economic(1,2))]);
disp(['人均能源消耗量与碳排放的相关系数: ', num2str(corr_avr_energy(1,2))]);

% % 创建一个线性回归模型
mdl2 = fitlm(avr_energy_total, carbon_total);

% 绘制散点图和回归线
figure;
% scatter(gdp_total, energy_total, 'filled');
hold on;
plot(mdl2);

title('人均能源消费量与碳排放量的关系');
xlabel('人均能源消费量');
ylabel('碳排放量');
% legend('数据点', '回归线');

% 检查回归模型的拟合度
figure;
plotResiduals(mdl1, 'fitted');
title('残差图');
legend('各点残差');

%% 增长率模型
%GDP增长率
gdp_growth = diff(gdp_total) ./ gdp_total(1:end-1) * 100;
years_increase = 2011:2020;
figure;
plot(years_increase, gdp_growth, '-o', 'LineWidth', 2);
title('2011-2020年GDP增长率');
xlabel('年份');
ylabel('增长率 (%)');
legend('GDP');
grid on;

%人口增长率
population_growth = diff(y5) ./ y5(1:end-1) * 100;
years_increase = 2011:2020;
% figure;
hold on;
plot(years_increase, population_growth, '-o', 'LineWidth', 2);
title('2011-2020年人口增长率');
xlabel('年份');
ylabel('增长率 (%)');
legend('人口');
grid on;

%能消增长率
energy_growth = diff(energy_total) ./ energy_total(1:end-1) * 100;
years_increase = 2011:2020;
% figure;
plot(years_increase, energy_growth, '-o', 'LineWidth', 2);
title('2011-2020年能源消耗量增长率');
xlabel('年份');
ylabel('增长率 (%)');
legend('能源消耗量');
grid on;

%碳排放增长率
carbon_growth = diff(carbon_total) ./ carbon_total(1:end-1) * 100;
years_increase = 2011:2020;
% figure;
plot(years_increase, carbon_growth, '-o', 'LineWidth', 2);
title('2011-2020年碳排放增长率');
xlabel('年份');
ylabel('增长率 (%)');
legend('碳排放量');
grid on;

%人均GDP增长率

avr_gdp_growth = diff(avr_gdp_total) ./ avr_gdp_total(1:end-1) * 100;
years_increase = 2011:2020;
figure;
plot(years_increase, avr_gdp_growth, '-o', 'LineWidth', 2);
title('2011-2020年人均GDP增长率');
xlabel('年份');
ylabel('增长率 (%)');
legend('GDP');
grid on;

%能消增长率
avr_energy_growth = diff(avr_energy_total) ./ energy_total(1:end-1) * 100;
years_increase = 2011:2020;
% figure;
plot(years_increase, avr_energy_growth, '-o', 'LineWidth', 2);
title('2011-2020年人均能源消耗量增长率');
xlabel('年份');
ylabel('增长率 (%)');
legend('能源消耗量');
grid on;

corr_delta_energy = corrcoef(energy_growth, carbon_growth);
corr_delta_economic = corrcoef(gdp_growth, carbon_growth);
corr_delta_population = corrcoef(population_growth, carbon_growth);

corr_delta_avr_economic = corrcoef(avr_gdp_growth, carbon_growth);
corr_delta_avr_energy = corrcoef(avr_energy_growth, carbon_growth);

disp(['GDP增长率与碳排放增长率的相关系数: ', num2str(corr_delta_economic(1,2))]);
disp(['人口增长率与碳排放增长率的相关系数: ', num2str(corr_delta_population(1,2))]);
disp(['能源消耗量增长率与碳排放增长率的相关系数: ', num2str(corr_delta_energy(1,2))]);
disp(['人均GDP增长率与碳排放增长率的相关系数: ', num2str(corr_delta_avr_economic(1,2))]);
disp(['人均能源消耗量增长率与碳排放增长率的相关系数: ', num2str(corr_delta_avr_energy(1,2))]);

