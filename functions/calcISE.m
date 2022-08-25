function IAE_y = calcISE(Y, Yd, dt)

    tFinal = length(Y);
    t = 1: dt: tFinal*dt; % process time vector
       
    IAE_y = 0;
    for i = 1 :1: tFinal %% t0 = 1
        IAE_y = IAE_y + ((Y(i)-Yd(i))^2)*dt;
    end
    