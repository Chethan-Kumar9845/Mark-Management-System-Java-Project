<%-- WebContent/report_result.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Results</title>
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
        flex-direction: column;
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
        max-width: 1100px; /* Wider container for results table */
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
        margin-bottom: 2.5rem; /* Adequate margin below heading */
        font-size: 3.8rem; /* Commanding font size */
        font-weight: 800; /* Extra bold */
        letter-spacing: -0.05em; /* Slightly tighter letter spacing */
        text-shadow: 5px 5px 12px rgba(0,0,0,0.25); /* Deeper, more refined shadow */
        /* Professional gradient: deep blue to vibrant purple */
        background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: headingShine 5s infinite alternate; /* Gentle shine */
        line-height: 1.1;
    }
    @keyframes headingShine {
        0% { filter: brightness(100%); }
        100% { filter: brightness(115%); }
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

    /* No Records Found Message */
    .no-records-message {
        margin-top: 2rem;
        padding: 1.2rem;
        border-radius: 0.8rem;
        font-weight: 600;
        text-align: center;
        font-size: 1.1rem;
        background-color: #E0F2F7; /* Light blue info background */
        color: #052c65; /* Deep blue info text */
        border: 1px solid #B3E5FC;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    }


    /* Message Display - Clear and Themed (consistent with other pages) */
    .message {
        margin-top: 1.8rem;
        padding: 0.9rem;
        border-radius: 0.6rem;
        font-weight: 500;
        text-align: center;
        font-size: 1.05rem;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    }
    .message.success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }
    .message.error {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }
    .message.info {
        background-color: #cfe2ff;
        color: #052c65;
        border: 1px solid #b6d4fe;
    }

    /* Navigation Buttons - Professional & Distinct */
    .links {
        text-align: center;
        margin-top: 3rem; /* More space above buttons */
        display: flex; /* Arrange buttons side-by-side */
        justify-content: center;
        gap: 1.5rem; /* Space between buttons */
        flex-wrap: wrap; /* Allow wrapping on small screens */
    }
    .btn {
        color: white;
        padding: 1.1rem 2.2rem; /* Generous padding for all buttons */
        border-radius: 0.85rem;
        text-decoration: none;
        font-weight: 700;
        transition: all 0.3s ease;
        cursor: pointer;
        border: none;
        display: inline-block;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15); /* Stronger button shadow */
        text-shadow: 1px 1px 3px rgba(0,0,0,0.15);
    }
    /* Specific Primary Button Style (e.g., Back to Reports Menu) */
    .btn-primary {
        background: linear-gradient(135deg, #2196F3, #1976D2); /* Professional Blue */
    }
    .btn-primary:hover {
        background: linear-gradient(135deg, #1976D2, #2196F3);
        transform: translateY(-4px) scale(1.02);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
    }
    .btn-primary:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    /* Specific Secondary Button Style (e.g., Back to Home) */
    .btn-secondary {
        background: linear-gradient(135deg, #9E9E9E, #616161); /* Muted Grey */
    }
    .btn-secondary:hover {
        background: linear-gradient(135deg, #616161, #9E9E9E);
        transform: translateY(-4px) scale(1.02);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.18);
    }
    .btn-secondary:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
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
        th, td {
            padding: 1.2rem 1.3rem;
            font-size: 0.9rem;
        }
        .no-records-message {
            padding: 1rem;
            font-size: 1rem;
        }
        .links {
            gap: 1rem;
            margin-top: 2.5rem;
        }
        .btn {
            padding: 1rem 1.8rem;
            font-size: 1rem;
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
        .table-container {
            margin-top: 1.8rem;
            margin-bottom: 2rem;
            border-radius: 1.2rem;
        }
        th, td {
            padding: 1rem 1rem; /* Reduced padding for smaller screens */
            font-size: 0.85rem;
        }
        .no-records-message {
            padding: 0.9rem;
            font-size: 0.95rem;
        }
        .message {
            padding: 0.8rem;
            font-size: 0.9rem;
        }
        .links {
            flex-direction: column; /* Stack buttons vertically */
            gap: 1.2rem;
            margin-top: 2rem;
        }
        .btn {
            width: 100%; /* Full width when stacked */
            padding: 1rem 1.5rem;
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
        .table-container {
            border-radius: 1rem;
        }
        th, td {
            padding: 0.8rem 0.8rem;
            font-size: 0.75rem; /* Even smaller font for table on very small screens */
        }
        .no-records-message {
            padding: 0.7rem;
            font-size: 0.85rem;
        }
        .message {
            padding: 0.7rem;
            font-size: 0.8rem;
        }
        .btn {
            padding: 0.9rem 1.2rem;
            font-size: 0.9rem;
        }
        .links {
             gap: 0.8rem;
             margin-top: 1.5rem;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <%
            String reportTitle = (String) request.getAttribute("reportTitle");
            List<StudentMark> reportResults = (List<StudentMark>) request.getAttribute("reportResults");
            String message = (String) request.getAttribute("message");
            String messageType = (String) request.getAttribute("messageType");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        %>

        <h1 style="
            margin-bottom: 2.5rem; /* Consistent with CSS value */
            font-size: 3.8rem; /* Consistent with CSS value */
            font-weight: 800;
            letter-spacing: -0.05em;
            text-shadow: 5px 5px 12px rgba(0,0,0,0.25);
            background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1.1;
        "><%= (reportTitle != null ? reportTitle : "Report Results") %></h1>

        <%-- Display messages --%>
        <% if (message != null && !message.isEmpty()) { %>
            <div class="message <%= (messageType != null ? messageType : "") %>">
                <%= message %>
            </div>
        <% } %>

        <div class="table-container">
            <%
                if (reportResults != null && !reportResults.isEmpty()) {
            %>
                    <table>
                        <thead>
                            <tr>
                                <th>Student ID</th>
                                <th>Student Name</th>
                                <th>Subject</th>
                                <th>Marks</th>
                                <th>Exam Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (StudentMark mark : reportResults) {
                            %>
                                    <tr>
                                        <td><%= mark.getStudentID() %></td>
                                        <td><%= mark.getStudentName() %></td>
                                        <td><%= mark.getSubject() %></td>
                                        <td><%= mark.getMarks() %></td>
                                        <td><%= dateFormat.format(mark.getExamDate()) %></td>
                                    </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
            <%
                } else {
                    // Show "No records" if results are empty, regardless of message existence, but prioritize explicit messages.
                    // This handles cases where reportResults is empty but there's no specific 'message' from servlet.
            %>
                    <p class="no-records-message">
                        No records found matching the specified report criteria.
                    </p>
            <%
                }
            %>
        </div>

        <div class="links">
            <a href="ReportServlet" class="btn btn-primary">Back to Reports Menu</a>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html>