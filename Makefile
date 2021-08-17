all: src/rocksdb/librocksdb.a

JOBS=8

src/rocksdb/libsnappy.a:
	make \
		-j $(JOBS) \
		-e EXTRA_CXXFLAGS="-fPIC" \
		-e EXTRA_CFLAGS="-fPIC" \
		-C src/rocksdb libsnappy.a

src/rocksdb/liblz4.a:
	make \
		-j $(JOBS) \
		-e EXTRA_CXXFLAGS="-fPIC" \
		-e EXTRA_CFLAGS="-fPIC" \
		-C src/rocksdb liblz4.a

src/rocksdb/libbz2.a:
	make \
		-j $(JOBS) \
		-e EXTRA_CXXFLAGS="-fPIC" \
		-e EXTRA_CFLAGS="-fPIC" \
		-C src/rocksdb libbz2.a

src/rocksdb/libzstd.a:
	make \
		-j $(JOBS) \
		-e EXTRA_CXXFLAGS="-fPIC" \
		-e EXTRA_CFLAGS="-fPIC" \
		-C src/rocksdb libzstd.a

src/rocksdb/libz.a:
	make \
		-j $(JOBS) \
		-e EXTRA_CXXFLAGS="-fPIC" \
		-e EXTRA_CFLAGS="-fPIC" \
		-C src/rocksdb libz.a

snappy: src/rocksdb/libsnappy.a
lz4: src/rocksdb/liblz4.a
bz2: src/rocksdb/libbz2.a
zstd: src/rocksdb/libzstd.a
zlib: src/rocksdb/libz.a

src/rocksdb/librocksdb.a: zlib zstd bz2 lz4 snappy
	make \
		-j $(JOBS) \
		-e EXTRA_CXXFLAGS="-fPIC" \
		-e EXTRA_CFLAGS="-fPIC" \
		-C src/rocksdb static_lib

clean:
	make -C src/rocksdb clean
