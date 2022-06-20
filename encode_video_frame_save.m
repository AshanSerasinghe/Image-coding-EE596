function encode_video_frame_save(video_buff, algo)
    buff_size = size(video_buff);
    
    for i = 1:(buff_size-1)
        [res_img, motion_cell_h , motion_cell_w] = estimate_motion(video_buff{1,i}, video_buff{1,i+1});
        
        if strcmp(algo , "Huffman")
           [HaffCode ,x_] = apply_Huffman_videoFrame(res_img);
           
           %save the code into a dat file
           fid = fopen( strcat("video_dat/R" , string(i) , ".dat"),'wt');
           for col = 1 : length(HaffCode)
               fprintf(fid, '%d', HaffCode(1, col));
           end
           fclose(fid);
           
           fid = fopen( strcat("video_dat/M_h" , string(i) , ".dat"),'wt');
           for col = 1 : length(motion_cell_h)
               fprintf(fid, '%d', motion_cell_h(1, col));
           end
           fclose(fid);
           
           fid = fopen( strcat("video_dat/M_w" , string(i) , ".dat"),'wt');
           for col = 1 : length(motion_cell_w)
               fprintf(fid, '%d', motion_cell_w(1, col));
           end
           fclose(fid);
           
        end
    end
    
    [I_frame_code , dict] = apply_Huffman_videoFrame(video_buff{1,1}); 
    
    fid = fopen( strcat("video_dat/M_h" , string(i) , ".dat"),'wt');
    for col = 1 : length(motion_cell_h)
        fprintf(fid, '%d', motion_cell_h(1, col));
    end
    fclose(fid);
    
    


end