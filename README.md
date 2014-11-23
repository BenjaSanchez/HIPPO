HIPPO
========================

HIPPO (Heuristic Iterative Procedure for Parameter Optimization) is the companion software of the publication:

_Benjamín J. Sánchez, Daniela C. Soto, Héctor Jorquera, Claudio A. Gelmi, José R. Pérez-Correa. HIPPO: An iterative reparametrization method for identification and calibration of dynamic bioreactor models of complex processes. Industrial & Engineering Chemistry Research._ (http://www.dx.doi.org/10.1021/ie501298b)


HIPPO was programmed by Benjamí­n J. Sánchez (@BenjaSanchez), excluding the functions identifica, ksensibilidadBSB and intconfianzaBSB, that were programmed by Dr. Claudio Gelmi (www.systemsbiology.cl), Engineering School, Pontificia Universidad Católica de Chile.

HIPPO is available for free (for academic or non commercial purposes only) at http://www.systemsbiology.cl/tools/ No technical support is provided for its use.

Last update: 2014-11-20

========================

## Required Software:

* MATLAB (7.5 or higher) + Optimization Toolbox.
* Scatter Search for MATLAB (SSm, available free of charge for academic users at http://www.iim.csic.es/~gingproc/ssmGO.html)

========================

## Functions Included:

### Functions you have to modify (instructions in each .m file):

* load_problem.m
* model.m
* obj_var.m
* permited_it.m
* plotResults.m
* You also need to have a file with the experimental data, and you can also add more .m files if your code uses them.

### Functions you should NOT modify:

* HIPPO.m
* add_it.m
* iteration.m
* obj_func.m
* solve_ODE.m
* reg_analysis.m
* lsq_func.m
* decision.m
* find_best.m

### Functions you cannot modify (they are in protected form):

* identifica.p
* ksensibilidadBSB.p
* intconfianzaBSB.p
