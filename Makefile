# Generation_distributions
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: paper.filtered.Rout 

##################################################################


# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R)

## Conceptual picture (idea ripped off from whom?)
## If generations are faster, steps are smaller and R0 is lower
steps.Rout: steps.R

## Wide version possibly to include in the WL_update paper (~/git/generation_interval_moments/)
steps.wide.pdf: steps.R

##################################################################

# Pictures of filtered mean stuff

# funhist has histogram functions
# filtered.R is expecting some sort of calculated objects

# Need to keep working on updating this once I have access to the goshdarned missing file (assuming this ever happens!)

%.filtered.Rout: %.Rout funhist.Rout filtered.R
	$(run-R)

paper.filtered.Rout: lognormal.Rout funhist.Rout paper.R
	$(run-R)

exponential.Rout: lognormal.Rout

exponential.filtered.Rout: exponential.R

contour.Rout: contour.R

condition.Rout: condition.R

lognormal.filtered.Rout: funhist.R

# Confusing conceptual diagram with diagonal arrow (replaced by a pair of diagrams)
contour.Rout: par.R contour.R
	$(run-R)

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

simple.Rout: simple.R

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
