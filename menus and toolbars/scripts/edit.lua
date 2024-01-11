editmenu = Menu("Edit");

undo = MenuItem("Undo");
undo:setImage(images("undo.png"));
redo = MenuItem("Redo");
redo:setImage(images("redo.png"));
sep1 = MenuItem('-')

cut = MenuItem("Cut");
cut:setImage(images("cut.png"));
copy = MenuItem("Copy");
copy:setImage(images("copy.png"));
openfolder:setImage(images("menu/openfolder.png"));
paste = MenuItem("Paste");
paste:setImage(images("paste.png"));
sep2 = MenuItem('-');

find = MenuItem("Find");
find:setImage(images("find.png"));
replace = MenuItem("Replace");
sep3 = MenuItem('-');

findfiles = MenuItem("Find in Files");
replacefiles = MenuItem("Replace in Files");
sep4 = MenuItem('-');

comment = DropMenu("Comment");

togglecomment = MenuItem("Toggle Comment");
toggleblockcomment = MenuItem("Toggle Block Comment");
comment.addMenuItems(togglecomment, toggleblockcomment)

sep3 = MenuItem('-');
exit = MenuItem("Exit");

editmenu.addMenuItems(
  undo,
  redo,
  sep1,
  cut,
  comment,
  paste,
  sep2,
  find,
  replace,
  sep3,
  findfiles,
  replacefiles,
  sep4,
  comment);