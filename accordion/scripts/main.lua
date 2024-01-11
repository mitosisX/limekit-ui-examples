window = Window{title="Input Dialogs - Limekit", icon = route('app_icon'), size={350, 170}}

mainLay = VLayout()

coll = Accordion()
coll.addChild(Label("Hello"), 'Accordion 1')

lay = VLayout()
lay:addChild(Button('Click me'))
lay:addChild(Slider())
coll.addLayout(lay, 'Accordion 2', images('lua.png'))

mainLay:addChild(coll)
window:setLayout(mainLay)
window:show()