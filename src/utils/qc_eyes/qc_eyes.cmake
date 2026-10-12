# qc_eyes.cmake

set(QC_EYES_DIR ${CMAKE_CURRENT_LIST_DIR})
source_add_executable(qc_eyes
	WIN32
	OUTPUT_DIR "${GAMEDIR}/bin${PLATSUBDIR}"
	NO_MEMOVERRIDE

	QC_Eyes.cpp
	QC_Eyes.rc
	QC_EyesDlg.cpp
	StdAfx.cpp

	# Header Files
	QC_Eyes.h
	QC_EyesDlg.h
	Resource.h
	StdAfx.h

	# Resources
	res/eye_default.bmp
	res/eye_lower_hi.bmp
	res/eye_lower_lo.bmp
	res/eye_lower_mid.bmp
	res/eye_upper_hi.bmp
	res/eye_upper_lo.bmp
	res/eye_upper_mid.bmp
	res/eye_XY_L.bmp
	res/eye_XY_R.bmp
	res/eye_Z_L.bmp
	res/eye_Z_R.bmp
	res/QC_Eyes.ico
	res/QC_Eyes.rc2
)

target_precompile_headers(
	qc_eyes PRIVATE
	"${QC_EYES_DIR}/StdAfx.h"
)

target_compile_definitions(
	qc_eyes PRIVATE
	NO_WARN_MBCS_MFC_DEPRECATION
)

target_compile_options(
	qc_eyes PRIVATE
	/EHsc
)