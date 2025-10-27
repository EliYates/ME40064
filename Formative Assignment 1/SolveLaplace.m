function [] = SolveLaplace(number_of_elements)
% Solve Laplace's Equation for a specified number of elements


% Create mesh with specified number of elements
msh = OneDimLinearMeshGen(0,1,number_of_elements);
% Apply Nueman boundary condition with g=2 at x=0 (node 1) and Dirichlet
% boundary conditions with c=0 at x=1 (last node)
BC_matrix = [1 2 1; msh.ngn 0 0];
BCs = set_boundary_conditions(BC_matrix);
% Assemble the global matrix with D=1 for laplaces equation
global_mat = global_matrix_assembly(msh,1);
% No source term for Laplace's Equation, create source vector of zeros
source_vec = zeros(msh.ngn,1);
% Apply boundary conditions
[global_mat, source_vec] = apply_boundary_conditions(BCs,global_mat,source_vec,msh);
% Solve for C
c = global_mat\source_vec;


fig  = createfigure(msh.nvec,c,['Laplace Equation with ', num2str(number_of_elements), ' Elements']);
saveas(fig,['Report\LaplaceWith',num2str(number_of_elements),'Elements'],'png')