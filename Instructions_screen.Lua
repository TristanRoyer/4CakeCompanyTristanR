

-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Tristan Royer
-- Date: 5th May 2018
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "Intructions_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

--local variables

local Instructions
local backButton

local function MainMenuTransition( )       
    composer.gotoScene( "main_menu", {effect = "fromTop", time = 500})
end  

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    local Instructions = display.newImage()
    Instructions.x = display.contentCenterX
    Instructions.y = display.contentCenterY
    Instructions.width = display.contentWidth
    Instructions.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( Instructions )

    -- Send the background image to the back layer so all other objects can be on top
    Instructions:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    backButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*7/8,

            
                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 20,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 1, 0.6, 0.2 }, over = { 0.5, 0.3, 0.1 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Back", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 40,

            -- When the button is released, call the Level1 screen transition function
            onRelease = MainMenuTransition         
        } )

sceneGroup:insert( backButton )

end


-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
