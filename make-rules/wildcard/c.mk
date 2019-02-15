# @Filename: wildcard-c.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:06pm]
# @Modified: February 14th, 2019 [5:09pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

$(OBJDIR)/%.o: %.c %.h .pre_build
	@printf "[%02d/%02d] Compiling C object $(subst $(OBJDIR)/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CC) $(CFLAGS) -c -MT $@ -MD -MP -MF $(DEPDIR)/$(patsubst %.o,%,$(@F)).Td $< -o $@
	@mv -f $(DEPDIR)/$(patsubst %.o,%,$(@F)).Td $(DEPDIR)/$(patsubst %.o,%,$(@F)).d

$(OBJDIR)/%.o: %.c .pre_build
	@printf "[%02d/%02d] Compiling C object $(subst $(OBJDIR)/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CC) $(CFLAGS) -c -MT $@ -MD -MP -MF $(DEPDIR)/$(patsubst %.o,%,$(@F)).Td $< -o $@
	@mv -f $(DEPDIR)/$(patsubst %.o,%,$(@F)).Td $(DEPDIR)/$(patsubst %.o,%,$(@F)).d
