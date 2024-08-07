<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-image: url('https://images.playground.com/84e44d9d43004dd8b4d9acbe27b89b30.jpeg');
            background-size: cover;
            background-position: center;
            overflow: hidden;
            color: #f5f8fc; /* Text color set to #f5f8fc */
        }
        .welcome-msg {
            position: absolute;
            top: 50px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 24px;
            animation: moveRight 5s linear infinite;
            color: #f5f8fc; /* Text color set to #f5f8fc */
            font-weight: bold; /* Bold text */
        }
        @keyframes moveRight {
            0%, 100% { left: 50%; }
            50% { left: 60%; }
        }
        .card {
            width: 300px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #626873; /* Background color set to #626873 */
            color: white; /* Text color set to white */
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input[type="text"],
        input[type="password"] {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            background-color: rgba(255, 255, 255, 0.7);
            color: white; /* Text color set to white */
        }
        input[type="submit"] {
            padding: 10px;
            border: none;
            background-color: #40639c; /* Background color set to #40639c */
            color: #f5f8fc; /* Text color set to #f5f8fc */
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #2e4c7e; /* Darker shade for hover effect */
        }
        p {
            text-align: center;
            margin-top: 10px;
        }
        p a {
            color: #458cff; /* Color set to #366dc7 */
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="welcome-msg">Welcome to SkyQuest Airlines</div>
    <div class="card">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
        <p>Don't have an account ?.. <a href="signup.jsp">Sign Up</a></p>
    </div>
</body>
</html>
