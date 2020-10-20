function similarity = calc_similarity(hist1,hist2)
    similarity = 0; 
    for i=1:256
        if(~(hist1(1,i)==0 && hist2(1,i)==0))
            sum=((hist1(1,i)-hist2(1,i))^2)/(hist1(1,i)+hist2(1,i));
            similarity = similarity + ((hist1(1,i)-hist2(1,i))^2)/(hist1(1,i)+hist2(1,i));
        end
    end
end