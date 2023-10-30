# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
PROJECTDIR    = /workspace
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

gettext-%:
	@for version in $(VERSIONS) ; do \
	$(SPHINXBUILD) -M gettext $(SOURCEDIR)/$$version $(BUILDDIR)/$$version ; \
	done

# resources ターゲット: .po ファイルを更新し、.mo ファイルを生成
resources: gettext
	cd $(SOURCEDIR)/$(VERSION) ;
	@for lang in $(LANGUAGES) ; do \
	cd $(SOURCEDIR)/$(VERSION) ; \
	pwd ; \
	sphinx-intl update -p $(POTDIR) -l $$lang ; \
	done


html: Makefile
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(DOCSDIR)" $(SPHINXOPTS) $(O)
	touch $(DOCSDIR)/.nojekyll

html-%: $(addprefix html-, $(NAMES))

html-%: resources
	@for lang in $(LANGUAGES) ; do \
	$(SPHINXBUILD) -b html -D language="$$lang" "$(SOURCEDIR)/${@:html-%=%}" "$(DOCSDIR)/$$lang/${@:html-%=%}" $(SPHINXOPTS) $(O) ; \
	done

echo:
	@echo $(VERSION)