# Project Management App

This app is created to conviniently manage projects. Many-to-many relationships has been built using Java Spring Tool Suite 4 and MySQL. User password has been encrypted with Bcrypt and hashed for security reasons. Validationsa are used for all forms. Top table includes all the projects the logged in user is not a part of. Bottom table includes all the projects the user is involved in. User is only able to edit projects for which they are the team lead. The full CRUD functionallity is available for the user.
- Deployed using AWS EC2
- Finished in 3 days

# Usage
- Use STS4 to open the project 
- Create an empty MySQL schema called "projectManager", and change the spring.datasource.password to your password.
- Run as Spring Boot App

# Wireframe and basic functions
![1632343141__ProjectManagerBeltReview](https://user-images.githubusercontent.com/74885386/137604082-4fda8d5a-99fb-446f-8621-607903ec3034.png)
