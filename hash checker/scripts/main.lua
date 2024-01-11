theme = app.Theme("darklight")
theme:setTheme("light")
-- app.setStyle('Fusion')
-- Creating a window
window = Window{title="Hash Checker - Limekit", icon=images('app.png'), size={408, 270}}

-- Creating a main horizontal layout
mainLay = VLayout()

tab = Tab()

homeTab = TabItem()
homeVLay = VLayout()

homeVLay:addChild(Label('Hash Calculation'))

group1 = GroupBox("")
groupVLay = VLayout()

-- Lay 1
hLay1 = HLayout()

folder = Label("")
folder:setImage(images('folder.png'))

text1 = LineEdit()
text1:setHint('Select a file to begin')

select = Button("Select file")
select:setIcon(images("file.png"))

hLay1:addChild(folder)
hLay1:addChild(text1)
hLay1:addChild(select)

groupVLay:addLayout(hLay1)
group1:setLayout(groupVLay)

-- Lay 2
hLay2 = HLayout()

clear = Button("Clear")
clear:setIcon(images('erase.png'))

text2 = LineEdit()
text2:setHint('Hash will be displayed here')

copy = Button("Copy")
copy:setIcon(images("copy.png"))

hLay2:addChild(clear)
hLay2:addChild(text2)
hLay2:addChild(copy)
groupVLay:addLayout(hLay2)

-- Lay 3
hLay3 = HLayout()

hashTypes = ComboBox()
hashTypes:addImageItems({
    {'MD5', images('type.png')}, 
    {'SHA1', images('type.png')}, 
    {'SHA224', images('type.png')}, 
    {'SHA256', images('type.png')}, 
    {'SHA384', images('type.png')}, 
    {'SHA512', images('type.png')}})

text3 = LineEdit()

calculate = Button("Calculate")
calculate:setIcon(images("calculate.png"))

hLay3:addChild(hashTypes)
hLay3:addChild(text3)
hLay3:addChild(calculate)

groupVLay:addLayout(hLay3)

homeVLay:addChild(group1)

homeVLay:addChild(CheckBox('Hash Matcher'))

-- GroupBox 2
group2 = GroupBox("")
hLay4 = HLayout()

folder = Button("Clear")
folder:setIcon(images('erase.png'))

text4 = LineEdit()

search = Button("Check")
search:setIcon(images("find.png"))

hLay4:addChild(folder)
hLay4:addChild(text4)
hLay4:addChild(search)
group2:setLayout(hLay4)

homeVLay:addChild(group2)

homeTab:setLayout(homeVLay)

aboutTab = TabItem()

tab:addTab(homeTab,'Home')
tab:addTab(aboutTab,'About')

mainLay:addChild(tab)

window:setLayout(mainLay)
window:show()
