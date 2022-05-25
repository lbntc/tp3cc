function [ Z ] = zigzag( M )
Z=[];
for i=1:2:8
    for j=1:i
        Z=[Z M(i-j+1, j)];
    end
    for j=1:i+1
        Z=[Z M(j, i-j+2)];
    end
end
for i=2:2:8
    for j=1:(9-i)
        Z=[Z M(9-j,i+j-1)];
    end
    for j=1:(8-i)
        Z=[Z M(i+j, 9-j)];
    end
end

end

