module SFM

import Meshes
import LinearAlgebra
import PlyIO, CSV # For reading the .ply and .xyz files
import Statistics

include("IO.jl")
include("mesh_pointcloud_distance.jl")
include("statistics.jl")

export load_ply, load_points
export mesh_pointcloud_distance
export RMSE

end