%% 
% Add the result of a scalar times row j to row i of a matrix
%
% The parameters received are:
% - A (m x n): a rectangular matrix 
% - i (1 x 1)
% - j (1 x 1)
% - s (1 x 1): a scalar
% 
% The function should return
% - B (m x n): the resulting rectangular matrix

function B = replacement(A, i, j, s)
%%%% YOUR CODE STARTS HERE
    % Check that input indices i and j are in range
    if i > size(A, 1) || i < 1 || j > size(A, 1) || j < 1
        disp('Matrix indices i and/or j are out of range.');
        B = A;
        return;
    end
    
    % Add scaled row j to row i 
    % NOTE: Ugly method to index array returned by a funciton without first
    % assigning it to a variable, will not use here
    % https://stackoverflow.com/questions/3627107/how-can-i-index-a-matlab-array-returned-by-a-function-without-first-assigning-it
    scaled_A = scaling(A, j, s) 
    A(i, :) = A(i, :) + scaled_A(j, :) 
    B = A
end