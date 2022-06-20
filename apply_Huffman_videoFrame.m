function [HaffCode , dict] = apply_Huffman_videoFrame(cell_img)
    
    % this function generate the Huffman code of a given data set
    % thit should be apply on each cell of the full image 
    % this is a universal Huffman tabel for the video frames
    
    mat = cell2mat(cell_img);
    s = size(mat);
    row_vector = reshape( mat, 1, s(1)*s(2) );
    % |_*|_2|_|_|_|
    % |_1|_#|_|_|_| == [* 1 2 #]
    % not an image. image is disorded. Need to decode same way
    
    
    
    % construct the probabiity vector P
    unique_values = unique(row_vector);
    
    posible_symbols = 0:255; % why -255 gives error?
    syms_not_present = setdiff(posible_symbols , unique_values);
    row_vector_updated = [row_vector , syms_not_present]; % add only one value
    
    
    unique_values_updated1 = [unique_values , syms_not_present];
    num_of_elem = length(row_vector_updated);
    P = zeros(1 , length(unique_values_updated1));
    
    
    i = 1;
    % findin the probability of each symbol
    for u = unique_values_updated1
        P(i) = sum(row_vector_updated == u)/num_of_elem;
        i = i+1;
    end
    
    
    sum(P)
    
    % take the Huffman code of the given image clock
    dict = huffmandict(unique_values_updated1 , P );
    HaffCode = huffmanenco(row_vector , dict);

end