window = Window{title="Grid Layout 2 - Limekit", icon=images('app.png')}

mainLayout = VLayout()

gridLayout1 = GridLayout()

gridLayout1:addChild(Button("Button at (0, 0)"), 0, 0)
gridLayout1:addChild(Button("Button at (0, 1)"), 0, 1)
gridLayout1:addChild(Button("Button at (0, 2)"), 0, 2)
gridLayout1:addChild(Button("Button at (1, 0)"), 1, 0)
gridLayout1:addChild(Button("Button at (1, 1)"), 1, 1)
gridLayout1:addChild(Button("Button at (1, 2)"), 1, 2)
gridLayout1:addChild(Button("Button at (2, 0)"), 2, 0)
gridLayout1:addChild(Button("Button at (2, 1)"), 2, 1)
gridLayout1:addChild(Button("Button at (2, 2)"), 2, 2)

gridLayout2 = GridLayout()

gridLayout2:addChild(Button("Button at (0, 0)"), 0, 0)
gridLayout2:addChild(Button("Button at (0, 1)"), 0, 1)
gridLayout2:addChild(Button("Button Spans two Columns"), 1, 0, 1, 2)

gridLayout3 = GridLayout()
gridLayout3:addChild(Button("Button at (0, 0)"), 0, 0)
gridLayout3:addChild(Button("Button at (1, 1)"), 1, 1)

mainLayout:addLayout(gridLayout1)

-- demarcation line
mainLayout:addChild(HLine())

mainLayout:addLayout(gridLayout2)
mainLayout:addLayout(gridLayout3)

window:setLayout(mainLayout)
window:show()