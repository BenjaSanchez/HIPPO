%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load_problem
% Define all the needed data and options to solve the problem.
%
% OUTPUTS:
% kL            Row vector with the parameter lower bounds for SSm.
% k0            Row vector with the parameter initial values for SSm.
% kU            Row vector with the parameter upper bounds for SSm.
% opts_SSm      Options for the SSm procedure
% texp          Experimental times for the integration.
% ydata         Experimental data. Be consistent with obj_var.
% x0            Initial state variable vaues for the integration.
% solver_ODE    Solver for the dynamic model integration
% opts_ODE      Options for the dynamic model integration (odeset)
% T             Threshold for correlation values.
%
% Benjamín J. Sánchez
% Last Update: 2014-11-19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [kL,k0,kU,opts_SSm,texp,ydata,x0,solver_ODE,opts_ODE,T,U] = load_problem

% Lower, initial and upper values for each parameter in SSm:
%     1   2    3    4   5    6    7  8    9   10  11   12  13   14 
kL = [0.1 0.01 1e-4 0.1 0.03 0    5  1e-5 0.1 0.1 1e-4 1e3 1e-2 0.05];
k0 = [0.3 0.05 5e-3	0.2 0.1  0    16 3e-3 3.3 17  6e-4 2e3 0.17	0.05];
kU = [0.6 0.05 1e-3 1   0.3  1e-3 50 5e-2 10  20  5e-3 1e6 10   0.5];

%SSm options:
opts_SSm.maxeval      = 100;
opts_SSm.local.n1     = 100;
opts_SSm.maxtime      = 1e3;
opts_SSm.strategy     = 3;
opts_SSm.local.solver = 'n2fb';
opts_SSm.local.finish = 'n2fb';
opts_SSm.combination  = 1;  

% Experimental Data:
% [Time X eX S1 eS1 S2 eS2 IPX eIPX]
data  = load('ssf_25_999.txt');
[~,n] = size(data); 
texp  = data(:,1)';
ydata = data(:,2:n);

% Initial conditions for integration:
u0 = 3.146/1000;
s0 = 1.768685/10;
%     Xo       Uo No  Xvo      CO2o    O2o     GA30 So     
x0 = [0.006878 u0 0   0.006878 0.00885 0.00467 0    s0]';

% ODE options:
solver_ODE = 'ode23';
opts_ODE   = odeset('RelTol',1e-4,'AbsTol',1e-7);

% Threshold for correlations (any couple of parameters with a correlation
% higher than this value will be fixed):
T = 0.95;

% Threshold for iterations (criterion III):
U = 1.5;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%