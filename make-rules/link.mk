# @Filename: link.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:08pm]
# @Modified: May 3rd, 2019 [6:34pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

$(EXE): .pre_build $(strip $(OBJECTS)) $(LIB)
	@printf "[%02d/%02d] Linking $(EXE)\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CXX) $(LDFLAGS) -o $(EXE) $(OBJECTS) $(LIB)
