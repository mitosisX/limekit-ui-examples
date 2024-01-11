window = Window{title="System Try menu - Limekit", icon = images('app.png'), size={350, 170}}

mainLay = VLayout()

trayMenu = SysTray(images('app.png'))
menu = Menu()
menu:buildFromTemplate({
	{label = 'File',
		submenu={
			{label='File 1',
			icon=images('database.png'),
			click=function()
				print('File 1')
			end
			},

			{label='File 2',
			icon=images('database.png'),
			click=function()
				print('File 2')
			end
			}
		}
	},
	{label = 'Edit',
		click=function()
			print('Edit')
		end, 
		icon=images('app.png')
	},
	{label = 'View',
		submenu={
			{label='View this',
			icon=images('database.png'),
			click=function()
				print('View this')
			end
			},

			{label='View that',
			icon=images('database.png'),
			click=function()
				print('View that')
			end
			}
		}
	}
})

label=Label('Check your system tray and right click on it')
label:setTextAlign('center')

mainLay:addChild(label)

combo = ComboBox({'Zebra','Elephant',"Cheeta",'Tiger'})
mainLay:addChild(combo)

trayMenu:setMenu(menu)
window:setLayout(mainLay)
window:show()