close all
for i = 1:8
    figure;
    plotsubfigure(nor(RFcoil{i}.RFcoil.s1_B1cell{4}),' no',[0,2])
%     title('$|B_{1ue,1}^{+}|$ at location 8', 'Interpreter', 'latex','FontSize',titlesize)
    title(' ', 'Interpreter', 'latex','FontSize',titlesize)
    colorbar off
    set(gca,'color','none');
end