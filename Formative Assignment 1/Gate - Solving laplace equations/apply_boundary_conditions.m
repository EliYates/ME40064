function [global_mat, source_vec] = apply_boundary_conditions(BCs,global_mat,source_vec,msh)
% Apply Neuman and Dirichlet Boundary Conditions to a global element matrix
% and input vector
%   Inputs:
%   BCs - a structure array containing Neuman and Dirichlet Boundary
%   OCnditions
%       BCs.Neu - struct containing nodes and gradient values
%       BCs.Dir - struct containing nodes and fixed values
%   global_mat - global diffusion matrix
%   source_vec - disturbance input vector
%   Outputs:
%   

neu_vec = zeros(msh.ngn,1);
for i = 1:length(BCs)
    n = BCs(i).node;
    if BCs(i).type == 1
        neu_vec(n) = neu_vec(n) + BCs(i).value;
    elseif BCs(i).type == 0
        source_vec(n) = BCs(i).value;
        global_mat(n,:) = 0;
        global_mat(n,n) = 1;
    end
end
sign_vec = zeros(msh.ngn,1);
sign_vec([1 end]) = [-1 1];
neu_vec = neu_vec .* sign_vec;
source_vec = source_vec + neu_vec;

end