window = Window{title="Group Buttons - Limekit", icon=images('app.png'), size={350, 200}}

theme = app.Theme("darklight")
theme:setTheme("light")

mainLay = VLayout()

headerLabel = Label("Limekit UI")
headerLabel.setTextAlign('center')

questionLabel = Label("How would you rate Limekit?")
questionLabel.setTextAlign('center')

mainLay:addChild(headerLabel)
mainLay:addChild(questionLabel)

ratings = {"Brilliant", "Average", "Not Satisfied"}

rating = "" -- holds the rating

ratingGroup = ButtonGroup()
ratingGroup:setOnClick(function(obj, button)
    rating = button:getText()
end)

for key,value in ipairs(ratings) do
    check = CheckBox(value)
    ratingGroup:addButton(check)
    mainLay:addChild(check)
end

confirm = Button("Confirm")
confirm:setOnClick(function()
    if rating ~= "" then
        app.alert(window, 'Result', "Your rating: " .. rating)
    else
        app.alert(window, 'Error!', 'You need to rate first')
    end
end)
mainLay:addChild(confirm)

window:setLayout(mainLay)
window:show()