function MeanPred = prediction(inputSer,S)
%使用Gompertz模型和Logistic模型进行预测，并求平均值作为最终预测结果
t_train=2010:2020;
y_train=inputSer';
t_pred=2021:2060;

%Gompertz模型
GompertzPred=Gompertz(t_train,y_train,S,t_pred);
%Logistic模型
LogisticPred=Logistic(t_train,y_train,S,t_pred);
%平均模型
MeanPred=(GompertzPred+LogisticPred)/2;
%绘制预测结果
drawPrediction(t_train,y_train,t_pred,GompertzPred,LogisticPred,MeanPred )

end