OperatorMenu = class()

local additionButton
local subtractionButton
local multiplicationButton
local divisionButton
local allButton


function OperatorMenu:init()

    additionButton = Button("Cargo Bot:Condition Red", vec2(WIDTH/2-100, HEIGHT/2+100))
    subtractionButton = Button("Cargo Bot:Condition Yellow", vec2(WIDTH/2+100, HEIGHT/2+100))
    multiplicationButton = Button("Cargo Bot:Condition Green", vec2(WIDTH/2-100, HEIGHT/2-100))
    divisionButton = Button("Cargo Bot:Condition Blue", vec2(WIDTH/2+100, HEIGHT/2-100))
    allButton = Button("Cargo Bot:Condition Any", vec2(WIDTH/2, HEIGHT/2))
    
    additionButton.draggable = false
    subtractionButton.draggable = false
    multiplicationButton.draggable = false
    divisionButton.draggable = false
    allButton.draggable = false
end

function OperatorMenu:draw()    
    
    sprite("SpaceCute:Background", WIDTH/2, HEIGHT/2, 1024, 768)
    
    additionButton:draw()
    subtractionButton:draw()
    multiplicationButton:draw()
    divisionButton:draw()
    allButton:draw()
end

function OperatorMenu:touched(touch)

    additionButton:touched(touch)
    subtractionButton:touched(touch)
    multiplicationButton:touched(touch)
    divisionButton:touched(touch)
    allButton:touched(touch)
    
    if(additionButton.selected == true) then
        operatorSelected = "+"
        Scene.Change("difficulty")
    elseif(subtractionButton.selected == true) then
        operatorSelected = "-"
        Scene.Change("difficulty")
    elseif(multiplicationButton.selected == true) then
        operatorSelected = "*"
        Scene.Change("difficulty")
    elseif(divisionButton.selected == true) then
        operatorSelected = "/"
        Scene.Change("difficulty")
    elseif(allButton.selected == true) then
        operatorSelected = "@"
        Scene.Change("difficulty")
    end
end
