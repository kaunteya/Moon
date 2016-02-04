#Moon
The purpose of this project is to experiment replicating the Home View of popular [Sunrise](https://itunes.apple.com/us/app/sunrise-calendar-outlook-app/id599114150?mt=8) app as per [this description](https://github.com/outlook/jobs/blob/master/instructions/ios-engineer.md)

----
## Scope
* Show Home User interface
* Populate existing events using EventKit

----
## Basic
`Moon` mainly contains `Calendar View` and `Agenda View` as seen below

![ProgressKit Banner](/Other/screenshot2.png)

----
## TODO
#### General
- [x] By default Today is selected.
- [ ] Populate Calendar events from EventKit
- [ ] Integrate an internet data source to retrieve the weather forecast for the user.

#### Calendar View
- [x] Selection by tapping must also scroll `Agenda View` to the appropriate Date
- [x] On focus, height will be expanded
- [x] Scrolling down will show search bar and scrolling up will hide search bar
- [x] During scroll
  - [x] month label are made visible visible
  - [x] Date cells must be translucent
- [x] Scroll Ends
  - [x] No row will be partially visible(Sticky rows)

#### Agenda View
- [x] By default `Todays` Event row will be at the top
- [x] On focus, it will expand its height
- [ ] Scrolling must also update selection in `Calendar View`

----
## Libraries
* [AFDateHelper](https://github.com/melvitax/AFDateHelper)
* [XCGLogger](https://github.com/DaveWoodCom/XCGLogger)

----
## Assumptions /  Notes
* App is portrait only
* Tested on all simulators(both iPhone and iPad) and Real Device: iPhone 6 only
