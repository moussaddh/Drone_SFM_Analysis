module SFM

import Meshes
import LinearAlgebra
import PlyIO
import Statistics

"""
1. function to load SFM point clouds and compute a mesh points

"""
function loadply(fname)
    ply = PlyIO.load_ply(fname)
    x = ply["vertex"]["x"]
    y = ply["vertex"]["y"]
    z = ply["vertex"]["z"]
    points = Meshes.Point3.(x, y, z)
    connec = [Meshes.connect(Tuple(ind .+ 1)) for ind in ply["face"]["vertex_indices"]]
    Meshes.SimpleMesh(points, connec)
end

export loadply
end