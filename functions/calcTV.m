function [TVC_U] = calcTV(U,dt)
    tFinal = length(U);
    TVC_U = 0;
    for i = (1+1):1:tFinal %% t0 = 1
        TVC_U = TVC_U + abs(U(i) - U(i-1))*dt;
    end