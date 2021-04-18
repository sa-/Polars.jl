module Polars

greet() = print("Hello World!")

end # module
##
const deps_file = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if !isfile(deps_file)
    error("womp womp")
end
include(deps_file)
##
ccall(
    (:greet, polars_bindings), 
    Cvoid, 
    (CString,), 
    "hi")
##
# todo
# make CLang generate api.jl
# implement some pass-through functions to polars