SUBVERSION=-I/usr/local/include/subversion-1
APR=-I/usr/include/apr-1.0
NEON=-I/usr/include/neon
 

CFLAGS=-Wall -O2 -fpic -D_REENTRANT -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -ggdb \
 -fomit-frame-pointer -pipe -pthread $(SUBVERSION) $(APR) $(NEON) 

# If the Subversion is not in the default path, use the -Wl,-R flag
#LDFLAGS=-Wl,-R/usr/local/lib -O -shared -fpic  
LDFLAGS=-O -shared -fpic 

# --- 

LIBS=-lsvn_client-1 -lsvn_wc-1 -lsvn_ra-1 -lsvn_delta-1 \
 -lsvn_diff-1 -lsvn_subr-1 -laprutil-1 -lexpat -lapr-1 \
 -lneon \
 -luuid -lrt -lcrypt -lpthread -ldl -lz

TARGET=luasvn.so

OBJS=luasvn.o
CC=gcc
LD=gcc

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)

clean:
	rm -f $(TARGET) *.o
