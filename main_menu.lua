

-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Tristan Royer
-- Date: 04/20/18
-- Description: This is the main menu which does nothing

-- Use Composer Library
local composer = require( "composer" )

-- Calling Widget Library
local widget = require( "widget" )

-- Name the Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

local bkg

-- Creating Transition Function to Instructions Page
local function InstructionsTransition( )       
    composer.gotoScene( "Instructions_screen", {effect = "fromLeft", time = 500})
end 



 



-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

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

    elseif ( phase == "did" ) then

        -- Creating From Left Transition button
        local fromLeftButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 8 ) * 7,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.6, 0.6, 0.6 }, over = { 0.3, 0.3, 0.3 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Instructions", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = InstructionsTransition -- This function is executed when the touch of the button is Released
            } )
      

    -- Creating From Left Transition button
        local fromLeftButton2 = widget.newButton( 
            {
                -- Setting Position
                x = display.contentWidth/6,
                y = ( display.contentHeight / 8 ) * 7,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 4,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.6, 0.6, 0.6 }, over = { 0.3, 0.3, 0.3 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Credits", -- The text labeled on the button
                labelColor = { default = { 1, 1, 1 }, over = { 1, 1, 1 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = InstructionsTransition -- This function is executed when the touch of the button is Released
            } )
      
    
    end
                  
end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
           end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


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

-----------------------------------------------------------------------------------------

return scene


