clear all; close all; clc; format long; 
name = 'AAAAA AAAAA';
id = 'A00000000';
hw_num = 2;

%% Problem #1: 3 pts each, 15 pts
sp1a = 5*ones(5);
sp1b = sp1a; sp1b(:,2)=0; 
sp1c = sp1b';
sp1d = rot90(rot90(rot90(sp1b)));
sp1e = sp1c==sp1d;

%% Problem 2 (a) 5 pts (b-g) 3 pts each, total 23 pts
corner = diag(1:6);
sp2a = repmat(corner + fliplr(corner),2,2);
sp2b = sp2a(1:4,1:4);
sp2c = sp2a(1:4,end-3:end);
sp2d = sp2a(end-3:end,end-3:end);
sp2e = sp2a(4:9,4:9);
sp2f = sp2a([1:2:7,8,end],:);
sp2g = sp2a([1,end],[1,end]);

%% Problem 3(a-d): 3 pts each, total 12 pts
x = 1:10; y = 10:10:100;
sp3a = x.*y;
sp3b = x.^log10(y);
sp3c = sin(y.^x)./exp(y./x);
sp3d = (x + exp(-y.^x))./(y + log(x.^y));


%% Problem 4: 12 pts          
tmp1 = repmat([-1 1],1,50);
tmp2 = 1:2:199;
sp4 = sum(tmp1./tmp2);

%% Problem 5(a-j): 2 pts each, total 20 pts
A = [1 2 3; 4 5 6; 7 8 9];
B = [7 8; 9 10];
C = [1 3 11; 2 7 4];
D = [9 4; 8 5; 3 2];

sp5a = A^2;
sp5b = 'error';
sp5c = 'error';
sp5d = A*D;
sp5e = 'error';
sp5f = D*B;
sp5g = B*C;
sp5h = 'error';
sp5i = 'error';
sp5j = isequal(C*D,D*C);

%% Problem 6: (a-f) 3 pts each, total 18 pts 
A=[9 8 7; 6 9 7; 1 7 4]; 
sp6a = A;
b = (1:2:5)'; 
sp6b = b;
sp6c = A\b;
sp6d = inv(A)*b;
sp6e = sp6c==sp6d;
sp6f = abs(sp6c-sp6d);