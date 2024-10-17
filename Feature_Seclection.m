clear all
set(0, 'DefaultAxesFontName', 'Times New Roman');
% % [data, title]=xlsread('3080_1.xlsx');
load('title_.mat')
load('data.mat')

% title_=title_'
%% 

yichang_1=find(data(:,3)>=1520);
yichang_2=find(data(:,4)>=1520);
yichang_3=find(data(:,5)>=1400);
yichang_4=find(data(:,7)>=900);

yichang = unique([yichang_1;yichang_2;yichang_3;yichang_4]);
zhengchang=setdiff([1:length(data)]',yichang);

hage=data(zhengchang,2);

hx=data(zhengchang,[3:19, 24:45]);
hx_title=[title_(1,[3:19, 24:45])]';

for i=1:39
[correlationMatrix, pValues] = corr(hage, hx(:,i), 'Type', 'Spearman');
co(i,1)=correlationMatrix;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%后面需要重新整理

data=co;
data_title=hx_title;
%总参数的个数
index_num= 39

data_zheng=   data (find(data>0));
data_zheng_tit=  data_title(find(data>0));

[B_zheng,I_zheng]=sort(data_zheng,'descend');
B_zheng_tit= data_zheng_tit(I_zheng); 


for i=1: length(I_zheng)
%       i=1;
%     rectangle('Position', [1, 1, 4, 2], 'EdgeColor', 'r', 'FaceColor', 'y');
    x = [0 0 B_zheng(i) B_zheng(i)]; % 矩形的x坐标
    y = [index_num-i+1 index_num-i index_num-i index_num-i+1]; % 矩形的y坐标
    f=figure(8989)
    f.Position=[180,180,500,420]%%%%%%%%%%%%%%%%%%单独的一张图的大小
    patch(x, y, 'r','FaceAlpha', B_zheng(i));hold on % 使用蓝色绘制矩形
    
%  text(4.5,0.9,'p=0.199','FontSize',14, 'Background', [1,1,1],'EdgeColor',[0,0,0])
    text(B_zheng(i)+0.05, index_num-i+0.5 ,B_zheng_tit(i),'FontName', 'Times New Roman','FontSize',11)
    axis([-1.05 1.05 -inf inf]); % 设置坐标轴范围
end

data_fu=   data (find(data<0));
data_fu_tit=  data_title(find(data<0));

[B_fu,I_fu]=sort(data_fu);
B_fu_tit= data_fu_tit(I_fu); 

for i=1: length(I_fu)
%       i=1;
%     rectangle('Position', [1, 1, 4, 2], 'EdgeColor', 'r', 'FaceColor', 'y');
    x = [0 0 B_fu(i) B_fu(i)]; % 矩形的x坐标
    y = [index_num-i+1 index_num-i index_num-i index_num-i+1]; % 矩形的y坐标
    patch(x, y, 'b','FaceAlpha', abs(B_fu(i)));hold on % 使用蓝色绘制矩形
    
%  text(4.5,0.9,'p=0.199','FontSize',14, 'Background', [1,1,1],'EdgeColor',[0,0,0])
    text(B_fu(i)-0.35, index_num-i+0.5 ,B_fu_tit(i),'FontName', 'Times New Roman','FontSize',11)
    axis([-1.05 1.05 -inf inf]); % 设置坐标轴范围
end

set(gca, 'YColor', 'none');
set(gca, 'XTick',[-1:0.2:1]) 
xlabel('Correlation with CA (n=36223)','FontSize',12);
set(gca, 'FontSize', 12)
grid on

axis([-1.05 1.05 13 39]); % 设置坐标轴范围
x_zheng=0.2;
plot([x_zheng, x_zheng],[0, 39],'k:','LineWidth',1.2)
plot([-x_zheng, -x_zheng],[0, 39],'k:','LineWidth',1.2)


%% 根据co, hx，hx_title，以及阈值yz画图VIF图
%第一步，拿掉VAge, VAgeN和Risk

co1=co([1:32,36:end],:);
hx1=hx(:,[1:32,36:end]);
hx_title1=hx_title([1:32,36:end],:);

%第二步，过滤掉弱相关的参数
yz=0.2
num=find(abs(co1)>=yz);
co2=co1(num);
hx2=hx1(:,num);
hx_title2=hx_title1(num,:);

vif_data=hx2;
vif_data_title=hx_title2;

for j=1:size(hx2, 2)-2
%    j=1
      j
     [ vif_values] = vif_model(vif_data);
      
     VIF_(j) = max(vif_values);
     VIF_title(j)= vif_data_title(find(  vif_values==max(vif_values)     ));
     
     vif_data(:,find(  vif_values==max(vif_values)     ))=[];
     vif_data_title(find(  vif_values==max(vif_values)     ))=[];
     VIF_num(j)=size(vif_data, 2); %%剩余的特征数量
    
end

 f=figure(89891)
 f.Position=[180,180,500,420]%%%
plot(VIF_,VIF_num,'ko-.'), hold on
set(gca,'Xdir','reverse')
for i=1:length(VIF_title)
    
     text(VIF_(i)+2, VIF_num(i) ,VIF_title(i),'FontName', 'Times New Roman','FontSize',12)
    
end
axis([0,11,-0.5,10])
grid on
% 下面代码是画图的补充和辅助

L1=plot([VIF_(end),0],[VIF_num(end),0],'ko-.'), hold on

text(3, 0 ,vif_data_title(1),'FontName', 'Times New Roman','FontSize',12)
text(3, 0.5 ,vif_data_title(2),'FontName', 'Times New Roman','FontSize',12)

text(9.85, 9.5 ,VIF_title(1),'FontName', 'Times New Roman','FontSize',12)
xlabel('Threshold value of VIF (n=36223)','FontSize',12);
% xlabel(\textit{n},'FontSize',12);
ylabel('Number of retained biomarkers','FontSize',12);

plot([5, 5],[-0.5, 10],'k:','LineWidth',1.2)
set(gca,'XTick',[0:1:10]) 
set(gca,'YTick',[0:1:10]) 
legend(L1,'Excluded indicators')
set(gca, 'FontSize', 13)




%%[ vif_values] = vif_model(hx2);


% % %  for i = 1:size(hx2, 2)
% % % %      i=1;
% % %         X = hx2;
% % %         X(:, i) = [];
% % %         y = hx2(:, i);
% % %         mdl = fitlm(X, y);  % 绾挎?у洖褰?
% % %         vif_values(i) = 1 / (1 - mdl.Rsquared.Ordinary);
% % %  end

