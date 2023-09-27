function y_pred=Logistic( t_train,y_train,S,t_pred )
%Logistic模型预测
% 线性拟合计算参数a、b
t_logistic=1:length(t_train);
y_logistic=log(S./y_train-1);
p_logistic=polyfit(t_logistic,y_logistic,1);
a=p_logistic(2);
b=p_logistic(1);

% 计算模型参数A、B
B=exp(a);
A=-b;

% 代入Logistic模型计算预测值
x=t_pred-t_train(1);
y_pred=S./(1+B*exp(-A*x));

end

