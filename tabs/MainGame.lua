MainGame = class()

local homeButton 

function MainGame:init()
    lastProb="" --previous problem
    tries,value,right,wrong,size=3,0,0,0,30
    offset=vec2(WIDTH/2,HEIGHT/2)
    b={"0️⃣","1️⃣","2️⃣","3️⃣","4️⃣","5️⃣","6️⃣","7️⃣","8️⃣","9️⃣","❌","🔙","☑️"}
    pos={vec2(-150,-300),vec2(-250,0),vec2(-150,0),vec2(-50,0),vec2(-250,-100),
        vec2(-150,-100),vec2(-50,-100),vec2(-250,-200),vec2(-150,-200),vec2(-50,-200),
        vec2(-250,-300),vec2(-50,-300),vec2(80,115)}
    homeButton = Button("Cargo Bot:Command Left", vec2(WIDTH/2-350, HEIGHT/2+335))
    skipButton = Button("Cargo Bot:Fast Button Active", vec2(WIDTH-100, 100))
    create()
end

function create()    
    a,ans,str={},{},{}
    choice=math.random(4)
    for z=1,4 do
        if operatorSelected == "+" then    --  add
            if difficultySelected == "easy" then
                a[z]=vec2(math.random(9),math.random(9))
            elseif difficultySelected == "medium" then
                a[z]=vec2(math.random(99),math.random(99))
            elseif difficultySelected == "hard" then
                a[z]=vec2(math.random(999),math.random(999))
            end
            str[z]=string.format("%d + %d = ",a[z].x,a[z].y)
            ans[z]=math.tointeger(a[z].x+a[z].y)
        elseif operatorSelected == "-" then    --  subtract
            if difficultySelected == "easy" then
                a1=math.random(9)
                a2=math.random(9)
            elseif difficultySelected == "medium" then
                a1=math.random(99)
                a2=math.random(99)
            elseif difficultySelected == "hard" then
                a1=math.random(999)
                a2=math.random(999)
            end
            a[z]=vec2(math.max(a1,a2),math.min(a1,a2))  -- prevent negative answer
            str[z]=string.format("%d - %d = ",a[z].x,a[z].y)
            ans[z]=math.tointeger(a[z].x-a[z].y)
        elseif operatorSelected == "*" then    -- multiply
            if difficultySelected == "easy" then
                a[z]=vec2(math.random(9),math.random(9))
            elseif difficultySelected == "medium" then
                a[z]=vec2(math.random(99),math.random(99))
            elseif difficultySelected == "hard" then
                a[z]=vec2(math.random(999),math.random(999))
            end
            str[z]=string.format("%d x %d = ",a[z].x,a[z].y)
            ans[z]=math.tointeger(a[z].x*a[z].y)
        elseif operatorSelected == "/" then    -- divide
            if difficultySelected == "easy" then
                a1=math.random(1,9)
                a2=math.random(9)//a1
            elseif difficultySelected == "medium" then
                a1=math.random(1,99)
                a2=math.random(99)//a1
            elseif difficultySelected == "hard" then
                a1=math.random(1,999)
                a2=math.random(999)//a1
            end
            a[z]=vec2(a1*a2,a1) -- prevent fractional answer
            str[z]=string.format("%d / %d = ",a[z].x,a[z].y)
            ans[z]=a[z].x/a[z].y
        end        
    end
end

function MainGame:draw()
        
    sprite("SpaceCute:Background", WIDTH/2, HEIGHT/2, 1024, 768)
    
    homeButton:draw()
    skipButton:draw()
    
    stroke(0, 0, 0, 255) -- will give an outline to the rectangles 
    strokeWidth(3)

    -- draws the keypad background 
    fill(255, 255, 255, 255)
    rect(offset.x-300, offset.y-345,300,400)
    fill(255)
    fontSize(80)

    for i=1,13 do -- these are the buttons being drawn
        text(b[i],offset.x+pos[i].x,offset.y+pos[i].y)
    end
    
    -- this displays the "Right" and "Wrong" at the top of the screen and their values
    fontSize(48)
    text("Right: "..right,offset.x-125,HEIGHT-50) -- "Right 0" 
    text("Wrong: "..wrong,offset.x+125,HEIGHT-50) -- "Wrong 0"
    
    -- this show the keyed value
    rect(offset.x-300, offset.y+90, 300, 50) -- Input bar
    fill(0, 0, 0, 255)
    text(value,offset.x-150,offset.y+115) --keyed value
    
    -- this displays the professor sprite and his speech bubble
    sprite("Planet Cute:Character Boy", offset.x+225,offset.y-100, 350, 600) -- sprite on the right side of screen
    sprite("Platformer Art:Cloud 3", offset.x+240, offset.y+80, 250, 150)   -- cloud sprite 
    
    -- this displays the problem to solve
    fill(0, 0, 0, 255) 
    text(str[choice],offset.x+255,offset.y+50) --problem placed in/on top of the cloud
    
    -- th displays tries and skips and highscore
    fill(255, 255, 255, 255)
    text("Tries: "..tries, WIDTH-300,HEIGHT/2+200)
    text("Skips: "..amountOfSkips, WIDTH-100, 150)
    text("Highscore: "..math.floor(highscore), WIDTH/2, HEIGHT-100)
    
    -- this displays the last problem, green was right, red was wrong
    if corr then
        fill(0,255,0)
    else 
        fill(255, 0, 0, 255)
    end
    text(lastProb,WIDTH-300,50) --displays the correct answer in the bottom right corner under the sprite
end

function MainGame:touched(touch)
    
    homeButton:touched(touch)
    skipButton:touched(touch)
    
    if(homeButton.selected == true) then
        Scene.Change("mainmenu")
    elseif(skipButton.selected == true) then
        if(amountOfSkips > 0) then
            amountOfSkips = amountOfSkips - 1
            saveLocalData("skips", amountOfSkips)
            create()
        else
            alert("Not enough skips", "Oh no!")
        end
    end
    
    if touch.state==ENDED then --wait for touch to end
        for i=0,9 do
            if vec2(touch.x,touch.y):dist(pos[i+1]+offset)<size then
                value=value*10+i
                break
            end
        end
        if vec2(touch.x,touch.y):dist(pos[11]+offset)<size then        -- clear
            value=0
        elseif vec2(touch.x,touch.y):dist(pos[12]+offset)<size then    -- backspace
            value=value//10
        elseif vec2(touch.x,touch.y):dist(pos[13]+offset)<size then    -- enter
            if value==ans[choice] then
                corr=true
                lastProb=str[choice]..math.tointeger(ans[choice])
                create()
                right=right+1
                oldScore = highscore
                highscore = highscore + 1
                amountOfCoins = amountOfCoins + 1
                saveLocalData("coins", amountOfCoins)
                saveLocalData("highscore", highscore)
                if(highscore > oldScore) then
                    alert("", "New Highscore: "..math.floor(highscore))
                end
                tries=3
            else
                wrong=wrong+1
                tries=tries-1
                if tries==0 then  -- allow 3 tries
                    corr=false
                    lastProb=str[choice]..math.tointeger(ans[choice])
                    tries=3
                    create()
                end
            end
            value=0
        end        
    end
end
