# @Filename: Makefile-Default-Settings.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:26pm]
# @Modified: February 21st, 2019 [8:53am]
# @Version:  1.1.0
#
# Copyright (C 2019 by Ben Sokol. All Rights Reserved.

EXE ?= prog

# Directories
SRCDIR ?= src
OBJDIR ?= obj
DEPDIR ?= dep
SUBDIR ?= submodules
LOGDIR ?= logs
INSTALLDIR ?= ${HOME}/.bin

# Flags
CSTD ?= -std=c11
CXXSTD ?= -std=c++11
WARNING_FLAGS ?= -Wall

# Executables
DEBUGGER ?= gdb
CXX ?= g++
CC ?= gcc

# Other
LOG_FILE ?= make.log
