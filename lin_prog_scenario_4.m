% An oil refinery produces two products: jet fuel and gasoline. The profit
% for the refinery is $0.10 per barrel for jet fuel and $0.20 per barrel
% for gasoline. The following conditions must be met. 
 
% 1. Only 10,000 barrels of crude oil are available for processing. 
% 2. The refinery has a government contract to produce at least 1,000 
% barrels of jet fuel.
% 3. The refinery has a private contract to produce at least 2,000 barrels
% of gasoline.
% 4. Both products are shipped in trucks, the delivery capacity of the
% truck fleet is 180,000 barrel-miles.
% 5. The jet fuel is delivered to an airfield 10 miles from the refinery.
% 6. The gasoline is transported 30 miles to the distributor.
 
% How much of each product should be produced for maximum profit?
 
% Convert to Linear Program
% ---------------------------------
 
% Let x represent the number of barrels of jet fuel (@ $0.10 profit) and y
% represent the number of barrels of gasoline (@ $0.20 profit).
 
%Then the objective function is f = 0.10x + 0.20y.
 
% The constraints are as follows:
 x + y =< 10000            % processing capacity
 10x + 30y =< 180000       % transportation contraints
 
% The lower bounds are as follows:
 x => 1000                 % government contract spec
 y => 2000                 % private contract spec
 
% Convert to MATLAB format:
% ---------------------------------
 
% Create a proxy function for the negative of profit:
f = [-0.1 -0.2]
 
% Express the constraints in the form A*x <= b
 
A = [1 1;
     10 30]
 
b = [10000 180000]
 
% Lower bounds on the unknowns. 1000 <= x and 2000 <= y
 
lb = [1000 2000]
 
% To solve the linear program:
x = linprog(f,A,b,[],[],lb)
 
fprintf('%1.0f barrels of jet fuel should be produced. \n',x(1))
fprintf('%1.0f barrels of gasoline should be produced. \n',x(2))
profit = -f*x;
fprintf('The maximum profit erned is $%1.0f.',profit)
 
% Results
% ---------------------------------
 
 Optimization terminated.
 
 x =
 
    1.0e+03 *
 
     6.0000
     4.0000

 6000 barrels of jet fuel should be produced. 
 4000 barrels of gasoline should be produced.
 The maximum profit erned is $1400
 
% Check against results from example:
 
 Vertices (x,y)      Profit p(x,y) = 0.10x + 0.20y
 (1000, 2000)          $500
 (1000, 17000/3)       $1233.33
 (6000, 4000)          $1400
 (8000, 2000)          $1200
 
% The vertex with the most profit is (6000, 4000). This means that to make
% the most profit, the company should produce 6000 barrels of jet fuel and
% 4000 barrels of gasoline. This amount of each would yield a profit of
% $1400
