DifficultyMenu = class()

local easyButton
local mediumButton 
local hardButton 

function DifficultyMenu:init()
    
    easyButton = Button("Cargo Bot:Pack Easy", vec2(WIDTH/2-300, HEIGHT/2))
    mediumButton = Button("Cargo Bot:Pack Medium", vec2(WIDTH/2, HEIGHT/2))
    hardButton = Button("Cargo Bot:Pack Hard", vec2(WIDTH/2+300, HEIGHT/2))
    
    easyButton.draggable = false
    mediumButton.draggable = false
    hardButton.draggable = false
end

function DifficultyMenu:draw()
    
    sprite("SpaceCute:Background", WIDTH/2, HEIGHT/2, 1024, 768)
    
    easyButton:draw()
    mediumButton:draw()
    hardButton:draw()
end

function DifficultyMenu:touched(touch)
    
    easyButton:touched(touch)
    mediumButton:touched(touch)
    hardButton:touched(touch)
    
    if(easyButton.selected == true) then
        difficultySelected = "easy"
        Scene.Change("game")
    elseif(mediumButton.selected == true) then
        difficultySelected = "medium"
        Scene.Change("game")
    elseif(hardButton.selected == true) then
        difficultySelected = "hard"
        Scene.Change("game")
    end
end
