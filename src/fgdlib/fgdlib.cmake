# fgdlib.cmake

source_add_library(fgdlib
	gamedata.cpp
	gdclass.cpp
	gdvar.cpp
	inputoutput.cpp
	wckeyvalues.cpp

	# Header Files
	"${SRCDIR}/public/fgdlib/fgdlib.h"
	"${SRCDIR}/public/fgdlib/gamedata.h"
	"${SRCDIR}/public/fgdlib/gdclass.h"
	"${SRCDIR}/public/fgdlib/gdvar.h"
	"${SRCDIR}/public/fgdlib/helperinfo.h"
	"${SRCDIR}/public/fgdlib/ieditortexture.h"
	"${SRCDIR}/public/fgdlib/inputoutput.h"
	"${SRCDIR}/public/fgdlib/wckeyvalues.h"
)

target_include_directories(
	fgdlib PRIVATE
	"${SRCDIR}/utils/common"
)