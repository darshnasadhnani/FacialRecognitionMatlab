function answer=max_accuracy(similarity_percentage)
max_index=0;
maximum=0;
for i=1:38
    if maximum<=similarity_percentage(i)
        maximum=similarity_percentage(i);
        max_index=i;
    end
end
answer=max_index;
end