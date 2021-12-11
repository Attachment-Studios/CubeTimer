-- conf.lua

function love.conf(t)
	t.window.title = "CubeTimer"
	t.window.resizable = true
	t.window.width = 1000
	t.window.minwidth = 550
	t.window.height = 600
	t.window.minheight = 150
	t.window.icon = "icon.png"
	
	t.window.fullscreen = false
	
	t.modules.audio = false
	t.modules.filesystem = false
	t.modules.joystick = false
	t.modules.physics = false
	t.modules.sound = false
	t.modules.video = false
end