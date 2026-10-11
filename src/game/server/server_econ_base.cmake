# server_econ_base.cmake

include_guard(GLOBAL)

include("${SRCDIR}/game/shared/shared_econ_base.cmake")

function(target_use_server_econ_base target)
	target_use_shared_econ_base(${target})

	target_link_libraries(
		${target} PRIVATE
		$<${IS_WINDOWS}:ws2_32>
	)
endfunction()
