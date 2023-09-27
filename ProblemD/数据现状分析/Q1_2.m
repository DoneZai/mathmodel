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

carbon_total_2010 = carbon_total(1);
carbon_nonglin_2010 = carbon_nonglin(1);
carbon_nenggong_2010 = carbon_nenggong(1);
carbon_gongye_2010 = carbon_gongye(1);
carbon_jiaotong_2010 = carbon_jiaotong(1);
carbon_jianzhu_2010 = carbon_jianzhu(1);
carbon_jvmin_2010 = carbon_jvmin(1);
carbon_2010 = [carbon_total_2010; carbon_nonglin_2010;carbon_nenggong_2010;carbon_gongye_2010;carbon_jiaotong_2010;carbon_jianzhu_2010;carbon_jvmin_2010];

carbon_total_125 = sum(carbon_total(:,2:6),2);
carbon_nonglin_125 = sum(carbon_nonglin(:,2:6),2);
carbon_nenggong_125 = sum(carbon_nenggong(:,2:6),2);
carbon_gongye_125 =  sum(carbon_gongye(:,2:6),2);
carbon_jiaotong_125 =   sum(carbon_jiaotong(:,2:6),2);
carbon_jianzhu_125 = sum(carbon_jianzhu(:,2:6),2);
carbon_jvmin_125 =  sum(carbon_jvmin(:,2:6),2);
carbon_125 = [carbon_total(:,2:6); carbon_nonglin(:,2:6); carbon_nenggong(:,2:6); carbon_gongye(:,2:6);
carbon_jiaotong(:,2:6); carbon_jianzhu(:,2:6); carbon_jvmin(:,2:6)];

carbon_total_135 = sum(carbon_total(:,7:11),2);
carbon_nonglin_135 = sum(carbon_nonglin(:,7:11),2);
carbon_nenggong_135 = sum(carbon_nenggong(:,7:11),2);
carbon_gongye_135 =  sum(carbon_gongye(:,7:11),2);
carbon_jiaotong_135 = sum(carbon_jiaotong(:,7:11),2);
carbon_jianzhu_135 = sum(carbon_jianzhu(:,7:11),2);
carbon_jvmin_135 =  sum(carbon_jvmin(:,7:11),2);
carbon_135 = [carbon_total(:,7:11); carbon_nonglin(:,7:11); carbon_nenggong(:,7:11); carbon_gongye(:,7:11);
              carbon_jiaotong(:,7:11); carbon_jianzhu(:,7:11); carbon_jvmin(:,7:11)];
%% 十二五十三五年增长率趋势
growth_carbon_total = (carbon_total - carbon_total_2010)/carbon_total_2010*100;
growth_carbon_diyi = (tb2tanpai(2,:) - carbon_nonglin_2010)/carbon_nonglin_2010*100;
growth_carbon_dier = (tb2tanpai(3,:)+carbon_nenggong - carbon_gongye_2010-carbon_nenggong_2010)/(carbon_gongye_2010+carbon_nenggong_2010)*100;
% growth_carbon_dier = (tb2tanpai(3,:) - carbon_gongye_2010)/carbon_gongye_2010*100;

growth_carbon_disan = (tb2tanpai(4,:) - tb2tanpai(4,1))/ tb2tanpai(4,1)*100;
growth_carbon_shenghuo = (tb2tanpai(7,:) - carbon_jvmin_2010)/carbon_jvmin_2010*100;


figure;
area([2011 2015], 100*[1 1], 'FaceColor', [1 0.9 0.9], 'EdgeColor', 'none');
hold on;
area([2016 2020], 100*[1 1], 'FaceColor', [0.8 1 1], 'EdgeColor', 'none');
plot(years,growth_carbon_total,'*-','LineWidth',2);
plot(years,growth_carbon_diyi,'*-','LineWidth',2);
plot(years,growth_carbon_dier,'*-','LineWidth',2);
plot(years,growth_carbon_disan,'*-','LineWidth',2);
plot(years,growth_carbon_shenghuo,'*-','LineWidth',2);

xlabel('时期');
ylabel('增长率（%）');
title('以2010年为基期的碳排放量年增长率状况');
legend('十二五时期','十三五时期','总量','第一产业', '第二产业', '第三产业', '居民消费');




