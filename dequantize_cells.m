function dequantized_cells = dequantize_cells(cell_img , quantization_factor)
    hxw_cells = size(cell_img);
    h_cells = hxw_cells(1); 
    w_cells = hxw_cells(2);
    
    dequantized_cells = cell(hxw_cells);
    
    for m = 1:h_cells
        for n = 1:w_cells
           img_block = cell_img{m,n};
           
           dequantized_block = dequantize_DCT_coeff(img_block , quantization_factor);
           dequantized_cells{m,n} = dequantized_block;
             
        end
        
    end

end