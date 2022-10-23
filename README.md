Emissi0n - README 
===

# Emissi0n 

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Estimates carbon emission based on vehicle type and distance travelled to reduce global warming.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Transportation/Enviroment
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer or smart watch. 
- **Story:** calculates user's emission and summerizes users emission pattern
- **Market:** vehicle owners in particular but anyone can use it
- **Habit:** users would preferably enter every time they travelled
- **Scope:** Calculate users emission and give emission summary. Then perhaps integrate with maps/directions apps such as google maps, apple map or waze to reduece carbon emission.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User login page
* Profile page 
    * emission history
    * personal information (i.e. car type)
* Calculator page
    * User enters information 
* Results page

**Optional Nice-to-have Stories**

* Alternative transportation methods
    * calculate emissions saved (e.g., biking, carpool, public transportation)
* Various vehicles to choose from (make/model)
* GPS logs distance traveled (no need for input, calculation is automatic)
* TBD . . .

### 2. Screen Archetypes

* Login
   * User enters their login credentials
   * Once logged in, they will automatically be sent to the home screen upon opening the app 
* Register
   * User will register and create an account
* Weekly Summary
   * Displays report on this weeks emissions
   * Daily emissions
   * total emissions for the week
* History Screen
   * Displays history of emissions
   * Daily emissions
* Calculator page
    * User enters information 
        * select vehicle type (electric, sedan, suv, etc.)
        * enter milage traveled
* Results page
    * displays the calculated emissions result



### 3. Navigation

**Tab Navigation** (Tab to Screen)

* login/register
* Add a vehicle
* History

**Flow Navigation** (Screen to Screen)

* Forced login, otherwise account creation
* Jumps to weekly summary
   * can go to history from this page
   * can also go to login/register page

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
