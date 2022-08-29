
#! /bin/bash

### Folder structure
### --- frames_webm
### --- transitions_webm
### --- stickers_webm
### --- titles_webm
### --- convert_webm_to_webp_thumbnail.sh

TYPE_11=' 11'
TYPE_169=' 169'
TYPE_916=' 916'
mainmenu () {
echo '#################################################################################################################################'
echo '##### Mày muốn chuyển từ webm sang webp cho cái gì?'
echo '##### Press 1 to convert STICKER'
echo '##### Press 2 to convert TRANSITION'
echo '##### Press 3 to convert FRAME'
echo '##### Press 4 to convert Title'
#echo '##### Press 5 to convert All'
echo '#################################################################################################################################'

        read -n 1 -p "Input Selection:" mainmenuinput

        if [ "$mainmenuinput" = "1" ]; then
                echo "[Sticker] ------------- scaling..."
                echo '#################################################################################################################################'
                echo '###                                                       STICKER                                                             ###'
                echo '#################################################################################################################################'
                frameFolderPathInput=`pwd`'/stickers_webm/*STI*KER_*.webm'
                echo "Sticker folder path: $frameFolderPathInput"
                frameFolderPathOutput=`pwd`'/output_sticker_webp_thumbnail'


                ### Create and prepare folder for each FRAME
                echo "Create and prepare STICKER output folders."

                for file in $frameFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}
                
                    sub_folder11=$frameFolderPathOutput
                    mkdir -p $sub_folder11
                done
                
                for file in $frameFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}
                
                    ###STICKER
                    sub_folder11=$frameFolderPathOutput
#                    ffmpeg -c:v libvpx-vp9 -i "$file" -vf scale=134:134 -frames:v 60 -loop 0 -c:v libwebp -y "$sub_folder11"/$file_name".webp"

                ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=60,scale=134:134 "$sub_folder11"/$file_name".webp"

            done
            echo "[Stickers]  ------------- finished"
            
        elif [ "$mainmenuinput" = "2" ]; then
                echo "[Transitions] ------------- scaling..."
                echo '#################################################################################################################################'
                echo '###                                                       TRANSITION                                                          ###'
                echo '#################################################################################################################################'
                frameFolderPathInput=`pwd`'/transitions_webm/*TRANSITION_*.webm'
                echo "Transition folder path: $frameFolderPathInput"
                frameFolderPathOutput=`pwd`'/output_transition_webp_thumbnail'
                ### Create and prepare folder for each FRAME
                echo "Create and prepare TRANSITION output folders."

                for file in $frameFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}
                
                    sub_folder11=$frameFolderPathOutput
                    mkdir -p $sub_folder11
                done
                
                for file in $frameFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}
                
                ###FRAME & TRANSITION
                case $file in
            
                *"$TYPE_11"*)
                        sub_folder11=$frameFolderPathOutput
#                        ffmpeg -c:v libvpx-vp9 -i "$file" -vf scale=134:134 -frames:v 60 -loop 0 -c:v libwebp -y "$sub_folder11"/$file_name" 11.webp"

                ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=60,scale=134:134 "$sub_folder11"/$file_name" 11.webp"
                ;;
            
                *"$TYPE_169"*)
                        sub_folder169=$frameFolderPathOutput
#                        ffmpeg -c:v libvpx-vp9 -i "$file" -vf scale=240:134  -frames:v 60 -loop 0 -c:v libwebp -y "$sub_folder11"/$file_name" 169.webp"
                            
                        ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=60,scale=240:134 "$sub_folder11"/$file_name" 169.webp"
                ;;
            
                *"$TYPE_916"*)
                        sub_folder916=$frameFolderPathOutput
#                        ffmpeg -c:v libvpx-vp9 -i "$file" -vf scale=134:240  -frames:v 60 -loop 0 -c:v libwebp -y "$sub_folder11"/$file_name" 916.webp"
#
                ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=60,scale=134:240 "$sub_folder11"/$file_name" 916.webp"
                ;;
            
                esac
            
            done
            echo "[Frames]  ------------- finished"
        elif [ "$mainmenuinput" = "3" ]; then
                echo "[Frames] ------------- scaling..."
                echo '#################################################################################################################################'
                echo '###                                                       FRAME                                                               ###'
                echo '#################################################################################################################################'
                frameFolderPathInput=`pwd`'/frames_webm/*FRAME_*.webm'
                echo "Frame folder path: $frameFolderPathInput"
                frameFolderPathOutput=`pwd`'/output_frame_webp_thumbnail'
                ### Create and prepare folder for each FRAME
                echo "Create and prepare FRAME output folders."

                for file in $frameFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}
                
                    sub_folder11=$frameFolderPathOutput
                    mkdir -p $sub_folder11
                done
                
                for file in $frameFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}
                
                ###FRAME & TRANSITION
                case $file in

                *"$TYPE_11"*)
                        sub_folder11=$frameFolderPathOutput
#                        ffmpeg -c:v libvpx-vp9 -i "$file" -vf scale=134:134 -frames:v 60 -loop 0 -c:v libwebp -y "$sub_folder11"/$file_name" 11.webp"
                        
                    ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=60,scale=96:96 "$sub_folder11"/$file_name" 11.webp"

                ;;

                *"$TYPE_169"*)
                        sub_folder169=$frameFolderPathOutput
#                        ffmpeg -c:v libvpx-vp9 -i "$file" -vf scale=240:134  -frames:v 60 -loop 0 -c:v libwebp -y "$sub_folder11"/$file_name" 169.webp"
                        
#                    ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=60,scale=240:134 "$sub_folder11"/$file_name" 169.webp"

                ;;

                *"$TYPE_916"*)
                        sub_folder916=$frameFolderPathOutput
#                        ffmpeg -c:v libvpx-vp9 -i "$file" -vf scale=134:240  -frames:v 60 -loop 0 -c:v libwebp -y "$sub_folder11"/$file_name" 916.webp"
                        
#                    ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=60,scale=134:240 "$sub_folder11"/$file_name" 916.webp"
                ;;
                esac
                
            done
            echo "[Frames]  ------------- finished"
            
        elif [ "$mainmenuinput" = "4" ]; then
                echo "[Title] ------------- scaling..."
                echo '#################################################################################################################################'
                echo '###                                                       Title                                                               ###'
                echo '#################################################################################################################################'
                frameFolderPathInput=`pwd`'/titles_webm/Title_*.webm'
                echo "Sticker folder path: $frameFolderPathInput"
                frameFolderPathOutput=`pwd`'/output_title_webp_thumbnail'
                echo "Create and prepare STICKER output folders."

                for file in $frameFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}
                
                    sub_folder11=$frameFolderPathOutput
                    mkdir -p $sub_folder11
                done
                
                for file in $frameFolderPathInput
                do
                    f="$(basename -- $file)"
                    file_name=${f[0]}
                ###TITLE
                sub_folder11=$frameFolderPathOutput
#                ffmpeg -c:v libvpx-vp9 -i "$file" -vf scale=240:134 -frames:v 60 -loop 0 -c:v libwebp -y "$sub_folder11"/$file_name".webp"
                    
                ffmpeg -c:v libvpx-vp9 -i "$file" -vf fps=60,scale=240:134 "$sub_folder11"/$file_name".webp"

          
            done
            echo "[Stickers]  ------------- finished"
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
