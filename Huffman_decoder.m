function img = Huffman_decoder(huffan_array , dict , x, y)

    out = huffmandeco(huffan_array,dict);
    img = reshape(out, x , y);
    
end