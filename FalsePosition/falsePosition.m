function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
% the imputs are function, left bound estimate, right bound estamite,
% minimum error to finish (leave blank for acuracy of .0001%), maximum
% number of loops scrypt will run before self termination.( leave blank for
% 200 iterations)
%outputs are root(x intercept estimate), fx(y value of fx at x, ea
%(aproximate error), and iterations (number of loops compleated.)
if nargin < 3 % if number of imputs <3 error
    error('not enough imput arguments must include func, xl, xu')
elseif nargin <4 %if imputs less than 4 set Es to.0001% and maxint to 200
    es=.0001
    maxit=200
elseif nargin <5 %if imputs less than 5 set maxint to 200
    maxit=200
end 
iter=-1; %set iteration value to 0
a=0; % set end condition for while loop to 0
xrold=0;
%test if func crosses intersect only 1 time
if ((func(xl)*func(xu))>0 ) % if value of function at x1 and value of function at x2 are positive it means there was no sign change and error
    error('function crosses x axis 0 times or more than once')
end
while (a == 0)
    iter=iter+1;% increase the iteration counter by 1
xr= xu - ((func(xu).*(xl-xu))./(func(xl)-func(xu))); % find xr
if(xr-xrold ==0) % if xr -xrold=0 it means you have found a point where you ither go past matlab precision values or you have the exact root
    a=a+1; %set end condition
    ea=0; % there is no mesurable error
else ea=abs(((xr-xrold)/xr)*100); % find the aproximat error
end
xrold=xr; % set condition for next loop in determaning ea
xl=xr; %left point is now xr
if (ea<= es || iter >= maxit); % end conditions
    a=a+1;
end 
end
% output values
iter;
fx=func(xr);
root=xr;
ea;
end