import Libdl
const polars_bindings = joinpath(@__DIR__, "libpolars_bindings.dylib")
function check_deps()
    global libpolars_bindings
    if !isfile(libpolars_bindings)
        error("$libpolars_bindings does not exist, Please re-run Pkg.build(\"Polars\"), and restart Julia.")
    end
    if Libdl.dlopen_e(libpolars_bindings) == C_NULL
        error("$libpolars_bindings cannot be opened, Please re-run Pkg.build(\"Polars\"), and restart Julia.")
    end
end
