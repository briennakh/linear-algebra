%% 
% Multiply all entries in row i of a matrix by a scalar
%
% The parameters received are:
% - A (m x n): a rectangular matrix 
% - i (1 x 1)
% - s (1 x 1): a scalar
% 
% The function should return
% - B (m x n): the resulting rectangular matrix

function B = scaling(A, i, s)
%%%% YOUR CODE STARTS HERE
    % Check that input indices i and j are in range
    if i > size(A, 1) || i < 1 
        disp('Matrix index i is out of range.');
        B = A;
        return;
    end
    
    % Multiply all entries in row i by s
    A(i, :) = A(i, :) * s;
    B = A;
end