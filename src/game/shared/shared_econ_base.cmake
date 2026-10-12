# shared_econ_base.cmake

include_guard(DIRECTORY)

include("${CMAKE_SOURCE_DIR}/_cmake_scripts/protobuf_builder.cmake")

source_files(
	SHARED_ECON_BASE_SOURCE_FILES

	econ/econ_item_view.cpp
	econ/econ_item_view.h
	econ/econ_item_interface.cpp
	econ/econ_item_interface.h
	econ/econ_item_system.cpp
	econ/econ_item_system.h
	econ/attribute_manager.cpp
	econ/attribute_manager.h
	econ/ihasattributes.h
	econ/econ_entity.cpp
	econ/econ_entity.h
	econ/econ_entity_creation.cpp
	econ/econ_entity_creation.h
	econ/econ_gcmessages.h
	econ/econ_item_inventory.cpp
	econ/econ_item_inventory.h
	econ/econ_wearable.cpp
	econ/econ_wearable.h
	econ/econ_holidays.cpp
	econ/econ_holidays.h
	econ/econ_item.cpp
	econ/econ_item.h
	econ/econ_item_constants.cpp
	econ/econ_item_constants.h
	econ/econ_item_preset.cpp
	econ/econ_item_preset.h
	econ/econ_item_schema.cpp
	econ/econ_item_schema.h
	econ/econ_item_schema_sdk.cpp
	econ/econ_item_tools.cpp
	econ/econ_item_tools.h
	econ/item_selection_criteria.cpp
	econ/item_selection_criteria.h
	econ/econ_dynamic_recipe.cpp
	econ/econ_dynamic_recipe.h
	econ/econ_quests.cpp
	econ/econ_quests.h
	econ/econ_paintkit.cpp
	econ/econ_paintkit.h
	gc_clientsystem.h
	gc_clientsystem.cpp
	gc_replicated_convars.cpp
	econ/localization_provider.cpp
	econ/localization_provider.h
)

function(target_use_shared_econ_base target)
	target_sources(
		${target} PRIVATE
		${SHARED_ECON_BASE_SOURCE_FILES}
	)

	target_compile_protos(
		${target}
		"${SRCDIR}/gcsdk/steammessages.proto"
		"${SRCDIR}/game/shared/base_gcmessages.proto"
		"${SRCDIR}/game/shared/econ/econ_gcmessages.proto"
	)

	target_include_directories(
		${target} PRIVATE
		"${SRCDIR}/gcsdk/steamextra"
	)

	target_compile_definitions(
		${target} PRIVATE
		USES_ECON_ITEMS
	)

	target_link_libraries(
		${target} PRIVATE
		gcsdk_sdk
	)
endfunction()
