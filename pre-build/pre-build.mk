# @Filename: pre-build.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: October 19th, 2019 [8:30pm]
# @Version:  1.1.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

# Pre-Build Start
.pre_build: $(MAKEFILE_FILES) $(DEPDIR)/.pre_build $(OBJDIR)/.pre_build $(PREBUILD)
	@mkdir -p $(BINDIR)
	@printf "[%02d/%02d] Created bin folder\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@touch .pre_build

# Generate folder structure for specified folders (Normally deps/ and obj/)
%/.pre_build:
	@mkdir -p $(strip $(addprefix $(shell dirname $@)/dev/, $(shell find $(SRCDIR) -type d -not -path "*.git*" -print)))
	@mkdir -p $(strip $(addprefix $(shell dirname $@)/dev/, $(shell find $(SUBDIR) -type d -not -path "*.git*" -not -path "$(MAKEFILE_DIR_LOCATION)*" -print)))

	@mkdir -p $(strip $(addprefix $(shell dirname $@)/release/, $(shell find $(SRCDIR) -type d -not -path "*.git*" -print)))
	@mkdir -p $(strip $(addprefix $(shell dirname $@)/release/, $(shell find $(SUBDIR) -type d -not -path "*.git*" -not -path "$(MAKEFILE_DIR_LOCATION)*" -print)))

	@mkdir -p $(strip $(addprefix $(shell dirname $@)/debug/, $(shell find $(SRCDIR) -type d -not -path "*.git*" -print)))
	@mkdir -p $(strip $(addprefix $(shell dirname $@)/debug/, $(shell find $(SUBDIR) -type d -not -path "*.git*" -not -path "$(MAKEFILE_DIR_LOCATION)*" -print)))
ifndef MAKEFILE_RULE_TEST_DISABLE
	@mkdir -p $(strip $(addprefix $(shell dirname $@)/test/, $(shell find $(SRCDIR) -type d -not -path "*.git*" -print)))
	@mkdir -p $(strip $(addprefix $(shell dirname $@)/test/, $(shell find $(SUBDIR) -type d -not -path "*.git*" -not -path "$(MAKEFILE_DIR_LOCATION)*" -print)))
	@mkdir -p $(strip $(addprefix $(shell dirname $@)/test/, $(shell find $(TESTDIR) -type d -not -path "*.git*" -print)))
endif
	@printf "[%02d/%02d] Created $(shell dirname $@) folder structure\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@touch $@
