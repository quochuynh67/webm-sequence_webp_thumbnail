
#! /bin/bash

### Folder structure
### --- frames_webm
### --- transitions_webm
### --- overlays_webm
### --- convert_webm_to_images_sequence.sh

TYPE_11=' 11'
TYPE_169=' 169'
TYPE_916=' 916'
FPS = 30
mainmenu () {


echo '#################################################################################################################################'
echo '##### Mày muốn chuyển từ webm sang webp cho cái gì?'
echo '##### Press 1 to convert STICKER'
echo '##### Press 2 to convert TRANSITION'
echo '##### Press 3 to convert FRAME'
#echo '##### Press 4 to convert Title'
#echo '##### Press 5 to convert All'
echo '#################################################################################################################################'

        read -n 1 -p "Input Selection:" mainmenuinput
        if [ "$mainmenuinput" = "1" ]; then
                #################################################################################################################################
                ###                                                       STICKER                                                             ###
                #################################################################################################################################

                echo '#################################################################################################################################'
                echo '###                                                       STICKER                                                             ###'
                echo '#################################################################################################################################'
                echo "[Sticker] ------------- converting..."

                stickersFolderPathInput=`pwd`'/stickers_webm/ST*KER_*.webm'
                echo "Sticker folder path: $stickersFolderPathInput"

                stickerFolderPathOutput=`pwd`'/output_overlays'

                ### Create and prepare folder for each STICKER
                echo "Create and prepare STICKER output folders."

                for file in $stickersFolderPathInput
                do
                    f="$(basename $file .webm)"
                    file_name=${f[0]}
                    arrIN=(${file_name//./ })
                    folder=${arrIN[0]}

                    sub_folder=$stickerFolderPathOutput/$folder
                    mkdir -p $sub_folder
                    echo "sub_folder $sub_folder"

                done

                ## Start ffmpeg converting
                ## '-c:v libvpx-vp9 -i "${file.path}" -vf fps=30 "${framesDir.path}/frame_%d.png" -y'
                for file in $stickersFolderPathInput
                do
                    f="$(basename $file .webm)"
                    file_name=${f[0]}

                    sub_folder=$stickerFolderPathOutput/$file_name
                    echo "HAHA >>> $sub_folder"
                    ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=$FPS,scale=480:480  "$sub_folder"/frame_%d.png

                done
                echo "[Sticker]  ------------- finished"
            
        elif [ "$mainmenuinput" = "2" ]; then
                #################################################################################################################################
                ###                                                       TRANSITION                                                          ###
                #################################################################################################################################
                echo "[Transitions] ------------- converting..."
                echo '#################################################################################################################################'
                echo '###                                                       TRANSITION                                                          ###'
                echo '#################################################################################################################################'

                transitionFolderPathInput=`pwd`'/transitions_webm/*TRANSITION_*.webm'
                echo "Transition folder path: $transitionFolderPathInput"

                transitionFolderPathOutput=`pwd`'/output_transitions'

                ### Create and prepare folder for each TRANSITION
                echo "Create and prepare FRAME output folders."

                for file in $transitionFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}

                    sub_folder11=$transitionFolderPathOutput/$file_name'_ratio_1_1'
                    mkdir -p $sub_folder11
                        echo "sub_folder11 $sub_folder11"

                    sub_folder916=$transitionFolderPathOutput/$file_name'_ratio_9_16'
                    mkdir -p $sub_folder916
                    echo "sub_folder916 $sub_folder916"

                    sub_folder169=$transitionFolderPathOutput/$file_name'_ratio_16_9'
                    echo "sub_folder169 $sub_folder169"
                    mkdir -p $sub_folder169
                done

                ### Start ffmpeg converting
                ### '-c:v libvpx-vp9 -i "${file.path}" -vf fps=30 "${framesDir.path}/frame_%d.png" -y'
                for file in $transitionFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}

                    case $file in

                    *"$TYPE_11"*)
                            sub_folder11=$transitionFolderPathOutput/$file_name'_ratio_1_1'
                            #./ffmpeg-5.0.1-full_build/bin/ffmpeg.exe -c:v libvpx-vp9 -i "$file" -vf fps=30 "$sub_folder11"/frame_%d.png
                            ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=$FPS,scale=480:480  "$sub_folder11"/frame_%d.png

                    ;;

                    *"$TYPE_169"*)
                            sub_folder169=$transitionFolderPathOutput/$file_name'_ratio_16_9'
                            ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=$FPS,scale=640:360  "$sub_folder169"/frame_%d.png
                    ;;

                    *"$TYPE_916"*)
                            sub_folder916=$transitionFolderPathOutput/$file_name'_ratio_9_16'
                            ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=$FPS,scale=360:640  "$sub_folder916"/frame_%d.png
                    ;;

                    esac
                done
                echo "[Transition]  ------------- finished"

        elif [ "$mainmenuinput" = "3" ]; then
                #################################################################################################################################
                ###                                                       FRAME                                                               ###
                #################################################################################################################################

                echo "[Frames] ------------- converting..."
                echo '#################################################################################################################################'
                echo '###                                                       FRAME                                                               ###'
                echo '#################################################################################################################################'
                frameFolderPathInput=`pwd`'/frames_webm/*FRAME_*.webm'
                echo "Frame folder path: $frameFolderPathInput"

                frameFolderPathOutput=`pwd`'/output_frames'

                ### Create and prepare folder for each FRAME
                echo "Create and prepare FRAME output folders."

                for file in $frameFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}

                    sub_folder11=$frameFolderPathOutput/$file_name'_ratio_1_1'
                    mkdir -p $sub_folder11
                        echo "sub_folder11 $sub_folder11"

                    sub_folder916=$frameFolderPathOutput/$file_name'_ratio_9_16'
                    mkdir -p $sub_folder916
                    echo "sub_folder916 $sub_folder916"

                    sub_folder169=$frameFolderPathOutput/$file_name'_ratio_16_9'
                    echo "sub_folder169 $sub_folder169"
                    mkdir -p $sub_folder169
                done

                ### Start ffmpeg converting
                ### '-c:v libvpx-vp9 -i "${file.path}" -vf fps=30 "${framesDir.path}/frame_%d.png" -y'
                for file in $frameFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}

                    case $file in

                    *"$TYPE_11"*)
                            sub_folder11=$frameFolderPathOutput/$file_name'_ratio_1_1'
                            ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=$FPS,scale=480:480  "$sub_folder11"/frame_%d.png
                    ;;

                    *"$TYPE_169"*)
                            sub_folder169=$frameFolderPathOutput/$file_name'_ratio_16_9'
                            ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=$FPS,scale=640:360  "$sub_folder169"/frame_%d.png
                    ;;

                    *"$TYPE_916"*)
                            sub_folder916=$frameFolderPathOutput/$file_name'_ratio_9_16'
                            ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=$FPS,scale=360:640   "$sub_folder916"/frame_%d.png
                    ;;

                    esac
                done
                echo "[Frames]  ------------- finished"

        else
            echo "You have entered an invallid selection!"
            echo "Please try again!"
            echo ""
            echo "Press any key to continue..."
            read -n 1
            clear
            mainmenu
        fi
}



mainmenu
