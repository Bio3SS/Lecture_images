images: $(images)
thumbs: $(thumbs)

%.thumb.png: %.png
	convert -resize x200 $< $@

%.thumb.png: %.jpg
	convert -resize x200 $< $@
