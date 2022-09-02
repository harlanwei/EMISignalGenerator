SRC_DIR = src

CC = /usr/bin/gcc
CFLAGS += -O3
LDLIBS += -lm
binaries := $(SRC_DIR)/brownrv $(SRC_DIR)/exponentialrv $(SRC_DIR)/laplace $(SRC_DIR)/pinkgen $(SRC_DIR)/uniformrv

all: compile_all

compile_all: $(binaries)
	mkdir -p out
	@$(foreach binary,$(binaries),mv $(binary) src/../out/;)

clean:
	rm -rf out data.txt

.PHONY: all compile_all clean
