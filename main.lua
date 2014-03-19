 display.setStatusBar( display.HiddenStatusBar )
local _w = display.actualContentWidth
local _h = display.actualContentHeight
_wT = display.actualContentWidth * 0.5
_hT = display.actualContentHeight * 0.5
local physics  = require ("physics")
local base = display.newGroup()
-- local z1

physics.start( )
physics.setGravity(0,2)

   local backing = display.newImageRect( "background.png", _w, _h )
    backing.x = _wT
    backing.y = _hT
     base:insert( backing )
function screenPrep()
   
 
    physics.start()
    z1 = display.newRect(_w/2,_h,_w,2) -- floor
    z1:setFillColor( 0,0,0 )
    z2 = display.newRect(0,_h/2,-2,_h) -- left
    z2:setFillColor( 0,0,0 )
    z3 = display.newRect(_w,_h/2,2,_h) -- right
    z3:setFillColor( 0,0,0 )
    physics.addBody(z1, "static")
    physics.addBody(z2, "static")
    physics.addBody(z3, "static")
end

 function Draw(x,y,width,height,text,color)
local rectX=x
local rectY=y
local rectLayers= display.newGroup( )  ---important
local rectWidth=width
local rectHeight=height 
local t=text
local c=color
local rectAdjustX = rectX + ( rectWidth * 0.5 )  
  local rectAdjustY = rectY - ( rectHeight * 0.5 )
  local myRect = display.newRect( rectAdjustX, rectAdjustY, rectWidth, rectHeight )
  myRect.fill= c
  -- myRect.stroke={0,0,0} 
 Mytext=display.newText(t,rectAdjustX, rectAdjustY)
 Mytext:setFillColor( 1,1,1 )

rectLayers:insert(myRect) 
return rectLayers:insert(myRect) 
end



local function fallEbook()
      eBook=display.newImage("ebook.png")
      eBook.x=80;eBook.y=0; eBook.rotation=15
      physics.addBody( eBook,"dynamic", {density=0.1, friction=1, bounce=0.2, shape=6} )
    end

function fallBook()
	book=display.newImage("book.png")
	book.x=250; book.y=0; book.rotation=15
     physics.addBody( book,"dynamic", {density=0.1, friction=1, bounce=0.2, shape=6} )
    end    


   ---set button
   widget = require( "widget" )
local function handleButtonEvent( event )

 if ( "ended" == event.phase ) then
  screenPrep() 
      	fallEbook()
      	fallBook()
--8/20 is the ratio of ebook over book in 2014
timer.performWithDelay( 300, fallEbook, 8)
timer.performWithDelay( 300, fallBook, 20)
end
      end
local function handleButtonEvent2( event )
	 if ( "ended" == event.phase ) then
screenPrep()
     
fallEbook()
fallBook()
--8/20 is the ratio of ebook over book in 2012
timer.performWithDelay( 300, fallEbook, 8)
timer.performWithDelay( 300, fallBook, 23)
end
end

local function handleButtonEvent3( event )
   if ( "ended" == event.phase ) then
screenPrep()    
fallEbook()
fallBook()
--8/20 is the ratio of ebook over book in 2011
timer.performWithDelay( 300, fallEbook, 8)
timer.performWithDelay( 300, fallBook, 37)
end
end

local function handleButtonEvent4( event )
 if ( "ended" == event.phase ) then
     rect2011book= Draw (10,_h,30,32,"71%",{1, 111/255, 105/255})
     rect2011ebook=Draw (50,_h,30,148,"17%",{1, 111/255, 105/255})
    rect2012book= Draw (100,_h,30,32,"65%",{ 0, 176/255, 59/255})
     rect2012ebook=Draw (140,_h,30,92,"23%",{ 0, 176/255, 59/255})
      rect2014book= Draw (200,_h,30,32,"69%",{ 257/255, 204/255, 92/255})
     rect2014ebook=Draw (240,_h,30,80,"28%",{ 257/255, 204/255, 92/255})
     
        
print( "a" )

end
end     


local function handleButtonEvent5( event )
 if ( "ended" == event.phase ) then
     physics.removeBody(z1)
    z1 = nil
      	-- rectLayers.remove()
print( "a" )

end
      end          
-- -- Create the widget
local button1 = widget.newButton
{
      left = 120,
      top = 0,
      id = "button1",
      label = "2014 Reading VS E-reading",
      fontSize=15,
      font="Avenir Black",
      labelColor = { default={ 257/255, 204/255, 92/255 }, over={ 1, 1, 1, 0.5 } },
      onEvent = handleButtonEvent
 }

local button2 = widget.newButton
{
      left = 120,
      top = 30,
      id = "button2",
      label = "2012 Reading VS E-reading",
      fontSize=15,
      font="Avenir Black",
      labelColor = { default={ 0, 176/255, 59/255 }, over={ 1, 1, 1, 0.5 } },
      onEvent = handleButtonEvent2
 }

local button3 = widget.newButton
{
      left = 120,
      top = 60,
      id = "button3",
      label = "2011 Reading VS E-reading",
      fontSize=15,
      font="Avenir Black",
      labelColor = { default={ 1, 111/255, 105/255 }, over={ 1, 1, 1, 0.5 } },
      onEvent = handleButtonEvent3
 }

 local button4 = widget.newButton
{
      left = 130,
      top = 90,
      id = "button4",
      label = "Chart",
      fontSize=15,
      font="Avenir Black",
      labelColor = { default={ 0, 34/255, 134/255 }, over={ 1, 1, 1, 0.5 } },
      onEvent = handleButtonEvent4
 }

local button5 = widget.newButton
{
      left = 130,
      top = 120,
      id = "button4",
      label = "Refresh",
      fontSize=15,
      font="Avenir Black",
      labelColor = { default={ 0, 34/255, 134/255 }, over={ 1, 1, 1, 0.5 } },
      onEvent = handleButtonEvent5
 }
