function quantized_cells = quatize_cells(cell_img , quantization_factor)

    hxw_cells = size(cell_img);
    h_cells = hxw_cells(1); 
    w_cells = hxw_cells(2);
    
    quantized_cells = cell(hxw_cells);
    
    for m = 1:h_cells
        for n = 1:w_cells
           img_block = cell_img{m,n};
           
           quantized_block = quantize_DCT_coeff(img_block, quantization_factor);
           quantized_cells{m,n} = quantized_block;
             
        end
        
    end
    
end