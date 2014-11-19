%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plotResults
% Plot the achieved parameter calibration (optional).
%
% INPUTS:
% k         Estimated parameters from the last iteration.
% texp      Vector with the experimental times (as loaded by the user).
% ydata     Matrix with the experimental data (as loaded by the user).
%
% Benjamín J. Sánchez
% Last Update: 2014-07-10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plotResults(k,texp,ydata)

t0          = texp(1);
tf          = texp(length(texp));
[tmod,xmod] = solve_ODE(k,[t0 tf]);
ymod        = xmod(:,[2,4:8]);
yexp        = ydata;

figure
subplot(3,2,1); % Urea
hold on
plot(tmod,ymod(:,1),'-m','LineWidth',2);
plot(texp,yexp(:,1),'ob','MarkerSize',3);
axis([0 130 0 0.005]); 
xlabel('Time (h)'); ylabel('Urea (g/g.s.i.)');
hold off

subplot(3,2,2); % Biomass
hold on
plot(tmod,ymod(:,2),'-m','LineWidth',2)
plot(texp,yexp(:,2),'ob','MarkerSize',3);
axis([0 130 0 0.06]);
xlabel('Time (h)'); ylabel('Biomass (g/g.s.i.)');
hold off

subplot(3,2,3); % CO2
hold on
plot(tmod,ymod(:,3),'-m','LineWidth',2);
plot(texp,yexp(:,3),'ob','MarkerSize',3);
axis([0 130 0 0.4]);
xlabel('Time (h)'); ylabel('CO2 (g/g.s.i.)');
hold off

subplot(3,2,4); % O2
hold on
plot(tmod,ymod(:,4),'-m','LineWidth',2);
plot(texp,yexp(:,4),'ob','MarkerSize',3);
axis([0 130 0 0.1]);
xlabel('Time (h)'); ylabel('O2 (g/g.s.i.)');
hold off

subplot(3,2,5); % GA3
hold on
plot(tmod,ymod(:,5),'-m','LineWidth',2);
plot(texp,yexp(:,5),'ob','MarkerSize',3);
axis([0 130 0 0.001]);
xlabel('Time (h)'); ylabel('GA3 (g/g.s.i.)');
hold off

subplot(3,2,6); % Starch
hold on
plot(tmod,ymod(:,6),'-m','LineWidth',2);
plot(texp,yexp(:,6),'ob','MarkerSize',3);
axis([0 130 0 0.3]);
xlabel('Time (h)'); ylabel('Starch (g/g.s.i.)');
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%