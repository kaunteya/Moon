#Moon
The purpose of this project is to experiment replicating the Home View of popular [Sunrise](https://itunes.apple.com/us/app/sunrise-calendar-outlook-app/id599114150?mt=8) app excluding the functionality

## Scope
* Show Home User interface
* Settings button will show the Table view w/o functionality
* Add Button will show the Events page w/o functionality

----
## Basic
Home view is View Controller embedded in `Navigation Controller`. 
It mainly contains `Calendar View` and `Events View` as seen below

![ProgressKit Banner](/Other/screenshot2.png)

### Calendar View
Implemented using `UICollection View`; it basically shows the calendar for entire year along with few past months.
- [x] By default Today is selected.
- [x] Changing selection must also scroll `Event View` to the appropriate Event row
- [x] First day of month will have short Month above it; all in Red Font
- [x] On focus, height will be expanded
- [x] Scrolling down will show search bar and scrolling up will hide search bar
- [ ] During scroll, month must be clearly(opaque) visible in center of month cells
- [ ] No row will be partially visible when scrolling ends.(Sticky rows)

### Events View
Implemented using `UITableView`; shows all the events associated with it.
- [x] By default `Todays` Event row will be at the top
- [ ] While scrolling, the top most event row must be shown as selected in Calendar View
- [x] Section header will show Dates in format `Weekday, Date, Month`
- [ ] Scrolling table view will accordingly update the selection in Calendar View
- [x] On focus, it will expand its height

## Libraries
* [AFDateHelper](https://github.com/melvitax/AFDateHelper)
* [XCGLogger](https://github.com/DaveWoodCom/XCGLogger)

## Assumptions /  Notes
* App is portrait only
* Tested on all simulators(both iPhone and iPad) and Real Device: iPhone 6 only
