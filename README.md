object_models
=============

### How to add new/modified (e.g. scale up an object) model to BCI system

#### From .vtk file:

1. pcl_vtk2ply file_name.vtk file_name.ply
2. meshlab file_name.ply
  * export as file_name_forIV.stl
  * Filters > Normals, Curvatures and Orientation > Transform:Scale
    * 0.001 (uniform scaling)
    * export as file_name.stl
3. ivcon
  * <file_name_forIV.stl
  * >file_name.iv
  * quit
4. follow from step 6 below
5. rm .ply file


#### From .stl file:

1. Open old .stl file in meshlab and modify as needed
  * `$ meshlab old_object.stl`
2. Export as .stl
3. Scale up by 1000 and export as .obj (with normals) and .stl (for iv)
4. run `$ python obj_to_vtk.py` on .obj to save as .vtk in robert_data_unique
5. run ivcon:
  * `$ ivcon`
  * `<scaled_up_model.stl`
  * `>output_iv_file.iv`
6. move .iv file to graspit-ros/graspit/graspit_source/models/object_database
7. duplicate an xml file in object_database to add the new .iv file
8. rm .stl file used for iv
9. moveit_trajectory_planner/scripts/world_manager_helpers/object_filename_dict.py
  add new stl model file_name path
  add new model to file_name_dict
10. .../models.launch
  * add model to rosparam
  * add model and path to param name for vtk and stl
11. verify new models with pcl_viewer
