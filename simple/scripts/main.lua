window = Window{title="Simple App - Limekit", icon=images('app.png'), size={280, 170}}
window:setOnClose(function(obj, event)
    event.ignore() -- this ignores all close request

    res = app.questionAlertDialog(window,'Quit?','Are you sure you want to quit?')
    print(res)
    if res then
        event.accept() -- accepts close
    end
end)

shortcut = KeyboardShortcut(window, 'Ctrl+Q')
shortcut:setOnKeyPress(function()
    print('Ctrl+Q')
end)

mainLay = VLayout()

button = Button('ignore me')
button:setOnClick(function()
    
end)

openButton = Button('Open')
openButton:setOnClick(function(obj)
    app.openFileDialog(window, 'Open File', '', {["Whatever"] = {'.a', '.b', '.c'}})
end)

mainLay:addChild(button)
mainLay:addChild(openButton)

window:setLayout(mainLay)
window:show()