%% Setup The Injection Well
rxy = sqrt((Lx/nx)^2 + (Ly/ny)^2);
xy = G.cells.centroids(:,1:2);
InjWCells = find( sum(bsxfun(@minus,xy,[1437.5 487.5]).^2,2)<rxy);

Injector = addWell( [],  G, rock, ...
                    InjWCells,  ...
                    'InnerProduct', 'ip_tpf',...
                    'Type', 'rate', 'Val', rate, ...
                    'Comp_i', [1 0], 'Name', 'I', 'Dir','z');

%% SetuP the Production Wells
VertProdCells = find( sum(bsxfun(@minus,xy,[67.5 487.5]).^2,2)<rxy);

VerticalPoducer = addWell( Injector, G, rock,...
                            VertProdCells,  ...
                            'InnerProduct', 'ip_tpf', ...
                            'Type', 'bhp', 'Val', 100*barsa, ...
                            'Comp_i', [0 1], 'Name', 'P', 'Dir','z');