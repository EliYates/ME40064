%% Test 1: test symmetry of the matrix
% % Test that this matrix is symmetric
tol = 1e-14;
lambda = 2; % linear reaction coefficient
eID=1; %element ID

msh = OneDimLinearMeshGen(0,1,10); % create equally spaced mesh
elemat = ReactionElemMatrix(lambda,eID,msh);  % form the local element matrix

assert(abs(elemat(1,2) - elemat(2,1)) <= tol)

%% Test 2: test 2 different elements of the same size produce same matrix
% % Test that for two elements of an equispaced mesh, as described in the
% % lectures, the element matrices calculated are the same
tol = 1e-14;
lambda = 5; % linear reaction coefficient
eID=1; %element ID

msh = OneDimLinearMeshGen(0,1,10);
elemat1 = ReactionElemMatrix(lambda,eID,msh);

eID=2; %element ID
elemat2 = ReactionElemMatrix(lambda,eID,msh);

% compare mesh at element ID 1 and 2
diff = elemat1 - elemat2;
diffnorm = sum(sum(diff.*diff));
assert(abs(diffnorm) <= tol)

%% Test 3: test that one matrix is evaluted correctly
% % Test that element 1 of the three element mesh problem described in the lectures
% % the element matrix is evaluated correctly
tol = 1e-14;
lambda = 9; % linear reaction coefficient
eID=1; %element ID

msh = OneDimLinearMeshGen(0,1,3);
elemat1 = ReactionElemMatrix(lambda,eID,msh);

elemat2 = [1 .5; .5 1]; % local matrix evaluated by hand
diff = elemat1 - elemat2; %calculate the difference between the two matrices
diffnorm = sum(sum(diff.*diff)); %calculates the total squared error between the matrices
assert(abs(diffnorm) <= tol)

%% Test 4: test that different sized elements in a mesh are evaluted correctly - element 1
% % Test that elements in a non-equally spaced mesh are evaluated correctly
tol = 1e-14;
lambda = 12; % linear reaction coefficient
eID=1; %element ID

msh = OneDimSimpleRefinedMeshGen(0,1,5); % Create a non-uniformly distributed mesh
elemat1 = ReactionElemMatrix(lambda,eID,msh);

elemat2 = [2 1; 1 2]; % Matrix for element 1, J = 0.25
diff = elemat1 - elemat2; %calculate the difference between the two matrices
diffnorm = sum(sum(diff.*diff)); %calculates the total squared error between the matrices
assert(abs(diffnorm) <= tol)

%% Test 5: test that different sized elements in a mesh are evaluted correctly - element 4
% % Test that elements in a non-equally spaced mesh are evaluated correctly
tol = 1e-14;
lambda = 12; % linear reaction coefficient
eID=4; %element ID

msh = OneDimSimpleRefinedMeshGen(0,1,5);
elemat1 = ReactionElemMatrix(lambda,eID,msh);

elemat2 = [0.25 0.125; 0.125 0.25]; % Matrix for element 4, J = 0.03125
diff = elemat1 - elemat2; %calculate the difference between the two matrices
diffnorm = sum(sum(diff.*diff)); %calculates the total squared error between the matrices
assert(abs(diffnorm) <= tol)