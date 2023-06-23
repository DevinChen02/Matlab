function f = piecewise2d(x,y)
% PIECEWISE2D computes 2-dimensional piecewise function f(x,y) based 
% on input x and y.
% f(x,y) = 10x+10y for x <= 0 and y > 0
% f(x,y) = -10x+10y for x < 0 and y >= 0
% f(x,y) = -10x-10y for x <= 0 and y < 0
% f(x,y) = 10x-10y for x > 0 and y <=0
% f(x,y) = 0 for other values of x and y
% Call format: f = piecewise2d(x,y)

if x >= 0 && y > 0 
   f = 10*x + 10*y;
elseif x < 0 && y >= 0
   f = -10*x + 10*y;
elseif x <= 0 && y < 0
   f = -10*x - 10*y;
elseif x > 0 && y <= 0
   f = 10*x - 10*y;
else
   f = 0;
end 

end %function piecewise2d
