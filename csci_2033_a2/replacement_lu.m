%% 
% Helper method to update U and L at every loop
%
% The parameters received are:
% - U (n x n): an upper triangular matrix 
% - i (1 x 1): row index such that U_i <- U_i - sU_j
% - j (1 x 1): row index
% - s (1 x 1): scalar multiplier for replacement
% - L (n x n): a lower triangular matrix
% 
% The function should return
% - U_new (n x n): updated U
% - L_new (n x n): updated L

function [U_new, L_new] = replacement_lu(U, i, j, s, L)
%%%% YOUR CODE STARTS HERE
    
    % Reduce the ith row of U using the pivot multiplier s, such that
    % Ui = Ui - sUj where Uj is the row of the pivot multiplier
    U(i, :) = U(i, :) - (U(j, :) * s);
    U_new = U;
    
    % Record the pivot multiplier to L at (i, j), 
    % which fills in the ith column of L
    L(i, j) = s;
    L_new = L;
    
end