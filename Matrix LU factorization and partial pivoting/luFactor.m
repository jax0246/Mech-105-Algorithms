function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

[Y,X]=size(A);    % check size of A if worng size error.
evalRows=X;        % how many times will this function have to loop
ANew=A;            % initial condition to start of loop
A2=A;
U=zeros(size(A)); % set up original matrix size.
P=zeros(size(A))
for r= 1:(X-1)
if Y~=X error('matrix must be x*x'), end
evalRows=evalRows-1;  
[~,i]=max(abs((ANew(:,r))));
pnew=ANew/ANew;
pnew(1,:)=0;,pnew(1,i)=1;,pnew(i,:)=0;,pnew(i,1)=1; %I found this dont care to explain it it just does and cant be used to determin p for some stupid reason.

A1=(pnew*ANew);
U(r,:)=A1(1,:);
ANew=A1;
ANew(1,:)=[];
for S=1:(evalRows) %determin the uper matrix U 
    multiplicationFactor=(ANew(S,r))/(A1(1,r)); %variable of first coeeficent / itself.
    product=A1(1,:)*multiplicationFactor; %largest variable*first coefficent of row n/itself
    var=ANew((S),:)-product; %subtraction step
    ANew((S),:)=var;    %new matrix made up with the new variables = to a' a'' a''' so on and so forth
end
zero=zeros(1,X)
[Maximum,I]=max(abs(A2(:,r)))
z=A2(I,:)
for s=1:X
    A2(I,:)=zero
    MFactor=((A2(s,r))/(Maximum))
    var2=(A2(s,:)-(MFactor*z))
    A2(s,:)=var2
end
P(r,I)=1
U(r+1:Y,:)=ANew
end
[~,I]=max(abs(A2(:,(r+1))))
P((r+1),I)=1
disp('done')
L=((P*A)/U)
U
P
end
