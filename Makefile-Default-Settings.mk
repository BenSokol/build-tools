# @Filename: Makefile-Default-Settings.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:26pm]
# @Modified: February 14th, 2019 [6:06pm]
# @Version:  1.0.0
#
# Copyright (C 2019 by Ben Sokol. All Rights Reserved.

ifndef EXE
EXE := prog
endif

ifndef SRCDIR
SRCDIR := src
endif

ifndef OBJDIR
OBJDIR := obj
endif

ifndef DEPDIR
DEPDIR := dep
endif

ifndef SUBDIR
SUBDIR := submodules
endif

ifndef CSTD
CSTD := -std:=c11
endif

ifndef CXXSTD
CXXSTD := -std:=c++11
endif

ifndef WARNING_FLAGS
WARNING_FLAGS := -Wall
endif

ifndef DEBUGGER
DEBUGGER := gdb
endif

ifndef CXX
CXX := g++
endif

ifndef CC
CC := gcc
endif
