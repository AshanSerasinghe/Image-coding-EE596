function b = divide_image_into_blocks(img , window_size)

    s = size(img);
    h = s(1);
    w = s(2);
    
    window_size_h = window_size(1);
    window_size_w = window_size(2);
    
    num_h = floor(h/window_size_h);
    num_w = floor(w/window_size_w);
    
    if (h - num_h == 0) && (w-num_w == 0)
        Cell_Array = cell(window_size_h , window_size_w);
    elseif (h - num_h == 0) && (w-num_w ~= 0)
        Cell_Array = cell(window_size_h , window_size_w+1);
    elseif (h - num_h ~= 0) && (w-num_w == 0)
        Cell_Array = cell(window_size_h+1 , window_size_w);
    else
        Cell_Array = cell(window_size_h+1 , window_size_w+1);
    end
    
    
    start_h = 1;
    for m = 1:num_h
        start_w = 1;
        for n = 1:num_w           
           img_part = img(start_h:start_h+window_size_h-1 , start_w:start_w+window_size_w-1);
           start_w = start_w + window_size_w;
           
           Cell_Array{m, n} = img_part;
        end
        start_h = start_h + window_size_h; 
    end
    
    
    
    b = Cell_Array;
end