function [SCIndex,ConceptFeatureIndex,ConceptIndexValue]=ConceptFeature(ParameterMat)
%ParameterMat:
%is a matrix to special each cutpoint on the feature. i.e.,
%ParameterMat(1,i), ParameterMat(2,i),...,ParameterMat(k,i) are the cutpoints on feature i, ParameterMat(l,i) means the 2l-1 th fuzzy concept
%on feature i impyies that the samples whose feature value i is about ParameterMat(l,i) while 2l the fuzzy concept is far away from ParameterMat(l,i). If you want specialize h simple concepts on feature
% i and h <k, then ParameterMat(h+1,i)=NaN,...,ParameterMat(k,i)=NaN,

%SCIndex:
%is a matrix which is the same size as ParameterMat. matrix(:,i) is the
%indexings of the simple concepts on feature i

%ConceptFeatureIndex:
% is a vector to indicate the feature of a given indexing of a simple
% concept.

% if you want to know the meaning of the simple concept, you can type "ParameterMat(find(SCIndex==8))" 
% where "8" is a example of the index of the eighth simple concept.
C=~isnan(ParameterMat);
SCIndex=zeros(2*size(C,1),size(C,2));
C=kron(C,[1;1]);
Temp=find(C);
ConceptFeatureIndex=ceil(Temp./size(C,1));
SCIndex(Temp)=1:nnz(C);

tran=kron(ParameterMat,[1;1]);

ConceptIndexValue=tran(find(~isnan(tran)));
return