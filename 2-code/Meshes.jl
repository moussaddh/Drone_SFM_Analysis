begin
    using Meshes
    using GLMakie
    using MeshViz
    using MiniQhull
    using PlyIO
end

includet("../2-code/Functions.jl")
using .SFM_

ply = load_ply("./1-data/EC01__tronc_mesh.ply")
tree_mesh = loadply("./1-data/EC01__tronc_mesh.ply") # read your mesh here (see e.g. https://github.com/JuliaGeometry/MeshViz.jl)
viz(tree_mesh, showfacets=true)