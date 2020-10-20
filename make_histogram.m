function histogram_result=make_histogram(img_input)  
    LBPHistogram=zeros(1,256);
    for i =1:size(img_input,1)
        for k = 1:size(img_input,2)
            LBPHistogram(1,img_input(i,k)+1)=LBPHistogram(1,img_input(i,k)+1)+1;
        end
    end
    histogram_result=LBPHistogram;
end