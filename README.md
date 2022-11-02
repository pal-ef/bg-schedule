# Background Dynamic Schedule
This bash script creates a wallpaper with an embeded schedule and stablish it as the DE wallpaper. It's sensitive to the user's dark theme preferences and the system's time (set's the current hour to green or red).

Make a new crontab for dynamic wallpaper refresh.

Example for automatic refresh every hour:
```
0 * * * * env DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/yin/.local/bin/bg-schedule/custombg.sh
```

![white theme](./img/Screenshot%20from%202022-11-01%2019-07-09.png)
![dark theme](./img/Screenshot%20from%202022-11-01%2019-13-24.png)

## User configuration

### Important

Set the absolute path in both ```custombg.sh``` and ```conf.sh```

here;
``` bash
# WRITE THE SCRIPT FOLDER'S ABSOLUTE PATH
source "${HOME}/Code/scripts/bg-schedule/conf.sh"
```

and here;

``` bash
# IMPORTANT: insert the absolute path to the program's folder
ABS_PATH="$HOME/Code/scripts/bg-schedule"
``` 
### Schedule

Open ```conf.sh``` and and change T variables for your desired schedule:
``` bash
# Schedule (write your tasks)
T1="Wake Up"
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
```

### Theme colors

Inside ```custombg.sh``` 

``` bash
if [[ `gsettings get org.gnome.desktop.interface color-scheme` =~ 'dark' ]];
then
    DARK_MODE=true
    TXT_COLOR="#FFFFFF"
    CANVAS_COLOR="#000000"
    SELECTED_COLOR="#48b75b"
else
    DARK_MODE=false
    TXT_COLOR="#505152"
    CANVAS_COLOR="white"
    SELECTED_COLOR="#bb0300"
fi

```
