A = load("B_field.dat");

index = 0;

for i = 1:size(A)(1)
  index++;
  if ( A(i,2) < 0 )
    break;
  endif
endfor

index += sum(A(:,2)<0)
