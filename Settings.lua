-----------------------------------------------------------------------------------------
--
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require("physics")



-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local muteButton
local unmuteButton


-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
----------------------------------------------------------------------------------------- 


-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Creating play button
         muteButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 8 ) * 2,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 3,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.2, 1, 1 }, over = { 0.1, 0.5, 0.5 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "Mute", -- The text labeled on the button
                labelColor = { default = { 0, 0, 0 }, over = { 0, 0, 0 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = MuteSound -- This function is executed when the touch of the button is Released
            } )

         -- Creating play button
         unmuteButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 8 ) * 2,

                -- Creating button shape
                shape = "roundedRect",
                width = display.contentWidth / 3,
                height = 50,
                cornerRadius = 25,
                strokeWidth = 10,

                -- Changing button colors (Default = not clicked, over = clicked)
                fillColor = { default = { 0.2, 1, 1 }, over = { 0.1, 0.5, 0.5 } },
                strokeColor = { default = { 0.75, 0, 0 }, over = { 0.5, 0, 0 } },
                
                -- Creating text on button
                label = "UnMute", -- The text labeled on the button
                labelColor = { default = { 0, 0, 0 }, over = { 0, 0, 0 } },
                font = Arial,
                fontSize = 42,

                -- Button Functions
                onRelease = UnmuteSound -- This function is executed when the touch of the button is Released
            } )

  



end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------
      
    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.


    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        physics.start()
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

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