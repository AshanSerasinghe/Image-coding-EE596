function save_to_dat(f_num , dict1, dict2, data1, data2)
    %save the code into a dat file
    fid = fopen( strcat("A" , string(f_num) , ".dat"),'wt');
    
    
    for col = 1 : length(dict1)
        [a,b] = dict1{col,:};
        fprintf(fid, '%d %d \n' , a, str2double( sprintf('%d', b) ) );
    end
    fclose(fid);
    
    
    %save the code into a dat file
    fid = fopen( strcat("B" , string(f_num) , ".dat"),'wt'); 
    for col = 1 : length(dict2)
        [a,b] = dict2{col,:};
        fprintf(fid, '%d %d \n', a, str2double( sprintf('%d', b) ) );
    end
    fclose(fid);
    
    
    
    %save the code into a dat file
    fid = fopen( strcat("C" , string(f_num) , ".dat"),'wt');
    for col = 1 : length(data1)
        fprintf(fid, '%d', data1(1, col));
    end
    fclose(fid);
    
    %save the code into a dat file
    fid = fopen( strcat("D" , string(f_num) , ".dat"),'wt');
    for col = 1 : length(data2)
        fprintf(fid, '%d', data2(1, col));
    end
    fclose(fid);
    
    
end