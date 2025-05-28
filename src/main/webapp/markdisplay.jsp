<%-- WebContent/displaymarks.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Student Marks</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
    /* Global Styles & Background - Consistent Professional Palette */
    body {
        font-family: 'Quicksand', sans-serif; /* Consistent professional font */
        /* A calmer, yet dynamic background: soft blues, subtle greens, gentle purples */
        background: linear-gradient(135deg, #a1c4fd, #c2e9fb, #a7e0f8, #c3f2d2, #d1c4e9);
        background-size: 500% 500%; /* For fluid, subtle animation */
        display: flex;
        flex-direction: column; /* Allows content to stack vertically */
        justify-content: flex-start; /* Aligns content to the top */
        align-items: center;
        min-height: 100vh;
        margin: 0;
        padding: 30px; /* Generous page padding */
        box-sizing: border-box;
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

    /* Main Container - Elevated Frosted Glass */
    .container {
        background-color: rgba(255, 255, 255, 0.98); /* Almost opaque for clarity */
        padding: 3.5rem; /* More generous padding */
        border-radius: 2.2rem; /* Softer, more modern rounding */
        box-shadow: 0 28px 70px rgba(0, 0, 0, 0.22); /* Deeper, refined shadow */
        width: 100%;
        max-width: 1200px; /* Wider container for table */
        text-align: center;
        position: relative;
        z-index: 10;
        margin-top: 2.5rem; /* Spacing from top of page */
        margin-bottom: 3.5rem; /* Spacing from bottom of page */
        transition: transform 0.4s cubic-bezier(0.25, 0.8, 0.25, 1), box-shadow 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
        border: 3px solid rgba(255, 255, 255, 0.9); /* More prominent, clean white border */
        box-sizing: border-box;
        backdrop-filter: blur(18px); /* Stronger frosted glass effect */
        -webkit-backdrop-filter: blur(18px); /* For Safari */
    }
    .container:hover {
        transform: translateY(-10px); /* More noticeable lift */
        box-shadow: 0 40px 90px rgba(0, 0, 0, 0.3);
    }

    /* Decorative flourishes for container - Subtle and integrated */
    .container::before, .container::after {
        content: '';
        position: absolute;
        width: 65px;
        height: 65px;
        border-radius: 50%;
        opacity: 0.7;
        filter: blur(28px);
        z-index: -1;
        animation: floatingBlob 12s infinite ease-in-out;
    }
    .container::before {
        top: -32px;
        left: -32px;
        background: #FFD54F; /* Soft amber blob */
        animation-delay: 0s;
    }
    .container::after {
        bottom: -32px;
        right: -32px;
        background: #81C784; /* Muted green blob */
        animation-delay: 3s;
    }
    @keyframes floatingBlob {
        0%, 100% { transform: translate(0, 0) scale(1); }
        50% { transform: translate(22px, 22px) scale(1.05); }
    }

    /* Heading - Professional Gradient Text */
    h1 {
        margin-bottom: 2.5rem; /* More space below heading */
        font-size: 3.8rem; /* Commanding font size */
        font-weight: 800;
        letter-spacing: -0.05em;
        text-shadow: 5px 5px 12px rgba(0,0,0,0.25); /* Deeper, more refined shadow */
        /* Professional gradient: deep blue to vibrant purple */
        background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: headingShine 5s infinite alternate; /* Gentle shine */
        line-height: 1.1; /* Improves readability for large text */
    }
    @keyframes headingShine {
        0% { filter: brightness(100%); }
        100% { filter: brightness(115%); }
    }

    /* Header Section (Title + Search Bar) */
    .header-section {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 3.5rem; /* More space below header section */
        flex-wrap: wrap; /* Allows wrapping on smaller screens */
        gap: 2rem; /* Generous gap */
    }

    /* Search Bar Styling */
    .search-bar {
        display: flex;
        align-items: center;
        gap: 1rem; /* More space between input and button */
    }
    .search-bar input[type="number"] {
        flex-grow: 1;
        max-width: 250px; /* Wider search input */
        padding: 0.9rem 1.2rem; /* More padding */
        border: 2px solid #BBDEFB; /* Light blue border */
        border-radius: 0.8rem; /* More rounded */
        font-size: 1rem;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
        box-shadow: inset 0 1px 4px rgba(0,0,0,0.08); /* Subtle inner shadow */
        outline: none;
        color: #424242;
        background-color: #fefefe;
    }
    .search-bar input[type="number"]:focus {
        border-color: #2196F3; /* Professional blue focus ring */
        box-shadow: 0 0 0 5px rgba(33, 150, 243, 0.3); /* Prominent, clean focus glow */
    }
    .search-bar .btn-search {
        background: linear-gradient(135deg, #2196F3, #1976D2); /* Professional Blue for Search button */
        color: white;
        padding: 0.9rem 1.8rem; /* Generous padding */
        border-radius: 0.8rem;
        font-weight: 700;
        cursor: pointer;
        border: none;
        transition: all 0.35s ease;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15); /* Stronger shadow */
        text-shadow: 1px 1px 3px rgba(0,0,0,0.15);
    }
    .search-bar .btn-search:hover {
        background: linear-gradient(135deg, #1976D2, #2196F3);
        transform: translateY(-4px); /* More lift */
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
    }
    .search-bar .btn-search:active {
        transform: translateY(0);
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
    }

    /* Table Styling */
    .table-container {
        overflow-x: auto; /* Enables horizontal scroll for table if too wide */
        margin-top: 2.5rem; /* Space above table */
        margin-bottom: 3rem; /* Space below table */
        border-radius: 1.5rem; /* More rounded table container */
        box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15); /* Prominent shadow for table container */
    }

    table {
        width: 100%;
        border-collapse: separate; /* Required for border-radius on cells */
        border-spacing: 0;
        background-color: #fdfefe; /* Very light, clean background for table body */
        border-radius: 1.5rem; /* Consistent border-radius for table */
        overflow: hidden; /* Ensures rounded corners are visible */
    }
    th, td {
        padding: 1.4rem 1.5rem; /* More generous padding for cells */
        text-align: left;
        border-bottom: 1px solid #e0f2f7; /* Very light, subtle border */
        color: #3f4a5b; /* Default text color for cells */
        font-size: 0.95rem;
    }
    th {
        background: linear-gradient(180deg, #e3f2fd, #bbdefb); /* Professional blue gradient for headers */
        color: #1A237E; /* Deep blue text for headers */
        font-weight: 700;
        text-transform: uppercase;
        font-size: 0.9rem; /* Clearer header font */
        letter-spacing: 0.08em; /* Slightly more letter spacing */
        text-shadow: 0.5px 0.5px 1px rgba(0,0,0,0.05);
    }
    th:first-child { border-top-left-radius: 1.5rem; } /* Apply radius to top-left header */
    th:last-child { border-top-right-radius: 1.5rem; } /* Apply radius to top-right header */

    tr:last-child td {
        border-bottom: none; /* No border for the last row's cells */
    }
    tr:nth-child(even) {
        background-color: #F8F9FA; /* Subtle light grey for even rows */
    }
    tr:hover {
        background-color: #E3F2FD; /* Clear, light blue on hover for rows */
        transform: translateY(-2px); /* Slight lift on hover */
        box-shadow: 0 4px 15px rgba(0,0,0,0.08); /* Subtle shadow on hover */
    }

    /* Action Links within Table - Even Better Styling */
    .action-links {
        display: flex;
        gap: 0.6rem; /* Reduced gap slightly for compact buttons */
        justify-content: center; /* Center the buttons in the cell */
        align-items: center;
    }

    .action-button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 0.55rem 0.9rem; /* Refined padding for icons + text */
        border-radius: 0.6rem;
        font-weight: 600;
        text-decoration: none;
        transition: all 0.25s cubic-bezier(0.25, 0.8, 0.25, 1); /* Smoother transition */
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        font-size: 0.8rem; /* Slightly smaller font to fit icons */
        position: relative;
        overflow: hidden;
    }

    .action-button svg {
        width: 19px; /* Slightly larger icon */
        height: 19px;
        fill: currentColor;
        margin-right: 0.4rem; /* Space between icon and text */
        filter: drop-shadow(1px 1px 1px rgba(0,0,0,0.08)); /* Subtle shadow for icon */
    }

    /* Edit Button Style */
    .edit-button {
        background: linear-gradient(135deg, #E3F2FD, #BBDEFB); /* Light blue gradient */
        color: #2196F3; /* Professional blue text & icon */
        border: 1px solid #BBDEFB;
    }
    .edit-button:hover {
        background: linear-gradient(135deg, #BBDEFB, #90CAF9); /* Deeper blue gradient on hover */
        color: #1976D2; /* Darker blue on hover */
        transform: translateY(-3px);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.18);
        border-color: #90CAF9;
    }
    .edit-button:active {
        transform: translateY(0);
        box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.15); /* Pressed effect */
    }

    /* Delete Button Style */
    .delete-button {
        background: linear-gradient(135deg, #FFEBEE, #FFCDD2); /* Light red/pink gradient */
        color: #EF5350; /* Softer red text & icon */
        border: 1px solid #FFCDD2;
    }
    .delete-button:hover {
        background: linear-gradient(135deg, #FFCDD2, #EF9A9A); /* Deeper red/pink gradient on hover */
        color: #D32F2F; /* Darker red on hover */
        transform: translateY(-3px);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.18);
        border-color: #EF9A9A;
    }
    .delete-button:active {
        transform: translateY(0);
        box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.15); /* Pressed effect */
    }

    /* Back to Home Button */
    .btn-secondary {
        background: linear-gradient(135deg, #9E9E9E, #616161); /* Muted Grey for Back to Home */
        color: white;
        padding: 1.1rem 2.2rem; /* Generous padding */
        border-radius: 0.8rem;
        text-decoration: none;
        font-weight: 700;
        transition: all 0.35s ease;
        cursor: pointer;
        border: none;
        display: inline-block;
        margin-top: 3.5rem; /* More margin for the back button */
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    .btn-secondary:hover {
        background: linear-gradient(135deg, #616161, #9E9E9E);
        transform: translateY(-4px) scale(1.02); /* More pronounced hover */
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.18);
    }
    .btn-secondary:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
    }

    /* Message Display - Clear and Themed */
    .message {
        margin-top: 2rem; /* More margin for messages */
        margin-bottom: 1.5rem;
        padding: 1rem;
        border-radius: 0.7rem;
        font-weight: 600;
        text-align: center;
        font-size: 1rem;
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
    .message.info {
        background-color: #E3F2FD; /* Light blue info background */
        color: #1976D2; /* Deep blue info text */
        border: 1px solid #90CAF9;
    }

    /* Media Queries for Responsiveness */
    @media (max-width: 992px) {
        .container {
            padding: 3rem;
            border-radius: 2rem;
            max-width: 95%;
        }
        h1 {
            font-size: 3.2rem;
            margin-bottom: 2rem;
        }
        .header-section {
            flex-direction: column; /* Stack header elements */
            align-items: flex-start; /* Align search bar to left */
            gap: 1.5rem;
        }
        .search-bar {
            width: 100%;
            justify-content: flex-start; /* Align search bar content to left */
        }
        .search-bar input[type="number"] {
            max-width: none; /* Allow input to grow */
        }
        th, td {
            padding: 1.2rem 1.3rem;
            font-size: 0.9rem;
        }
        .action-button {
            padding: 0.5rem 0.8rem;
            font-size: 0.75rem;
            border-radius: 0.5rem;
        }
        .action-button svg {
            width: 17px;
            height: 17px;
            margin-right: 0.3rem;
        }
    }

    @media (max-width: 768px) {
        body {
            padding: 20px;
        }
        .container {
            padding: 2.2rem;
            border-radius: 1.8rem;
            max-width: 100%;
        }
        h1 {
            font-size: 2.8rem;
            margin-bottom: 1.8rem;
        }
        .header-section {
            gap: 1.2rem;
        }
        .search-bar {
            flex-direction: column; /* Stack search input and button */
            gap: 0.8rem;
        }
        .search-bar input[type="number"],
        .search-bar .btn-search {
            width: 100%; /* Full width when stacked */
        }
        .table-container {
            margin-top: 1.8rem;
            margin-bottom: 2rem;
            border-radius: 1.2rem;
        }
        th, td {
            padding: 1rem 1rem; /* Reduced padding for smaller screens */
            font-size: 0.85rem;
        }
        .action-links {
            gap: 0.5rem;
        }
        .action-button {
            padding: 0.45rem 0.7rem;
            font-size: 0.7rem;
            border-radius: 0.4rem;
        }
        .action-button svg {
            width: 16px;
            height: 16px;
            margin-right: 0.25rem;
        }
        .btn-secondary {
            padding: 1rem 1.8rem;
            font-size: 0.95rem;
            margin-top: 2.5rem;
        }
        .message {
            padding: 0.8rem;
            font-size: 0.9rem;
        }
    }

    @media (max-width: 480px) {
        body {
            padding: 15px;
        }
        .container {
            padding: 1.8rem;
            border-radius: 1.5rem;
        }
        h1 {
            font-size: 2.2rem;
            margin-bottom: 1.5rem;
        }
        .header-section {
            gap: 1rem;
        }
        .search-bar input[type="number"],
        .search-bar .btn-search {
            padding: 0.8rem 1.2rem;
            font-size: 0.9rem;
        }
        .table-container {
            border-radius: 1rem;
        }
        th, td {
            padding: 0.8rem 0.8rem;
            font-size: 0.75rem; /* Even smaller font for table on very small screens */
        }
        .action-links {
            flex-direction: column; /* Stack buttons vertically on very small screens */
            gap: 0.4rem;
        }
        .action-button {
            width: 100%; /* Make stacked buttons full width */
            padding: 0.6rem 0.8rem;
        }
        .action-button svg {
            width: 15px;
            height: 15px;
            margin-right: 0.2rem;
        }
        .btn-secondary {
            padding: 0.9rem 1.5rem;
            font-size: 0.85rem;
            margin-top: 2rem;
        }
        .message {
            padding: 0.7rem;
            font-size: 0.8rem;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header-section">
            <h1 style="
                margin-bottom: 0; /* Adjusted for flex container */
                font-size: 3.8rem;
                font-weight: 800;
                letter-spacing: -0.05em;
                text-shadow: 5px 5px 12px rgba(0,0,0,0.25);
                background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                line-height: 1.1;
            ">All Student Marks</h1>
            <form action="DisplayMarksServlet" method="get" class="search-bar">
                <input type="number" id="searchID" name="searchID" placeholder="Enter Student ID">
                <button type="submit" class="btn-search">Search</button>
            </form>
        </div>

        <%
            List<StudentMark> studentMarks = (List<StudentMark>) request.getAttribute("studentMarks");
            String message = (String) request.getAttribute("message");
            String messageType = (String) request.getAttribute("messageType");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        %>

        <%-- Display messages --%>
        <% if (message != null && !message.isEmpty()) { %>
            <div class="message <%= (messageType != null ? messageType : "") %>">
                <%= message %>
            </div>
        <% } %>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Subject</th>
                        <th>Marks</th>
                        <th>Exam Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (studentMarks != null && !studentMarks.isEmpty()) {
                            for (StudentMark mark : studentMarks) {
                    %>
                                <tr>
                                    <td><%= mark.getStudentID() %></td>
                                    <td><%= mark.getStudentName() %></td>
                                    <td><%= mark.getSubject() %></td>
                                    <td><%= mark.getMarks() %></td>
                                    <td><%= dateFormat.format(mark.getExamDate()) %></td>
                                    <td class="action-links">
                                        <a href="updateMark?studentID=<%= mark.getStudentID() %>" class="action-button edit-button">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                                                <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>
                                            </svg>
                                            Edit
                                        </a>
                                        <a href="deleteMark?studentID=<%= mark.getStudentID() %>" class="action-button delete-button" onclick="return confirm('Are you sure you want to delete student ID <%= mark.getStudentID() %>?');">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                                                <path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zm2.46-7.12l1.41-1.41L12 12.59l2.12-2.12 1.41 1.41L13.41 14l2.12 2.12-1.41 1.41L12 15.41l-2.12 2.12-1.41-1.41L10.59 14l-2.13-2.12zM15.5 4l-1-1h-5l-1 1H5v2h14V4h-3.5z"/>
                                            </svg>
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                    <%
                            }
                        } else {
                    %>
                            <tr>
                                <td colspan="6" style="text-align: center; padding: 1.8rem; color: #718096; font-style: italic;">
                                    No student marks found in the database. Please add some marks.
                                </td>
                            </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <a href="index.jsp" class="btn-secondary">Back to Home</a>
    </div>
</body>
</html>