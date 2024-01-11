window = Window{title="Widgets - Limekit", icon=route('app_icon')}
-- window:setSize(200, 200)

mainLayout = GridLayout()

styles= app.getStyles()
styleComboBox = ComboBox(styles)
styleComboBox.setOnItemSelected(function(obj, style)
	app.setStyle(style)
end)
styleLabel = Label("&Style:")
styleLabel.setBuddy(styleComboBox)

useStylePaletteCheckBox = CheckBox("&Use style's standard palette")
useStylePaletteCheckBox.setChecked(true)

disableWidgetsCheckBox = CheckBox("&Disable widgets")

-- Create Top left groupbox
topLeftGroupBox = GroupBox("Group 1")

radioButton1 = RadioButton("Radio button 1")
radioButton2 = RadioButton("Radio button 2")
radioButton3 = RadioButton("Radio button 3")
radioButton1.setChecked(true)

checkBox = CheckBox("Tri-state check box")
checkBox.setTristate(true)
-- checkBox.setCheckState(Qt.CheckState.PartiallyChecked)

layout = VLayout()
layout:addChild(radioButton1)
layout:addChild(radioButton2)
layout:addChild(radioButton3)
layout:addChild(checkBox)
layout:addExpansion(1)
topLeftGroupBox.setLayout(layout)

-- ######################################

-- Create Top right groupbox
topRightGroupBox = GroupBox("Group 2")

defaultPushButton = Button("Default Push Button")
defaultPushButton.setDefault(true)

togglePushButton = Button("Toggle Push Button")
togglePushButton.setCheckable(true)
togglePushButton.setChecked(true)

flatPushButton = Button("Flat Push Button")
flatPushButton.setFlat(true)

layout = VLayout()
layout:addChild(defaultPushButton)
layout:addChild(togglePushButton)
layout:addChild(flatPushButton)
layout:addExpansion(1)
topRightGroupBox.setLayout(layout)

-- ######################################

bottomLeftTabWidget = Tab()

topLayout = HLayout()
topLayout:addChild(styleLabel)
topLayout:addChild(styleComboBox)
topLayout:addExpansion(1)
topLayout:addChild(useStylePaletteCheckBox)
topLayout:addChild(disableWidgetsCheckBox)

-- create bttom left tab widget

tab1 = TabItem()
tableWidget = Table(10, 10)

tab1hbox = HLayout()
tab1hbox:setMargins(5, 5, 5, 5)
tab1hbox:addChild(tableWidget)
tab1:setLayout(tab1hbox)

tab2 = TabItem()
textEdit = TextField()

textEdit:setText("Twinkle, twinkle, little star,\n" ..
                  "How I wonder what you are.\n" ..
                  "Up above the world so high,\n" ..
                  "Like a diamond in the sky.\n" ..
                  "Twinkle, twinkle, little star,\n" ..
                  "How I wonder what you are!\n")

tab2hbox = HLayout()
tab2hbox:setMargins(5, 5, 5, 5)
tab2hbox:addChild(textEdit)
tab2:setLayout(tab2hbox)

bottomLeftTabWidget:addTab(tab1, "&Table")
bottomLeftTabWidget:addTab(tab2, "Text &Edit")

-- ######################################


-- create Bottom right group box

bottomRightGroupBox = GroupBox("Group 3")
bottomRightGroupBox.setCheckable(true)
bottomRightGroupBox.setChecked(true)

lineEdit = LineEdit('s3cRe7')
lineEdit.setInputMode('password')

spinBox = Spinner()
spinBox:setValue(50)

dateTimeEdit = Calendar()
-- dateTimeEdit.setDateTime(QDateTime.currentDateTime())

dial = Knob()
dial:setValue(30)
dial.setNotchesVisible(true)

layout = GridLayout()
layout:addChild(lineEdit, 0, 0, 1, 2)
layout:addChild(spinBox, 1, 0, 1, 2)
layout:addChild(dateTimeEdit, 2, 0, 1, 2)
layout:addChild(dial, 3, 1, 2, 1)
layout.setRowStretch(5, 1)
bottomRightGroupBox:setLayout(layout)

-- ######################################

-- create Progress Bar
progressBar = ProgressBar()
progressBar:setRange(0, 100)
progressBar:setValue(50)
-- ######################################

mainLayout.addLayout(topLayout, 0, 0, 1, 2)
mainLayout:addChild(topLeftGroupBox, 1, 0)
mainLayout:addChild(topRightGroupBox, 1, 1)
mainLayout:addChild(bottomLeftTabWidget, 2, 0)
mainLayout:addChild(bottomRightGroupBox, 2, 1)
mainLayout:addChild(progressBar, 3, 0, 1, 2)
mainLayout.setRowStretch(1, 1)
mainLayout.setRowStretch(2, 1)
mainLayout.setColumnStretch(0, 1)
mainLayout.setColumnStretch(1, 1)

window:setLayout(mainLayout)
window:show()