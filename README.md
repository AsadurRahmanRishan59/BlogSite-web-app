# Blog Site

## Overview
This project is a dynamic blog site where users can create accounts, write and publish blog posts, read posts from others, and interact through likes and comments. Users can also edit their profiles and manage their blog posts.

## Features
- **User Authentication**: Users can sign up, log in, and manage their profiles.
- **Create Blogs**: Authenticated users can write, publish, and manage their blog posts.
- **Read Blogs**: All users can browse and read blog posts.
- **Like Posts**: Users can like blog posts to show their appreciation.
- **Comment on Posts**: Users can leave comments on blog posts.
- **Delete Blog Posts**: Users can delete their own blog posts.
- **Edit Profile**: Users can update their profile information.

## Technologies Used
- **Frontend**: HTML, CSS, Bootstrap
- **Backend**: JSP, Servlets
- **Database**: MySQL
- **JDBC**: For database connectivity

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/AsadurRahmanRishan59/BlogSite-web-app.git
   ```
   
2. **Navigate to the project directory**
   ```bash
   cd BlogSite-web-app
   ```

3. **Setup Database**
   - Create a MySQL database named `blog_site`.
   - Run the provided SQL scripts to create the necessary tables.
   - Update the database configuration in your project's `db.properties` or `context.xml` file.
   
   Example `db.properties`:
   ```properties
   jdbc.url=jdbc:mysql://localhost:3306/blog_site
   jdbc.username=root
   jdbc.password=root
   jdbc.driverClassName=com.mysql.cj.jdbc.Driver
   ```

4. **Configure Your Servlet Container**
   - Deploy the project to your preferred servlet container (e.g., Apache Tomcat).
   - Ensure that your `web.xml` is correctly configured for your servlets.

5. **Run the application**
   - Start your servlet container.
   - Access the application at `http://localhost:8080/index.jsp`.

## Usage
- **Sign Up**: Create a new account to start writing and interacting with blogs.
- **Log In**: Access your dashboard to manage your blogs and profile.
- **Create a Blog**: Write and publish new blog posts.
- **Interact with Blogs**: Like and comment on posts that interest you.
- **Manage Your Blogs**: Edit or delete your posts from the user dashboard.
- **Update Your Profile**: Edit your profile details and change your password.


