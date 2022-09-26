"""
    polynomial(a, x)

Returns value of a polynomial with coefficients `a` at point `x`.
"""
function polynomial(a, x)
    if eltype(a) == Base.Char
        accumulator = 0
        for i in length(a):-1:1
            accumulator += x^(i-1) * a[i] # ! 1-based indexing for arrays
        end
        return accumulator
    else
        throw(ArgumentError("Invalid coefficients $(a) of type $(eltype(a))"))
    end
end

function addone(x)
     x + 1
end

function addone!(x)
    x = x + 1
end