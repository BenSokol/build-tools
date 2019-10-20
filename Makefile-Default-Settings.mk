# @Filename: Makefile-Default-Settings.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:26pm]
# @Modified: October 20th, 2019 [3:02am]
# @Version:  1.1.0
#
# Copyright (C 2019 by Ben Sokol. All Rights Reserved.

EXE ?= prog

# Directories
BINDIR ?= bin
SRCDIR ?= src
OBJDIR ?= obj
DEPDIR ?= dep
SUBDIR ?= submodules
TESTDIR ?= test
LOGDIR ?= logs
INSTALLDIR ?= ${HOME}/.bin
MANDIR ?= man
MANTYPE ?= 1

# Flags
CSTD ?= -std=c11
CXXSTD ?= -std=c++11
WARNING_FLAGS ?= -Wall

# Build type flags
RELEASEFLAGS ?= -O3 -DNDEBUG -DRELEASE_BUILD
DEVFLAGS ?= -O1 -DDEV_BUILD
DEBUGFLAGS ?= -Og -g -DDEBUG -D_DEBUG -DDEBUG_BUILD
TESTFLAGS ?= -Og -DMOD_TEST

# Executables
DEBUGGER ?= gdb
CXX ?= g++
CC ?= gcc

# Other
INSTALL_TYPE ?= release
LOG_FILE ?= make.log
RUN_CMD ?= ./$(EXE)

# Test Settings
TESTEXE ?= $(EXE)-test
MAIN_FILE ?= $(SRCDIR)/main.c $(SRCDIR)/main.cpp
