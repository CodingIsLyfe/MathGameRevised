Store = class()

function Store:init()
   
    buyButton = Button("Cargo Bot:Step Button", vec2(WIDTH/2+200, HEIGHT/2+100))
    homeButton = Button("Cargo Bot:Command Left", vec2(WIDTH/2-350, HEIGHT/2+335))
    buyButton.draggable = false
    homeButton.draggable = false 
end

function Store:draw()
    
    sprite("Cargo Bot:Starry Background", WIDTH/2, HEIGHT/2, 1024, 768)
    buyButton:draw()
    homeButton:draw()
    
    fill(255, 255, 255, 255)
    fontSize(50)
    font("Arial-BoldMT")
    text("Coins: $"..math.floor(amountOfCoins), WIDTH/2+200, HEIGHT-100)
    text("Skips", WIDTH/2-200, HEIGHT/2+100)
    text("$5", WIDTH/2+300, HEIGHT/2+100)
    fontSize(30)
    text("You have: "..math.floor(amountOfSkips), WIDTH/2-200, HEIGHT/2+65)
end

function Store:touched(touch)
   
    buyButton:touched(touch)
    homeButton:touched(touch)
    
    if(homeButton.selected == true) then
        Scene.Change("mainmenu")
    end
    
    if(buyButton.selected == true) then
        if(amountOfCoins > 5) then
            amountOfCoins = amountOfCoins - 5
            amountOfSkips = amountOfSkips + 1
            saveLocalData("coins", amountOfCoins)
            saveLocalData("skips", amountOfSkips)
        else
            alert("Answer more questions correct to gain more coins", "Insufficient funds!")
        end
    end
end
