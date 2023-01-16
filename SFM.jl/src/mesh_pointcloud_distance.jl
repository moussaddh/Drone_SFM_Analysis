"""
    compute_distance(tree_mesh, point_cloud, k=10)

Compute the distance between each triangle in `tree_mesh` and the `k` nearest
points in `point_cloud`. The distance is the mean distance between the triangle
centroid and the `k` nearest points.

Returns a vector of distances, one for each triangle in `tree_mesh`.

# Example

```julia
using SFM

tree_mesh = loadply("tree.ply")
point_cloud = loadply("point_cloud.ply")

distances = mesh_pointcloud_distance(tree_mesh, point_cloud)
```
"""
function mesh_pointcloud_distance(tree_mesh, point_cloud, k=10)
    pc = Meshes.Collection(point_cloud)
    S = Meshes.KNearestSearch(pc, k)

    mean_distances = zeros(length(tree_mesh))
    for (i, tri) in enumerate(tree_mesh)
        tri_centroid = Meshes.centroid(tri)
        n = Meshes.search(tri_centroid, S)

        mean_distances[i] = Statistics.mean(LinearAlgebra.norm.(tri_centroid .- point_cloud[n]))
    end

    return mean_distances
end