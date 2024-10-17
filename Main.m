clear all
set(0, 'DefaultAxesFontName', 'Times New Roman');
% % [data, title]=xlsread('3080_1.xlsx');
load('title_.mat')
load('data.mat')

%% 分离出性别数据
Sex = data(:,1);

%% 分离出所有女性的数据，并测试%1代表男性，0代表女性
%   change "Sex==0" to  "Sex==1", will get the results of male
data0= data(find(Sex==0),:);

%做绝对有效性分析时的材料
CA0=data0(:,2);
X_juedui=data0(:,[3:16,24:27,30:37,41]);
X_juedui_title=title_(:,[3:16,24:27,30:37,41]);

X_all=data0(:,[4,25]);
X_title=title_(:,[4,25]);

% plot(data1(:,2),data1(:,19),'ro')
%检验所选的变量，与时间年龄是否相关
% Rx1=corrcoef  (data1 )

%% 确定好，异常样本 和 正常样本 的编号
%RbaPWV0(i)>1520&RbaPWV0(i)>1520&RbSYS0(i)>140&RbDIA0(i)>90
yichang0_1=find(data0(:,3)>=1520);
yichang0_2=find(data0(:,4)>=1520);
yichang0_3=find(data0(:,5)>=1400);
yichang0_4=find(data0(:,7)>=900);
yichang0 = unique([yichang0_1;yichang0_2;yichang0_3;yichang0_4]);

