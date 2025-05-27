<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Food Ordering System">
  <meta name="author" content="Vinod Madhuranga">

  <title>Payment - JUST YUMMY</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #fc7f03;
      --primary-hover: #e67300;
      --secondary-color: #6c757d;
      --secondary-hover: #5a6268;
      --success-color: #28a745;
      --danger-color: #dc3545;
      --warning-color: #ffc107;
      --light-color: #f8f9fa;
      --dark-color: #343a40;
      --white: #ffffff;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background-color: var(--light-color);
      color: var(--dark-color);
    }

    .container {
      max-width: 1200px;
      margin: 30px auto;
      padding: 0 20px;
    }

    .header {
      background-color: var(--white);
      padding: 20px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      margin-bottom: 30px;
    }

    .header h1 {
      color: var(--primary-color);
      text-align: center;
    }

    .payment-container {
      display: flex;
      justify-content: center;
      gap: 30px;
    }

    @media (max-width: 768px) {
      .payment-container {
        flex-direction: column;
        align-items: center;
      }
    }

    .payment-methods, .order-summary {
      background-color: var(--white);
      width: 100%;
      max-width: 500px;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    h2 {
      margin-bottom: 20px;
      color: var(--primary-color);
      border-bottom: 2px solid var(--primary-color);
      padding-bottom: 10px;
    }

    .payment-option {
      margin-bottom: 20px;
      padding: 15px;
      border: 1px solid var(--light-color);
      border-radius: 8px;
      cursor: pointer;
      transition: all 0.3s;
    }

    .payment-option:hover {
      border-color: var(--primary-color);
      background-color: rgba(252, 127, 3, 0.05);
    }

    .payment-option.selected {
      border-color: var(--primary-color);
      background-color: rgba(252, 127, 3, 0.1);
    }

    .payment-option input[type="radio"] {
      margin-right: 10px;
    }

    .payment-option label {
      display: flex;
      align-items: center;
      cursor: pointer;
    }

    .payment-icon {
      font-size: 24px;
      margin-right: 15px;
      color: var(--primary-color);
    }

    .card-form {
      display: block;
    }

    .paypal {
      margin-top: 20px;
      padding: 20px;
      border: 1px solid var(--light-color);
      border-radius: 8px;
      display: none;
    }

    .paypal.active {
      display: block;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: 500;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid var(--light-color);
      border-radius: 5px;
      font-size: 16px;
    }

    .form-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
    }

    .btn {
      background-color: var(--primary-color);
      color: var(--white);
      padding: 12px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      font-weight: 500;
      transition: all 0.3s;
      width: 100%;
      margin-top: 20px;
    }

    .btn:hover {
      background-color: var(--primary-hover);
    }

    .order-item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 10px;
      padding-bottom: 10px;
      border-bottom: 1px dashed var(--light-color);
    }

    .order-total {
      font-weight: bold;
      font-size: 18px;
      margin-top: 20px;
      padding-top: 10px;
      border-top: 2px solid var(--primary-color);
    }

    .delivery-address {
      margin-top: 20px;
      padding: 15px;
      background-color: var(--light-color);
      border-radius: 8px;
    }

    .delivery-address h3 {
      margin-bottom: 10px;
      color: var(--primary-color);
    }

    .message {
      padding: 15px;
      margin-bottom: 20px;
      border-radius: 5px;
      text-align: center;
    }

    .message-success {
      background-color: #e6f4ea;
      color: #137333;
    }

    .message-error {
      background-color: #fce8e6;
      color: #c5221f;
    }
    .error-message {
      color: var(--danger-color);
      font-size: 14px;
      margin-top: 3px;
      display: none;
    }
    .form-group.error input {
      border-color: var(--danger-color);
    }
  </style>
</head>
<body>
<div class="header">
  <h1>JUST YUMMY</h1>
</div>

