SRC = src/main.cpp
CC = g++
INCLUDES := \
	    -Iexternal/boostorg/json/include/ \
	    -Iexternal/boostorg/config/include/ \
	    -Iexternal/boostorg/assert/include/ \
	    -Iexternal/boostorg/throw_exception/include/ \
	    -Iexternal/boostorg/core/include/ \
	    -Iexternal/boostorg/container/include/ \
	    -Iexternal/boostorg/move/include/ \
	    -Iexternal/boostorg/static_assert/include/ \
	    -Iexternal/boostorg/intrusive/include/ \
	    -Iexternal/boostorg/system/include/ \
	    -Iexternal/boostorg/mp11/include/ \
	    -Iexternal/boostorg/align/include/
COMPILER_FLAGS = $(INCLUDES) -w
LINKER_FLAGS = -lSDL2 -lSDL2_image
EXE_NAME = rogue_forever

all: $(SRC)
	$(CC) $(SRC) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(EXE_NAME)

run: all
	LD_LIBRARY_PATH=/usr/local/lib ./$(EXE_NAME)
