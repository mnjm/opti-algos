function [ Z ] = Dif(f,x)
%----------------------------------------------------------------------------------------------
% 
% Function   : powell. 
% 
% Purpose    : Gives partial derivative of a function at a funciton at x.
% 
% Parameters : f-> given function, x-> Point at which derivative is evaluated. 
% 
% Return     : A vector f'(x).
% 
% Examples of Usage : 
%    >> [Y] = Dif(f,x); 
%
%----------------------------------------------------------------------------------------------
    n = length(x);
    X = sym('X',[n,1]);
    Y = sym(zeros(n,1));
    for j = 1:n
        F = diff(f,X(j,1));
        Y(j,1) = F;
    end
    Z = double(subs(Y,X,x));

end
