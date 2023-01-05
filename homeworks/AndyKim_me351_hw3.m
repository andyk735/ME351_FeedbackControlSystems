% Andy Kim
% ME 351 HW #3
% Root Locus

% Parameters for (#5)
R = 8.4;                        % Ohms / Resistance
L = 0.00116;                    % H / Inductance
B = 0.01;                       % N-m-s / Damping Coefficient
Jm = 5.25e-6;                   % kgm^2 / Inertia of Motor
Jd = 0.5 * 0.053 * (0.0248^2);  % kgm^2 / Inertia of Disk
Km = 0.042;                     % N-m/A / Motor Torque Constant
Kb = 0.042;                     % V/(rad/s) / Emf Constant
                                
% (#1) RL Plot
num=[1];
den=[1 2 2 0];                  % s^3+2s^2+2s+0
sys=tf(num,den)

figure(1)
rlocus(sys)
title('Question #1: Root Locus Plot (Andy Kim)');

% (#4) Lead Compensation
% (g.i)
num=[1]
den=[1 0 0]
sys_pd=tf(num,den)
Z=1;
P=20;                           % p = 20
lead=tf([1 Z],[1 P]);
 

figure(2)
rlocus(lead*sys_pd)
title('Question #4(g.i): p = 20 (Andy Kim)');

% (g.ii)
P=9;                            % p = 9
lead=tf([1 Z],[1 P]);
 
figure(3)
rlocus(lead*sys_pd)
title('Question #4(g.ii): p = 9 (Andy Kim)');

% (g.iii)
P=3;                            % p = 3
lead=tf([1 Z],[1 P]);
 
figure(4)
rlocus(lead*sys_pd)
title('Question #4(g.iii): p = 3 (Andy Kim)');

% (#5)
% Transfer Function
s = tf('s');
P_motor = Km /(((Jm + Jd)*s+B)*(L*s+R)+(Km*Kb));

%rltool(P_motor)


