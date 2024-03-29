# Well Response Comparison

<img src="https://github.com/Mahmoud899/WellsComparison/blob/master/VerticalProducer.jpg" width="200" height="150" /> <img src="https://github.com/Mahmoud899/WellsComparison/blob/master/HorizontalProducer.jpg" width="200" height="150" /> <img src="https://github.com/Mahmoud899/WellsComparison/blob/master/MultilateralProducer.jpg" width="200" height="150" />

The mathematical model of Incompressible Immiscible two-phase flow can be written as two main equations and a set of constitutive relations.

One elliptic pressure equation

-∇([λ_n+λ_w ]K∇p_n )=q- ∇[λ_w ∇p_c+(λ_n ρ_n+λ_w ρ_w )g∇z]

Another parabolic, with hyperbolic character, saturation equation

ϕ (∂S_w)/∂t+∇[f_w v ⃗+f_w λ_n KΔρ∇z]=q_w-∇(f_w λ_n KP_c^' ∇S_w)

Darcy equation

v ⃗=-[λ_n+λ_w ]∇p_n+ λ_w ∇p_c+(λ_n ρ_n+λ_w ρ_w )g∇z

we can see that the pressure equation is an elliptic PDE, we can interpret it as the following:

The gradient of the pressure gives us a vector field that points in the direction of the maximum increase in pressure at a given point. The divergence of that field gives us how that field is spread at a given point.
So, the divergence of the gradient of the pressure field is related to the flow rate q, a source or sink term that accounts for a well, and the effect of gravity. This is intuitive,  the pressure field in the reservoir will only change if a well is set to flow or due to gravity.
The saturation equation is a parabolic PDE, with a hyperbolic character, which describes waves traveling with finite speed. This is again reasonable because water will flow in the reservoir at a finite speed. The equation accounts for the balance of three different forces:
Viscous advection, the velocity term, gravity segregation and capillary pressure.
The pressure and saturation equations are coupled. The mobility term appearing in the pressure equation depends on saturation and the velocity term in the saturation equation depends on pressure.
The fractional flow formulation is useful because it minimizes that coupling and under some assumptions and simplifications that coupling breaks.
The equations can be solved numerically with Finite Volume Methods and sequentially such that the pressure is updated first for the current saturation and then the saturation is updated for the updated pressure. Of course, that introduced splitting error but we can use this method because of the weak coupling.


I ran a simulation using MRST, MATLAB Reservoir Simulation Toolbox, on a reservoir with a permeable fault splitting it into two homogeneous isotropic rocks with no flow boundary condition. The injector is a vertical well in the less permeable rock, and the producer is in the permeable rock. I ran three simulations:
	A Vertical Producer
	A Horizontal Producer
	A Multilateral Producer

<img src="https://github.com/Mahmoud899/WellsComparison/blob/master/Case1Simulaion.jpg" /> <img src="https://github.com/Mahmoud899/WellsComparison/blob/master/Case2Simulation.jpg" width="200" height="150" /> <img src="https://github.com/Mahmoud899/WellsComparison/blob/master/Case3Simulaion.jpg" width="200" height="150"/>

We can see in the simulation results that the waterfront from the lowest penetrations penetrates through the better zone then gradually builds up a water tongue. 
In the case of a vertical producer, we see that the advancing water reaches the lowest perforations after 5.3 years. 
For the horizontal producer, the water reaches the far west side of the reservoir and then extends upward flooding the middle part of the well after 7.2 years. 
The multilateral well extends through the permeable rock towards the fault. The water reaches the middle lateral first after 3.4 years and then the other parts of the well.
The response of the multilateral well will depend on the well path and the number of laterals.
The fluid parameters are chosen to exaggerate the effect of gravity and water coning.
One can consider bottom or side water drive by adding an influx or pressure boundary conditions. We can add a dip angle to the reservoir or consider a displacement along the less permeable fault by using permeability multipliers.

Hanging Block, Yellow

Porosity	0.1

Permeability	50 mD

Travelling Block, pink

porosity	0.3

permeability	600 mD

Reservoir Dimensions

Lx	1500 meter

Ly	1000 meter

Lz	200 meter

Pore Volume	430.852 MMSTB

Grid Dimensions

nx	60

ny	40

nz	10

Fluid Properties

Water Density	1014 KG

Water Viscosity	1 cp

Swr	0.2

Oil Density	400 KG

Oil Viscosity	10 cp

Sor	0.15


