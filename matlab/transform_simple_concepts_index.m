function SC_Index=transform_simple_concepts_index(Parameter_Mat)

%  Transform a parameter matrix to simple concept indexes represented by a integer matrix
%  Syntax
%  SC_Index=transform_simple_concepts_index(Parameter_Mat)
%  Description
%  SC_Index=transform_simple_concepts_index(Parameter_Mat) returns a set of labels of the
%  simple concepts in M. And the semantic meanings of the simple concepts in ? are determined by the parameters in Parameter_Mat. 
%  Examples
%  Parameter_Mat=[4.3, 5.8433, 7.9;	NaN, 3.054, 4.4; NaN, NaN, 6.9; NaN,1.1987, 2.5]¡¯
%  Parameter_Ma=
%                	4.3	  	NaN		NaN		NaN
%                	5.8433	3.054	NaN		1.1987
%                	7.9		4.4		6.9		2.5
%  SC_Index=transform_simple_concepts_index(Parameter_Mat)
%  SC_Index=
%                	1	0	0	0
%                	3	7	0	13
%                	5	9	11	15

C=~isnan(Parameter_Mat);
Csize=size(C);
SC_Index=zeros(Csize);
SC_Index(find(C==1))=2*[1:nnz(C)]-1;
return