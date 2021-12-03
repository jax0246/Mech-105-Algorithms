function [A] = specialMatrix(n,m)
%specialMatrix-Creates an array of size (n,m) 
%where the value of the first rows and colums 
%is equal to there positions.
%all other positions are a sum of the number above and to their right.
%   note 1 n,m must be positive intigers.
%   else this will result in an error.

%this tests to see if we have the correct number of imputs
if nargin<2
    error('make sure to imput 2 variables, rows,columns')
end
%this tests to see if the value of n,m are less than 1
%if true error out
if n<1 
    error('imput must be integer and can be no smaller than 1')
elseif m<1
    error('imput must be integer and can be no smaller than 1')
end

array=zeros(n,m); %original size of array
counter=0;%counter to test if first row has been set
for row=1:n % set value of replacment to row #
    array(row,1)=row; % set the value of the first column to the row #
    if counter==0 % on the first loop
        for column = 1:m % for number of collumns
        array(1,column)=column; % replace first row with column #
        end
        counter=counter+1;% first row is set so change value of the counter
    elseif counter~=0 % after first row is compleate
        for columns=2:m % the value of the column being changed
            left=array(row,columns-1); %determins value on the left
            above=array(row-1,columns); % determins value above
            array(row,columns)=(left+above);% sets value of position as specified in the instructions
        end
end
A=array;

end

