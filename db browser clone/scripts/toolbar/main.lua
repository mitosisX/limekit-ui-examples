-- ##### Toolbar 1
toolbar1 = Toolbar()
toolbar1:setIconStyle('textbesideicon')

newDBToolbarButton = ToolbarButton('New Database')
newDBToolbarButton:setIcon(images('database_add.png'))

openDBToolbarButton = ToolbarButton('Open Database')
openDBToolbarButton:setIcon(images('database_go.png'))

writeChangesToolbar = ToolbarButton('Write Changes')
writeChangesToolbar:setIcon(images('database_save.png'))

revertChangesToolbar = ToolbarButton('Revert Changes')
revertChangesToolbar:setIcon(images('database_refresh.png'))

toolbar1:addButton(newDBToolbarButton)
toolbar1:addButton(openDBToolbarButton)
toolbar1:addButton(ToolbarButton('-'))
toolbar1:addButton(writeChangesToolbar)
toolbar1:addButton(revertChangesToolbar)

-- ##### Toolbar 2
toolbar2 = Toolbar()
toolbar2:setIconStyle('textbesideicon')

openProjectToolbar = ToolbarButton('Open Project')
openProjectToolbar:setIcon(images('package_go.png'))

saveProjectToolbar = ToolbarButton('Save Project')
saveProjectToolbar:setIcon(images('package_save.png'))

toolbar2:addButton(openProjectToolbar)
toolbar2:addButton(saveProjectToolbar)

-- ##### Toolbar 3
toolbar3 = Toolbar()
toolbar3:setIconStyle('textbesideicon')

openProjectToolbar = ToolbarButton('Attach Database')
openProjectToolbar:setIcon(images('database_link.png'))

closeDBToolbar = ToolbarButton('Close Database')
closeDBToolbar:setIcon(images('cross.png'))

toolbar3:addButton(openProjectToolbar)
toolbar3:addButton(closeDBToolbar)