window = Window("Fluent UI - Limekit")
window:setIcon(images("lua.png"))

mainLay = VLayout()

card = Card()
card.setBorderRadius(200)


mainLay.addChild(card)


window.setLayout(mainLay)
window.show()