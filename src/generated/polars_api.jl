# Julia wrapper for header: polars_bindings.h
# Automatically generated using Clang.jl


function greet(person)
    ccall((:greet, polars_bindings), Cvoid, (Person,), person)
end
