function A_Tao=under_A_xi(Str_Mat,Set_Simple_Concept,Index_Xi)

%  Find the set of samples belonging to A?(x) 
%  Syntax
%  A_Tao=under_A_xi(Str_Mat,Set_Simple_Concept,Index_Xi)
%  Description
%  A_Tao=under_A_xi(Str_Mat,Set_Simple_Concept,Index_Xi) returns the labels of samples belonging to set A?(xi) in AFS structure (M, ?, X), where the 3-dimension Boolean matrix Str_Mat represents the AFS structure (M, ?, X). The column vector Set_Simple_Concept represents the labels of the simple concepts in set A?M. Index_Xi is the label of xi.
%  Examples
%  Str_Mat(:,:,1)=[1 1 1 1 1 1; 0 1 1 0 0 1; 0 1 1 0 0 1; 0 1 1 0 1 0]
%  Str_Mat(:,:,1)=
%        	1     1     1     1     1     1
%        	0     1     1     0     0     1
%        	0     1     1     0     0     1
%        	0     1     1     0     1     0
%  Str_Mat(:,:,2)=[1 0 0 1 1 0; 1 1 1 1 1 1; 0 1 1 0 0 1; 0 1 1 0 1 0]
%  Str_Mat(:,:,2)=
%        	1     0     0     1     1     0
%        	1     1     1     1     1     1
%        	0     1     1     0     0     1
 %        	0     1     1     0     1     0
%  Str_Mat(:,:,3)=[1 0 0 1 1 0; 1 0 0 1 1 0; 1 1 1 1 1 1; 0 1 1 0 1 0]
%  Str_Mat(:,:,3)=
%        	1     0     0     1     1     0
%        	1     0     0     1     1     0
%        	1     1     1     1     1     1
%        	0     1     1     0     1     0
%  Str_Mat(:,:,4) =[1 0 0 1 0 1; 1 0 0 1 0 1; 1 0 0 1 0 1; 1 1 1 1 1 1]
%  Str_Mat(:,:,4) =
%        	1     0     0     1     0     1
%        	1     0     0     1     0     1
%        	1     0     0     1     0     1
%        	1     1     1     1     1     1
%  Set_Simple_Concept=[0 1]¡¯
%  Index_Xi=2
%  A_Tao=under_A_xi(Str_Mat,Set_Simple_Concept,Index_Xi)
%  A_Tao=
%        	1
%        	2

  Set_Simple_Concept=Set_Simple_Concept(find(Set_Simple_Concept),:);
  A_Tao=find(sum(Str_Mat(:,Set_Simple_Concept,Index_Xi),2)==length(Set_Simple_Concept));
return
