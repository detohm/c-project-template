SRCDIR=./src
INCLUDEDIR=./include
LIBDIR=./lib
OBJDIR=./obj
BUILDDIR=./build

CC=gcc
CFLAGS=-Wall -I./include
LFLAGS=-Wall 


SRC_FILES=$(wildcard $(SRCDIR)/*.c)
OBJ_FILES=$(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRC_FILES))

all: build/main.out

build/main.out: $(OBJ_FILES)
	$(CC) $(LFLAGS) -o $@ $^  

$(OBJDIR)/%.o: src/%.c 
	$(CC) $(CFLAGS) -c -o $@ $<  

.PHONY : clean

clean :
	rm -f $(OBJDIR)/*.o $(BUILDDIR)/*.out