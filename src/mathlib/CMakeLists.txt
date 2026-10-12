source_add_library(mathlib
	color_conversion.cpp
	halton.cpp
	lightdesc.cpp
	mathlib_base.cpp
	powsse.cpp
	sparse_convolution_noise.cpp
	sseconst.cpp
	sse.cpp
	ssenoise.cpp
	3dnow.cpp
	anorms.cpp
	bumpvects.cpp
	IceKey.cpp
	imagequant.cpp
	polyhedron.cpp
	quantize.cpp
	randsse.cpp
	spherical.cpp
	simdvectormatrix.cpp
	vector.cpp
	vmatrix.cpp
	almostequal.cpp

	# Public Header Files
	"${SRCDIR}/public/mathlib/amd3dx.h"
	"${SRCDIR}/public/mathlib/anorms.h"
	"${SRCDIR}/public/mathlib/bumpvects.h"
	"${SRCDIR}/public/mathlib/compressed_3d_unitvec.h"
	"${SRCDIR}/public/mathlib/compressed_light_cube.h"
	"${SRCDIR}/public/mathlib/compressed_vector.h"
	"${SRCDIR}/public/mathlib/halton.h"
	"${SRCDIR}/public/mathlib/IceKey.H"
	"${SRCDIR}/public/mathlib/lightdesc.h"
	"${SRCDIR}/public/mathlib/math_pfns.h"
	"${SRCDIR}/public/mathlib/mathlib.h"
	"${SRCDIR}/public/mathlib/noise.h"
	"${SRCDIR}/public/mathlib/polyhedron.h"
	"${SRCDIR}/public/mathlib/quantize.h"
	"${SRCDIR}/public/mathlib/simdvectormatrix.h"
	"${SRCDIR}/public/mathlib/spherical_geometry.h"
	"${SRCDIR}/public/mathlib/ssemath.h"
	"${SRCDIR}/public/mathlib/ssequaternion.h"
	"${SRCDIR}/public/mathlib/vector.h"
	"${SRCDIR}/public/mathlib/vector2d.h"
	"${SRCDIR}/public/mathlib/vector4d.h"
	"${SRCDIR}/public/mathlib/vmatrix.h"
	"${SRCDIR}/public/mathlib/vplane.h"

	# Header Files
	noisedata.h
	sse.h
	3dnow.h
)

target_include_directories(
	mathlib PRIVATE
	"${SRCDIR}/public/mathlib"
)

target_compile_definitions(
	mathlib PRIVATE
	MATHLIB_LIB
)