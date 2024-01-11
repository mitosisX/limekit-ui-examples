theme = app.Theme("darklight")
theme.setTheme("light")

window = Window{title="Widgets - Limekit", icon=images('app.png')}

window:setOnShown(function()
  window:center()
  noti = SysNotification(images('app.png'))
  noti:setMessage{message='Try resizing the window', icon='warning', duration=1000}
  
  noti:setOnClick(function()
    app.alert(window, "Limekit", 'You clicked the notification')
  end)
end)

window:setOnResize(function()
  width, height = window:getSize()
  window:setTitle('Width: '.. width .. ' Height: ' .. height)
end)
window:setOnClose(function(sender, event)
  -- event.ignore()
  event.accept()
end)
window:setSize(400, 100)

toolbar = Toolbar()

tray = SysTray(images("heart.png"))
tray:setVisibility(true)

menu = Menu()
compose = MenuItem("Compose")
compose:setIcon(images("add.png"))

open = MenuItem("Open")
open:setIcon(images("open.png"))

exit = MenuItem("Exit")
exit:setIcon(images("exit.png"))
menu:addMenuItems(compose, open, exit)
tray:setMenu(menu)

malawi = ToolbarButton()
malawi:setToolTip("Developed from Malawi")
malawi:setIcon(images("app.png"))
toolbar:addButton(malawi)

toolbar:addButton(ToolbarButton('-'))

b = ToolbarButton()
b:setToolTip("hey")
b:setIcon(images("icons8_send_50px.png"))
b:setOnClick(function (self)
  self:setIcon(images("icons8_curriculum_50px.png"))
end)
b.setCheckable(true)
toolbar:addButton(b)

window.addToolbar(toolbar)

mainLayout = HLayout()

mainLay1 = VLayout()

button = Button()
button:setText("Click me")
button:setFlat(true)
button:setCheckable(true)
button.setToolTip("I am a tooltip")
button:setOnClick(function (x) 
   app.alert(window, "Limekit", 'See how easy it is?')
end)

mainLay1:addChild(button)

themes = ComboBox(theme.getThemes())
themes:setOnItemSelected(function (sender, data) 
  theme:setTheme(data)
end)

progress = ProgressBar()
progress:setValue(20)

spin = Spinner()
spin:setPrefix("$")
spin:setOnValueChange(function (sender, value) 
  progress:setValue(value)
end)
spin:setRange(10, 50)

slider = Slider()
slider:setRange(0, 100)
slider:setOnValueChange(function (sender, value) 
  progress.setValue(value)
end)

cou = 40
timer = Timer(2000, function (self) 
  progress:setValue(cou)
  cou = cou + 10
  -- self.stop()
end)


edit = LineEdit()
edit:setCursor('splitvd')
-- edit:setCursorMoveStyle(2)
-- edit.setInputMask('000.000.000.000_')
edit:setHint("Hello")
edit:setOnTextChange(function (sender, text) 
  print(text)
end)

-- edit:setOnSelection(function(sender, text)
--   print(text)
-- end)

lunch_list = {"egg", "turkey sandwich", "ham sandwich", "cheese", "hummus"}

totalLabel = Label("Total: $0")
-- totalLabel:setImage(images("icons8_plus_1_year_50px.png"))
-- totalLabel.setTextAlign("right")

lay1 = HLayout()
combo1 = ComboBox(lunch_list)
spin1 = Spinner()
spin1:setPrefix("$")
spin1:setRange(1, 100)
-- combo1.addItems(lunch_list)

lay1:addChild(combo1)
lay1:addChild(spin1)

lay2 = HLayout()

combo2 = ComboBox()
combo2:addImageItems({{'heart', images('heart.png') }, {'malawi', images('malawi.png')}})

spin2 = Spinner()
spin2:setPrefix("$")
spin2:setRange(1, 100)
lay2:addChild(combo2)
lay2:addChild(spin2)

spin1:setOnValueChange(calculateTotal)
spin2:setOnValueChange(calculateTotal)

styles = ComboBox()
styles:addItems(app.getStyles())
styles:setOnItemSelected(function (sender, style)
  app.setStyle(style)
end)

mainLay1:addChild(themes)
mainLay1:addChild(spin)
mainLay1:addChild(progress)
mainLay1:addChild(slider)
mainLay1:addChild(edit)
mainLay1:addChild(styles)

mainLay1:addLayout(lay1)
mainLay1:addLayout(lay2)
mainLay1:addChild(totalLabel)

mainLay2 = VLayout()

tab = Tab()
tab:setTabsCloseable(true)
tab:setOnTabClose(function(obj, index)
  tab:setVisibility(index, false)
end)
tabitem1 = TabItem()

tab:addTab(tabitem1, "Cas&h")

tabitem2 = TabItem()

grid1 = GridLayout()
label1 = Label("Ch&eck No.:")
tedit1 = LineEdit()
grid1:addChild(label1, 0, 0)
grid1:addChild(tedit1, 0, 1)

label2 = Label("Bank:")
tedit2 = LineEdit()
grid1:addChild(label2, 0, 2)
grid1:addChild(tedit2, 0, 3)

label3 = Label("Account No.:")
tedit3 = LineEdit()
grid1:addChild(label3, 1, 0)
grid1:addChild(tedit3, 1, 1)

label4 = Label("Sort Code:")
tedit4 = LineEdit()
grid1:addChild(label4, 1, 2)
grid1:addChild(tedit4, 1, 3)

tabitem2:setLayout(grid1)

tab.addTab(tabitem2, "Chec&k")

tabitem3 = TabItem()
tab.addTab(tabitem3, "Credit &Card")

mainLay1:addChild(tab)

mainLayout:addLayout(mainLay1)
mainLayout:addLayout(mainLay2)

window.setLayout(mainLayout)
window.show()