# Generation_distributions

current: target
-include target.mk

##################################################################

# make files

Sources = Makefile .gitignore README.md sub.mk LICENSE.md notes.txt
include sub.mk
# include $(ms)/perl.def

Sources += $(ms) $(dirs)

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
lognormal.Rout: lognormal.R calculate.R

## Make an exponential with parameters matched to the specific lognormal
exponential.Rout: lognormal.Rout

lognormal.ga.Rout: lognormal.Rout gamma.R

## Make a single-gamma approximation to a simulation
%.ga.Rout: %.Rout gamma.R
	$(run-R)

##################################################################

# Pictures of filtered mean stuff

# funhist has histogram functions
# filtered.R is expecting calculated objects (Simulations, above)

%.filtered.Rout: %.Rout calculate.R funhist.Rout filtered.R
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

## Compare Ebola time distributions for talk
%.histcomp.Rout: %.Rout histcomp.R
	$(run-R)

######################################################################

## Curves showing approximations across a range

# Functions for calculating R using Euler's equation
euler.Rout: euler.R

# Some parameters from the Ebola epidemic
WHO.Rout: WHO.R

## Not documented, used for talk examples
gamHist.Rout: par.R gamHist.R
	$(run-R)

# Generic example that was hijacked for a talk
lognormal.curve.Rout: curve.R
%.curve.Rout: %.ga.Rout par.R curve.R
	$(run-R)

# New example
EbolaCurve.cex.Rout: lognormal.ga.Rout euler.Rout WHO.Rout cex.R EbolaCurve.R
	$(run-R)

# Paper now uses this flatter version of Ebola example
EbolaCurve.flat.Rout: lognormal.ga.Rout euler.Rout WHO.Rout flat.R EbolaCurve.R
	$(run-R)


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

genExp.tikz.Rout: genExp_tikz.R
	$(run-R)

genExp.Rout: genExp.R
	$(run-R)

######################################################################

# DSW's examples (in DSW's style)
# deprecated

# example.Rout: Flu.Rout example.R

# KW_comparison.Rout: euler.Rout KW_comparison.R

# KW_contour.Rout: XN.Rout KW_contour.R

# emd_log.Rout: emd_log.R

# KW_rabies.Rout: KW_rabies.R

# Scripts don't run, or something
# KW_rabies.Rout: Rabies.Rout gamma.Rout euler.Rout XN.Rout SARSCurve.Rout EbolaCurve.Rout KW_rabies.R

######################################################################

## Rabies pipeline

## Data from Hampson (removed C-M, don't change after this).
Sources += $(wildcard *.csv)
Hampson =  RabiesIncubation.csv RabiesInfection.csv rabiesData.R

rabies_drop/%: rabies_drop ;

rabies_drop:
	@echo Why is this a separate directory????
	@echo Please link it manually for now
	exit 1

## Read the new data
rabies_periods.Rout: rabies_drop/rdata_2002_2007.csv rabies_periods.R

## Are infectious and incubation periods correlated: ρ-hat 0.28 (0.14, 0.41)
rabies_corr.Rout: rabies_periods.Rout corr.R
	$(run-R)

## General workflow:
ebola_mle.Rout: lognormal.Rout euler.Rout WHO.Rout mle.R gen_mle.R
	$(run-R)

##############################

gamma_sample.Rout: gamma_sample.R

# Ebola curve (normal vs expected)

ebola_normal.Rout: lognormal.ga.Rout normal.R euler.Rout WHO.Rout EbolaCurve.R normalCurve.R normalHist.R
	$(run-R)

Rabies.Rout: rabies_periods.Rout Rabies.R

# Find rabies mle and make default histogram
rabies_mle.Rout: Rabies.Rout calculate.R mle.Rout gen_mle.R rabies_hist.R
	$(run-R)

# Rabies MLE vs moment histogram (nicer version) 
# NOT WORKING
# Daniel: it's usually better to fit and plot in separate scripts.
# Would be nice to figure out how to take output from compare_gamma and make nicer pix
rabies_mle_hist.Rout: rabies_mle.Rout
	$(run-R)

# Rabies MLE vs moment curve (rabies_mle_curve.Rout)
# We don't need to redo all this; I changed your make rule.
# rabies_mle_curve.Rout: Rabies.Rout mle.Rout gen_mle.R euler.R mle_curve.R mle_curve_legend.R
rabies_mle_curve.Rout: rabies_mle.Rout euler.Rout findrho.R mle_curve.R mle_curve_legend.R
	$(run-R)

## Test whether R can use a Chinese character as a variable name
chinese.Rout: chinese.R

#### Fancy shaded curves
ebola_samples.Rout: lognormal.Rout euler.Rout WHO.Rout mle.Rout gamma_sample.Rout sample_fits.R
	$(run-R)

ebola_sample_curve.Rout: ebola_samples.Rout flat.R sample_graph.R
	$(run-R)

measles.Rout: measles.R

measles_curve.Rout: measles.Rout calculate.R euler.Rout flat.R findrho.R gamma.R EbolaCurve.R
	$(run-R)

measles_samples.Rout: measles.Rout calculate.R euler.Rout mle.Rout gamma_sample.Rout findrho.R sample_fits.R
	$(run-R)

measles_sample_curve.Rout: measles_samples.Rout flat.R sample_graph.R
	$(run-R)

%_Rout.pdf: %.Rout.pdf
	$(link) 

#### Normal distribution

wallingaNormal.Rout: wallingaNormal.R

EbolaCurve.normal.flat.Rout: wallingaNormal.Rout  lognormal.ga.Rout euler.Rout WHO.Rout flat.R EbolaCurve.R normalLines.R
	$(run-R)

measles_curve.Normal.Rout: measles_curve.Rout wallingaNormal.Rout normalLines.R
	$(run-R)
	
rabiescurve.Normal.Rout: Rabies.Rout calculate.R gamma.R euler.Rout findrho.R EbolaCurve.R wallingaNormal.Rout normalLines.R
	$(run-R)

######################################################################

# JD's approach to KW

# Response functions and functions for making frames
XN.Rout: XN.R

# Function responses and simple pictures.
gx.Rout: XN.Rout gx.R
# Flatter version
gx.flat.Rout: XN.Rout flat.R gx.R
	$(run-R)


######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk
-include $(ms)/modules.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
