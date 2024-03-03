figure(4);
clf(figure(4));
pargs = {'EdgeAlpha',.1,'EdgeColor','k'};

idxs = [5, 40, 60, 75, 90, 125];

for i = 1:6
    subplot(3, 2, i);
%     plotGrid(G, flt(G.cells.centroids)>0, pargs{:}, 'facecolor', 'y', 'facealpha', 0.3);
%     plotGrid(G, flt(G.cells.centroids)<0, pargs{:}, 'facecolor', 'm', 'facealpha', 0.3);
    plotFaces(CG,1:CG.faces.num,'FaceColor','none','LineWidth',1);
    plotFaces(CG,11,'FaceColor','k','FaceAlpha',0.3);
%     plotWell(G, HorizontalProducer);
    plotWell(G, MultiLateralProducer(1));
    plotWellPath(wellpathfork);
    view(3);
    set(gca,'dataasp',[1 1 1]);
    fastRotateButton();
    
    colormap(flipud(winter));
    
    sol = Rsols3{idxs(i), 1};
    hs = plotCellData(G, sol.s(:, 1), (sol.s(:, 1) > Swi+0.00005), pargs{:});
    title(sprintf('%0.0f days', convertTo(idxs(i)/M * T, day))) 
end

%%
figure(5);
clf(figure(5));
time = convertTo(cumsum([0;dt1]), year);
plot(time, oip1(1)/bbl/1e6 - oip1/bbl/1e6, 'b--', 'DisplayName', 'Vertical Producer');
hold on;
plot(time, oip2(1)/bbl/1e6 - oip2/bbl/1e6, 'g*', 'DisplayName', 'Horizontal Producer');
hold on;
plot(time, oip3(1)/bbl/1e6 - oip3/bbl/1e6, 'r-o', 'DisplayName', 'Multilateral Producer');

grid on;

legend('show');

ylabel('Cumulative Oil Production, MMSTB');
xlabel('Time, year');
title('Cumulative Oil Production')


%%
figure(6);
clf(figure(6));
time = convertTo(cumsum([0;dt1]), year);
plot(time, cell2mat(PAvg1), 'b--', 'DisplayName', 'Vertical Producer');
hold on;
plot(time, cell2mat(PAvg2), 'g*', 'DisplayName', 'Horizontal Producer');
hold on;
plot(time, cell2mat(PAvg3), 'r-o', 'DisplayName', 'Multilateral Producer');

grid on;

legend('show');

ylabel('Average Reservoir Pressure, Pascal');
xlabel('Time, year');
title('Average Reservoir Pressure')

