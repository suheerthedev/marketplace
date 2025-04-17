# Authentication Implementation Guide

This guide explains the authentication implementation for the Marketplace app.

## Overview

The authentication system connects to the backend API and handles:
- User registration
- Email verification via OTP
- User login
- Session management

## Core Components

### 1. Models

- **UserModel**: Represents user data returned from the API
- **RegisterResponse**: Handles registration API responses
- **OtpVerificationResponse**: Handles OTP verification API responses
- **LoginResponse**: Handles login API responses

### 2. Services

- **ApiService**: Centralized service for making HTTP requests with proper headers
- **AuthenticationService**: Manages authentication state and communicates with the API

### 3. ViewModels

- **BuyerLoginViewModel**: Handles login form and validation
- **BuyerSignUpViewModel**: Handles registration form and validation
- **VerificationViewModel**: Handles OTP verification

## Authentication Flow

### Registration Flow
1. User enters registration details in BuyerSignUpView
2. BuyerSignUpViewModel validates the input
3. AuthenticationService.register() is called with user details
4. API responds with success or validation errors
5. On success, user is redirected to verification screen
6. On error, validation errors are displayed

### Verification Flow
1. User enters the OTP received via email
2. VerificationViewModel validates the input
3. AuthenticationService.verifyOtp() is called
4. API confirms verification status
5. On success, user is redirected to main app view
6. On error, error message is displayed with option to resend OTP

### Login Flow
1. User enters login credentials in BuyerLoginView
2. BuyerLoginViewModel validates the input
3. AuthenticationService.login() is called
4. API responds with success, email not verified, or error
5. On success, user is redirected to main app view
6. If email is not verified, user is redirected to verification screen
7. On error, error messages are displayed

### Session Management
1. Authentication token is stored in SharedPreferences
2. App checks for existing token on startup
3. If token exists, user session is restored
4. API requests include the token for authenticated endpoints

## API Response Handling

The authentication implementation handles different API response scenarios:

### Registration
- Success: Token and user data returned
- Error: Validation errors returned (e.g., email already taken)

### OTP Verification
- Success: "OTP verified successfully" message and token
- Already Verified: "Email is already verified" message
- Error: "Invalid OTP" message

### Login
- Success: Token and user data returned, email_verified flag is true
- Email Not Verified: Message indicating email verification required
- Error: Validation errors (invalid credentials, etc.)

## Error Handling

- Field-specific validation errors (email, password, etc.)
- General errors for network issues or unexpected responses
- Clear error messaging for user feedback

## Usage Example

```dart
// Registration example
final result = await _authService.register(
  firstName: "John",
  lastName: "Doe",
  email: "john.doe@example.com",
  password: "password123",
  phoneNumber: "+1234567890",
  country: "US"
);

// Login example
final result = await _authService.login(
  email: "john.doe@example.com",
  password: "password123"
);

// OTP verification example
final result = await _authService.verifyOtp(
  email: "john.doe@example.com",
  otp: "123456"
);
``` 