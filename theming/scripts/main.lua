window = Window{title='Simple - Limekit', size={280, 170}, icon=route('app_icon')}
-- window:setIcon(route('app_icon'))
window:setSize(280, 170)

mainLay = VLayout()

theme = Theme('misc')
getThemes = theme:getThemes()

combo = ComboBox(getThemes)
combo:setOnItemSelected(function(obj, theme_)
    theme:setTheme(theme_)
end)

mainLay:addChild(combo)

window:setLayout(mainLay)
window:show()