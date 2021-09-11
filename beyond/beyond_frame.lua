-- Globals
cur_xpos_g = 0
cur_ypos_g = 0
fr_width_g = 75
fr_height_g = 20

beyond_debug = 0
beyond_f_array = { "IT", "IA", "IPT", "CT", "CA", "CPT", "AT", "AA", "APT", "PT", "MA", "PA", "MP", "PPT" }
beyond_c_array = { "000011", "000022", "000033", "000044", "000055", "000066", "000077", "000088", "000099", "0000AA", "0000BB", "0000BB", "0000CC", "0000DD", "0000EE" }


function beyond_frame_debug(msg)
	--Display debug message if debug is on
	if beyond_debug == 1 then
		DEFAULT_CHAT_FRAME:AddMessage(msg)
		UIErrorsFrame:AddMessage(msg, 1.0,1.0, 0, 1, 10)
	else
		return
	end
end


function beyond_cords()
	-- Creating next cords for frame
	local curx
	local cury
	curx = cur_xpos_g
	cury = cur_ypos_g

	cur_xpos_g = cur_xpos_g + fr_width_g
	--beyond_frame_debug("Next xpos: " .. curx .. " ypos: " .. cury)
	return curx, cury
end

function beyond_frame_init()
	-- Using 2 arrays to recolor all frames to test functionality
	for i,v in pairs(beyond_f_array) do
		curx, cury = beyond_cords()
		--beyond_frame_debug("Change: " .. beyond_f_array[i] .. " Hex: " .. beyond_c_array[i])
		btp_frame_set_color_hex(beyond_f_array[i], beyond_c_array[i])
	end
end

function beyond_change_debug()
	--Used for changing debug status on the fly
	if beyond_debug == 0 then
		beyond_debug = 1
		beyond_frame_debug("Debug ON")
	else
		beyond_frame_debug("Debug OFF")
		beyond_debug = 0
	end
end




function beyond_frame_onload(self)
	--OnLoad even from XML
	beyond_frame_debug("beyond_frame: OnLoad Event")
	--Local scope cord variables
	local curx
	local cury
	local curw
	local curh
	curw = fr_width_g
	curh = fr_height_g

	--Slash commands
	SLASH_BTP_FINIT1 = "/beyond_init"
	SLASH_BTP_DBG1 = "/beyond_debug"
	SLASH_BEY_DB1 = "/beyond_db"


	SlashCmdList["BTP_FINIT"] = beyond_frame_init

	SlashCmdList["BTP_DBG"] = beyond_change_debug
	
	SlashCmdList["BEY_DB"] = beyond_frame_debug(cmdstr)


	--Loop for creation of frames
	for i,v in pairs(beyond_f_array) do
		curx, cury = beyond_cords()
		btp_frame_create(beyond_f_array[i], curx, cury, curw, curh);
		beyond_frame_debug("Create frame: " .. beyond_f_array[i] .. " xpos: " .. curx .. " ypos: " .. cury)
	end
end

function btp_frame_toggle(fname)
	local full_name = "btp_frame_" .. fname;
	local frame = getglobal(full_name)
	--beyond_frame_debug(full_name);
	if(frame) then
		if(frame:IsVisible()) then
			frame:Hide();
		else
			frame:Show();
		end
	end
end

function btp_frame_onclick(arg1)
	id = this:GetID();
	beyond_frame_debug("btp_frame: onclick: " .. this:GetName() .. " ID: " .. id .. " Button: " .. arg1);
end


function btp_frame_create(arg_fname, curx, cury, curw, curh)
	local fname = "btp_frame_" .. arg_fname;
	-- beyond_frame_debug("btp_frame_create: " .. fname .. " curx: " .. curx .. " cury: " .. cury .. " curw: " .. curw .. " curh: " .. curh);

	local f=CreateFrame("FRAME",fname,UIParent);
	f:SetWidth(curw); f:SetHeight(curh);
	f:SetPoint("TOPLEFT",UIParent, "TOPLEFT", curx, cury);
	f:SetBackdrop({
		bgFile = "Interface\\Addons\\btp\\white16x16", tile = true, tileSize = 16,
		edgeFile = "Interface\\Addons\\btp\\white16x16", edgeSize = 1,
		insets = {left = 1, right = 1, top = 1, bottom = 1},
	});
	f:SetBackdropBorderColor(0,0,0,0);
	f:SetBackdropColor(0,0,0,1);
	
	local fs = f:CreateFontString("$parentText","ARTWORK","GameFontNormal");
	fs:SetAllPoints();
	--fs:SetText(arg_fname);
end

function btp_frame_create_pos(arg_fname, curx, cury, curw, curh)
	local fname = "btp_frame_" .. arg_fname;
	-- beyond_frame_debug("btp_frame_create: " .. fname .. " curx: " .. curx .. " cury: " .. cury .. " curw: " .. curw .. " curh: " .. curh);

	local f=CreateFrame("FRAME",fname,UIParent);
	f:SetWidth(curw); f:SetHeight(curh);
	f:SetPoint("CENTER",UIParent, "CENTER", curx, cury);
	f:SetBackdrop({
		bgFile = "Interface\\Addons\\btp\\white16x16", tile = true, tileSize = 16,
		edgeFile = "Interface\\Addons\\btp\\white16x16", edgeSize = 1,
		insets = {left = 1, right = 1, top = 1, bottom = 1},
	});
	f:SetBackdropBorderColor(0,0,0,0);
	f:SetBackdropColor(0,0,0,1);
	
	local fs = f:CreateFontString("$parentText","ARTWORK","GameFontNormal");
	fs:SetAllPoints();
	--fs:SetText(arg_fname);
end



function btp_frame_set_color(fname, red, green, blue)
	local full_name = "btp_frame_" .. fname;
	--beyond_frame_debug("btp_frame_set_color: " .. full_name ..
        --                " = " .. red .. " " .. " " .. green .. " " .. blue);
	local frame = getglobal(full_name)
        if (frame and red and green and blue) then
	    frame:SetBackdropColor(red,green,blue);
        end
end

function btp_frame_set_color_hex(fname, hex)
        if (fname and hex) then
	    local rhex, ghex, bhex = string.sub(hex, 1, 2),
                                     string.sub(hex, 3, 4),
                                     string.sub(hex, 5, 6);
	    btp_frame_set_color(fname, tonumber(rhex, 16)/255,
                                       tonumber(ghex, 16)/255,
                                       tonumber(bhex, 16)/255);
        end
end
