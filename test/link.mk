# @Filename: link.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:08pm]
# @Modified: November 1st, 2019 [5:46pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_TEST_DISABLE
ifndef CUSTOMBUILD
$(TESTEXE): .pre_build $(strip $(TESTOBJECTS)) $(LIB)
	@printf "[%02d/%02d] Linking $(TESTEXE)\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CXX) $(TESTLDFLAGS) -o $(TESTEXE) $(TESTOBJECTS) $(LIB)
endif
endif
