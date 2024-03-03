%% Setup Vertical Injector
Injectorpath = [1437.5 487.5 2000;
                1437.5 487.5 2200];

injectorpath = makeSingleWellpath(Injectorpath);


segInd = cell(2, 1);
[Injector2 , segInd{1}] = getWellFromPath([], G, rock, injectorpath, ...
                                           'InnerProduct', 'ip_tpf', ...
                                           'comp_i', [1 0], 'type', 'rate', ...
                                           'val', rate, 'Name', 'I');



%% Setup The multilateral Producer
origin = [67.5, 487.5, 2000; 167.5, 487.5, 2050];

w = 45*pi/180;
pathlength = 300;
pth1points = [167.5, 487.5, 2050;
              167.5+40*cos(w), 487.5+40*sin(w), 2050+20;
              167.5+160*cos(w), 487.5+160*sin(w), 2050+60;
              167.5+300*cos(w), 487.5+300*sin(w), 2050+90];

pth2points = [167.5, 487.5, 2050;
              167.5+40, 487.5, 2050+30;
              167.5+120, 487.5, 2050+60;
              167.5+300, 487.5, 2050+90];

pth3points = [167.5, 487.5, 2050;
              167.5+40*cos(w), 487.5-40*sin(w), 2050+20;
              167.5+160*cos(w), 487.5-160*sin(w), 2050+60;
              167.5+300*cos(w), 487.5-300*sin(w), 2050+90];


wellpath0 = makeSingleWellpath(origin);
wellpath1 = makeSingleWellpath(pth1points);
wellpath2 = makeSingleWellpath(pth2points);
wellpath3 = makeSingleWellpath(pth3points);
wellpathfork = combineWellPaths({wellpath0, wellpath1, wellpath2, wellpath3});

[cells_fork, segInd_fork, ~, ~, DT] = findWellPathCells(G, wellpathfork);


[MultiLateralProducer, segInd{2}] = getWellFromPath(Injector2, G, rock, wellpathfork, ...
                                                    'InnerProduct', 'ip_tpf', ...
                                                    'comp_i', [0, 1], 'type', 'bhp', ...
                                                    'val', 100*barsa, 'Name', 'P');


