"""
    load_ply(file)

Load a mesh from a .ply file as a `SimpleMesh` from `Meshes.jl`.
"""
function load_ply(file)
    ply = PlyIO.load_ply(file)
    x = ply["vertex"]["x"]
    y = ply["vertex"]["y"]
    z = ply["vertex"]["z"]
    points = Meshes.Point3.(x, y, z)
    connec = [Meshes.connect(Tuple(ind .+ 1)) for ind in ply["face"]["vertex_indices"]]

    return Meshes.SimpleMesh(points, connec)
end

"""
    load_points(file)

Load a point cloud from a .xyz file as a vector of `Point3` from `Meshes.jl`.
"""
function load_points(file)
    xyz_crown = CSV.File(file)
    point_cloud = [Meshes.Point3(i[1], i[2], i[3]) for i in xyz_crown]

    return point_cloud
end