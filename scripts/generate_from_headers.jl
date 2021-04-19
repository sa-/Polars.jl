using Clang

LIBCLANG_INCLUDE = "/Users/s.kapadia/.julia/dev/Polars/deps/polars_bindings/c_headers"
LIBCLANG_HEADERS = [joinpath(LIBCLANG_INCLUDE, header) for header in readdir(LIBCLANG_INCLUDE) if endswith(header, ".h")]
wc = init(; headers = LIBCLANG_HEADERS,
            output_dir = joinpath(@__DIR__, "out"),
            output_file = joinpath(@__DIR__, "..", "src", "generated", "polars_api.jl"),
            common_file = joinpath(@__DIR__, "..", "src", "generated", "polars_common.jl"),
            clang_includes = vcat(LIBCLANG_INCLUDE, CLANG_INCLUDE),
            clang_args = ["-I", joinpath(LIBCLANG_INCLUDE, "..")],
            header_wrapped = (root, current)->root == current,
            clang_diagnostics = true,
            )

run(wc)