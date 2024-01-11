window = Window{title="Input Dialogs - Limekit", icon = images('app.png'), size={350, 170}}

mainLay = HLayout()

input = Button('Text')
input:setMatProperty('danger')
input:setOnClick(function()
    text = app.textInputDialog(window, 'Text Input', 'Provide name: ')
    print(text)
end)

double = Button('Double')
double:setOnClick(function()
    value = app.doubleInputDialog(window, 'Double Input', 'Enter Amount: ', 0.0, 0.0, 100.0)
    print('Value: ',value)
end)

items = Button('Items')
items:setOnClick(function()
    text = app.comboBoxInputDialog(window, 'ComboBox Input', 'Select Gender: ', {'Male', 'Female', 'Rather not say'})
    print(text)
end)

integer = Button('Integer')
integer:setOnClick(function()
    value = app.integerInputDialog(window, 'Double Input', 'Enter Amount: ', 1, 1, 100)
    print('Value: ',value)
end)

multiline = Button('Multiline')
multiline:setOnClick(function()
    text = app.multilineInputDialog(window, 'Multiline Input', 'Write something about yourself')
    print(text)
end)

mainLay:addChild(input)
mainLay:addChild(double)
mainLay:addChild(items)
mainLay:addChild(integer)
mainLay:addChild(multiline)

window:setLayout(mainLay)
window:show()