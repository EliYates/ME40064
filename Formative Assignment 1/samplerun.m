

msh = OneDimLinearMeshGen(0,1,4000);
BC_matrix = [1 2 1; msh.ngn 0 0];
BCs = set_boundary_conditions(BC_matrix);
global_mat = global_matrix_assembly(msh,1);
source_vec = zeros(11,1);
[global_mat, source_vec] = apply_boundary_conditions(BCs,global_mat,source_vec,msh);
c = global_mat\source_vec;


plot(msh.nvec,c)
