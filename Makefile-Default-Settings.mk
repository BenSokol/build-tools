# @Filename: Makefile-Default-Settings.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:26pm]
# @Modified: March 28th, 2019 [1:18pm]
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
MANDIR ?= man
MANTYPE ?= man1
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
RUN_CMD ?= ./$(EXE)
