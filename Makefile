# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
PROJECTDIR    = .
VERSION       = `git branch --contains | cut -d " " -f 2`
VERSIONS      = 2.0 2.1 2.2
SOURCEDIR     = $(PROJECTDIR)/src
BUILDDIR      = $(PROJECTDIR)/_build
DOCSDIR       = $(PROJECTDIR)/docs
POTDIR        = $(BUILDDIR)/$(VERSION)/gettext
LANGUAGES     = en ja
LOCALE_DIR    = $(PROJECTDIR)/locale

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# gettext ターゲット: .pot ファイルを取り出し
gettext:
	@$(SPHINXBUILD) -M gettext $(SOURCEDIR)/$(VERSION) $(BUILDDIR)/$(VERSION)

gettext-all:
	@for version in $(VERSIONS) ; do \
	$(SPHINXBUILD) -M gettext $(SOURCEDIR)/$$version $(BUILDDIR)/$$version ; \
	done

# resources ターゲット: .po ファイルを更新し、.mo ファイルを生成
resources: gettext
	@for lang in $(LANGUAGES) ; do \
	cd $(SOURCEDIR)/$(VERSION) ; \
	sphinx-intl update -p $(POTDIR) -l $$lang ; \
	done

resources-all: gettext-all
	@for version in $(VERSIONS) ; do \
	cd $(SOURCEDIR)/$$version ; \
 for lang in $(LANGUAGES) ; do \
	sphinx-intl update -p ../../$(BUILDDIR)/$$version/gettext -l $$lang ; \
	done ; \
	done

html: Makefile
# 	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(DOCSDIR)" $(SPHINXOPTS) $(O)
# 	touch $(DOCSDIR)/.nojekyll
	version=$(VERSION) ; \
	sed -e "s/#__version__#/$$version/" $(SOURCEDIR)/index.html > $(DOCSDIR)/index.html

html-%: $(addprefix html-, $(NAMES))

html-%: resources
	@for lang in $(LANGUAGES) ; do \
	$(SPHINXBUILD) -b html -D language="$$lang" "$(SOURCEDIR)/${@:html-%=%}" "$(DOCSDIR)/$$lang/${@:html-%=%}" $(SPHINXOPTS) $(O) ; \
	done
	touch $(DOCSDIR)/.nojekyll
	version=$(VERSION) ; \
	sed -e "s/#__version__#/$$version/" $(SOURCEDIR)/index.html > $(DOCSDIR)/index.html

html-all: resources-all
	@for version in $(VERSIONS) ; do \
	for lang in $(LANGUAGES) ; do \
	$(SPHINXBUILD) -b html -D language="$$lang" "$(SOURCEDIR)/$$version" "$(DOCSDIR)/$$lang/$$version" $(SPHINXOPTS) $(O) ; \
	done ; \
	done
	touch $(DOCSDIR)/.nojekyll
	version=$(VERSION) ; \
	sed -e "s/#__version__#/$$version/" $(SOURCEDIR)/index.html > $(DOCSDIR)/index.html

clean:
	rm -rf $(BUILDDIR) $(DOCSDIR)/*
	