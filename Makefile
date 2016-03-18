# Lecture_images
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: exploitation.html 

##################################################################

# make files
## and so on

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md

include stuff.mk
include $(ms)/perl.def
include $(ms)/os.mk

##################################################################

Sources += images.mk

steps = $(wildcard *.step)
Sources += $(steps)
htmls =  $(steps:.step=.html)

all.html: $(htmls)
	$(cat)

# HOOK

countries.html: countries.step html.pl
exploitation.html: exploitation.step 

## Content

Sources += $(wildcard *.pl)

%.step.mk: %.step mk.pl
	$(PUSH)

%.html: %.step.mk html.pl
	$(MAKE) -f $< -f images.mk images
	$(MAKE) -f $< -f images.mk thumbs
	$(PUSHSTAR)

files/linked.crop.jpg: files/linked.jpg Makefile
	convert -crop 900x550+60+420 $< $@

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
