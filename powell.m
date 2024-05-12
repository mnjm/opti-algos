function [ Y ] = powell(f,x0)
%----------------------------------------------------------------------------------------------
% 
% Function   : powell. 
% 
% Purpose    : Implements Powell conjugate gradient method algorithm to find the minima.
% 
% Parameters : A-> Matrix in standard quadratic representation, x0-> Innitial guess. 
% 
% Return     : The minima of the function.
% 
% Examples of Usage : 
%    >> [Y] = powell(f,x0); 
%
%----------------------------------------------------------------------------------------------
    %Initialising first iteration value
    x(:,1) = x0;
    d(:,1) = -Dif(f,x(:,1));
    r(:,1) = d(:,1);
    syms alp real;

    %Start the iteration

    for i = 1:50

        J = vpa(Feval(f,x(:,i)+alp*d(:,i)),20);

        Alpha = solve(diff(J,alp)==0,alp);

        x(:,i+1) = x(:,i) + Alpha*d(:,i);     

        r(:,i+1) = -Dif(f,x(:,i+1));

        beta = max((r(:,i+1)'*(r(:,i+1)-r(:,i)))/(r(:,i)'*r(:,i)),0);

        d(:,i+1) = r(:,i+1) + beta*d(:,i);

    end

    Y = x(:,i+1);
end
