function result = gamma_correction(img)
  img = double(img);
 [n,m]=size(img); 
 result=zeros(n,m);
 for i=1:n
     for j=1:m
            result(i,j)=img(i,j)^0.2;
     end
   end
end
