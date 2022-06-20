function cell_negative_shifted = shift_by_128(cell_img)

    % shift minus values to positive values  
    hxw_cells = size(cell_img);
    h_cells = hxw_cells(1);
    w_cells = hxw_cells(2);
    cell_negative_shifted = cell(hxw_cells);

    for m = 1:h_cells
        for n = 1:w_cells
            negative_shifted_block = cell_img{m,n} - 128;
            cell_negative_shifted{m,n} = negative_shifted_block;
        end
    end
        
        
end



