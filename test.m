testdata;
TF_sim = TF_sim4;

figure;
subplot(1,2,1)
hold on
plot(3:48,abs(TF_measure/(sum(TF_measure)*0.01)))
plot(3:0.5:48,abs(TF_sim(6:96)/(sum(TF_sim(6:96))*0.005)))
subplot(1,2,2)
hold on
plot(3:48,angle(TF_measure/(sum(TF_measure)*0.01)))
plot(3:0.5:48,angle(TF_sim(6:96)/(sum(TF_sim(6:96))*0.005)))



%%
% Etan = [];
% for i = 1:12
%     Etan = [Etan,val{8}.validation_B1match.Etan{i}];
% end
% qiyizhiEtan = svd(Etan);




















