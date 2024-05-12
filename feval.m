function [ Z ] = Feval(f,x0)
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
    n = length(x0);
    X = sym('X',[n,1]);
    Z = subs(f,X,x0);
end
