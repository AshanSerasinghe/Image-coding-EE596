function [MIN , cell_negative_shifted] = shift_nagativeVals(cell_q_coeff)
    % shift minus values to positive values
    dc_removed_mat = cell2mat(cell_q_coeff);
    MIN  = min( min(dc_removed_mat) );
    
    if MIN<0
        hxw_cells = size(cell_q_coeff);
        h_cells = hxw_cells(1);
        w_cells = hxw_cells(2);
        cell_negative_shifted = cell(hxw_cells);
        
        for m = 1:h_cells
            for n = 1:w_cells
                negative_shifted_block = cell_q_coeff{m,n} + abs(MIN);
                cell_negative_shifted{m,n} = negative_shifted_block;
            end
        end
        
        
        MIN = min( min(dc_removed_mat) );
        
    else
        cell_negative_shifted = cell_q_coeff;
        MIN = 0;
    end
    
    
end