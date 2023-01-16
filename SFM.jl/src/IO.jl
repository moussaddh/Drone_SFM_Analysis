"""
    loadply(fname)

Load a mesh from a .ply file as a `SimpleMesh` from `Meshes.jl`.
"""
function loadply(file)
    ply = PlyIO.load_ply(file)
    x = ply["vertex"]["x"]
    y = ply["vertex"]["y"]
    z = ply["vertex"]["z"]
    points = Meshes.Point3.(x, y, z)
    connec = [Meshes.connect(Tuple(ind .+ 1)) for ind in ply["face"]["vertex_indices"]]

    return Meshes.SimpleMesh(points, connec)
end