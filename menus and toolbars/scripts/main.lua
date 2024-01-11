window = Window{title="Menus - Limekit", icon=images("app.png"), size={400, 300}}

toolbar = Toolbar();

malawi = ToolbarButton();
malawi:setToolTip("Developed in Malawi");
malawi:setIcon(images("malawi.png"));
toolbar:addButton(malawi);

toolbar:addButton(ToolbarButton('-'))

b = ToolbarButton();
b:setToolTip("My Continent");
b:setIcon(images("africa1.png"));
b:setOnClick(function (self)
  self.setIcon(images("africa2.png"));
end);

b:setCheckable(true);
toolbar:addButton(b);
window:addToolbar(toolbar);

menu = Menubar();

app.execute(scripts('file.lua'))

menu:addMenuItems(filemenu)

window:setMenubar(menu);

window:show();