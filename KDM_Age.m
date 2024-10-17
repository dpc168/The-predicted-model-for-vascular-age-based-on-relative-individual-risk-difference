function [y2_BA] =  KDM_Age(X0,hage0,X0_test,hage0_test)
%% 100%�����޸ģ�KDMģ�ͣ����KDM����

% X0=RhX0;
% hage0=hage0;
% X0_test=X_all;

%% ��һ��: ���KDMģ���еĸ��ֲ���

for i=1:size(X0,2)
%     i=1
     dat=X0(:,i);
% subplot(121), plot(y2,dat,'ro'),hold on;axis([10,90,2,12])
     %% �Ȱ�y2ʱ��������Ϊ�Ա����������
%  ��һ�����
     mo = LinearModel.fit(hage0,dat);
%  �ڶ����в������ֻѡ2����׼�����ڵ�����
     Res=table2array(mo.Residuals);
     Res_num=find( abs (Res(:,1))<= 2*std(Res(:,1)));
     dat_new=dat(Res_num);
     hage0_new=hage0(Res_num);
% subplot(121), plot(y2(Res_num),dat(Res_num),'bo'),hold on;axis([10,90,2,12])
%  �������������ݣ�������ϻ�ò���
     mo1 = LinearModel.fit(hage0_new,dat_new);
%  plot(y2_new,mo1.Fitted,'k-'),hold on
     table2(:,i)=[table2array(mo1.Coefficients(:,1));mo1.RMSE];
%%  ���Ĳ��Ա����������������y2ʱ��������Ϊ�����, ���»�ò���
     table1(1,i)= -table2(1,i)/table2(2,i);
     table1(2,i)= 1/table2(2,i);
     
     hage0_pre=  table1(1,i)+  table1(2,i)* dat;
%      plot(y2,y2_pre,'ro'),hold on
%      plot(y2_pre,dat,'ro'),hold on
      table1(3,i)=sqrt(mean((hage0 - hage0_pre).^2));
end

mmdl1 = LinearModel.fit(X0,hage0);
Sba=mmdl1.RMSE;


%% �ڶ��������KDM_Age������Table2����
% Sba=std(y2);

for i=1:length(X0_test)
%      i=8737
      X=X0_test(i,:);
      X-table2(1,:);
      table2(2,:)./[table2(3,:).^2];   
      fenzi    =   [X-table2(1,:)]*[table2(2,:)./[table2(3,:).^2]]' + hage0_test(i)/(Sba^2);
% % % % % % % % % %    ebiomedicine��ĸ
% % % % % % % % %    fenmu =   sum(  table1(2,:)./[table1(3,:).^2]  )+  1/mmdl1.MSE;
%    ԭʼ�ķ�ĸ   
 fenmu =[ table2(2,:)./table2(3,:) ] *[table2(2,:)./table2(3,:)]'+  1/(Sba^2);
%       
    y2_BA(i,1)=fenzi/fenmu;
end

end

