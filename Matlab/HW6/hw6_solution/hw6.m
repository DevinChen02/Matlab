clear all; close all; clc; format long; 
name = 'AAAA AAAA';
id = 'a00000000';
hw_num = 6;

%% Problem 1: (a-f) 5 pts each, total 30
sp1a = 0;
for n = 1:40
    sp1a = sp1a + 2^n/factorial(n);
end

sp1b = 0;
for m = 0:40
    for n = 0:40
        sp1b = sp1b + 1/3^(m+n);
    end
end

sp1c = 0;
for m = 0:40
    for n = 0:m
        sp1c = sp1c + 1/3^(m+n);
    end
end

sp1d = 0; 
for l = 1:40
    for m = 1:40
        for n = 1:40
            sp1d = sp1d + 1/2^l/2^m/2^n;
        end
    end
end

sp1e = 0; 
for l = 1:5
    for m = l:5
        for n = l:m
            sp1e = sp1e + 1;
        end
    end
end

sp1f = 1;
for n = 1:1000
    sp1f = sp1f*4*n^2/(4*n^2-1);
end


%% Problem 2: (a,b) 7 pts each, total 14
sp2a = 0;
while exp(1)/factorial(sp2a+1) > 1e-7
    sp2a = sp2a + 1;
end

sp2b = 0;
while 2^(sp2b+1)*(sp2b+1) < 1e7
    sp2b = sp2b + 1;
end

%% Problem 3: (a,b) 8 pts each, total 16 points
h = 10;  % height
d = 0;   % distance
n = 0;   % bounce
while d < 59.99 
   if n == 0 
      d = h;
      n = n+1;
   end 
   h = 3/4*h;
   d = d + 2*h;
   n = n+1;
end 
sp3a = n-1;
sp3b = h;

%% Problem 4: (a-f) 3 pts each, total 18 pts
load('stringA.mat');
sp4a = 0; sp4b = 0; sp4c = 0;
for i = 1:length(stringA)-2 
    switch stringA(i:i+2) 
        case 'how'
            sp4a = sp4a + 1;
        case 'are'
            sp4b = sp4b + 1;
        case 'for'
            sp4c = sp4c + 1;   
    end 
end 

sp4d = 0; sp4e = 0; sp4f = 0;
for i = 1:length(stringA)-3 
    switch stringA(i:i+3) 
        case 'many'
          sp4d = sp4d + 1;
        case 'time'
          sp4e = sp4e + 1;
        case 'loop'
          sp4f = sp4f + 1;
    end 
end

%% Problem 5: (a-d) 5 points each, (e) 2 pts, total 22 pts
n = 0;
api = 4*(-1)^n/(2*n+1); 
while abs(api-pi) > 1e-5
    n = n+1;
    api = api + 4*(-1)^n/(2*n+1);    
end
sp5a = api;
sp5b = n;

n = 0;
api = sqrt(12)*(-3)^(-n)/(2*n+1); 
while abs(api-pi) > 1e-5
    n = n+1;
    api = api + sqrt(12)*(-3)^(-n)/(2*n+1); 
end
sp5c = api;
sp5d = n;
sp5e = 'The series in part (c) converges faster';
