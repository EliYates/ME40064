%% Test 1: Are the results as expected in the range between 1 and 4
% Test minimum case N = 1, input = 4, output = 16
% Test maximum case N = 4, input = (4,-5,6,-7), output = 31.5

tol = 1e-8;
sos = NormSumSquare(4);
assert(abs(sos-16)<=tol)

sos = NormSumSquare([4 -5 6 -7]);
assert(abs(sos-31.5)<=tol)


%% Test 2: Are the results as expected in the second range
% Test N = 5, input = (1, sqrt(2), pi, -3, 3), output = 2.484737588
% Test n = 8, input = (1:1:8), output = sqrt(25.5)

tol = 1e-8;
sos = NormSumSquare([1 sqrt(2) pi -3 3]);
assert(abs(sos-2.484737588)<=tol)

sos = NormSumSquare(1:1:8);
assert(abs(sos-sqrt(25.5))<=tol)

%% Test 3: The final range
% Test N = 9, input = (1/9:1/9:1), output = cuberoot(95/243)
% Test N = 100, input = 1:1:100, output = cuberoot(3383.5)

tol = 1e-8;
sos = NormSumSquare(1/9:1/9:1);
assert(abs(sos-(95/243)^(1/3))<=tol)

sos = NormSumSquare(1:1:100);
assert(abs(sos-3383.5^(1/3))<=tol)
