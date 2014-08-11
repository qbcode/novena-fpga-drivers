SOURCES=sd.c novena-fpga.c packet.c sd-support.c gpio.c eim.c crc-16.c
OBJECTS=$(SOURCES:.c=.o)
EXEC=novena-fpga
MY_CFLAGS += -Wall -O0 -g
MY_LIBS +=

all: $(OBJECTS) devmem2
	$(CC) $(LIBS) $(LDFLAGS) $(OBJECTS) $(MY_LIBS) -o $(EXEC)

devmem2: devmem2.o
	$(CC) $(LIBS) $(LDFLAGS) $< -o devmem2

clean:
	rm -f $(EXEC) $(OBJECTS)

.c.o:
	$(CC) -c $(CFLAGS) $(MY_CFLAGS) $< -o $@

