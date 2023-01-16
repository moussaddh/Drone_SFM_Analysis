using GLMakie, MeshViz # For plotting
using SFM

# Import the point clouds:

point_cloud = load_points("1-data/EC01_houppier.xyz")

# Import the mesh:
tree_mesh = load_ply("1-data/EC01_houppier_mesh.ply")

# Visualize the mesh and the point cloud:
viz(tree_mesh, alpha=0.5, color=:green)
viz!(point_cloud, markersize=0.001, color=:lightgrey)

k = 10 # Number of nearest neighbors to use for each triangle
mean_distances = mesh_pointcloud_distance(tree_mesh, point_cloud, k)

rmse = RMSE(mean_distances)
