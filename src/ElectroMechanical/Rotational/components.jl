
"""
DcMotor(; name, R, L, k, J, f)

Creates a basic model of a DC motor


# Connectors:

  - `p` Positive pin
  - `n` Negative pin
  - `flange` The rotating part of the motor (axle)
  - `support` The static part of the motor (housing)

# Parameters:

  - `R`: [`Ohm`] armature resistance
  - `L`: [`H`]   armature inductance
  - `k`: [`N.m/A`] motor constant
  - `J`: [`kg.m²`] inertia
  - `f`: [`N.m.s/rad`] friction factor
  
"""
@component function DcMotor(; name, R = 0.5, L = 4.5e-3, k = 0.5, J = 0.02, f = 0.01)
    @named p = ModelingToolkitStandardLibrary.Electrical.Pin()
    @named n = ModelingToolkitStandardLibrary.Electrical.Pin()
    @named flange = ModelingToolkitStandardLibrary.Mechanical.Rotational.Flange()
    @named support = ModelingToolkitStandardLibrary.Mechanical.Rotational.Support()
    @named R1 = ModelingToolkitStandardLibrary.Electrical.Resistor(R = R)
    @named L1 = ModelingToolkitStandardLibrary.Electrical.Inductor(L = L)
    @named emf = ModelingToolkitStandardLibrary.Electrical.EMF(k = k)
    @named inertia = ModelingToolkitStandardLibrary.Mechanical.Rotational.Inertia(J = J)
    @named friction = ModelingToolkitStandardLibrary.Mechanical.Rotational.Damper(d = f)

    connections = [connect(support, emf.support, friction.flange_b)
                   connect(emf.flange, friction.flange_a, inertia.flange_a)
                   connect(inertia.flange_b, flange)
                   connect(p, R1.p)
                   connect(R1.n, L1.p)
                   connect(L1.n, emf.p)
                   connect(emf.n, n)]

    systems = [
        p,
        n,
        flange,
        support,
        R1,
        L1,
        emf,
        inertia,
        friction,
    ]

    ODESystem(connections, t, [], [], systems = systems, name = name)
end
