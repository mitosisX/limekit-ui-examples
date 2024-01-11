editMenu = Menu('Edit')

createTable = MenuItem('Create Table...')
createTable:setIcon(images('table_add.png'))

createIndex = MenuItem('Create Index...')
createIndex:setIcon(images('tag_blue_add.png'))

preferences = MenuItem('Preferences...')
preferences:setIcon(images('wrench.png'))

editMenu:addMenuItem(createTable)
editMenu:addMenuItem(MenuItem('-'))
editMenu:addMenuItem(createIndex)
editMenu:addMenuItem(MenuItem('-'))
editMenu:addMenuItem(preferences)
