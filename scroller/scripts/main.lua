window = Window{title="Scroller - Limekit",size={400, 200}, icon=images('app.png')}

mainLay = VLayout()

scroller = Scroller()
scroller:setOnScroll(function(self, value)
	if value == self.minVerticalScroll() then
		print('Top')
	end

	if value == self.maxVerticalScroll() then
		print('Bottom')
	end
end)

lay = VLayout()

for a=1, 100 do
	lay:addChild(Button('Button '..a))
end

scroller:setLayout(lay)
mainLay:addChild(scroller)

window:setLayout(mainLay)
window:show()