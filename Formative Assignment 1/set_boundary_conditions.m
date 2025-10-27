function [BCs] = set_boundary_conditions(BC_matrix)
% Create a boundary conditions data structure
% Inputs:
% BC_matrix is a matrix of the boundary conditions which is set up in the
% form [node, value, type; node, value, type; ...]
% node is the mesh node number of the boundary
% Value is the scalar value of the boundary condition
% Type is 0 for Dirichlet BC and 1 for Neumann BC

% Convert the boundary conditions from a matrix to a structure for ease of
% use
for i = 1:size(BC_matrix,1)
    BCs(i) = struct('node', BC_matrix(i,1),'value', BC_matrix(i,2), 'type', BC_matrix(i,3));
end