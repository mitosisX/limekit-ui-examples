window = Window("Nested Layouts - Limekit")
window:setIcon(route('app_icon'))
window:setSize(350, 200)

mainLay = VLayout()

info_label = Label("Select 2 items for lunch and their prices.")
info_label.setTextAlign('center')
mainLay:addChild(info_label)

-- Create a list of food items and two separate
-- QComboBox widgets to display all of the items
food_list = {"egg", "turkey sandwich", "ham sandwich",
"cheese", "hummus", "yogurt", "apple", "banana",
"orange", "waffle", "carrots", "bread", "pasta",
"crackers", "pretzels", "coffee", "soda", "water"}

function calculateTotal(obj, value)
    total = price_sb1.getValue() + price_sb2.getValue()
    totals_label.setText('Total Spent: $' .. total)
end

food_combo1 = ComboBox(food_list)
food_combo2 = ComboBox(food_list)

price_sb1 = Spinner()
price_sb1.setRange(0, 100)
price_sb1.setPrefix('$')
price_sb1.setOnValueChange(calculateTotal)

price_sb2 = Spinner()
price_sb2.setRange(0, 100)
price_sb2.setPrefix('$')
price_sb2.setOnValueChange(calculateTotal)

item1_h_box = HLayout()

item1_h_box.addChild(food_combo1)
item1_h_box.addChild(price_sb1)

item2_h_box = HLayout()
item2_h_box:addChild(food_combo2)
item2_h_box:addChild(price_sb2)

mainLay:addLayout(item1_h_box)
mainLay:addLayout(item2_h_box)

totals_label = Label("Total Spent: $0")
totals_label.setTextAlign('right')

mainLay:addChild(totals_label)

window:setLayout(mainLay)
window:show()