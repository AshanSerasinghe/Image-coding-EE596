function [res_img,motion_cell_h , motion_cell_w] = estimate_motion(img1_cell, img2_cell)
    
    s = size(img2_cell); h = s(1); w = s(2);
    res_img = cell(h, w);
    motion_cell_h = cell(h,w);
    motion_cell_w = cell(h,w);
    
    for m = 1:h
        for n = 1:w
           block = img2_cell{h,w};
           [resedula , motion] = estimate_the_best_match( img1_cell , block , [m,n]);
           res_img{m,n} = resedula;
           motion_cell_h{m,n} = motion(1); %matix form 
           motion_cell_w{m,n} = motion(2); %matix form 
        end   
    end

    
    
end