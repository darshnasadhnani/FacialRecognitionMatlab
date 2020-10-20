
%%%%%%%%%%%% Code to show Pre processing steps %%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('YaleB_32x32.mat');
faceW=32;
faceH = 32;
numPerLine = 11;
ShowLine = 5;

Y = zeros(faceH*ShowLine,faceW*numPerLine);
for i=0:ShowLine-1
   for j=0:numPerLine-1
     Y(i*faceH+1:(i+1)*faceH,j*faceW+1:(j+1)*faceW) = reshape(fea(i*numPerLine+j+1,:),[faceH,faceW]);
     testing=reshape(fea(i*numPerLine+j+1,:),[faceH,faceW]);
   end
end

Y=gamma_correction(Y);
Y=dog_filter(Y,1,2);
Y=contrast_equal(Y,0.1,10);
imagesc(Y);colormap(gray);

%Accuracy checking of my program. 
correct=0;
wrong=0;
for i=1:2414
   image = fea(i,:);
   image=reshape(image,32,32);
   image=uint8(image);
   img_input = image
   accuracy=facial_recognition(img_input,gnd,fea);
   answer=max_accuracy(accuracy);
  if(answer==gnd(i))
      correct=correct+1;
  else
      wrong=wrong+1;
  end
end
result_accuracy=correct/(correct+wrong);
fprintf("The total accuracy is %d",result_accuracy);

