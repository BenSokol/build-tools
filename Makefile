# @Filename: Makefile
# @Author:   Ben Sokol
# @Email:    ben@bensokol.com
# @Created:  October 25th, 2018 [7:15pm]
# @Modified: October 2nd, 2019 [10:59pm]
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
MAKEFILE_FILES = $(strip Makefile Makefile-Settings.mk Makefile-Special-Rules.mk $(MAKEFILE_DIR_LOCATION)/Makefile $(shell find $(MAKEFILE_DIR_LOCATION) -type f -name '*.mk'))
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

CUDASOURCES := $(shell find $(SRCDIR) -type f -name '*.cu')
CUDASOURCES += $(shell find $(SUBDIR) -type f -name '*.cu')

COBJECTS += $(patsubst %.c,$(OBJDIR)/%.o,$(CSOURCES))
CPPOBJECTS += $(patsubst %.cpp,$(OBJDIR)/%.o,$(CPPSOURCES))
CUDAOBJECTS += $(patsubst %.cu,$(OBJDIR)/%.o,$(CUDASOURCES))

SOURCES = $(strip $(CSOURCES) $(CPPSOURCES) $(CUDASOURCES))
OBJECTS = $(strip $(COBJECTS) $(CPPOBJECTS) $(CUDAOBJECTS))


###############################################################################
# Makefile Build Rules                                                        #
###############################################################################
include $(MAKEFILE_DIR_LOCATION)/make-rules/build.mk
include $(MAKEFILE_DIR_LOCATION)/make-rules/link.mk
include $(MAKEFILE_DIR_LOCATION)/make-rules/wildcard/c.mk
include $(MAKEFILE_DIR_LOCATION)/make-rules/wildcard/cpp.mk
include $(MAKEFILE_DIR_LOCATION)/make-rules/pre-build.mk

###############################################################################
# Makefile Other Rules                                                        #
###############################################################################
-include $(shell find $(MAKEFILE_DIR_LOCATION)/make-utilities -type f -name '*.mk')

###############################################################################
# Makefile Special Rules                                                      #
###############################################################################
-include ./Makefile-Special-Rules.mk

endif # This endif is necessary - See Makefile Init
