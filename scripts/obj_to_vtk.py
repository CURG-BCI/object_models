import sys
import vtk


def obj_to_vtk(in_filename, out_filename):
    # Read the obj file
    reader = vtk.vtkOBJReader()
    reader.SetFileName(in_filename)
    reader.Update()

    # Write the vtk file
    writer = vtk.vtkPolyDataWriter()
    writer.SetFileName(out_filename)
    writer.SetInputConnection(reader.GetOutputPort())
    writer.Write()


if __name__ == '__main__':
    in_filename = sys.argv[1]
    out_filename = sys.argv[2]

    obj_to_vtk(in_filename, out_filename)