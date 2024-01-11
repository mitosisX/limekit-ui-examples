window = Window{title='Simple - Limekit', size={280, 170}, icon=images('app.png')}

mainLay = VLayout()

menu = Menubar()
struct = {
    {
        label = "File",
        submenu = {
            {
                label = "New",
                name = 'new_item',
                accelerator = "Ctrl+N",
                click = function()
                    print('New clicked')
                end,
                icon = images('paste.png')
            },
            {label = '-'},
            {
                label = "Open",
                accelerator = "Ctrl+O",
                icon = images('paste.png')
            },
            {
                label = "Save",
                accelerator = "Ctrl+S",
            }
        }
    },
    {
        label = "Edit",
        submenu = {
            {
                label = "Cut",
                accelerator = "Ctrl+X",
                click = function()
                    child = menu:findChild('new_item')
                    child:setText('Changed')
                end
            },
            {
                label = "Copy",
                accelerator = "Ctrl+C",
            },
            {
                label = "Paste",
                submenu = {
                    {
                        label = "Formatted",
                        submenu = {
                            {
                                label = "Yes",
                                submenu = {
                                    {label = 'Gender',
                                        submenu = {
                                            {label = 'Male'},
                                            {label = 'Female'}
                                        }}
                                }
                            },
                            {
                                label = "No",
                            }
                        }
                    },
                    {
                        label = "Not Formatted",
                    }
                }
            }
        }
    },
    {
        label = 'Help',
        submenu= {
            {label ='Documentation'},
            {label ='About Limekit'}
        }
    }
}

menu:buildFromTemplate(struct)

b= Button('Doing nothing')
mainLay:addChild(b)

window:setMenubar(menu)

window:setLayout(mainLay)
window:show()