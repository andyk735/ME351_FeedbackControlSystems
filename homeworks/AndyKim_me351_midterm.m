% Andy Kim
% ME 351 Take Home Midterm
% Feedback Control Systems

% I already submitted at 5:12 PM, but forgot to attach my Matlab file, so I
% resubmitted it with the Matlab file at 7:11 PM

clc, clear all; 
% Derived Constants
K = 40;                     % rad/(Volts*sec) [DC Gain]
T = 0.5;                    % sec [Tau Time Constant]

% (#1a) Open-Loop Response 
s = tf('s');
G_OL = K / (T*s+1);
opt = stepDataOptions;
opt.StepAmplitude = 5;

figure(1)
step(G_OL,opt)
ylabel('Angular Velocity [rad/s]');
title('Question #1a: Open-Loop Response (Andy Kim)');

% (#1b) Closed-Loop Response w/ P Control
Kp = 1.225;
G_CL = (K*Kp) / (T*s + 1 + K*Kp);

figure(2)
step(G_CL)
ylabel('Angular Velocity [rad/s]');
title('Question #1b: Closed-Loop Response w/ P Control (Andy Kim)');

% (#1c) 5 Volt Step Input y(t) Response
syms s
Y_s = (5*K*Kp) / (s*(T*s + 1 + K*Kp));
y_t = ilaplace(Y_s)

% (#1d) PI Controller
Ki = 1.25;
s = tf('s');
G = (K*(Kp*s + Ki))/(s*(T*s + 1) + (K*(Kp*s + Ki)));

figure(3)
step(G/s);
ylabel('Angular Velocity [rad/s]');
title('Question #1d PI-controller Ramp Input (slope = 1) (Andy Kim)');

% (#2a) PI Controller Requirements
sys = K / (s*(T*s + 1));
sisotool('rlocus', sys);

% (#2b) PI Controller
% use Control System Designer from (#2a)

% (2c) Unit Step Disturbance to Meet Requirements
Kp = 50;                             
G_CL = K/(s*(T*s + 1) + (K*Kp));

figure(4);
step(G_CL);
title('Question #2c Unit Step Disturbance (Kp = 50) (Andy Kim)');

pole(G_CL);
fprintf('The Poles of the system 2c are');
disp(pole(G_CL));

% (2d) PD Controller
Td = 0.02;
sys = K*(1 + Td*s) / (s*(T*s + 1));

figure(5);
rlocus(sys);
xlabel('Re');
ylabel('Im');
title('Question #2d PD Control (Andy Kim)');

% (2e) Kc = 50 Unit Step Disturbance
Kc = 50;                                                         % Controller Constant
G_CL = K / ((T*s^2) + (Kc*K*Td +1)*s + (Kc*K));      % CL TF for 2e

figure(6);
step(G_CL);
title('Question 2e CL Step Response for Kc = 50 (Andy Kim)');

pole(G_CL);
fprintf('The Poles of the system 2e are');
disp(pole(G_CL));

% (2f)
Kc = 122.487;
G_CL = K / ((T*s^2) + (Kc*K*Td +1)*s + (Kc*K));

figure(7);
step(G_CL);
title('Question 2f Optimized Response for Kc = 122.487');
pole(G_CL);
fprintf('The Poles of the system 2f are');
disp(pole(G_CL));
