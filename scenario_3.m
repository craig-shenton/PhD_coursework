% Table 1. Sector-Sector Transaction Example Data (Leung et al. 2007:301).

% j = 1 	j = 2 	j = 3 	j = 4 	Demand, C 	Total Output, x
% i = 1 Transport 500 800	800	400	1000	3500
% i = 2 Power 400	900	1000	800	1500	4600
% i = 3 Health 700	400	800	400	800	3100
% i = 4 Gas 500	800	300	800	500	2900
% Value added zT 1400	1700	200	500	
% Total input xT 3500	4600	3100	2900	

% Scenario 3: Using the data given in Table 1, the output-side model is used to compute for the impact of perturbation of a terrorist attack, resulting in inoperability of q3 = 0.10 (10%) and q4 = 0.05 (5%) estimated for Sectors 3 and 4.

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
%------------------------------------------

x = [3500; 4600; 3100; 2900];
 
x_hat = x;

% -10% from output in sector (1) and -5% from output in sector (2) 
% x_tilde = [ x_hat(1:2); (x_hat(3)-(10/100)*x_hat(1)); (x_hat(4)-(5/100)*x_hat(2))];
 
% y = Final Demand
%------------------------------------------

y = [1000; 1500; 800; 500];
 
c_hat = y;

% no change in demand
c_tilde = y;
 
% A = Technical Coefficient Matrix
%------------------------------------------

A=T*(inv((diag(x))));

% The Output IIM
% ------------------------------------------

% In general, with a total of n sectors and r of those n sectors having outputs that are exogenously specified, 
% the inoperability vector can be divided into two sets, q and q_hat. 

% where;

% q = inoperability vector of sectors (n − r), whose values are to be determined by the model

% q_hat = inoperability vector of the remaining sectors r, whose values are exogenously specified, and part of the % perturbation vector that will drive the model.

% The same thing can be done to the final demand perturbation vector, 

% so that;

% c_star = final demand perturbation vector of sectors (n − r), whose values are exogenously specified, 

% c_star_hat = final demand perturbation vector of the remaining sectors r, whose values are determined by the    % model.

% In this case: q = sectors 1 and 2; q_hat = sectors 3 and 4; c_star = sectors 3 and 4; and c_star_hat = sectors 1 % and 2.

% Matrix Form
% ------------------------------------------

% The general output-side IIM can then be written in the following matrix form:

% [(I-A_star)_q zeros((n−r),(n−r)); (I-A_star)_q_hat -I][q; c_star_hat] = [I -(I-A_star)_q'; zeros((n−r),r) 
% -(I-A_star)_q_hat'][c_star; q_hat]

% <--> [B][b] = [D][d]

% A_star = Interdependency Matrix
%------------------------------------------

A_star = [inv(diag(x_hat))*A*(diag(x_hat))]

ans = [0.1429    0.2286    0.2286    0.1143;
       0.0870    0.1957    0.2174    0.1739;
       0.2258    0.1290    0.2581    0.1290;
       0.1724    0.2759    0.1034    0.2759]

% Given that the element of (I-A_star) = (i,j). Then the sub-matrices are defined as follows:

% (I-A_star)_q = (n-r)*(n-r) matrix whose elements (i,j) equal to subscripts of (n-r) sectors included in the set q.

A_q = [A_star(1:2,1:2)]

% (I-A_star)_q_hat = r*(n-r) matrix whose elements i = subscripts of (r) sectors included in the set q_hat,
% and j = subscripts of (n-r) sectors included in the set q.

A_q_i = [A_star(1:2,3:4)]

% -(I-A_star)_q_inverse = (n-r)*r matrix whose elements are -(i,j) with; i = subscripts of (n-r) sectors included in the set q, and j = subscripts of (r) sectors included in the set q_hat.

A_q_hat = [A_star(3:4,1:2)] 

% -(I-A_star)_q_hat_inverse = r*r matrix whose elements are -(i,j) with; i and j equal to subscripts of (r) sectors included in the set q_hat.

A_q_hat_i = [A_star(3:4,3:4)]

% The partitioned matrices facilitate the derivation of the inverse and the product of these matrices to generate inv(B)*D.

% Check to see if sub-matrices are same as A_star
A_starz = [A_q A_q_i; A_q_hat A_q_hat_i]-A_star

B = [(eye(2,2)-A_q) zeros(2,2); (zeros(2,2)-A_q_hat) -eye(2,2)]
 
ans = [0.8571   -0.2286         0         0;
      -0.0870    0.8043         0         0;
      -0.2258   -0.1290   -1.0000         0;
      -0.1724   -0.2759         0   -1.0000] 

D = [eye(2,2) -(zeros(2,2) - A_q_i); zeros(2,2) -(eye(2,2) - A_q_hat_i)]
 
ans = [1.0000         0    0.2286    0.1143;
            0    1.0000    0.2174    0.1739;
            0         0   -0.7419    0.1290;
            0         0    0.1034   -0.7241]
 
d =
 
ans = [0; 0; 0.10; 0.05]
 
i.e., [c_star(1); = [0.00;
       c_star(2); =  0.00;
       q(3);      =  0.10;
       q(4)]      =  0.05] 

BD = inv(B)*D
 
b = BD*d

ans = [0.0447; 0.0427; 0.0521; 0.0064]
 
Therefore, [q(1);      = [0.045;
            q(2);      =  0.043;
            c_star(3); =  0.052;
            c_star(4)] =  0.006]
 
% The output of Sectors 1 and 2 are affected by the decrease in output of Sectors 3 and 4. Sector 1?s inoperability level is 4.5%, and Sector 2 has inoperability of 4.3%. At the same time, the output perturbation also impacted the amount of product available for final use. Therefore, final demand levels for Sectors 3 and 4 are decreased by 5.2% and 0.6%, respectively.

% x_tilde = Degraded Output
% ------------------------------------------

% Using the equation: b = (x_hat-x_tilde)/x_hat, these inoperability levels can be translated back to new degraded % outputs (in US dollar values) of sectors (1) and (2):
 
x_tilde = x_hat(1:2)-(b(1:2).*x_hat(1:2))
 
ans = [3344; 4404]

% Compared to the expected output, x = [3500; 4600]

% c_tilde = Degraded Final Demand
% ------------------------------------------

% Using the equation: b = (c_hat-c_tilde)/c_hat, these inoperability levels can be translated back to new degraded % final demand (in US dollar values) of sectors (3) and (4):
 
c_tilde = c_hat(3:4)-(b(3:4).*c_hat(3:4))

ans = [758; 497]

% Compared to the expected output, y = [800; 500]
