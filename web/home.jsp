<%-- 
    Document   : home
    Created on : 26-May-2024, 10:39:16 am
    Author     : sunil
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .about-section {
            background-color: #f2f2f2;
            padding: 50px 0;
            text-align: center;
        }
        .contact-section {
            padding: 50px 0;
            text-align: center;
        }
        .contact-section h2 {
            margin-bottom: 30px;
        }
        
        
        
    </style>
</head>
<body>
    <!-- Bootstrap Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Flight Booking System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#about"><b>About Us</b></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#contact"><b>Contact Us</b></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp"><b>Login</b></a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Carousel -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval = "2500">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="https://ddgimgs-f43e.kxcdn.com/1898682/ertjn4_3ed0771388b604956e7fad3e9485beef168c9f94.jpg" alt="First slide"style ="height:600px;">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="https://wallpaper.forfun.com/fetch/f6/f6afa4b8def29ec048fb347eb07254c6.jpeg" alt="Second slide"style ="height:600px;" >
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="https://static.vecteezy.com/system/resources/previews/027/747/050/large_2x/airplane-taking-off-at-dusk-flying-towards-a-beautiful-sunset-generated-by-ai-free-photo.jpg" alt="Third slide"style ="height:600px;">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- About Us Section -->
    <div id="about" class="about-section">
        <div class="container">
            <h2>About Us</h2>
            <p align="left">
                Welcome to SkyQuest, your trusted partner in hassle-free flight bookings and travel experiences.<br>

At SkyQuest, we're passionate about simplifying the process of booking flights and providing exceptional travel services to our customers. Whether you're planning a leisure trip, a business journey, or a spontaneous adventure, we're here to make your travel dreams a reality.

Our team consists of dedicated professionals with extensive experience in the aviation and travel industry. We understand the importance of seamless travel arrangements and strive to exceed your expectations at every step of your journey.

What sets us apart is our commitment to delivering personalized service tailored to your unique needs. From finding the best deals on flights to assisting with itinerary planning and offering expert travel advice, we're here to ensure that your travel experience is smooth, efficient, and memorable.

<br>With a user-friendly interface and a wide range of flight options from leading airlines around the globe, SkyQuest empowers you to book your flights with ease and confidence. Whether you prefer browsing through our website or accessing our services through our mobile app, we're always just a click away.

<br>We believe that travel has the power to enrich lives and broaden horizons. That's why we're dedicated to providing you with the tools and support you need to explore the world and create unforgettable memories.

Thank you for choosing SkyQuest for your travel needs. We look forward to being your trusted partner in all your future adventures.
            </p><p>
<br>Happy travels!

<br>SkyQuest Team
            </p>
        </div>
    </div>

    <!-- Contact Us Section -->
    <div id="contact" class="contact-section">
        <div class="container">
            <h2>Contact Us</h2>
            <p>If you have any inquiries or need assistance, feel free to contact us at support@flightbookingsystem.com or call us at +1-123-456-7890.</p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
