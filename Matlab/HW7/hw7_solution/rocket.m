function [T, Z, W] = rocket( Tf, dt)
% ROCKET solves for the vertical motion of a rocket under the influence of
% altitude-varying gravity and time-dependent thrust numerically using 
% Euler-Cromer method.
% Inputs: time duration Tf and time step dt.
% Outputs: time T, height Z and vertical velocity W of the rocket
% Call format: [T, Z, W] = rocket( Tf, dt)

% Preallocate 
nt = ceil(Tf/dt);
T = zeros(1,nt);
W = zeros(1,nt);
Z = zeros(1,nt);

% Initialize variables
T(1) = 0;
W(1) = 0;
Z(1) = 0;
m = 10;

% Time march with Euler-Cromer method
for n=1:nt
   T(n+1) = T(n) + dt;
   g = gravity(Z(n));
   Th = thrust(T(n));
   W(n+1) = W(n) + (-g + Th/m ) * dt;
   Z(n+1) = Z(n) + W(n+1)*dt; 
end

end %function rocket

function [Th] = thrust(t)
% THRUST gives the upward thrust of the rocket as a function of time.
% Call format: [Th] = thrust(t)
if t >= 0 && t < 2
    Th = 670;  
elseif t < 4
    Th = 1360; 
else
    Th = 0;
end
end %function thrust


function [g] = gravity(z)
% GRAVITY gives a value of g as a function of altitude z.
% Call format: [g] = gravity(z)
if z >= 0 && z < 10000
    g = 9.81*(1 - (z/10000)^3);
else
    g = 0;
end
end %function gravity



