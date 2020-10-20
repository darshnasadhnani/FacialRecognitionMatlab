function accuracy=facial_recognition(img_input,gnd,fea)

k=1;
M=tabulate(gnd);
%choosing one image per subject to do recognition testing. 
image_numbers=[1,65,129,193,257,321,385,449,513,577,645,705,766,826,889,952,1015,1078,1142,1206,1270,1334,1398,1462,1526,1590,1654,1718,1782,1846,1910,1974,2038,2102,2170,2230,2294,2358];
%pre processing img input 
img_input=uint8(img_input);
img_input=gamma_correction(img_input);
img_input=dog_filter(img_input,1,2);
img_input=contrast_equal(img_input,0.1,10);


similarity_percentage=zeros(38,1);

for i=1:38
        image = fea(image_numbers(i),:);
        image=reshape(image,32,32);
        image=uint8(image);
        image=gamma_correction(image);
        image=dog_filter(image,1,2);
        image=contrast_equal(image,0.1,10);
        
        [n,m]=size(image);
        total_sim=0;
        count=0;
        region=4;
        for row=1:region:n
            for col=1:region:m
                    temp_img=image(row:row+region-1,col:col+region-1);
                    temp_img_input=img_input(row:row+region-1,col:col+region-1);
                    [imgupper_input,imglower_input]=LTP(temp_img_input,0.1);
                    [imgupper,imglower]=LTP(temp_img,0.1);
                    InputHistogram1=make_histogram(imgupper_input);
                    InputHistogram2=make_histogram(imglower_input);
                    LBPHistogram1=make_histogram(imgupper);
                    LBPHistogram2=make_histogram(imglower);
                    InputHistogram1=InputHistogram1/16;
                    InputHistogram2=InputHistogram2/16;
                    LBPHistogram1=LBPHistogram1/16;
                    LBPHistogram2=LBPHistogram2/16;
                    sim1=calc_similarity(InputHistogram1,LBPHistogram1);
                    sim2 = calc_similarity(InputHistogram2,LBPHistogram2);
                    similarity=1-(sim1+sim2)/2;
                    total_sim=total_sim+similarity;
                    count=count+1;
                
            end
        end
        
        total_sim=total_sim/count;
        similarity_percentage(i,1)=total_sim;
    end
accuracy=similarity_percentage;
end