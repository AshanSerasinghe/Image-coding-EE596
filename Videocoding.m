v = VideoReader('sampleVideo.mp4');

%currAxes = axes;
video_buff = cell(1,50);
i = 1;
while hasFrame(v)
    if i<50
        vidFrame = readFrame(v);
        %vidFrame = vidFrame(:,:,2); %rgb2gray(vidFrame);
        %     image(vidFrame, 'Parent', currAxes);
        %     currAxes.Visible = 'off';
        %     pause(1/v.FrameRate); i = i+1;
     

        % devide the image into blocks
        block_cells = divide_image_into_blocks(vidFrame , [8,8]);
        video_buff{1,i} = block_cells;
        i = i+1;
    else
        break;
    end
    
end


I_frame = video_buff{1,1};


P_frame_1 = video_buff{1,2};
P_frame_1 = P_frame_1{1,1};


[res_img,motion_cell] = estimate_motion(video_buff{1,1}, video_buff{1,2});
    

















