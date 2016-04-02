// *************************************************************************
//  This file is part of SourceBans++.
//
//  Copyright (C) 2014-2016 Sarabveer Singh <me@sarabveer.me>
//  
//  SourceBans++ is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, per version 3 of the License.
//  
//  SourceBans++ is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with SourceBans++. If not, see <http://www.gnu.org/licenses/>.
//
//  This file incorporates work covered by the following copyright(s): 
//
//   ULX Source Bans 0.2.3a
//   Copyright (C) 2015 FunDK and PatPeter
//   Licensed under GNU GPL version 3, or later.
//   Page: <http://www.sourcebans.net/> - <https://github.com/GameConnect/sourcebansv1>  
//
// *************************************************************************

local CATEGORY_NAME = "Source Bans"

function ulx.sban( calling_ply, target_ply, minutes, reason )
	if target_ply:IsBot() then
		ULib.tsayError( calling_ply, "Cannot ban a bot", true )
		return
	end
	
	if reason == "" or reason == "reason" then
		ULib.tsayError( calling_ply, "Cannot ban without a reason", true )
		return
	end
	
	local name = target_ply:GetName()

	SBAN.Player_Ban( target_ply, minutes*60, reason, calling_ply:SteamID() )
	
	local time = "for #i minute(s)"
	if minutes == 0 then time = "permanently" end
	local str = "#A banned #s " .. time
	if reason and reason ~= "" then str = str .. " (#s)" end
	ulx.fancyLogAdmin( calling_ply, str, name, minutes ~= 0 and minutes or reason, reason )
end
local sban = ulx.command( CATEGORY_NAME, "ulx sban", ulx.sban, "!sban" )
sban:addParam{ type=ULib.cmds.PlayerArg }
sban:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
sban:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
sban:defaultAccess( ULib.ACCESS_ADMIN )
sban:help( "Bans target." )

function ulx.sbanid( calling_ply, steamid, minutes, reason )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		ULib.tsayError( calling_ply, "Invalid steamid." )
		return
	end

	local target_ply = nil 
	local plys = player.GetAll()
	for i=1, #plys do
		if plys[ i ]:SteamID() == steamid then
			target_ply = plys[ i ]
			break
		end
	end

	if(target_ply != nil) then
		name = target_ply:GetName()
		SBAN.Player_Ban( target_ply, minutes*60, reason, calling_ply:SteamID() )
	else
		SBAN.Player_DoBan( "unknown", steamid, "[Unknown]", minutes*60, reason, calling_ply:SteamID() )
	end

	local time = "for #i minute(s)"
	if minutes == 0 then time = "permanently" end
	local str = "#A banned steamid #s "
	if name then
		steamid = steamid .. "(" .. name .. ") "
	end
	str = str .. time
	if reason and reason ~= "" then str = str .. " (#4s)" end
	ulx.fancyLogAdmin( calling_ply, str, steamid, minutes ~= 0 and minutes or reason, reason )
end
local sbanid = ulx.command( CATEGORY_NAME, "ulx sbanid", ulx.sbanid )
sbanid:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
sbanid:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
sbanid:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
sbanid:defaultAccess( ULib.ACCESS_SUPERADMIN )
sbanid:help( "Bans steamid." )


local CATEGORY_NAME = "Source Comms"

function ulx.cgag( calling_ply, target_ply, minutes, reason )
	ULib.tsayError( calling_ply, "This feature isn't complete yet!", true )
	return
end
local cgag = ulx.command( CATEGORY_NAME, "ulx cgag", ulx.cgag, "!cgag" )
cgag:addParam{ type=ULib.cmds.PlayerArg }
cgag:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
cgag:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
cgag:defaultAccess( ULib.ACCESS_ADMIN )
cgag:help( "Gags target." )

function ulx.cgagid( calling_ply, target_ply, minutes, reason )
	ULib.tsayError( calling_ply, "This feature isn't complete yet!", true )
	return
end
local cgagid = ulx.command( CATEGORY_NAME, "ulx cgagid", ulx.cgagid, "!cgagid" )
cgagid:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
cgagid:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
cgagid:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
cgagid:defaultAccess( ULib.ACCESS_ADMIN )
cgagid:help( "Gags target." )

function ulx.cmute( calling_ply, target_ply, minutes, reason )
	ULib.tsayError( calling_ply, "This feature isn't complete yet!", true )
	return
end
local cmute = ulx.command( CATEGORY_NAME, "ulx cmute", ulx.cmute, "!cmute" )
cmute:addParam{ type=ULib.cmds.PlayerArg }
cmute:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
cmute:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
cmute:defaultAccess( ULib.ACCESS_ADMIN )
cmute:help( "Mutes target." )

function ulx.cmuteid( calling_ply, target_ply, minutes, reason )
	ULib.tsayError( calling_ply, "This feature isn't complete yet!", true )
	return
end
local cmuteid = ulx.command( CATEGORY_NAME, "ulx cmuteid", ulx.cmuteid, "!cmuteid" )
cmuteid:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
cmuteid:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
cmuteid:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
cmuteid:defaultAccess( ULib.ACCESS_ADMIN )
cmuteid:help( "Mutes target." )

function ulx.csilence( calling_ply, target_ply, minutes, reason )
	ULib.tsayError( calling_ply, "This feature isn't complete yet!", true )
	return
end
local csilence = ulx.command( CATEGORY_NAME, "ulx csilence", ulx.csilence, "!csilence" )
csilence:addParam{ type=ULib.cmds.PlayerArg }
csilence:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
csilence:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
csilence:defaultAccess( ULib.ACCESS_ADMIN )
csilence:help( "Silences target." )

function ulx.csilenceid( calling_ply, target_ply, minutes, reason )
	ULib.tsayError( calling_ply, "This feature isn't complete yet!", true )
	return
end
local csilenceid = ulx.command( CATEGORY_NAME, "ulx csilenceid", ulx.csilenceid, "!csilenceid" )
csilenceid:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
csilenceid:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
csilenceid:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
csilenceid:defaultAccess( ULib.ACCESS_ADMIN )
csilenceid:help( "Silences target." )