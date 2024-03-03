function [Rsols,wellSol, oip, dt] = RunSimulation(G, rock, fluid, hT, W, p_init, Swi, T, M)
    %Simulate Summary of this function goes here
    %   Detailed explanation goes here
    
    Rsols   = cell(M+1, 1);
    wellSol = cell(M, 1);
    oip     = zeros(M+1, 1);
    
    x0      = initState(G,W,p_init, [Swi, 1-Swi]);
    x       = x0;
    step    = 0;
    t       = 0;
    [dt,dT] = deal(zeros(M,1), T/M);
    Rsols{1, 1} = x0;
    oip(1, 1) = sum(x.s(:, 2).*poreVolume(G, rock));
    
    
    for i = 1:M
        step = step+1;
        t = t+dT;
        if mod(step, 10) == 0
            fprintf('\nTime step %d: Time %.0f years and %0.0f days\n', step, convertTo(t, year), mod(t, year)/day);
        end
        
        x                       = incompTPFA(x, G, hT, fluid, 'wells', W);
        x                       = implicitTransport(x, G, dT, rock, fluid, 'wells', W);
        dt(i)                   = dT;

        oip(i+1, 1)     = sum(x.s(:, 2).*poreVolume(G, rock));
        Rsols{i+1, 1}   = x;
        wellSol{i, 1}   = getWellSol(W, x, fluid);
    end
end