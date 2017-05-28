msrepo = https://github.com/dushoff
gitroot = ../
Drop = ~/Dropbox/
export ms = $(gitroot)/makestuff

-include local.mk
-include $(gitroot)/local.mk
export ms = $(gitroot)/makestuff
-include $(ms)/os.mk

filedir = $(Drop)/Lecture_image_files

Makefile: files

files: $(filedir)
	$(link)

$(filedir):
	$(mkdir)
