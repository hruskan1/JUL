# struct Wolf
#     name::String
#     energy::Int
# end

# struct Sheep
#     name::String
#     energy::Int
# end

# bark(animal::Wolf) = println(animal.name," has howled.")
# baa(animal::Sheep) = println(animal.name," has baaed")

# methodswith(object)
# supertype(object)
# help ? 


abstract type Agent end
abstract type Animal <: Agent end
abstract type Plant <: Agent end

mutable struct Grass <:Plant
    id::Int # for 1.8< const id
    size:: Int
    max_size::Int
end

Grass(id,m=10) = Grass(id,rand(1:m),m)

function Base.show(io::IO,g::Grass)
    x = g.size/g.max_size * 100 
    print(io,"🌿#$(g.id), $(round(Int,x))% grown")
end

mutable struct Sheep <:Animal
    id::Int
    energy::Float64
    Δenergy::Float64 
    reprprob::Float64
    foodprob::Float64
end

Sheep(id,e=4.0,Δe=0.2,pr=0.8,pf=0.6) = Sheep(id,e,Δe,pr,pf)

function Base.show(io::IO,s::Sheep)
    e = s.energy
    d = s.Δenergy
    pr = s.reprprob
    pf = s.foodprob
    print(io,"🐑#$(s.id) E=$e ΔE=$d pr=$pr pf=$pf")
end

mutable struct Wolf <:Animal
    id::Int
    energy::Float64
    Δenergy::Float64 
    reprprob::Float64
    foodprob::Float64
end

Wolf(id, e=10.0, Δe=8.0, pr=0.1, pf=0.2) = Wolf(id,e,Δe,pr,pf)

# careful with Wolf(5.) -> it wil fall into recursion of calling Wolf on line 58

function Base.show(io::IO, w::Wolf)
    e = w.energy
    d = w.Δenergy
    pr = w.reprprob
    pf = w.foodprob
    print(io,"🐺 #$(w.id) E=$e ΔE=$d pr=$pr pf=$pf")
end

mutable struct World{A<:Agent}
    agents::Dict{Int,A}
    max_id::Int
end

function World(agents::Vector{<:Agent}) # always use <: (you can not initiate abstract entities)
    max_id = maximum(a.id for a in agents)
    World(Dict(a.id => a for a in agents) ,max_id)
    # zip(map(a -> a.id,agents),agents) # create tuple
end

function Base.show(io::IO, w::World)
    println(io, typeof(w))
    for (_,a) in w.agents
        println(io,"  $a")
    end
end

function Base.show(io::IO, w::World)
    println(io,typeof(w))
    for (_,a) in w.agents
        println(io," $a")
    end
end

function eat!(s::Sheep,g::Grass,w::World)
    s.energy += s.Δenergy * g.size
    g.size = 0
    return 
end

function eat!(wolf::Wolf,sheep::Sheep,world::World)
    wolf.energy += sheep.energy * wolf.Δenergy
    kill_agent!(sheep,world)
    return 
end

kill_agent!(a::Agent,w::World) = delete!(w.agents,a)

function reproduce!(a::A, w::World) where A<:Animal # to be faster and  optimized 
    a.energy = a.energy/2
    a_vals = [getproperty(a,n) for n in fieldnames(A) if n!=:id] #:id is symbol
    new_id = w.max_id + 1
    â = A(new_id, a_vals...) # we are calling constructor of type A (cannot be abstract)
    w.agents[â.id] = â
    w.max_id = new_id
end

