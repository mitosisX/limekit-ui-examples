viewMenu = Menu('Sub Levels')

themes = Menu('Themes')

light = MenuItem('light')
dark = MenuItem('dark')

themes:addMenuItem(light)
themes:addMenuItem(dark)

single = MenuItem('just me')

other = Menu('Levels')

level1 = MenuItem('Level 1')
other:addMenuItem(level1)

level2 = Menu('Level 2')
level2_1 = Menu('Level 2 1')
level2_1_1 = MenuItem('Level 2 1 1')

level2_1:addMenuItem(level2_1_1)

level2:addMenu(level2_1)

other:addMenu(level2)

viewMenu:addMenu(themes)
viewMenu:addMenu(other)
