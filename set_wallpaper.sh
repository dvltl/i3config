#------------------------------------------------
#--Backgroud setter for your desktop and i3lock--
#------------------------------------------------

# Please note:
# The desired image for now should be large enough
# to fill the screen in both dimensions (width, height).
# Otherwise it wouldn't look very good on the lock screen
# (e.g. not centered image with white borders).

# In your .i3/config in place where you specify the location
# for your bacground just replace your image name with the
# name of the symlink ( ~/Desktop/wall )

if [ $1 ]
then

	link=$HOME/Desktop/wall

	if ls $1 | grep '.jpg' >/dev/null || ls $1 | grep '.jpeg' >/dev/null || ls $1 | grep '.bmp' >/dev/null
	then
		png=$link'.png'
		convert -background black $1 $png
	else
		png=$1
	fi

	if ls $HOME/Desktop | grep 'wall' >/dev/null
	then
		rm $link
	fi

	ln -s $png $link
    feh --bg-fill $png

else

	echo 'No image specified (full name required).'

fi
