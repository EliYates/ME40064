%% Script to run unit test on rightTri.m function

%% Test 1: Sum of Angles
% Test that angles sum to 180 degrees

[A,B,C] = rightTri(7,9);
assert(A+B+C == 180)

%% Test 2: Isosceles Triangles
% Test that if a and b are equal length, a and b are equal angle
[A,B,~] = rightTri(4,4);
assert(A == B)

%% Test 3: 3-4-5 Triangle
% Test that if sides a and b are length 3 and 4, then c is length 5
[A,~,~] = rightTri(3,4);
c = 3/sind(A);
assert(isequal(c,5))

%% Test 4: 30-60-90 Triangle
% Test that if side a is 1 and side b is sqrt(3), then angles A and B are
% 30 and 60 degress
[A,B,~] = rightTri(1,sqrt(3));
tol = 1e-8;
assert(abs(A-30)<=tol)
assert(abs(B-60)<=tol)