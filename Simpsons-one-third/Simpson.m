function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
%determin is indipendent and dependent matrixes are the same size
if size(x) ~= size(y)
    error('imput matrix must be row matrix of equal size'), end
if length(x) ~= length(y)
    error('imput matrix must be row matrix of equal size'), end
if length(x) <= 1
    error('imput matrix must be row matrix of equal size greater than Lenth 1'), end
nColumns=length(x);
StepSize=x(nColumns)-x((nColumns-1));
Yeven=0;
for loop=[nColumns:-1:2]
    tmpStep=x(loop)-x((loop-1));
    if StepSize ~= tmpStep
        error('IndipendentVriable step size is not equal spaced'), end,end%checks if indipendent step size is same
if nColumns==2
    I=(StepSize/2)*(y(nColumns)+y(nColumns-1));
    warning('not enough imput arguments for simpsons rule trap rule used')
elseif rem(nColumns,2) == 0
    %1/3 section
    loop=[1:(nColumns-1)];
    Y2(loop)=y(loop);
    f0=Y2(1);
    fn=Y2(length(Y2));
    Y3=Y2(2:(length(Y2)-1));
    Z=1;
    for loop=[1:2:(length(Y3))]% Yodd values to sum and multiply by 4
            Yodd(Z)=Y3(loop);
            Z=Z+1;,end,Z=1;
    for loop=[2:2:(length(Y3))]% Yeven values to sum and multiply by 2
            Yeven(Z)=Y3(loop);
            Z=Z+1;,end,Z=1;
    simpThird=(StepSize/3)*(f0+fn+(4*(sum(Yodd)))+(2*(sum(Yeven))));  
    %trapazoidal Section
    Trapazoid=(StepSize/2)*(y(nColumns)+y(nColumns-1));
    I=simpThird+Trapazoid;
    warning('even number of imput values(should be a multiple of 3 for best result)trap rule uesed')
else %1/3 section
    loop=[1:(nColumns)];
    Y2(loop)=y(loop);
    f0=Y2(1);
    fn=Y2(length(Y2));
    Y3=Y2(2:(length(Y2)-1));
    Z=1;
    for loop=[1:2:(length(Y3))]% Yodd values to sum and multiply by 4
            Yodd(Z)=Y3(loop);
            Z=Z+1;,end,Z=1;
    for loop=[2:2:(length(Y3))]% Yeven values to sum and multiply by 2
            Yeven(Z)=Y3(loop);
            Z=Z+1;,end,Z=1;
    I=(StepSize/3)*(f0+fn+(4*(sum(Yodd)))+(2*(sum(Yeven))));  
end
disp('done')

end