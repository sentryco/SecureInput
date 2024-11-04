[![Tests](https://github.com/sentryco/SecureInput/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/SecureInput/actions/workflows/Tests.yml)
[![codebeat badge](https://codebeat.co/badges/2a87ea47-ffe8-4147-abdd-1d12a1fda9c5)](https://codebeat.co/projects/github-com-sentryco-secureinput-main)

# SecureInput

> Secure input UI (macOS / iOS)

**1. SecureInputView**    

<img width="320" alt="secureinputview" src="https://s1.gifyu.com/images/SOJ0b.gif">

**2. PasswordTextField**  

<img width="320" alt="passwordtextfield" src="https://s1.gifyu.com/images/SOJ02.gif">

**3. SecTextContainer**  

<img width="320" alt="passwordtextfield" src="https://s11.gifyu.com/images/SOJ0K.gif">

**4. SecureTextView**  

<img width="320" alt="passwordtextfield" src="https://s1.gifyu.com/images/SOJ0H.gif">

## Description

This repository provides a collection of secure text input UI components, each with its unique features and trade-offs. They are designed to serve various purposes in applications that prioritize secure data handling. For more detailed information and the rationale behind each component, please refer to the code comments within the UI components.

## Features

1. `SecureInputView`: obfuscation-toggle, SecureText
2. `PasswordTextField`: obfuscation-toggle, SecureText and restrictor-callback
3. `SecTextContainer`: obfuscation-toggle, attribute and multiline (Not using SecureText and not editable)
4. `SecureTextView`: obfuscation-toggle, multiline (Not using SecureText)

## Instalation

Add this to XCode or SPM:

```swift
.package(url: "https://github.com/sentryco/SecureInput", branch: "main")
```

## Todo

- Add Attributed TextField that is editable
