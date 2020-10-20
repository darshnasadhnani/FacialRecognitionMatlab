function filtered_image = dog_filter(img,sigma1,sigma2)
    img1=imgaussfilt(img,sigma1);
    img2=imgaussfilt(img,sigma2);
    filtered_image=img1-img2;
end