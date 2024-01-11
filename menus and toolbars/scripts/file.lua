filemenu = Menu("File")

newfile = MenuItem("New File")

newwindow = MenuItem("New Window")
sep1 = MenuItem('-')

openfile = MenuItem("Open File")

openfolder = MenuItem("Open Folder")
openfolder:setImage(images("menu/openfolder.png"))
openrecent = MenuItem("Open Recent")
sep2 = MenuItem('-')

save = MenuItem("Save")
save:setImage(images("save.png"))
saveas = MenuItem("Save As")
sep3 = MenuItem('-')

share = MenuItem("Share")
sep4 = MenuItem('-')

autosave = MenuItem("Auto Save")
preferences = DropMenu("Preferences")

settings = MenuItem("Settings")
themes = DropMenu("Themes")
now = MenuItem("Now MenuItems")
light = MenuItem("Light")
dark = MenuItem("Dark")

themes:addMenuItem(now)
themes:addMenuItem(light)
themes:addMenuItem(dark)

preferences:addMenuItem(settings)
preferences:addDropMenu(themes)
filemenu:addDropMenu(preferences)

sep5 = MenuItem('-')
exit = MenuItem("Exit")

filemenu:addMenuItem(newfile)
filemenu:addMenuItem(newwindow)
filemenu:addMenuItem(sep1)
filemenu:addMenuItem(openfile)
filemenu:addMenuItem(openfolder)
filemenu:addMenuItem(openrecent)
filemenu:addMenuItem(sep2)
filemenu:addMenuItem(save)
filemenu:addMenuItem(saveas)
filemenu:addMenuItem(sep3)
filemenu:addMenuItem(share)
filemenu:addMenuItem(sep4)
filemenu:addMenuItem(autosave)
filemenu:addMenuItem(sep5)
filemenu:addMenuItem(exit)
