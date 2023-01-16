module SFM

import Meshes
import LinearAlgebra
import MeshViz
import PlyIO

"""
1. function to load SFM point clouds and compute a mesh points

"""
function loadply(fname)
    ply = PlyIO.load_ply(fname)
    x = ply["vertex"]["x"]
    y = ply["vertex"]["y"]
    z = ply["vertex"]["z"]
    points = Point.(x, y, z)
    connec = [connect(Tuple(ind .+ 1)) for ind in ply["face"]["vertex_indices"]]
    SimpleMesh(points, connec)
end

export loadply
end