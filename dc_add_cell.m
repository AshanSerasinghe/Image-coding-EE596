function dc_added = dc_add_cell(img_mat , dc_mat)
    % =============================================================
    dct_q_cells = divide_image_into_blocks(img_mat , [8, 8]);
    % =============================================================
    hxw_cells = size(dct_q_cells);
    h_cells = hxw_cells(1); 
    w_cells = hxw_cells(2);
    
    dc_added = cell(hxw_cells);
    
    
    
    for m = 1:h_cells
        for n = 1:w_cells
           img_block = dct_q_cells{m,n};  % this is a nxn block           
           img_block(1,1) = dc_mat(m, n);
           dc_added{m,n} = img_block;  
        end
        
    end

end