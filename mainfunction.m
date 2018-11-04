%% This section reads the data from the file
fid = fopen('C:\Users\pc\Desktop\Fall 2018\Information Theory and Coding\PROJECT 1\TEST.txt','r');
data = fread(fid);
chardata = char(data);%This is used for parsing the symbols into character data
fclose(fid);
%% This Section is for finding unique elements and calculating their probabilitis
uniq = unique(chardata);% we find at first the unique symbols and then calculate the number of their occurrences and then their probabilities
parfor i = 1:length(uniq)
    probabilities(i) = (sum(chardata == uniq(i))/length(chardata));% here we summed all the elements from chardata that equals the current element of uniq
end
%% This section i.s for calculating entropy
H = -1 * sum(probabilities.*log2(probabilities));% we used the formula of the entropy
%% This section is to call huffman encoder function
[i,y] = Huffmanencoder(transpose(uniq),probabilities); % here we transposed the uniq matrix because we pass a vector to this function
% i is a cell array containing the codes of the symbols if you observe it
% you find it's composed of a space = 0 and a square = 1 (use cell2mat to
% see them
fprintf('symbols ----> code\n');
for l = 1:length(i)
    fprintf('|%c| ----> |%s|\n',y(l),cell2mat(i(l)));  
end
%% This part is for calculating the average length
term = 0;
% here we need to sum the length of each code multiplied by the
% corresponding probability of the symbol
for z = 1:length(probabilities)
    term = term + length(cell2mat(i(z)))*probabilities(z);
end
%% This part is for generating the huffman tree
% in order to generate the tree we use treeplot and its input vector is
% parents of the nodes which we used to compute it calcparent
parent = calcparent(probabilities)
treeplot(parent)



