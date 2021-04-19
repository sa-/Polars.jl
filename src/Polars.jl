const deps_file = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
@assert isfile(deps_file) "Could not find native dependency"

include(deps_file)
include("generated/ctypes.jl")
include("generated/polars_common.jl")
include("generated/polars_api.jl")
check_deps()
##
greet(Person(Base.unsafe_convert(Cstring, "a"), 99))
##
# todo
# make CLang generate api.jl
# implement some pass-through functions to polars