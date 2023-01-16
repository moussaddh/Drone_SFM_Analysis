"""
    RMSE(error)

Root Mean Squared Error (RMSE) of the given error vector.
"""
function RMSE(error)
    return sqrt(Statistics.mean(error .^ 2))
end