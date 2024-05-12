function [ Y ] = BFGS(f,x0 )
%%----------------------------------------------------------------------------------------------
% 
% Function   : ModNewton. 
% 
% Purpose    : BFGS algorithm to find the minima.
% 
% Parameters : f-> function of interest, x0-> Innitial guess. 
% 
% Return     : The minima of the function.
% 
% Examples of Usage : 
%    >> [Y] = BFGS(f,x0); 
%
%----------------------------------------------------------------------------------------------
    %Initialising first iteration value
    x(:,1) = x0;
    d(:,1) = -Dif(f,x(:,1));
    syms alp real;
    h = eye(length(x0));

    %Start the iteration
    for i = 1:50
        J = vpa(Feval(f,x(:,i)+alp*d(:,i)));
        Alpha = solve(diff(J,alp)==0,alp);
        x(:,i+1) = x(:,i) + Alpha*d(:,i);
        SK = x(:,i+1) - x(:,i);
        YK = Dif(f,x(:,i+1))-Dif(f,x(:,i));
        HK = hessian(f,sym('X',[1,length(x0)]));% symbolic expression
        HK = subs(HK,sym('X',[1,length(x0)]),x(:,i)');% Getting the numerical value
        CK = -HK*d(:,i);
        DK = (YK*YK')/(YK'*SK);
        if ~isnan(DK)
            EK = double((CK*CK')/(CK'*d(:,i)));
            h  = HK + DK + EK;  
            d(:,i+1) = -h*Dif(f,x(:,i+1));
        else
            break;
        end
    end  
    Y = x(:,i+1);
end
