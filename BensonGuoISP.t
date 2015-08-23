%Benson Guo
%Mr.Petres
%May 27th, 2012
%This program will allow the user to make their own songs

import GUI
forward procedure mainMenu
forward procedure introduction
forward procedure userInput
forward procedure display

%Declaration Section
var musicNotes : string
var key : string (1)
%music
var finished2 : boolean := false
%picture
var pictureID : int := Pic.FileNew ("musicpic.jpg")
var picHeight, picWidth : int
%windows
var menuScreen : int := Window.Open ("position:top;center,graphics:640;420")
var creditWindow : int := Window.Open ("position:top;center,graphics:640;250")
%buttons/boxes
var rangeX, rangeY, button1 : int
var InstructionsButton, CreateMusicButton, ExitButton, mainMenuButton, creditbutton, introductionbutton, newsong, playsong, backButton2, playagainbutton, mainmenubutton2 : int := 0
%this is the music that will play throughout the program
process doMusic
    loop
	Music.PlayFile ("ragtimedance.mp3")
	exit when finished2 = true
    end loop
end doMusic
%Title
procedure title
    var font1 : int := 0
    cls
    %background
    drawfillbox (0, 0, 640, 440, yellow)
    %title
    font1 := Font.New ("Arial:15:bold")
    Font.Draw ("Music Maker", 260, 400, font1, blue)
end title
%this will load and resize the picture for animation
procedure picture
    %sets up picture resized to 100 by 100 pixels
    picHeight := Pic.Height (pictureID)
    picWidth := Pic.Width (pictureID)
    pictureID := Pic.Scale (pictureID, 100, 100)
end picture
%Gives introduction to the user
body procedure introduction
    var pictureID : int := Pic.FileNew ("grandpiano.jpg")
    var picHeight3, picWidth3 : int
    title
    locate (4, 1)
    colourback (yellow)
    put "Welcome to Music Maker, a program that allows you to make your own song with the click of a few buttons!"
    %hides mainMenubuttons
    GUI.Hide (creditbutton)
    GUI.Hide (ExitButton)
    GUI.Hide (CreateMusicButton)
    GUI.Hide (InstructionsButton)
    GUI.Hide (introductionbutton)
    GUI.Show (mainMenuButton)
    drawfillbox (0, 120, 640, 330, yellow)
    %picture
    picHeight3 := Pic.Height (pictureID)
    picWidth3 := Pic.Width (pictureID)
    pictureID := Pic.Scale (pictureID, 260, 210)
    Pic.Draw (pictureID, 190, 80, picMerge)
end introduction
%mainmenu that will be used for the user returning from userInput with hidden buttons
procedure mainmenu2
    %plays music while the program runs
    fork doMusic
    GUI.Hide (mainMenuButton)
    GUI.Hide (mainmenubutton2)
    %userinput buttons hidden
    GUI.Hide (playsong)
    GUI.Hide (newsong)
    %display buttons hidden
    GUI.Hide (backButton2)
    GUI.Hide (playagainbutton)
    %background colour
    drawfillbox (0, 0, 640, 440, yellow)
    title
    %shows main menu buttons
    GUI.Show (creditbutton)
    GUI.Show (ExitButton)
    GUI.Show (CreateMusicButton)
    GUI.Show (InstructionsButton)
    GUI.Show (introductionbutton)
    %animation
    for x : 0 .. 640
	Pic.Draw (pictureID, x + 1, 0, picMerge)
	delay (8)
	%erases picture
	drawfillbox (x, 0, x + 100, 100, yellow)
    end for
