# tier1.cmake

set(TIER1_DIR ${CMAKE_CURRENT_LIST_DIR})

source_files(
	TIER1_SOURCE_FILES
	bitbuf.cpp
	newbitbuf.cpp
	byteswap.cpp
	characterset.cpp
	checksum_crc.cpp
	checksum_md5.cpp
	checksum_sha1.cpp
	commandbuffer.cpp
	convar.cpp
	datamanager.cpp
	diff.cpp
	exprevaluator.cpp
	generichash.cpp
	ilocalize.cpp
	interface.cpp
	KeyValues.cpp
	keyvaluesjson.cpp
	kvpacker.cpp
	lzmaDecoder.cpp
	"$<$<NOT:${IS_SOURCESDK}>:lzss.cpp>"
	mempool.cpp
	memstack.cpp
	NetAdr.cpp
	splitstring.cpp

	"$<${IS_WINDOWS}:processor_detect.cpp>"
	"$<${IS_POSIX}:processor_detect_linux.cpp>"

	"$<${IS_LINUX}:qsort_s.cpp>"

	rangecheckedvar.cpp
	reliabletimer.cpp
	stringpool.cpp
	strtools.cpp
	strtools_unicode.cpp
	tier1.cpp
	tokenreader.cpp
	sparsematrix.cpp
	uniqueid.cpp
	utlbuffer.cpp
	utlbufferutil.cpp
	utlstring.cpp
	utlsymbol.cpp
	utlbinaryblock.cpp
	"$<${IS_LINUX}:pathmatch.cpp>"
	snappy.cpp
	snappy-sinksource.cpp
	snappy-stubs-internal.cpp

	# Select bits from the LZMA SDK to support lzmaDecoder.h
	# Encoding support requires the full lzma project
	# LZMA Decompression Support
	"${SRCDIR}/utils/lzma/C/LzmaDec.h"
	"${SRCDIR}/utils/lzma/C/LzmaDec.c"
	"${SRCDIR}/utils/lzma/C/7zTypes.h"

	# Header Files

	# Internal Header Files
	snappy-internal.h
	snappy-stubs-internal.h

	"${SRCDIR}/public/tier1/bitbuf.h"
	"${SRCDIR}/public/tier1/byteswap.h"
	"${SRCDIR}/public/tier1/callqueue.h"
	"${SRCDIR}/public/tier1/characterset.h"
	"${SRCDIR}/public/tier1/checksum_crc.h"
	"${SRCDIR}/public/tier1/checksum_md5.h"
	"${SRCDIR}/public/tier1/checksum_sha1.h"
	"${SRCDIR}/public/tier1/CommandBuffer.h"
	"${SRCDIR}/public/tier1/convar.h"
	"${SRCDIR}/public/tier1/datamanager.h"
	"${SRCDIR}/public/datamap.h"
	"${SRCDIR}/public/tier1/delegates.h"
	"${SRCDIR}/public/tier1/diff.h"
	"${SRCDIR}/public/tier1/fmtstr.h"
	"${SRCDIR}/public/tier1/functors.h"
	"${SRCDIR}/public/tier1/generichash.h"
	"${SRCDIR}/public/tier1/iconvar.h"
	"${SRCDIR}/public/tier1/ilocalize.h"
	"${SRCDIR}/public/tier1/interface.h"
	"${SRCDIR}/public/tier1/KeyValues.h"
	"${SRCDIR}/public/tier1/keyvaluesjson.h"
	"${SRCDIR}/public/tier1/kvpacker.h"
	"${SRCDIR}/public/tier1/lzmaDecoder.h"
	"${SRCDIR}/public/tier1/lzss.h"
	"${SRCDIR}/public/tier1/mempool.h"
	"${SRCDIR}/public/tier1/memstack.h"
	"${SRCDIR}/public/tier1/netadr.h"
	"${SRCDIR}/public/tier1/processor_detect.h"
	"${SRCDIR}/public/tier1/rangecheckedvar.h"
	"${SRCDIR}/public/tier1/refcount.h"
	"${SRCDIR}/public/tier1/smartptr.h"
	"${SRCDIR}/public/tier1/snappy.h"
	"${SRCDIR}/public/tier1/snappy-sinksource.h"
	"${SRCDIR}/public/tier1/stringpool.h"
	"${SRCDIR}/public/tier1/strtools.h"
	"${SRCDIR}/public/tier1/tier1.h"
	"${SRCDIR}/public/tier1/tokenreader.h"
	"$<${IS_WINDOWS}:${SRCDIR}/public/tier1/uniqueid.h>"
	"${SRCDIR}/public/tier1/utlbidirectionalset.h"
	"${SRCDIR}/public/tier1/util_misc.h"
	"${SRCDIR}/public/tier1/utlblockmemory.h"
	"${SRCDIR}/public/tier1/utlbuffer.h"
	"${SRCDIR}/public/tier1/utlbufferutil.h"
	"${SRCDIR}/public/tier1/utlcommon.h"
	"${SRCDIR}/public/tier1/utldict.h"
	"${SRCDIR}/public/tier1/utlenvelope.h"
	"${SRCDIR}/public/tier1/utlfixedmemory.h"
	"${SRCDIR}/public/tier1/utlhandletable.h"
	"${SRCDIR}/public/tier1/utlhash.h"
	"${SRCDIR}/public/tier1/utlhashtable.h"
	"${SRCDIR}/public/tier1/utllinkedlist.h"
	"${SRCDIR}/public/tier1/utlmap.h"
	"${SRCDIR}/public/tier1/utlmemory.h"
	"${SRCDIR}/public/tier1/utlmultilist.h"
	"${SRCDIR}/public/tier1/utlpriorityqueue.h"
	"${SRCDIR}/public/tier1/utlqueue.h"
	"${SRCDIR}/public/tier1/utlrbtree.h"
	"${SRCDIR}/public/tier1/UtlSortVector.h"
	"${SRCDIR}/public/tier1/utlstack.h"
	"${SRCDIR}/public/tier1/utlstring.h"
	"${SRCDIR}/public/tier1/UtlStringMap.h"
	"${SRCDIR}/public/tier1/utlsymbol.h"
	"${SRCDIR}/public/tier1/utlsymbollarge.h"
	"${SRCDIR}/public/tier1/utlvector.h"
	"${SRCDIR}/public/tier1/utlrange.h"
	"${SRCDIR}/public/tier1/utlbinaryblock.h"
	"$<${IS_WINDOWS}:${SRCDIR}/common/xbox/xboxstubs.h>"
)

if (IS_WINDOWS)
	set_source_files_properties("${TIER1_DIR}/processor_detect.cpp" PROPERTIES COMPILE_OPTIONS /EHsc)
endif()

source_add_library(tier1 ${TIER1_SOURCE_FILES})

target_compile_definitions(
	tier1 PRIVATE
	TIER1_STATIC_LIB
)

target_link_libraries(
	tier1 INTERFACE
	$<${IS_WINDOWS}:Rpcrt4>
)