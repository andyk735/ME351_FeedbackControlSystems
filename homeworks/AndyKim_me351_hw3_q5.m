% Andy Kim
% ME 351 HW #3
% Servo Motor Root Locus

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
%controlSystemDesigner('rlocus', P_motor)
rltool(P_motor)
