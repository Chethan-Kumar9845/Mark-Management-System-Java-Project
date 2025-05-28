<%-- WebContent/reports.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Reports</title>
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
        max-width: 1500px; /* Wider for better report options layout */
        text-align: center;
        position: relative;
        z-index: 10;
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
        margin-bottom: 0.8rem; /* Adequate margin below heading */
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

    /* Tagline Style */
    .tagline {
        font-size: 1.55rem; /* Larger and more prominent tagline */
        color: #4a5568; /* Softer gray for tagline */
        margin-bottom: 3.5rem; /* More space below tagline */
        font-weight: 600; /* Slightly bolder */
        text-shadow: 0.5px 0.5px 1px rgba(0,0,0,0.05);
    }

    /* Report Options Grid */
    .report-options {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); /* Adjusted for larger buttons and better fit */
        gap: 1.8rem; /* Increased gap for visual breathing room */
        margin-top: 2.5rem; /* Space above options */
        margin-bottom: 3.5rem; /* Space before back button */
    }

    /* Report Button Style (Primary Blue) */
    .report-button {
        background: linear-gradient(135deg, #2196F3, #1976D2); /* Professional Blue for reports */
        color: white;
        padding: 1.5rem 1.8rem; /* More generous padding */
        border-radius: 0.9rem; /* More rounded corners */
        text-decoration: none;
        font-weight: 700; /* Bolder text */
        font-size: 1.15rem; /* Larger font size */
        transition: all 0.35s cubic-bezier(0.25, 0.8, 0.25, 1); /* Smoother transitions */
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 120px; /* Consistent minimum button height */
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2); /* Stronger button shadow */
        position: relative;
        overflow: hidden;
        text-shadow: 1px 1px 3px rgba(0,0,0,0.15);
    }
    .report-button:hover {
        background: linear-gradient(135deg, #1976D2, #2196F3);
        transform: translateY(-6px) scale(1.03); /* More pronounced lift and scale */
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
    }
    .report-button:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }
    /* Ripple effect on click for buttons */
    .report-button::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 0; /* Start with 0 width */
        height: 0; /* Start with 0 height */
        background: rgba(255, 255, 255, 0.3); /* Softer ripple color */
        border-radius: 50%;
        opacity: 0;
        transform: translate(-50%, -50%);
        transition: width 0.6s ease-out, height 0.6s ease-out, opacity 0.6s ease-out;
    }
    .report-button:active::after {
        width: 250%; /* Grow to cover button */
        height: 250%;
        opacity: 1;
        transition: 0s; /* No transition for active state */
    }

    /* Back to Home Button (Secondary Grey) */
    .btn-secondary {
        background: linear-gradient(135deg, #9E9E9E, #616161); /* Muted Grey */
        color: white;
        padding: 1.1rem 2.2rem; /* Consistent button padding */
        border-radius: 0.85rem; /* Consistent button border-radius */
        text-decoration: none;
        font-weight: 700;
        transition: all 0.35s cubic-bezier(0.25, 0.8, 0.25, 1); /* Smoother transitions */
        cursor: pointer;
        border: none;
        display: inline-block;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15); /* Consistent button shadow */
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    .btn-secondary:hover {
        background: linear-gradient(135deg, #616161, #9E9E9E);
        transform: translateY(-4px) scale(1.02); /* More pronounced hover */
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    }
    .btn-secondary:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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
            margin-bottom: 0.7rem;
        }
        .tagline {
            font-size: 1.3rem;
            margin-bottom: 3rem;
        }
        .report-options {
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
            margin-bottom: 3rem;
        }
        .report-button {
            padding: 1.2rem 1.5rem;
            font-size: 1.1rem;
            min-height: 110px;
        }
        .btn-secondary {
            padding: 1rem 2rem;
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
            margin-bottom: 0.6rem;
        }
        .tagline {
            font-size: 1.2rem;
            margin-bottom: 2.5rem;
        }
        .report-options {
            grid-template-columns: 1fr; /* Stack buttons vertically on smaller screens */
            gap: 1.2rem;
            margin-top: 1.8rem;
            margin-bottom: 2.5rem;
        }
        .report-button {
            padding: 1.1rem 1.2rem;
            font-size: 1.05rem;
            min-height: 100px;
        }
        .btn-secondary {
            padding: 0.9rem 1.8rem;
            font-size: 0.95rem;
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
            margin-bottom: 0.5rem;
        }
        .tagline {
            font-size: 1rem;
            margin-bottom: 2rem;
        }
        .report-options {
            gap: 1rem;
            margin-top: 1.5rem;
            margin-bottom: 2rem;
        }
        .report-button {
            padding: 1rem 1rem;
            font-size: 0.95rem;
            min-height: 90px;
        }
        .btn-secondary {
            padding: 0.8rem 1.5rem;
            font-size: 0.9rem;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h1 style="
            margin-bottom: 0.8rem; /* Consistent with CSS value */
            font-size: 3.8rem; /* Consistent with CSS value */
            font-weight: 800;
            letter-spacing: -0.05em;
            text-shadow: 5px 5px 12px rgba(0,0,0,0.25);
            background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1.1;
        ">Generate Reports</h1>
        <p class="tagline">Select a report type to view student performance data:</p>

        <div class="report-options">
            <a href="report_form.jsp?reportType=marksAbove" class="report-button">Students with Marks Above Threshold</a>
            <a href="report_form.jsp?reportType=marksBySubject" class="report-button">Student Marks by Subject</a>
            <a href="report_form.jsp?reportType=topNStudents" class="report-button">Top N Students by Marks</a>
        </div>

        <a href="index.jsp" class="btn-secondary">Back to Home</a>
    </div>
</body>
</html>