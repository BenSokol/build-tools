# @Filename: release.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: October 20th, 2019 [3:21am]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

.PHONY: dev
release: $(BINDIR)/$(EXE)-release
	@printf "[%02d/%02d] Creating symlink to $(BINDIR)/$(EXE)-release\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@ln -s -f $(BINDIR)/$(EXE)-release $(EXE)
ifdef POSTBUILD
	@make -s .post_build
endif
