window = Window{title="System Try menu - Limekit", icon = route('app_icon'), size={350, 170}}

mainLay = VLayout()

trayMenu = SysTray(route("app_icon"))
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
		icon=route('app_icon')
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

combo = ComboBox({'Zebra','Elephant',"Cheeta",'Tiger'})
mainLay:addChild(combo)

trayMenu:setMenu(menu)
window:setLayout(mainLay)
window:show()