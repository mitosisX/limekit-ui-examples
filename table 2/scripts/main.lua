-- Creating a window
window = Window{title="Table - Limekit", icon=images('app.png'), size={558, 363}}

-- Creating a main horizontal layout
mainLay = VLayout()

theme = app.Theme("darklight")
theme:setTheme("light")

-- Creating a table with dimensions 10x10
table = Table(10, 10)
table:setAltRowColors(true)

table:setOnCellSelection(function(self, sel, des)
    -- table:getSelectedCells()
    print('Row:', sel, ' Column:', des)
end)

table:setOnCellDoubleClicked(function(obj, row, column)
    item = table:getItemAt(row, column)
    if item then
        -- item:setText("400")
        item:setBackgroundHex('#ff0076')
    else
        print('false')
    end
end)

table:setColumnSorting(false)

table:setTableData({
    ['text'] = 'Emoji ' .. app.emoji(':thumbs_up:'),
    ['row'] = 0,
    ['column'] = 1
})
-- table.setAltRowColors(true)
-- table.setCellsEditable(false)

gif=GifPlayer(images('hi.gif'))
gif:setSize(30, 30)

table:setCellChild(0, 0, gif)

combo = ComboBox()
combo:addImageItems({{'Limekit', images('app.png')}, {'lua', images('app.png')}, {'heart', images('heart.png')}});

table:setCellChild(0, 2, combo)

for x = 1, 5 do
    local edit = Button("")
    edit:setIcon(images('edit.png'))
    edit:setOnClick(function()
        dat = table:getSelectedCells()
        row = dat[1]
        column = dat[2]

        print(table:getItemAt(row, 0):getText())
        print(table:getItemAt(row, 1):getText())
    end)

    local delete = Button("")
    delete:setIcon(images('remove.png'))
    delete:setOnClick(function()
        dat = table:getSelectedCells()
        row = dat[1]

        table:deleteRow(row)        
    end)

    table:addData(x, 0, 'First '..x*2)
    table:addData(x, 1, 'Second '..x*10)

    table:setCellChild(x, 2, edit)
    table:setCellChild(x, 3, delete)
end

-- table:setCellChild(1, 3, Button('Edit'))
-- table:setCellChild(2, 3, Button('Edit'))
-- table:setCellChild(3, 3, Button('Edit'))

knob = Knob()
knob:setRange(0, 50)
knob:setIndicators(true)
knob:setOnValueChanged(function(obj, value)
    table:addData(4, 0, value)
end)

table:setCellChild(4, 2, knob)

-- table.setGridVisible(false) -- Hides the grid lines
-- table:setHeaderToolTip(1, 'Names go here')
table:setMaxColumns(4)
-- table.setRowLabelsVisible(false)
-- table.setColumnWidth(0,200)
table:setColumnHeaders({'Name', 'Surname', 'Age', 'Class', 'Grade'})
table:setRowHeaders({'Biology', 'Physics', 'Mathematics', 'English', 'Geography', 'Agriculture', 'Computer',
                     'Economics', 'Chemistry', 'Total'})

table:setColumnHeaderToolTip(0, 'Holds names')

-- Setting data in the table at row 1, column 0
table:addData(9, 0, "200")
-- Implementing an Event Handler for Cell Edit Completio
-- table:setOnCellEditFinished(function(obj, row, column)
--     -- Your code for handling cell edit finish goes here
--     print('done at' .. row .. ', ' .. column)
-- end)
-- table:setOnCellClicked(function(obj, row, column)
--     -- print(row, column)
--     item = obj:getSelectedCell()
--     if item then
--         item:setTextColorHex('#ff0076')
--     end
-- end)


-- Creating a dock on the right side with title "Employees"
rightDock = Dock("Employees")

btnLay = HLayout()

-- Adding the right dock to the window
-- window:addDock(rightDock, "right")

-- Setting the central child of the window as the table
mainLay:addChild(table)
window:setLayout(mainLay)

-- Displaying the window
window:show()
