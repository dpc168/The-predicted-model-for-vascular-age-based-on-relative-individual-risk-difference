function [adc_bilv] = adc_fenxi(CA0,CVA_KDM)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
data4_xd=CVA_KDM-CA0;

% % min(CA0);
% % max(CA0);

for i=1:5
%     i=1;
     if i==5   
           loc=find(CA0>=(i*10+20)&CA0<=(i*10+30));
     else
           loc=find(CA0>=(i*10+20)&CA0<(i*10+30));
     end
     
     adc_bilv(i,1)=length(loc);
     
     adc_data=data4_xd(loc);
     
     adc_bilv(i,2)=length(   find(adc_data>0)        );
     adc_bilv(i,3)=adc_bilv(i,2)/adc_bilv(i,1);
     
   
end



end

