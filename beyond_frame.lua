-- Globals
cur_xpos_g = 0
cur_ypos_g = 0
fr_width_g = 75
fr_height_g = 20
b_frame_array = { "IT", "IA", "IPT", "CT", "CA", "CPT", "AT", "AA", "APT", "PT", "MA", "PA", "MP", "PPT" }

function btp_frame_debug(msg)
    DEFAULT_CHAT_FRAME:AddMessage(msg)
    UIErrorsFrame:AddMessage(msg, 1.0, 1.0, 0, 1, 10)
end

function btp_next_cord()
    local curx
    local cury
    curx = cur_xpos_g
    cury = cur_ypos_g

    cur_xpos_g = cur_xpos_g + fr_width_g
    -- btp_frame_debug("xpos: " .. curx .. " ypos: " .. cury);
    return curx, cury
end

function btp_frame_init()
    btp_frame_set_color_hex("IT", "000011")
    btp_frame_set_color_hex("IA", "000022")
    btp_frame_set_color_hex("IPT", "000033")
    btp_frame_set_color_hex("CT", "000044")
    btp_frame_set_color_hex("CA", "000055")
    btp_frame_set_color_hex("CPT", "000066")
    btp_frame_set_color_hex("AT", "000077")
    btp_frame_set_color_hex("AA", "000088")
    btp_frame_set_color_hex("APT", "000099")
    btp_frame_set_color_hex("PT", "0000AA")
    btp_frame_set_color_hex("MA", "0000BB")
    btp_frame_set_color_hex("PA", "0000CC")
    btp_frame_set_color_hex("MP", "0000DD")
    btp_frame_set_color_hex("PPT", "0000EE")
end

function btp_frame_onload(self)
    local curx
    local cury
    local curw
    local curh
    curw = fr_width_g
    curh = fr_height_g

    -- btp_frame_debug("btp_frame: OnLoad");
    SLASH_BTP_FRAME1 = "/btp_frame"
    SLASH_BTP_INIT1 = "/btp_finit"
    SLASH_BTP_DBG1 = "/btp_dbg"

    SlashCmdList["BTP_FRAME"] = function(cmdstr)
        -- btp_frame_debug("cmdstr: " .. cmdstr);
        btp_frame_runcmd(cmdstr)
    end

    SlashCmdList["BTP_INIT"] = btp_frame_init

    SlashCmdList["BTP_DBG"] = function(cmdstr)
        -- btp_frame_debug(cmdstr);
    end

    for i, v in pairs(b_frame_array) do
    curx, cury = btp_next_cord()
    btp_frame_create(v[i], curx, cury, curw, curh)
    end
end

function btp_frame_print_usage(cmdstr)
    --btp_frame_debug("/pk [0-9] [arg1 ... argn]");
end

function btp_frame_toggle(fname)
    local full_name = "btp_frame_" .. fname
    local frame = getglobal(full_name)
    --btp_frame_debug(full_name);
    if (frame) then
        if (frame:IsVisible()) then
            frame:Hide()
        else
            frame:Show()
        end
    end
end
