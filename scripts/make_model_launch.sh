

VTK_FILENAMES=$(find $1 -name *.vtk)
STL_FILENAMES=$(find $1 -name *.stl)

echo "<launch>"
echo "<group ns=\"model_uris\">"
for f in $VTK_FILENAMES; do
    bn=$(basename $f)
    name="${bn%.*}"
    echo "<param name=\"$name\" value=\"package://object_models/$f\" />"
done
echo "</group>"
echo "<group ns=\"stl_uris\">"
for f in $STL_FILENAMES; do
    bn=$(basename $f)
    name="${bn%.*}"
    echo "<param name=\"$name\" value=\"package://object_models/$f\" />"
done

echo "</group>"
echo "</launch>"
