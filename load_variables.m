% Variaveis para arquitetura 1, teste em bancada

clear

var_ruido = 0.47;
erro_tipico_medicao = sqrt(var_ruido);
ref = 10;
Tref = 800;
dist = 5;
Tstep = 2*Tref;
Thold = 20;
Tstepdown = Tstep+Thold;
Trefdown = Tref+Tstepdown;
%Tsim = Tstep+Thold*2;
Tsim = Tref+Trefdown;
zeroBot = 25;
cond_inicial = 0;
Ts = 5;
s = tf([1 0],1);

K = 2.4673;
t1 = 17.6991;
t2 = 52.0833;
tau = sqrt(t1*t2);
lambda = 3*tau;

sysBot = minreal(K/((t1*s+1)*(t2*s+1)));
Z_sysBot = c2d(sysBot, Ts, 'zoh');

Kc = (t1+t2)/(K*lambda);
Ti = t1 + t2;
Td = t1*t2/Ti;

P = 0.3105;
I = 0.0044;
D = 4.1019;
C = pid(P, I, D);

Pa= 0.0565;
Pb= 0.0192;
Ta = 1/Pa;
Tb = 1/Pb;
Tm = Tb*(90/100);
Qs = 1/((Tm*s+1)^2);

%Controlador Gs:
Kg = 0.002677;

Gs =  Kg/((s+Pa)*(s+Pb));
G_inv_Q = Gs^(-1) * Qs;
ObsGain = 1;