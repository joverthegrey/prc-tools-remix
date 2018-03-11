FROM buildpack-deps:xenial-scm

# Install prerequsites
RUN apt-get update && apt-get install -y --no-install-recommends \
		flex \
		bison \
		gperf \
		build-essential \
		gcc-multilib \
		libncurses5-dev
RUN apt-get remove -y texinfo

# Clone PalmOS SDK
WORKDIR /opt
RUN git clone https://github.com/jichu4n/palm-os-sdk palmdev

# Build compilers
COPY binutils-2.14 /root/prc-tools-remix/binutils-2.14
COPY gcc-2.95.3 /root/prc-tools-remix/gcc-2.95.3
COPY gcc-3.3.1 /root/prc-tools-remix/gcc-3.3.1
COPY gdb-5.3 /root/prc-tools-remix/gdb-5.3
COPY prc-tools-2.3 /root/prc-tools-remix/prc-tools-2.3

WORKDIR /root/prc-tools-remix
ENV MAKEINFO ""
RUN	mkdir build && cd build && \
	../prc-tools-2.3/configure \
		--enable-targets=m68k-palmos,arm-palmos \
		--enable-languages=c,c++ \
		--disable-nls \
		--disable-doc \
		--with-palmdev-prefix=/opt/palmdev \
		--host=i686-linux-gnu && \
	make && \
	make install

# Build Pi;RC
WORKDIR /root
RUN wget https://downloads.sourceforge.net/project/pilrc/pilrc/3.2/pilrc-3.2.tar.gz
RUN tar zxf pilrc-3.2.tar.gz && \
	cd pilrc-3.2 && \
	./unix/configure && \
	make && \
	make install

# Remove Intermidiates
WORKDIR /root
RUN rm -fr prc-tools-remix pilrc-3.2.tar.gz pilrc-3.2
RUN apt-get clean all

