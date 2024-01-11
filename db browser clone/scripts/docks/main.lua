docksLay = VLayout()

editDBDocks = Dock("Edit Database Cell")
sqlLogsDocks = Dock("SQL Log")

docksLay:addChild(editDBDocks)
docksLay:addChild(sqlLogsDocks)