function result_img=contrast_equal(img,a,t)
  
  [n,m]=size(img); 
  first_sum=0;
  for i=1:n
      for j=1:m
          first_sum=first_sum+abs(img(i,j))^a;
      end
  end
  
  first_mean=first_sum/(n*m);
  first_factor=abs(first_mean)^(1/a);
   
   [n,m]=size(img);
   result_img1=zeros(n,m);
   sum=0;
   for i=1:n
       for j=1:m
           result_img1(i,j)=img(i,j)/first_factor;
       end
   end
   
  second_sum=0;
  for i=1:n
      for j=1:m
          %find minimum between t and result_img1
          temp=min(t,result_img1(i,j));
          second_sum = second_sum + abs(temp)^(a);
      end
  end
  
  second_mean = second_sum/(n*m); 
  second_factor=second_mean^(1/a);
  result_img=zeros(n,m);
  for i=1:n
      for j=1:m
          result_img(i,j)=result_img1(i,j)/second_factor;
          result_img(i,j)=t*tanh(result_img(i,j)/t);
      end
  end
end
