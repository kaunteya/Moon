#Moon
The purpose of this project is to experiment replicating the Home View of popular [Sunrise](https://itunes.apple.com/us/app/sunrise-calendar-outlook-app/id599114150?mt=8) app as per [this description](https://github.com/outlook/jobs/blob/master/instructions/ios-engineer.md)

## Scope
* Show Home User interface
* Populate existing events using EventKit

----
## Basic
`Moon` mainly contains `Calendar View` and `Agenda View` as seen below

![ProgressKit Banner](/Other/screenshot2.png)
## TODO
#### General
- [ ] Integration of EventKit

#### Calendar View
- [x] By default Today is selected.
- [x] Changing selection must also scroll `Agenda View` to the appropriate Event row
- [x] First day of month will have short Month above it; all in Red Font
- [x] On focus, height will be expanded
- [x] Scrolling down will show search bar and scrolling up will hide search bar
- [x] During scroll, month must be clearly(opaque) visible in center of month cells
- [x] No row will be partially visible when scrolling ends.(Sticky rows)
- [x] Calendar View must update itsself when user scrolls the agenda view

#### Agenda View
- [x] By default `Todays` Event row will be at the top
- [x] Selection in calendar must update the Agenda view, so that selected date is at the top
- [x] On focus, it will expand its height

## Libraries
* [AFDateHelper](https://github.com/melvitax/AFDateHelper)
* [XCGLogger](https://github.com/DaveWoodCom/XCGLogger)

## Assumptions /  Notes
* App is portrait only
* Tested on all simulators(both iPhone and iPad) and Real Device: iPhone 6 only
