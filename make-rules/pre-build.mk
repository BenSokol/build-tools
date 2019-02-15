# @Filename: pre-build.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 14th, 2019 [5:30pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

# Pre-Build Start
.pre_build: Makefile $(DEPDIR)/.pre_build $(OBJDIR)/.pre_build $(PREBUILD)
	@touch .pre_build

# Generate folder structure for specified folders (Normally deps/ and obj/)
%/.pre_build:
	@mkdir -p $(shell dirname $@) && mkdir -p $(shell dirname $@)/$(SRCDIR) && rsync -aq --exclude '*.git*' -f"+ */" -f"- *" $(SRCDIR)/ $(shell dirname $@)/$(SRCDIR) && mkdir -p $(shell dirname $@)/$(SUBDIR) && rsync -aq --exclude '*.git*' -f"+ */" -f"- *" $(SUBDIR)/ $(shell dirname $@)/$(SUBDIR)/
	@printf "[%02d/%02d] Created $(shell dirname $@) folder structure\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@touch $@
