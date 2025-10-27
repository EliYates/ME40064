function [diff_mat] = LaplaceElemMatrix(D, eID, msh)
% function to create a local element matrix for the diffusion operator
% Inputs:
% D - diffusion coefficient
% eID - local element number 
% msh - mesh data structure
% Output:
% diff_mat - local element matrix for the diffusion operator

% Calculate the spacial step size, h, from the x coordinate of each node

% Fetch the value of the Jacobian from the data structure
J = abs(msh.elem(eID).J);

% Calculate the magnitude of int00, int01, int10, int11
k_D = D / (2 * J);

% Assemble the values into the matrix with appropriate signs 
diff_mat = [k_D -k_D; -k_D k_D];


