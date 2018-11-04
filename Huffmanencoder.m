function [ codeword,symbs ] = Huffmanencoder( symbols,probabilities )
%This function takes as an argument the symbols to be encoded and their
%probabilities
[probabilities,sortindex] = sort(probabilities)
symbols = symbols(sortindex);
symbolindices = num2cell(1:length(symbols)); %This saves the indices of the symbols in a cell shape
tempcode = cell(length(symbols),1); % This creates the total map of the shape 
while length(probabilities)>1,
	% here we also use the same as in the calcparent function exactly but
	% with only arrays not using queues
    index1 = symbolindices{1};
	index2 = symbolindices{2};
    % instead of the push function here we use the addnode function
	tempcode(index1) = addnode(tempcode(index1),0);
	tempcode(index2) = addnode(tempcode(index2),1);
	% we also sum the proabilitties here after adding the some of the worst
	% probabilities in each iteration
    probabilities = [sum(probabilities(1:2)) probabilities(3:end)];
	symbolindices = [{[index1 index2]} symbolindices(3:end)];
	% resort data in order to have the two nodes with lower frequency as first two
	[probabilities,sortindex] = sort(probabilities);
	symbolindices = symbolindices(sortindex);
end
% arrange cell array to have correspondance simbol <-> codeword
codeword = cell(length(probabilities),1);
codeword(symbols) = tempcode;
symbs = symbols;
%after checking the functionality it produced some empty cells, so we used
%this ine to remove them 
codeword(cellfun('isempty', codeword)) = []; 
end 




