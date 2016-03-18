msrepo = https://github.com/dushoff
gitroot = ../
Drop = ~/Dropbox/courses
export ms = $(gitroot)/makestuff

-include local.mk
-include $(gitroot)/local.mk
export ms = $(gitroot)/makestuff
-include $(ms)/os.mk

filedir = $(Drop)/Lecture_images

Makefile: files

files: $(filedir)
	$(link)

$(filedir):
	$(mkdir)
