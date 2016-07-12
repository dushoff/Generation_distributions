# Generation_distributions
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: notarget

##################################################################


# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R)

exponential.Rout: lognormal.Rout

exponential.filtered.Rout: exponential.R

contour.Rout: contour.R

condition.Rout: condition.R

test.Rout: test.R

lognormal.filtered.Rout: funhist.R

%.filtered.Rout: %.Rout funhist.Rout filtered.R
	$(run-R)

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
