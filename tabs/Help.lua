--[[
--[[if (worldSelected  == "?" and levelDifficultySelected  == "Easy") then

        if (finalWorldEquationType == 1) then

            number1 = math.random (0,9)

            number2 = math.random (0,9)

            equationAnswer = (number1 + number2)

            equationAnswerIncorrect = equationAnswer + math.random(1,3)

            equationType = "+"

        elseif (finalWorldEquationType == 2) then

            number1 = math.random (0,9)

            number2 = math.random (0,9)

            if (number1<number2) then

                temp=number2

                number2=number1

                number1=temp

            end

            equationAnswer = (number1 - number2)

            equationAnswerIncorrect = equationAnswer + math.random(1,3)

            equationType = "-"

        elseif (finalWorldEquationType == 3) then

            number1 = math.random (0,3)

            number2 = math.random (0,3)

            equationAnswer = (number1 * number2)

            equationAnswerIncorrect = equationAnswer + math.random(1,3)

            equationType = "*"

        elseif (finalWorldEquationType == 4) then

            equationAnswer = math.random (1,3)

            number2 = math.random (1,3)

            number1 = equationAnswer*number2

            equationAnswerIncorrect = equationAnswer + math.random(1,3)

            equationType = "/"

        end --]] 
--]]