using Documenter
using ModelingToolkit
using Elan8ComponentLibrary
using Elan8ComponentLibrary.ElectroMechanical
using Elan8ComponentLibrary.ElectroMechanical.Rotational

ENV["GKSwstype"] = "100"

include("pages.jl")

makedocs(sitename = "Elan8ComponentLibrary.jl",
    authors = "Elan8",
    clean = true,
    doctest = false,
    linkcheck = true,
    strict = [
        :linkcheck,
        :doctest,
        :example_block,
    ],
    modules = [ModelingToolkit,
    Elan8ComponentLibrary,
    Elan8ComponentLibrary.ElectroMechanical,
    Elan8ComponentLibrary.ElectroMechanical.Rotational,
],
    format = Documenter.HTML(
        canonical = "https://www.elan8.com/Elan8ComponentLibrary/"),
    pages = pages)

# deploydocs(repo = "github.com/SciML/ModelingToolkitStandardLibrary.jl";
#     push_preview = true)
