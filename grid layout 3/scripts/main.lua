window = Window{title="Grid Layout 2 - Limekit", icon=images('app.png'), size={200,100}}

mainLayout = GridLayout()

for row = 0, 3 do
	for column = 0, 3 do
		mainLayout:addChild(Button(row..','..column), row, column)
	end
end

window:setLayout(mainLayout)
window:show()