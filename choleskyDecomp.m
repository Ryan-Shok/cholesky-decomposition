function [L,U] = choleskyDecomp(A)

if size(A, 1) ~= 3 || size(A,2) ~= 3
    error('Matrix must be 3x3')
end
for i = 1:3
    for j = 3:1
        if A(i, j) ~= A(j, i)
            error('Matrix is not symmetric')
        end
    end
end



L = zeros(3);
if A(1,1) <= 0
    error ('Not positive definite')
end
L(1,1) = sqrt(A(1,1));
L(2,1) = A(2,1)/L(1,1);
L(3,1) = A(3,1)/L(1,1);
temp = sqrt(A(2,1) - L(2,1)^2);
if temp <= 0
    error ('Not positive definite')
end
L(2,2) = sqrt(temp);
L(3,2) = (A(3,2) - L(3,1) * L(2,1)/L(2,2));
temp2 = A(3,3) - L(3,1)^2 - L(3,2)^2;
if temp2 <= 0
    error ('Not positive definite')
end
L(3,3) = sqrt(temp2);

U = L';
