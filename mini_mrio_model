%% Basic mini-mrio (multi region input output) analysis.

% Data from: Murray, J. and Wood, R. 2010. The Sustainability Practitioners Guide to Input-Output Analysis. Chapter 14: Environmentally Extended Multi-Region Input-Output Model. pp. 169.

% see Table 1. Transaction Matrix in README.m

T = Transactions Matrix
------------------------------------------
T = [15 35 4 0 0.3 0.1 0 0.1 0.1;
    24 400 45 0 5 0.7 0 7 3;
    3 45 20 0 0 0 0 0 1;
    0 0 0 3 22 4 0 0 0;
    0.2 10 0.7 12 640 160 0.2 17 4;
    0 0 0 4 195 190 0 0 0;
    0.1 0.1 0 0.1 2 0.2 18 46 5;
    0.2 5 0.5 0.1 10 2 21 930 330;
    0 0 0 0 0.1 0 15 390 720];
 
y = Final Demand (sum of countries A, B and C)
------------------------------------------
y = [47.9; 240.4; 76.2; 14.2; 800.3; 728; 12.7; 1376.3; 1878];
 
x = Total Input
------------------------------------------
x = [102.5; 725.1; 145.2; 43.2; 1644.4; 1117; 84.2; 2675.1; 3003.1];
 
A = Technical Coefficients = T/x
------------------------------------------
A=T*(inv((diag(x))));
 
I = Identity Matrix
------------------------------------------
I = eye(length(T));
 
Estimate total output
------------------------------------------
x_est=inv(I-A)*y

Results
------------------------------------------
x_est=         x=

 102.5          102.5
 725.1          725.1
 145.2          145.2
  43.2           43.2
1644.4         1644.4
1117.0         1117.0
  84.2           84.2
2675.1         2675.1
3003.1         3003.1
