# @Filename: Makefile
# @Author:   Ben Sokol
# @Email:    ben@bensokol.com
# @Created:  October 25th, 2018 [7:15pm]
# @Modified: October 21st, 2019 [2:50pm]
# @Version:  5.0.0
#
# Copyright (C) 2018-2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_DIR_LOCATION
$(error MAKEFILE_DIR_LOCATION is not defined. For help, see README.md)
endif

###############################################################################
# Makefile Init (DO NOT EDIT)                                                 #
###############################################################################
ifneq ($(words $(MAKECMDGOALS)),1) # if no argument was given to make...
.DEFAULT_GOAL = dev
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

-include ./Makefile-Settings.mk
include $(MAKEFILE_DIR_LOCATION)/Makefile-Default-Settings.mk

ifndef ECHOCOUNT
ifeq ($(ENABLE_LOGGING),1)
$(shell printf "$(shell date) - make $(MAKECMDGOALS)\n" >> $(LOG_FILE))
else
$(shell if [ -e $(LOG_FILE) ]; then rm $(LOG_FILE); fi)
endif
endif

###############################################################################
# Makefile Build Script                                                       #
###############################################################################
MAKEFILE_FILES = $(strip Makefile $(shell if [ -f "Makefile-Settings.mk" ]; then printf "Makefile-Settings.mk"; fi) $(shell if [ -f "Makefile-Special-Rules.mk" ]; then printf "Makefile-Special-Rules.mk"; fi) $(MAKEFILE_DIR_LOCATION)/Makefile $(shell find $(MAKEFILE_DIR_LOCATION) -type f -name '*.mk'))
CPPCHECK_FLAGS := $(strip $(CPPCHECK_FLAGS) $(CPPCHECK_DEFINES) $(CPPCHECK_SUPPRESS) $(CPPCHECK_ENABLE))
-include $(shell find $(DEPDIR) -type f -name '*.d' 2> /dev/null)

# Initalize WARNING_FLAGS based on compiler (clang vs gcc)
COMPILER_HELP := $(shell $(CXX) --help | head -n 1)
ifneq (,$(findstring clang,$(COMPILER_HELP)))
WARNING_FLAGS := $(strip $(WARNING_FLAGS) $(WARNING_FLAGS_CLANG))
else ifneq (,$(findstring g++,$(patsubst %g++%,g++,$(COMPILER_HELP))))
WARNING_FLAGS := $(strip $(WARNING_FLAGS) $(WARNING_FLAGS_GCC))
else
$(warning $(shell echo "\033[35m")WARNING$(shell echo "\033[39m"): Unknown Compiler. Supported compilers: g++, clang.)
endif

# Disable compiler specific warnings (unable to fix because they are caused by flex/bison generated files)
ifeq ($(shell uname),Darwin)
WARNING_FLAGS += $(MACOS_FLAGS)
DEBUGGER = lldb # macos doesnt have gdb, so must use lldb
else ifeq ($(shell uname),Linux)
WARNING_FLAGS += $(LINUX_FLAGS)
else
$(warning $(shell echo "\033[35m")WARNING$(shell echo "\033[39m"): Unknown Operating System '$(shell uname)'.)
endif

# Set include paths, allows inclusion of filenames without paths
INC += $(strip $(addprefix -I, $(shell find $(SRCDIR) $(SUBDIR) -type d -not -path "*.git*" -not -path "$(MAKEFILE_DIR_LOCATION)*" -print)))

ifeq ($(LDFLAGS),)
LDFLAGS := $(strip $(CXXSTD) $(CXXFLAGS) $(WARNING_FLAGS) $(INC))
else
LDFLAGS := $(strip $(LDFLAGS) $(WARNING_FLAGS) $(INC))
endif

CFLAGS   := $(strip $(CSTD) $(CFLAGS) $(WARNING_FLAGS) $(INC))
CXXFLAGS := $(strip $(CXXSTD) $(CXXFLAGS) $(WARNING_FLAGS) $(INC))

CSOURCES := $(shell find $(SRCDIR) -type f -name '*.c')
CSOURCES += $(shell find $(SUBDIR) -type f -name '*.c')

CPPSOURCES := $(shell find $(SRCDIR) -type f -name '*.cpp')
CPPSOURCES += $(shell find $(SUBDIR) -type f -name '*.cpp')

COBJECTS += $(patsubst %.c,$(OBJDIR)/%.o,$(CSOURCES))
CPPOBJECTS += $(patsubst %.cpp,$(OBJDIR)/%.o,$(CPPSOURCES))

SOURCES = $(strip $(CSOURCES) $(CPPSOURCES))
OBJECTS = $(strip $(COBJECTS) $(CPPOBJECTS))

###############################################################################
# Makefile Release Rules                                                      #
###############################################################################
RELEASELDFLAGS  := $(strip $(LDFLAGS) $(RELEASEFLAGS))
RELEASECFLAGS   := $(strip $(CFLAGS) $(RELEASEFLAGS))
RELEASECXXFLAGS := $(strip $(CXXFLAGS) $(RELEASEFLAGS))
RELEASEOBJECTS := $(strip $(patsubst $(OBJDIR)/%,$(OBJDIR)/release/%,$(OBJECTS)))

