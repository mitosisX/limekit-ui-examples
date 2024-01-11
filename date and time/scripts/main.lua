window = Window{title="Input Dialogs - Limekit", icon = route('app_icon'), size={350, 170}}

mainLay = VLayout()

calendar = Calendar()
calendar:setDate(1996, 12, 13)
calendar:setOnDatePicked(function(obj, date)
	print(date)
end)
mainLay:addChild(calendar)

datePicker = DatePicker()
-- datePicker:setDate(1996, 12, 13, 21, 30)
mainLay:addChild(datePicker)

timePicker = TimePicker()
timePicker:setOnTimePicked(function(obj, time)
	print(time)
end)
mainLay:addChild(timePicker)

window:setLayout(mainLay)
window:show()