%% 十二五十三五年均总量对比
figure;
bar(1:3, [carbon_total_2010 carbon_total_125/5 carbon_total_135/5;carbon_nonglin_2010 carbon_nonglin_125/5 carbon_nonglin_135/5;carbon_nenggong_2010 carbon_nenggong_125/5 carbon_nenggong_135/5; ...
    carbon_gongye_2010 carbon_gongye_125/5 carbon_gongye_135/5;carbon_jiaotong_2010 carbon_jiaotong_125/5 carbon_jiaotong_135/5;carbon_jianzhu_2010 carbon_jianzhu_125/5 carbon_jianzhu_135/5;carbon_jvmin_2010 carbon_jvmin_125/5 carbon_jvmin_135/5]');
xticks([1, 2, 3]);
xticklabels({'2010年', '十二五期间', '十三五期间'});
xlabel('时期');
ylabel('年均碳排放量（2010年为当年碳排放量）（单位：万tCO2）');
title('十二五、十三五期间年均碳排放量状况');
legend('年均排放总量','农林消费部门', '能源供应部门', '工业消费部门', '交通运输部门','建筑消费部门','居民生活消费');
hold on;

%% 十二五十三五年均增长率

growth_carbon_125 = (carbon_125(:,5)./carbon_2010).^0.2-1;
growth_carbon_135 = (carbon_135(:,5)./carbon_125(:,5)).^0.2-1;

% 设置部门名称
departmentNames = {'年均排放总量','农林消费部门', '能源供应部门', '工业消费部门', '交通运输部门','建筑消费部门','居民生活消费'};

% 绘制柱状图
figure;
bar([growth_carbon_125'; growth_carbon_135']');
title('十二五与十三五时期碳排放量年均增长率比较');
xlabel('部门');
ylabel('增长率');
legend('十二五', '十三五');
set(gca, 'XTickLabel', departmentNames);

% 添加数据标签
text(1:length(departmentNames), twelveFive, num2str(twelveFive'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
text(1:length(departmentNames), thirteenFive, num2str(thirteenFive'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');
grid on;

%% 能源消费部门各品类碳排放情况
pinglei_nonglin_carbon = tb1chanye(1:6,:).*tb2nengxiao(1:6,:);
pinglei_gongye_carbon = tb1chanye(19:24,:).*tb2nengxiao(7:12,:);
pinglei_jiaotong_carbon = tb1chanye(31:36,:).*tb2nengxiao(13:18,:);
pinglei_jianzhu_carbon = tb1chanye(37:42,:).*tb2nengxiao(19:24,:);
pinglei_jvmin_carbon = tb1chanye(43:48,:).*tb2nengxiao(25:30,:);

meitan_carbon = pinglei_nonglin_carbon(1,:)+pinglei_gongye_carbon(1,:)+pinglei_jiaotong_carbon(1,:)+pinglei_jianzhu_carbon(1,:)+pinglei_gongye_carbon(1,:)+pinglei_jvmin_carbon(1,:)+carbon_nenggong_meitan;
youping_carbon= pinglei_nonglin_carbon(2,:)+pinglei_gongye_carbon(2,:)+pinglei_jiaotong_carbon(2,:)+pinglei_jianzhu_carbon(2,:)+pinglei_gongye_carbon(2,:)+pinglei_jvmin_carbon(2,:)+carbon_nenggong_youping ;
tianranqi_carbon= pinglei_nonglin_carbon(3,:)+pinglei_gongye_carbon(3,:)+pinglei_jiaotong_carbon(3,:)+pinglei_jianzhu_carbon(3,:)+pinglei_gongye_carbon(3,:)+pinglei_jvmin_carbon(3,:)+carbon_nenggong_tianranqi;
reli_carbon= pinglei_nonglin_carbon(4,:)+pinglei_gongye_carbon(4,:)+pinglei_jiaotong_carbon(4,:)+pinglei_jianzhu_carbon(4,:)+pinglei_gongye_carbon(4,:)+pinglei_jvmin_carbon(4,:);
dianli_carbon= pinglei_nonglin_carbon(5,:)+pinglei_gongye_carbon(5,:)+pinglei_jiaotong_carbon(5,:)+pinglei_jianzhu_carbon(5,:)+pinglei_gongye_carbon(5,:)+pinglei_jvmin_carbon(5,:)+tb2waidi.*tb1pingzhong(21,:);
% qita_carbon= pinglei_nonglin_carbon(6,:)+pinglei_gongye_carbon(6,:)+pinglei_jiaotong_carbon(6,:)+pinglei_jianzhu_carbon(6,:)+pinglei_gongye_carbon(6,:)+pinglei_jvmin_carbon(6,:);

figure;
bar(1:3, [meitan_carbon(1) sum(meitan_carbon(2:6))/5 sum(meitan_carbon(7:11))/5;youping_carbon(1) sum(youping_carbon(2:6))/5 sum(youping_carbon(7:11))/5;tianranqi_carbon(1) sum(tianranqi_carbon(2:6))/5 sum(tianranqi_carbon(7:11))/5; ...
    reli_carbon(1) sum(reli_carbon(2:6))/5 sum(reli_carbon(7:11))/5;dianli_carbon(1) sum(dianli_carbon(2:6))/5 sum(dianli_carbon(7:11))/5]');
xticks([1, 2, 3]);
xticklabels({'2010年', '十二五期间', '十三五期间'});
xlabel('时期');
ylabel('年均碳排放量（2010年为当年碳排放量）（单位：万tCO2）');
title('十二五、十三五期间各品种能源碳排放量状况');
legend('煤炭','油品','天然气', '热力', '电力');
hold on;

%% 计算各品种能源的占比
carbo_pinzhong_2010 = [meitan_carbon(1), youping_carbon(1), tianranqi_carbon(1), reli_carbon(1), dianli_carbon(1)];
carbo_pinzhong_125 = [sum(meitan_carbon(2:6))/5, sum(youping_carbon(2:6))/5, sum(tianranqi_carbon(2:6))/5, sum(reli_carbon(2:6))/5, sum(dianli_carbon(2:6))/5];
carbo_pinzhong_135 = [sum(meitan_carbon(7:11))/5, sum(youping_carbon(7:11))/5, sum(tianranqi_carbon(7:11))/5, sum(reli_carbon(7:11))/5, sum(dianli_carbon(7:11))/5];
% 对应的部门名称
carbo_pinzhong_names = {'煤炭','油品','天然气', '热力', '电力'};


total_emissions_2010 = sum(carbo_pinzhong_2010);
percentage_2010 = (carbo_pinzhong_2010 / total_emissions_2010) * 100;

total_emissions_125 = sum(carbo_pinzhong_125);
percentage_125 = (carbo_pinzhong_125 / total_emissions_125) * 100;

total_emissions_135 = sum(carbo_pinzhong_135);
percentage_135 = (carbo_pinzhong_135 / total_emissions_135) * 100;

% 绘制饼状图
figure;
subplot(1, 3, 1);
pie(carbo_pinzhong_2010, carbo_pinzhong_names);
title('2010年各品种能源碳排放占比');
% 添加标注
labels = cellfun(@(x) sprintf('%s: %.2f%%', x{1}, x{2}), num2cell([carbo_pinzhong_names', num2cell(percentage_2010')], 2), 'UniformOutput', false);
legend(labels, 'Location', 'BestOutside');

subplot(1, 3, 2);
pie(carbo_pinzhong_125, carbo_pinzhong_names);
title('十二五期间各品种能源碳排放占比');
% 添加标注
labels = cellfun(@(x) sprintf('%s: %.2f%%', x{1}, x{2}), num2cell([carbo_pinzhong_names', num2cell(percentage_125')], 2), 'UniformOutput', false);
legend(labels, 'Location', 'BestOutside');

subplot(1, 3, 3);
pie(carbo_pinzhong_135, carbo_pinzhong_names);
title('十三五期间各品种能源碳排放占比');
% 添加标注
labels = cellfun(@(x) sprintf('%s: %.2f%%', x{1}, x{2}), num2cell([carbo_pinzhong_names', num2cell(percentage_135')], 2), 'UniformOutput', false);
legend(labels, 'Location', 'BestOutside');

%% 单位能耗二氧化碳排放

avrenergy_carbon_total = tb2tanpai(1,:)./tb1nengxiao(1,:);
figure;
xlabel('年份');
ylabel('（单位：tCO2/tce）');
title('2010-2020单位能耗二氧化碳排放数据');

hold on;
% 绘制总量的折线图
plot(years, avrenergy_carbon_total, 'r*-', 'LineWidth', 1);
legend('单位能耗碳排放量');
grid on;

%% 不同能源消费占比
% 对应的部门名称
carbo_pinzhong_names = {'煤炭','油品','天然气', '新能源电力', '外地调入电力','其他新能源'};
carbo_pinzhong_2010 = [tb1pingzhong(1,1) tb1pingzhong(7,1) tb1pingzhong(13,1) tb1pingzhong(20,1) tb1pingzhong(21,1) tb1pingzhong(22,1)];    
carbo_pinzhong_125 = [sum(tb1pingzhong(1,2:6),2) sum(tb1pingzhong(7,2:6),2) sum(tb1pingzhong(13,2:6),2) sum(tb1pingzhong(20,2:6),2) sum(tb1pingzhong(21,2:6),2) sum(tb1pingzhong(22,2:6),2)];    
carbo_pinzhong_135 = [sum(tb1pingzhong(1,7:11),2) sum(tb1pingzhong(7,7:11),2) sum(tb1pingzhong(13,7:11),2) sum(tb1pingzhong(20,7:11),2) sum(tb1pingzhong(21,7:11),2) sum(tb1pingzhong(22,7:11),2)];    

total_emissions_2010 = sum(carbo_pinzhong_2010);
percentage_2010 = (carbo_pinzhong_2010 / total_emissions_2010) * 100;

total_emissions_125 = sum(carbo_pinzhong_125);
percentage_125 = (carbo_pinzhong_125 / total_emissions_125) * 100;

total_emissions_135 = sum(carbo_pinzhong_135);
percentage_135 = (carbo_pinzhong_135 / total_emissions_135) * 100;

% 绘制饼状图
figure;
subplot(1, 3, 1);
% pie(carbo_pinzhong_2010, carbo_pinzhong_names);
h = pie(carbo_pinzhong_2010, carbo_pinzhong_names);
% 隐藏成分名称
hText = findobj(h, 'Type', 'text');
set(hText, {'String'}, {''});
title('2010年各品种能源能耗占比');
% 添加标注
labels = cellfun(@(x) sprintf('%s: %.2f%%', x{1}, x{2}), num2cell([carbo_pinzhong_names', num2cell(percentage_2010')], 2), 'UniformOutput', false);
legend(labels, 'Location', 'best');

subplot(1, 3, 2);
h = pie(carbo_pinzhong_125, carbo_pinzhong_names);
% 隐藏成分名称
hText = findobj(h, 'Type', 'text');
set(hText, {'String'}, {''});
title('十二五期间各品种能源能耗占比');
% 添加标注
labels = cellfun(@(x) sprintf('%s: %.2f%%', x{1}, x{2}), num2cell([carbo_pinzhong_names', num2cell(percentage_125')], 2), 'UniformOutput', false);
legend(labels, 'Location', 'best');

subplot(1, 3, 3);
h = pie(carbo_pinzhong_135, carbo_pinzhong_names);
% 隐藏成分名称
hText = findobj(h, 'Type', 'text');
set(hText, {'String'}, {''});
title('十三五期间各品种能源能耗占比');
% 添加标注
labels = cellfun(@(x) sprintf('%s: %.2f%%', x{1}, x{2}), num2cell([carbo_pinzhong_names', num2cell(percentage_135')], 2), 'UniformOutput', false);
legend(labels, 'Location', 'best');

