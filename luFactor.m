function[L,U,P]=luFactor(A)
% LU Factorization Algorithm
% Yeilin Benitez
% MECH 105
% This algorithm uses partial pivoting and LU Decomposition to determine
% the L,U, and P matrices. The algorithm is LU Factorization of SQUARE MATRICES.
% In the command window type '[L,U,P]=luFactor(A)' to get matrices in the
% workspace.
% INPUTS
% A- coefficients of fxns, a matrix
% OUTPUTS
% L- lower triangular matrix
% U- upper triangular matrix
% P- the pivot matrix

if nargin>1||nargin<1 %Checks that there is only one input.
    error('Only one input is required')
else 
    [m,n]=size(A);
    if m~=n % Checks if matrix is square
        error('Matrix A (input) must be a squared matrix')
    end
end
% Setting the Matrices 
U=A;
P=eye(n);
L=eye(n);
% Pivoting Matrix U
for j=1:n
    [maxnum,row]=max(abs(U(1:n,j)));%Finds the largest number in the first colomn of the matrix
    maxrowU=U(row,:);
    oldU=U(j,:);
    U(j,:)=maxrowU;
    U(row,:)=oldU;
%Pivoting Matrix P
    maxrowP=P(row,:);%Pivots the P matrix
    oldP=P(j,:);
    P(j,:)=maxrowP; 
    P(row,:)=oldP;
end
%LU Decomposition
for j=1:n
    i=j+1:n;
    deter=U(i,j)/U(j,j);
    L(i,j)=deter;
    U(i,:)=U(i,:)-deter*U(j,:);
end   % To check if algorithm worked efficiently P*A=L*U