%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lsq_func
% Integrates the dynamic model and returns the model predictions. To be
% used for lsqcurvefit.
%
% Benjamín J. Sánchez
% Last Update: 2014-11-19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ymod = lsq_func(k,texp)

% Load experimental data:
ydata = evalin('base','ydata');

% Resolution of ODEs:
[~,xmod] = solve_ODE(k,texp);

% Return de normalized measured variables:
[ymod,~] = obj_var(xmod,ydata);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%