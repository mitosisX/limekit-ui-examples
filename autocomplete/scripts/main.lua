window = Window{title='Charts - Limekit', size={400, 300}, icon=route('app_icon')}

mainLay = VLayout()

fruits = {
    "Apple",
    "Banana",
    "Orange",
    "Strawberry",
    "Grapes",
    "Pineapple",
    "Mango",
    "Peach",
    "Kiwi",
    "Watermelon",
    "Cherry",
    "Pear",
    "Blueberry",
    "Lemon",
    "Plum"
}

autocomplete = AutoComplete(fruits)
text = LineEdit()
text:setAutoComplete(autocomplete)

mainLay:addChild(text)

window:setLayout(mainLay)
window:show()