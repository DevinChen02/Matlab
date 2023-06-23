clear all; close all; clc;
format long; 
name = 'AAAA AAAA';
id = 'A00000000';
hw_num = 3;

%% Problem 1: 12 pts
A = zeros(30); 
A(1:31:900) = 5; 
A(2:31:870) = -2; 
A(31:31:899) = -2;
b = [-2 zeros(1,28) 1]';
sp1 = A\b;

%% Problem #2 (a,b) 2 pts each, (c,d) 4 pts each, total 12 pts
x = 0:0.1:10; sp2a = x;
f = tanh(0.5*x).^4.*exp(-sin(x).^2); sp2b = f;
sp2c = diff(f)./diff(x);
sp2d = sp2c(x == 5);

%% Problem 3: (a,b) 3 pts each, (c) 6 pts, total 12 pts
z = -5:0.1:5; sp3a = z;
g = sech(z).^2.*sin(4*z).^4; sp3b = g;
sp3c = (z(2)-z(1))*(0.5*(g(1)+g(end)) + sum(g(2:end-1)));

%% Problem 4: (a-d) 3 pts each, total 12 pts
matA = 1:100; matA = abs(fix(100*cos(matA))); matA = reshape(matA,10,10);
sp4a = matA;
sp4a( sp4a==max(sp4a) ) = -1;
sp4b = matA;
sp4b( sp4b==max(sp4b(:)) ) = -2;
sp4c = any(any(isprime(matA)));
sp4d = find(isprime(matA));

%% Problem 5(a-e): 3 pts each, total 15 pts
sp5a = clock;
sp5b = sprintf('%4d:%02d:%02d',sp5a(1:3)); 
sp5c = sprintf('%02d:%02d:%07.4f',sp5a(4:6));
sp5d = sprintf('%s\b\b\b\b\b',sp5c);
sp5e = [sp5b ' ' sp5d];

%% Problem 6: (a) 10 pts, (b) 5 pts, total 15 pts
theta = 1:360;
x = 16*sind(theta).^3;
y = 13*cosd(theta) - 5*cosd(2*theta) - 2*cosd(3*theta) - cosd(4*theta);

figure(1); hold on;
plot(x,y,'-r','LineWidth',5);
plot(x(end),y(end),'cd','MarkerSize',30,'MarkerFaceColor','c'); 
box on; grid on;
title('Two-dimensional Parametric Curve'); xlabel('x'); ylabel('y');
set(gca,'FontSize',16); 
legend('parametric curve','end point','Location','SouthEast');
sp6a = 'See figure 1';
sp6b = sum(sqrt(diff(x).^2+diff(y).^2));

%% Problem 7: (a,b) 5 pts each, (c) 12 pts, total 22 pts
theta = 0:0.5:1200;
x =(1+0.25*cosd(50*theta)).*cosd(theta);
y = (1+0.25*cosd(50*theta)).*sind(theta);
z = pi*theta/180 + 2*sind(50*theta);
sp7a = sum(sqrt(diff(x).^2+diff(y).^2+diff(z).^2));
arclength = cumsum(sqrt(diff(x).^2+diff(y).^2+diff(z).^2));
tmp = find(arclength >  500);
sp7b = [x(tmp(1)) y(tmp(1)) z(tmp(1))];

figure(2); hold on;
plot3(x,y,z,'-m','LineWidth',0.5); axis tight;
plot3(x(1),y(1),z(1),'ko','MarkerSize',10,'MarkerFaceColor','k'); 
plot3(x(end),y(end),z(end),'r^','MarkerSize',10,'MarkerFaceColor','r'); 
plot3(sp7b(1),sp7b(2),sp7b(3),'bs','MarkerSize',10,'MarkerFaceColor','b'); 
view(3);
title('Three-dimensional Winding Coil'); 
xlabel('x'); ylabel('y'); zlabel('z');
legend('Coil','start point','end point','L = 500 point');
box on; grid on;
set(gca,'FontSize',16);
sp7c = 'See figure 2';
