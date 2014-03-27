#!/bin/bash


# Find all valid assimp files
FILE_LIST=`find ./ | egrep "obj\>|ply\>|off\>"`

for f in $FILE_LIST
do
    #figure out what the equivalent stl file would be by just replacing the extension
    stl_filename="${f%.*}.stl"

    #test if they import properly
    R=`assimp info $f`
    #If they don't, and no stl file of them exists, create one
    if [ "$?" != "0" ] && [ ! -f $stl_filename ]
	then
	#use meshlab with no script to convert it
	meshlabserver -i $f -o $stl_filename
	R=`assimp info $stl_filename`
	if [ "$?" != "0" ]
	    then
	    echo "Couldn't convert $f to an stl file that assimp could open"
	    rm $stl_filename
	fi

    fi
	
	

done
