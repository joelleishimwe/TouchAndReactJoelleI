-- Title: TouchAndReact
-- Name: Joelle Ishimwe
-- Course: ICS2O/3C
-- This program displays a button that when I click on it, it turns colour and displays text another object
-----------------------------------------------------------------------------------------

--background colour
display.setDefault ("background", 204/255, 204/255, 255/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create sound
local oneCheer = audio.loadSound ("Sounds/oneCheer.mp3")
local oneCheerChannel 

-- display image of balloons
local balloons = display.newImageRect("Images/balloons.png", 300, 300)

-- set the image to be transparent
balloons.alpha = 1

-- set the initial x and y position of balloons
balloons.x = 200
balloons.y = display.contentHeight/3

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create red button, set its position and make it invisible
local textObject = display.newText("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (0, 0, 1)
textObject.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function BlueButtonListener (touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

-- add the respective listener to each object 
blueButton:addEventListener("touch", BlueButtonListener)

-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when red button is clicked, it will make the text appear with the blue button,
-- and make the red button disappear

local function RedButtonListener (touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = true
		balloons.isVisible = false

	end

	if (touch.phase == "ended") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		balloons.isVisible = true
		oneCheer = audio.play(oneCheer)

	end
end



-- add the respective listener to each object 
redButton:addEventListener("touch", RedButtonListener)



