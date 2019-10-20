# @Filename: wildcard-cpp.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:06pm]
# @Modified: October 20th, 2019 [12:34am]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef CUSTOMBUILD
$(OBJDIR)/release/%.o: %.cpp %.hpp .pre_build
	@printf "[%02d/%02d] Compiling CXX object $(subst $(OBJDIR)/release/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CXX) $(RELEASECXXFLAGS) -c -MT $@ -MD -MP -MF $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $< -o $@
	@mv -f $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).d

$(OBJDIR)/release/%.o: %.cpp .pre_build
	@printf "[%02d/%02d] Compiling CXX object $(subst $(OBJDIR)/release/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CXX) $(RELEASECXXFLAGS) -c -MT $@ -MD -MP -MF $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $< -o $@
	@mv -f $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).d
endif
