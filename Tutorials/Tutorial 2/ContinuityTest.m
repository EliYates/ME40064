%% Test continuity

for i = 1:2
    
assert(BasisFunction(i,1) == BasisFunction(i+1,-1))

end