# Generation_distributions

current: target

target pngtarget pdftarget vtarget acrtarget: example.Rout 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R)

## Conceptual pictures

## Conceptual picture (idea ripped off from whom?)
## If generations are faster, steps are smaller and R0 is lower
steps.Rout: steps.R
steps.wide.pdf: steps.R

# Confusing conceptual diagram with diagonal arrow (replaced by a pair of diagrams)
contour.Rout: par.R contour.R
	$(run-R)

## Less-confusing two-diagram version
condition.Rout: condition.R

##################################################################

## Simulations for downstream use

## Some sort of realistic-ish generation interval based on gamma assumptions
simple.Rout: simple.R

## And now based on lognormal stuff
lognormal.Rout: lognormal.R

## Make an exponential with parameters matched to the specific lognormal
exponential.Rout: lognormal.Rout

## Make a single-gamma approximation to a simulation
%.ga.Rout: %.Rout gamma.R
	$(run-R)

##################################################################

# Pictures of filtered mean stuff

# funhist has histogram functions
# filtered.R is expecting calculated objects (Simulations, above)

%.filtered.Rout: %.Rout funhist.Rout filtered.R
	$(run-R)

lognormal.filtered.Rout: filtered.R
means.filtered.Rout: lognormal.Rout funhist.Rout means.R
	$(run-R)
means.filtered.wide.pdf:

# Exponential version used in talk; not so clear if it's pedagogic
exponential.filtered.Rout: exponential.R

# Plain histograms (compare sim and its single-gamma approximation)
lognormal.hist.Rout:
lognormal.ga.hist.Rout:
%.hist.Rout: %.Rout hist.R
	$(run-R)

######################################################################

## Curves showing approximations across a range

# Functions for calculating R using Euler's equation
euler.Rout: euler.R

# Some parameters from the Ebola epidemic
WHO.Rout: WHO.R

# Generic example that was hijacked for a talk
lognormal.curve.Rout: curve.R
%.curve.Rout: %.ga.Rout par.R curve.R
	$(run-R)

# New example
EbolaCurve.cex.Rout: lognormal.ga.Rout euler.Rout WHO.Rout cex.R EbolaCurve.R
	$(run-R)

# Paper now uses this flatter version
EbolaCurve.flat.Rout: lognormal.ga.Rout euler.Rout WHO.Rout flat.R EbolaCurve.R
	$(run-R)

## Normal curve added to Ebola
wallingaNormal.Rout: wallingaNormal.R

## A bunch of curves in the Ebola example (baseplot, discrete WL calculation, seminr, seir, single-gamma. seminr is the best and works fine with integers or not (but we will say that people shouldn't bother with integers)
## Also, a new example (flu from WL). We use the second histogram
## Curves show (in order): sir, seir, se2ir, single-gamma
wallinga.Rout: wallinga.R

## Plain version uses mean and range from Ebola, but not approximations. Seems kind of hasty.
%.plain.Rout: %.curve.Rout par.R plain.R
	$(run-R)

# A general example of the generalized exponential
genExp.flat.Rout: flat.R genExp.R
	$(run-R)

genExp.Rout: genExp.R
	$(run-R)

# DSW's examples (in DSW's style)
example.Rout: example.R

# Functions for generalized exponential and that other thing
XN.Rout: XN.R

gx.Rout: XN.Rout gx.R

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
