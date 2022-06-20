function [HaffCode , dict] = apply_Huffman_cells(cell_img)

    % this function tales the Huffman code of a given data set
    % thit should be apply on each cell of the full image 
    
    mat = cell2mat(cell_img);
    s = size(mat);
    row_vector = reshape(mat, 1, s(1)*s(2));
    % |_*|_2|_|_|_|
    % |_1|_#|_|_|_| == [* 1 2 #]
    % not an image. image is disorded. Need to decode same way
   
    
    % construct the probabiity vector P
    unique_values = unique(row_vector);
    num_of_elem = length(row_vector);
    P = zeros(1 , length(unique_values));
    i = 1;
    
    % findin the probability of each symbol
    for u = unique_values
        P(i) = sum(row_vector == u)/num_of_elem;
        i = i+1;
    end
    
    
    % take the Huffman code of the given image clock
    dict = huffmandict(unique_values, P);
    HaffCode = huffmanenco(row_vector , dict);
        
end