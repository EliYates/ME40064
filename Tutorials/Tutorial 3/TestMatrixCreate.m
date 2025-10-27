function [mat_out] = TestMatrixCreate(a,b,c)
% Function to create a 2x2 matrix from terms a, b, and c
mat_out = zeros(2);

oneone = c^3 + 2*b*c + a;
onetwo = b^2 + a;
twoone = b^2 + a;
twotwo = 2*c^3 +4*b*c + 5*a;

mat_out = [oneone onetwo ; twoone twotwo];

