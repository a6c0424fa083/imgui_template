//
//  MasterWindow.hpp
//  Template
//
//
//  Created by Jannis Sauer on 2025-10-16.
//

#ifndef MASTERWINDOW_HPP
#define MASTERWINDOW_HPP


#include <imgui.h>
#include <string>
#include <vector>

#include "backend/defines.hpp"
#include "frontend/BaseWindow.hpp"


class MasterWindow : BaseWindow
{
public:
    ~MasterWindow();

    void        Draw(ImVec2 pos, ImVec2 size);
    inline void DrawContents();

private:
    ImVec2 _pos;
    ImVec2 _size;
};


#endif  // MASTERWINDOW_HPP
