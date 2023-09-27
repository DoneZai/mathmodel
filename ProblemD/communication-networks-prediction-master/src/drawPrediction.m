function drawPrediction( x_train,y_train,x_pred,GompertzPred,LogisticPred,MeanPred )

figure;
hold on;
%������֪�Ĺ۲��
 plot(x_train,y_train,'*','Color','c','MarkerSize',5);

%����GompertzԤ����
plot(x_pred,GompertzPred,'-','Color','g','LineWidth',1);  hold on;
%����LogisticԤ����
plot(x_pred,LogisticPred,'-.','Color','b','LineWidth',1); hold on;
%����MeanԤ����
plot(x_pred,MeanPred,'--','Color','r','LineWidth',1); hold on;

%������ʾ��Χ�����ֱ�ע
xlabel('���');
ylabel('��Դǿ��');
title('2010~2060����Դǿ��');
axis([min(x_pred)-1 max(x_pred)+1 min(MeanPred)-1 max(MeanPred)+1]);

hold off;
end

