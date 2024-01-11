local window = Window{title = "list drag-drop - Limekit", icon=images('app.png'), size={500, 400}}

mainGrid = GridLayout()

iconWidget = ListBox()
iconWidget.setIconSizes(50,50)
iconWidget:setAllowDragDrop(true)
iconWidget:setDragEnabled(true)
iconWidget:setItemViewMode("icons")

items = {alarm=images('alarm.png'), avocado=images('avocado.png'),face=images("face.png")
,files=images('files.png'), flower=images('flower.png'), medal=images('medal.png')}

iconWidget:addImageItems(items)

listWidget = ListBox()
listWidget:setAltRowColors(true)
listWidget:setAllowDragDrop(true)
listWidget:setDragEnabled(true)

mainGrid:addChild(Label("ICONS"), 0, 0)
mainGrid:addChild(Label("LIST"), 0, 1)
mainGrid:addChild(iconWidget, 1, 0)
mainGrid:addChild(listWidget, 1, 1)

window:setLayout(mainGrid)
window:show()