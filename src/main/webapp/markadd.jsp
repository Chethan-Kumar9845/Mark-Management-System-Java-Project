<%-- WebContent/markadd.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student Marks</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
    /* Global Styles & Background - Consistent Professional Palette */
    body {
        font-family: 'Quicksand', sans-serif; /* Consistent professional font */
        /* A calmer, yet dynamic background: soft blues, subtle greens, gentle purples */
        background: linear-gradient(135deg, #a1c4fd, #c2e9fb, #a7e0f8, #c3f2d2, #d1c4e9);
        background-size: 500% 500%; /* For fluid, subtle animation */
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh; /* Ensures the body takes full viewport height for centering */
        margin: 0;
        padding: 15px; /* Generous page padding to prevent content from touching edges */
        box-sizing: border-box; /* Include padding in element's total width and height */
        overflow-x: hidden; /* Prevent horizontal scrollbar from background animation */
        color: #333;
        animation: professionalGradientBackground 25s ease infinite alternate; /* Slower, more elegant animation */
    }

    @keyframes professionalGradientBackground {
        0% { background-position: 0% 0%; }
        25% { background-position: 100% 0%; }
        50% { background-position: 100% 100%; }
        75% { background-position: 0% 100%; }
        100% { background-position: 0% 0%; }
    }

    /* Main Container - Elevated Frosted Glass */
    .container {
        background-color: rgba(255, 255, 255, 0.98); /* Almost opaque for clarity */
        padding: 2rem; /* Reduced padding for a more compact form */
        border-radius: 1.6rem; /* Softer, more modern rounding */
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.18); /* Refined shadow */
        width: 100%;
        max-width: 700px; /* **Further reduced max-width for a truly small form** */
        text-align: center;
        position: relative;
        z-index: 10;
       transition: transform 0.4s cubic-bezier(0.25, 0.8, 0.25, 1), box-shadow 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
        border: 3px solid rgba(255, 255, 255, 0.9); /* Prominent, clean white border */
        box-sizing: border-box; /* Include padding and border in element's total width and height */
        backdrop-filter: blur(14px); /* Stronger frosted glass effect */
        -webkit-backdrop-filter: blur(14px); /* For Safari */
    }
    .container:hover {
        transform: translateY(-7px); /* Noticeable lift */
        box-shadow: 0 28px 65px rgba(0, 0, 0, 0.25);
    }

    /* Decorative flourishes for container - Subtle and integrated */
    .container::before, .container::after {
        content: '';
        position: absolute;
        width: 50px; /* Reduced blob size */
        height: 50px; /* Reduced blob size */
        border-radius: 50%;
        opacity: 0.6;
        filter: blur(20px); /* Adjusted blur for smaller blobs */
        z-index: -1;
        animation: floatingBlob 10s infinite ease-in-out;
    }
    .container::before {
        top: -25px; /* Adjusted position for smaller blobs */
        left: -25px;
        background: #FFD54F; /* Soft amber blob */
        animation-delay: 0s;
    }
    .container::after {
        bottom: -25px; /* Adjusted position for smaller blobs */
        right: -25px;
        background: #81C784; /* Muted green blob */
        animation-delay: 2s;
    }
    @keyframes floatingBlob {
        0%, 100% { transform: translate(0, 0) scale(1); }
        50% { transform: translate(18px, 18px) scale(1.04); }
    }

    /* Heading - Professional Gradient Text */
    h1 {
        margin-bottom: 1.4rem; /* Adjusted margin below heading for better spacing */
        font-size: 2.4rem; /* **Further reduced font size for compact form** */
        font-weight: 800; /* Extra bold */
        letter-spacing: -0.04em; /* Slightly tighter letter spacing */
        text-shadow: 3px 3px 8px rgba(0,0,0,0.18); /* Refined shadow */
        /* Professional gradient: deep blue to vibrant purple */
        background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: headingShine 5s infinite alternate; /* Gentle shine */
        line-height: 1.1;
    }
    @keyframes headingShine {
        0% { filter: brightness(100%); }
        100% { filter: brightness(112%); }
    }

    /* Form Group Styling */
    .form-group {
        margin-bottom: 0.9rem; /* **Reduced margin between form groups for compactness** */
        text-align: left;
    }
    label {
        display: block;
        margin-bottom: 0.3rem; /* **Reduced space below label** */
        font-weight: 600;
        color: #283593; /* Deep indigo label color */
        font-size: 0.9rem; /* **Reduced label font size** */
        text-shadow: 0.5px 0.5px 1px rgba(0,0,0,0.03);
    }
    input[type="text"],
    input[type="number"],
    input[type="date"] {
        width: 100%;
        padding: 0.7rem 0.9rem; /* **Reduced padding for inputs** */
        border: 2px solid #BBDEFB; /* Light blue border */
        border-radius: 0.6rem; /* **Reduced rounding** */
        box-sizing: border-box;
        font-size: 0.85rem; /* **Reduced input font size** */
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
        box-shadow: inset 0 1px 3px rgba(0,0,0,0.06); /* Subtle inner shadow */
        outline: none;
        color: #424242;
        background-color: #fefefe;
    }
    input[type="text"]:focus,
    input[type="number"]:focus,
    input[type="date"]:focus {
        border-color: #2196F3; /* Professional blue focus ring */
        box-shadow: 0 0 0 4px rgba(33, 150, 243, 0.25); /* Clean focus glow */
    }

    /* Buttons - Professional & Distinct */
    .btn {
        background: linear-gradient(135deg, #00C853, #64DD17); /* Vibrant Green for primary action */
        color: white;
        padding: 0.8rem 1.6rem; /* **Adjusted padding for compactness** */
        border-radius: 0.6rem; /* **Consistent rounding** */
        text-decoration: none;
        font-weight: 700;
        font-size: 0.95rem; /* **Clearer text** */
        transition: all 0.35s ease; /* Smoother transitions */
        cursor: pointer;
        border: none;
        display: inline-block;
        margin-top: 1.5rem; /* Adequate space above primary button */
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.12); /* Enhanced shadow */
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    .btn:hover {
        background: linear-gradient(135deg, #64DD17, #00C853);
        transform: translateY(-3px) scale(1.01);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }
    .btn:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.08);
    }

    .btn-secondary {
        background: linear-gradient(135deg, #9E9E9E, #616161); /* Muted Grey for secondary buttons */
        color: white;
        margin-left: 0.7rem; /* **Reduced clear separation** */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        text-shadow: 1px 1px 1px rgba(0,0,0,0.08);
    }
    .btn-secondary:hover {
        background: linear-gradient(135deg, #616161, #9E9E9E);
        transform: translateY(-3px) scale(1.01);
        box-shadow: 0 7px 18px rgba(0, 0, 0, 0.15);
    }
    .btn-secondary:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    }

    /* Message Display - Clear and Themed */
    .message {
        margin-top: 1.2rem;
        margin-bottom: 1.2rem;
        padding: 0.7rem; /* Reduced padding */
        border-radius: 0.6rem;
        font-weight: 600;
        text-align: center;
        font-size: 0.85rem; /* Reduced font size */
        box-shadow: 0 1px 6px rgba(0,0,0,0.07);
    }
    .message.success {
        background-color: #E8F5E9; /* Light green background */
        color: #2E7D32; /* Deep green text */
        border: 1px solid #A5D6A7;
    }
    .message.error {
        background-color: #FFEBEE; /* Light red background */
        color: #C62828; /* Deep red text */
        border: 1px solid #EF9A9A;
    }

    /* Media Queries for Responsiveness */
    @media (max-width: 768px) {
        body {
            padding: 15px;
        }
        .container {
            padding: 1.8rem; /* Adjusted for tablets */
            border-radius: 1.5rem;
            max-width: 90%; /* Adjust max-width for smaller screens */
        }
        h1 {
            font-size: 2rem; /* Adjusted for tablets */
            margin-bottom: 1.5rem;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        label {
            font-size: 0.85rem;
            margin-bottom: 0.3rem;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"] {
            padding: 0.7rem 0.9rem;
            font-size: 0.85rem;
        }
        .btn, .btn-secondary {
            padding: 0.8rem 1.5rem;
            font-size: 0.9rem;
            margin-top: 1.5rem;
            display: block; /* Stack buttons on smaller screens */
            width: 100%;
            margin-left: 0; /* Remove left margin when stacked */
            margin-top: 0.8rem; /* Add space between stacked buttons */
        }
        .message {
            padding: 0.7rem;
            font-size: 0.8rem;
        }
    }

    @media (max-width: 480px) {
        body {
            padding: 10px; /* Even less padding for very small screens */
        }
        .container {
            padding: 1.5rem;
            border-radius: 1.2rem;
            max-width: 95%; /* Even smaller max-width for tiny screens */
        }
        h1 {
            font-size: 1.6rem; /* Adjusted for very small screens */
            margin-bottom: 1rem;
        }
        .form-group {
            margin-bottom: 0.8rem;
        }
        label {
            font-size: 0.75rem;
            margin-bottom: 0.2rem;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"] {
            padding: 0.6rem 0.8rem;
            font-size: 0.75rem;
        }
        .btn, .btn-secondary {
            padding: 0.7rem 1.2rem;
            font-size: 0.8rem;
            margin-top: 0.7rem;
        }
        .message {
            padding: 0.6rem;
            font-size: 0.75rem;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h1 style="
            margin-bottom: 1.4rem; /* Consistent with CSS value */
            font-size: 2.4rem; /* Consistent with CSS value */
            font-weight: 800;
            letter-spacing: -0.04em;
            text-shadow: 3px 3px 8px rgba(0,0,0,0.18);
            background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1.1;
        ">Add New Student Marks</h1>

        <%-- Display success or error message if available from servlet --%>
        <%
            String message = (String) request.getAttribute("message");
            String messageType = (String) request.getAttribute("messageType");
            if (message != null && !message.isEmpty()) {
        %>
                <div class="message <%= messageType %>">
                    <%= message %>
                </div>
        <%
           }
        %>

        <form action="addMark" method="post" class="mt-8">
            <div class="form-group">
                <label for="studentID">Student ID:</label>
                <input type="number" id="studentID" name="studentID" placeholder="e.g., 101" required>
            </div>
            <div class="form-group">
                <label for="studentName">Student Name:</label>
                <input type="text" id="studentName" name="studentName" placeholder="e.g., John Doe" required>
            </div>
            <div class="form-group">
                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" placeholder="e.g., Math, Science" required>
            </div>
            <div class="form-group">
                <label for="marks">Marks:</label>
                <input type="number" id="marks" name="marks" placeholder="e.g., 85" required min="0" max="100">
            </div>
            <div class="form-group">
                <label for="examDate">Exam Date:</label>
                <input type="date" id="examDate" name="examDate" required>
            </div>
            <button type="submit" class="btn">Add Mark</button>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </form>
    </div>
</body>
</html>