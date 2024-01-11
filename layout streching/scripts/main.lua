window = Window("Layout Stretch - Limekit")
window:setIcon(route('app_icon'))
window:setSize(400, 100)

main_lay = VLayout()

hLayout1 = HLayout()

leftButton = Button("Stretch: 0")
centerButton = Button("Stretch: 1")
rightButton = Button("Stretch: 2")

hLayout1:addChild(leftButton)
hLayout1:addChild(centerButton, 1)
hLayout1:addChild(rightButton, 2)

main_lay:addChild(Label("With stretch"))
main_lay:addLayout(hLayout1)


hLayout2 = HLayout()

leftButton = Button("Left-Most")
centerButton = Button("Center")
rightButton = Button("Right-Most")

hLayout2:addChild(leftButton)
hLayout2:addChild(centerButton)
hLayout2:addChild(rightButton)

main_lay:addChild(Label("\nWithout stretch"))
main_lay:addLayout(hLayout2)

window:setLayout(main_lay)
window:show()