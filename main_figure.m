

%% 加载结果
clc
close all
clear

addpath(genpath('./results'))
addpath(genpath('./function package'))
addpath(genpath('./Figure and table in paper'))

val = cell(8,1);
RFcoil = cell(8,1);
for rot = 1:8
    deg = 45 * (rot - 1);
    val{rot} = load (['valid_rot',num2str(deg),'.mat']);
    RFcoil{rot} = load (['RFcoil_rot',num2str(deg),'.mat']);
end
load ('B1map.mat')
[num,~] = size(B1map)

%% Table 1 各位置的两个smape和优化激励源参数
table1 = zeros(4,8);
for j = 1:8
    table1(1,j) = RFcoil{j}.RFcoil.smapeB1map(100,270);  
    table1(2,j) = RFcoil{j}.RFcoil.smapeB1map(round(RFcoil{j}.RFcoil.opt_s2exc(1)*100),round(RFcoil{j}.RFcoil.opt_s2exc(2)));
    table1(3,j) = RFcoil{j}.RFcoil.opt_s2exc(1);
    table1(4,j) = RFcoil{j}.RFcoil.opt_s2exc(2);
end

%% Figure 2 
Figure2plot
% 
%% Figure 2
Figure3plot

%% Figure 4
Figure4plot

%% Figure 5
Figure5plot


%% Figure 3
Figure3plot20210730

%% Figure 4
Figure4plot20210730














