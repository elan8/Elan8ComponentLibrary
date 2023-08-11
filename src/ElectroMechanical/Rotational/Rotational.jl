"""
Library to model 1-dimensional, rotational electromechanical systems
"""
module Rotational

using ModelingToolkit, ModelingToolkitStandardLibrary, Symbolics, IfElse

@parameters t
D = Differential(t)

export DcMotor
include("components.jl")


end
