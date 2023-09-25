function [gm11,PreData] = GM11_model(X,td)
%灰色模型GM(1,1),用于中短期预测
%x为原始数据，td为未来预测期数

%% 数据处理
 n  = length(X);  %原始数据数量
 Ago = cumsum(X); % 原始数据一次累加 获取新1-AGO序列xi(1)
 Z = (Ago(1:end-1) + Ago(2:end) ) / 2;  % 紧邻均值生成数列（长度为n-1）

 Yn = X(2:end)'; %Yn是常数项向量 X(2),x(3)
 B = [-Z;ones(1,n-1)]'; %累加生成数据作均值

 %% 最小二乘法求解发展系数a和灰色作用量u
 LS_solution = (B'*B)\(B'*Yn); %% 利用公式求解a,u
 a = LS_solution(1);   %%发展系数a
 u = LS_solution(2);  %%灰色作用量u

 %%建立灰度GM(1,1)模型，白化一元一阶微分方程
 F = [X(1),(X(1)-u/a)./exp(a*(1:n+td-1))+u/a];

 %% 还原序列，得到预测数据
 PreData = [F(1),F(2:end)-F(1:end-1)];

 %% 数据可视化
 t = 1:n;
 figure;
 plot(t,X,'ko-','MarkerFaceColor','k')  %%原数据图像
 hold on;
 grid on

 %%预测当前数据图像
 plot(t,PreData(1:n),'b*-','LineWidth',1.5)  

 %% 未来td期数据图像

 plot(n:n+td,PreData(n:n+td),'r*-','LineWidth',1.5)
 title('GM(1,1) 灰色预测模型');
 legend('原始值','预测值','未来预测值','Location','best')
 legend('boxoff')
 set(get(gca, 'XLabel'), 'String', '时间');
 set(get(gca, 'YLabel'), 'String', '值');

     
end
