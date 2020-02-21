%% 
% Computes the reduced row echelon form of a matrix
%
% The parameters received are:
% - A (m x n): a rectangular matrix 
% 
% The function should return
% - B (m x n): the reduce row echelon form of A

function B = my_rref(A)
%%%% YOUR CODE STARTS HERE

    % Initialize pivot row k = 1, pivot column l = 1
    k = 1; % row index
    l = 1; % column index
    
    while 1 <= k && k <= size(A, 1) && 1 <= l && l <= size(A, 2)
        disp(['Examining potential pivot position (', num2str(k), ', ', num2str(l), ')...'])
        % Swap current row with any lower one whose entry in the pivot column 
        % has the largest absolute value (partial pivoting)
        if k ~= size(A, 1) % (do not do this for the last row)
            [m, i] = max(abs(A(k:end, :))); % Get [max value, row index of max value] for each column 
            p_index = i(l) + k - 1; % Get row index of max value in current column
            A = interchange(A, p_index, k);
        end
        
        % If current entry (k, l) in current row (k) is zero, 
        % move pointer to next entry
        % (Due to numerical error, the entries in a column 
        % corresponding to a free variable may be extremely small 
        % but not precisely zero, therefore an entry is considered
        % to be zero if its absolute value is smaller than 10^-12
        if abs(A(k, l)) < power(10, -12)
            l = l + 1;
        else
            disp(['(', num2str(k), ', ', num2str(l), ') is a pivot position.'])
            % Else make current entry (k, l) equal to 1,
            % by dividing each entry in k by current entry (k, l)
            s = 1/A(k, l);
            disp(['R', num2str(k), ' <-- ', num2str(s), ' * R', num2str(k)])
            A = scaling(A, k, s);
           
            % Make all other entries in current column (l) equal to zero
            for i = 1:size(A, 1)
                if i ~= k && A(i, l) ~= 0 % ignore current entry and any zero entries (did not use 10^-12 as above, this caused errors, eg w/ my_rref(randi([-1, 1], 10, 10)))
                    % Replace row i with row i - (((i, l)/(k, l)) * row k
                    s = -(A(i,l)/A(k, l));
                    disp(['R', num2str(i), ' <-- R', num2str(i), ' + (', num2str(s), ' * R', num2str(k), ')'])
                    A = replacement(A, i, k, s);
                end
            end
      
            % Increment both k and l by 1
            k = k + 1;
            l = l + 1;
        end
    end
    
    % Return the RREF of the matrix
    B = A;
end