what_is=$(printf "Convert format\nCut" | zenity --list --column=Name --height=330 --text=Please);


get() { zenity --scale --max-value=60 --text="$1";};


if [[ $what_is == "Cut" ]];then 
zenity --info --text="Please select the file.";
file1=$(zenity --file-selection);file2=$(basename "$file1");
starting_hour=$( get "starting hour" );
starting_minutes=$( get "starting minutes" );starting_seconds=$( get "starting seconds" );
ending_hour=$( get "ending hour" );ending_minutes=$( get "ending minutes" );ending_seconds=$( get "ending seconds" );
start_time=$starting_hour":"$starting_minutes":"$starting_seconds
end_time=$ending_hour":"$ending_minutes":"$ending_seconds;

random2=$(( RANDOM%999999999 ));
echo $random2;
echo "----->"$file1 ;
format=${file2##*.};echo "$format";echo $start_time;echo $end_time;
entry=$(zenity --entry --entry-text="cutted$random2$file2.$format" --text="output filename");
echo ffmpeg -ss $start_time -to $end_time -i "$file1" -c copy "$entry" ;
##BUG :added -nostdin to disable interaction
 ffmpeg -nostdin -ss $start_time -to $end_time -i "$file1" -c copy "$entry" ;
fi;



if [[ $what_is == "Extract audio" ]];then echo x;fi;


if [[ $what_is == "Convert format" ]];then
file=$(zenity --file-selection);file1=$(basename $file);


random2=$(( RANDOM%999999999 ));

format=$(cat formats.txt | zenity --list --column=format);
output=$(zenity --entry --entry-text="Convert_$random2$file1.$format");
ffmpeg -i "$file" "$output"

echo x;fi;



#file=$(zenity --file-selection);format=$(echo $file | egrep -o [.]..*$);echo $format
