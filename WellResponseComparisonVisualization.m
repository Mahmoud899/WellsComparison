%%

pargs = {'EdgeAlpha',.1,'EdgeColor','k'};
%% Plot Two Vertical Wells Setup
figure(1); clf(figure(1));
plotGrid(G, 'facecolor', 'none', 'edgealpha', 0.3);

plotGrid(G, flt(G.cells.centroids)>0, pargs{:}, 'facecolor', 'y', 'facealpha', 0.3);
plotGrid(G, flt(G.cells.centroids)<0, pargs{:}, 'facecolor', 'm', 'facealpha', 0.3);

fastRotateButton();
view(3);
set(gca,'dataasp',[1 1 1]);

plotWell(G, VerticalPoducer);

CG = generateCoarseGrid(G,(flt(G.cells.centroids)>0)+1);
plotFaces(CG,1:CG.faces.num,'FaceColor','none','LineWidth',1);
plotFaces(CG,11,'FaceColor','k','FaceAlpha',1);

%% Plot Horizontal Producer
figure(2); clf(figure(2));
plotGrid(G, 'facecolor', 'none', 'edgealpha', 0.3);

plotGrid(G, flt(G.cells.centroids)>0, pargs{:}, 'facecolor', 'y', 'facealpha', 0.3);
plotGrid(G, flt(G.cells.centroids)<0, pargs{:}, 'facecolor', 'm', 'facealpha', 0.3);
plotFaces(CG,1:CG.faces.num,'FaceColor','none','LineWidth',1);
plotFaces(CG,11,'FaceColor','k','FaceAlpha',1);
fastRotateButton();
view(3);
set(gca,'dataasp',[1 1 1]);

plotWell(G, HorizontalProducer);


%% Plot Multilateral Producer
figure(3); clf(figure(3));
plotGrid(G, 'facecolor', 'none', 'edgealpha', 0.3);
plotGrid(G, flt(G.cells.centroids)>0, pargs{:}, 'facecolor', 'y', 'facealpha', 0.3);
plotGrid(G, flt(G.cells.centroids)<0, pargs{:}, 'facecolor', 'm', 'facealpha', 0.3);
plotFaces(CG,1:CG.faces.num,'FaceColor','none','LineWidth',1);
plotFaces(CG,11,'FaceColor','k','FaceAlpha',1);
fastRotateButton();
view(3);
set(gca,'dataasp',[1 1 1]);
plotWell(G, MultiLateralProducer(1));
plotWellPath(wellpathfork);

%%

figure(4);
clf(figure(4));
pargs = {'EdgeAlpha',.1,'EdgeColor','k'};
plotGrid(G, 'facecolor', 'none', pargs{:});

plotGrid(G, flt(G.cells.centroids)>0, pargs{:}, 'facecolor', 'y', 'facealpha', 0.3);
plotGrid(G, flt(G.cells.centroids)<0, pargs{:}, 'facecolor', 'm', 'facealpha', 0.3);
plotFaces(CG,1:CG.faces.num,'FaceColor','none','LineWidth',1);
plotFaces(CG,11,'FaceColor','k','FaceAlpha',1);

% hs = plotCellData(G, rock.poro);
plotWell(G, HorizontalProducer);
view(3);
set(gca,'dataasp',[1 1 1]);
fastRotateButton();

colormap(flipud(winter));
% colormap(flipud(.5*jet(10)+.5*ones(10,3)));
gif_name = 'DownProduce.gif';
sol = Rsols3{150, 1};
hs = plotCellData(G, sol.s(:, 1), (sol.s(:, 1) > Swi+0.00005), pargs{:});


% 
% for j = 1:10
%     
%     sol = Rsols1{j, 1};
%     hs = plotCellData(G, sol.s(:, 1), (sol.s(:, 1) > Swi+0.00005), pargs{:});
%    
%     title(sprintf('%0.0f days', convertTo(j/M * T, day))) 
% 
%     
% %     pause(0.05);
% %     pause(0.3)
%     delete(hs);
% %     drawnow
%     
% %     make_gif(gcf, j, gif_name);
%     
% end


%%
plotWellSols({wellSol3{:, 1}}, cumsum(dt1))

%%
Time = cumsum(dt1);
plotWellSols({wellSol1(:, 1), wellSol2(:, 1), wellSol3(:, 1)}, Time, 'datasetnames',{'VerticalProducer', 'HorizontalProducer', 'MultilateralProducer'})





%%
% Check the lengths of the vectors
disp(['Length of wellSol1: ' num2str(length(wellSol1{:, 1}))]);
disp(['Length of wellSol2: ' num2str(length(wellSol2{:, 1}))]);
disp(['Length of Time: ' num2str(length(Time))]);












