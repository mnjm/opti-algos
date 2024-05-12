function [ Y ] = DFP(f,x0 )
%----------------------------------------------------------------------------------------------
% 
% Function   : DFP. 
% 
% Purpose    : Implements DFP method algorithm to find the minima.
% 
% Parameters : f-> function of interest, x0-> Innitial guess. 
% 
% Return     : The minima of the function.
% 
% Examples of Usage : 
%    >> [Y] = DFP(f,x0); 
%
%----------------------------------------------------------------------------------------------
    %Initialising first iteration value
    x(:,1) = x0;
    d(:,1) = -Dif(f,x(:,1));
    syms alp real;
    A0 = eye(length(x0));

    %Start the iteration
    for i = 1:50
        J = vpa(Feval(f,x(:,i)+alp*d(:,i)));
        diff(J,alp);
        Alpha = max(solve(diff(J,alp)==0,alp));
        x(:,i+1) = x(:,i) + Alpha*d(:,i);
        S0 = x(:,i+1) - x(:,i);
        Y0 = Dif(f,x(:,i+1))-Dif(f,x(:,i));
        Z0 = A0*Y0;
        B0 = (S0*S0')/(S0'*Y0);
        if ~isnan(B0);
            C0 = (-Z0*Z0')/(Y0'*Z0);
            A0  = A0 + B0 + C0 ;
            d(:,i+1) = -A0*Dif(f,x(:,i+1));
        else
            break;
        end
    end
    Y = x(:,i+1);
end
