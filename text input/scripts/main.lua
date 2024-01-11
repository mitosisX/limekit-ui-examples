window = Window{title="Text Input - Limekit", icon=images('app.png'), size={400, 200}}

mainLay = VLayout()

inputMode = ComboBox({'password','hideinput','passwordonedit', 'normal'})
inputMode:setOnItemSelected(function(sender, text)
	edit:setInputMode(text)
end)

edit = LineEdit()
edit:setOnTextChange(function(self, text)
	print(text)
end)

mainLay:addChild(inputMode)
mainLay:addChild(edit)

window:setLayout(mainLay)
window:show()