
# GitHub User Finder

GitHub User Finder is an iOS app built using UIKit and SwiftUI, designed to help users easily search for GitHub profiles, view followers, and manage a list of favorite users. The app supports both light and dark modes, as well as dynamic text for accessibility.
## Features

- **User Search**: Search for any GitHub user by their username from the search tab.
- **Followers List**: View a detailed list of followers for each user. Tap on a follower to see their profile information.
- **Favorites Management**: Mark users as favorites, allowing quick access from the favorites tab.
- **Dark Mode Support**: Enjoy a seamless experience in both light and dark modes.
- **Dynamic Text**: Adjusts to the user’s preferred text size for an accessible experience.

## Screenshots

<img src="https://github.com/user-attachments/assets/dc46339a-d922-4186-ac1d-9fb126e496c7" width = "200">
<img src="https://github.com/user-attachments/assets/138c2900-0b00-4efd-8517-1239a97c45f9" width = "200">
<img src="https://github.com/user-attachments/assets/954d9472-8f1d-4d13-abf6-2e08cd38b5fd" width = "200">
<img src="https://github.com/user-attachments/assets/83cac18f-e07d-4978-8353-b7436865fcda" width = "200">
<img src="https://github.com/user-attachments/assets/f1babe48-c26c-4714-880b-e55b91c79dcd" width = "200">
<img src="https://github.com/user-attachments/assets/69671315-c2cf-4a60-81ef-0312de024ccf" width = "200">
<img src="https://github.com/user-attachments/assets/f4173a6a-2f06-49ed-9a27-151ab57ae1f4" width = "200">

## Requirements

- iOS 16.0+
- Xcode 14.0+
- Swift 5.7+

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/github-user-finder.git
   ```
2. Open the project in Xcode:
   ```bash
   cd github-user-finder
   open GitHubUserFinder.xcodeproj
   ```
3. Build and run the app on your simulator or connected device.

## How It Works

- **Search Screen**: Search for GitHub users by entering a username. Tap a user to navigate to their followers list.
- **Followers List**: Shows all followers for the selected user. Tap any follower to view their profile, including repositories, followers, and following counts.
- **Favorites Tab**: Mark any user as a favorite for quick access. Access all saved users from the Favorites tab.

## Tech Stack

- **UIKit & SwiftUI**: UIKit is used for view controllers, with SwiftUI for reusable components.
- **Networking**: Fetches data using `URLSession`.
- **Persistence**: Uses `UserDefaults` to store and retrieve favorite users.
  
## Future Enhancements

- **Enhanced Persistence**: Integrate CoreData or an alternative database for managing user data more effectively.
- **Improved User Interface**: Additional animations and profile details for an enriched experience.

