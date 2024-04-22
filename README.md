# Park Guardian Mobile Application:

London is a surprisingly green city, with around 3,000 parks. However, maintaining the health and beauty of these vital spaces presents ongoing challenges.
While enjoying the park, it's worth considering how we can contribute to and enhance our parks and green spaces, and ways to get involved.
To help people take care of their favourite parks, a mobile application for reporting environmental issues offers a promising solution. 
This app would make it easy to quickly report environmental concerns, and it would also encourage people to actively look after their surroundings.


## Application Features and Functions 

### Flutter App Structure: Widget tree

![image](https://github.com/ucfnchb/ParkGuardian/assets/146333771/07df2f81-1579-4e13-9798-df689e99d4cd)


### Report Issue Page
Main function: allows user to report environmental issue around them or they may concern based on their current location, to detail specific issues in a park or area they are currently at. 

Google Map: reports issue with google map insert and get the user’s current location. 
Display the user’s location on the map 

![image](https://github.com/ucfnchb/ParkGuardian/assets/146333771/927da34a-409a-4cec-8625-4ff4670e6996)


### Issue Detail Page
Allows users to fill in the issue details and submit an issue they have encountered.

Report location :location retrieved from Report Issue page. (current latitude and longitude)

![image](https://github.com/ucfnchb/ParkGuardian/assets/146333771/b7a8fedb-3a94-449b-bde4-98989bd54108)


### Issue Detail Page
1. Issue category:  dropdown button list to select the issue
   
2. Issue description: Text field for user to descript the issue
   
3. Email: Text field for user to enter email for contact or follow up


![image](https://github.com/ucfnchb/ParkGuardian/assets/146333771/dc55ca57-1588-4d1c-86e9-91fda4326585)


### Issue Detail Page
Save button: validation to ensure user has filled in all fields.

- Validation fail: an error message prompting the user to complete all fields

 - Validation success:  a success message is displayed and save the report. Saved using Hive, local database/storage solution.

![image](https://github.com/ucfnchb/ParkGuardian/assets/146333771/5fd69063-f19f-4888-a742-621b3d5d590a)


### Report Page
Show a list of reports. User can view a summarised detail of each report they submitted in a list. 

Function/ Navigation:  Navigate a detailed view (ItemDetail page) 

![image](https://github.com/ucfnchb/ParkGuardian/assets/146333771/118212bd-60b0-448b-9919-ccbcb5f84f78)


### Item Detail Page
Upon tapping a submitted report, show detailed issue information

![image](https://github.com/ucfnchb/ParkGuardian/assets/146333771/d319dd21-db6a-4b7b-9401-8a65f1bdd6cf)


## Future Features and Development
As Park Guardian continues to evolve, I plan to enhance the application with new features that will further improve the user experience and expand the app's functionality.

1. Photo Uploads: Allow users to upload photos with their reports to provide visual evidence of the issues, enhancing the verification process for local authorities.
2. Integration of Firebase and Cloud Firestore
- User Account Management: Implement Firebase Authentication to manage user registrations and logins securely. This feature will allow users to create personal accounts to track their reports, participate in community events, and receive updates directly.
- Report Management with Cloud Firestore: Utilize Cloud Firestore to store and manage environmental reports submitted by users

These planned features aim to make Park Guardian not just a tool for reporting environmental issues but a platform that fosters a proactive, engaged, and environmentally conscious community. 





