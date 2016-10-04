INCLUDES=includes
HEADER=$(INCLUDES)/header.html
FOOTER=$(INCLUDES)/footer.html
PAGES=$(shell find . -name "*.md")
OUTFILES=$(PAGES:.md=.html)
LATEST=.latest.txt

.PHONY: all new publish clean

all: index.html $(OUTFILES) $(HEADER) $(FOOTER)

index.html: index.md

%.html: %.md $(HEADER) $(FOOTER)
	@./.build.sh $< $@ $(HEADER) $(FOOTER) $(LATEST)

index.md: $(LATEST)
	@./.build-index.sh $(LATEST)

new:
	@./.new-post.sh "$(title)"

publish:
	@git add -A && git commit && git push origin master

snapshot:
	@tar -cvzf `date +%Y-%m-%d-`snapshot.tar.gz $(OUTFILES)

clean:
	@rm $(OUTFILES) index.md

