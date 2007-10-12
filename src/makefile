SUBVERSION=-I/usr/include/subversion-1
APR=-I/usr/include/apr-1.0
 

CFLAGS=-Wall -O2 -fpic -D_REENTRANT -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -ggdb \
 -fomit-frame-pointer -pipe -pthread $(SUBVERSION) $(APR) 

# If the Subversion is not in the default path, use the -Wl,-R flag
#LDFLAGS=-Wl,-R/usr/local/lib -O -shared -fpic  
LDFLAGS=-O -shared -fpic 

# --- 

LIBS=-lsvn_client-1 -lsvn_wc-1 -lsvn_ra-1 -lsvn_delta-1 \
 -lsvn_diff-1 -lsvn_subr-1 -laprutil-1 -lexpat -lapr-1 

TARGET=svn.so

OBJS=luasvn.o
CC=gcc
LD=gcc

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) -o $(TARGET) $(LDFLAGS) $(OBJS) $(LIBS)

clean:
	rm -f $(TARGET) *.o
