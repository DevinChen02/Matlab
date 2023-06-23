clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Yanxiong Chen';
id = 'A16385208';
hw_num = 'project';

% Task 1: plot 4 figures 
load('terrain.mat');

max_distance = []; % 18 max distance data
mass_vector = []; % 1-6 mass data
string_vector = []; % 7-12 string modulus (N/m) data
cordLength_vector = []; % 13-18 cord length data
title_vector = cell(1,18); % 18 titles for experiments
max_speed = []; % 18 max speeds for all experiments
max_acceleration = []; % 18 max accelerations for all experiments
integrated_KE = []; % 18 integrated KE for all experiments
travel_distance = []; % 18 travel distance for all experiments

figure(1); hold on;

for exp_num = 1:6
    [m, k, l, Xo, Yo, Zo, Uo, Vo, Wo] = read_input('bungee_data.txt', exp_num);
    [T, X, Y, Z, U, V, W, safety] = bungee(m, k, l, Xo, Yo, Zo, Uo, Vo, Wo);
    
    %%%%%%%%%%%%%%%% update mass & max_distance vector %%%%%%%%%%%%%%%%%
    mass_vector = [mass_vector, m];
    Distance = sqrt(X.^2 + Y.^2 + Z.^2);
    Dmax = max(Distance);
    max_distance = [max_distance, Dmax];

    %%%%%%%%%%%%%%%% update max_speed vector %%%%%%%%%%%%%%%%%
    Speed = sqrt(U.^2 + V.^2 + W.^2);
    Smax = max(Speed);
    max_speed = [max_speed, Smax];
    
    %%%%%%%%%%%%%%%% update max_acceleration vector %%%%%%%%%%%%%%%%%\
    dt = 0.02;
    Acceleration = diff(Speed)./dt;
    Amax = max(Acceleration);
    max_acceleration = [max_acceleration, Amax];

    %%%%%%%%%%%%%%%% update integrated KE vector %%%%%%%%%%%%%%%%%\
    KE = ((0.5).*m.*Speed.^2); 
    integrated_KE_ = (T(2)-T(1))*(0.5*(KE(1)+KE(end)) + sum(KE(2:end-1)));
    integrated_KE = [integrated_KE, integrated_KE_];

    %%%%%%%%%%%%%%%% update travel distance vector %%%%%%%%%%%%%%%%%\
    Travel = sum(sqrt(diff(X).^2+diff(Y).^2+diff(Z).^2));
    travel_distance = [travel_distance, Travel];

    % plot figure
    subplot(2,3,exp_num); hold on;
    % Plot terrain surface
    surf(x_terrain, y_terrain, h_terrain); hold on;
    colormap('jet'); shading interp;
    grid on; xlabel('x (m)'); ylabel('y (m)'); zlabel('z (m)');
    view(3); axis([-100 100 -150 100 -250 0]);
    set(gca, 'LineWidth', 2, 'FontSize', 10, ...
        'Xtick',-150:50:150, 'Ytick', -150:50:100, 'Ztick',-200:50:0);
    
    plot3(X, Y, Z, 'k-', 'LineWidth', 1.4); % trajectory
    plot3(X(end), Y(end), Z(end), 'ro','MarkerFaceColor','r'); % red filled circle - final position
    
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    
    exp_title = sprintf('Exp #%d', exp_num);
    if any(safety(:) == false)
        exp_title = sprintf('Exp #%d danger', exp_num);
    end
    title_vector{1,exp_num} = exp_title;

    title(exp_title); box on; grid on;
    view(3);
end

figure(2); hold on;

