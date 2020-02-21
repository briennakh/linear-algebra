%% 
% Solve for the linear system Ax = b
%
% The parameters received are:
% - A (m x n): a rectangular matrix 
% - b (m x 1): right hand side of a linear system
% 
% The function should return
% - x (n x 1): solution vector [x_1, x_2, ..., x_n]

function x = solve(A, b)
    augmented_matrix = [A b];
    R = my_rref(augmented_matrix);
    x = R(:, end);
end

