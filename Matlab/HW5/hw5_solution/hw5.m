clear all; close all; clc; format long; 
name = 'AAAA AAAA';
id = 'a00000000';
hw_num = 5;


%% Problem 1: (a-g) 3 pts each, total 21 points
sp1a = evalc('help assign_grade');
load('studentA.mat'); 
[sp1b, sp1c] = assign_grade(homework, midterm, project, final);
load('studentB.mat'); 
[sp1d, sp1e] = assign_grade(homework, midterm, project, final);
load('studentC.mat'); 
[sp1f, sp1g] = assign_grade(homework, midterm, project, final);


%% Problem 2: (a-i) 3 pts each, total 27 pts
sp2a = evalc('help days_in_month');
sp2b = days_in_month('jan',0);
sp2c = days_in_month('feb',0);
sp2d = days_in_month('feb',1);
sp2e = days_in_month('apr',0);
sp2f = days_in_month('aug',1);
sp2g = days_in_month('oct',0);
sp2h = days_in_month('nov',1);
sp2i = days_in_month('Dec',0);


%% Problem 3: (a-c) 7 pts each, total 21 pts
sp3a = zeros(1,50);
sp3a(1) = 1;
sp3a(2) = 1;
for k = 3:length(sp3a)
    sp3a(k) = sp3a(k-2)+sp3a(k-1);
end
sp3b = 0;
for k = 1:length(sp3a)
    sp3b = sp3b + sp3a(k);
end
sp3c = zeros(1,length(sp3a));
for k = 2:length(sp3a)
    sp3c(k) = sp3a(k)/sp3a(k-1);
end

%% Problem 4: (a-c) 8 pts each, total 24 pts
sp4a = 0;
for n = 1:10
    sp4a = sqrt(2+sp4a);
end

sp4b = 0;
for n = 1:10
    sp4b = sqrt(1+2*sp4b);
end

sp4c = 0;
for n = 1:10
    sp4c = sqrt(2+(-1)^(n-1)*sp4c);
end

%% Problem 5: 7 pts
sp5 = evalc('type(''survey.dat'')');
