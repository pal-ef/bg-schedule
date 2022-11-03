# Specify absolute path
# IMPORTANT: insert the absolute path to the program's folder
ABS_PATH="$HOME/Code/scripts/bg-schedule"
WALLPAPERS_DIRECTORY="${HOME}/Pictures/renders"
FONT="${ABS_PATH}/inter/Inter-Light.otf"
bgdir="${ABS_PATH}/converted.png"
CANVAS_SIZE="1920x1080"
CANVAS_COLOR="#000000"

OUTPUT_FILENAME="output.png"
INPUT_FILENAME="input.png"

LOGO=$(find $WALLPAPERS_DIRECTORY -type f | shuf -n 1)

TITLE_FS=30
NORMAL_FS=25

# Schedule (write your tasks)
T1="Wake Up Time"
T2="Morning Exercise"
T3="Breakfast"
T4="Virtual Class"
T5="Learn to code"
T6="Take the dogs for a walk"
T7="Meal"
T8="Write your journal"
T9="Be like water"
TA="Enjoy the landscape"
TB="Read a book"
TC="Shower"
TD="Sleep"
