# @Filename: link.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:08pm]
# @Modified: October 20th, 2019 [12:34am]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef CUSTOMBUILD
$(BINDIR)/$(EXE)-release: .pre_build $(strip $(RELEASEOBJECTS)) $(LIB)
	@printf "[%02d/%02d] Linking $(EXE)\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CXX) $(RELEASELDFLAGS) -o $(BINDIR)/$(EXE)-release $(RELEASEOBJECTS) $(LIB)
endif