for exp_num = 7:12
    [m, k, l, Xo, Yo, Zo, Uo, Vo, Wo] = read_input('bungee_data.txt', exp_num);
    [T, X, Y, Z, U, V, W, safety] = bungee(m, k, l, Xo, Yo, Zo, Uo, Vo, Wo);
    
    %%%%%%%%%%%%%%%% update string & max_distance vector %%%%%%%%%%%%%%%%%
    string_vector = [string_vector, k];
    Distance = sqrt(X.^2 + Y.^2 + Z.^2);
    Dmax = max(Distance);
    max_distance = [max_distance, Dmax];

    %%%%%%%%%%%%%%%% update max_speed vector %%%%%%%%%%%%%%%%%
    Speed = sqrt(U.^2 + V.^2 + W.^2);
    Smax = max(Speed);
    max_speed = [max_speed, Smax];

    %%%%%%%%%%%%%%%% update max_acceleration vector %%%%%%%%%%%%%%%%%\
    dt = 0.02;
    Acceleration = diff(Speed)./dt;
    Amax = max(Acceleration);
    max_acceleration = [max_acceleration, Amax];

    %%%%%%%%%%%%%%%% update integrated KE vector %%%%%%%%%%%%%%%%%\
    KE = ((0.5).*m.*Speed.^2); 
    integrated_KE_ = (T(2)-T(1))*(0.5*(KE(1)+KE(end)) + sum(KE(2:end-1)));
    integrated_KE = [integrated_KE, integrated_KE_];

    %%%%%%%%%%%%%%%% update travel distance vector %%%%%%%%%%%%%%%%%\
    Travel = sum(sqrt(diff(X).^2+diff(Y).^2+diff(Z).^2));
    travel_distance = [travel_distance, Travel];

   
    % plot figure
    subplot(2,3,exp_num-6); hold on;
    % Plot terrain surface
    surf(x_terrain, y_terrain, h_terrain); hold on;
    colormap('jet'); shading interp;
    grid on; xlabel('x (m)'); ylabel('y (m)'); zlabel('z (m)');
    view(3); axis([-100 100 -150 100 -250 0]);
    set(gca, 'LineWidth', 2, 'FontSize', 10, ...
        'Xtick',-150:50:150, 'Ytick', -150:50:100, 'Ztick',-200:50:0);
    
    plot3(X, Y, Z, 'k-', 'LineWidth', 1.4); % trajectory
    plot3(X(end), Y(end), Z(end), 'ro','MarkerFaceColor','r'); % red filled circle - final position
       
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    exp_title = sprintf('Exp #%d', exp_num);
    if any(safety(:) == false)
        exp_title = sprintf('Exp #%d danger', exp_num);
    end
    title_vector{1,exp_num} = exp_title;

    title(exp_title); box on; grid on;
    view(3);
end

figure(3); hold on;
for exp_num = 13:18
    [m, k, l, Xo, Yo, Zo, Uo, Vo, Wo] = read_input('bungee_data.txt', exp_num);
    [T, X, Y, Z, U, V, W, safety] = bungee(m, k, l, Xo, Yo, Zo, Uo, Vo, Wo);
    
    %%%%%%%%%%%%%%%% update cord length & max_distance vector %%%%%%%%%%%%%%%%%
    cordLength_vector = [cordLength_vector, l];
    Distance = sqrt(X.^2 + Y.^2 + Z.^2);
    Dmax = max(Distance);
    max_distance = [max_distance, Dmax];

    %%%%%%%%%%%%%%%% update max_speed vector %%%%%%%%%%%%%%%%%
    Speed = sqrt(U.^2 + V.^2 + W.^2);
    Smax = max(Speed);
    max_speed = [max_speed, Smax];

    %%%%%%%%%%%%%%%% update max_acceleration vector %%%%%%%%%%%%%%%%%\
    dt = 0.02;
    Acceleration = diff(Speed)./dt;
    Amax = max(Acceleration);
    max_acceleration = [max_acceleration, Amax];

    %%%%%%%%%%%%%%%% update integrated KE vector %%%%%%%%%%%%%%%%%\
    KE = ((0.5).*m.*Speed.^2); 
    integrated_KE_ = (T(2)-T(1))*(0.5*(KE(1)+KE(end)) + sum(KE(2:end-1)));
    integrated_KE = [integrated_KE, integrated_KE_];

    %%%%%%%%%%%%%%%% update travel distance vector %%%%%%%%%%%%%%%%%\
    Travel = sum(sqrt(diff(X).^2+diff(Y).^2+diff(Z).^2));
    travel_distance = [travel_distance, Travel];
   
    % plot figure
    subplot(2,3,exp_num-12); hold on;
    % Plot terrain surface
    surf(x_terrain, y_terrain, h_terrain); hold on;
    colormap('jet'); shading interp;
    grid on; xlabel('x (m)'); ylabel('y (m)'); zlabel('z (m)');
    view(3); axis([-100 100 -150 100 -250 0]);
    set(gca, 'LineWidth', 2, 'FontSize', 10, ...
        'Xtick',-150:50:150, 'Ytick', -150:50:100, 'Ztick',-200:50:0);
    
    plot3(X, Y, Z, 'k-', 'LineWidth', 1.4); % trajectory
    plot3(X(end), Y(end), Z(end), 'ro','MarkerFaceColor','r'); % red filled circle - final position
       
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    exp_title = sprintf('Exp #%d', exp_num);
    if any(safety(:) == false)
        exp_title = sprintf('Exp #%d danger', exp_num);
    end
    title_vector{1,exp_num} = exp_title;

    title(exp_title); box on; grid on;
    view(3);
