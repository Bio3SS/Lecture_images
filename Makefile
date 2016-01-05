# Lecture_images
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: all.html 

##################################################################

# make files
## and so on

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md

include stuff.mk
include $(ms)/perl.def

##################################################################

steps = $(wildcard *.step)
htmls =  $(steps:.step=.html)

all.html: $(htmls)
	$(cat)

# HOOK

countries.html: countries.step html.pl

## Content

Sources += $(wildcard *.pl)

%.step.mk: %.step mk.pl
	$(PUSH)

%.html: %.step.mk html.pl
	$(MAKE) -f $< -f images.mk images
	$(MAKE) -f $< -f images.mk thumbs
	$(PUSHSTAR)

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
