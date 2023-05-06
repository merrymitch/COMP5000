# COMP6000 Semester Project
### Members: Emma Ingram, Derius Knight, Wyatt LeMaster: github(earpboy1064), Mary Mitchell, Nan Yang

### Introduction
For our project, we would like to develop a website that can connect local members of the community to other people in the area with similar interests. The website would allow a user to create an account, input their interests, and see nearby users with similar interests as well as their contact information so they can connect.<br><br>
Local groups that meet for various activities, such as pickleball, disc golf, running, baking, or any other activity, can post their meeting on the Meetings page. The website will suggest meetings to new users and also allow them to create a new event if they don’t find one that meets their interests. We also plan to recommend new activities, based on overlapping interests with people in the community.


### Proposal
The website will be developed for the Auburn community. There will be various pages for users to interact with.
Design Requirements:
* Create account page: for new users to create an account
* Login page: for existing users to log in to their account
* Interests page: for existing users to add their interests to their profile
* Community page: for existing users to view other users in the community with similar interests
* Recommendations page: for existing users to view recommendations based on shared interests with other people in the community
* Meetings page: for groups to post their event details
* We will need a database to store the users’ account information.

Development Requirements:
* XML: to store the data
* JSP: to implement login functionality, …
* MySql: to create the database


### Development Roles:
* Emma Ingram - XML/JSP
* Derius Knight - XML/MySQL
* Wyatt Lemaster - JSP/Unit testing
* Mary Mitchell - JSP/MySQL
* Nan Yang - XML/MySQL

## Post-completion discussion 
The website has the following pages:
* Home page (index.jsp) that allows the user to access the login/register find a friend and find a group as well as each groups home page
* a home page for all 24 groups. The homepages are generated using the file GroupPageTemplate.jsp with the data being fetched from the XML file group.xml
* a login page that creates confirms with the database the user exists then makes a session with the user data
* a logout servlet, while not a jsp page it invalidates the user's session when pressed
* register page, it allows the user to input a unique username and password followed by their email, first name, and last name and they can check all a box for every activity they have an interest in
* a recommend friend page that returns every user that has a similar activity interest including the # of shared activity interests as well as their email for contacting
*  a group recommendation page that shows the user what groups they might be interested in based on their chosen activities. 

## Potential future updates:
* allowing the users to join groups 
* allowing the users to save their chosen friends
* further error handling.
