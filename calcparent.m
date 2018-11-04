function [ parent ] = calcparent( probs)
%This function is used to find the parent nodes of the tree
%   Detailed explanation goes here
[prob,indeces] = sort(probs);
Probs = CQueue();
Parent = CQueue();
symbols = CQueue();
% at first we push the probanilities from the array to the queue
for i = 1:length(probs)
    Probs.push(probs(i));
end
count = 1;
Parent.push(0);
while Probs.size() > 1
    % for each iteration we pop the least two probabilities and then push
    % their sum back into the queue until we have only one element of the
    % probabilities = 1
    temp1 = Probs.pop();
    temp2 = Probs.pop();
    Probs.push(temp1+temp2);
    % here we defined the parent node to point to count twice meaning that
    % for each two nodes in the tree we have the same parent
    Parent.push(count);
    Parent.push(count);
    % then here we point each element of the queue to be of the array after
    % resorting it again after pushing th new probability
    [temparray,indesz] = sort(cell2mat(transpose(Probs.content())));
    for j = 1:Probs.size()
        Probs.pop();
    end
    for i = 1:length(temparray)
        Probs.push(temparray(i));
    end
    count = count + 1;
end
parent = cell2mat(transpose(Parent.content()));
end

