# client_econ_base.cmake

include_guard(DIRECTORY)

include("${SRCDIR}/game/shared/shared_econ_base.cmake")

set(CLIENT_ECON_BASE_DIR ${CMAKE_CURRENT_LIST_DIR})
source_files(
	CLIENT_ECON_BASE_SOURCE_FILES

	"${SRCDIR}/game/shared/econ/econ_item_description.cpp"
	"${SRCDIR}/game/shared/econ/econ_item_description.h"
	"${SRCDIR}/game/shared/econ/econ_store.cpp"
	"${SRCDIR}/game/shared/econ/econ_store.h"
	"${SRCDIR}/game/shared/econ/econ_storecategory.cpp"
	"${SRCDIR}/game/shared/econ/econ_storecategory.h"
	econ/econ_consumables.cpp
	econ/econ_ui.h
	econ/backpack_panel.cpp
	econ/backpack_panel.h
	econ/base_loadout_panel.cpp
	econ/base_loadout_panel.h
	econ/trading_start_dialog.cpp
	econ/trading_start_dialog.h
	econ/iconrenderreceiver.h
	econ/item_model_panel.cpp
	econ/item_model_panel.h
	econ/item_pickup_panel.cpp
	econ/item_pickup_panel.h
	econ/confirm_dialog.cpp
	econ/confirm_dialog.h
	econ/confirm_delete_dialog.cpp
	econ/confirm_delete_dialog.h
	econ/item_confirm_delete_dialog.cpp
	econ/item_confirm_delete_dialog.h
	econ/item_style_select_dialog.cpp
	econ/item_style_select_dialog.h
	econ/econ_controls.cpp
	econ/econ_controls.h
	econ/econ_notifications.cpp
	econ/econ_notifications.h
	econ/item_rental_ui.cpp
	econ/item_rental_ui.h
	econ/client_community_market.cpp
	econ/client_community_market.h
	econ/local_steam_shared_object_listener.cpp
	econ/local_steam_shared_object_listener.h
	econ/econ_sample_rootui.cpp
	econ/econ_sample_rootui.h
	econ/econ_trading.cpp
	econ/econ_trading.h
	game_controls/navigationpanel.cpp
	game_controls/navigationpanel.h
	econ/store/store_page.cpp
	econ/store/store_page.h
	econ/store/store_page_new.cpp
	econ/store/store_page_new.h
	econ/store/store_panel.cpp
	econ/store/store_panel.h
	econ/store/store_preview_item.cpp
	econ/store/store_preview_item.h
	econ/store/store_viewcart.cpp
	econ/store/store_viewcart.h
	econ/tool_items/tool_items.cpp
	econ/tool_items/tool_items.h
	econ/tool_items/rename_tool_ui.cpp
	econ/tool_items/rename_tool_ui.h
	econ/tool_items/decoder_ring_tool.cpp
	econ/tool_items/decoder_ring_tool.h
	econ/tool_items/paint_can_tool.cpp
	econ/tool_items/paint_can_tool.h
	econ/tool_items/custom_texture_cache.cpp
	econ/tool_items/custom_texture_cache.h
	econ/tool_items/custom_texture_tool.cpp
	econ/tool_items/gift_wrap_tool.cpp
	econ/tool_items/gift_wrap_tool.h
	"${SRCDIR}/common/imageutils.h"
	"${SRCDIR}/common/imageutils.cpp"
)

set_source_files_properties(
	"${SRCDIR}/common/imageutils.cpp"
	PROPERTIES SKIP_PRECOMPILE_HEADERS ON
)

function(target_use_client_econ_base target)
	target_use_shared_econ_base(${target})

	target_sources(
		${target} PRIVATE
		${CLIENT_ECON_BASE_SOURCE_FILES}
	)

	target_include_directories(
		${target} PRIVATE
		"${SRCDIR}/game/shared/econ"
		"${CLIENT_ECON_BASE_DIR}/econ"
	)

	target_link_libraries(
		${target} PRIVATE
		jpeglib
		libspng
		libz
	)
endfunction()
