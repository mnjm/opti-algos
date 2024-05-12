function [L,U] = fibo(f,x0)
%----------------------------------------------------------------------------------------------
% 
% Function   : fibo. 
% 
% Purpose    : Implements fibonacci bracketting algorithm to bracket the minima.
% 
% Parameters : f-> Unimodal function, L-> lower limit, U-> upper limit. 
% 
% Return     : lower and upper limit of range containing the minima.
% 
% Examples of Usage : 
%    >> [L,U] = fibo(@(x)f(x),x0); 
%
%----------------------------------------------------------------------------------------------
    GR = 0.618033;% Golden ratio is used instead of 1.618033, It tends to give good results
    delta = 0.1;
    xl = x0 - delta; % xl a point to the left of x0
    xu = x0 + delta; % xr a point th the right of x0
    % Start the iterations, change the number of iteration if needed.      
    if (f(xl) > f(x0)) && (f(x0) > f(xu)) % move towards right
        for i = 1:20
            xl = x0;
            x0 = xu;
            xu = xu + sum(delta.*(GR*ones(1,i+1)).^(0:i));  
            if f(xu) >= f(x0)
                disp('The function has been bracketed');
                break;
            end
        end               
    elseif (f(xl) < f(x0)) && (f(x0) < f(xu)) % move towards left
        for i = 1:20
            xu = x0;
            x0 = xl;
            xl = xl - sum(delta.*(GR*ones(1,i+1)).^(0:i));

            if f(xl) >= f(x0)
                disp('The function has been bracketed');
                break;
            end
        end
    elseif (f(xl) > f(x0)) && (f(x0) < f(xu))
        disp('The function has been bracketed');                
    else
        disp('Function is not unimodal');
    end
    L = xl;
    U = xu;
end
