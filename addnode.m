function codeword_new = addnode(codeword_old,item)
% here we add a new cell node to the old cells
codeword_new = cell(size(codeword_old));
for index = 1:length(codeword_old),
codeword_new{index} = [codeword_old{index} item];
end
end