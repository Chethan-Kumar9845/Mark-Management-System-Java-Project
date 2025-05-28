<%-- WebContent/markdelete.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Student Mark</title>
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
        padding: 20px; /* Generous page padding */
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
        padding: 2.8rem; /* Consistent padding with other main forms */
        border-radius: 2rem; /* Softer, more modern rounding */
        box-shadow: 0 24px 60px rgba(0, 0, 0, 0.2); /* Deeper, refined shadow */
        width: 100%;
        max-width: 700px; /* Optimal width for a delete form, slightly wider for readability */
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
        transform: translateY(-8px); /* More noticeable lift */
        box-shadow: 0 32px 75px rgba(0, 0, 0, 0.28);
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
        animation: floatingBlob 11s infinite ease-in-out;
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
        animation-delay: 2.5s;
    }
    @keyframes floatingBlob {
        0%, 100% { transform: translate(0, 0) scale(1); }
        50% { transform: translate(20px, 20px) scale(1.05); }
    }

    /* Heading - Professional Gradient Text */
    h1 {
        margin-bottom: 2rem; /* Adequate margin below heading */
        font-size: 3.2rem; /* Commanding font size */
        font-weight: 800; /* Extra bold */
        letter-spacing: -0.05em; /* Slightly tighter letter spacing */
        text-shadow: 4px 4px 10px rgba(0,0,0,0.2); /* Deeper, more refined shadow */
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
    input[type="text"],
    input[type="number"] {
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
    }
    input[type="text"]:focus,
    input[type="number"]:focus {
        border-color: #EF5350; /* Softer, professional red focus ring for delete context */
        box-shadow: 0 0 0 5px rgba(239, 83, 80, 0.3); /* Prominent, clean focus glow */
    }

    /* Buttons - Professional & Distinct */
    .btn {
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
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15); /* Enhanced shadow */
        text-shadow: 1px 1px 3px rgba(0,0,0,0.15);
    }
    .btn:hover {
        transform: translateY(-4px) scale(1.02);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
    }
    .btn:active {
        transform: translateY(0) scale(1);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .btn-delete {
        background: linear-gradient(135deg, #EF5350, #D32F2F); /* Professional Red for delete */
    }
    .btn-delete:hover {
        background: linear-gradient(135deg, #D32F2F, #EF5350);
    }

    .btn-secondary {
        background: linear-gradient(135deg, #9E9E9E, #616161); /* Muted Grey for secondary */
    }
    .btn-secondary:hover {
        background: linear-gradient(135deg, #616161, #9E9E9E);
    }

    .btn-secondary2 { /* Used for "View All Marks" */
        background: linear-gradient(135deg, #00C853, #64DD17); /* Vibrant Green for view marks */
    }
    .btn-secondary2:hover {
        background: linear-gradient(135deg, #64DD17, #00C853);
    }

    .button-group {
        display: flex;
        justify-content: center; /* Center the buttons */
        gap: 1.2rem; /* Space between buttons */
        margin-top: 2rem; /* Space above the button group */
        flex-wrap: wrap; /* Allow buttons to wrap on smaller screens */
    }

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

    /* --- Custom Modal Styles - Professional & Themed --- */
    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Dimming background */
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 1000;
        visibility: hidden;
        opacity: 0;
        transition: visibility 0s, opacity 0.3s ease;
    }
    .modal-overlay.active {
        visibility: visible;
        opacity: 1;
    }
    .modal-content {
        background-color: rgba(255, 255, 255, 0.95); /* Frosted glass effect for modal */
        padding: 2.5rem;
        border-radius: 1rem;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25); /* Deeper shadow for modal */
        text-align: center;
        max-width: 450px; /* Wider modal for better readability */
        width: 90%;
        transform: translateY(-20px);
        transition: transform 0.3s ease;
        backdrop-filter: blur(10px); /* Frosted glass effect */
        -webkit-backdrop-filter: blur(10px);
        border: 2px solid rgba(255, 255, 255, 0.9);
    }
    .modal-overlay.active .modal-content {
        transform: translateY(0);
    }
    .modal-content h3 {
        margin-top: 0;
        color: #D32F2F; /* Red heading for deletion confirmation */
        font-size: 1.8rem;
        margin-bottom: 1rem;
        font-weight: 700;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    .modal-content p {
        margin-bottom: 1.8rem;
        color: #4A4A4A; /* Softer dark grey for text */
        font-size: 1.05rem;
        line-height: 1.5;
    }
    .modal-actions button {
        padding: 0.9rem 1.8rem; /* Consistent button padding */
        border-radius: 0.7rem; /* Consistent button rounding */
        font-weight: 700;
        cursor: pointer;
        border: none;
        transition: all 0.3s ease;
        margin: 0 0.6rem; /* Space between modal buttons */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    .modal-actions .btn-confirm {
        background: linear-gradient(135deg, #EF5350, #D32F2F); /* Red gradient for confirm delete */
        color: white;
    }
    .modal-actions .btn-confirm:hover {
        background: linear-gradient(135deg, #D32F2F, #EF5350);
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
    }
    .modal-actions .btn-cancel {
        background: linear-gradient(135deg, #9E9E9E, #616161); /* Gray gradient for cancel */
        color: white;
    }
    .modal-actions .btn-cancel:hover {
        background: linear-gradient(135deg, #616161, #9E9E9E);
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
    }

    /* Media Queries for Responsiveness */
    @media (max-width: 768px) {
        body {
            padding: 15px;
        }
        .container {
            padding: 2.2rem;
            border-radius: 1.8rem;
            max-width: 90%;
        }
        h1 {
            font-size: 2.8rem;
            margin-bottom: 1.8rem;
        }
        .form-group {
            margin-bottom: 1.2rem;
        }
        label {
            font-size: 0.95rem;
            margin-bottom: 0.5rem;
        }
        input[type="text"],
        input[type="number"] {
            padding: 0.8rem 1rem;
            font-size: 0.9rem;
        }
        .btn {
            padding: 0.9rem 1.8rem;
            font-size: 1rem;
        }
        .button-group {
            gap: 1rem;
            margin-top: 1.8rem;
        }
        .modal-content {
            padding: 2rem;
            max-width: 85%;
        }
        .modal-content h3 {
            font-size: 1.6rem;
        }
        .modal-content p {
            font-size: 0.95rem;
        }
        .modal-actions button {
            padding: 0.8rem 1.6rem;
            font-size: 0.95rem;
            margin: 0 0.4rem;
        }
    }

    @media (max-width: 480px) {
        body {
            padding: 10px;
        }
        .container {
            padding: 1.8rem;
            border-radius: 1.5rem;
            max-width: 95%;
        }
        h1 {
            font-size: 2.2rem;
            margin-bottom: 1.5rem;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        label {
            font-size: 0.85rem;
            margin-bottom: 0.4rem;
        }
        input[type="text"],
        input[type="number"] {
            padding: 0.7rem 0.9rem;
            font-size: 0.85rem;
        }
        .btn {
            padding: 0.8rem 1.5rem;
            font-size: 0.9rem;
        }
        .button-group {
            flex-direction: column; /* Stack buttons vertically */
            gap: 0.8rem; /* Space between stacked buttons */
            margin-top: 1.5rem;
        }
        .modal-content {
            padding: 1.5rem;
            max-width: 90%;
        }
        .modal-content h3 {
            font-size: 1.4rem;
        }
        .modal-content p {
            font-size: 0.9rem;
        }
        .modal-actions button {
            padding: 0.7rem 1.2rem;
            font-size: 0.85rem;
            margin: 0.3rem 0.3rem; /* Adjust margin for stacked layout in modal */
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h1 style="
            margin-bottom: 2rem; /* Consistent with CSS value */
            font-size: 3.2rem; /* Consistent with CSS value */
            font-weight: 800;
            letter-spacing: -0.05em;
            text-shadow: 4px 4px 10px rgba(0,0,0,0.2);
            background: linear-gradient(45deg, #1A237E, #673AB7, #D81B60);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1.1;
        ">Delete Student Mark</h1>

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

        <form id="deleteForm" action="deleteMark" method="post" class="mt-8">
            <div class="form-group">
                <label for="studentID">Student ID to Delete:</label>
                <input type="number" id="studentID" name="studentID" placeholder="Enter Student ID" required>
            </div>
            <div class="button-group">
                <button type="button" id="showConfirmModalBtn" class="btn btn-delete">Delete Mark</button>
                <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
                <a href="DisplayMarksServlet" class="btn btn-secondary2">View All Marks</a>
            </div>
        </form>
    </div>

    <div id="confirmationModal" class="modal-overlay">
        <div class="modal-content">
            <h3>Confirm Deletion</h3>
            <p>Are you sure you want to delete this student record? This action cannot be undone.</p>
            <div class="modal-actions">
                <button type="button" id="confirmDeleteBtn" class="btn-confirm">Confirm</button>
                <button type="button" id="cancelDeleteBtn" class="btn-cancel">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        // Get references to elements
        const deleteForm = document.getElementById('deleteForm');
        const studentIDInput = document.getElementById('studentID');
        const showConfirmModalBtn = document.getElementById('showConfirmModalBtn');
        const confirmationModal = document.getElementById('confirmationModal');
        const confirmDeleteBtn = document.getElementById('confirmDeleteBtn');
        const cancelDeleteBtn = document.getElementById('cancelDeleteBtn');

        // Function to show the modal
        function showModal() {
            // Check if input is valid before showing modal
            if (!studentIDInput.value) {
                studentIDInput.reportValidity(); // Show browser's validation message
                return; // Stop if input is not valid
            }
            confirmationModal.classList.add('active');
        }

        // Function to hide the modal
        function hideModal() {
            confirmationModal.classList.remove('active');
        }

        // Event listener for the "Delete Mark" button (shows modal)
        showConfirmModalBtn.addEventListener('click', showModal);

        // Event listener for the "Confirm" button in the modal
        confirmDeleteBtn.addEventListener('click', () => {
            hideModal(); // Hide modal first
            deleteForm.submit(); // Then submit the form
        });

        // Event listener for the "Cancel" button in the modal
        cancelDeleteBtn.addEventListener('click', hideModal);

        // Optional: Hide modal if user clicks outside of it
        confirmationModal.addEventListener('click', (e) => {
            if (e.target === confirmationModal) { // Check if the click is directly on the overlay
                hideModal();
            }
        });
    </script>
</body>
</html>