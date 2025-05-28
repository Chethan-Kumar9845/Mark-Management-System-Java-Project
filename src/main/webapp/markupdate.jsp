<%-- WebContent/markupdate.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Mark</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
    /* Global Styles & Background - Consistent Professional Palette */
    body {
        font-family: 'Quicksand', sans-serif; /* Consistent professional font */
        background: linear-gradient(135deg, #a1c4fd, #c2e9fb, #a7e0f8, #c3f2d2, #d1c4e9);
        background-size: 500% 500%;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        padding: 20px;
        box-sizing: border-box;
        overflow-x: hidden;
        color: #333;
        animation: professionalGradientBackground 25s ease infinite alternate;
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
        background-color: rgba(255, 255, 255, 0.98);
        padding: 2rem; /* Reduced padding further */
        border-radius: 1.5rem; /* Slightly smaller border-radius for more compact look */
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15); /* Adjusted shadow */
        width: 100%;
        max-width: 700px; /* Reduced max-width for a more compact form */
        text-align: center;
        position: relative;
        z-index: 10;
        transition: transform 0.4s cubic-bezier(0.25, 0.8, 0.25, 1), box-shadow 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
        border: 2px solid rgba(255, 255, 255, 0.9); /* Slightly thinner border */
        box-sizing: border-box;
        backdrop-filter: blur(12px); /* Slightly less blur for sharper look */
        -webkit-backdrop-filter: blur(12px);
    }
    .container:hover {
        transform: translateY(-6px); /* Slightly less lift on hover */
        box-shadow: 0 28px 65px rgba(0, 0, 0, 0.22); /* Adjusted hover shadow */
    }

    /* Decorative flourishes for container (kept similar, but adjust if they feel too big for smaller container) */
    .container::before, .container::after {
        content: '';
        position: absolute;
        width: 50px; /* Slightly smaller blobs */
        height: 50px;
        border-radius: 50%;
        opacity: 0.6; /* Slightly less opaque */
        filter: blur(20px); /* Slightly less blur */
        z-index: -1;
        animation: floatingBlob 10s infinite ease-in-out; /* Slightly faster animation */
    }
    .container::before {
        top: -25px;
        left: -25px;
        background: #FFCC80; /* Lighter yellow/orange */
        animation-delay: 0s;
    }
    .container::after {
        bottom: -25px;
        right: -25px;
        background: #A5D6A7; /* Lighter green */
        animation-delay: 2s;
    }
    @keyframes floatingBlob {
        0%, 100% { transform: translate(0, 0) scale(1); }
        50% { transform: translate(15px, 15px) scale(1.03); } /* Smaller movement */
    }

    /* Heading - Professional Gradient Text */
    h1 {
        margin-bottom: 1.5rem; /* Reduced margin */
        font-size: 2.5rem; /* Reduced font size */
        font-weight: 800;
        letter-spacing: -0.04em; /* Slightly tighter letter spacing */
        text-shadow: 3px 3px 8px rgba(0,0,0,0.15); /* Slightly less pronounced shadow */
        background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: headingShine 5s infinite alternate;
        line-height: 1.1;
    }
    @keyframes headingShine {
        0% { filter: brightness(100%); }
        100% { filter: brightness(115%); }
    }

    /* Form Group Styling */
    .form-group {
        margin-bottom: 1rem; /* Reduced margin */
        text-align: left;
    }
    label {
        display: block;
        margin-bottom: 0.4rem; /* Reduced margin */
        font-weight: 600;
        color: #283593;
        font-size: 0.9rem; /* Reduced font size */
        text-shadow: 0.5px 0.5px 1px rgba(0,0,0,0.03); /* Subtle shadow */
    }
    input[type="text"],
    input[type="number"],
    input[type="date"] {
        width: 100%;
        padding: 0.7rem 1rem; /* Reduced padding */
        border: 1px solid #BBDEFB; /* Thinner border */
        border-radius: 0.6rem; /* Slightly smaller border-radius */
        box-sizing: border-box;
        font-size: 0.88rem; /* Reduced font size */
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
        box-shadow: inset 0 1px 3px rgba(0,0,0,0.06); /* Subtle inner shadow */
        outline: none;
        color: #424242;
        background-color: #fefeff; /* Slightly off-white background */
    }
    input[type="text"]:focus,
    input[type="number"]:focus,
    input[type="date"]:focus {
        border-color: #4CAF50; /* Green focus ring for update context */
        box-shadow: 0 0 0 4px rgba(76, 175, 80, 0.25); /* Slightly smaller focus shadow */
    }

    /* Styling for read-only input */
    input[readonly] {
        background-color: #E3F2FD; /* A slightly more pronounced light blue for read-only */
        border-color: #90CAF9; /* Slightly darker border for contrast */
        color: #5C6BC0; /* A pleasant blue for read-only text */
        cursor: not-allowed;
    }

    /* Buttons - Professional & Distinct */
    .btn {
        color: white;
        padding: 0.8rem 1.6rem; /* Reduced padding */
        border-radius: 0.7rem; /* Slightly smaller border-radius */
        text-decoration: none;
        font-weight: 600; /* Slightly lighter font-weight for smaller buttons */
        font-size: 0.95rem; /* Reduced font size */
        transition: all 0.3s ease; /* Slightly faster transition */
        cursor: pointer;
        border: none;
        display: inline-block;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Reduced shadow */
        text-shadow: 0.5px 0.5px 2px rgba(0,0,0,0.1); /* Subtle text shadow */
    }
    .btn:hover {
        transform: translateY(-3px) scale(1.01); /* Reduced lift on hover */
        box-shadow: 0 7px 18px rgba(0, 0, 0, 0.18); /* Adjusted hover shadow */
    }
    .btn:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.08);
    }

    .btn-primary {
        background: linear-gradient(135deg, #4CAF50, #2E7D32); /* Deep Green for primary update action */
    }
    .btn-primary:hover {
        background: linear-gradient(135deg, #2E7D32, #4CAF50);
    }

    .btn-secondary {
        background: linear-gradient(135deg, #78909C, #546E7A); /* Darker grey for secondary */
        margin-left: 0.8rem; /* Reduced margin */
    }
    .btn-secondary:hover {
        background: linear-gradient(135deg, #546E7A, #78909C);
    }

    .button-group {
        display: flex;
        justify-content: center;
        gap: 0.8rem; /* Reduced gap */
        margin-top: 1.5rem; /* Reduced margin */
        flex-wrap: wrap;
    }

    /* Message Display - Clear and Themed */
    .message {
        margin-top: 1rem; /* Reduced margin */
        margin-bottom: 1rem; /* Reduced margin */
        padding: 0.7rem; /* Reduced padding */
        border-radius: 0.6rem; /* Slightly smaller border-radius */
        font-weight: 600;
        text-align: center;
        font-size: 0.88rem; /* Reduced font size */
        box-shadow: 0 1px 6px rgba(0,0,0,0.06); /* Subtle shadow */
    }
    .message.success {
        background-color: #DCEDC8; /* Lighter green */
        color: #388E3C; /* Darker green text */
        border: 1px solid #8BC34A;
    }
    .message.error {
        background-color: #FFCDD2; /* Lighter red */
        color: #D32F2F; /* Darker red text */
        border: 1px solid #E57373;
    }

    /* Media Queries for Responsiveness (adjusted to new smaller base) */
    @media (max-width: 768px) {
        body {
            padding: 15px;
        }
        .container {
            padding: 1.8rem;
            border-radius: 1.2rem;
            max-width: 90%;
        }
        h1 {
            font-size: 2.2rem;
            margin-bottom: 1.2rem;
        }
        .form-group {
            margin-bottom: 0.9rem;
        }
        label {
            font-size: 0.85rem;
            margin-bottom: 0.35rem;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"] {
            padding: 0.65rem 0.9rem;
            font-size: 0.82rem;
        }
        .btn {
            padding: 0.75rem 1.4rem;
            font-size: 0.9rem;
        }
        .button-group {
            gap: 0.7rem;
            margin-top: 1.2rem;
        }
    }

    @media (max-width: 480px) {
        body {
            padding: 10px;
        }
        .container {
            padding: 1.2rem;
            border-radius: 1rem;
            max-width: 95%;
        }
        h1 {
            font-size: 1.8rem;
            margin-bottom: 1rem;
        }
        .form-group {
            margin-bottom: 0.7rem;
        }
        label {
            font-size: 0.8rem;
            margin-bottom: 0.25rem;
        }
        input[type="text"],
        input[type="number"],
        input[type="date"] {
            padding: 0.55rem 0.7rem;
            font-size: 0.78rem;
        }
        .btn {
            padding: 0.65rem 1.1rem;
            font-size: 0.8rem;
        }
        .button-group {
            flex-direction: column; /* Stack buttons vertically */
            gap: 0.5rem;
            margin-top: 1rem;
        }
        .btn-secondary { /* Adjust margin for stacked buttons */
             margin-left: 0;
        }
    }
</style>
</head>
<body>
    <%
        // Retrieve studentMark object, message, and messageType from request attributes
        StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
        String message = (String) request.getAttribute("message");
        String messageType = (String) request.getAttribute("messageType");

        // Format date if studentMark is not null
        String examDateFormatted = "";
        if (studentMark != null && studentMark.getExamDate() != null) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            examDateFormatted = formatter.format(studentMark.getExamDate());
        }
    %>

    <div class="container">
        <h1 style="
            margin-bottom: 1.5rem; /* Adjusted */
            font-size: 2.5rem; /* Adjusted */
            font-weight: 800;
            letter-spacing: -0.04em;
            text-shadow: 3px 3px 8px rgba(0,0,0,0.15); /* Adjusted */
            background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1.1;
        ">Update Student Mark</h1>

        <%-- Display message if available --%>
        <% if (message != null && !message.isEmpty()) { %>
            <div class="message <%= messageType %>">
                <%= message %>
            </div>
        <% } %>

        <%-- Display the form only if a studentMark object was successfully retrieved or if it's a submission with errors --%>
        <% if (studentMark != null) { %>
            <form action="updateMark" method="post" class="mt-8">
                <div class="form-group">
                    <label for="studentID">Student ID:</label>
                    <input type="number" id="studentID" name="studentID" value="<%= studentMark.getStudentID() %>" required readonly>
                </div>
                <div class="form-group">
                    <label for="studentName">Student Name:</label>
                    <input type="text" id="studentName" name="studentName" value="<%= studentMark.getStudentName() %>" placeholder="e.g., John Doe" required>
                </div>
                <div class="form-group">
                    <label for="subject">Subject:</label>
                    <input type="text" id="subject" name="subject" value="<%= studentMark.getSubject() %>" placeholder="e.g., Math, Science" required>
                </div>
                <div class="form-group">
                    <label for="marks">Marks:</label>
                    <input type="number" id="marks" name="marks" value="<%= studentMark.getMarks() %>" placeholder="e.g., 85" required min="0" max="100">
                </div>
                <div class="form-group">
                    <label for="examDate">Exam Date:</label>
                    <input type="date" id="examDate" name="examDate" value="<%= examDateFormatted %>" required>
                </div>
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">Update Mark</button>
                    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
                </div>
            </form>
        <% } else { %>
            <%-- If studentMark is null and there's an error message, show only the message and navigation buttons --%>
            <div class="button-group">
                <a href="DisplayMarksServlet" class="btn btn-primary">View All Marks</a>
                <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
            </div>
        <% } %>
    </div>
</body>
</html>