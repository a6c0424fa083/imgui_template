//
//  defines.hpp
//  Template
//
//
//  Created by Jannis Sauer on 2025-10-16.
//

// NOTE: Some graphical related things are defined in the BaseWindow class

#ifndef DEFINES_HPP
#define DEFINES_HPP


#include <string>
#include <vector>

#include <imgui.h>

#define MASTER_WINDOW_WIDTH  800
#define MASTER_WINDOW_HEIGHT 480

#define style ImGui::GetStyle()

#define io ImGui::GetIO()

#define io_width  io.DisplaySize.x
#define io_height io.DisplaySize.y

#define STATIC__NO_VISUALS                                                                                             \
    (ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove | ImGuiWindowFlags_NoCollapse | \
     ImGuiWindowFlags_NoScrollbar)

enum USER_FONT
{
    PAGE_FILLING,
    TITLE,
    SUBTITLE,
    TEXT,
    INFORMATION,
    NUMBER
};

#define PAGEFILLING io.Fonts->Fonts[USER_FONT::PAGE_FILLING]
#define TITLE       io.Fonts->Fonts[USER_FONT::TITLE]
#define SUBTITLE    io.Fonts->Fonts[USER_FONT::SUBTITLE]
#define TEXT        io.Fonts->Fonts[USER_FONT::TEXT]
#define INFORMATION io.Fonts->Fonts[USER_FONT::INFORMATION]
#define NUMBER      io.Fonts->Fonts[USER_FONT::NUMBER]

#define MONO_FONT_PATH  APPLICATION_DATA_PATH "fonts/GeistMono-Medium.otf"
#define BLACK_FONT_PATH APPLICATION_DATA_PATH "fonts/Geist-Black.otf"
#define FONT_PATH       APPLICATION_DATA_PATH "fonts/Geist-Medium.otf"
#define BOLD_FONT_PATH  APPLICATION_DATA_PATH "fonts/Geist-Bold.otf"


#endif  // DEFINES_HPP
