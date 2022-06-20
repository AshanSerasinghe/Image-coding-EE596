function [dc , dc_removed] = take_DC_dct(dct_q_cells)
    
    % Tiis function returns dc value as a cell array and also the transformed quantized 
    % array without the dc value. DC value has replaced with zero
    
    hxw_cells = size(dct_q_cells);
    h_cells = hxw_cells(1); 
    w_cells = hxw_cells(2);
    
    dc_removed = cell(hxw_cells);
    dc = cell(hxw_cells);
    
    
    for m = 1:h_cells
        for n = 1:w_cells
           img_block = dct_q_cells{m,n};  % this is a nxn block                
           dc{m,n} = img_block(1,1); % single value is assign to a cell array
           
           img_block(1,1) = 0;
           dc_removed{m,n} = img_block;  
        end
        
    end

end