function [y2_BA] =  KDM_Age(X0,hage0,X0_test,hage0_test)
%% 100%不用修改，KDM模型，输出KDM年龄

% X0=RhX0;
% hage0=hage0;
% X0_test=X_all;

%% 第一步: 求解KDM模型中的各种参数

for i=1:size(X0,2)
%     i=1
     dat=X0(:,i);
% subplot(121), plot(y2,dat,'ro'),hold on;axis([10,90,2,12])
     %% 先把y2时间年龄作为自变量，求参数
%  第一步拟合
     mo = LinearModel.fit(hage0,dat);
%  第二步残差分析，只选2倍标准差以内的数据
     Res=table2array(mo.Residuals);
     Res_num=find( abs (Res(:,1))<= 2*std(Res(:,1)));
     dat_new=dat(Res_num);
     hage0_new=hage0(Res_num);
% subplot(121), plot(y2(Res_num),dat(Res_num),'bo'),hold on;axis([10,90,2,12])
%  第三步用新数据，重新拟合获得参数
     mo1 = LinearModel.fit(hage0_new,dat_new);
%  plot(y2_new,mo1.Fitted,'k-'),hold on
     table2(:,i)=[table2array(mo1.Coefficients(:,1));mo1.RMSE];
%%  第四步自变量、因变量互换，y2时间年龄作为因变量, 重新获得参数
     table1(1,i)= -table2(1,i)/table2(2,i);
     table1(2,i)= 1/table2(2,i);
     
     hage0_pre=  table1(1,i)+  table1(2,i)* dat;
%      plot(y2,y2_pre,'ro'),hold on
%      plot(y2_pre,dat,'ro'),hold on
      table1(3,i)=sqrt(mean((hage0 - hage0_pre).^2));
end

mmdl1 = LinearModel.fit(X0,hage0);
Sba=mmdl1.RMSE;


%% 第二步：求解KDM_Age，利用Table2参数
% Sba=std(y2);

for i=1:length(X0_test)
%      i=8737
      X=X0_test(i,:);
      X-table2(1,:);
      table2(2,:)./[table2(3,:).^2];   
      fenzi    =   [X-table2(1,:)]*[table2(2,:)./[table2(3,:).^2]]' + hage0_test(i)/(Sba^2);
% % % % % % % % % %    ebiomedicine分母
% % % % % % % % %    fenmu =   sum(  table1(2,:)./[table1(3,:).^2]  )+  1/mmdl1.MSE;
%    原始的分母   
 fenmu =[ table2(2,:)./table2(3,:) ] *[table2(2,:)./table2(3,:)]'+  1/(Sba^2);
%       
    y2_BA(i,1)=fenzi/fenmu;
end

end

