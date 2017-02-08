MainMenu = class()

local playButton

function MainMenu:init(x)

    playButton = Button("Cargo Bot:Play Solution Icon", vec2(WIDTH/2, HEIGHT/2))
    storeButton = Button("Cargo Bot:Menu Game Button", vec2(WIDTH/2+300, HEIGHT-100))
    playButton.draggable = false 
    storeButton.draggable = false  
end

function MainMenu:draw()

    sprite("SpaceCute:Background", WIDTH/2, HEIGHT/2, 1024, 768)
    playButton:draw()
    storeButton:draw()
    
    fill(255, 255, 255, 255)
    fontSize(50)
    font("Arial-BoldMT")
    text("Play", WIDTH/2, HEIGHT/2-50)
end

function MainMenu:touched(touch)

    playButton:touched(touch)
    storeButton:touched(touch)
    
    if(playButton.selected == true) then
        Scene.Change("operator")
    elseif(storeButton.selected == true) then
        Scene.Change("store")
    end
end
