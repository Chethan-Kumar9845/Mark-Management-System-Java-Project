<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mark Management System</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* Global Styles & Background - Professionally Vibrant */
        body {
            font-family: 'Quicksand', sans-serif;
            /* A calmer, yet dynamic background: soft blues, subtle greens, gentle purples */
            background: linear-gradient(135deg, #a1c4fd, #c2e9fb, #a7e0f8, #c3f2d2, #d1c4e9);
            background-size: 500% 500%; /* For fluid, subtle animation */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            overflow-x: hidden;
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
            padding: 3.2rem; /* Slightly more padding */
            border-radius: 2rem; /* Consistent, softer rounded corners */
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.2); /* Deeper, refined shadow */
            width: 90%;
            max-width: 1500px; /* Optimal width for content */
            text-align: center;
            position: relative;
            z-index: 10;
            transition: transform 0.4s cubic-bezier(0.25, 0.8, 0.25, 1), box-shadow 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            border: 3px solid rgba(255, 255, 255, 0.9); /* More prominent, clean white border */
            box-sizing: border-box;
            backdrop-filter: blur(18px); /* Stronger frosted effect */
            -webkit-backdrop-filter: blur(18px); /* For Safari */
        }
        .container:hover {
            transform: translateY(-12px); /* More noticeable lift */
            box-shadow: 0 35px 80px rgba(0, 0, 0, 0.3);
        }

        /* Decorative flourishes for container - Subtle and integrated */
        .container::before, .container::after {
            content: '';
            position: absolute;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            opacity: 0.7;
            filter: blur(25px);
            z-index: -1;
            animation: floatingBlob 12s infinite ease-in-out;
        }
        .container::before {
            top: -30px;
            left: -30px;
            background: #FFD54F; /* Soft amber blob */
            animation-delay: 0s;
        }
        .container::after {
            bottom: -30px;
            right: -30px;
            background: #81C784; /* Muted green blob */
            animation-delay: 3s;
        }
        @keyframes floatingBlob {
            0%, 100% { transform: translate(0, 0) scale(1); }
            50% { transform: translate(20px, 20px) scale(1.05); }
        }

        /* Heading and Tagline - Professional Gradient Text */
        h1 {
            margin-bottom: 1rem; /* Adjusted spacing */
            font-size: 4.5rem; /* Larger and more commanding */
            font-weight: 800;
            letter-spacing: -0.05em;
            text-shadow: 5px 5px 12px rgba(0,0,0,0.25); /* Deeper, more refined shadow */
            /* Professional gradient: deep blue to vibrant purple */
            background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: headingShine 5s infinite alternate; /* Gentle shine */
        }
        @keyframes headingShine {
            0% { filter: brightness(100%); }
            100% { filter: brightness(115%); }
        }
        .tagline {
            font-size: 1.6rem; /* More prominent tagline */
            color: #3F51B5; /* Deep, authoritative blue */
            margin-bottom: 4.5rem; /* More space below tagline */
            font-weight: 600;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.08);
        }

        /* Navigation Grid and Buttons - Distinct & Elegant Gradients */
        .nav-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr)); /* Larger, more spaced buttons */
            gap: 2rem; /* Generous spacing */
            margin-top: 3.5rem;
            margin-bottom: 4.5rem;
        }

        .nav-button {
            color: white;
            padding: 1.3rem 1.6rem;
            border-radius: 1.2rem; /* Softer, more modern rounding */
            text-decoration: none;
            font-weight: 700;
            font-size: 1.15rem; /* Slightly larger text */
            transition: all 0.4s ease-in-out; /* Smoother transitions */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 150px; /* Taller, more substantial buttons */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2); /* Enhanced shadow */
            position: relative;
            overflow: hidden;
            border: none;
            cursor: pointer;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.25); /* Clear text shadow */
        }

        /* Distinct, professional gradients for each button */
        .nav-button:nth-child(1) { background: linear-gradient(135deg, #2196F3, #1976D2); } /* Professional Blue */
        .nav-button:nth-child(2) { background: linear-gradient(135deg, #FF7043, #E64A19); } /* Dynamic Orange */
        .nav-button:nth-child(3) { background: linear-gradient(135deg, #4CAF50, #388E3C); } /* Lush Green */
        .nav-button:nth-child(4) { background: linear-gradient(135deg, #9C27B0, #7B1FA2); } /* Royal Purple */

        /* Enhanced hover effects for professional feel */
        .nav-button:hover {
            transform: translateY(-8px) scale(1.03); /* More pronounced lift and slight scale */
            box-shadow: 0 18px 45px rgba(0, 0, 0, 0.3);
            opacity: 0.95; /* Slight transparency on hover */
        }
        .nav-button:nth-child(1):hover { background: linear-gradient(135deg, #1976D2, #2196F3); }
        .nav-button:nth-child(2):hover { background: linear-gradient(135deg, #E64A19, #FF7043); }
        .nav-button:nth-child(3):hover { background: linear-gradient(135deg, #388E3C, #4CAF50); }
        .nav-button:nth-child(4):hover { background: linear-gradient(135deg, #7B1FA2, #9C27B0); }

        .nav-button:active {
            transform: translateY(-4px) scale(1.01);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
        }

        .nav-button svg {
            margin-bottom: 0.8rem;
            width: 40px; /* Larger, prominent icons */
            height: 40px;
            fill: currentColor;
            filter: drop-shadow(2px 2px 5px rgba(0,0,0,0.2)); /* Clearer icon shadow */
        }

        /* Update Section - Clean and Integrated */
        .update-by-id-section {
            padding: 2.5rem;
            /* Very light, almost translucent cool-toned gradient */
            background: linear-gradient(135deg, rgba(240, 248, 255, 0.9), rgba(234, 246, 255, 0.9));
            border-radius: 1.5rem;
            box-shadow: inset 0 2px 8px rgba(0, 0, 0, 0.05), 0 10px 25px rgba(0, 0, 0, 0.1);
            margin-top: 3.5rem;
            border: 2px solid rgba(208, 231, 247, 0.9);
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(8px); /* Subtle frosted effect */
            -webkit-backdrop-filter: blur(8px);
        }
        .update-by-id-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            /* Very subtle, barely visible diagonal lines for texture */
            background: repeating-linear-gradient(45deg, rgba(255,255,255,0.03) 0px, rgba(255,255,255,0.03) 3px, transparent 3px, transparent 6px);
            z-index: 1;
        }

        .update-by-id-section label {
            display: block;
            margin-bottom: 1.8rem; /* More spacing */
            font-weight: 700;
            color: #283593; /* Deep indigo for label */
            font-size: 1.25rem;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.03);
            position: relative;
            z-index: 2;
        }
        .update-by-id-section .input-group {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1.2rem; /* More space between input and button */
            max-width: 600px; /* More control over layout */
            margin: 1rem auto 0 auto;
            position: relative;
            z-index: 2;
        }

        .update-by-id-section input[type="number"] {
            flex-grow: 1;
            padding: 1rem 1.4rem; /* Generous padding */
            border: 2px solid #81D4FA; /* Clear, professional light blue border */
            border-radius: 0.7rem; /* Softer rounding */
            box-sizing: border-box;
            font-size: 1.1rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.1); /* Clear inner shadow */
            outline: none;
            color: #424242;
            background-color: #fefefe;
        }
        .update-by-id-section input[type="number"]::placeholder {
            color: #B0BEC5; /* Muted placeholder color */
        }
        .update-by-id-section input[type="number"]:focus {
            border-color: #29B6F6; /* Brighter blue on focus */
            box-shadow: 0 0 0 6px rgba(41, 182, 246, 0.3); /* Prominent, clean focus glow */
        }

        .update-by-id-section button {
            /* Accent color for the Edit button: vibrant green */
            background: linear-gradient(135deg, #00C853, #64DD17);
            color: #fff;
            padding: 1rem 1.6rem; /* Matched height with input, slightly more padding */
            border-radius: 0.7rem; /* Consistent rounding */
            font-weight: 700;
            font-size: 1.1rem; /* Matches input font size */
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15); /* Clear shadow */
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.7rem; /* More space for icon and text */
            flex-shrink: 0;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
        }
        .update-by-id-section button:hover {
            background: linear-gradient(135deg, #64DD17, #00C853);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        .update-by-id-section button:active {
            transform: translateY(0);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .update-by-id-section button svg {
            width: 20px; /* Slightly larger icon */
            height: 20px;
            fill: currentColor;
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 992px) {
            .container {
                padding: 2.5rem;
            }
            h1 {
                font-size: 3.8rem;
            }
            .tagline {
                font-size: 1.4rem;
                margin-bottom: 4rem;
            }
            .nav-grid {
                gap: 1.5rem;
                margin-top: 3rem;
                margin-bottom: 4rem;
            }
            .nav-button {
                height: 130px;
                font-size: 1.05rem;
            }
            .nav-button svg {
                width: 36px;
                height: 36px;
            }
            .update-by-id-section {
                padding: 2rem;
            }
            .update-by-id-section label {
                font-size: 1.1rem;
            }
            .update-by-id-section input[type="number"],
            .update-by-id-section button {
                padding: 0.9rem 1.3rem;
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 2rem;
                border-radius: 1.5rem;
            }
            h1 {
                font-size: 3rem;
            }
            .tagline {
                font-size: 1.2rem;
                margin-bottom: 3rem;
            }
            .nav-grid {
                gap: 1.2rem;
                margin-top: 2.5rem;
                margin-bottom: 3rem;
                grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); /* Allow narrower buttons */
            }
            .nav-button {
                height: 110px;
                font-size: 0.95rem;
            }
            .nav-button svg {
                width: 30px;
                height: 30px;
            }
            .update-by-id-section {
                padding: 1.8rem;
            }
            .update-by-id-section label {
                font-size: 1rem;
                margin-bottom: 1.5rem;
            }
            .update-by-id-section .input-group {
                flex-direction: column; /* Stack input and button on smaller screens */
                gap: 0.8rem;
            }
            .update-by-id-section input[type="number"],
            .update-by-id-section button {
                width: 100%; /* Full width when stacked */
                padding: 0.8rem 1.2rem;
                font-size: 1rem;
            }
            .update-by-id-section button svg {
                width: 18px;
                height: 18px;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 1.5rem;
                border-radius: 1rem;
                max-width: 98%; /* Allow it to take more width on very small screens */
            }
            h1 {
                font-size: 2.4rem;
                margin-bottom: 0.6rem;
            }
            .tagline {
                font-size: 1rem;
                margin-bottom: 2.5rem;
            }
            .nav-grid {
                grid-template-columns: 1fr; /* Single column layout for very small screens */
                gap: 1rem;
            }
            .nav-button {
                height: 90px;
                font-size: 0.85rem;
            }
            .nav-button svg {
                width: 26px;
                height: 26px;
            }
            .update-by-id-section {
                padding: 1.2rem;
            }
            .update-by-id-section label {
                font-size: 0.9rem;
            }
            .update-by-id-section input[type="number"],
            .update-by-id-section button {
                padding: 0.7rem 1rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
       <h1 style="
    margin-bottom: 1rem; /* Adjusted for inline */
    font-size: 4.5rem; /* Larger and more commanding */
    font-weight: 800;
    letter-spacing: -0.05em;
    text-shadow: 5px 5px 12px rgba(0,0,0,0.25); /* Deeper, more refined shadow */
    background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60); /* Professional gradient: deep blue to vibrant purple */
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    /* Animation not possible inline. This will render the static gradient. */
">Mark Management System</h1>
       <p class="tagline" style="
    font-size: 1.6rem; /* More prominent tagline */
    color: #3F51B5; /* Deep, authoritative blue */
    margin-bottom: 4.5rem; /* More space below tagline */
    font-weight: 600;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.08);
">Student mark tracking and reporting with ease.</p>

        <div class="nav-grid">
            <a href="markadd.jsp" class="nav-button">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm5 11h-4v4h-2v-4H7v-2h4V7h2v4h4v2z"/>
                </svg>
                Add Marks
            </a>
            <a href="markdelete.jsp" class="nav-button">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zm2.46-7.12l1.41-1.41L12 12.59l2.12-2.12 1.41 1.41L13.41 14l2.12 2.12-1.41 1.41L12 15.41l-2.12 2.12-1.41-1.41L10.59 14l-2.13-2.12zM15.5 4l-1-1h-5l-1 1H5v2h14V4h-3.5z"/>
                </svg>
                Delete Marks
            </a>
            <a href="DisplayMarksServlet" class="nav-button">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M3 13h2v-2H3v2zm0 4h2v-2H3v2zm0-8h2V7H3v2zm4 4h14v-2H7v2zm0 4h14v-2H7v2zM7 7v2h14V7H7z"/>
                </svg>
                Display Marks
            </a>
            <a href="ReportServlet" class="nav-button">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M16 11V3H8v8H2v10h20V11h-6zm-6-6h4v6h-4V5zm-4 8h4v6H4v-6zm14 6h-4v-6h4v6z"/>
                </svg>
                Generate Reports
            </a>
        </div>

        <div class="update-by-id-section">
            <form action="updateMark" method="get">
                <label for="updateStudentID">Update Mark by Student ID:</label>
                <div class="input-group">
                    <input type="number" id="updateStudentID" name="studentID" placeholder="Enter Student ID" required>
                    <button type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                            <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>
                        </svg>
                        Edit
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>

</html>