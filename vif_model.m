function [ vif_values] = vif_model(hx2)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

 for i = 1:size(hx2, 2)
%      i=1;
        X = hx2;
        X(:, i) = [];
        y = hx2(:, i);
        mdl = fitlm(X, y);  % 绾挎?у洖褰?
        vif_values(i) = 1 / (1 - mdl.Rsquared.Ordinary);
 end




end

