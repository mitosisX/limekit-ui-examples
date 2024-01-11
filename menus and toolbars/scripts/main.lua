window = Window("Menus and toolbar- MirandaJS");
window.setIcon(images("javascript.png"));
window.setSize(400, 300);

toolbar = Toolbar();

malawi = ToolbarButton();
malawi:setTooltip("Developed in Malawi");
malawi:setImage(images("malawi.png"));
toolbar.addAction(malawi);

toolbar.addSeparator();

b = ToolbarButton();
b:setTooltip("My Continent");
b:setImage(images("africa1.png"));
b:onClick(function (self)
  SamplePlugin.toast('hey')
  self.setImage(images("africa2.png"));
end);
b.setCheckable(true);
toolbar.addAction(b);
window.addToolbar(toolbar);

menu = Menubar();

-- The menu to be used in the below file.
app.execute(scripts('file.lua'))
-- app.execute(scripts('edit.lua'))

menu:addMenuItems(filemenu) -- editMenu, viewMenu, helpMenu);

-- menu:addMenuItems(filemenu, editmenu) -- editMenu, viewMenu, helpMenu);
-- menu.addItems(a, b, c);
window:setMenubar(menu);

window:show();