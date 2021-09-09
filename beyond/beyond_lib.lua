-- Globals
cur_xpos_g = 0
cur_ypos_g = 0
fr_width_g = 75
fr_height_g = 20
beyond_f_array = { "IT", "IA", "IPT", "CT", "CA", "CPT", "AT", "AA", "APT", "PT", "MA", "PA", "MP", "PPT" }
beyond_c_array = { "000011", "000022", "000033", "000044", "000055", "000066", "000077", "000088", "000099", "0000AA", "0000BB", "0000BB", "0000CC", "0000DD", "0000EE" }
beyond_debug = 0

-- Debug message for trouble shooting; With On/Off option via variable
function beyond_lib_debug(msg)
    if beyond_debug=1 then
        DEFAULT_CHAT_FRAME:AddMessage(msg)
        UIErrorsFrame:AddMessage(msg, 1.0, 1.0, 0, 1, 10)
    Else
        return
    end
end

-- Calculate where the next frame should be (Used in btp_frame_onload)
function btp_next_cord()
    local curx
    local cury
    curx = cur_xpos_g
    cury = cur_ypos_g

    cur_xpos_g = cur_xpos_g + fr_width_g
    beyond_lib_debug("xpos: " .. curx .. " ypos: " .. cury)
    return curx, cury
end

-- Loops over each frame and initializes them by changing their hex
function beyond_lib_init()
    for i,v in pairs(beyond_f_array) do
        curx, cury = btp_next_cord()
        beyond_lib_debug("Change: " .. beyond_f_array[i] .. " Hex: " .. beyond_c_array[i])
        btp_frame_set_color_hex(beyond_f_array[i], beyond_c_array[i])
    end
end

-- Define slash commands/ Creation of all frames
function btp_frame_onload(self)
    local curx
    local cury
    local curw
    local curh
    curw = fr_width_g
    curh = fr_height_g

    beyond_lib_debug("btp_frame: OnLoad")
    SLASH_BTP_FRAME1 = "/btp_frame"
    SLASH_BTP_INIT1 = "/btp_finit"
    SLASH_BTP_DBG1 = "/btp_dbg"

    SlashCmdList["BTP_FRAME"] = function(cmdstr)
        -- btp_frame_debug("cmdstr: " .. cmdstr)
        btp_frame_runcmd(cmdstr)
    end

    SlashCmdList["BTP_INIT"] = beyond_lib_init

    SlashCmdList["BTP_DBG"] = function(cmdstr)
        -- btp_frame_debug(cmdstr);
    end
    
    --Loop creation of bars
    for i,v in pairs(beyond_f_array) do
        curx, cury = btp_next_cord()
        btp_frame_create(beyond_f_array[i], curx, cury, curw, curh)
    end
end

-- Hide/Show function
function btp_frame_toggle(fname)
    local full_name = "btp_frame_" .. fname
    local frame = getglobal(full_name)
    --btp_frame_debug(full_name)
    if (frame) then
        if (frame:IsVisible()) then
            frame:Hide()
        else
            frame:Show()
        end
    end
end
