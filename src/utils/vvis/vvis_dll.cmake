# vvis_dll.cmake

source_add_module(vvis_dll
	OUTPUT_DIR "${GAMEDIR}/bin${PLATSUBDIR}"
	NO_MEMOVERRIDE

	"${SRCDIR}/utils/common/bsplib.cpp"
	"${SRCDIR}/utils/common/cmdlib.cpp"
	"${SRCDIR}/public/collisionutils.cpp"
	"${SRCDIR}/public/filesystem_helpers.cpp"
	flow.cpp
	"${SRCDIR}/public/loadcmdline.cpp"
	"${SRCDIR}/public/lumpfiles.cpp"
	"${SRCDIR}/public/filesystem_init.cpp"
	"${SRCDIR}/utils/common/filesystem_tools.cpp"
	"${SRCDIR}/utils/common/MySqlDatabase.cpp"
	"${SRCDIR}/utils/common/pacifier.cpp"
	"${SRCDIR}/public/scratchpad3d.cpp"
	"${SRCDIR}/utils/common/scratchpad_helpers.cpp"
	"${SRCDIR}/utils/common/scriplib.cpp"
	"${SRCDIR}/utils/common/threads.cpp"
	"${SRCDIR}/utils/common/tools_minidump.cpp"
	"${SRCDIR}/utils/common/tools_minidump.h"
	vvis.cpp
	WaterDist.cpp
	"${SRCDIR}/public/zip_utils.cpp"

	# Header Files
	"${SRCDIR}/public/mathlib/amd3dx.h"
	"${SRCDIR}/public/tier0/basetypes.h"
	"${SRCDIR}/public/BSPFILE.H"
	"${SRCDIR}/public/bspflags.h"
	"${SRCDIR}/utils/common/bsplib.h"
	"${SRCDIR}/public/BSPTreeData.h"
	"${SRCDIR}/public/mathlib/bumpvects.h"
	"${SRCDIR}/public/tier1/byteswap.h"
	"${SRCDIR}/public/tier1/checksum_crc.h"
	"${SRCDIR}/public/tier1/checksum_md5.h"
	"${SRCDIR}/utils/common/cmdlib.h"
	"${SRCDIR}/public/cmodel.h"
	"${SRCDIR}/public/tier0/commonmacros.h"
	"${SRCDIR}/public/GameBSPFile.h"
	"${SRCDIR}/utils/common/ISQLDBReplyTarget.h"
	"${SRCDIR}/public/mathlib/mathlib.h"
	"${SRCDIR}/utils/common/MySqlDatabase.h"
	"${SRCDIR}/utils/common/pacifier.h"
	"${SRCDIR}/utils/common/scriplib.h"
	"${SRCDIR}/public/tier1/strtools.h"
	"${SRCDIR}/utils/common/threads.h"
	"${SRCDIR}/public/tier1/utlbuffer.h"
	"${SRCDIR}/public/tier1/utllinkedlist.h"
	"${SRCDIR}/public/tier1/utlmemory.h"
	"${SRCDIR}/public/tier1/utlrbtree.h"
	"${SRCDIR}/public/tier1/utlsymbol.h"
	"${SRCDIR}/public/tier1/utlvector.h"
	"${SRCDIR}/public/vcollide.h"
	"${SRCDIR}/public/mathlib/vector.h"
	"${SRCDIR}/public/mathlib/vector2d.h"
	vis.h
	"${SRCDIR}/public/vstdlib/vstdlib.h"
	"${SRCDIR}/public/wadtypes.h"
)

target_include_directories(
	vvis_dll PRIVATE
	"${SRCDIR}/utils/common"
	"${SRCDIR}/utils/vmpi"
	"${SRCDIR}/utils/vmpi/mysql/include"
)

target_compile_definitions(
	vvis_dll PRIVATE
	PROTECTED_THINGS_DISABLE
)

target_link_libraries(
	vvis_dll PRIVATE
	odbc32
	odbccp32
	ws2_32

	mathlib
	tier2
	lzma
)