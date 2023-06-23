clear all; close all; clc; format long; 
name = 'AAAA AAAA';
id = 'a00000000';
hw_num = 4;

%% Problem 1: (a-d) 4 pts each, total 16 pts
A = log(1./(2:13)); A = reshape(A,4,3)';
sp1a = sprintf('%9.6f\n',A(:,end));
sp1b = sprintf('%7.4f %7.4f %7.4f %7.4f',A(end,:));
sp1c = sprintf('%10.7f %10.7f %10.7f %10.7f\n',A');
sp1d = sprintf('%10.7e %10.7e %10.7e %10.7e\n',A');

%% Problem 2: (a-d) 2 pts each, (e) 6 pts, (f,g) 2 pts, (h) 10 pts, (i) 2 pts, total 30
load('temperature.dat');
[r, c] = find(temperature(:,2:13) == max(max(temperature(:,2:13))));
sp2a = c;
sp2b = temperature(r,1);
start_year = find(temperature(:,1) == 1900);
end_year = find(temperature(:,1) == 2000);
sp2c = sum(sum(temperature(start_year:end_year,2:13)>75));
sp2d = sum(sum(temperature(start_year:end_year,7:9)>75));

% Create figure 1: 
figure(1);
bar(1:12,mean(temperature(:,2:13)));
xlabel('month');
set(gca,'XTick',1:12,'XTickLabel',...
 {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'}, ...
  'XTickLabelRotation',45)
ylabel('Mean temperature (^\circF)');
title('Annual cycle of temperature in San Diego');
set(gca,'FontSize',16);
box on; grid on;
sp2e = 'See figure 1';
sp2f = 'In general, the temperature peaks in August';

% Export data:
output_data = [(1:12)' mean(temperature(:,2:13))'];
save('annual_cycle.dat','output_data','-ascii');
sp2g = evalc('type("annual_cycle.dat")');

year = temperature(:,1)';
annualT = mean(temperature(:,2:13)');
warm_index = find(diff(annualT) == max(diff(annualT)));
cool_index = find(diff(annualT) == min(diff(annualT)));

% Create figure 2:
figure(2); hold on;
plot(year,annualT,'-k','LineWidth',2);
plot(year(annualT > 65),annualT(annualT > 65),'ro','MarkerFaceColor','r'); 
plot(year(annualT < 60),annualT(annualT < 60),'bd','MarkerFaceColor','b');
plot(year(warm_index:warm_index+1),annualT(warm_index:warm_index+1),'-r','LineWidth',4);
plot(year(cool_index:cool_index+1),annualT(cool_index:cool_index+1),'-b','LineWidth',4);
legend('T','T > 65','T < 60','strongest warming','strongest cooling','location','best');
xlabel('Year');
ylabel('Temperature (^\circF)');
title('Annual mean temperature in San Diego');
set(gca,'FontSize',16);
box on; grid on;
sp2h = 'See figure 2';
sp2i = 'In general, temperature in San Diego rises over the years';

%% Problem 3: 2 pts each, total 16 pts
sp3a = evalc('help lottery');
sp3b = lottery([2, 3, 4, 5, 6, 7]);
sp3c = lottery([12, 23, 24, 34, 50, 61]);
sp3d = lottery([22, 33, 44, 50, 51, 61]);
sp3e = lottery([32, 43, 54, 44, 51, 61]);
sp3f = lottery([42, 53, 34, 44, 51, 61]);
sp3g = lottery([42, 23, 34, 44, 51, 61]);
sp3h = lottery([12, 23, 34, 44, 51, 61]);

%% Problem 4: (a-j) 2 pts, 20 pts
sp4a = evalc('help piecewise2d');
sp4b = piecewise2d(1,1);
sp4c = piecewise2d(1,-1);
sp4d = piecewise2d(-1,1);
sp4e = piecewise2d(-1,-1);
sp4f = piecewise2d(0,0);
sp4g = piecewise2d(0,1);
sp4h = piecewise2d(0,-1);
sp4i = piecewise2d(1,0);
sp4j = piecewise2d(-1,0);

%% Problem 5: (a-i) 2 pts each, total 18 pts
sp5a = evalc('help rgb_color');
sp5b = rgb_color([1 1 1]);
sp5c = rgb_color([1 0 0]);
sp5d = rgb_color([0 1 0]);
sp5e = rgb_color([0 0 1]);
sp5f = rgb_color([1 1 0]);
sp5g = rgb_color([0 1 1]);
sp5h = rgb_color([1 0 1]);
sp5i = rgb_color([0 0 0]);