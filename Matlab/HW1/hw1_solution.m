clear all; close all; clc; format long;
name = 'AAAA AAAA';
id = 'A00000000';
hw_num = 1;

%% Problem 1(a-m):  1 pt each, total 13 pts
sp1a = pi/0;
sp1b = 0/0;
sp1c = sqrt(-4*pi);
sp1d = cosd(75);
sp1e = sin(pi/3);
sp1f = 1234^5;
sp1g = nthroot(512,9);
sp1h = log2(16384);
sp1i = log10(1e6);
sp1j = log(exp(1));
sp1k = atand(1);
sp1l = sinh(6);
sp1m = atanh(1);

%% Problem 2(a-j): 1 pts each, total 10 pts
sp2a = char(32*pi);
sp2b = char(16);
sp2c = double(sp2b);
sp2d = int16('Z');
sp2e = int32('Z');
sp2f = single('Y');
sp2g = double('X');
sp2h = class(sp2a);
sp2i = 'Y'*'Z';
sp2j = double('Y')==int64('Y');

%% Problem 3(a-l): 1 pts each, total 12 pts
sp3a = 'y' == 'Y';
sp3b = 'y' > 'X';
sp3c = 'z' < 'x';
sp3d = log2(1024) == 10; 
sp3e = sin(100*pi) ~= 0;
sp3f = 3\9 + 1 < 3;
sp3g = 3/9 + 2 < 3;

a = 3; b = 4; c = 5; 
sp3h = a > b && a > c;
sp3i = a < b && a > c;
sp3j = a > b || a > c;
sp3k = a > b || a < c;
sp3l = xor(a<b, a<c);

%% Problem 4: (a-g) 1 pts each, total 7 pts
sp4a = fix(2.5) == floor(2.5);
sp4b = fix(2.4) == fix(-2.4);
sp4c = fix(2.2) == floor(2.2);
sp4d = fix(-2.2) == floor(-2.2);
sp4e = fix(-2.2) == ceil(-2.2);
sp4f = rem(5,3) == mod(5,3);
sp4g = rem(5,-3) == mod(5,-3);

%% Problem 5: (a-d) 1 pt each, total 4 pts
sp5a = '+';
sp5b = 'rational';
sp5c = 'bank';
sp5d = 'shortg';

%% Problem 6: (a-c) 2 pts each, total 6 pts
sp6a = 'upper';
sp6b = abs('a'-'A');
sp6c = abs('a':'z'-'A':'Z')==abs('a'-'A');

%% Problem 7: (a-d) 2 pts each, total 8 pts
pounds = 1000;
kilos = pounds/2.2;
sp7a = kilos;

fn = 5.6;
dynes = fn*10^5;
sp7b = dynes;

ftemp = 212;
ctemp = (ftemp-32)*5/9;
sp7c = ctemp;

mph = 65;
kmph = mph*1.6093;
sp7d = kmph;

%% Problem #8(a-m): 2 pts each, total 26 pts 
sp8a = linspace(2,998,(998-2)/2+1);
sp8b = 1:2:999;
sp8c = [sp8b sp8a];
sp8d = length(sp8c);
sp8e = find(sp8c == 500);
sp8f = [0 sp8c];
sp8g = sp8f(end/4+1:end/2);
sp8h = sp8f(3*end/4+1:end);
sp8i = (-1:-2:-1999)';
sp8j = sp8i.^2;
sp8k = sum(sp8i);
sp8l = prod(sp8i(end-4:end));
sp8m = cumsum(sp8i);

%% Problem #9: (a) 6 pts, (b-e) 2 pts each, total 14 pts
b1234 = [1 2; 3 4]; 
corner = [b1234 zeros(2); zeros(2) b1234];
fives = 5*ones(4,2);
sp9a = [corner          fives   fliplr(corner); ...
        fives'          b1234   fives'; ...
        fliplr(corner)  fives   corner];
sp9b = sum(sp9a(:,5));
sp9c = sum(sp9a(1:11:end))+sum(sp9a(10:9:end-9));
sp9d = sum(sum(sp9a));
sp9e = sum(sp9a(:)>2);