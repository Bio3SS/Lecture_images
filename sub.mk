ms = makestuff
-include local.mk
-include $(ms)/os.mk

Sources += $(ms)

$(ms):
	git submodule add git@github.com:dushoff/$@.git

$(ms)/%.mk: 
	git submodule init $(ms) 
	git submodule update $(ms) 