end mainmenu2
%User Input
body procedure userInput
    var font1, buttons1 : int := 0
    var len1 := 1
    var finished : boolean := false
    %stops the music
    finished2 := true
    Music.PlayFileStop
    %hiding mainmenu buttons
    GUI.Hide (creditbutton)
    GUI.Hide (ExitButton)
    GUI.Hide (CreateMusicButton)
    GUI.Hide (InstructionsButton)
    GUI.Hide (introductionbutton)
    %hiding display buttons
    GUI.Hide (playagainbutton)
    GUI.Hide (backButton2)
    %resets music notes each time userInput is run
    musicNotes := ""
    title
    %background
    drawfillbox (0, 0, 640, 420, yellow)
    %keyboard
    drawfillbox (5, 250, 635, 350, white)
    %piano notes
    locate (10, 1)
    colourback (white)
    put "" : 3, "c" : 6, "d" : 5, "e" : 6, "f" : 6, "g" : 5, "a" : 6, "b" : 5, "C" : 5, "D" : 6, "E" : 6, "F" : 6, "G" : 5, "A" : 6, "B"
    %fill in white spaces
    drawfillbox (0, 50, 5, 400, yellow)
    drawfillbox (635, 50, 640, 400, yellow)
    %blackeys
    for x : 35 .. 585 by 45
	drawfillbox (x, 285, x + 30, 350, black)
    end for
    drawfillbox (125, 250, 155, 350, white)
    drawfillbox (305, 250, 335, 350, white)
    drawfillbox (440, 250, 470, 350, white)
    %white keys
    for x : 5 .. 635 by 45
	drawline (x, 250, x, 350, black)
    end for
    drawline (5, 250, 635, 250, black)
    drawline (5, 350, 635, 350, black)
    %note length boxes
    for x : 0 .. 230 by 115
	drawline (x, 190, x, 220, black)
    end for
    drawline (360, 190, 360, 220, black)
    drawline (490, 190, 490, 220, black)
    drawline (639, 190, 639, 220, black)
    drawline (1, 220, 640, 220, black)
    drawline (1, 190, 640, 190, black)
    %note length text
    font1 := Font.New ("Arial:15:bold")
    Font.Draw ("Whole Note", 5, 200, font1, red)
    font1 := Font.New ("Arial:15:bold")
    Font.Draw ("Half Note", 125, 200, font1, red)
    font1 := Font.New ("Arial:15:bold")
    Font.Draw ("Quarter Note", 235, 200, font1, red)
    font1 := Font.New ("Arial:15:bold")
    Font.Draw ("Eigth Note", 375, 200, font1, red)
    font1 := Font.New ("Arial:15:bold")
    Font.Draw ("Sixteenth Note", 500, 200, font1, red)
    font1 := Font.New ("Arial:15:bold")
    Font.Draw ("Notes", 0, 400, font1, blue)
    %done box
    font1 := Font.New ("Arial:15:bold")
    Font.Draw ("Done!", 290, 150, font1, green)
    drawbox (285, 145, 350, 168, black)
    %userinput show song buttons
    GUI.Show (newsong)
    GUI.Show (playsong)
    %mainmenu2 button
    mainmenubutton2 := GUI.CreateButton (265, 40, 10, "Main Menu", mainmenu2)
    loop
	%this will play the note and add the notes to the song as the user clicks on the areas
	mousewhere (rangeX, rangeY, button1)
	if button1 = 1 then
	    locate (10, 1)
	    %mouse commands for black keys
	    if (rangeX >= 35 and rangeX <= 65) and (rangeY >= 285 and rangeY <= 350) then
		musicNotes := musicNotes + "c+"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("c+")
	    elsif (rangeX > 80 and rangeX < 110) and (rangeY > 285 and rangeY < 350) then
		musicNotes := musicNotes + "d+"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("d+")
	    elsif (rangeX > 170 and rangeX < 200) and (rangeY > 285 and rangeY < 350) then
		musicNotes := musicNotes + "f+"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("f+")
	    elsif (rangeX > 215 and rangeX < 245) and (rangeY > 285 and rangeY < 350) then
		musicNotes := musicNotes + "g+"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("g+")
	    elsif (rangeX > 260 and rangeX < 290) and (rangeY > 285 and rangeY < 350) then
		musicNotes := musicNotes + "a+"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("a+")
	    elsif (rangeX > 350 and rangeX < 380) and (rangeY > 285 and rangeY < 350) then
		musicNotes := musicNotes + ">c+<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">c+<")
	    elsif (rangeX > 395 and rangeX < 425) and (rangeY > 285 and rangeY < 350) then
		musicNotes := musicNotes + ">d+<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">d+<")
	    elsif (rangeX > 485 and rangeX < 515) and (rangeY > 285 and rangeY < 350) then
		musicNotes := musicNotes + ">f+<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">f+<")
	    elsif (rangeX > 530 and rangeX < 560) and (rangeY > 285 and rangeY < 350) then
		musicNotes := musicNotes + ">g+<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">g+<")
	    elsif (rangeX > 575 and rangeX < 605) and (rangeY > 285 and rangeY < 350) then
		musicNotes := musicNotes + ">a+<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">a+<")
		%mouse commands for white keys
	    elsif (rangeX > 5 and rangeX < 50) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + "c"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("c")
	    elsif (rangeX > 50 and rangeX < 95) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + "d"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("d")
	    elsif (rangeX > 95 and rangeX < 140) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + "e"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("e")
	    elsif (rangeX > 140 and rangeX < 185) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + "f"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("f")
	    elsif (rangeX > 185 and rangeX < 230) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + "g"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("g")
	    elsif (rangeX > 230 and rangeX < 275) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + "a"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("a")
	    elsif (rangeX > 275 and rangeX < 320) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + "b"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("b")
	    elsif (rangeX > 320 and rangeX < 365) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + ">c<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">c<")
	    elsif (rangeX > 365 and rangeX < 410) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + ">d<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">d<")
	    elsif (rangeX > 410 and rangeX < 455) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + ">e<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">e<")
	    elsif (rangeX > 455 and rangeX < 500) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + ">f<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">f<")
	    elsif (rangeX > 500 and rangeX < 545) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + ">g<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">g<")
	    elsif (rangeX > 545 and rangeX < 590) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + ">a<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">a<")
	    elsif (rangeX > 590 and rangeX < 635) and (rangeY > 250 and rangeY < 350) then
		musicNotes := musicNotes + ">b<"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play (">b<")
	    elsif (rangeX > 1 and rangeX < 115) and (rangeY > 190 and rangeY < 220) then
		musicNotes := musicNotes + "1"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("p")
	    elsif (rangeX > 115 and rangeX < 230) and (rangeY > 190 and rangeY < 220) then
		musicNotes := musicNotes + "2"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("p")
	    elsif (rangeX > 230 and rangeX < 360) and (rangeY > 190 and rangeY < 220) then
		musicNotes := musicNotes + "4"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("p")
	    elsif (rangeX > 360 and rangeX < 490) and (rangeY > 190 and rangeY < 220) then
		musicNotes := musicNotes + "8"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("p")
	    elsif (rangeX > 490 and rangeX < 639) and (rangeY > 190 and rangeY < 220) then
		musicNotes := musicNotes + "16"
		colourback (yellow)
		locate (3, 1)
		put musicNotes
		Music.Play ("p")
	    elsif (rangeX > 285 and rangeX < 350) and (rangeY > 145 and rangeY < 168) then
		finished := true
	    end if
	end if
	exit when finished = true
    end loop
