function [ vif_values] = vif_model(hx2)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

 for i = 1:size(hx2, 2)
%      i=1;
        X = hx2;
        X(:, i) = [];
        y = hx2(:, i);
        mdl = fitlm(X, y);  % 线�?�回�?
        vif_values(i) = 1 / (1 - mdl.Rsquared.Ordinary);
 end




end

