# @Filename: wildcard-c.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:06pm]
# @Modified: October 20th, 2019 [12:43am]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_TEST_DISABLE
ifndef CUSTOMBUILD
$(OBJDIR)/test/%.o: %.c %.h .pre_build
	@printf "[%02d/%02d] Compiling C object $(subst $(OBJDIR)/test/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CC) $(TESTCFLAGS) -c -MT $@ -MD -MP -MF $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $< -o $@
	@mv -f $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).d

$(OBJDIR)/test/%.o: %.c .pre_build
	@printf "[%02d/%02d] Compiling C object $(subst $(OBJDIR)/test/,,$(@))\n" `expr $(CURRENT_STEP)` $(TOTAL_STEPS) #$(ECHOCOUNT)
	@$(CC) $(TESTCFLAGS) -c -MT $@ -MD -MP -MF $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $< -o $@
	@mv -f $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).Td $(patsubst %.o,%,$(subst $(OBJDIR)/,$(DEPDIR)/,$(@))).d
endif
endif
