#this is master makefile
TOPDIR = $(shell pwd)
SUBDIR =./src ./inc ./lib ./user
CROSS_COMPILER = amr-linux-
CC             = $(CROSS_COMPILER)gcc
TOPDIR:buildin.o
  make -C $<
buildin.o:SUBDIR
  make -C $@
%.d:%.c
  @set -e; rm -f $@; \
  $(CC) -MM $(CFLAGS) $< > $@.$$$$; \
  sed 's.\($*\)\.0[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@;
  rm -rf $@.$$$$
