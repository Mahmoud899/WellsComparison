%%
mrstModule add mrst-gui spe10 incomp ad-core deckformat book coarsegrid wellpaths
gravity reset on

%% Setup The Grid
[nx, ny, nz] = deal(60, 40, 10);
[Lx, Ly, Lz] = deal(1500, 1000, 200);
G = cartGrid([nx,ny,nz],[Lx, Ly, Lz]);
G.nodes.coords(:,3) = G.nodes.coords(:,3)+2000;

G = computeGeometry(G);

[x0,x1,z0,z1] = deal(675,1250,2000,2200);
flt = @(c) (c(:,1)-x0)*(z1-z0)/(x1-x0) + z0 - c(:,3);

rock = makeRock(G, [600]*milli*darcy, 0.3);
zone1 = flt(G.cells.centroids)>0;
rock.perm(zone1, :) = repmat([50]*milli*darcy, sum(zone1), 1);
rock.poro(flt(G.cells.centroids)>0) = 0.1;
hT = computeTrans(G, rock);

%% Simulation Parameters
T    = 20*year();
M    = 200;
pv   = sum(poreVolume(G, rock));
bbl  = 1/6.28981;
rate = pv/(T+5*year);

%% Fluid Model
[Swi, Sor] = deal(0.2, 0.15);
[rhow, rhoo] = deal(1014, 400);
fluid = initCoreyFluid( 'mu'  , [1,   10] .* centi*poise     , ...
                        'rho' , [ rhow, rhoo] .* kilogram/meter^3, ...
                        'n'   , [   3,   2.5], ...
                        'sr'  , [Swi, Sor], ...
                        'kwm' , [0.45, 0.85]);
       


p_init = ((1-Swi)*rhoo + Swi * rhow).*norm(gravity)*G.cells.centroids(:, 3) + 50*barsa;


%% Case 1
[Rsols1, wellSol1, PAvg1, oip1, dt1] = RunSimulation(G, rock, fluid, hT, VerticalPoducer, p_init, Swi, T, M);
%%% Case 2
[Rsols2, wellSol2, PAvg2, oip2, dt2] = RunSimulation(G, rock, fluid, hT, HorizontalProducer, p_init, Swi, T, M);
%%% Case 3
[Rsols3, wellSol3, PAvg3, oip3, dt3] = RunSimulation(G, rock, fluid, hT, MultiLateralProducer, p_init, Swi, T, M);




