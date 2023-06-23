clear all; close all; clc;
name = 'AAAA AAAA';
id = 'A00000000';
hw_num = 7;
format long; 

%% Problem 1: (a-g) 2 pts each, (h) 11 pts, total 25 pts
%             (i) extra credit: 5 pts
load('terrain.mat');

% Locate peaks hills and snow cover 
counter_peak = 0;
counter_snow = 0;

for n = 2:length(x)-1
    for m = 2:length(y)-1
        nb = altitude(n-1:n+1,m-1:m+1);
        nb(5) = [];
        if altitude(n,m) >= max(nb)
            counter_peak = counter_peak + 1;
            xloc_peak(counter_peak) = x(n);
            yloc_peak(counter_peak) = y(m);
            altitude_peak(counter_peak) = altitude(n,m);
        elseif altitude(n,m) > 1100
            counter_snow = counter_snow + 1;
            xloc_snow(counter_snow) = x(n);
            yloc_snow(counter_snow) = y(m);
            zloc_snow(counter_snow) = altitude(n,m);
        end
    end
end
sp1a = counter_peak;
sp1b = xloc_peak;
sp1c = yloc_peak;
sp1d = altitude_peak;
sp1e = xloc_snow;
sp1f = yloc_snow;
sp1g = zloc_snow;

% Extra credit
% Find the initial location of the ball
% Note: keep track of indices of x and y rather than the actual values.
counter = 1;
xp_ind(counter) = find(x == 8000);
yp_ind(counter) = find(y == -8000);

% Identify the elevation of the neighborhood (3 x 3 matrix)
nb_alt = altitude(xp_ind(counter)-1:xp_ind(counter)+1, ...
                  yp_ind(counter)-1:yp_ind(counter)+1);

% Identify the lowest elevation within the neighborhood
lowest_nb = min(nb_alt(:));

% iterate while the difference in elevation between the lowest elevation in 
% the neighborhood and the ball is less than 0 (i.e, continue to fall)
while lowest_nb - altitude(xp_ind(counter),yp_ind(counter)) < 0 
   
    % find row and col indices of lowest neighbor with respect to the ball
    % the indices are local within the neighborhood
    [row,col] = find(nb_alt == lowest_nb); 
    
    % Shift the ball to the neighbor with lowest elevation
    xp_ind(counter+1) = xp_ind(counter)+row-2; % shift center to the lowest neighbor
    yp_ind(counter+1) = yp_ind(counter)+col-2;

    % Update counter to move onto the new neighborhood
    counter = counter + 1;
    nb_alt = altitude(xp_ind(counter)-1:xp_ind(counter)+1,...
                      yp_ind(counter)-1:yp_ind(counter)+1);
    lowest_nb = min(nb_alt(:));
end

% Get the elevation of the ball:
for n = 1:length(xp_ind)
    zp(n) = altitude(xp_ind(n),yp_ind(n));
end

% Make figure 1:
figure(1); hold on;
surf(x/1000,y/1000,altitude'); shading interp;
plot3(sp1b/1000,sp1c/1000,sp1d,'ro','MarkerFaceColor','r','MarkerSize',10);
plot3(sp1e/1000,sp1f/1000,sp1g,'go','MarkerFaceColor','g','MarkerSize',4);
plot3(x(xp_ind)/1000,y(yp_ind)/1000,zp,'m-','Linewidth',4)
view(3);
box on; grid on;
xlabel('x (km)');
ylabel('y (km)');
zlabel('altitude (m)');
title('Problem 1: Snow coverage');
legend('terrain','peak','snow cover','falling path','Location','NorthEast');
set(gca,'FontSize',14);
sp1h = 'See figure 1';
sp1i = 'See falling path';


%% Problem 2: (a-d) 5 pts each, total 20 pts
load('matB.mat');
sum_elem = 0;

for m = 1:size(matB,2) % column indices 
    for n = 1:size(matB,1) % row indices          
        if n == m
            break
        end
        sum_elem = sum_elem + matB(n,m);
    end
end
sp2a = sum_elem;

prod_elem = 1;
for n = 1:size(matB,1)  % row indices 
    for m = 1:size(matB,2) % column indices
        if m == n
            break
        end
        prod_elem = prod_elem * matB(n,m);
    end
end
sp2b = prod_elem;

sum_elem = 0;
for m = 1:size(matB,2)  % column indices
    for n = 1:size(matB,1) % row indices
        if m == 2*n
            continue;
        end
        sum_elem = sum_elem + matB(n,m);
    end
end
sp2c = sum_elem;
    
prod_elem = 1; 
for n = 1:size(matB,1)  % row indices
    for m = 1:size(matB,2) % column indices        
        if matB(n,m) > n
            continue;
        end
        prod_elem = prod_elem * matB(n,m);
    end
end
sp2d = prod_elem;



%% Problem 3: (a) 2 pts (b-g) 3 pts each (h)  10 pts, total 30 pts
sp3a = evalc('help car');
[sp3b, sp3c, sp3d] = car(60,10);
[sp3e, sp3f, sp3g] = car(60,1);

% Make figure 2
figure(2);

% Upper panel
subplot(2,1,1);
hold on;
plot(sp3b,sp3c/1000,'-ro','MarkerFacecolor','r','MarkerSize',4);
plot(sp3e,sp3f/1000,'-bd','MarkerFacecolor','b','MarkerSize',4);
axis tight; box on; grid on;
ylabel('Distance (km)'); axis tight; title('Motion of the car');
set(gca,'FontSize',14);

% Lower panel
subplot(2,1,2); hold on;
plot(sp3b,sp3d,'-ro','MarkerFacecolor','r','MarkerSize',4);
plot(sp3e,sp3g,'-bd','MarkerFacecolor','b','MarkerSize',4);
axis tight; box on; grid on;
xlabel('time (s)'); ylabel('Velocity (m/s)');
legend('dt = 10 s', 'dt = 1 s', 'Location','best')
set(gca,'FontSize',14);
sp3h = 'See figure 2';


%% Problem 4: (a-e) 1 pts each, (f,g) 5 pts each,  (h) 10 pts, total 25 pts
sp4a = evalc('help rocket');
sp4b = evalc('help gravity');
sp4c = evalc('help thrust');
sp4d = evalc('help rocket>gravity');
sp4e = evalc('help rocket>thrust');

[T, Z, W] = rocket(120,0.1);
sp4f = Z(end); 
sp4g = W(end);

% figure 3
figure(3);

% upper panel
subplot(2,1,1);
plot(T,Z/1000,'r-','LineWidth',4);  
ylabel('Altitude (km)'); 
box on; grid on;
title('Projectile of the rocket'); 
axis([0 120 0 12]);
set(gca,'FontSize',12);

% lower panel
subplot(2,1,2);
plot(T,W,'r-','LineWidth',4); 
xlabel('time (s)');
ylabel('Velocity (m/s)');
box on; grid on;
set(gca,'FontSize',12);
sp4h = 'See figure 3';