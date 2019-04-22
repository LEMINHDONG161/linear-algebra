function [det1,X ] = gauss_invert( A, b )
%GEPP
perm=0;

n = length(b);
%if n~=m 
%error('vector has wrong size');
%end
for j = 1:n
    p=j;
    % choice of main element
    for i = j:n
        if abs(A(i,j)) >= abs(A(p,j))
            p = i;
        end
    end
    if A(p,j) == 0
        error('Matrix A is singular');
    end
    %rows permutation
    t       = A(p,:);
    A(p,:)  = A(j,:);
    A(j,:) = t;
    t       = b(p);
    b(p)    = b(j);
    b(j)    = t;
    if~(p==i)
    perm=perm+1;
    end

    % reduction
    for i = j+1:n
        t       = (A(i,j)/A(j,j)); 
        A(i,:)  = A(i,:)-A(j,:)*t; 
        b(i)    = b(i)-b(j)*t; 
    end 
end
%determinant
mn=1;
for i=1:n
    mn=mn*A(i,i);
end
det1=mn*(-1)^perm;
% solution
X   = zeros(1,n); 
X(n) = b(n)/A(n,n); 

if (det1~=0)
for i = 1:n
    s = sum( A(i, (i+1):n) .* X((i+1):n) ); 
    X(i) = (b(i) - s) / A(i,i); 
end
end
end