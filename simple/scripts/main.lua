window = Window("Simple App - Liemkit")
window:setIcon(route('app_icon'))
window:setSize(280, 170)
window:setOnClose(function(obj, event)
    -- event.ignore()
    -- question = app.questionPopup(window,'Quit?','Are you sure you want to quit?')
    -- res = question:getButton()

    -- if res == 'yes' then
    --     event.accept()
    -- end
end)

shortcut = KeyboardShortcut(window, 'Ctrl+Q')
shortcut:setOnKeyPress(function()
    print('Ctrl+Q')
end)

-- site = requests.get('https://webscraper.io/test-sites/e-commerce/allinone')
-- soup = BeautifulSoup(site.text, "html.parser")
-- local divs = py_getatrr(soup).findAll('div','col-sm-4 col-lg-4 col-md-4')

-- length = len(divs)
-- for index = 0, length - 1 do
--     aElement = py_getatrr(divs[index]).find('a','title')
--     text = py_getatrr(aElement).get_text())
--     print(text)
-- end

-- theme = Theme("material")
-- theme:setTheme("light_blue")

mainLay = VLayout()

button = Button('Hello')
button:setOnClick(function()
    
end)

openButton = Button('Open')
openButton:setOnClick(function(obj)
    filters= {['Text Files']={'lua', 'js','txt'}, 
    ['Compressed']={'zip', 'tar','iso'}}
    -- name = app.openFile(window, 'Open Project', '', filters)
    name = app.getFont(window)
    l:setFont('Jokerman', 12)

    -- name = app.openFile(window)
    -- if name then
    --     print(app.readFile(route('books::Ringsf')))
        -- print(name)
    -- end
end)

mainLay:addChild(button)
mainLay:addChild(openButton)

l = Label("Hello There")
-- cal:setDate("12/13/1996");

mainLay:addChild(l)

-- window:setMainWidget(button)

window:setLayout(mainLay)
window:show()