function [x] = BasisFunction(element,xi)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

x_n = [0.0 0.2 0.4 1.0];

x1 = x_n(element); % Retrieve the first basis function value
x2 = x_n(element + 1); % Retrieve the second basis function value
psi.zero = (1-xi)/2;
psi.one = (1 + xi) / 2;

x = psi.zero * x1 + psi.one * x2;


end