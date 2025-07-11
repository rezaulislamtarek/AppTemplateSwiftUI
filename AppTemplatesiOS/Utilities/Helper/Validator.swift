//
//  Validator.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//

import Foundation

class Validator {
    
    // MARK: - Phone Number Validation
    static func validatePhone(_ phone: String) -> String? {
        let trimmedPhone = phone.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check if empty
        if trimmedPhone.isEmpty {
            return "Phone number is required"
        }
        
        // Remove spaces and special characters for validation
        let cleanPhone = trimmedPhone.replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
        
        // Saudi phone number format: +966xxxxxxxx or 05xxxxxxxx
        let saudiPhoneRegex = "^(\\+966|966|05)[0-9]{8}$"
        let phoneRegex = "^[+]?[0-9]{10,15}$" // General phone format
        
        let saudiPredicate = NSPredicate(format: "SELF MATCHES %@", saudiPhoneRegex)
        let generalPredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        
        if saudiPredicate.evaluate(with: cleanPhone) || generalPredicate.evaluate(with: cleanPhone) {
            return nil // Valid
        } else {
            return "Please enter a valid phone number"
        }
    }
    
    // MARK: - Password Validation
    static func validatePassword(_ password: String) -> String? {
        if password.isEmpty {
            return "Password is required"
        }
        
        if password.count < 6 {
            return "Password must be at least 6 characters"
        }
        
        // Strong password check (optional)
        if password.count < 8 {
            return "Password should be at least 8 characters for better security"
        }
        
        // Check for at least one uppercase letter
        let uppercaseRegex = ".*[A-Z]+.*"
        let uppercasePredicate = NSPredicate(format: "SELF MATCHES %@", uppercaseRegex)
        
        // Check for at least one lowercase letter
        let lowercaseRegex = ".*[a-z]+.*"
        let lowercasePredicate = NSPredicate(format: "SELF MATCHES %@", lowercaseRegex)
        
        // Check for at least one digit
        let digitRegex = ".*[0-9]+.*"
        let digitPredicate = NSPredicate(format: "SELF MATCHES %@", digitRegex)
        
        if !uppercasePredicate.evaluate(with: password) ||
           !lowercasePredicate.evaluate(with: password) ||
           !digitPredicate.evaluate(with: password) {
            return "Password must contain uppercase, lowercase, and number"
        }
        
        return nil // Valid
    }
    
    // MARK: - Email Validation
    static func validateEmail(_ email: String) -> String? {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedEmail.isEmpty {
            return "Email is required"
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if emailPredicate.evaluate(with: trimmedEmail) {
            return nil // Valid
        } else {
            return "Please enter a valid email address"
        }
    }
    
    // MARK: - ID or Iqama Validation
    static func validateIdOrIqama(_ idOrIqama: String) -> String? {
        let trimmedId = idOrIqama.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedId.isEmpty {
            return "ID or Iqama number is required"
        }
        
        // Remove any spaces
        let cleanId = trimmedId.replacingOccurrences(of: " ", with: "")
        
        // Check if it's all numbers
        if !cleanId.allSatisfy({ $0.isNumber }) {
            return "ID or Iqama must contain only numbers"
        }
        
        // Saudi Iqama: 10 digits
        // Saudi National ID: 10 digits
        if cleanId.count != 10 {
            return "ID or Iqama must be exactly 10 digits"
        }
        
        return nil // Valid
    }
    
    // MARK: - Date of Birth Validation
    static func validateDateOfBirth(_ dateOfBirth: Date?, minimumAge: Int = 18) -> String? {
        // Check if date is nil/empty
        guard let dateOfBirth = dateOfBirth else {
            return "Date of birth is required"
        }
        
        // Get current date
        let currentDate = Date()
        
        // Check if date is in the future
        if dateOfBirth > currentDate {
            return "Date of birth cannot be in the future"
        }
        
        // Calculate age
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: currentDate)
        
        guard let age = ageComponents.year else {
            return "Invalid date of birth"
        }
        
        // Check minimum age requirement
        if age < minimumAge {
            return "You must be at least \(minimumAge) years old"
        }
        
        // Optional: Check maximum age (e.g., 120 years)
        if age > 120 {
            return "Please enter a valid date of birth"
        }
        
        return nil // Valid
    }
    
    // MARK: - Date of Birth Validation (String version)
    static func validateDateOfBirth(_ dateString: String, minimumAge: Int = 18, dateFormat: String = "dd/MM/yyyy") -> String? {
        let trimmedDate = dateString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedDate.isEmpty {
            return "Date of birth is required"
        }
        
        // Convert string to Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = dateFormatter.date(from: trimmedDate) else {
            return "Please enter date in \(dateFormat) format"
        }
        
        // Use the Date version of validation
        return validateDateOfBirth(date, minimumAge: minimumAge)
    }
    
    // MARK: - Name Validation
    static func validateName(_ name: String) -> String? {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedName.isEmpty {
            return "Name is required"
        }
        
        if trimmedName.count < 2 {
            return "Name must be at least 2 characters"
        }
        
        if trimmedName.count > 50 {
            return "Name must be less than 50 characters"
        }
        
        return nil // Valid
    }
    
    // MARK: - Confirm Password Validation
    static func validateConfirmPassword(_ confirmPassword: String, originalPassword: String) -> String? {
        if confirmPassword.isEmpty {
            return "Confirm password is required"
        }
        
        if confirmPassword != originalPassword {
            return "Passwords do not match"
        }
        
        return nil // Valid
    }
    
    // MARK: - Required Field Validation
    static func validateRequired(_ value: String, fieldName: String = "This field") -> String? {
        let trimmedValue = value.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedValue.isEmpty {
            return "\(fieldName) is required"
        }
        
        return nil // Valid
    }
    
    // MARK: - Helper Methods for Common Age Validations
    static func validateAdultAge(_ dateOfBirth: Date?) -> String? {
        return validateDateOfBirth(dateOfBirth, minimumAge: 18)
    }
    
    static func validateSeniorAge(_ dateOfBirth: Date?) -> String? {
        return validateDateOfBirth(dateOfBirth, minimumAge: 65)
    }
    
    static func validateTeenAge(_ dateOfBirth: Date?) -> String? {
        return validateDateOfBirth(dateOfBirth, minimumAge: 13)
    }
    
    static func validateSchoolAge(_ dateOfBirth: Date?) -> String? {
        return validateDateOfBirth(dateOfBirth, minimumAge: 6)
    }
}
