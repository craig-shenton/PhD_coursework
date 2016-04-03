% Data from: Murray, J. and Wood, R. 2010. The Sustainability Practitioners Guide to Input-Output Analysis. Chapter 14: Environmentally Extended Multi-Region Input-Output Model. pp. 169.

% see Table 1. Transaction Matrix in README.m

% T = Transactions Matrix
%------------------------------------------
T = [15 35 4 0 0.3 0.1 0 0.1 0.1;
    24 400 45 0 5 0.7 0 7 3;
    3 45 20 0 0 0 0 0 1;
    0 0 0 3 22 4 0 0 0;
    0.2 10 0.7 12 640 160 0.2 17 4;
    0 0 0 4 195 190 0 0 0;
    0.1 0.1 0 0.1 2 0.2 18 46 5;
    0.2 5 0.5 0.1 10 2 21 930 330;
    0 0 0 0 0.1 0 15 390 720];
 
% y = Final Demand
%------------------------------------------
y = [47.9; 240.4; 76.2; 14.2; 800.3; 728; 12.7; 1376.3; 1878];
 
% x = Total Input
%------------------------------------------
x = [102.5; 725.1; 145.2; 43.2; 1644.4; 1117; 84.2; 2675.1; 3003.1];
 
% A = Technical Coefficients = T/x
%------------------------------------------
A=T*(inv((diag(x))));
 
% A =   [0.1463 0.0483 0.0275 0      0.0002 0.0001 0      0.0000 0.0000;
%        0.2341 0.5516 0.3099 0      0.0030 0.0006 0      0.0026 0.0010;
%        0.0293 0.0621 0.1377 0      0      0      0      0      0.0003;
%        0      0      0      0.0694 0.0134 0.0036 0      0      0;
%        0.0020 0.0138 0.0048 0.2778 0.3892 0.1432 0.0024 0.0064 0.0013;
%        0      0      0      0.0926 0.1186 0.1701 0      0      0;
%        0.0010 0.0001 0      0.0023 0.0012 0.0002 0.2138 0.0172 0.0017;
%        0.0020 0.0069 0.0034 0.0023 0.0061 0.0018 0.2494 0.3477 0.1099;
%        0      0      0      0      0.0001 0      0.1781 0.1458 0.2398];
 
% -10% Agricultural Productivity in Countries A, B and C
 
Aop1 = [(10/100)*A(1,1:9); zeros(2,9); (10/100)*A(4,1:9);
        zeros(2,9); (10/100)*A(7,1:9); zeros(2,9)]
 
Aop = A+Aop1
 
% I = Identity Matrix
%------------------------------------------
I = eye(length(T));
 
% Estimate total output
%------------------------------------------
x = inv(I-A)*y;
 
x_op=inv(I-Aop)*y;
 
% Results
%------------------------------------------
 
Tnew = Aop/(inv((diag(x_op))));
 
Told = A/(inv((diag(x))));
 
num2str(Tnew-Told,'%.2f')
 
% Value Added
v = [60; 230; 75; 24; 770; 760; 30; 1285; 1940]
 
% Inter-Industry Purchases
rec = sum(Tnew);
 
% New Value Added
v_new = x'-rec;
 
num2str(v_new,'%.0f')

ans = 56 224  74  22 767 759  22 1278 1938

v   = 60 230  75  24 770 760  30 1285 1940

Agr (A)
Man (A)
Ser(A)
Agr (B)
Man (B)
Ser(B)
Agr (C)
Man (C)
Ser(C)
93.33%
97.39%
98.66%
91.66%
99.61%
99.86%
73.33%
99.45$
99.89%

%Price Model
%------------------------------------------
 
% p = inv(I-A')*v
 
p = inv(I-A')*v
 
p_new = inv(I-Aop)*v_new'
 
num2str(p_new-p,'%.2f')

Agr (A)
Man (A)
Ser(A)
Agr (B)
Man (B)
Ser(B)
Agr (C)
Man (C)
Ser(C)
-165.38
8.9
-219.45
-559.72
61.20
-40.98
-1460.80
-146.67
113.63
