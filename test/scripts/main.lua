window = Window{title='Charts - Limekit', size={400, 300}, icon=route('app_icon')}

mainLay = VLayout()

button = Button("Hello")
button:setOnClick(function ( )
	app.sleep(3)
	print('Slept')
end)
button:setResizeRule('fixed','fixed')
mainLay:addChild(button)

window:setLayout(mainLay)
window:show()