###############################################################################
# Makefile Dev Rules                                                          #
###############################################################################
DEVLDFLAGS  := $(strip $(LDFLAGS) $(DEVFLAGS))
DEVCFLAGS   := $(strip $(CFLAGS) $(DEVFLAGS))
DEVCXXFLAGS := $(strip $(CXXFLAGS) $(DEVFLAGS))
DEVOBJECTS := $(strip $(patsubst $(OBJDIR)/%,$(OBJDIR)/dev/%,$(OBJECTS)))

###############################################################################
# Makefile Debug Rules                                                        #
###############################################################################
DEBUGLDFLAGS  := $(strip $(LDFLAGS) $(DEBUGFLAGS))
DEBUGCFLAGS   := $(strip $(CFLAGS) $(DEBUGFLAGS))
DEBUGCXXFLAGS := $(strip $(CXXFLAGS) $(DEBUGFLAGS))
DEBUGOBJECTS := $(strip $(patsubst $(OBJDIR)/%,$(OBJDIR)/debug/%,$(OBJECTS)))

###############################################################################
# Makefile Test Rules                                                         #
###############################################################################
ifndef MAKEFILE_RULE_TEST_DISABLE

TESTINC += $(strip $(INC) $(addprefix -I, $(shell find $(TESTDIR) -type d -not -path "*.git*" -print)))
TESTCSOURCES += $(shell find $(TESTDIR) -type f -name '*.c')
TESTCPPSOURCES += $(shell find $(TESTDIR) -type f -name '*.cpp')

TESTLDFLAGS  := $(strip $(filter-out -DNDEBUG, $(LDFLAGS)) $(TESTFLAGS))
TESTCFLAGS   := $(strip $(filter-out -DNDEBUG, $(CFLAGS)) $(TESTFLAGS))
TESTCXXFLAGS := $(strip $(filter-out -DNDEBUG, $(CXXFLAGS)) $(TESTFLAGS))


TESTCOBJECTS += $(patsubst %.c,$(OBJDIR)/%.o, $(TESTCSOURCES))
TESTCPPOBJECTS += $(patsubst %.cpp,$(OBJDIR)/%.o, $(TESTCPPSOURCES))

TESTSOURCES := $(SOURCES) $(TESTCSOURCES) $(TESTCPPSOURCES)
TESTOBJECTS := $(OBJECTS) $(TESTCOBJECTS) $(TESTCPPOBJECTS)

TESTSOURCES := $(filter-out $(MAIN_FILE), $(TESTSOURCES))
TESTOBJECTS := $(filter-out $(patsubst %.cpp,$(OBJDIR)/%.o,$(MAIN_FILE)), $(TESTOBJECTS))

TESTSOURCES := $(strip $(TESTSOURCES))
TESTOBJECTS := $(strip $(patsubst $(OBJDIR)/%,$(OBJDIR)/test/%,$(TESTOBJECTS)))
endif

###############################################################################
# Makefile Build Rules                                                        #
###############################################################################

include $(MAKEFILE_DIR_LOCATION)/release/release.mk
include $(MAKEFILE_DIR_LOCATION)/release/link.mk
include $(MAKEFILE_DIR_LOCATION)/release/wildcard/c.mk
include $(MAKEFILE_DIR_LOCATION)/release/wildcard/cpp.mk

include $(MAKEFILE_DIR_LOCATION)/dev/dev.mk
include $(MAKEFILE_DIR_LOCATION)/dev/link.mk
include $(MAKEFILE_DIR_LOCATION)/dev/wildcard/c.mk
include $(MAKEFILE_DIR_LOCATION)/dev/wildcard/cpp.mk

include $(MAKEFILE_DIR_LOCATION)/debug/debug.mk
include $(MAKEFILE_DIR_LOCATION)/debug/link.mk
include $(MAKEFILE_DIR_LOCATION)/debug/wildcard/c.mk
include $(MAKEFILE_DIR_LOCATION)/debug/wildcard/cpp.mk

ifndef MAKEFILE_RULE_TEST_DISABLE
include $(MAKEFILE_DIR_LOCATION)/test/test.mk
include $(MAKEFILE_DIR_LOCATION)/test/link.mk
include $(MAKEFILE_DIR_LOCATION)/test/wildcard/c.mk
include $(MAKEFILE_DIR_LOCATION)/test/wildcard/cpp.mk
endif

include $(MAKEFILE_DIR_LOCATION)/pre-build/pre-build.mk

###############################################################################
# Makefile Other Rules                                                        #
###############################################################################
-include $(shell find $(MAKEFILE_DIR_LOCATION)/make-utilities -type f -name '*.mk')

###############################################################################
# Makefile Special Rules                                                      #
###############################################################################
-include ./Makefile-Special-Rules.mk

endif # This endif is necessary - See Makefile Init
