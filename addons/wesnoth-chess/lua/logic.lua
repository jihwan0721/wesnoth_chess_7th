local Board = wesnoth.require "~add-ons/wesnoth-chess/core/board.lua"
local Rules = wesnoth.require "~add-ons/wesnoth-chess/core/rules.lua"
local AI = wesnoth.require "~add-ons/wesnoth-chess/core/ai.lua"
local State = wesnoth.require "~add-ons/wesnoth-chess/core/state.lua"

local Logic = {}

function Logic.init()
    Board.init()
    Rules.init()
    State.reset()
end

function Logic.on_turn(side)
    if Rules.is_checkmate(side) then
        return "checkmate"
    end
    
    if side == 2 then
        AI.play_turn(side)
    end
    
    return "continue"
end

return Logic
