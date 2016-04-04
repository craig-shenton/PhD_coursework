% Example data from Bailey et al. 2004 pp. 56.
 
% [1] Basic Ecological I-O Flow Model.
% ----------------------------------------------------
 
% f = flow (mass per unit time) from process i to process j
 
% z = inflow (mass per unit time) to process i from outside the system
 
% y = outflow (mass per unit time) from process j to outside the system
 
% (+/-)x = increase or decrease (mass per unit time) in stock 
 
% P = production matrix
 
%      --------------
%      | 0  0  0  0 |
%      | z -x  f  0 |
%      | 0  0  y  0 |
%      | 0  0 +x  0 |
%      --------------
 
 
% [2] Consider a two-process system.
% ----------------------------------------------------
% see Figure 1. Two-Process System, in README.md

% process H1 representing the total domestic production of aluminum
 
% process H2 representing the total domestic consumption of aluminum. 
 
% (TMT/yr = thousand metric tons per year)
 
% primary production (from virgin material) = inflow z_10 = 3710 TMT/yr 
 
% secondary production (from recovered aluminum) = flow f_12 = 1500 TMT/yr
 
% secondary production (from internal aluminum scrap) = f_11 = 1950 TMT/yr
 
% aluminium produced and used domestically = flow f_21 = 3540 TMT/yr
 
% exports of aluminum = outflow y_01 = 1590 TMT/yr
 
% imports for consumption = inflow z_20 = 3550 TMT/yr 
 
% aluminium disposed domestically = outflow y_02 = 5590 TMT/yr
 
% aluminium inventories increase = (x_1+) = 80 TMT/yr
 
 
% [3] Define components.
% ----------------------------------------------------
 
f = [1950 1500; 3540 0];      flows H1 and H2
 
z = [3710 0; 0 3550];         inflows
 
y = [1590 0; 0 5590];         outflows

x = [80 0];                   increase in stocks
 
v = [0; 0];                   zeros vector

P = production matrix 

P = [zeros(2) zeros(2) zeros(2) v; z f zeros(2) v;
    zeros(2) y zeros(2) v; 0 0 x 0 0 0]
 
T = sum(P,2);                 throughflow
 
Q = T*(inv((diag(P))));           

I = eye(7);                   identity matrix
 
N = (I - Q)^-1                "structure of the ecosystem" (aka A matrix)
 
yx = [1670 0; 0 5590];        net outflows (y+x)
 
Y = outflow matrix
 
%      --------------
%      | 0  0  0  0 |
%      | 0  0 yx  0 |
%      | 0  0  y  0 |
%      | 0  0 +x  0 |
%      --------------
 
Y = [zeros(2) zeros(2) zeros(2) v; zeros(2) yx zeros(2) v;
      zeros(2) y zeros(2) v; 0 0 x 0 0 0];
 
TM = Y * N                   Throughflow matrix (in TMT/yr)
