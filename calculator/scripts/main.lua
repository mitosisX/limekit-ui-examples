-- Creating the window
window = Window{title="Calculator - Limekit", icon=route('app_icon'), size={280, 80}}

-- Setting the theme
theme = app.Theme("darklight")
theme:setTheme("light")

-- Creating the main layout
mainLay = VLayout()
display = TextField()
display.setReadOnly(true)
display.setFixedHeight(35)

mainLay.addChild(display)

grid = GridLayout()
mainLay:addLayout(grid)

buttonMap = {}

-- Defining the keyboard layout
keyBoard = {
  {"7", "8", "9", "/", "C"},
  {"4", "5", "6", "*", "("},
  {"1", "2", "3", "-", ")"},
  {"0", "00", ".", "+", "="}
}

-- Populating the grid with buttons
for row = 1, #keyBoard do
  for col = 1, #keyBoard[row] do
    local key = keyBoard[row][col]

    buttonMap[key] = Button(key)
    grid:addChild(buttonMap[key], row - 1, col - 1)
  end
end

-- Handling button clicks
for keySymbol, button in pairs(buttonMap) do
  if keySymbol ~= "=" and keySymbol ~= "C" then
    button:setOnClick(function(obj)
      local calText = display:getText()
      local newCalText = calText .. obj:getText()
      display.setText(newCalText)
    end)
  end
end

buttonMap["="]:setOnClick(function()
  local expression = eval(display:getText())
  display.setText(tostring(expression))
end)

buttonMap["C"]:setOnClick(function()
  display.setText("")
end)

-- Setting the layout and showing the window
window:setLayout(mainLay)
window:show()