<div class="container">
  <c:if test="${not empty message}">
    <div class="message message-${messageType}">
        ${message}
    </div>
  </c:if>

  <div class="payment-container">
    <div class="payment-methods">
      <h2>Payment Method</h2>

        <div class="card-form">
          <form id="paymentForm" method="post" novalidate>
            <div class="form-group" id="cardNumberGroup">
              <label for="cardNumber">Card Number</label>
              <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" maxlength="19" minlength="19" required>
              <div class="error-message" id="cardNumberError"></div>
            </div>

            <div class="form-group" id="cardNameGroup">
              <label for="cardName">Name on Card</label>
              <input type="text" id="cardName" name="cardName" placeholder="John Doe" required>
              <div class="error-message" id="cardNameError"></div>
            </div>

            <div class="form-row">
              <div class="form-group" id="expiryDateGroup">
                <label for="expiryDate">Expiry Date</label>
                <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" maxlength="5" required>
                <div class="error-message" id="expiryDateError"></div>
              </div>

              <div class="form-group" id="cvvGroup">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="123" maxlength="4" required>
                <div class="error-message" id="cvvError"></div>
              </div>
            </div>

            <input type="hidden" name="paymentType" value="creditCard">
            <button class="btn" type="submit">
              <i class="fas fa-lock"></i> Complete Payment
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  // Format card number input
  document.getElementById('cardNumber').addEventListener('input', function(e) {
    this.value = this.value.replace(/\D/g, '') // Remove all non-digits
      .replace(/(.{4})/g, '$1 ')
      .trim()
      .slice(0, 19);
  });

  // Format expiry date input
  document.getElementById('expiryDate').addEventListener('input', function(e) {
    let v = this.value.replace(/\D/g, '').slice(0,4);
    if (v.length >= 3) {
      this.value = v.slice(0,2) + '/' + v.slice(2);
    } else {
      this.value = v;
    }
  });

  // Validation rules
  function showError(inputId, message) {
    const group = document.getElementById(inputId + 'Group');
    const errorDiv = document.getElementById(inputId + 'Error');
    group.classList.add('error');
    errorDiv.style.display = 'block';
    errorDiv.textContent = message;
  }

  function clearError(inputId) {
    const group = document.getElementById(inputId + 'Group');
    const errorDiv = document.getElementById(inputId + 'Error');
    group.classList.remove('error');
    errorDiv.style.display = 'none';
    errorDiv.textContent = '';
  }

  function validateCardNumber(value) {
    // Remove spaces
    const digits = value.replace(/\s/g, '');
    // Luhn algorithm for card validation
    let sum = 0;
    let shouldDouble = false;
    for (let i = digits.length - 1; i >= 0; i--) {
      let digit = parseInt(digits.charAt(i), 10);
      if (shouldDouble) {
        if ((digit *= 2) > 9) digit -= 9;
      }
      sum += digit;
      shouldDouble = !shouldDouble;
    }
    return digits.length === 16 && (sum % 10) === 0;
  }

  function validateCardName(value) {
    return value.trim().length > 0 && /^[A-Za-z\s]+$/.test(value);
  }

  function validateExpiryDate(value) {
    if (!/^\d{2}\/\d{2}$/.test(value)) return false;
    const [month, year] = value.split('/').map(Number);
    if (month < 1 || month > 12) return false;
    // Expiry should be in the future
    const now = new Date();
    const currYear = now.getFullYear() % 100; // last 2 digits
    const currMonth = now.getMonth() + 1;
    if (year < currYear || (year === currYear && month < currMonth)) return false;
    return true;
  }

  function validateCVV(value) {
    return /^\d{3,4}$/.test(value);
  }

  document.getElementById('paymentForm').addEventListener('submit', function(e) {
    let valid = true;

    // Card Number
    const cardNumber = document.getElementById('cardNumber').value;
    if (!validateCardNumber(cardNumber)) {
      showError('cardNumber', 'Please enter a valid 16-digit card number.');
      valid = false;
    } else {
      clearError('cardNumber');
    }

    // Card Name
    const cardName = document.getElementById('cardName').value;
    if (!validateCardName(cardName)) {
      showError('cardName', 'Please enter the name on the card (letters and spaces only).');
      valid = false;
    } else {
      clearError('cardName');
    }

    // Expiry Date
    const expiryDate = document.getElementById('expiryDate').value;
    if (!validateExpiryDate(expiryDate)) {
      showError('expiryDate', 'Please enter a valid expiry date (MM/YY) in the future.');
      valid = false;
    } else {
      clearError('expiryDate');
    }

    // CVV
    const cvv = document.getElementById('cvv').value;
    if (!validateCVV(cvv)) {
      showError('cvv', 'Please enter a valid 3 or 4 digit CVV.');
      valid = false;
    } else {
      clearError('cvv');
    }

    if (!valid) {
      e.preventDefault();
    }
  });
</script>
</body>
</html>