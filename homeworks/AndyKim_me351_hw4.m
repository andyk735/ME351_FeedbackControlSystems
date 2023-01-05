%
% Andy Kim
% ME 351 Homework #4
% Feedback Control Systems
%

%% 
clc;
clear all;

% 7a. & 7b. Open-Loop Bode Plot
s = tf('s');
G = 26/(s*((s/10)+1));

figure(1)
margin(G)
grid on
%title('7a. Open-Loop Bode Plot')

% 7c. & 7d. Compensated Bode Plot
K = 3.84615;
G_comp = K*G;

figure(2)
bode(G, G_comp)
%margin(G_comp)
legend('Uncompensated', 'Compensated')
grid on
title('7d. Uncompensated vs. Compensated System')

% 7e. Closed-Loop Unit Step Response
G_CL = (26*K)/(s*((s/10)+1)+(26*K));

figure(3)
step(G_CL)
grid on
title('7e. Closed-Loop Unit Step Response')

% 7f. Closed-Loop Unit Ramp Response
figure(4)
step(G_CL/s)
grid on
title('7f. Closed-Loop Unit Ramp Response')

% 7g. Lead Compensator
G_OL = 26/(s*((s/10)+1));
K = 8.5;
p = 71.5524;
z = 0.16654*p;
C = K*(s+z)/(s+p);
G_Lead = G_OL*C;

figure(5)
margin(G_Lead)

figure(6)
bode(G_Lead,G,G_comp)
legend('Lead Compensator','Uncompensated', 'Compensated')
grid on
title('7g. Lead Compensator Comparison')

figure(7)
step(G_Lead)
title('7g. Unit Step Response')

figure(8)
step(G_Lead/s)
title('7g. Unit Ramp Response')
