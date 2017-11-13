function Str_Mat=gen_structure(Data_Mat,Parameter_Mat)

%  Generate an AFS structure from the given original data and parameter matrix.
%  Syntax
%  Str_Mat=gen_structure(Data_Mat,Parameter_Mat)
%  Description
%  Str_Mat=gen_structure(Data_Mat,Parameter_Mat)returns an AFS structure (?, ?, X) 
%  by the semantic meanings with the parameters in Parameter_Mat and the original 
%  data in Data_Mat. The semantic meanings of the simple concepts in ? are determined by the parameters in Parameter_Mat. 
%  Examples
%  Data_Mat= [6.5,6.2,5.9,5.4]¡¯
%  Parameter_Mat= [5.4,6.5,6.0]¡¯
%  Str_Mat=gen_structure(Data_Mat,Parameter_Mat)
%  Str_Mat(:,:,1)=
%              1     1     1     1     1     1
%              0     1     1     0     0     1
%              0     1     1     0     0     1
%              0     1     1     0     1     0
%  Str_Mat(:,:,2)=
%              1     0     0     1     1     0
%              1     1     1     1     1     1
%              0     1     1     0     0     1
%              0     1     1     0     1     0
%  Str_Mat(:,:,3)=
%              1     0     0     1     1     0
%              1     0     0     1     1     0
%              1     1     1     1     1     1
%              0     1     1     0     1     0
%  Str_Mat(:,:,4)=
%              1     0     0     1     0     1
%              1     0     0     1     0     1
%              1     0     0     1     0     1
%              1     1     1     1     1     1

P_Mat_Size=size(Parameter_Mat);
D_Mat_Size=size(Data_Mat);

if P_Mat_Size(2)~=D_Mat_Size(2)
    error('the column numbers of the matrices do not match.')
end

Feature_Parameter_Index=~isnan(Parameter_Mat);
SC_Index=transform_simple_concepts_index(Parameter_Mat);

for i=1:D_Mat_Size(1)    
    Repxi=repmat(Data_Mat(i,:),D_Mat_Size(1),1);
    for p=1:size(Feature_Parameter_Index,1)
        Is1_Index=find(Feature_Parameter_Index(p,:));
        Rep_PMatp=repmat(Parameter_Mat(p,Is1_Index), D_Mat_Size(1),1);
        Logicv=abs(Repxi(:,Is1_Index)-Rep_PMatp)<=abs(Data_Mat(:,Is1_Index)-Rep_PMatp);
        Neg_Logicv=abs(Repxi(:,Is1_Index)-Rep_PMatp)>=abs(Data_Mat(:,Is1_Index)-Rep_PMatp);
        Str_Mat(:,SC_Index(p,Is1_Index),i)=Logicv;
        Str_Mat(:,SC_Index(p,Is1_Index)+1,i)=Neg_Logicv;
    end
end
return
