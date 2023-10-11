clc
close all
clear

addpath(genpath('../代码'))
addpath(genpath('../数值计算电磁场'))
addpath(genpath('../实验数据'))
addpath('function package')
%% 定义对象“温升实验”
Trise_experiment

%% 定义对象“传递函数”
TF_raw
TF_RG142 = TransferF(TFraw,'RG142-50');

%% 读B1map
mapsize=[37,169];
expfield0903
save('results/B1map','B1map');

%% B1match
for rot = 1:8
% rot = 8;
    %% 定义对象“所使用的数值线圈”
    deg = 45 * (rot - 1);
    name = ['pht9_R310-_shield1000-330_21.8_-50-a_rot',num2str(deg)];

    %% 根据B1map将RFcoil中的参数优化出来;后面两个量表示竖直方向和水平方向分别在两侧去掉的元素个数
    RFcoil = EMfield_coil(name);
    RFcoil = RFcoil.opt_best_s2exc(B1map,7,15);
    save(['results/RFcoil_rot',num2str(deg)],'RFcoil');

    %% 拟合
    validation_B1match = singlevalidation([Triseexp.name,RFcoil.coilname],TF_RG142,Triseexp.alltra,RFcoil.opt_E);
    validation_qua = singlevalidation([Triseexp.name,RFcoil.coilname],TF_RG142,Triseexp.alltra,RFcoil.qua_E);
    save(['results/valid_rot',num2str(deg)],'validation_B1match','validation_qua');
    
end
