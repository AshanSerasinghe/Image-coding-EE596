function v = runlength_decoding(x)
    
    y=[];
    for i=1:2:length(x)
        y=[y x(i)];
    end
    z=[];
    for i=2:2:length(x)
        z=[z x(i)];
    end
    v=[];
    for i=1:length(y)
        m=y(i);
        q=z(i);
        for j=1:m
            v=[v q];
        end
    end

end