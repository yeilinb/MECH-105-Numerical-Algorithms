function[root,fx,ea,iter]=falsePosition(func,x_l,x_u,es,maxiter)
% False Position Algorithm
% Yeilin Benitez
% MECH 105
% This algorithm uses the false position method to find roots of
% complicated functions.
% INPUTS:
% func - the function being evaluated
% x_l - the lower guess the user inputs
% x_u - the upper guess the user inputs
% es - the desired relative error (the default is 0.0001%)
% maxiter - the number of iterations desired (the default is 200)
% OUTPUTS:
% root- the estimate of the root location
% fx - the function evaluated at the root location
% ea - the approximate relative error
% iter - the amount of iterations performed

if nargin<3
    error('3 inputs needed')
elseif nargin>5 
    error('Too many inputs')
elseif nargin==4
    maxiter=200;
elseif nargin==5
    maxiter=maxiter;
    es=es;
else
    maxiter=200;
    es=0.0001;
end

fl=func(x_l);
fu=func(x_u);
testforsign=fl*fu;
if testforsign>0
    error('There is no root in this interval')
elseif testforsign<0
    ea=1;
    iter=0;
    while ea>es
        x_r= x_u-((fu*(x_l-x_u))/(fl-fu));
        testofsign2=fl*func(x_r);
        if testofsign2<0
            ea=abs((x_r-x_u)/x_r)*100;
            x_u=x_r;
        elseif testofsign2>0
            ea=abs((x_r-x_l)/x_r)*100;
            x_l=x_r;
        end
        iter=iter+1;
    end
end
ea=ea;
root=x_r;
fx=func(x_r);







