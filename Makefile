all: src/rocksdb/librocksdb.a

JOBS=8

src/rocksdb/librocksdb.a:
	make \
		-e EXTRA_CXXFLAGS="-fPIC" \
		-e EXTRA_CFLAGS="-fPIC" \
		-C src/rocksdb \
		-j $(JOBS) \
			libsnappy.a \
			liblz4.a \
			libbz2.a \
			libzstd.a \
			libz.a

	make \
		-j $(JOBS) \
		-e DEBUG_LEVEL=0 \
		-e EXTRA_CXXFLAGS="-fPIC" \
		-e EXTRA_CFLAGS="-fPIC" \
		-e WITH_SNAPPY=1 \
		-e WITH_LZ4=1 \
		-e WITH_ZLIB=1 \
		-e WITH_ZSTD=1 \
		-C src/rocksdb \
			static_lib

clean:
	make -C src/rocksdb clean
