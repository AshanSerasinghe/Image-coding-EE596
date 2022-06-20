function iDCT_Cells = inverse_dct2D_cells(block_cells)

    hxw_cells = size(block_cells);
    h_cells = hxw_cells(1); 
    w_cells = hxw_cells(2);
    
    iDCT_Cells = cell(h_cells , w_cells); 
    
    for m = 1:h_cells
        for n = 1:w_cells
           iDCT_Cells{m,n}  = idct2( block_cells{m,n} );
        end
        
    end

end