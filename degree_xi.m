function f=degree_xi(Lou_Mat,Str_Mat,Fuzzy_Set,Index_Xi,Logic_Ind)

%  Find the membership degree on a fuzzy set
%  Syntax
%  f=degree_xi(Lou_Mat,Str_Mat,Fuzzy_Set,Index_Xi,Logic_Ind)
%  Description
%  f=degree_xi(Lou_Mat,Str_Mat,Fuzzy_Set,Index_Xi,Logic_Ind) returns the membership degree of the sample labeled by Index_Xi belonging to the fuzzy concept (in EM ) represent by matrix Fuzzy_Set in the AFS structure represented by the 3-demension Boolean matrix Str_Mat. The weight functions of the simple concepts in M are represented by Lou_Mat, for detail, Lou_Mat(i, j)=?mj(xi). Logic_Ind =1, the function returns the membership degree defined by formula (19); Logic_Ind =2, the function returns the membership degree defined by formula (20).
%  Examples
%  Str_Mat(:,:,1)=[1 1 1 1 1 1; 0 1 1 0 0 1; 0 1 1 0 0 1; 0 1 1 0 1 0]
%  Str_Mat(:,:,1)=
%              1     1     1     1     1     1
%              0     1     1     0     0     1
%              0     1     1     0     0     1
%              0     1     1     0     1     0
%  Str_Mat(:,:,2)=[1 0 0 1 1 0; 1 1 1 1 1 1; 0 1 1 0 0 1; 0 1 1 0 1 0]
%  Str_Mat(:,:,2)=
%              1     0     0     1     1     0
%              1     1     1     1     1     1
%              0     1     1     0     0     1
%              0     1     1     0     1     0
%  Str_Mat(:,:,3)=[1 0 0 1 1 0; 1 0 0 1 1 0; 1 1 1 1 1 1; 0 1 1 0 1 0]
%  Str_Mat(:,:,3)=
%              1     0     0     1     1     0
%              1     0     0     1     1     0
%              1     1     1     1     1     1
%              0     1     1     0     1     0
%  Str_Mat(:,:,4) =[1 0 0 1 0 1; 1 0 0 1 0 1; 1 0 0 1 0 1; 1 1 1 1 1 1]
%  Str_Mat(:,:,4) =
%              1     0     0     1     0     1
%              1     0     0     1     0     1
%              1     0     0     1     0     1
%              1     1     1     1     1     1
%  Lou_Mat=[0,1,1,0,0.1667,0.83333; 0.2727,0.7273,0.7273,0.2727,0.6667,0.3333;  0.5455,0.4545,0.4545,0.5455,0.8333,0.1667; 1,0,0,1,0,1]
%  Lou_Mat=
%              0		1		1		0		0.1666	0.8333
%              0.2727	0.7273	0.7273	0.2727	0.6667	0.3337
%              0.5455	0.4545	0.4545	0.5454	0.8333	0.1667
%              1		0		0		1		0		1
%  f=degree_xi(Lou_Mat,Str_Mat,[0 1; 0 3]',2,1)
%  f=0.5417

Total=sum(Lou_Mat);
Result=0;
for k=1:size(Fuzzy_Set,2)
    Concept=Fuzzy_Set(:,k);
    Concept=Concept(find(Concept),:);
    if Logic_Ind==1
        A_Tao=under_A_xi(Str_Mat,Concept,Index_Xi);
        TT=sum(Lou_Mat(A_Tao,Concept))./Total(1,Concept);
        Result=max(Result,prod(TT));
    elseif Logic_Ind==2
        A_Tao=under_A_xi(Str_Mat,Concept,Index_Xi);
        TT=sum(Lou_Mat(A_Tao,Concept))./Total(1,Concept);
        Result=max(Result,min(TT));
    else
        TT=1;
        for i=1:size(Concept,1)
            T=find(Str_Mat(:,Concept(i),Index_Xi));
            TT=min(TT,sum(Lou_Mat(T,Concept(i)))/Total(1,Concept(i)));
        end
            Result=max(Result,TT);
    end
end
f=Result;
return
