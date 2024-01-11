window = Window{title = "Listbox - Limekit", icon=route('app_icon'), size={400, 200}}

mainLay = HLayout()

listWidget = ListBox()

groceryList = {"cheese", "bacon", "eggs","rice", "soda"}

for index = 1, #groceryList do
	item = groceryList[index]
	listWidget:addItem(item)
end

addButton = Button("Add")
addButton:setOnClick(function()
	if text ~= "" then
		text = app.textInputDialog(window, "New Item", "Add item:")
		
		listWidget:addItem(text)
	end
end)

insertButton = Button("Insert")
insertButton:setOnClick(function()
	text = app.textInputDialog(window, "Insert Item", "Insert item:")
	
	if text ~= "" then
		row = listWidget:getCurrentRow()
		row = row + 1

		listWidget:insertItemAt(row, text)
	end
end)

removeButton = Button("Remove")
removeButton:setOnClick(function()
	row = listWidget:getCurrentRow()
	listWidget:removeItem(row)
end)

clearButton = Button("Clear")
clearButton:setOnClick(function()
	listWidget:clear()
end)


rightVBox = VLayout()

rightVBox:addChild(addButton)
rightVBox:addChild(insertButton)
rightVBox:addChild(removeButton)
rightVBox:addChild(clearButton)

mainLay:addChild(listWidget)
mainLay.addLayout(rightVBox)

window:setLayout(mainLay)
window:show()