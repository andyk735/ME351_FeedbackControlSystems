% Andy Kim
% ME 351 HW #2
% Servo Motor Feedback Controller

% Parameters
R = 8.4;                        % Ohms / Resistance
L = 0.00116;                    % H / Inductance
B = 0.01;                       % N-m-s / Damping Coefficient
Jm = 5.25e-6;                   % kgm^2 / Inertia of Motor
Jd = 0.5 * 0.053 * (0.0248^2);  % kgm^2 / Inertia of Disk
Km = 0.042;                     % N-m/A / Motor Torque Constant
Kb = 0.042;                     % V/(rad/s) / Emf Constant
                                
% Transfer Function
s = tf('s');
P_motor = Km /(((Jm + Jd)*s+B)*(L*s+R)+(Km*Kb));

% 5a: Closed Loop Response to Unit Step Input w/ Proportional Control
Kp1 = 5;         % Proportional Control 1
Kp2 = 10;        % Proportional Control 2
Kp3 = 50;        % Proportional Control 3

c1 = pid(Kp1);   % Controller 1 (P)
c2 = pid(Kp2);   % Controller 2 (P)
c3 = pid(Kp3);   % Controller 3 (P)

sys_cl1 = feedback(c1*P_motor, 1);  % Closed Loop Response for Kp1
sys_cl2 = feedback(c2*P_motor, 1);  % Closed Loop Response for Kp2
sys_cl3 = feedback(c3*P_motor, 1);  % Closed Loop Response for Kp3

figure(1);
step(sys_cl1, sys_cl2, sys_cl3, [0:1e-5:4e-3]);

grid
xlabel('Time');
ylabel('Angular Velocity [rad/s]');
legend('Kp=5', 'Kp=10', 'Kp=50');
title('Closed Loop Response to Unit Step Input w/ Proportional Control (Andy Kim)');

% 5b: Closed Loop Response to Unit Step Input w/ Proportional Integral
Ki1 = 5;            % Proportional Integral 1
Ki2 = 20;           % Proportional Integral 2

c1 = pid(Kp2, Ki1);  % Controller 1 (PI)
c2 = pid(Kp2, Ki2); % Controller 2 (PI)

sys_cl1 = feedback(c1*P_motor,1);
sys_cl2 = feedback(c2*P_motor,1);

figure(2);
step(sys_cl1, sys_cl2);

grid
xlabel('Time');
ylabel('Angular Velocity [rad/s]');
legend('Ki=5', 'Ki=20');
title('Closed Loop Response w/ Integral Term (Andy Kim)')

% 5c: Proportional Integral + Derivative
Kd = 2;                 % Proportional Derivative

c1 = pid(Kp2, Ki2, Kd); % Controller 1 (PID)

sys_cl1 = feedback(c1*P_motor,1);

figure(3);
step(sys_cl1);

grid
xlabel('Time');
ylabel('Angular Velocity [rad/s]');
legend('Kd=2');
title('Closed Loop Response w/ Integral & Derivative Term (Andy Kim)')

% 5d: Vary Kp, Ki, Kd to improve response time
Kp = 40;                % Selected Proportional Control
Ki = 20;                % Selected Proportional Integral
Kd = 10;                % Selected Proportional Derivative

c = pid(Kp, Ki, Kd);    % Controller (Improved PID)

sys_cl = feedback(c*P_motor,1);

figure(4);
step(sys_cl);

grid
xlabel('Time');
ylabel('Angular Velocity [rad/s]');
legend();
title('Improved Response Time w/ Selected Kp, Ki, Kd (Andy Kim)')


