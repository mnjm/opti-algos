function [ x_min] = Newton_raphson(f,g,x0)
%----------------------------------------------------------------------------------------------
% 
% Function   : Newton_raphson. 
% 
% Purpose    : Implements Newton Raphson algorithm to find the minima.
% 
% Parameters : f-> First derivative, x_min-> minima, x0-> Initial starting point, 
%              g-> Second derivative.
% 
% Return     : lower and upper limit of range containing the minima.
% 
% Examples of Usage : 
% 
%    >> [L,U] = fibo(@(x)f(x),@(x)g(x),x0); 
%
%----------------------------------------------------------------------------------------------
    %Start the iteration
    for i = 1:10
        x_n = x0 - f(x0)./g(x0);% x_n-> New point close to minima at each iteration
        x0  = x_n;
    end
    x_min = x_n;
end
