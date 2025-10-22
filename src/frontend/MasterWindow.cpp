//
//  MasterWindow.cpp
//  Template
//
//
//  Created by Jannis Sauer on 2025-10-16.
//

#include "MasterWindow.hpp"

MasterWindow::~MasterWindow() {}

void MasterWindow::Draw(ImVec2 pos, ImVec2 size)
{
    _pos  = pos;
    _size = size;

    io.FontGlobalScale = fontSize;

    ImGui::PushFont(TITLE);
    setWindowPosSize(_pos, _size);

    style.WindowBorderSize = 0.0F;
    style.WindowRounding   = 0.0F;
    style.FrameBorderSize  = 0.0F;
    style.FrameRounding    = 0.0F;

    ImGui::Begin("MasterWindow", nullptr, STATIC__NO_VISUALS | ImGuiWindowFlags_NoBringToFrontOnFocus);

    style.WindowBorderSize = default_WindowBorderSize;
    style.WindowRounding   = default_WindowRounding;
    style.FrameBorderSize  = default_FrameBorderSize;
    style.FrameRounding    = default_FrameRounding;

    DrawContents();

    ImGui::End();
    ImGui::PopFont();
}



void MasterWindow::DrawContents()
{
    std::string msg = "Hello, world!";

    ImGui::SetCursorPos(ImVec2(ImGui::GetWindowWidth() / 2.0f - ImGui::CalcTextSize(msg.c_str()).x / 2.0f,
                               ImGui::GetWindowHeight() / 2.0f - ImGui::CalcTextSize(msg.c_str()).y / 2.0f));
    ImGui::Text("%s", msg.c_str());
}
