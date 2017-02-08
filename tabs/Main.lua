supportedOrientations(LANDSCAPE_ANY)
displayMode(FULLSCREEN)

--global variables
amountOfCoins = nil 
amountOfSkips = nil
amountOfQuestionsRight = nil
operatorSelected = ""
difficultySelected= ""

function setup()
    noFill()
    noSmooth()
    noStroke()
    pushStyle()
    
    amountOfCoins = readLocalData("coins", 0)
    amountOfSkips = readLocalData("skips", 0)
    amountOfQuestionsRight = readLocalData("highscore", 0)
    
    Scene("mainmenu", MainMenu)
    Scene("operator", OperatorMenu)
    Scene("difficulty", DifficultyMenu)
    Scene("game", MainGame)
    Scene("store", Store)
    
    Scene.Change("mainmenu")
end

function touched(touch)
    
    Scene.Touched(touch)
end

function draw()
    background(40, 40, 40, 255)
    
    Scene.Draw()
end