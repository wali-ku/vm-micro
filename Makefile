SRCS := jumps.c
TGT  := test

all: ${TGT}

${TGT}: ${SRCS}
	gcc $< -O0 -o $@

clean:
	rm -f ${TGT}