%% GDP拟合预测
% %线性拟合
% % 已知数据
% years = [2020, 2035, 2060];
% GDP = [88683.21463, 177366.4293, 354732.8585]; % 对应年份的GDP数据
% 
% % 中间年份
% missing_years = 2021:2059;
% 
% % 线性插值
% missing_GDP = interp1(years, GDP, missing_years, 'linear');
% 
% % 合并所有数据
% all_years = [2010:2020, missing_years, 2060];
% all_GDP = [gdp_total, missing_GDP, 354732.8585];
% 
% % 绘制预测结果
% figure;
% plot(all_years, all_GDP, 'b-', 'LineWidth', 2);
% hold on;
% title('GDP预测');
% xlabel('年份');
% ylabel('GDP');
% grid on;

% 多项式拟合
% 已知数据
years = [2010:2020, 2035, 2060]; % 年份
% 对应的GDP数据,2035、2060年GDP分别为2020年的两倍和四倍
GDP = [gdp_total,1.773664293000000e+05, 354732.8585]; 

% 多项式拟合
degree = 2; % 设置多项式的阶数，可以根据实际情况调整
p = polyfit(years, GDP, degree);

% 生成拟合后的数据
years_fit = 2010:2060;
GDP_fit = polyval(p, years_fit);

% 绘制拟合结果
plot(years, GDP, 'r*', 'LineWidth', 2); hold on;
plot(years_fit, GDP_fit, 'b-', 'LineWidth', 2);
title('GDP总量预测情况');
xlabel('年份');
ylabel('GDP总量');
legend('已知数据', '拟合结果');
grid on;


%% 人口logistics预测
%t:时间（年）  
%p:各年人口总数（万人）  
%pm:最大人口容量  
t = 2010:2020;  
p = y5;
p0 = p(1);  
	r_x=polyfit(p(2:end),diff(p)./p(2:end),1);  
	pm = -r_x(2)/r_x(1);  
	  
	y=-log((pm*p0-p*p0)./(pm*p-p*p0));  
	k=polyfit(t-1961,y,2);  %以3次多项式拟合
% 	  
% 拟合数据与实际数据的误差  
	f=@(t)pm./(1+exp(-polyval(k,t-1961))*(pm/p0-1));  
	err=norm(f(t)-p);  
	  
% 	绘图  
    figure;
	plot(t,p,'r*', 'LineWidth', 2); 
	hold on  
	fplot(f,[2010,2060],'b', 'LineWidth', 2); 
	axis([2010,2060,7850,pm+50]) 
    legend('已知数据', '拟合及预测结果');
    title('2010-2060人口总量情况');
	xlabel("年份");ylabel("人口总数（万人）");  
    grid on;
    renkou = f(2010:2060)';