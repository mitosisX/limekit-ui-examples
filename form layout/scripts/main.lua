window = Window{title="Form Layout - Limekit", icon=images('app.png'), size={500, 400}}

main_grid = FormLayout()

theme = app.Theme("material")
theme:setTheme("light_blue")

header_label = Label("Appointment Form")
header_label:setFont('Arial', 18)
header_label:setTextAlign('center')

first_name_edit = LineEdit()
first_name_edit.setHint('First')

last_name_edit = LineEdit()
last_name_edit:setHint('Last')

name_h_box = HLayout()
name_h_box:addChild(first_name_edit)
name_h_box:addChild(last_name_edit)

gender_combo = ComboBox({"Male","Female"})

phone_edit = LineEdit()
phone_edit.setInputMask("(999) 999-9999;_")

birthdate_edit = Calendar()

email_edit = LineEdit()
email_edit:setHint("example@mail.com")

extra_info_edit = TextField()

feedback_label = Label("[INFO] Missing names.")

submit_button = Button("Submit")

submit_h_box = HLayout()
submit_h_box:addChild(feedback_label)
submit_h_box:addChild(submit_button)

main_grid:addChild("", header_label)
main_grid:addChild("Name", name_h_box)
main_grid:addChild("Gender", gender_combo)
main_grid:addChild("Date of Birth", birthdate_edit)
main_grid:addChild("Phone", phone_edit)
main_grid:addChild("Email", email_edit)
main_grid:addChild("", Label("Comments or Messages"))
main_grid:addChild("", extra_info_edit)
main_grid:addChild("", submit_h_box)

window:setLayout(main_grid)
window:show()