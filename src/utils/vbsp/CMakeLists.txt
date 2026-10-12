source_add_executable(vbsp
	OUTPUT_DIR "${GAMEDIR}/bin${PLATSUBDIR}"

	boundbox.cpp
	brushbsp.cpp
	"${SRCDIR}/public/CollisionUtils.cpp"
	csg.cpp
	cubemap.cpp
	detail.cpp
	detailObjects.cpp
	"${SRCDIR}/public/disp_common.cpp"
	disp_ivp.cpp
	"${SRCDIR}/public/disp_powerinfo.cpp"
	disp_vbsp.cpp
	faces.cpp
	glfile.cpp
	ivp.cpp
	leakfile.cpp
	"${SRCDIR}/public/loadcmdline.cpp"
	"${SRCDIR}/public/lumpfiles.cpp"
	map.cpp
	manifest.cpp
	materialpatch.cpp
	materialsub.cpp
	"${SRCDIR}/utils/common/mstristrip.cpp"
	nodraw.cpp
	normals.cpp
	overlay.cpp
	"${SRCDIR}/utils/common/physdll.cpp"
	portals.cpp
	prtfile.cpp
	"${SRCDIR}/public/ScratchPad3D.cpp"
	"${SRCDIR}/utils/common/scratchpad_helpers.cpp"
	StaticProp.cpp
	textures.cpp
	tree.cpp
	"${SRCDIR}/utils/common/utilmatlib.cpp"
	vbsp.cpp
	worldvertextransitionfixup.cpp
	writebsp.cpp
	"${SRCDIR}/public/zip_utils.cpp"

	# Common Files
	"${SRCDIR}/utils/common/bsplib.cpp"
	"${SRCDIR}/public/builddisp.cpp"
	"${SRCDIR}/public/ChunkFile.cpp"
	"${SRCDIR}/utils/common/cmdlib.cpp"
	"${SRCDIR}/public/filesystem_helpers.cpp"
	"${SRCDIR}/public/filesystem_init.cpp"
	"${SRCDIR}/utils/common/filesystem_tools.cpp"
	"${SRCDIR}/utils/common/map_shared.cpp"
	"${SRCDIR}/utils/common/pacifier.cpp"
	"${SRCDIR}/utils/common/polylib.cpp"
	"${SRCDIR}/utils/common/scriplib.cpp"
	"${SRCDIR}/utils/common/threads.cpp"
	"${SRCDIR}/utils/common/tools_minidump.cpp"
	"${SRCDIR}/utils/common/tools_minidump.h"

	# Header Files
	boundbox.h
	csg.h
	detail.h
	"${SRCDIR}/public/disp_powerinfo.h"
	disp_vbsp.h
	"${SRCDIR}/public/disp_vertindex.h"
	faces.h
	map.h
	manifest.h
	materialpatch.h
	materialsub.h
	"${SRCDIR}/utils/common/scratchpad_helpers.h"
	vbsp.h
	worldvertextransitionfixup.h
	writebsp.h

	# Common Header Files
	"${SRCDIR}/utils/common/bsplib.h"
	"${SRCDIR}/public/builddisp.h"
	"${SRCDIR}/public/ChunkFile.h"
	"${SRCDIR}/utils/common/cmdlib.h"
	disp_ivp.h
	"${SRCDIR}/public/filesystem.h"
	"${SRCDIR}/public/filesystem_helpers.h"
	"${SRCDIR}/utils/common/FileSystem_Tools.h"
	"${SRCDIR}/public/GameBSPFile.h"
	"${SRCDIR}/public/tier1/interface.h"
	ivp.h
	"${SRCDIR}/utils/common/map_shared.h"
	"${SRCDIR}/utils/common/pacifier.h"
	"${SRCDIR}/utils/common/polylib.h"
	"${SRCDIR}/public/tier1/tokenreader.h"
	"${SRCDIR}/utils/common/utilmatlib.h"
	"${SRCDIR}/utils/vmpi/vmpi.h"
	"${SRCDIR}/public/zip_uncompressed.h"

	# Public Headers
	"${SRCDIR}/public/mathlib/amd3dx.h"
	"${SRCDIR}/public/arraystack.h"
	"${SRCDIR}/public/tier0/basetypes.h"
	"${SRCDIR}/public/BSPFILE.H"
	"${SRCDIR}/public/bspflags.h"
	"${SRCDIR}/public/BSPTreeData.h"
	"${SRCDIR}/public/mathlib/bumpvects.h"
	"${SRCDIR}/public/tier1/byteswap.h"
	"${SRCDIR}/public/cmodel.h"
	"${SRCDIR}/public/CollisionUtils.h"
	"${SRCDIR}/public/tier0/commonmacros.h"
	"${SRCDIR}/public/tier0/dbg.h"
	"${SRCDIR}/public/disp_common.h"
	"${SRCDIR}/public/IScratchPad3D.h"
	"${SRCDIR}/public/mathlib/mathlib.h"
	"${SRCDIR}/utils/common/mstristrip.h"
	"${SRCDIR}/public/nmatrix.h"
	"${SRCDIR}/public/NTree.h"
	"${SRCDIR}/public/nvector.h"
	"${SRCDIR}/public/phyfile.h"
	"${SRCDIR}/utils/common/physdll.h"
	"${SRCDIR}/utils/common/qfiles.h"
	"${SRCDIR}/public/ScratchPad3D.h"
	"${SRCDIR}/utils/common/scriplib.h"
	"${SRCDIR}/public/studio.h"
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
	"${SRCDIR}/public/mathlib/vector4d.h"
	"${SRCDIR}/public/mathlib/vmatrix.h"
	"${SRCDIR}/public/vphysics_interface.h"
	"${SRCDIR}/public/mathlib/vplane.h"
	"${SRCDIR}/public/wadtypes.h"
	"${SRCDIR}/public/worldsize.h"
)

target_include_directories(
	vbsp PRIVATE
	"${SRCDIR}/utils/common"
	"${SRCDIR}/utils/vmpi"
)

target_compile_definitions(
	vbsp PRIVATE
	MACRO_MATHLIB
	PROTECTED_THINGS_DISABLE
)

target_link_libraries(
	vbsp PRIVATE
	ws2_32
	odbc32
	odbccp32
	winmm

	bitmap
	fgdlib
	mathlib
	tier2
	vtf
	lzma
)