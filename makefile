include local.makefile

R = Rscript $^ $@
Rstar = Rscript $^ $* $@

INPUTS_RAW_LINK := $(SHARED_DATA_FOLDER)/inputs/raw
OUTDIR_LINK := $(SHARED_DATA_FOLDER)/outputs
FIGS_LINK := $(SHARED_DATA_FOLDER)/figs

INPUTS_DIR := ./inputs
CODE_DIR := ./code
OUTPUTS_DIR := ./outputs
TMP_OUTDIR ?= ./tmp_out
FIGS_DIR := ./figs

$(INPUTS_DIR):
	mkdir -p $(INPUTS_DIR)

$(INPUTS_DIR)/raw: | $(INPUTS_DIR)
	ln -s $(INPUTS_RAW_LINK) $(INPUTS_DIR)/raw

$(CODE_DIR):
	mkdir -p $(CODE_DIR)
	
$(OUTPUTS_DIR):
	ln -s $(OUTDIR_LINK) $(OUTPUTS_DIR)
	
$(TMP_OUTDIR):
	mkdir -p $(TMP_OUTDIR)
	
$(FIGS_DIR):
	ln -s $(FIGS_LINK) $(FIGS_DIR)
	
setup: $(INPUTS_DIR) $(INPUTS_DIR)/raw $(CODE_DIR) $(OUTPUTS_DIR) $(FIGS_DIR)\
$(TMP_OUTDIR)

DATE ?= $(shell date +'%Y-%m-%d')
