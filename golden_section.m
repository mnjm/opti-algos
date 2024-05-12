function [M] = golden_section(f,xl,xu)
%----------------------------------------------------------------------------------------------
% 
% Function   : golden_section. 
% 
% Purpose    : Implements golden section algorithm.
% 
% Parameters : f-> Unimodal function, xl-> lower limit, xu-> upper limit. 
% 
% Return     :  Minima of the function.
% 
% Examples of Usage : 
% 
%    >> [M] = golden_section(@(x)f(x),xl,xu); 
%
%----------------------------------------------------------------------------------------------
    GR = 1.618033;% Golden ratio

    % Start the iterations, change the number of iteration if needed.
    for i = 1:20 
        x = xl + GR*(xu-xl);
        p = xu - GR*(xu-xl);
        if f(p) > f(x)
            xl = x;
        else
            xu = p;
        end
    end
    M = (xu+xl)/2; 
end
