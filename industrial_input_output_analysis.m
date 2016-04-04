% Industrial input-output analysis: Implications for industrial ecology
 
% FAYE DUCHIN (1991) Procedings of the National Academy of Sciences.
Vol. 89, pp. 851-855, February 1992 Colloquium Paper.
 
% (I - A)x = y        eq 1.
% (I - A')p = v       eq 2.
% p'y = v'x           eq 3.
 
% x = output
% A = coefficients
% p = unit prices
% y = final demand
% v = value added (per unit of output (x))
% I = identity matrix
% A' = transpose of A
 
% Consider a four-sector economy producing food products (F), machines and
tools (M), and two categories of waste water containing high (H) and low
(L) levels, respectively, of dissolved or suspended biological solids.
For each gallon (1 gallon = 3.78 liters) of high-biological-
oxygen-demand (BOD) water reated in sector H, a fraction of a gallon of
low-BOD water is sent for treatment in sector L; and, for each gallon
treated by sector L, a fraction remains requiring further treatment. All
four sectors dump some sludge into the environment.
 
% The economy is described by the following input-output matrix (A):
 
%    F   M   H   L
%  -----------------
%  |0.4|0.3| 0 | 0 | F
%  |0.2|0.3|0.2|0.1| M
%  |0.4| 0 | 0 | 0 | H
%  |0.4|0.1|0.3|0.2| L
%  -----------------
 
A = [0.4 0.3 0 0; 0.2 0.3 0.2 0.1; 0.4 0 0 0; 0.4 0.1 0.3 0.2];
 
I = eye(4);
 
% If final demand (y) and value-added (v) are as follows:
 
y = [10; 3; 0; 0];
 
v = [10; 10; 50; 20];
 
% calculate total output (x):
 
(I - A)x = y
 
x = inv(I-A)*y;
 
(x)
 
% calculate unit prices (p):
 
(I - A')p = v 
 
p = inv(I-A')*v;
 
(p)
 
% calculate total income (i):
 
income = p'y = v'x
 
income = v'*x;
 
(income)
 
% If residuals per unit of output (per 100 gallons treated in the case
of sectors H and L) are given by:
 
s = [0.05; 0; 0.05; 0.02];
 
sludge = s'*x;
 
(sludge)
 
% Now let us assume that the society is prepared to tolerate that 2x 100
gallons each of high-and low-BOD water be emptied into the environment
without treatment while consumers still require 10 tons of food and
three machines. This can be represented by allowing final users to
"accept" the dirty water, so that:
 
y = [10; 3; -2; -2];
 
% The output vector (x) is now computed to be:
 
x = inv(I-A)*y;
 
(x)
 
% The amount of residual sludge can be computed to fall from 2.1 to 1.9 tons
 
sludge = s'*x;
 
(sludge)
 
% National income falls from $1294 (in the other computation) to $1081.
 
income = v'*x;
 
(income)
 
% Thus for an additional outlay of $202 (covering the pro- duction costs of
an additional 0.7 ton of food, 1.4 machines, and the processing of an
additional 2.3 x 100 gallons of high-BOD water and 3.9 x 100 gallons of
low-BOD water) and the toleration of an additional 0.2 ton of sludge, it
is possible to avoid dumping 200 gallons each of high- and low-BOD waste
water.
 
% It will sometimes be the case, as in this example, that increased
processing of wastes will be accompanied by disposal of (i) smaller
quantities of raw pollutants, (ii) greater quantities of concentrated
residuals, and (iii) greater costs. Of course, there will also be
opportunities for reducing the use of water and the accumulation of
solids in it or of recovering economically useful products from the waste
stream. In these cases, less pollution can be consistent with lower
rather than higher costs.
 
% In this framework there is no attempt to find the "optimal" amount of
water to dump or even to determine which of the two scenarios is "better"
because this is deemed to be not exclusively an economic decision. The
method makes it possible to examine the physical and economic
implications of technically feasible scenarios rather than screening out
all but one.
