function loadData()
	list_widget:clearItems()
	db:execute('SELECT * FROM Fruits;')
	fruit_list = db:fetchAll()

	for index = 1, #fruit_list do
		item = fruit_list[index]
		list_widget:addItem(item[2])
	end
end

window = Window("Listbox - Limekit")
window:setIcon(route('app_icon'))
window:setSize(400, 200)
window:setOnShown(loadData)

main_lay = VLayout()

db = Sqlite3('D:/sandbox/limekit.db')

db_tables = ComboBox(db:fetchTables())
main_lay:addChild(db_tables)
db_tables:setResizeRule('fixed','fixed')

horiLay = HLayout()
main_lay:addLayout(horiLay)

list_widget = ListBox()



add_button = Button("Add")
add_button:setOnClick(function()
	input = app.textInput(window, "Insert Item", "Insert item:")
	
	if input:isDone() then
		text = input:getText()
		db:execute('SELECT COUNT(*) FROM Fruits;')
		db:execute('INSERT INTO Fruits VALUES(?,?);', {db:fetchOne()+1, text})
		db:save()

		loadData()
	end
end)

insert_button = Button("Insert")
insert_button:setOnClick(function()
	input = app.textInput(window, "New Item", "Add item:")
	
	if input:isDone() then
		text = input:getText()
		list_widget:insertItem(text)
	end
end)

remove_button = Button("Remove")
remove_button:setOnClick(function()
	row = list_widget:getCurrentRow()
	text = list_widget:getItemAt(row)
	db:execute("DELETE FROM Fruits WHERE Name = '" .. text.."';")
	db:save()
	list_widget:removeItem(row)
end)

clear_button = Button("Clear")
clear_button:setOnClick(function()
	list_widget:clearItems()
end)


right_v_box = VLayout()

right_v_box:addChild(add_button)
right_v_box:addChild(insert_button)
right_v_box:addChild(remove_button)
right_v_box:addChild(clear_button)

horiLay:addChild(list_widget)
horiLay.addLayout(right_v_box)

window:setLayout(main_lay)
window:show()