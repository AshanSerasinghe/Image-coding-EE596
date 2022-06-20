function [resedula , motion] = estimate_the_best_match(img_cell, block , pos)
    
    % input cell position not x,y coordinates. That is internally handled 
    img = cell2mat(img_cell);
    
    % serch on nearby nodes
    best_matched = uint8(ones(8,8)*255); best_pos = []; dif_previous = inf;
    x = pos(2);
    y = pos(1);
    
    error_flag1 = 0;
    
    
    s = size(img);
    h_img = s(1); w_img = s(2);
    
    if (x-8)>0 && (y-8)>0 && (x+16)<=w_img && (y+16)<=h_img % 1
        x_start = x-4; x_end = x+4; y_start = y-4; y_end = y+4;
    elseif (x-8)<=0 && (y-8)<=0 && (x+16)<=w_img && (y+16)<=h_img %2
        x_start = x; x_end = x+4; y_start = y; y_end = y+4;
    elseif (x-8)>0 && (y-8)<=0 && (x+16)<w_img && (y+16)<h_img %3
        x_start = x-4; x_end = x+4; y_start = y; y_end = y+4;
    elseif (x-8)>0 && (y-8)<=0 && (x+16)>w_img && (y+16)<h_img %4
        x_start = x-4; x_end = x; y_start = y; y_end = y+4;
    elseif (x-8)<=0 && (y-8)<=0 && (x+16)<w_img && (y+16)<h_img %5
        x_start = x; x_end = x+4; y_start = y-4; y_end = y+4;
    elseif (x-8)>0 && (y-8)>0 && (x+16)<=w_img && (y+16)>h_img %6
        x_start = x-4; x_end = x+4; y_start = y-4; y_end = y;
    elseif (x-8)<=0 && (y-8)>0 && (x+16)<=w_img && (y+16)>h_img %7
        x_start = x; x_end = x+4; y_start = y-4; y_end = y;
    elseif (x-8)>0 && (y-8)>0 && (x+16)>w_img && (y+16)>h_img %8
        x_start = x-4; x_end = x; y_start = y-4; y_end = y;
    elseif (x-8)>0 && (y-8)>0 && (x+16)<=w_img && (y+16)>h_img %9 == 6
        x_start = x-4; x_end = x+4; y_start = y-4; y_end = y;
    elseif (x-8)>0 && (y-8)>0 && (x+16)>w_img && (y+16)<=h_img %10
        x_start = x-4; x_end = x; y_start = y-4; y_end = y+4;
    else
        x_start = x; x_end = x; y_start = y; y_end = y;
        error_flag1 = 1;
        
    end
    
    
    for j=0:(x_end-x_start)
        for i=0:(y_end-y_start)
            
            x = x+j;    y = y+i;
            error_flag2 = 0;

            try
                search = img(y_start+j:y_start+j+7 ,  x_start+i:x_start+i+7 );     
            catch
                disp("Error!");
                error_flag2 = 1;
            end
            
            
            
            
            dif = sum( sum(abs(search - block)) );
            if dif< dif_previous
                dif_previous = dif;
                best_matched = search;
                best_pos = [x , y]; % matrix form
            end
            
        end
    end
    
    if error_flag1 ==1 || error_flag2 == 1
        best_pos = [pos(1) , pos(2)]; % matrix form
        best_matched = img( pos(2)+j: pos(2)+j+7 ,  pos(1)+i:pos(1)+i+7 );
    end
    
    %best_matched
    resedula = best_matched - block;
    motion = [ pos(1)-best_pos(1) , pos(2)-best_pos(2) ]; % matrix form
    
    %disp("[x,y]"); disp([x,y]);
    %disp("[x_s,y_s]"); disp([x_start,y_start]);
    %error_flag1
    %error_flag2
end