# MIT License
# Copyright (c) 2018 Nicola Worthington <nicolaw@tfb.net>.
#
# TODO:
#   1. Perform data extraction for all other published locations (in addition
#      to the GitHub export), as well as match against third-party packaged
#      releases of my code in things like EPEL, Debian and Ubuntu etc.
#   2. Present an aggregate of all the information in a nicely presented
#      HTML page. Probably a static HTML page that uses some simple Javascript
#      to format the JSON source, or maybe an XSLT if I am feeling masochistic.

DOCKERHUB_USER := nicolaw
CPAN_USER := nicolaw
LAUNCHPAD_USER := nicolaw
STACKOVERFLOW_USER := 3784173
GITLAB_USER := nicolaw

GITHUB_USER := NeechBear
GITHUB_CSV  := github.csv

DATA_FILES = $(GITHUB_CSV)

MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SNAPSHOT_DIR := $(MAKEFILEDIR)snapshots

.PHONY: all clean snapshot
.DEFAULT_GOAL = all

all: $(GITHUB_CSV)
	@echo GitHub Projects: $(GITHUB_CSV)

clean:
	$(RM) $(GITHUB_CSV)

snapshot: $(DATA_FILES)
	mkdir -p $(SNAPSHOT_DIR)
	for file in $(DATA_FILES) ; do cp -p "$$file" $(SNAPSHOT_DIR)/"$${file}.$(shell date +"%Y%m%d-%H%M")" ; done

$(GITHUB_CSV):
	$(MAKEFILE_DIR)github-repos.sh $(GITHUB_USER) > $@
