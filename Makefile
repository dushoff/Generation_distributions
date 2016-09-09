# Generation_distributions
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: gamma.Rout 

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

## This one is weird; seems to make an exponential with parameters matched to the specific lognormal
exponential.Rout: lognormal.Rout

##################################################################

# Pictures of filtered mean stuff

# funhist has histogram functions
# filtered.R is expecting calculated objects (Simulations, above)

%.filtered.Rout: %.Rout funhist.Rout filtered.R
	$(run-R)

lognormal.filtered.Rout: filtered.R
paper.filtered.Rout: lognormal.Rout funhist.Rout paper.R
	$(run-R)
paper.filtered.wide.pdf:

exponential.filtered.Rout: exponential.R

lognormal.filtered.Rout: funhist.R

## Curves showing approximations across a range
lognormal.curve.Rout: curve.R
%.curve.Rout: %.ga.Rout par.R curve.R
	$(run-R)

%.ga.Rout: %.Rout gamma.R
	$(run-R)

%.hist.Rout: %.Rout hist.R
	$(run-R)

%.plain.Rout: %.curve.Rout par.R plain.R
	$(run-R)

newtest.Rout: lognormal.Rout newfun.Rout filtered.R
	$(run-R)

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
