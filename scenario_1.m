% Data from Leung, M. Haimes, Y.Y. and Santos, J.R. 2007. Supply- and Output-Side Extensions to the Inoperability Input-Output Model for Interdependent Infrastructures. Journal of Infrastructure Systems 13, 299-310.
% Consider a hypothetical four-sector economy comprised of (1) transportation; (2) power; (3) health; and (4) gas. Table 1. shows the transactions in terms of dollar-value flows, where looking across Row 1 shows all the required inputs of transportation services (such as shipping), used in power, health systems, and gas supply infrastructures.

% Table 1. Sector-Sector Transaction Example Data (Leung et al. 2007:301).

% j = 1 	j = 2 	j = 3 	j = 4 	Demand, C 	Total Output, x
% i = 1, Transport 500 800	800	400	1000	3500
% i = 2, Power 400	900	1000	800	1500	4600
% i = 3, Health 700	400	800	400	800	3100
% i = 4, Gas 500	800	300	800	500	2900
% Value added, zT 1400	1700	200	500	
% Total input, xT 3500	4600	3100	2900	

% Scenario 1: A bomb was found during a security check in a major airport. The event was followed by many cancellations in air travel bookings, and a notable decrease in air travel overall, estimated at 20% of the total final output of the transport sector. In this example, the problem is to determine the impact of the decrease in air transport, translated as a decrease in the total final demand of the transportation industry.

% The Demand-Reduction IIM
% ------------------------------------------
% q = A_star*q+c_star ⇔ q = inv(I−A_star)*c_star

% q  = [inv(diag(x_hat))*(x_hat−x_tilde)] = vector of normalised production loss due to demand reduction; 
% A_star = [inv(diag(x_hat))*A*(diag(x_hat))] = interdependency matrix;
% c_star = [inv(diag(c_hat))*(c_hat−c_tilde)] = vector of normalised degraded demand resulting from a terrorist    % attack

% x_hat = value of the nominal or “as planned” production level;
% x_tilde = value of the degraded production level after perturbation;

% c_hat = value of nominal final demand;
% c_tilde = value of degraded final demand after perturbation.

% T = Transactions Matrix
%------------------------------------------
T = [500 800 800 400;
     400 900 1000 800;
     700 400 800 400;
     500 800 300 800];
 
% I = Identity Matrix
%------------------------------------------
I = eye(length(T));
 
% x = Total Input
%------------------------------------------
x = [3500; 4600; 3100; 2900];
 
x_hat = x;
 
% y = Final Demand
%------------------------------------------
y = [1000; 1500; 800; 500];
 
c_hat = y;
 
% -20% from demand in sector (1)
c_tilde = [(c_hat(1)-(20/100)*c_hat(1)); c_hat(2:4)];
 
% A = Technical Coefficient Matrix
%------------------------------------------
A=T*(inv((diag(x))));
 
% A_star = Interdependency Matrix
%------------------------------------------
A_star = [inv(diag(x_hat))*A*(diag(x_hat))]

ans = [0.1429    0.2286    0.2286    0.1143;
       0.0870    0.1957    0.2174    0.1739;
       0.2258    0.1290    0.2581    0.1290;
       0.1724    0.2759    0.1034    0.2759]

% c_star = Normalised Degraded Demand
% ------------------------------------------
c_star = [inv(diag(c_hat))*(c_hat-c_tilde)]

ans = [0.2; 0; 0; 0]

% q = Normalised Production Loss
% ------------------------------------------
q = inv(I-A_star)*c_star

ans = [0.31; 0.099; 0.14; 0.13]

% Therefore, the inoperability levels of the four sectors are as follows: 
% Transportation (1), 31%; Power (2), 9.9%: Health (3), 14%; and Gas Supply (4), 13%.

% x_tilde = Degraded Output
% ------------------------------------------
% Using the equation: p = (x_hat-x_tilde)/h_hat, these inoperability levels can be translated back to new degraded % outputs (in US dollar values) of the four sectors:

x_tilde = x_hat-(q.*x_hat)

ans = [2403; 4144; 2679; 2518]

% Compared to the expected output, x = [3500; 4600; 3100; 2900];