end userInput
%This will play the song again for the user
procedure playagain
    Music.Play (musicNotes)
end playagain
%Display
body procedure display
    var pictureID : int := Pic.FileNew ("musicwriting.jpg")
    var picHeight4, picWidth4 : int
    title
    %displays hidden buttons
    GUI.Show (backButton2)
    GUI.Show (playagainbutton)
    %hides userinput buttons
    GUI.Hide (mainmenubutton2)
    GUI.Hide (playsong)
    GUI.Hide (newsong)
    %covers white space from hidden buttons
    drawfillbox (0, 0, 640, 70, yellow)
    %picture
    picHeight4 := Pic.Height (pictureID)
    picWidth4 := Pic.Width (pictureID)
    pictureID := Pic.Scale (pictureID, 200, 200)
    Pic.Draw (pictureID, 10, 80, picMerge)
    locate (3, 1)
    colourback (yellow)
    put musicNotes
    Music.Play (musicNotes)
end display
%credits to the program
procedure credits
    var font1 : int := 0
    var pictureID : int := Pic.FileNew ("guitar.jpg")
    var picHeight2, picWidth2 : int
    %closes main screen, opens credit window
    Window.Show (creditWindow)
    Window.SetActive (creditWindow)
    Window.Hide (menuScreen)
    drawfillbox (0, 0, 640, 440, yellow)
    %title
    font1 := Font.New ("Arial:15:bold")
    Font.Draw ("Music Maker", 260, 210, font1, blue)
    %credit text
    locate (5, 1)
    colourback (yellow)
    put "Credits"
    put ""
    put "Programmer:Benson Guo"
    put "Music:Fur Elise-Beethoven"
    put "www.worldticketservice.com-photo"
    put "www.featurepics.com-photo"
    put "www.fashionc-clothing.com-photo"
    put "www.freakingnews.com-photo"
    put "Ragtime Dance-Scott Joplin-Song"
    put ""
    put "Press any key to exit." ..
    %picture
    picHeight2 := Pic.Height (pictureID)
    picWidth2 := Pic.Width (pictureID)
    pictureID := Pic.Scale (pictureID, 250, 165)
    Pic.Draw (pictureID, 300, 25, picMerge)
    getch (key)
    %closes credit screen and opens main screen after the user presses a key
    Window.Hide (creditWindow)
    Window.Show (menuScreen)
    Window.SetActive (menuScreen)
