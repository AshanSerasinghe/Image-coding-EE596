function quantized_block = quantize_DCT_coeff(cell_block , quantization_factor)
%     q = (mx-mi)/2^B;
%     q_flag = 0;
%     for i = 1:2^B
%         if pix<=q*i
%             v = q*(i-1) + q/2;
%             q_flag = 1;
%             break
%         end
%     
%     end
%     
%     if q_flag == 0
%         v = q*(2^B -1)+ q/2;
%     end
%     
%     v = floor(v); 
    stdJpeg_mat = [16 11 10 16 24 40 51 61;...
        12 12 14 19 26 58 60 55;...
        14 13 16 24 40 57 69 56;...
        14 17 22 29 51 87 80 62;...
        18 22 37 56 68 109 103 77;...
        24 35 55 64 81 104 113 92;...
        49 64 78 87 103 121 120 101;...
        72 92 95 98 112 100 103 99];
    
    quantized_block = ceil( cell_block./(stdJpeg_mat*quantization_factor ));
    
    
end