function drawPrediction( x_train,y_train,x_pred,GompertzPred,LogisticPred,MeanPred )

figure;
hold on;
%绘制已知的观测点
 plot(x_train,y_train,'*','Color','c','MarkerSize',5);

%绘制Gompertz预测线
plot(x_pred,GompertzPred,'-','Color','g','LineWidth',1);  hold on;
%绘制Logistic预测线
plot(x_pred,LogisticPred,'-.','Color','b','LineWidth',1); hold on;
%绘制Mean预测线
plot(x_pred,MeanPred,'--','Color','r','LineWidth',1); hold on;

%设置显示范围及部分标注
xlabel('年份');
ylabel('能源强度');
title('2010~2060年能源强度');
axis([min(x_pred)-1 max(x_pred)+1 min(MeanPred)-1 max(MeanPred)+1]);

hold off;
end

