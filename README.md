# Core Data Demo

Demo app for the Learn Swift Boston meetup that includes an introduction to Core Data.

The app is a simple app for the meetup group itself. It has one tab where you can add speakers and sessions, and another tab where you can see a list of all the sessions.

The Core Data code is inspired from the template you get when you create a new project in Xcode and choose **iOS** → **Master-Detail App** and check the **Core Data** checkbox.

## Branches

This repository has two branches:

- `master` has the start of an app we're going to build. The user interface is finished, but there is no data persistence, so adding speakers or sessions doesn't actually save them anywhere.
- `feature/add-core-data` has the additional code from the workshop. It adds Core Data support, so that changes made in the app are persisted to disk.
