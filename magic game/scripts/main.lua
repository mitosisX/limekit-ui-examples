-- Developed by Omega Msiska
-- Ported to lua from my earlier javascript code

function dealToPlace()
    splitData = shuffleArray(categoryUse)
    sevensList = splitSevens(splitData)

    assignColumns(sevensList) -- arrange the data into columns, each column to each list

    mainList = sevensList -- globally store the filtered data
    sevensAllocateLists(sevensList)
end

function sevensAllocateLists(data)
    lists = {list1, list2, list3}
    for countLists, eachList in ipairs(data) do
        for listItem, getItem in ipairs(eachList) do
            lists[countLists]:addItem(getItem)
        end
    end
end

function shuffleArray(array)
	local result = {}  -- Create an empty table to store the split parts

	-- Iterate over each substring separated by ','
	for substring in array:gmatch("[^,]+") do
	    table.insert(result, substring)
	end

	array = result

    currentIndex = #array
    while currentIndex ~= 0 do
        randomIndex = math.random(currentIndex)
        currentIndex = currentIndex - 1

        temporaryValue = array[currentIndex]
        array[currentIndex] = array[randomIndex]
        array[randomIndex] = temporaryValue
    end
    return array
end

-- Responsible for generating the 3 columns of 7 rows
function splitSevens(tokens)
    holdTokens = tokens -- just hold the argument
    sevensList = {} -- the main list for the [[], [], []]
    counter = 7 --

    for list = 1, 3 do
        sevensList[list] = {} -- add a blank list at position
        tempCounter = counter - 7 -- make sure the list from pos 1 and after 7, then + 7
        for b = 1, 7 do -- run loop 7 times each time
            table.insert(sevensList[list], holdTokens[tempCounter])
            tempCounter = tempCounter + 1 -- now keep on increasing after the subtraction
        end
        counter = counter + 7 -- skip to the next 7th position of the last position
    end

    print(sevensList[1][6])

    return sevensList
end

function tryAssign()
    assignColumns(mainList)
end

-- Assign each column received from splitSevens to each column varible, in order;
function assignColumns(input)
    allColumns = getColumnsList()

    for columns = 1, 3 do
        eachList = input[columns]
        for item, _ in ipairs(eachList) do
            table.insert(allColumns[columns], eachList[item])
        end
    end
    -- alert(JSON.stringify(allColumns));
end

function getColumnsList()
    allColumns = {columnOne, columnTwo, columnThree}
    return allColumns
end

colPicked = 0 -- 1,2,3 to represent each column

function pickLeft()
    colPicked = 0
    reOrderColumns()
end

function pickMiddle()
    colPicked = 1
    reOrderColumns()
end

function pickRight()
    colPicked = 2
    reOrderColumns()
end

-- Keep the data consindering that it will be cleared through time. Code will be reused often
function tempHoldColumns()
    -- Hold here for a while to avoid loosing all data after reinitializing originals to empties
    tempColOne = columnOne
    tempColTwo = columnTwo
    tempColThree = columnThree

    columnOne = {}
    columnTwo = {}
    columnThree = {}

    reordering = {tempColOne, tempColTwo, tempColThree}
end

function reOrderColumns()
    tempHoldColumns()

    checks = {0, 1, 2} -- Used to check if remaining number is yet in the below list
    randColSelect = randNotColumn() -- get the column that needs to be in front
    orderly = {randColSelect, colPicked} -- random picked, column selected

    for a = 1, 3 do
        num = checks[a]
        if not (orderly.indexOf(num)) then -- Yay, it wasn't found
            table.insert(orderly, num)
            break
        end
    end

    columnOne = reordering[orderly[1]]
    columnTwo = reordering[orderly[2]]
    columnThree = reordering[orderly[3]]

    shareToColumns()
end

dealTimes = 1 -- Each column will share it's data to other columns, one after another

