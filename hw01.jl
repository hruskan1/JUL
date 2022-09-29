"""
    circlemat(n)

Returns circle square matrix of n-th dimesnion of the[n x n]`.
"""
function circlemat(n::Int)
    A = zeros(Int,n,n)
    for i in 1:n
        for j in 1:n
            if (i == j-1 && j > 1)  || (i == n && j == 1) || (i == j+1 && j < n ) || (i == 1 && j == n)
                A[i,j] = 1
            end
        end
    end
    return A
end

function circlemat_short(n::Int)
    [(i == j-1 && j > 1)  || (i == n && j == 1) || (i == j+1 && j < n ) || (i == 1 && j == n) ? 1 : 0 for i in 1:n,j in 1:n]
end

"""
    polynomial

Computes the polynomial of given matrix x (with coefficients of a)
"""
function polynomial(a, x::AbstractMatrix)
    accumulator = zeros(eltype(x),size(x))    
    for i in length(a):-1:1
        accumulator += x^(i-1) .* a[i] # ! 1-based indexing for arrays
    end
    return accumulator

end

function main()
    a = ones(Int,4)
    x = circlemat_short(10)
    A = polynomial(a,x)
end

# function extra()
#     #using GraphRecipes, Plots

#     A = circlemat(10)
#     graphplot(A)
# end

main()

