local widget = widget
local timer = timer
local beautiful = beautiful
local awful = awful
require("widget_fun")
local widget_fun = widget_fun
require("vicious")
local vicious = vicious

module("widgets")

-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" }, " %d/%m %R ", 60)

clock_tooltip = awful.tooltip({
	objects = { mytextclock },
	timer_function = function()
        local datespec = os.date("*t")
        datespec = datespec.year * 12 + datespec.month - 1
        datespec = (datespec % 12 + 1) .. " " .. math.floor(datespec / 12)
        local cal = awful.util.pread("ncal -A 1 -m " .. datespec .. " -M -b")
        cal = string.gsub(cal, "^%s*(.-)%s*$", "%1")
		cal = string.gsub(cal, "_\ _\(%d)", "<b>%1</b>")
        return string.format('<span font_desc="%s">%s</span>', "monospace", cal .. datespec)
	end,
})

-- Battery state
batwidget = widget({ type = "textbox" })
vicious.register(batwidget, vicious.widgets.bat, widget_fun.batclosure(), 31, "BAT0")

-- wifi
local ssid

netwidget = widget({ type = "textbox" })
vicious.register(netwidget, vicious.widgets.wifi, 
function(widget, args)
	ssid = args["{ssid}"]
	if ssid == "N/A" then
		return ""
	else
		return "((↑↓))"
	end
end
, 3, "eth1")

net_tooltip = awful.tooltip({
	objects = { netwidget },
	timer_function = function()
						return ssid
					end,
})
