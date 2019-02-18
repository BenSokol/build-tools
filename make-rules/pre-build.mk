# @Filename: pre-build.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 16th, 2019 [7:32pm]
# @Version:  1.1.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

# Pre-Build Start
.pre_build: $(MAKEFILE_FILES) $(DEPDIR)/.pre_build $(OBJDIR)/.pre_build $(PREBUILD)
	@touch .pre_build

# Generate folder structure for specified folders (Normally deps/ and obj/)
%/.pre_build:
	@mkdir -p $(strip $(addprefix $(shell dirname $@)/, $(shell find $(SRCDIR) -type d -not -path "*.git*" -print)))
	@mkdir -p $(strip $(addprefix $(shell dirname $@)/, $(shell find $(SUBDIR) -type d -not -path "*.git*" -not -path "$(MAKEFILE_DIR_LOCATION)*" -print)))
	@printf "[%02d/%02d] Created $(shell dirname $@) folder structure\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@touch $@
