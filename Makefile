# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = sphinx
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile libmcu cbor firmware MADI pwifi pmqtt pl4 pble bq25180

libmcu:
	@-git clone https://github.com/libmcu/libmcu.git
cbor:
	@-git clone https://github.com/libmcu/cbor.git
firmware:
	@-git clone https://github.com/libmcu/firmware.git
MADI:
	@-git clone https://github.com/libmcu/MADI.git
pwifi:
	@-git clone https://github.com/libmcu/pwifi.git
pmqtt:
	@-git clone https://github.com/libmcu/pmqtt.git
pl4:
	@-git clone https://github.com/libmcu/pl4.git
pble:
	@-git clone https://github.com/libmcu/pble.git
bq25180:
	@-git clone https://github.com/libmcu/bq25180.git

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile | libmcu cbor firmware MADI pwifi pmqtt pl4 pble bq25180
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
