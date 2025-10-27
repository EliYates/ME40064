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

% create an empty vector to put the Neuman BCs in
neu_vec = zeros(msh.ngn,1);

% iterate through boundary conditions
for i = 1:length(BCs)
    n = BCs(i).node;
    % Check for boundary condition type
    if BCs(i).type == 1
        % For Neuman boundary, add the value to the vector
        neu_vec(n) = neu_vec(n) + BCs(i).value;
    elseif BCs(i).type == 0
        % For Dirichlet boundary, set global matrix row to corresponding
        % row from the identity matrix and set the source vector value to
        % the boundary condition value
        source_vec(n) = BCs(i).value;
        global_mat(n,:) = 0;
        global_mat(n,n) = 1;
    end
end
% Apply Neuman boundary condition sign convention to the vector where the
% sign condition is [-1, ...., 1]'
sign_vec = zeros(msh.ngn,1);
sign_vec([1 end]) = [-1 1];
neu_vec = neu_vec .* sign_vec;

% Add the Neumand boundary condition vector to the source vector
source_vec = source_vec + neu_vec;

% Note - this only works when Dirichlet and Nueman boundary conditions are
% not applied to any shared nodes, as they would need to be carried out in
% specific order

end