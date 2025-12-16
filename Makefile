.PHONY: clean


DUMP_NAME=result.dump
EXECUTABLE_NAME=result.elf
SOURCE_NAME=main.c

TEST_SOURCE=test.c
TEST_ASM_SOURCE=process.s
TEST_OBJECTS=process.o test.o
TEST_EXECUTABLE=test


CC=riscv64-unknown-elf-gcc
CFLAGS=-march=rv32im -mabi=ilp32
ASFLAGS=-march=rv32im -mabi=ilp32
LDFLAGS=-march=rv32im -mabi=ilp32

QEMU=qemu-riscv32

default: $(DUMP_NAME) $(EXECUTABLE_NAME)

%.elf : $(SOURCE_NAME)
	@$(CC) $(CFLAGS) $< -o $@

%.dump: %.elf
	@riscv64-unknown-elf-objdump -D $< > $@

%.o: %.s
	@$(CC) $(ASFLAGS) -c $< -o $@


%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

$(TEST_EXECUTABLE): $(TEST_OBJECTS)
	@$(CC) $(LDFLAGS) $^ -o $@


test: $(TEST_EXECUTABLE)

run: $(TEST_EXECUTABLE)
	@$(QEMU) ./$(TEST_EXECUTABLE)

clean:
	@rm -f $(DUMP_NAME) $(EXECUTABLE_NAME)
	@rm -f $(TEST_EXECUTABLE) $(TEST_OBJECTS) test.dump
	@rm -f *.o *.elf *.dump

test.o: test.c
process.o: process.s