function N=negateEI(M)

%  Find the negation of an EI element. 
%  Syntax
%  N=negateEI(M)
%  Description
%  N=negateEI(M) find the logical negation of an EI element: M, according to formula (3), where m2*i stands for the negation of the simple concept m2*i-1.
%  Examples
%  M = [0,1,3,6; 0,0,5,9]¡¯
%  M=
%     	0	0
%     	1	0
%     	3	5
%     	6	9
%  N=negateEI(M)
%  N=
%     	0	0	0	0	0	0
%     	2	4	5	2	4	5
%     	6	6	6	10	10	10

 Bool_M=tran_bool(M);
 Bool_M=reduceEI_bool(Bool_M);
 Msize=size(M);
 Bool_Msize=size(Bool_M);

for i=1:Msize(2)
    for j=1:Msize(1)
      if M(j,i)==0
          continue
      elseif mod(M(j,i),2)==1
              M(j,i)=M(j,i)+1;
      else
             M(j,i)=M(j,i)-1;
      end   
    end
end    

T=M(:,1)';
Bool_N=tran_bool(T(:,find(T)));

for j=2:Bool_Msize(2)
    T=M(:,j)';
    Bool_N=mult_bool(reduceEI_bool(Bool_N),tran_bool(T(:,find(T))),1);
end

N=tran_EI_mat(reduceEI_bool(Bool_N));
return
    