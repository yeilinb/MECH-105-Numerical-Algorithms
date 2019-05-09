% Quadratic Solver
% Created On: 5 November 2018
% By: Yeilin Benitez
% Description: User inputs the coefficients to the equation ax^2+bx+c=0 and
% the program calculates the real roots of the equation.

clear
clc
a=input('a=');
b=input('b=');
c=input('c=');
D=b^2-4*a*c
if D<0;
    fprintf('No Real Roots')
elseif D==0
    x=-b/(2*a);
    fprintf('One Real Root''\n%.3f\n',x)
else D>0
    x_1=(-b+sqrt(D))/(2*a);
    x_2=(-b-sqrt(D))/(2*a);
    fprintf('Two Real Roots''\n%.3f,%.3f\n',x_1,x_2)
end
    
    