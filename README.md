# README
"Ray7 Task"
In Raye7, Users have 2 roles (Driver and Passenger), drivers are able to create trips while passenger are able to create pickups therefore they match,

We have 4 main objects:

User:
Name[Unique]
Email[Unique]
Phone Number[Unique]
Role(Driver ,Passenger)

Place:
Name[Unique]
Longitude
Latitude[both longitude and latitude are unique together]

Trip:
Driver[User]
Source[Place]
Destination[Place]
Departure Time
Number of seats[more than or equal 3 ]

Pickup:
Passenger[User]
Source[Place]
Destination[Place]
Departure Time

Steps:
Create an authentication system for users using devise.
after signing in, if user is a driver redirect to driver home page, and if the user is a passenger redirect to passenger home page.
Driver home screen contain a form to create new trips and a list with all his/her trips and he/she can delete trips.
Passenger home screen contain a form to create a new pickup and a list with his/her all pickups and he/she can delete pickups.

Conditions:
Drivers only who can create trips.
Passenger only who can create pickups
Departure time can't be in the past for both trips and pickups.

Deliverable:
Source Code on a github/bitbucket repo
Unit Tests for models and controllers using RSpec and Shoulda Matchers
Request Tests [EXTRA]


if i had a more time i would improve the layouts and designs, improve unit tests, and try in Request Tests
