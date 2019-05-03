# @Filename: wildcard-c.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:06pm]
# @Modified: May 3rd, 2019 [7:01pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef CUSTOMBUILD
$(OBJDIR)/%.o: %.c %.h .pre_build
	@printf "[%02d/%02d] Compiling C object $(subst $(OBJDIR)/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CC) $(CFLAGS) -c -MT $@ -MD -MP -MF $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).Td $< -o $@
	@mv -f $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).Td $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).d

$(OBJDIR)/%.o: %.c .pre_build
	@printf "[%02d/%02d] Compiling C object $(subst $(OBJDIR)/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CC) $(CFLAGS) -c -MT $@ -MD -MP -MF $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).Td $< -o $@
	@mv -f $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).Td $(DEPDIR)/$(patsubst %.o,%,$(subst $(OBJDIR)/,,$(@))).d
endif
