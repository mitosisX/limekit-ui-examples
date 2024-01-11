window = Window{title="Docking - MirandaJS", icon=images('app.png'), size={500, 500}}

dock = Dock()
b = Button("Move the dock to bottom")

dock:setMagneticAreas({'top', 'bottom'})
dock:setChild(b)
window:addDock(dock,'right')
window.show()