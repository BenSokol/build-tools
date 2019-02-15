# @Filename: Makefile
# @Author:   Ben Sokol
# @Email:    ben@bensokol.com
# @Created:  October 25th, 2018 [7:15pm]
# @Modified: February 14th, 2019 [6:20pm]
# @Version:  3.0.0
#
# Copyright (C) 2018-2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_DIR_LOCATION
$(error MAKEFILE_DIR_LOCATION is not defined.)
endif

###############################################################################
# Makefile Init (DO NOT EDIT)                                                 #
###############################################################################
ifneq ($(words $(MAKECMDGOALS)),1) # if no argument was given to make...
.DEFAULT_GOAL = build
%:
	@$(MAKE) $@ --no-print-directory -rf Makefile
else
ifndef ECHOCOUNT
TOTAL_STEPS := $(shell $(MAKE) $(MAKECMDGOALS) --no-print-directory -nrf $(firstword $(MAKEFILE_LIST)) ECHOCOUNT="COUNTTHIS" | grep -c "COUNTTHIS")
N := x
CURRENT_STEP = $(words $N)$(eval N := x $N)
endif
# endif is located at bottom of file

###############################################################################
# Makefile Settings                                                           #
###############################################################################

include ./Makefile-Settings.mk
include $(MAKEFILE_DIR_LOCATION)/Makefile-Default-Settings.mk


###############################################################################
# Makefile Build Script                                                       #
###############################################################################
-include $(shell find $(DEPDIR) -type f -name '*.d' >/dev/null 2>/dev/null)

# Disable compiler specific warnings (unable to fix because they are caused by flex/bison generated files)
ifeq ($(shell uname),Darwin)
WARNING_FLAGS += $(MACOS_FLAGS)
DEBUGGER = lldb # macos doesnt have gdb, so must use lldb
else ifeq ($(shell uname),Linux)
WARNING_FLAGS += $(LINUX_FLAGS)
else
$(error $(shell echo "\033[31m")ERROR$(shell echo "\033[39m"): Unknown Operating System '$(shell uname)')
endif

# Set include paths, allows inclusion of filenames without paths
INC += $(strip $(addprefix -I, $(shell find $(SRCDIR) -type d -not -path "*.git*" -print)) $(addprefix -I, $(shell find $(SUBDIR) -type d -not -path "*.git*" -not -path "$(MAKEFILE_DIR_LOCATION)*" -print)))

CFLAGS   := $(strip $(CSTD) $(CFLAGS) $(WARNING_FLAGS) $(INC))
CXXFLAGS := $(strip $(CXXSTD) $(CXXFLAGS) $(WARNING_FLAGS) $(INC))

CSOURCES := $(shell find $(SRCDIR) -type f -name '*.c')
CSOURCES += $(shell find $(SUBDIR) -type f -name '*.c')

CPPSOURCES := $(shell find $(SRCDIR) -type f -name '*.cpp')
CPPSOURCES += $(shell find $(SUBDIR) -type f -name '*.cpp')

COBJECTS = $(patsubst %.c,$(OBJDIR)/%.o,$(CSOURCES))
CPPOBJECTS += $(patsubst %.cpp,$(OBJDIR)/%.o,$(CPPSOURCES))

SOURCES = $(strip $(CSOURCES) $(CPPSOURCES))
OBJECTS = $(strip $(COBJECTS) $(CPPOBJECTS))


###############################################################################
# Makefile Build Rules                                                        #
###############################################################################
include $(MAKEFILE_DIR_LOCATION)/make-rules/build.mk
include $(MAKEFILE_DIR_LOCATION)/make-rules/link.mk
include $(MAKEFILE_DIR_LOCATION)/make-rules/wildcard/c.mk
include $(MAKEFILE_DIR_LOCATION)/make-rules/wildcard/cpp.mk


###############################################################################
# Makefile Other Rules                                                        #
###############################################################################
-include $(MAKEFILE_DIR_LOCATION)/make-rules/clean.mk
-include $(MAKEFILE_DIR_LOCATION)/make-rules/debug.mk
-include $(MAKEFILE_DIR_LOCATION)/make-rules/memtest.mk
-include $(MAKEFILE_DIR_LOCATION)/make-rules/run.mk
-include $(MAKEFILE_DIR_LOCATION)/make-rules/tar.mk
-include $(MAKEFILE_DIR_LOCATION)/make-rules/var.mk


###############################################################################
# Makefile .pre_build Rules                                                   #
###############################################################################
include $(MAKEFILE_DIR_LOCATION)/make-rules/pre-build.mk


endif # This endif is necessary - See Makefile Init
