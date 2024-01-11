window = Window{title="Input Dialogs - Limekit", icon = route('app_icon'), size={350, 170}}

mainLay = VLayout()

hLay = HLayout()
stack = SlidingStackedWidget()
stack.autoStart()

input = Button('Text')
input:setMatProperty('danger')
input:setOnClick(function()
    text = app.textInput(window, 'Text Input', 'Provide name: ')
    print(text)
end)

double = Button('Double')
double:setOnClick(function()
    value = app.doubleInput(window, 'Double Input', 'Enter Amount: ', 0.0, 0.0, 100.0)
    print('Value: ',value)
end)

stack:addChild(input)
stack:addChild(double)

hLay:addChild(stack)

combo1 = ComboBox({'horizontal','vertical',})
combo1:setOnItemSelected(function(obj, ori)
    stack:setOrientation(ori)
end)

combo2 = ComboBox(stack:getAnimations())
combo2:setOnItemSelected(function(obj, anim)
    stack:setAnimation(anim)
end)

prev = Button('pred')
ne = Button('next')


mainLay:addLayout(hLay)

mainLay:addChild(combo1)
mainLay:addChild(combo2)
mainLay:addChild(prev)
mainLay:addChild(ne)

window:setLayout(mainLay)
window:show()