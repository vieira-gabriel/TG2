function IAE_y = calcIAE(Y, Yd, dt)

    tFinal = length(Y);
    t = 1: dt: tFinal*dt; % process time vector
       
    IAE_y = 0;
    for i = 1 :1: tFinal %% t0 = 1
        IAE_y = IAE_y + abs(Y(i)-Yd(i))*dt;
    end
    