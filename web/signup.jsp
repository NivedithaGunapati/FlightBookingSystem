<!DOCTYPE html>
<html>
<head>
    <title>Signup Page</title>
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
            color: white; /* Text color set to white */
        }
        .welcome-msg {
             position: absolute;
            top: 50px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 24px;
            animation: moveRight 5s linear infinite;
            color: #f5f8fc; /* Text color set to #f5f8fc */
            font-weight: bold; /* Adjust duration as needed */
        }
        @keyframes moveRight {
            30% { left: 30; }
            60% { left: 60%; }
        }
        .card {
            width: 300px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #626873; /* Background color set to #626873 */
            margin-bottom: 15px; /* Added margin bottom */
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
        input[type="password"],
        input[type="email"] {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            background-color: #626873; /* Background color set to #626873 */
            color: white; /* Text color set to white */
        }
        input[type="submit"] {
            padding: 10px;
            border: none;
            background-color: #2e4c7e; /* Reverted back to previous color #007bff */
            color: white; /* Text color set to white */
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        p {
            text-align: center;
            margin-top: 10px;
        }
        p a {
            color: #458cff; /* Color set to #366dc7 */
            text-decoration: none;
        }
        .card input[type="text"],
        .card input[type="password"],
        .card input[type="email"] {
            background-color: #b3bbc7; /* Columns inside the card set to grey */
            color: white; /* Text color set to white */
        }
    </style>
</head>
<body>
    <div class="welcome-msg">Welcome to SkyQuest Airlines</div>
    <div class="card">
        <h2 align="center">Signup</h2>
        <form action="SignupServlet" method="post">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            Email: <input type="email" name="email" required><br>
            <input type="submit" value="Sign Up">
        </form>
        <p>Already have an account? <a href="login.jsp">Login</a></p>
    </div>
</body>
</html>
