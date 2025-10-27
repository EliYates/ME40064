function [global_mat] = global_matrix_assembly(msh,D)
% Funtion that assembles the global diffusion matrix for a defined mesh and
% diffusion coefficient
% Setting D = 1 provides the Laplace equation Matrix
%   Input:
%   msh - a 1-D mesh element containing the following
%       msh.ngn - number of global nodes
%       msh.ne - number of elements
%       msh.elem - mesh element structure
%   D - Diffusion coefficient
%   Output:
%   global_mat - The global matrix for the diffusion operator

% Set up a global matrix with dimensions equal to the number of nodes
global_mat = zeros(msh.ngn);

% Add the local element matrix for each element in the mesh
for i = 1:msh.ne

    % Produce the matrix for the local element ID
    local_mat = LaplaceElemMatrix(D,i,msh);
    
    % Find the size of the local matrix (assuming it's square)
    Local_size = length(local_mat); 
    % Set n to the coordinate of the top left corner of where the local
    % matrix is superimposed onto the global
    n = i;
    % Set m to the coordinate of the bottom right corner of where the local
    % matrix is superimposed onto the global
    m = i + Local_size - 1;
    
    % Add the local matrix to the global at the relevant nodes
    global_mat(n:m,n:m) = global_mat(n:m,n:m) + local_mat;

end


end