zhengchang0=setdiff([1:length(data0)]',yichang0);


%% 分离出  异常数据 和 正常数据
%异常数据
uhage0=data0(yichang0,2);

uhdata0=data0(yichang0,3:end);%%%%%%%%%
uhage0=data0(yichang0,2);
Title_0=title_(3:end);

uhX0=uhdata0(:,[1:17,22:43]);
uhX0_title=Title_0(:,[1:17,22:43]);

%正常数据
hage0=data0(zhengchang0,2);

hdata0=data0(zhengchang0,3:end);%%%%%%%%%
Title_0=title_(3:end);

hX0=hdata0(:,[1:17,22:43]);
hX0_title=Title_0(:,[1:17,22:43]);


% % % % % % uhVAge0=uhdata0(:,37);
% % % % % % 
% % % % % % uhVAgeNomo0=uhdata0(:,38);
% % % % % % 
% % % % % % uhRbaPWV0      =uhdata0(:,1);   uhLbaPWV0       =uhdata0(:,2);
% % % % % % 
% % % % % % uhRbSYS0          =uhdata0(:,3);   uhRbMAP0        =uhdata0(:,4);    uhRbDIA0          =uhdata0(:,5);
% % % % % % uhLbSYS0          =uhdata0(:,6);   uhLbMAP0        =uhdata0(:,7);     uhLbDIA0          =uhdata0(:,8);
% % % % % % 
% % % % % % 
% % % % % % uhRaSYS0          =uhdata0(:,9);   uhRaMAP0        =uhdata0(:,10);   uhRaDIA0          =uhdata0(:,11);
% % % % % % uhLaSYS0          =uhdata0(:,12);  uhLaMAP0        =uhdata0(:,13);   uhLaDIA0           =uhdata0(:,14);
% % % % % % 
% % % % % % 
% % % % % % uhHeight0         =uhdata0(:,15);  uhWeight0        =uhdata0(:,16);   uhPR0                =uhdata0(:,17);
% % % % % % 
% % % % % % uhRbPMap0      =uhdata0(:,22);  uhLbPMap0       =uhdata0(:,23);   uhRaPMap0        =uhdata0(:,24);   uhLaPMap0        =uhdata0(:,25);
% % % % % % 
% % % % % % uhRbUT0           =uhdata0(:,26);  uhLbUT0            =uhdata0(:,27);   uhRaUT0            =uhdata0(:,28);   uhLaUT0             =uhdata0(:,29);
% % % % % % uhRbAmpLevel0 =uhdata0(:,30);  uhLbAmpLevel0 =uhdata0(:,31);   uhRaAmpLevel0 =uhdata0(:,32);   uhLaAmpLevel0   =uhdata0(:,33);
% % % % % % 
% % % % % % uhRabi0             =uhdata0(:,34);  uhLabi0             =uhdata0(:,35);   uhBMI0              =uhdata0(:,36);   uhRisk0                =uhdata0(:,39);
% % % % % % 
% % % % % % uhRbPR0           =uhdata0(:,40);  uhLbPR0             =uhdata0(:,41);   uhRaPR0            =uhdata0(:,42);   uhLaPR0              =uhdata0(:,43);

% % % % % % % hVAge0=hdata0(:,37);
% % % % % % % hVAgeNomo0=hdata0(:,38);
% % % % % % % hRbaPWV0      =hdata0(:,1);   hLbaPWV0       =hdata0(:,2);
% % % % % % % hRbSYS0          =hdata0(:,3);   hRbMAP0        =hdata0(:,4);    hRbDIA0          =hdata0(:,5);
% % % % % % % hLbSYS0          =hdata0(:,6);   hLbMAP0        =hdata0(:,7);     hLbDIA0          =hdata0(:,8);
% % % % % % % hRaSYS0          =hdata0(:,9);   hRaMAP0        =hdata0(:,10);   hRaDIA0          =hdata0(:,11);
% % % % % % % hLaSYS0          =hdata0(:,12);  hLaMAP0        =hdata0(:,13);   hLaDIA0           =hdata0(:,14);
% % % % % % % hHeight0         =hdata0(:,15);  hWeight0        =hdata0(:,16);   hPR0                =hdata0(:,17);
% % % % % % % hRbPMap0      =hdata0(:,22);  hLbPMap0       =hdata0(:,23);   hRaPMap0        =hdata0(:,24);   hLaPMap0        =hdata0(:,25);
% % % % % % % hRbUT0           =hdata0(:,26);  hLbUT0            =hdata0(:,27);   hRaUT0            =hdata0(:,28);   hLaUT0             =hdata0(:,29);
% % % % % % % hRbAmpLevel0 =hdata0(:,30);  hLbAmpLevel0 =hdata0(:,31);   hRaAmpLevel0 =hdata0(:,32);   hLaAmpLevel0   =hdata0(:,33);
% % % % % % % hRabi0             =hdata0(:,34);  hLabi0             =hdata0(:,35);   hBMI0              =hdata0(:,36);   hRisk0                =hdata0(:,39);
% % % % % % % hRbPR0           =hdata0(:,40);  hLbPR0             =hdata0(:,41);   hRaPR0            =hdata0(:,42);   hLaPR0              =hdata0(:,43);
% % % % % % % hX0=hdata0(:,[1,2,22,23]);
%% 多重线性回归建模

% 确定好参加回归的参数
RhX0=hX0(:,[2,19]);
RhX0_title=hX0_title(:,[2,19]);

% 建立mod0，传统工作的原始的模型
mod0=LinearModel.fit(RhX0,hage0);
f=figure(8989)
f.Position=[180,180,500,470]%%%%%%%%%%%%%%%%%%单独的一张图的大小
% subplot(1,2,1)
l1=plot(hage0,mod0.Fitted,'o','Color', [84/255, 130/255, 53/255]),hold on, plot([20 90],[20 90],'r','LineWidth',1.5)

% % mod1=LinearModel.fit([hage0,hage0.^2],mod0.Fitted);
% % yyy=mod1.Fitted;
% % [Xsorted,I] = sort(hage0);
% % Ysorted = yyy(I);
% % ll1=plot(Xsorted,Ysorted,'r','LineWidth',2.5), hold on
% % ll2=plot(Xsorted,Ysorted+5,'r--','LineWidth',2.5), hold on
% %       plot(Xsorted,Ysorted-5,'r--','LineWidth',2.5), hold on
% % xlabel('Chronological age (CA)','FontSize',15);ylabel('VA\_MLR','FontSize',15);
% % axis([20,90,20,90])
% %  set(gca, 'XTick',[20:10:90]) , set(gca, 'YTick',[20:10:90]) 
% % legend([l1,ll1,ll2],{'HVA group','Mean value of VA\_MLR','Reference interval of RIRD'})
% % set(gca, 'FontSize', 18)

length(hage0)
mod0.RMSE
corr(mod0.Fitted-hage0,hage0,'type','spearman');


%% 传统工作，MLR模型和KDM模型的结果
VA_MLR_h=mod0.Fitted;
plot(hage0, VA_MLR_h,'bo'),hold on, plot([20 80],[20 80],'r')
axis([20,80,20,80])

VA_KDM_h=KDM_Age(RhX0,hage0,RhX0,hage0);%%后面一个X0是测试，前面2个是训练，建立模型的。。
plot(hage0, VA_KDM_h,'bo'),hold on, plot([20 80],[20 80],'r')
axis([20,80,20,80])

RuhX0=uhX0(:,[2,19]);

VA_MLR_uh  =mod0.predict(RuhX0);
f=figure(9090) 
f.Position=[180,180,970,220]
subplot(1,4,1)
l1=plot(uhage0, VA_MLR_uh,'o','Color', [245/255, 175/255, 175/255]),hold on, plot([20 90],[20 90],'r','LineWidth',1.5)
axis([20,90,20,90])
xlabel('CA');ylabel('VA\_MLR');
%     text(4.5,0.9,'p=0.199','FontSize',14, 'Background', [1,1,1],'EdgeColor',[0,0,0])
% text(30,80,  strcat('RIRD=', num2str(canshu(i))), 'FontSize',12,'FontName', 'Times New Roman')
legend(l1,'Non-HVA')
title('Male, n=10839','FontSize',12,'FontName', 'Times New Roman')
set(gca, 'FontSize', 12)

VA_KDM_uh   =KDM_Age(RhX0,hage0,RuhX0,uhage0);
figure(9090)
subplot(1,4,2)
l1=plot(uhage0, VA_KDM_uh,'o','Color', [245/255, 175/255, 175/255]),hold on, plot([20 90],[20 90],'r','LineWidth',1.5)
axis([20,90,20,90])
xlabel('CA');ylabel('VA\_KDM');
legend(l1,'Non-HVA')
title('Male, n=10839','FontSize',12,'FontName', 'Times New Roman')
set(gca, 'FontSize', 12)

% % % % % % % % % % % % % % % % % % % xx2=X0; y2=hage0;
% % % % % % % % % % % % % % % % % % % [table2,table1] = KDM_BA_son(xx2,y2);
% % % % % % % % % % % % % % % % % % % % Sba是把所有x作为自变量,y2作为因变量，回归得到Rmse
% % % % % % % % % % % % % % % % % % % mmdl1 = LinearModel.fit(xx2,y2);
% % % % % % % % % % % % % % % % % % % Sba=mmdl1.RMSE
% % % % % % % % % % % % % % % % % % % % Sba=std(y2);
% % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % for i=1:length(y2)
% % % % % % % % % % % % % % % % % % % %     i=1;
% % % % % % % % % % % % % % % % % % %       X=xx2(i,:);
% % % % % % % % % % % % % % % % % % %       X-table1(1,:);
% % % % % % % % % % % % % % % % % % %       table1(2,:)./[table1(3,:).^2];   
% % % % % % % % % % % % % % % % % % %       fenzi    =   [X-table1(1,:)]*[table1(2,:)./[table1(3,:).^2]]' + y2(i)/(Sba^2);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % %    ebiomedicine分母
% % % % % % % % % % % % % % % % % % % % % % % % % % % %    fenmu =   sum(  table1(2,:)./[table1(3,:).^2]  )+  1/mmdl1.MSE;
% % % % % % % % % % % % % % % % % % % %    原始的分母   
% % % % % % % % % % % % % % % % % % %  fenmu =[ table1(2,:)./table1(3,:) ] *[table1(2,:)./table1(3,:)]'+  1/(Sba^2);
% % % % % % % % % % % % % % % % % % % %       
% % % % % % % % % % % % % % % % % % %     y2_BA(i,1)=fenzi/fenmu;
% % % % % % % % % % % % % % % % % % % end
% % % % % % % % % % % % % % % % % % % plot(y2, y2_BA,'bo'),,hold on, plot([20 80],[20 80],'r')


%% 测试净化样本的参数和效果

%构造平均预测年龄函数
mod1=LinearModel.fit([hage0,hage0.^2],mod0.Fitted);
figure()
ll1=plot(hage0,mod1.Fitted,'r'),

% % % % % % % % % % % % % tichuyiju=mod0.Fitted-hage0;  %%PA-CA
% % % % % % % % % % % % % STD=std(mod0.Fitted-hage0);%%%%%%%%%%%%%%%%%%%%
tichuyiju=mod0.Fitted-mod1.Fitted;  %%PA-ePA
%plot(hage0,tichuyiju,'ko'),

% [0.1:0.1:2]
for i=1:15
%     i=5
%     jiankang_num=find(tichuyiju<=(i/10*STD)&tichuyiju>=-(i/10*STD));
    jiankang_num=find(tichuyiju<=i&tichuyiju>=-i);
    length(jiankang_num);
    
    new_RhX0=RhX0( jiankang_num,:);
    new_hage0=hage0( jiankang_num,:);
    
    mod0=LinearModel.fit(new_RhX0,new_hage0);
    
    %subplot(3,5,i),plot(new_hage0,mod0.Fitted),hold on, plot([20 80],[20 80],'r'), %画图代码暂时注释掉
    adc(1,i)=length(jiankang_num);
    adc(2,i)=mod0.RMSE;
%    [r, p]=corr(mod0.Fitted-new_hage0,new_hage0);
     [r, p]=corr(new_hage0-mod0.Fitted,new_hage0,'type','spearman');
    adc(3:4,i)=[r;p];
    
    adc(5,i)=std(mod0.Fitted-new_hage0,new_hage0);
    adc(6,i)=corr(mod0.Fitted,new_hage0,'type','spearman');
    
end

%下面的循环只是个画图代码
canshu=[1:2:15];
for i=1:length(canshu)
%     i=5
%     jiankang_num=find(tichuyiju<=(i/10*STD)&tichuyiju>=-(i/10*STD));
    jiankang_num=find(tichuyiju<=canshu(i)&tichuyiju>=-canshu(i));
    length(jiankang_num);
    
    new_RhX0=RhX0( jiankang_num,:);
    new_hage0=hage0( jiankang_num,:);
    
    mod0=LinearModel.fit(new_RhX0,new_hage0);
    f=figure(8989)
    f.Position=[180,180,1500,170]
    subplot(1,8,i),
    l1=plot(new_hage0,mod0.Fitted,'bo'),hold on, 
    plot([20 90],[20 90],'r','LineWidth',1.5), %画图代码暂时注释掉
%     legend(l1,'AA-HVA')
    axis([20,90,20,90])
    xlabel('CA');ylabel('CVA\_MLR');
%     text(4.5,0.9,'p=0.199','FontSize',14, 'Background', [1,1,1],'EdgeColor',[0,0,0])
    set(gca, 'FontSize', 12)
    text(21,83,  strcat('RIRD ≤ ', num2str(canshu(i))), 'FontSize',11,'FontName', 'Times New Roman')
    text(21,74,  strcat('RMSE = ', num2str(round(mod0.RMSE, 2))), 'FontSize',11,'FontName', 'Times New Roman')   
    title(strcat('Male, n=', num2str( length(new_hage0 )  )),'FontSize',12,'FontName', 'Times New Roman')
end

%左右轴画图
f=figure(9191)
f.Position=[180,180,660,400]
l1=plot(adc(1,:)/length(hage0),'ko--','LineWidth',1.5), hold on, %plot([0 20],[0 20],'r')剩下来样本的比率 
set(gca,'Xdir','reverse')
l3=plot((adc(3,:)),'ks:','LineWidth',1.5), hold on, %plot([0 20],[0 20],'r')，ADC，残差和时间年龄的相关系数的-------------绝对值
l5=plot(adc(6,:),'k+-','LineWidth',1.5), hold on, %plot([0 20],[0 20],'r')，预测值和真实值的相关系数
l0=plot((adc(6,:))./adc(2,:),'k<-.','LineWidth',1.5), hold on, %plot([0 20],[0 20],'r')

legend([l1,l3,l5,l0],{'Ratio of selected samples','-\rho_{ADC}','\rho_{PA}','\rho_{PA}/RMSE'})
xlabel('Relative individual risk differences (RIRD)')
axis([0,16,0,1.05])
set(gca, 'YTick',[0:0.1:1]) 
set(gca, 'XTick',[0:1:16]) 
title('Male')
set(gca, 'FontSize', 13)
grid on

% % % % % l2=plot(adc(2,:)*0.1,'ko'), hold on, %plot([0 20],[0 20],'r')%，预测模型的RMSE*0.1

% % % % % l4=plot(adc(5,:)*0.1,'ro'), hold on, %plot([0 20],[0 20],'r')，残差的标准差，*0.1%%%%这个不要
% % % % % % % plot((adc(3,:))./adc(2,:),'ro'), hold on, %plot([0 20],[0 20],'r')
% % % % % % % 
% % % % % % % plot(abs(adc(3,:)),'ro'), hold on, %plot([0 20],[0 20],'r')




%% 根据上面的分析和可视化，重新选择样本,  建立矫正后的模型
% 确定i=5为最终的模型

 i=3
%     jiankang_num=find(tichuyiju<=(i/10*STD)&tichuyiju>=-(i/10*STD));
 jiankang_num=find(tichuyiju<=i&tichuyiju>=-i);
 length(jiankang_num);
    
new_RhX0=RhX0( jiankang_num,:);
new_hage0=hage0( jiankang_num,:);

% mod2修正后的线性回归模型
mod2=LinearModel.fit(new_RhX0,new_hage0);

CVA_MLR_h=mod2.Fitted;
figure()
plot(new_hage0, CVA_MLR_h,'bo'),hold on, plot([20 80],[20 80],'r')
axis([20,80,20,80])

CVA_KDM_h = KDM_Age(new_RhX0,new_hage0,new_RhX0,new_hage0);
figure()
plot(new_hage0, CVA_KDM_h,'bo'),hold on, plot([20 80],[20 80],'r')
axis([20,90,20,90])

CVA_MLR_uh  =mod2.predict(RuhX0);
figure(9090)
subplot(143)
l1=plot(uhage0, CVA_MLR_uh,'o','Color', [245/255, 175/255, 175/255]),hold on, plot([20 90],[20 90],'r','LineWidth',1.5)
axis([20,90,20,90])
xlabel('CA');ylabel('CVA\_MLR');
legend(l1,'Non-HVA')
title('Male, n=10839','FontSize',12,'FontName', 'Times New Roman')
set(gca, 'FontSize', 12)

CVA_KDM_uh = KDM_Age(new_RhX0,new_hage0,RuhX0,uhage0);
figure(9090)
subplot(144)
l1=plot(uhage0, CVA_KDM_uh,'o','Color', [245/255, 175/255, 175/255]),hold on, plot([20 90],[20 90],'r','LineWidth',1.5)
axis([20,90,20,90])
xlabel('CA');ylabel('CVA\_KDM');
legend(l1,'Non-HVA')
title('Male, n=10839','FontSize',12,'FontName', 'Times New Roman')
set(gca, 'FontSize', 12)

%% 绝对有效性分析，分析了女性所有样本，CA和4种模型预测的年龄，与27个间接指标之前的相关性

CA0=data0(:,2);
% % % % X_juedui=data0(:,[3:16,24:27,30:37,41]);
% % % % X_juedui_title=title_(:,[3:16,24:27,30:37,41]);

%把VIF设置成2后，留下来的变量，变少了11+3
num_=[3,4,11,12,14,15,24,25,32,36,37,39,40,41];
X_juedui=data0(:,num_);
X_juedui_title=[title_(:,num_)]';


VA_MLR=mod0.predict(X_all);
VA_KDM=KDM_Age(RhX0,hage0,X_all,CA0);

CVA_MLR  =mod2.predict(X_all);
CVA_KDM = KDM_Age(new_RhX0,new_hage0,X_all,CA0);


CC_juedui=ones(length(X_juedui_title),5);
for i=1:length(X_juedui_title)
    
     CC_juedui(i,1) =corr(CA0,X_juedui(:,i),'type','spearman');
     CC_juedui(i,2) =corr(VA_MLR,X_juedui(:,i),'type','spearman');
     CC_juedui(i,3) =corr(VA_KDM,X_juedui(:,i),'type','spearman');
     
     CC_juedui(i,4) =corr(CVA_MLR,X_juedui(:,i),'type','spearman');
     CC_juedui(i,5) =corr(CVA_KDM,X_juedui(:,i),'type','spearman');
     
end


mean(abs(CC_juedui))

% % % % % % % % % % % % % %对上面的结果进行多重比较，用不上
% % % % % % % % % % % % % life0=abs([CC_juedui(:,1); CC_juedui(:,2);CC_juedui(:,3);CC_juedui(:,4);CC_juedui(:,5)]);
% % % % % % % % % % % % % group0=[[repmat({'CA'},[27,1])];[repmat({'VA_MLR'},[27,1])];[repmat({'VA_KDM'},[27,1])];[repmat({'CVA_MLR'},[27,1])]; [repmat({'CVA_KDM'},[27,1])]];
% % % % % % % % % % % % %  %调用kruskalwallis函数作Kruskal-Wallis检验
% % % % % % % % % % % % % %  figure('position',[180,180,500,400])
% % % % % % % % % % % % %        [p1,table1,stats1]=kruskalwallis(life0,group0);
% % % % % % % % % % % % %        ylabel('Correlation with 27 other indirect indicators','FontSize',14);
% % % % % % % % % % % % %        set(gca, 'FontSize', 13)
% % % % % % % % % % % % %       set(gca,'YTick',[0.1:0.1:1])
% % % % % % % % % % % % %       text(4.5,0.9,'p=0.199','FontSize',14, 'Background', [1,1,1],'EdgeColor',[0,0,0])
% % % % % % % % % % % % %       title('Whole compartion (Kruskal-Wallis Test) for different kinds of ages','FontWeight','bold','FontSize',12)
% % % % % % % % % % % % %       grid on
% % % % % % % % % % % % %  %    set(gca,'XTickLabelRotation',45) 
% % % % % % % % % % % % %      
% % % % % % % % % % % % %  %调用multcompare函数对不同配料方案下灯泡的寿命进行多重比较
% % % % % % % % % % % % %        [c1,m1,h1,gnames1]=multcompare(stats1);
% % % % % % % % % % % % %  %点一下CVA_MLR
% % % % % % % % % % % % %        set(gca,'YTickLabel',{'CVA\_KDM','CVA\_MLR','VA\_KDM','VA\_MLR','CA'}) 
% % % % % % % % % % % % %         title('Multi-compare for different kinds of ages','FontSize',12)
% % % % % % % % % % % % %         xlabel('','FontSize',13);
% % % % % % % % % % % % %        set(gca, 'FontSize', 13)
% % % % % % % % % % % % %        xlabel('Rank number','FontSize',13);

%% 相对有效性分析，检测NHVA的效果

% % % or0=[1 1 1 0 0 0]
% % % data_age2=[1 1 0 0 0 0]
% % % 
% % % confusion_matrix = confusionmat(or0,data_age2);
or0=ones(length(X_all),1);
or0(zhengchang0,1)=0;

%VA_MLR VS CA
data1_xd=VA_MLR-CA0;
data1_xd(find(data1_xd<=0))=0;
data1_xd(find(data1_xd>0))=1;

c_matrix1 = confusionmat(or0,data1_xd);

%VA_KDM VS CA
data2_xd=VA_KDM-CA0;
data2_xd(find(data2_xd<=0))=0;
data2_xd(find(data2_xd>0))=1;

c_matrix2 = confusionmat(or0,data2_xd);

%CVA_MLR VS CA
data3_xd=CVA_MLR-CA0;
data3_xd(find(data3_xd<=0))=0;
data3_xd(find(data3_xd>0))=1;

c_matrix3 = confusionmat(or0,data3_xd);

%CVA_KDM VS CA
data4_xd=CVA_KDM-CA0;
data4_xd(find(data4_xd<=0))=0;
data4_xd(find(data4_xd>0))=1;

c_matrix4 = confusionmat(or0,data4_xd);

CM=[c_matrix1 c_matrix2 c_matrix3 c_matrix4 ]



%% ADC现象分析


adc1= adc_fenxi(CA0,VA_MLR);

adc2= adc_fenxi(CA0,VA_KDM);
 
adc3= adc_fenxi(CA0,CVA_MLR);
  
adc4= adc_fenxi(CA0,CVA_KDM);


ADC=[adc1 adc2(:,2:3) adc3(:,2:3) adc4(:,2:3)]

