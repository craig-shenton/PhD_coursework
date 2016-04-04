% Absorbing Markov Chain I-O modelling

% Data from: Duchin, F. and Levine, S.H., 2010. Embodied resource flows and product flows. Journal of Industrial Ecology, 14(4), pp.586-597.

% Consider an economy with three resources (RE), three intermediate products (P), and three consumption goods (C).

% see Figure 2. Absorbing Markov Chain Model, in README.md

% RE1 labor, RE2 ore, RE3 land

% P1 agriculture, P2 manufacturing, P3 mining

% C1 agriculture, C2 manufacturing, C3 mining


% [2] Define components.
% ----------------------------------------------------
 
y = [10; 20; 1];       %  consumption demand vector
 
% Technical coefficent matrices
 
% Intermediate inputs, per unit of output
A = [0.05 0.15 0; 0.1 0.5 0.2; 0 0.3 0.05];
 
% Resource requirements, per unit of output
F = [1.5 0.5 0.25; 0 0 3; 2 0 0.5];
 
 
% [3] Apply the IO model to data.
% ----------------------------------------------------
 
% Create identity matrix (I)
 
I = eye(3);
 
% Calculate total output (x) according to: x = [(I - A)^-1]*y
 
x = inv(I - A)*y
 
% Calculate total resources (phi) according to: phi = Fx = F*[(I - A)^-1]*y
 
p = F*[inv(I - A)]*y
 
% [4] Calculate inter-industry product flow matrices.
% ----------------------------------------------------
 
% Intermediate product distribution coefficent (A_hat) or 'Ghosh matrix'
 
X = A*x(digaonlised)
 
A_hat = [x(digaonlised)^-1]*X
 
xd=diag(x(:));          % diagonlise x
 
X = A*xd;
 
A_hat = inv(xd)*X;
 
% Resource distribution coefficent (F_hat) 
 
P = F*x(digaonlised)
 
F_hat = [p(digaonlised)^-1]*P
 
pd=diag(p(:));         % diagonlise p
 
P = F*xd;
 
F_hat = inv(pd)*P;
 
% [5] Apply Absorbing Markov Chain analysis.
% ----------------------------------------------------
 
%Proportion of flows from transient to absorbing states (R)
 
R = [ 0; Rx ]
 
Rx = [x(digaonlised)^-1]*y(digaonlised)
 
xd=diag(x(:));          % diagonlise x
 
yd=diag(y(:));          % diagonlise y
 
Rx = inv(xd)*yd;
 
R = [zeros(3); Rx]
 
% Proportion of flows among the transient states (Q)
 
Q = [ 0 F_hat; 0; A_hat ]
 
Q = [ zeros(3) F_hat; zeros(3) A_hat ]
 
% Fundamental matrix of absorbing chain (N) = (I - Q)^-1
 
N = [I F_hat*(I - A_hat)^-1; 0 (I - A_hat)^-1]
 
I = eye(3);            % identity matrix (I)
 
G = inv(I - A_hat);
 
N = [I F_hat*G; zeros(3) G]
 
% Distribution of every embodied resource (B) = NR
 
B = [F_hat*(I - A_hat)^-1*x(diag)^-1*y(diag); (I - A_hat)^-1*x(diag)^-1*y(diag)]
 
B = [F_hat*G*inv(xd)*yd; G*inv(xd)*yd]
 
% Sigma is the average path length of embodied resource i before it ends up
in a consumer good.
 
sigma(i) = ?(j) n(ij)
 
sigma = sum(N,2)
 
% It can be expressed as the average output multiplier for products weighted by the fraction of i embodied in each consumer product.
 
% An increase in output multiplier, implying that a greater portion of output is retained within the production network, leads to an increase in average path length.

% Example showing the distribution of Iron Ore through the system.

% see Figure 3. Resource Specific Network, in README.md
