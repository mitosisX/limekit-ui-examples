-- This example does not use buildFromTemplate to illustrate
-- how to use Menu and MenuItem

function fectchData()
	db:execute('SELECT * FROM Fruits;')
	data = db:fetchAll()

	return data
end

database = nil

app.execute(scripts('menus/file.lua'))
app.execute(scripts('menus/edit.lua'))
app.execute(scripts('menus/view.lua'))
app.execute(scripts('menus/tools.lua'))
app.execute(scripts('menus/help.lua'))

app.execute(scripts('toolbar/main.lua'))
app.execute(scripts('tab/main.lua'))
app.execute(scripts('docks/main.lua'))

function openDBFile()
	file = app.openFile(window, "Choose a database file", "D:/sandbox", {["SQLite database files"] = {".db", ".sqlite",".sqlite3", ".db3"}})
	database = Sqlite3(file)

	getTables()
end

function getTables()
	tables = database:fetchTables()
	
	for index = 1, #tables do
		item = tables[index]
		tablesCombo:addItem(item)
	end
end

window = Window{title = "DB Browser for SQLite - Limekit"}
window:setIcon(route('app_icon'))
window:setSize(1000, 600)

theme = app.Theme('darklight')
theme:setTheme('dark')

mainLay = VLayout()
childMainLayout = HLayout()

segmentation = Splitter('horizontal')

db = Sqlite3('D:/sandbox/limekit.db')

menubar = Menubar()

menubar:addMenu(fileMenu)
menubar:addMenu(editMenu)
menubar:addMenu(viewMenu)
menubar:addMenu(toolsMenu)
menubar:addMenu(helpMenu)

window:setMenubar(menubar)

window:addToolbar(toolbar1)
window:addToolbar(toolbar2)
window:addToolbar(toolbar3)

segmentation:addChild(dbTab)
segmentation:addLayout(docksLay)

openDBToolbarButton:setOnClick(openDBFile)

mainLay:addChild(segmentation)

window:setLayout(mainLay)
window:show()