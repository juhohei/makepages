# CONFIG {{{
MARKDOWN=markdown
INCLUDES=includes
HEADER=$(INCLUDES)/header.html
FOOTER=$(INCLUDES)/footer.html
# pages
PAGES=$(shell find . -name "*.md")
OUTFILES=$(PAGES:.md=.html)
FRONTPAGE=.latest.txt
# }}}

.PHONY: all new publish clean

all: index.html $(OUTFILES) $(HEADER) $(FOOTER)

index.html: index.md
%.html: %.md $(HEADER) $(FOOTER)
	@echo "Building $(<:.md=.html)..." 
	@sed "/{{title}}/{s/{{title}}/`basename $< .md`/;s/-/\ /g;}" $(HEADER) > $@
	@$(MARKDOWN) $< >> $@
	@cat $(FOOTER) >> $@

index.md: $(FRONTPAGE)
	@\
	echo -n '' > index.md; \
	sort -r $(FRONTPAGE) -o $(FRONTPAGE); \
	while read line; do \
	echo -e "###[`echo $$line | cut -c 12- | tr '-' ' '`](/$$line.html)\n" \
	>> index.md; \
	echo -e "####`echo $$line | cut -c 1-10 | tr '/' '-'\n`" >> index.md; \
	done < $(FRONTPAGE)

new:
	@\
	dir="`date +%Y/%m/%d`"; \
	test -d $$dir || mkdir -p $$dir; \
	file="$$dir/`echo $$title | sed 's/\ /-/g'`.md"; \
	echo "$${file%.*}" >> $(FRONTPAGE); \
	$$EDITOR $$file

publish:
	@git add -A
	@git commit -m "$m"
	@git push

snapshot:
	@tar -cvzf `date +%Y-%m-%d-`snapshot.tar.gz $(OUTFILES)

clean:
	@rm $(OUTFILES) index.md
