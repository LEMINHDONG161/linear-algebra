close all
clear all
%% TEST GAUSSIAN ELIMINATION
A = [1,1,1 ;1,2,1;1,3,4]
b = [1;0;0]
%[y] = gauss1(A,b);
 i = 1; % loop variable
    X = [ A b ]; 
    [ nX mX ] = size( X); % determining the size of matrix   
    while i <= nX % start of loop 
        if X(i,i) == 0 % checking if the diagonal elements are zero or not
            disp('Diagonal element zero') % displaying the result if there exists zero 
            return
        end
        X = elimination(X,i,i); % proceeding forward if diagonal elements are non-zero
        i = i +1;
    end    
    C = X(:,mX)
    %% TEST INVERT MATRIX
   A1 = [1,1,1 ;1,2,1;1,3,1]
   b1 = [1,0,0;0,1,0;0,0,1]
    [det1,X1 ] = gauss_invert( A1, b1 )