% Variaveis para teste em bancada

clear

%% Parametros para simular ruido
var_ruido = 0.47;
erro_tipico_medicao = sqrt(var_ruido);

%% Degraus e instantes de tempo

ref = 10;       % Amplitude do degrau de entrada do sistema
Tref = 600;     % Instante em que o degrau de referencia eh aplicado
dist = 5;       % Amplitude do degrau do disturbio
Tdist = 2*Tref; % Momento em que o disturbio eh aplicado
Thold = Tref;    % Tempo em que deseja que o disturbio seja aplicado
Tdistdown = Tdist+Thold;    % Momento em que o disturbio é retirado
Trefdown = Tref+Tdistdown;  % Momento em que a referencia retorna para zero
Tsim = Tref+Trefdown;       % Tempo total que sera executado o Simulink
Ts = 5;         % Tempo de amostragem

%% Discretizacao do sinal

s = tf([1 0],1);

K = 2.4673;
t1 = 17.6991;
t2 = 52.0833;
tau = sqrt(t1*t2);
lambda = 3*tau;

sysBot = minreal(K/((t1*s+1)*(t2*s+1)));
Z_sysBot = c2d(sysBot, Ts, 'zoh');

%% Controlador e planta

P = 0.3105; % Valor Kp do controlador
I = 0.0044; % Valor Ki do controlador
D = 4.1019; % Valor Kd do controlador
C = pid(P, I, D);

Pa = 0.0565;
Pb = 0.0192;
Ta = 1/Pa;
Tb = 1/Pb;
Td = Tb*(50/100); % Td é 50% da constante de tempo do polo mais lento
Qs = 1/((Td*s+1)^2); % Filtro do observador de distúrbio

Kg = 0.002677;

Gs =  Kg/((s+Pa)*(s+Pb));
G_inv_Q = Gs^(-1) * Qs;