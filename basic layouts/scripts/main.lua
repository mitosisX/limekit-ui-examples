numButtons = 4
numGridRows = 3

-- Theme('material'):setTheme('dark_blue')

window = Window{title="Basic Layouts - Limekit", icon=route('app_icon')}

mainLayout = VLayout()

-- ########################
-- Horizontal Layout
horizontalGroupBox = GroupBox("Horizontal layout")
horiLayout = HLayout()

for i = 0, numButtons do
    button = Button("Button "..i + 1)
    horiLayout:addChild(button)
end

horizontalGroupBox:setLayout(horiLayout)
mainLayout:addChild(horizontalGroupBox)
-- ########################


-- ########################
-- Grid Layout
gridGroupBox = GroupBox()
gridLayout = GridLayout()

for i = 0, numGridRows do
	label = Label("Line "..i + 1)
    lineEdit = LineEdit()
    gridLayout:addChild(label, i + 1, 0)
    gridLayout:addChild(lineEdit, i + 1, 1)
end

smallEditor = TextField()
smallEditor:setText([[This widget takes up about two thirds 
of the grid layout.]])

gridLayout:addChild(smallEditor, 0, 2, 5, 1)

gridLayout.setColumnStretch(1, 10)
gridLayout.setColumnStretch(2, 20)

gridGroupBox:setLayout(gridLayout)
mainLayout:addChild(gridGroupBox)
-- ########################


-- ########################
-- Form Layout
formGroupBox = GroupBox("Form layout")
layout = FormLayout()

someTextEdit=LineEdit()
someTextEdit:setHint("Hey! Check out this long but awesome hint")

layout:addChild(Label("Line 1:"), someTextEdit)
layout:addChild(Label("Line 2, long text:"), ComboBox())
layout:addChild(Label("Line 3:"), Spinner())
formGroupBox:setLayout(layout)
mainLayout:addChild(formGroupBox)
-- ########################

bigEditor = TextField()
bigEditor.setText([[This widget takes up all the remaining space
in the top-level layout.]])
mainLayout:addChild(bigEditor)

window:setLayout(mainLayout)
window:show()