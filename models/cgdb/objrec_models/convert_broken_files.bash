#!/bin/bash


# Find all valid assimp files
FILE_LIST=`find ./ | egrep "vtk\>"`

for f in $FILE_LIST
do
    #figure out what the equivalent stl file would be by just replacing the extension
    stl_filename="${f%.*}.stl"

    rosrun objrec_ros_integration vtk_to_stl $f $stl_filename
done
