function compute_distance(tree_mesh, point_cloud, k=10)
    pc = Collection(point_cloud)
    S = KNearestSearch(pc, k)

    mean_distances = zeros(length(tree_mesh))
    for (i, tri) in enumerate(tree_mesh)
        tri_centroid = centroid(tri)
        n = search(tri_centroid, S)

        mean_distances[i] = mean(norm.(tri_centroid .- point_cloud[n]))
    end

    return mean_distances
end