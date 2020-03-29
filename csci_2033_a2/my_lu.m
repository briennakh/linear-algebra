%% 
% Performs matrix decomposition for A = LU
%
% The parameters received are:
% - A (n x n): a rectangular matrix
% 
% The function should return
% - L (n x n) 
% - U (n x n)

function [L, U] = my_lu(A)
%%%% YOUR CODE STARTS HERE
    
    n = size(A, 2); % number of columns of A
    L = eye(n); % n x n identity matrix 
    U = A;
    
    % For every row i,
    for i = 1:n-1 % i goes from 1, ..., n-1
        
        % If Uii is zero, then return L, U
        if abs(U(i, i)) < power(10, -12)
            return
        end
        
        % For each row k below the ith row,
        % reduce the kth row of U using the pivot multiplier
        % and record the pivot multiplier to L at (k, i)
        for k = i+1: n 
            p = U(k,i) / U(i, i); % pivot multiplier 
            [U, L] = replacement_lu(U, k, i, p, L); 
        end
    end
    
    return
      
end