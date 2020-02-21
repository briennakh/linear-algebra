%% 
% Solve for the 2D coordinate of P as a problem of linear system
%
% The parameters received are:
% - a (2 x 1): 2D coordinate of point A
% - b (2 x 1): 2D coordinate of point B
% - c (2 x 1): 2D coordinate of point C
% - ra (1 x 1): distance from A to P
% - rb (1 x 1): distance from B to P
% - rc (1 x 1): distance from C to P
% 
% The function should return
% - p (2 x 1): 2D coordinate of P

function p = gps2d(a, b, c, ra, rb, rc)
%%%% YOUR CODE STARTS HERE
    x1 = 2 * (a(1) - b(1)); 
    y1 = 2 * (a(2) - b(2));
    x2 = 2 * (b(1) - c(1));
    y2 = 2 * (b(2) - c(2));
    
    matrix = [x1, y1; x2, y2];
    vector = [(rb^2 - ra^2 + a(1)^2 + a(2)^2 - b(1)^2 - b(2)^2); 
         	  (rc^2 - rb^2 + b(1)^2 + b(2)^2 - c(1)^2 - c(2)^2)];
    p = solve(matrix, vector);    
end