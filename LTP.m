function [ ltp_upper, ltp_lower ] = LTP(img, t)
   
    [n,m]=size(img);
    ltp_upper = zeros(size(img));
    ltp_lower = zeros(size(img));
    
    for i = 2 : n - 1
        for j = 2 : m - 1
            neighbors = double(img(i-1:i+1,j-1:j+1));

            temp = zeros(3, 3);
            
            for q=1:3
                for r=1:3
                  
                    if neighbors(q,r)<img(i,j)-t
                        temp(q,r)=-1;
                    elseif neighbors(q,r)>img(i,j)+t
                        temp(q,r)=1;
                    elseif neighbors(q,r) >= img(i,j)-t & neighbors(q,r) <= img(i,j)+t
                        temp(q,r)=0;
                    end
                  
                end
            end

            upper = temp;
            upper(upper == -1) = 0;
            upper=upper(:);
            upperfin(1)=upper(8);
            upperfin(2)=upper(7);
            upperfin(3)=upper(4);
            upperfin(4)=upper(1);
            upperfin(5)=upper(2);
            upperfin(6)=upper(3);
            upperfin(7)=upper(6);
            upperfin(8)=upper(9);
            
            upper=upperfin;

            lower = temp;
            lower(lower == 1) = 0;
            lower(lower == -1) = 1;
            lower=lower(:);
            lowerfin(1)=lower(8);
            lowerfin(2)=lower(7);
            lowerfin(3)=lower(4);
            lowerfin(4)=lower(1);
            lowerfin(5)=lower(2);
            lowerfin(6)=lower(3);
            lowerfin(7)=lower(6);
            lowerfin(8)=lower(9);
            lower=lowerfin;
            
            ltp_upper(i,j)=bin2dec(char(48+upper));
            ltp_lower(i,j)=bin2dec(char(48+lower));
            
       end
   end