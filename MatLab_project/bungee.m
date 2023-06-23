function [T, X, Y, Z, U, V, W, safety] = bungee(m, k, l, Xo, Yo, Zo, Uo, Vo, Wo) 
% BUNGEE solves the equations for the jump trajectory from a
% given set of input parameters, and record tha trajectory data.
% Call format: [T, X, Y, Z, U, V, W, safety] = bungee(m, k, l, Xo, Yo, Zo, Uo, Vo, Wo)

dt = 0.02;
nstep = fix(120/dt);
Cd = 0.1;
A = pi;
p = 1.2; % rho
g = 9.81;
% Use coordinates of terrain to check for safety
load('terrain.mat');

% pre-allocate
% T = zeros(1,nstep);
% X = zeros(1,nstep);
% Y = zeros(1,nstep);
% Z = zeros(1,nstep);
% U = zeros(1,nstep);
% V = zeros(1,nstep);
% W = zeros(1,nstep);
% safety = zeros(1,nstep); % set to (int) 0 first, remember to change them to logical
% r = zeros(1,nstep); % r = distance from origin
% Vmag = zeros(1,nstep); % speed of person (m/s)

% initialize time, initial coordinate, speed, and safety
n = 1;
T(n) = 0; % time
X(n) = Xo; % x-position
Y(n) = Yo; % y-position
Z(n) = Zo; % z-position
U(n) = Uo; % x-speed
V(n) = Vo; % y-speed
W(n) = Wo; % z-speed
% if person lands on terrain
if( Z(n) <= interp2(x_terrain,y_terrain,h_terrain,X(n),Y(n)) ) 
    safety(n) = false;
    return; % will initial point land on terrain????
else
    safety(n) = true;
end

for n = 1:nstep % minus 1 ??
    r(n) = sqrt(X(n)^2 + Y(n)^2 + Z(n)^2);
    Vmag(n) = sqrt(U(n)^2 + V(n)^2 + W(n)^2); 
    U(n+1) = U(n) - (k/m * (r(n)-l)/r(n)*X(n) + Cd*p*A*Vmag(n)/(2*m)*U(n) )*dt;
    V(n+1) = V(n) - (k/m * (r(n)-l)/r(n)*Y(n) + Cd*p*A*Vmag(n)/(2*m)*V(n) )*dt;
    W(n+1) = W(n) - (k/m * (r(n)-l)/r(n)*Z(n) + Cd*p*A*Vmag(n)/(2*m)*W(n) + g )*dt;
    X(n+1) = X(n) + U(n+1)*dt;
    Y(n+1) = Y(n) + V(n+1)*dt;
    Z(n+1) = Z(n) + W(n+1)*dt;
    T(n+1) = T(n) + dt;
    if( Z(n+1) <= interp2(x_terrain,y_terrain,h_terrain,X(n+1),Y(n+1)) ) 
        safety(n+1) = false;
        break;
    else
        safety(n+1) = true;
    end
end % for loop ends

end % function bungee ends