function shareToColumns()
    list1:clear()
    list2:clear()
    list3:clear()

    -- alert(json(getColumnsList()))

    if dealTimes <= 2 then
        counterT = 0
        tempHoldColumns()
        realColumns = {columnOne, columnTwo, columnThree}

        onColumn = 0 -- for alternating columns
        for a = 1, 3 do
            for b = 1, 7 do
                if onColumn == 3 then
                    onColumn = 0
                end

                table.insert(realColumns[onColumn], reordering[a][b])

                onColumn = onColumn + 1
            end
        end

        sevensAllocateLists(getColumnsList())
        dealTimes = dealTimes + 1
    else
        app.Message("I know you chose " .. columnTwo[3])
        dealTimes = 1
        tempHoldColumns()
    end
end

ignorePicked = nil -- Any random number but the colPicked

function randNotColumn()
    randInt = 0
    while true do
        gen = rand(0, 2)
        if gen ~= colPicked then
            randInt = gen
            break
        end
    end
    return randInt
end

function rand(min, max)
    ra = math.random(min, max)
    return ra
end


theme = app.Theme('material')
theme:setTheme('light_blue')

window = Window{title="Magic Game - Limekit", size={500, 380}}
-- window:setIcon(route('app_icon'))

peopleData = "Edina,Noah,Juliet,Peter,Dan,Chrissy,Jack,Emmie,Rick,Mary,Sofia,Ezelina,Ronald,Bill,Amanda,Steve,Kate,Rose,Timmy,Ben,Anny"
animalsData = "Elephant,Hare,Lion,Cheetah,Buffalo,Chicken,Panda,Monkey,Panther,Zebra,Hippo,Giraffe,Beetle,Hyena,Duck,Frog,Cat,Dog,Lizard,Mouse,Bird"

gameData = {
    people = peopleData,
    animals = animalsData
}

categoryUse = gameData.people

bg = "#6236FF"


mainLay = VLayout()

top1 = Label("Pick something")
top1:setTextAlign('center')
mainLay:addChild(top1)

hlay = HLayout()
list1 = ListBox()
list2 = ListBox()
list3 = ListBox()

hlay:addChild(list1)
hlay:addChild(list2)
hlay:addChild(list3)
mainLay:addLayout(hlay)

btnLay = HLayout()

dev = Label("Developed by -- Omega Msiska --")

b = Button("Play Game")
b:setOnClick(dealToPlace)

sort = Button("How to play")

sort.setOnClick(function()
    app.Message("Game rules are simple, pick something with your eyes " ..
    "without touching the screen, just keep it to" ..
    "yourself. After that click one of the three " ..
    "bottons to tell the app where your choice is and my app will " ..
    "predict your choice")
end)

btnLay.addChild(b)
mainLay.addLayout(btnLay)

left = Button("Left")
left.setOnClick(pickLeft)

middle = Button("Middle")
middle:setOnClick(pickMiddle)

right = Button("Right")
right.setOnClick(pickRight)

-- app.Message("If you tell me the truth I will always be correct, if you lie, I will lie too!\n\nThis isn't magic but just the power of algorithms. Ok, let's play");
-- chooseCategory();

-- Called when user touches our button.
function chooseCategory()
    -- Create dialog window.
    dlgTxt = app.CreateDialog("Choose a Category", "NoCancel")

    -- Create a layout for dialog.
    layDlg = app.CreateLayout("linear", "vertical,vcenter")
    --   layDlg.SetPadding( 0.02, 0, 0.02, 0.02 );
    dlgTxt.AddLayout(layDlg)

    -- Create a list control.
    list = "Names of People,Names of Animals"
    lstDlg = app.CreateList(list, nil, 0.2)
    lstDlg:SetTextSize(22)
    lstDlg:SetTextColor("black")
    lstDlg:SetOnTouch(lst_OnTouch)
    layDlg.AddChild(lstDlg)

    -- Show dialog.
    dlgTxt.Show()
end

-- Handle list item selection.
function lst_OnTouch(item, b, t, index)
    -- Hide the dialog window.
    dlgTxt.Hide()

    if index == 0 then
        categoryUse = gameData.people
    else
        categoryUse = gameData.animals
    end
end

-- each colums represents an array of names
columnOne = {}
columnTwo = {}
columnThree = {}

mainList = nil

window:setLayout(mainLay)
window:show()
