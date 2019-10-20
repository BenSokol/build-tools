# @Filename: wildcard-c.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:06pm]
# @Modified: October 19th, 2019 [11:43pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef CUSTOMBUILD
$(OBJDIR)/dev/%.o: %.c %.h .pre_build
	@printf "[%02d/%02d] Compiling C object $(subst $(OBJDIR)/dev/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CC) $(DEVCFLAGS) -c -MT $@ -MD -MP -MF $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $< -o $@
	@mv -f $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).d

$(OBJDIR)/dev/%.o: %.c .pre_build
	@printf "[%02d/%02d] Compiling C object $(subst $(OBJDIR)/dev/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CC) $(DEVCFLAGS) -c -MT $@ -MD -MP -MF $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $< -o $@
	@mv -f $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).d
endif
