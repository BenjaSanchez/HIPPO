%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% model
% Dynamic model representing a microalgal fedbatch fermentation. Works with
% any combination of fixed parameters.
%
% INPUTS:
% t     Time.
% x     Process variables (at time t).
% k     Estimated parameter vector.
%
% OUTPUT:
% dx    Derivatives of the process variables (at time t).
%
% NOTE: For the parameter vector, use vector p, not vector k (p includes
% all fixed and estimated parameters, whereas k includes only estimated 
% parameters).
%
% Benjamín J. Sánchez
% Last Update: 2014-11-19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function dx = model(t,x,k)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DO NOT MODIFY THIS SECTION
dx = zeros(length(x),1);

kfixed = evalin('base','kfixed');
p = zeros(length(kfixed));

j = 1;
for i = 1:length(kfixed)
    if isnan(kfixed(i))
        p(i) = k(j);
        j    = j+1;
    else
        p(i) = kfixed(i);
    end    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Model parameters  
mun   = p(1);       
kd    = p(2);       
ku    = p(3);      
mco2  = p(4);      
mo2   = p(5);       
kp    = p(6);      
yxn   = p(7);       
kn    = p(8);       
yxco2 = p(9);       
yxo2 =  p(10);
betam = p(11);
ki =    p(12);
yxs=    p(13);
ms=     p(14);

% Algebraic equations
mu   = mun*x(3)/(kn+x(3));
beta = betam/(1+ki*x(3));

% Differential equations
% Active biomass (NOT MEASURED):
dx(1) = mu*x(1)-kd*x(1);

if x(2)>0
    % Urea:
    dx(2) = -ku;
    % Intermediary (NOT MEASURED): 
    dx(3) = 0.47*ku-mu*x(1)/yxn;
else
    dx(2) = 0;
    dx(3) = 0-mu*x(1)/yxn;
end

% Measured biomass:
dx(4) = mu*x(1);
% CO2:
dx(5) = mu*x(1)/yxco2+mco2*x(1);
% O2:
dx(6) = mu*x(1)/yxo2+mo2*x(1);
% GA3:
dx(7) = beta*x(1)-kp*x(7);
% Starch:
dx(8) = -mu*x(1)/yxs-ms*x(1);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%