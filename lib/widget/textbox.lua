-----------------------------------
-- Author: Uli Schlachter        --
-- Copyright 2009 Uli Schlachter --
-----------------------------------

local type = type
local widget = require("wibox.widget")
local string = {
    format = string.format
}

module("obvious.lib.widget.textbox")

function create(data, layout)
    local obj = { }

    obj.data = data
    obj.widget = widget.textbox()
    obj.format = "%3d%%"

    obj.update = function(obj)
        local max = obj.data.max or 1
        local val = obj.data:get() or max
        local perc = val / max * 100
        if type(obj.format) == "function" then
            obj.widget:set_markup(obj.format(perc))
        else
            obj.widget:set_markup(string.format(obj.format, perc))
        end
    end

    obj.set_format = function(obj, format)
        obj.format = format
        obj:update()
        return obj
    end

    return obj
end

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