end credits
%End Screen
procedure goodBye
    title
    colourback (yellow)
    put "Thank you for using Music Maker!"
    put "Programmed By: Benson Guo"
    put ""
    put "This program will close in 5 seconds."
    %closes program on 5 second timer
    delay (5000)
    Window.Close (menuScreen)
    GUI.Quit
end goodBye
%Instructions for the user
procedure instructions
    var backButton : int := 0
    var choice : int
    %hides mainmenu buttons
    GUI.Hide (creditbutton)
    GUI.Hide (ExitButton)
    GUI.Hide (CreateMusicButton)
    GUI.Hide (InstructionsButton)
    GUI.Hide (introductionbutton)
    %background colour
    drawfillbox (0, 0, 640, 440, yellow)
    %back button
    backButton := GUI.CreateButton (125, 10, 10, "Back", instructions)
    title
    colourback (yellow)
    put "1.How does the program work?"
    put "2.How do I choose music notes?"
    put "3.How do I choose note length"
    put "4.MainMenu"
    put ""
    put "Please enter the number of the section you would like to view:" ..
    get choice
    %Allows the user to enter a choice to view one of the three sections of the instructions manual or go back to the main menu
    if choice = 1 then
	put ""
	put "You can use this program to make your own song. You are able to choose any note by clicking the piano key from the 2 octaves and set up note length with the displayed keyboard."
	put
	    "The notes and time values you select will be shown as you are selecting the buttons as well as the note being played and when you are done, click on the Done box and simply press the Play Music button to play your song"
	put "Note:You will not be able to play, create a new song, or return to the menu without clicking the Done Box."
	GUI.Show (backButton)
    elsif choice = 2 then
	put ""
	put
	    "There are 2 octaves of music notes. This first octave is the standard octave. The second octave is one octave higher. The first octave will be labeled in lower case while the second will be labeled in capitals."
	GUI.Show (backButton)
    elsif choice = 3 then
	put ""
	put "You can choose either whole, half, quarter,eigth, or sixteenth for note length before you select the note. The default notes will be automatically played for a whole note length."
	GUI.Show (backButton)
    elsif choice = 4 then
	introduction
	GUI.Hide (mainMenuButton)
	mainMenu
    else
	%displays error message and re-directs user back to instruction screen
	put ""
	put "Error! Please enter either 1,2,3 or 4!"
	GUI.Show (backButton)
    end if
end instructions
%Mainmenu for the user
body procedure mainMenu
    Window.Show (menuScreen)
    Window.SetActive (menuScreen)
    Window.Hide (creditWindow)
    %plays music while the program runs
    fork doMusic
    finished2 := false
    mainMenuButton := GUI.CreateButton (265, 40, 10, "Main Menu", mainMenu)
    GUI.Hide (mainMenuButton)
    %userinput buttons hidden
    newsong := GUI.CreateButton (30, 40, 10, "New Song", userInput)
    playsong := GUI.CreateButton (530, 40, 10, "Play Song", display)
    GUI.Hide (playsong)
    GUI.Hide (newsong)
    %display buttons hidden
    backButton2 := GUI.CreateButton (265, 70, 10, "Back", userInput)
    playagainbutton := GUI.CreateButton (265, 150, 10, "Play Again", playagain)
    GUI.Hide (backButton2)
    GUI.Hide (playagainbutton)
    %background colour
    drawfillbox (0, 0, 640, 440, yellow)
    title
    %mainMenu buttons
    InstructionsButton := GUI.CreateButton (265, 280, 10, "Instructions", instructions)
    CreateMusicButton := GUI.CreateButton (265, 200, 10, "Create Music", userInput)
    introductionbutton := GUI.CreateButton (100, 280, 10, "Introduction", introduction)
    creditbutton := GUI.CreateButton (100, 200, 10, "Credits", credits)
    ExitButton := GUI.CreateButton (265, 120, 10, "Exit", goodBye)
    locate (20, 1)
    picture
    %animation
    for x : 0 .. 640
	Pic.Draw (pictureID, x + 1, 0, picMerge)
	delay (8)
	%erases picture
	drawfillbox (x, 0, x + 100, 100, yellow)
    end for
end mainMenu
%Main Program
mainMenu
loop
    exit when GUI.ProcessEvent
end loop
finished2 := true
Music.PlayFileStop