end

figure(4); hold on;
% max distance (m) vs. mass (kg) 1-6
subplot(1, 3, 1); hold on;
plot(mass_vector(1), max_distance(1), 'ko','MarkerFaceColor','k','MarkerSize',10);
plot(mass_vector(2), max_distance(2), 'ro','MarkerFaceColor','r','MarkerSize',10);
plot(mass_vector(3), max_distance(3), 'bo','MarkerFaceColor','b','MarkerSize',10);
plot(mass_vector(4), max_distance(4), 'go','MarkerFaceColor','g','MarkerSize',10);
plot(mass_vector(5), max_distance(5), 'co','MarkerFaceColor','c','MarkerSize',10);
plot(mass_vector(6), max_distance(6), 'mo','MarkerFaceColor','m','MarkerSize',10);
title('Effect of mass');
xlabel('mass (kg)'); ylabel('max distance (m)');
legend(title_vector{1:6}, 'location', 'best');
plot(mass_vector, max_distance(1:6), 'k-');
box on; grid on;
axis tight;

% max distance (m) vs. string modulus (N/m) 7-12
subplot(1, 3, 2); hold on;
plot(string_vector(1), max_distance(7), 'ko','MarkerFaceColor','k','MarkerSize',10);
plot(string_vector(2), max_distance(8), 'ro','MarkerFaceColor','r','MarkerSize',10);
plot(string_vector(3), max_distance(9), 'bo','MarkerFaceColor','b','MarkerSize',10);
plot(string_vector(4), max_distance(10), 'go','MarkerFaceColor','g','MarkerSize',10);
plot(string_vector(5), max_distance(11), 'co','MarkerFaceColor','c','MarkerSize',10);
plot(string_vector(6), max_distance(12), 'mo','MarkerFaceColor','m','MarkerSize',10);
title('Effect of spring modulus');
xlabel('string modulus (N/m)'); ylabel('max distance (m)');
legend(title_vector{7:12}, 'location', 'best');
plot(string_vector, max_distance(7:12), 'k-');
box on; grid on;
axis tight;

% max distance (m) vs. cord length (m) 13-18
subplot(1, 3, 3); hold on;
plot(cordLength_vector(1), max_distance(13), 'ko','MarkerFaceColor','k','MarkerSize',10);
plot(cordLength_vector(2), max_distance(14), 'ro','MarkerFaceColor','r','MarkerSize',10);
plot(cordLength_vector(3), max_distance(15), 'bo','MarkerFaceColor','b','MarkerSize',10);
plot(cordLength_vector(4), max_distance(16), 'go','MarkerFaceColor','g','MarkerSize',10);
plot(cordLength_vector(5), max_distance(17), 'co','MarkerFaceColor','c','MarkerSize',10);
plot(cordLength_vector(6), max_distance(18), 'mo','MarkerFaceColor','m','MarkerSize',10);
title('Effect of cord length');
xlabel('cord length (m)'); ylabel('max distance (m)');
legend(title_vector{13:18}, 'location', 'best');
plot(cordLength_vector, max_distance(13:18), 'k-');
box on; grid on;
axis tight;

% Task 2: 
for n = 1:18
    exp_res(n).number = n;
    exp_res(n).max_speed = max_speed(n); %??
    exp_res(n).max_acceleration = max_acceleration(n); %??
    exp_res(n).integrated_KE = integrated_KE(n); % ??
    exp_res(n).travel_distance = travel_distance(n); % ??
end

% Task 3: 
fidw = fopen('report.txt', 'w');
header_string = 'exp number, max speed (m/s), max acc (m/s^2), int KE (J s), travel dist (m)';
fprintf(fidw,'Yanxiong Chen\nA16385208\n%s\n', header_string);

for n = 1:length(exp_res)
    fprintf(fidw, '%10d, %15.7e, %15.7e, %15.7e, %15.7e\n', exp_res(n).number, exp_res(n).max_speed, ...
        exp_res(n).max_acceleration, exp_res(n).integrated_KE, exp_res(n).travel_distance);
end
fclose(fidw);


p1a ='See figure 1';
p1b ='See figure 2';
p1c ='See figure 3';
p1d ='See figure 4';
p2a = exp_res(1);
p2b = [exp_res.max_speed]; 
p2c = [exp_res.max_acceleration]; 
p2d = [exp_res.integrated_KE]; 
p2e = [exp_res.travel_distance]; 
p3 = evalc('type report.txt');
