
domain = [0,1];

mesh_elements = [1 2 4 8 16];

for i = 1:length(mesh_elements)
    mesh(i) = OneDimLinearMeshGen(domain(1),domain(2),mesh_elements(i));
    displayMesh(mesh(i));
    saveas(gcf,strcat('MeshWith' , num2str(2^(i-1)) , 'Elements'),'png')
end