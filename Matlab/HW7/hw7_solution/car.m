function [T, X, U] = car(Tf, dt)
% CAR solves the motion of a car that accelerates with 
% a(t) = 5*sech(t/20)^2*tanh(t/20).
% The car is initially at rest. Euler method is used.
% Inputs: total traveling time Tf,
%         and time step dt.
% Outputs: time T, distance X and velocity U of the car
% [T, X, U] = car(Tf, dt)
  
% Preallocate 
nt = ceil(Tf/dt);
T = zeros(1,nt);
U = zeros(1,nt);
X = zeros(1,nt);

% Apply initial condition 
T(1) = 0;
U(1) = 0;
X(1) = 0;

% Time march with Euler method
for n = 1:nt
   T(n+1) = T(n) + dt;
   U(n+1) = U(n) + 5*sech(T(n)/20)^2*tanh(T(n)/20)*dt;
   X(n+1) = X(n) + U(n)*dt; 
end

end %function car