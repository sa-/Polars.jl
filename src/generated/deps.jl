import Libdl
const polars_bindings = joinpath(@__DIR__, "libpolars_bindings.dylib")
function check_deps()
    global polars_bindings
    if !isfile(polars_bindings)
        error("$polars_bindings does not exist, Please re-run Pkg.build(\"Polars\"), and restart Julia.")
    end
    if Libdl.dlopen_e(polars_bindings) == C_NULL
        error("$polars_bindings cannot be opened, Please re-run Pkg.build(\"Polars\"), and restart Julia.")
    end
end
