# @Filename: dev.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: October 20th, 2019 [3:29am]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

.PHONY: dev
dev: $(BINDIR)/$(EXE)-dev
	@printf "[%02d/%02d] Creating symlink to $(BINDIR)/$(EXE)-dev\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@ln -s -f $(BINDIR)/$(EXE)-dev $(EXE)
ifdef POSTBUILD
	@make -s .post_build
endif
