module SFM_

begin
    using Meshes
    using LinearAlgebra
    using MeshViz
    using PlyIO: load_ply
end

"""
1. function to load SFM point clouds and compute a mesh points

"""

function loadply(fname)
    ply = load_ply(fname)
    x = ply["vertex"]["x"]
    y = ply["vertex"]["y"]
    z = ply["vertex"]["z"]
    points = Point.(x, y, z)
    connec = [connect(Tuple(ind .+ 1)) for ind in ply["face"]["vertex_indices"]]
    SimpleMesh(points, connec)
end

export loadply
end