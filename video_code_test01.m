clear;close

quantization_factor = 0.2;

img = imread('barbara.png');
figure(1);
imshow(img)

% divde into 8x8 blocks
block_cells = divide_image_into_blocks(img , [8,8]);
hxw_cells = size(block_cells);
h_cells = hxw_cells(1); 
w_cells = hxw_cells(2); 

% remove 128 by all values to avoid negative values on dct
%shifted_img_cell = shift_by_128(block_cells);

% apply DCT
DCT_Cells = dct2D_cells(block_cells);
% figure(2)
% imshow( cell2mat(DCT_Cells) );



% quantize using standard JPEG matrix
Qcell_result = quatize_cells(DCT_Cells , quantization_factor);

% figure(3)
% imshow( cell2mat(Qcell_result) );

% remove the DC value from the 8x8 DCT blockes
[dc , dc_removed] = take_DC_dct(Qcell_result);

% shift negative values
%[MIN , cell_negative_shifted] = shift_nagativeVals(dc_removed);

% apply Haffman code to the image
[HaffCode_img , dict_img] = apply_Huffman_videoFrame(dc_removed);%     apply_Huffman_cells

% apply Haffman code to the dc part
[HaffCode_dc , dict_dc] = apply_Huffman_cells(dc);

% save the bit stream
f_num_dc = 1;
save_to_dat(f_num_dc ,dict_img, dict_dc, HaffCode_img, HaffCode_dc);

%==========================================================================
% read the dat
% somehow read
%==========================================================================

HaffCode_dc_deco = HaffCode_dc;
dict_dc_deco = dict_dc;

HaffCode_img_deco = HaffCode_img;
dict_img_deco = dict_img;

decoded_img = Huffman_decoder(HaffCode_img_deco , dict_img , 512, 512);
% figure()
% imshow(decoded_img);

decoded_dc = Huffman_decoder(HaffCode_dc_deco , dict_dc_deco , 64, 64);
% figure()
% imshow(decoded_dc);


dc_added = dc_add_cell(decoded_img , decoded_dc);
% figure()
% imshow(cell2mat(dc_added));

deQ_dct_coeff = dequantize_cells(dc_added , quantization_factor);

% apply invese dct and reconstuct the image
recon_img_cell = inverse_dct2D_cells(deQ_dct_coeff);
recon_img = uint8(cell2mat( recon_img_cell ));
figure()
imshow( recon_img )

% applying Smoothing filter
% Filter the image with isotropic Gaussian smoothing kernels of increasing standard deviations.
Iblur1 = imgaussfilt(recon_img , 1.5);
figure()
imshow(Iblur1);



