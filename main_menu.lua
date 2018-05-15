

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

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local creditsButton
local instructionsButton
local playButton
local backgroundMusic = audio.loadSound("Sounds/bensound-acousticbreeze.mp3")
local backgroundMusicChannel
local muteButton
local unMuteButton

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- Creating Transition Function to Instructions Page
local function InstructionsTransition( )       
    composer.gotoScene( "Instructions_screen", {effect = "fromLeft", time = 500})
end 

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "fromLeft", time = 500})
end 

-- Createing Transition Function to level 1 screen
local function level1ScreenTransition( )
    composer.gotoScene("level1_screen", {effect = "fromLeft", time = 500})
end

local function SettingsTransition( )
    composer.gotoScene("Settings", {effect = "fromLeft", time = 500})
 end

-- Mutes sound and makes the unmute button visible 
 local function MuteSound()
    audio.stop(backgroundMusicChannel)
    muteButton.alpha = 0
    if (muteButton.alpha == 0 ) then
    unMuteButton.alpha = 1
end
end

-- Unmutes sound and makes the mute button visible
 local function UnMuteSound()
    backgroundMusicChannel = audio.play(backgroundMusic)
    unMuteButton.alpha = 0
    if (unMuteButton.alpha == 0 ) then
    muteButton.alpha = 1
end
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

       -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------


    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenuDesmyMJ.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -- Creating From Left Transition button
         instructionsButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 8 ) * 7,

             width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressed.png",
            overFile = "Images/InstructionsButtonPressed.png",

                -- Button Functions
                onRelease = InstructionsTransition -- This function is executed when the touch of the button is Released
            } )
      
        -- Creating Credits Button
        creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight*7/8,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressed.png",
            overFile = "Images/CreditsButtonPressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } )

         -- Creating play button
         playButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 13 ) * 2,

                
             width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressedDesmyMj.png",
            overFile = "Images/PlayButtonPressedDesmyMj.png",


                -- Button Functions
                onRelease = level1ScreenTransition -- This function is executed when the touch of the button is Released
            } )

         -- Creating unmute button
         unMuteButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 7 ) * 2,

             width = 200,
             height = 100,

            -- Insert the images here
            defaultFile = "Images/UnmuteButtonUnpressedDesmyMj.png",
            overFile = "Images/UnmuteButtonPressedDesmyMj.png",


                -- Button Functions
                onRelease = UnMuteSound -- This function is executed when the touch of the button is Released
            } )

          -- Creating mute button
         muteButton = widget.newButton( 
            {
                -- Setting Position
                x = display.contentCenterX,
                y = ( display.contentHeight / 7 ) * 2,

             width = 200,
             height = 100,

            -- Insert the images here
            defaultFile = "Images/MuteButtonUnpressedDesmyMj.png",
            overFile = "Images/MuteButtonPressedDesmyMj.png",


                -- Button Functions
                onRelease = MuteSound -- This function is executed when the touch of the button is Released
            } )



    -- Associating button widgets with this scene
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton ) 
    sceneGroup:insert( playButton )
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unMuteButton )


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


--plays music
        backgroundMusicChannel = audio.play(backgroundMusic)

       -- Makes the mute button visible
          muteButton.alpha = 1

          -- Makes the unmute button invisible
       
          unMuteButton.alpha = 0

        
    
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
        -- stops the music
    audio.stop(backgroundMusicChannel)
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


