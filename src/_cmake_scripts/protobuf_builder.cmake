# protobuf_builder.cmake

include_guard(GLOBAL)

set(PROTOBUF_DIR "${SRCDIR}/thirdparty/protobuf-2.6.1")

add_library(libprotobuf STATIC IMPORTED)

if (IS_WINDOWS)
	set(PROTOC "${PROTOBUF_DIR}/bin/win64/2015/staticcrt/release/protoc.exe")
	set_target_properties(
		libprotobuf PROPERTIES
		IMPORTED_CONFIGURATIONS "DEBUG;RELEASE"
		IMPORTED_LOCATION_DEBUG "${PROTOBUF_DIR}/bin/win64/2015/staticcrt/debug/libprotobuf.lib"
		IMPORTED_LOCATION_RELEASE "${PROTOBUF_DIR}/bin/win64/2015/staticcrt/release/libprotobuf.lib"
	)
else()
	set(PROTOC "${PROTOBUF_DIR}/bin/linux32/protoc")
	set_target_properties(libprotobuf PROPERTIES IMPORTED_LOCATION "${PROTOBUF_DIR}/bin/linux64/libprotobuf.a")
endif()

function(target_compile_protos target)
	set(GENERATED_PROTO_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated_proto_${target}")

	foreach(proto ${ARGN})
		cmake_path(GET proto STEM proto_name)
		cmake_path(GET proto PARENT_PATH proto_dir)
		set(proto_cc "${GENERATED_PROTO_DIR}/${proto_name}.pb.cc")
		set(proto_h "${GENERATED_PROTO_DIR}/${proto_name}.pb.h")

		add_custom_command(
			OUTPUT "${proto_cc}" "${proto_h}"
			COMMAND ${CMAKE_COMMAND} -E make_directory "${GENERATED_PROTO_DIR}"
			COMMAND "${PROTOC}"
				"--proto_path=${PROTOBUF_DIR}/src"
				"--proto_path=${proto_dir}"
				"--proto_path=${SRCDIR}/gcsdk"
				"--proto_path=${SRCDIR}/game/shared"
				"--cpp_out=${GENERATED_PROTO_DIR}"
				"${proto}"
			DEPENDS "${proto}"
			DEPENDS_EXPLICIT_ONLY
			CODEGEN
			COMMENT "Running Protocol Buffer Compiler on ${proto_name}.proto"
			VERBATIM
		)

		target_sources(${target} PRIVATE "${proto}" "${proto_cc}" "${proto_h}")
		set_source_files_properties("${proto_cc}" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
	endforeach()

	target_include_directories(
		${target} PRIVATE
		"${GENERATED_PROTO_DIR}"
		"${PROTOBUF_DIR}/src"
	)

	target_link_libraries(${target} PRIVATE libprotobuf)
endfunction()
