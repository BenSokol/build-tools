# @Filename: wildcard-cpp.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:06pm]
# @Modified: February 15th, 2019 [12:49pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.


$(OBJDIR)/%.o: %.cpp %.hpp .pre_build
	@printf "[%02d/%02d] Compiling CXX object $(subst $(OBJDIR)/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CXX) $(CXXFLAGS) -c -MT $@ -MD -MP -MF $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).Td $< -o $@
	@mv -f $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).Td $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).d

$(OBJDIR)/%.o: %.cpp .pre_build
	@printf "[%02d/%02d] Compiling CXX object $(subst $(OBJDIR)/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CXX) $(CXXFLAGS) -c -MT $@ -MD -MP -MF $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).Td $< -o $@
	@mv -f $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).Td $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).d
