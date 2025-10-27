function [reac_mat] = ReactionElemMatrix(lambda, eID, msh)
% function to create a local element matrix for the diffusion operator
% Inputs:
% lambda - reaction coefficient
% eID - local element number 
% msh - mesh data structure
% Output:
% reac_mat - local element matrix for the diffusion operator

% Fetch the value of the Jacobian from the data structure
J = abs(msh.elem(eID).J);

% Calculate the magnitude k_lambda
k_lambda = J*lambda/3;

% Assemble the values into the matrix with appropriate signs 
reac_mat = [2*k_lambda k_lambda; k_lambda 2*k_lambda];


