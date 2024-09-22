local gameState = "menu"
local player = { x = 400, y = 300, size = 20 }
local zombies = {}
local bullets = {}
local bombs = {}
local zombiePoints = 0
local currentTool = "gun"

function love.load()
    love.window.setMode(800, 600)
    font = love.graphics.newFont(24)
end

function love.update(dt)
    if gameState == "playing" then
        -- Update game logic here (player movement, zombie AI, etc.)
    end
end

function love.draw()
    if gameState == "menu" then
        drawMenu()
    elseif gameState == "playing" then
        drawGame()
    end
end

function drawMenu()
    love.graphics.setFont(font)
    love.graphics.printf("2D Zombie Demo", 0, 50, 800, "center")
    
    -- Start button
    love.graphics.rectangle("line", 350, 275, 100, 50)
    love.graphics.printf("Start", 350, 285, 100, "center")
end

function drawGame()
    -- Draw player
    love.graphics.rectangle("fill", player.x, player.y, player.size, player.size)
    
    -- Draw zombies
    for _, zombie in ipairs(zombies) do
        love.graphics.setColor(0, 1, 0)
        love.graphics.rectangle("fill", zombie.x, zombie.y, 20, 20)
    end
    
    -- Draw UI elements
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("ZP: " .. zombiePoints, 700, 10, 100, "left")
    
    -- Zombie spawn input and button
    love.graphics.rectangle("line", 10, 10, 100, 30)
    love.graphics.printf("Spawn", 120, 15, 60, "center")
    
    -- Tool selection
    love.graphics.rectangle("line", 10, 550, 60, 40)
    love.graphics.printf("Gun", 10, 560, 60, "center")
    love.graphics.rectangle("line", 80, 550, 60, 40)
    love.graphics.printf("Bomb", 80, 560, 60, "center")
    
    -- Current tool indicator
    if currentTool == "gun" then
        love.graphics.circle("fill", player.x + player.size / 2, player.y + player.size / 2, 5)
    elseif currentTool == "bomb" then
        love.graphics.circle("line", player.x + player.size / 2, player.y + player.size / 2, 10)
    end
end

function love.mousepressed(x, y, button)
    if gameState == "menu" then
        if x > 350 and x < 450 and y > 275 and y < 325 then
            gameState = "playing"
        end
    elseif gameState == "playing" then
        if y > 550 then
            if x < 70 then
                currentTool = "gun"
            elseif x < 140 then
                currentTool = "bomb"
            end
        elseif x > 120 and x < 180 and y < 40 then
            spawnZombies()
        else
            if currentTool == "gun" then
                shoot(x, y)
            elseif currentTool == "bomb" then
                placeBomb(x, y)
            end
        end
    end
end

function spawnZombies()
    -- Implement zombie spawning logic
end

function shoot(x, y)
    -- Implement shooting logic
end

function placeBomb(x, y)
    -- Implement bomb placing logic
end
