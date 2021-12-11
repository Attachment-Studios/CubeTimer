-- CubeTimer

function love.load()
	current_os_time = love.timer.getTime()
	time = "0.00"
	state = "home"
	
	font = love.graphics.newFont("font.ttf", 72)
	love.graphics.setFont(font)
end

function love.update()
	if state == "update" then
		time = math.floor((love.timer.getTime() - current_os_time) * 100) / 100
	end
end

function love.draw()
	love.graphics.setLineWidth(10)
	love.graphics.rectangle('line', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	if state == "home" or state == "update" then
		love.graphics.print(time, ( love.graphics.getWidth() / 2 ) - ( love.graphics.getFont():getWidth(time) / 2 ), ( love.graphics.getHeight() / 2 ) - ( love.graphics.getFont():getHeight(time) / 2 ), 0, 1, 1)
	else
		love.graphics.setLineWidth(5)
		love.graphics.print(time, ( love.graphics.getWidth() / 4 ) - ( love.graphics.getFont():getWidth(time) / 2 ), ( love.graphics.getHeight() / 2 ) - ( love.graphics.getFont():getHeight(time) / 2 ), 0, 1, 1)
		--love.graphics.print("Set PB", ( love.graphics.getWidth() * 1 / 4 ) - ( font:getWidth("Set PB") / 4 ), love.graphics.getHeight() - ( font:getHeight("Set PB") / 2 ), 0, 0.5, 0.5)
		love.graphics.print("Resume", ( love.graphics.getWidth() * 3 / 4 ) - ( font:getWidth("Resume") / 2 ), ( love.graphics.getHeight() * 1 / 4 ) - ( font:getHeight("Resume") / 2 ))
		love.graphics.rectangle('line', 0, 0, love.graphics.getWidth() / 2, love.graphics.getHeight())
		love.graphics.rectangle('line', love.graphics.getWidth() / 2, 0, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
		love.graphics.rectangle('line', love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
		love.graphics.print("Reset", ( love.graphics.getWidth() * 3 / 4 ) - ( font:getWidth("Reset") / 2 ), ( love.graphics.getHeight() * 3 / 4 ) - ( font:getHeight("Reset") / 2 ))
	end
end

function action(x, y)
	if state == "update" then
		state = "noupdate"
		return
	elseif state == "home" then
		current_os_time = love.timer.getTime()
		state = "update"
		return
	elseif state == "noupdate" then
		if x ~= nil and y ~= nil then
			if x > love.graphics.getWidth() / 2 then
				if y < love.graphics.getHeight() /2 then
					current_os_time = love.timer.getTime() - tonumber(time)
					state = "update"
					return
				else
					current_os_time = love.timer.getTime()
					time = "0.00"
					state = "home"
					return
				end
			end
		end
	end
end

function love.mousepressed(x, y)
	action(x, y)
end

function love.keypressed()
	action(nil, nil)
end

function love.touchreleased(i, x, y)
	action(x, y)
end

