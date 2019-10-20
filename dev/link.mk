# @Filename: link.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:08pm]
# @Modified: October 19th, 2019 [11:43pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef CUSTOMBUILD
$(BINDIR)/$(EXE)-dev: .pre_build $(strip $(DEVOBJECTS)) $(LIB)
	@printf "[%02d/%02d] Linking $(EXE)\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CXX) $(DEVLDFLAGS) -o $(BINDIR)/$(EXE)-dev $(DEVOBJECTS) $(LIB)
endif
