function y_pred=Gompertz( t_train,y_train,S,t_pred)
%Gompertz模型预测
% 利用线性拟合计算参数a、b
t_gompertz=1:length(t_train);
y_gompertz=log(log(S./y_train));
p_gompertz=polyfit(t_gompertz,y_gompertz,1);
a=p_gompertz(2);
b=p_gompertz(1);

% 计算模型参数A、k
A = exp(a);
k=-b;

% 代入Gompertz模型计算预测值
x=t_pred-t_train(1);
y_pred=S*exp(-A*exp(-k*x));

end

