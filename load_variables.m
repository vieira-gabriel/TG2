% Variaveis para arquitetura 1, teste em bancada

clear
%% Parametros para simular ruido
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

%% Parametros filtro estatistico
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

%% Parametros controlador
P = 0.3105; % Valor Kp do controlador
I = 0.0044; % Valor Ki do controlador
D = 4.1019; % Valor Kd do controlador
C = pid(P, I, D);

%% Observador e funcao de transferencia da planta

Pa = 0.0565;
Pb = 0.0192;
Ta = 1/Pa;
Tb = 1/Pb;
Tm = Tb*(90/100);
Qs = 1/((Tm*s+1)^2);

Kg = 0.002677;

Gs =  Kg/((s+Pa)*(s+Pb));
G_inv_Q = Gs^(-1) * Qs;
ObsGain = 1;