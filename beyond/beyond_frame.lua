-- Globals
cur_xpos_g = 0
cur_ypos_g = 0
fr_width_g = 75
fr_height_g = 20

-- Set to 1 for debug messages; Or use /beyond_debug
beyond_debug = 1

-- Frame names & Hex color array
beyond_f_array = {"IT", "IA", "IPT", "CT", "CA", "CPT", "AT", "AA", "APT", "PT", "MA", "PA", "MP", "PPT"}
beyond_c_array = {
    "000011",
    "000022",
    "000033",
    "000044",
    "000055",
    "000066",
    "000077",
    "000088",
    "000099",
    "0000AA",
    "0000BB",
    "0000BB",
    "0000CC",
    "0000DD",
    "0000EE"
}

-- WowAce3
Beyond = LibStub('AceAddon-3.0'):NewAddon("Beyond", 'AceConsole-3.0')

-- OnInitialize Event called by Ace3
function Beyond:OnInitialize()
    self:Debug("Beyond:OnInitialize()")
	self:AddSlashCommands()
	self:Setup()
end

function Beyond:AddSlashCommands()
    self:RegisterChatCommand('beyond', 'HandleSlashCommand')
    self:RegisterChatCommand('br', 'HandleSlashCommand')
end

function Beyond:HandleSlashCommand(cmd)
	cmd = cmd and cmd:lower() or ''
	if cmd == 'init' then
		Beyond:Frame_init()
	elseif cmd == 'debug' then
		self:Debug_toggle()
	elseif cmd == 'toggle' then
		self:Toggle_bars()
	else
		return
	end
end


function Beyond:Cords()
    -- Creating next cords for frame
    local curx
    local cury
    curx = cur_xpos_g
    cury = cur_ypos_g

    cur_xpos_g = cur_xpos_g + fr_width_g
    --self:Debug("Next xpos: " .. curx .. " ypos: " .. cury)
    return curx, cury
end

function Beyond:Setup()
    local curx
    local cury
    local curw
    local curh
    curw = fr_width_g
    curh = fr_height_g
	
    for i, v in pairs(beyond_f_array) do
        curx, cury = self:Cords()
        btp_frame_create(beyond_f_array[i], curx, cury, curw, curh)
        --self:Debug("Create frame: " .. beyond_f_array[i] .. " xpos: " .. curx .. " ypos: " .. cury)
    end
end

function Beyond:frame_init()
    -- Using 2 arrays to recolor all frames to test functionality
    for i, v in pairs(beyond_f_array) do
        curx, cury = self:Cords()
        --self:Debug("Change: " .. beyond_f_array[i] .. " Hex: " .. beyond_c_array[i])
        btp_frame_set_color_hex(beyond_f_array[i], beyond_c_array[i])
    end
end

function Beyond:Debug(msg)
    --Display debug message if debug is true
    if beyond_debug == 1 then
        -- Display message if debug = true
        DEFAULT_CHAT_FRAME:AddMessage(msg)
        UIErrorsFrame:AddMessage(msg, 1.0, 1.0, 0, 1, 10)
    else
        -- Don't display message if debug is false
        return
    end
end

function Beyond:debug_toggle()
    --Used for changing debug status on the fly
    if beyond_debug == 0 then
        beyond_debug = 1
        self:Debug("Debug ON")
    else
        self:Debug("Debug OFF")
        beyond_debug = 0
    end
end

function Beyond:frame_toggle(fname)
    local full_name = "btp_frame_" .. fname
    local frame = getglobal(full_name)
    --self:debug(full_name)
    if (frame) then
        if (frame:IsVisible()) then
            frame:Hide()
        else
            frame:Show()
        end
    end
end

function btp_frame_create(arg_fname, curx, cury, curw, curh)
    local fname = "btp_frame_" .. arg_fname
    -- self:Debug("btp_frame_create: " .. fname .. " curx: " .. curx .. " cury: " .. cury .. " curw: " .. curw .. " curh: " .. curh)

    local f = CreateFrame("FRAME", fname, UIParent)
    f:SetWidth(curw)
    f:SetHeight(curh)
    f:SetPoint("TOPLEFT", UIParent, "TOPLEFT", curx, cury)
    f:SetBackdrop(
        {
            bgFile = "Interface\\Addons\\btp\\white16x16",
            tile = true,
            tileSize = 16,
            edgeFile = "Interface\\Addons\\btp\\white16x16",
            edgeSize = 1,
            insets = {left = 1, right = 1, top = 1, bottom = 1}
        }
    )
    f:SetBackdropBorderColor(0, 0, 0, 0)
    f:SetBackdropColor(0, 0, 0, 1)

    local fs = f:CreateFontString("$parentText", "ARTWORK", "GameFontNormal")
    fs:SetAllPoints()
    --fs:SetText(arg_fname)
end



function btp_frame_set_color(fname, red, green, blue)
    local full_name = "btp_frame_" .. fname
    --self:Debug("btp_frame_set_color: " .. full_name ..
    --                " = " .. red .. " " .. " " .. green .. " " .. blue)
    local frame = getglobal(full_name)
    if (frame and red and green and blue) then
        frame:SetBackdropColor(red, green, blue)
    end
end

function btp_frame_set_color_hex(fname, hex)
    if (fname and hex) then
        local rhex, ghex, bhex = string.sub(hex, 1, 2), string.sub(hex, 3, 4), string.sub(hex, 5, 6)
        btp_frame_set_color(fname, tonumber(rhex, 16) / 255, tonumber(ghex, 16) / 255, tonumber(bhex, 16) / 255)
    end
end
