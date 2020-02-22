%% 
% Solve for the 3D coordinate of P as a problem of linear system
%
% The parameters received are:
% - a (3 x 1): 3D coordinate of point A
% - b (3 x 1): 3D coordinate of point B
% - c (3 x 1): 3D coordinate of point C
% - d (3 x 1): 3D coordinate of point D
% - ra (1 x 1): distance from A to P
% - rb (1 x 1): distance from B to P
% - rc (1 x 1): distance from C to P
% - rd (1 x 1): distance from D to P
% 
% The function should return
% - p (3 x 1): 3D coordinate of P

function p = gps3d(a, b, c, d, ra, rb, rc, rd)
%%%% YOUR CODE STARTS HERE
    x1 = 2 * (a(1) - b(1)); 
    y1 = 2 * (a(2) - b(2));
    z1 = 2 * (a(3) - b(3));
    x2 = 2 * (b(1) - c(1));
    y2 = 2 * (b(2) - c(2));
    z2 = 2 * (b(3) - c(3));
    x3 = 2 * (c(1) - d(1));
    y3 = 2 * (c(2) - d(2));
    z3 = 2 * (c(3) - d(3));
    
    matrix = [x1, y1, z1; 
              x2, y2, z2;
              x3, y3, z3];
    vector = [(rb^2 - ra^2 + a(1)^2 + a(2)^2 + a(3)^2 - b(1)^2 - b(2)^2 - b(3)^2); 
              (rc^2 - rb^2 + b(1)^2 + b(2)^2 + b(3)^2 - c(1)^2 - c(2)^2 - c(3)^2);
              (rd^2 - rc^2 + c(1)^2 + c(2)^2 + c(3)^2 - d(1)^2 - d(2)^2 - d(3)^2)];
    p = solve(matrix, vector);    
end