<%-- WebContent/report_form.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Criteria</title>
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
        min-height: 100vh;
        margin: 0;
        overflow-x: hidden; /* Prevent body scrollbar from background animation */
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

    /* Container - Elegant Frosted Glass */
    .container {
        background-color: rgba(255, 255, 255, 0.98); /* Almost opaque for clarity */
        padding: 3rem; /* Generous padding */
        border-radius: 1.8rem; /* Softer, more modern rounding */
        box-shadow: 0 18px 45px rgba(0, 0, 0, 0.18); /* Deeper, refined shadow */
        width: 100%;
        max-width: 700px; /* Max width for the form */
        text-align: center;
        position: relative;
        z-index: 10;
        transition: transform 0.4s cubic-bezier(0.25, 0.8, 0.25, 1), box-shadow 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
        border: 3px solid rgba(255, 255, 255, 0.9); /* More prominent, clean white border */
        box-sizing: border-box;
        backdrop-filter: blur(15px); /* Stronger frosted glass effect */
        -webkit-backdrop-filter: blur(15px); /* For Safari */
    }
    .container:hover {
        transform: translateY(-8px); /* More pronounced lift */
        box-shadow: 0 28px 65px rgba(0, 0, 0, 0.25);
    }

    /* Decorative flourishes for container - Subtle and integrated */
    .container::before, .container::after {
        content: '';
        position: absolute;
        width: 55px;
        height: 55px;
        border-radius: 50%;
        opacity: 0.7;
        filter: blur(22px);
        z-index: -1;
        animation: floatingBlob 11s infinite ease-in-out;
    }
    .container::before {
        top: -28px;
        left: -28px;
        background: #FFD54F; /* Soft amber blob */
        animation-delay: 0s;
    }
    .container::after {
        bottom: -28px;
        right: -28px;
        background: #81C784; /* Muted green blob */
        animation-delay: 2.5s;
    }
    @keyframes floatingBlob {
        0%, 100% { transform: translate(0, 0) scale(1); }
        50% { transform: translate(18px, 18px) scale(1.05); }
    }

    /* Heading - Professional Gradient Text */
    h1 {
        margin-bottom: 2rem; /* Adequate margin below heading */
        font-size: 2.8rem; /* Impactful font size */
        font-weight: 800; /* Extra bold */
        letter-spacing: -0.04em; /* Slightly tighter letter spacing */
        text-shadow: 3px 3px 8px rgba(0,0,0,0.2); /* Deeper text shadow */
        /* Professional gradient: deep blue to vibrant purple */
        background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: headingShine 5s infinite alternate; /* Gentle shine */
        line-height: 1.2;
    }
    @keyframes headingShine {
        0% { filter: brightness(100%); }
        100% { filter: brightness(115%); }
    }

    /* Form Group Styling */
    .form-group {
        margin-bottom: 1.5rem; /* Adequate margin between form groups */
        text-align: left;
    }
    label {
        display: block;
        margin-bottom: 0.6rem; /* Space below label */
        font-weight: 600;
        color: #283593; /* Deep indigo label color */
        font-size: 1rem; /* Standard label font size */
        text-shadow: 0.5px 0.5px 1px rgba(0,0,0,0.05);
    }
    input[type="number"],
    input[type="text"],
    select {
        width: 100%;
        padding: 0.9rem 1.2rem; /* Generous padding for inputs */
        border: 2px solid #BBDEFB; /* Light blue border */
        border-radius: 0.8rem; /* Consistent rounding */
        box-sizing: border-box;
        font-size: 0.95rem; /* Readable input font size */
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
        box-shadow: inset 0 1px 4px rgba(0,0,0,0.08); /* Subtle inner shadow */
        outline: none;
        color: #424242;
        background-color: #fefefe;
        -webkit-appearance: none; /* Remove default select arrow on some browsers */
        -moz-appearance: none;
        appearance: none;
    }
    input[type="number"]:focus,
    input[type="text"]:focus,
    select:focus {
        border-color: #2196F3; /* Professional blue focus ring */
        box-shadow: 0 0 0 5px rgba(33, 150, 243, 0.3); /* Prominent, clean focus glow */
    }
    select {
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%232196F3'%3E%3Cpath d='M7 10l5 5 5-5z'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 1rem center;
        background-size: 1.2rem;
        padding-right: 2.5rem; /* Make space for the custom arrow */
    }

    /* Buttons - Professional & Distinct */
    .btn {
        background: linear-gradient(135deg, #00C853, #64DD17); /* Vibrant Green for primary action */
        color: white;
        padding: 1rem 2rem; /* Generous padding */
        border-radius: 0.8rem; /* Consistent rounding */
        text-decoration: none;
        font-weight: 700;
        font-size: 1.05rem; /* Clearer text */
        transition: all 0.35s ease; /* Smoother transitions */
        cursor: pointer;
        border: none;
        display: inline-block;
        margin-top: 2rem; /* Adequate space above primary button */
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15); /* Enhanced shadow */
        text-shadow: 1px 1px 3px rgba(0,0,0,0.15);
    }
    .btn:hover {
        background: linear-gradient(135deg, #64DD17, #00C853);
        transform: translateY(-4px) scale(1.02);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
    }
    .btn:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .btn-secondary {
        background: linear-gradient(135deg, #9E9E9E, #616161); /* Muted Grey for secondary buttons */
        color: white;
        margin-left: 1rem; /* Clear separation */
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    .btn-secondary:hover {
        background: linear-gradient(135deg, #616161, #9E9E9E);
        transform: translateY(-4px) scale(1.02);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.18);
    }
    .btn-secondary:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.08);
    }

    /* Message Display - Clear and Themed */
    .message {
        margin-top: 1.5rem;
        margin-bottom: 1.5rem;
        padding: 0.9rem;
        border-radius: 0.7rem;
        font-weight: 600;
        text-align: center;
        font-size: 0.95rem;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
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

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .container {
            padding: 2rem;
            border-radius: 1.5rem;
            max-width: 90%;
        }
        h1 {
            font-size: 2.2rem;
            margin-bottom: 1.5rem;
        }
        .form-group {
            margin-bottom: 1.2rem;
        }
        label {
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
        }
        input[type="number"],
        input[type="text"],
        select {
            padding: 0.8rem 1rem;
            font-size: 0.9rem;
        }
        .btn, .btn-secondary {
            padding: 0.9rem 1.8rem;
            font-size: 1rem;
            margin-top: 1.8rem;
            display: block; /* Stack buttons on smaller screens */
            width: 100%;
            margin-left: 0;
            margin-top: 1rem; /* Space between stacked buttons */
        }
        .message {
            padding: 0.8rem;
            font-size: 0.9rem;
        }
    }

    @media (max-width: 480px) {
        .container {
            padding: 1.5rem;
            border-radius: 1.2rem;
            max-width: 95%;
        }
        h1 {
            font-size: 1.8rem;
            margin-bottom: 1.2rem;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        label {
            font-size: 0.85rem;
            margin-bottom: 0.4rem;
        }
        input[type="number"],
        input[type="text"],
        select {
            padding: 0.7rem 0.9rem;
            font-size: 0.85rem;
        }
        .btn, .btn-secondary {
            padding: 0.8rem 1.5rem;
            font-size: 0.9rem;
            margin-top: 0.8rem;
        }
        .message {
            padding: 0.7rem;
            font-size: 0.85rem;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <%
            String reportType = request.getParameter("reportType");
            String title = "Generate Report";
            String formAction = "ReportCriteriaServlet"; // All forms submit to this servlet
            
            // Set specific title and hidden input based on reportType
            if ("marksAbove".equals(reportType)) {
                title = "Students with Marks Above Threshold"; // Slightly refined wording
            } else if ("marksBySubject".equals(reportType)) {
                title = "Student Marks by Subject"; // Slightly refined wording
            } else if ("topNStudents".equals(reportType)) {
                title = "Top N Students by Marks"; // Slightly refined wording
            } else {
                // Default or error case
                reportType = "unknown"; // Set a default/fallback
                title = "Invalid Report Type Selected"; // More descriptive error title
            }
        %>

        <h1 style="
            margin-bottom: 2rem; /* Consistent with CSS value */
            font-size: 2.8rem; /* Consistent with CSS value */
            font-weight: 800;
            letter-spacing: -0.04em;
            text-shadow: 3px 3px 8px rgba(0,0,0,0.2);
            background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1.2;
        "><%= title %></h1>

        <%-- Display any messages from the servlet --%>
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

        <form action="<%= formAction %>" method="get" class="mt-8">
            <input type="hidden" name="reportType" value="<%= reportType %>">

            <% if ("marksAbove".equals(reportType)) { %>
                <div class="form-group">
                    <label for="minMarks">Minimum Marks:</label>
                    <input type="number" id="minMarks" name="minMarks" placeholder="e.g., 75" required min="0" max="100">
                </div>
            <% } else if ("marksBySubject".equals(reportType)) { %>
                <div class="form-group">
                    <label for="subjectName">Subject Name:</label>
                    <input type="text" id="subjectName" name="subjectName" placeholder="e.g., Math, Science" required>
                </div>
            <% } else if ("topNStudents".equals(reportType)) { %>
                <div class="form-group">
                    <label for="nValue">Number of Top Students (N):</label>
                    <input type="number" id="nValue" name="nValue" placeholder="e.g., 5" required min="1" max="100">
                </div>
            <% } else { %>
                <p class="text-red-600 font-semibold mt-4">Invalid report type selected. Please return to the reports menu.</p>
            <% } %>

            <% if (!"unknown".equals(reportType)) { %>
                <button type="submit" class="btn">Generate Report</button>
            <% } %>
            <a href="ReportServlet" class="btn btn-secondary">Back to Reports Menu</a>
        </form>
    </div>
</body>
</html>