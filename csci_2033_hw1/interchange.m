%% 
% Swap row i and row j of a matrix
%
% The parameters received are:
% - A (m x n): a rectangular matrix 
% - i (1 x 1)
% - j (1 x 1)
% 
% The function should return
% - B (m x n): the resulting rectangular matrix

function B = interchange(A, i, j)
%%%% YOUR CODE STARTS HERE
    % Check that input indices i and j are in range
    if i > size(A, 1) || i < 1 || j > size(A, 1) || j < 1
        disp('Matrix indices i and/or j are out of range.');
        B = A;
        return;
    elseif i == j
        % disp("You're trying to swap a row with itself.");
        B = A;
        return;
    else
        % Swap rows i and j in matrix A
        disp(['Swapping rows ', num2str(i), ' and ', num2str(j), '...']);
        temp = A(i, :);
        A(i, :) = A(j, :);
        A(j, :) = temp;
        B = A;
    end
end