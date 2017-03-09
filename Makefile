# Generation_distributions

current: target

target pngtarget pdftarget vtarget acrtarget: rabies_mle_curve.Rout 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md notes.txt
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

# Paper now uses this flatter version of Ebola example
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

######################################################################

# DSW's examples (in DSW's style)

example.Rout: Flu.Rout example.R

KW_comparison.Rout: euler.Rout KW_comparison.R

KW_contour.Rout: XN.Rout KW_contour.R

emd_log.Rout: emd_log.R

KW_rabies.Rout: KW_rabies.R

# Scripts don't run, or something
# KW_rabies.Rout: Rabies.Rout gamma.Rout euler.Rout XN.Rout SARSCurve.Rout EbolaCurve.Rout KW_rabies.R

######################################################################

## Rabies pipeline

## Data from Hampson (removed C-M, don't change after this).
Sources += $(wildcard *.csv)
Hampson =  RabiesIncubation.csv RabiesInfection.csv rabiesData.R

rabies_drop/%: rabies_drop

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
rabies_mle.Rout: Rabies.Rout mle.Rout gen_mle.R rabies_hist.R
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
rabies_mle_curve.Rout: rabies_mle.Rout euler.Rout mle_curve.R mle_curve_legend.R
	$(run-R)

# Sampling stuff with Ebola (ebola_sample.Rout)
## Even when sample size is small, MLE is robust, moment matching not so much
#### Example histogram
ebola_sample_ex.Rout: lognormal.Rout euler.Rout sample_gen.R mle.R gen_mle.R mle_hist_legend.R
	$(run-R)

#### Fancy shaded curves
ebola_sample_curve.Rout: lognormal.Rout euler.Rout WHO.Rout mle.R gamma_sample.Rout sample_graph.R
	$(run-R)

%_Rout.pdf: %.Rout.pdf
	$(link) 

ebola_sample_curve.pdf: ebola_sample_curve.Rout.pdf
	$(LN)

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

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk
-include $(ms)/linkdirs.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
