# Lecture_images

current: target
target = Makefile
-include target.mk
target: $(target)

##################################################################

# make files
## and so on

Sources = Makefile .gitignore README.md sub.mk LICENSE.md todo.md

Drop = ~/Dropbox

include sub.mk
-include $(ms)/perl.def

Sources += images.mk

##################################################################

# Step files

########## General
## Images that represent different countries
countries.html: countries.step

####### Disease spread
## Disease organisms
diseases.html: diseases.step

ebola.html: ebola.step html.pl
hiv.html: hiv.step
flu.html: flu.step

health.html: health.step

## Human heterogeneity
humans.html: humans.step

###### What the hell is this category? Maybe stuff that was here before I started organizing?
import.html: import.step

## Career stuff (I guess)
journals.html: journals.step

##### Selected for 3SS units
competition.html: competition.step
dandelions.html: dandelions.step
life_history.html: life_history.step
logs.html: logs.step
nonlinear.html: nonlinear.step
populations.html: populations.step
structure.html: structure.step
units.html: units.step

######## Selected for ICI3D
models.html: models.step
## Boxcars
dynamics.html: dynamics.step

## Selected for particular talks
aging.html: aging.step
evaluation.html: evaluation.step
rabies.html: rabies.step

########################################################################

### Rules for getting stuff

## Here is a list of files that are in the first Dropbox version (under courses) but got there by other means
Sources += copies.txt

steps = $(wildcard *.step)
Sources += $(steps)
Sources += $(wildcard *.pl)

%.step.mk: %.step mk.pl
	$(PUSH)

%.html: %.step.mk html.pl
	$(MAKE) -f $< -f images.mk images
	$(MAKE) -f $< -f images.mk thumbs
	$(PUSHSTAR)

stepmks = $(steps:.step=.step.mk)
allsteps.mk: $(stepmks)
	$(cat)

######################################################################

## Pictures from me
## Supposed to be somewhere else (my_images, I guess)

Sources += elegant.jpg

## Digest files
htmls =  $(steps:.step=.html)

all.html: $(htmls)
	$(cat)

current.html: hiv.html ebola.html models.html import.html
	$(cat)

######################################################################

Makefile: files

files: 
	(touch $Drop/Lecture_images/test && /bin/ln -fs $(Drop)/Lecture_images $@) || $(mkdir)

######################################################################

# Special image rules

files/linked.crop.jpg: files/linked.jpg Makefile
	convert -crop 900x550+60+420 $< $@

files/TREE.top.jpg: files/TREE.jpg
	convert -crop 340x340+0+0 $< $@

files/rabies_transmission_model.crop.png: files/rabies_transmission_model.png
	convert -crop 1400x800+0+0 $< $@

files/recommendations.pdf:
	wget -O $@ "http://apps.who.int/iris/bitstream/10665/186275/1/9789241509565_eng.pdf"

files/recommendations.cover.png:

%.cover.png: %-0.pdf
	convert -density 300 $< $@

%.png: %.gif
	convert $< $@

Sources += missing.txt
files/%: missing.txt.pdf
	convert $< $@

######################################################################

### Makestuff

-include allsteps.mk
-include $(ms)/git.mk
-include $(ms)/modules.mk
-include $(ms)/visual.mk
-include $(ms)/RR/pdf.mk

-include $(ms)/forms.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
