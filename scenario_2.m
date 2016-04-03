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

% Scenario 2: A tunnel leading to a major port is bombed using a truck with hazardous material, rendering the tunnel inaccessible for several months. This results in a delay in the flow of goods in and out of the port, with significantly longer waits in traffic and longer travel distances through alternate routes. During this period, the industry has to pay higher wages due to overtime and longer working hours to maintain a nominal level of operations. The increase in wages in the transportation industry is considered an increase in its value-added component, estimated at 20%.

% The Supply-side Price IIM
% ------------------------------------------
% q = A_star*q+c_star ⇔ q = inv(I−A_star)*c_star

% q  = [inv(diag(x_hat))*(x_hat−x_tilde)] = vector of normalised production loss due to demand reduction; 
% A_star = [inv(diag(x_hat))*A*(diag(x_hat))] = interdependency matrix;
% z_star = [inv(diag(x_hat))*(z_hat−z_tilde)] = vector of normalised degraded value added;

% x_hat = value of the nominal or “as planned” production level;
% x_tilde = value of the degraded production level after perturbation;

% z_hat = value of nominal value added;
% z_tilde = value of degraded value added after perturbation.

% T = Transactions Matrix
% ------------------------------------------
T = [500 800 800 400;
     400 900 1000 800;
     700 400 800 400;
     500 800 300 800];
 
% I = Identity Matrix
% ------------------------------------------
I = eye(length(T));
 
% x = Total Input
% ------------------------------------------
x = [3500; 4600; 3100; 2900];
 
% z = Value Added
% ------------------------------------------
z = [1400; 1700; 200; 500]
 
% -20% to value added in sector (1)
z_tilde = [(z(1)-(20/100)*z(1)); z(2:4)]
 
% A_s = Ghosh Matrix
% ------------------------------------------
A = T*(inv((diag(x))));
 
A_s = T'*(inv((diag(x))))
 
% A_star = Interdependency Matrix
% ------------------------------------------
A_star = [inv(diag(x))*A_s*(diag(x))];

ans = [0.1429    0.1143    0.2000    0.1429;
       0.1739    0.1957    0.0870    0.1739;
       0.2581    0.3226    0.2581    0.0968;
       0.1379    0.2759    0.1379    0.2759]
 
% z_star = Normalised Increase in Value Added Costs
% ------------------------------------------
z_star = [inv(diag(z))*(z-z_tilde)];

ans = [0.2; 0; 0; 0]

% p = Normalised Price Change of Output
% ------------------------------------------
p = inv(I-A_star)*z_star

% The 20% increase in the cost of wages in the transportation sector cascades
% to the other sectors, resulting in an increase in their output prices. 

ans = [0.32; 0.12; 0.18; 0.14]

% The following are the changes for the four sectors: Transportation (1) 32%;
% Power (2) 12%; Health (3) 18%; and Gas Supply (4) 14%.
 
% Degraded Outputs
% ------------------------------------------
x_tilde = x+(q.*x)

ans = [4.597; 5.055; 3.520; 3.282] * 1.0e+03

% These normalized changes in price can be translated back to new degraded
% outputs of the four sectors (in dollars) [x1, x2, x3, x4] = [4597, 5055, 3520, 3282]
