window = Window{title="Grid Layout - Limekit", icon=images('app.png'),size={500, 300}}

main_grid = GridLayout()

header_label = Label("Simple Daily Planner")
header_label:setFont('Arial', 20)
header_label:setTextAlign('left')

today_label = Label("· Today's Focus")
today_label:setFont('Arial', 14)
today_tedit = TextField()

notes_label = Label("· Notes")
notes_label:setFont('Arial', 14)
notes_tedit = TextField()

main_grid:addChild(header_label, 0, 0)
main_grid:addChild(today_label, 1, 0)
main_grid:addChild(today_tedit, 2, 0, 3, 1)
main_grid:addChild(notes_label, 5, 0)
main_grid:addChild(notes_tedit, 6, 0, 3, 1)

-- Right side widgets

date_label = Label('29-09-2023')
date_label:setFont('Arial', 18)
date_label:setTextAlign('right')

todo_label = Label('· To Do')
todo_label:setFont('Arial', 14)

main_grid:addChild(date_label, 0, 2)
main_grid:addChild(todo_label, 1, 1, 1, 2)

for row = 2, 8 do
    local item_cb = CheckBox()
    local item_edit = LineEdit()

    main_grid:addChild(item_cb, row, 1)
    main_grid:addChild(item_edit, row, 2)
end

window:setLayout(main_grid)
window:show()