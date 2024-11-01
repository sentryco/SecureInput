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
A series of Secure-text-input UI's. Each has unique features but also tradeoffs. And serves different purpouses throughout an app that rely on security being handled correctly. See code comments in the UI's for more detail and rational behind each component. 

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
- Clean up code comments 👈
- Restrict description to 80char wide with ai 👈
- Improve the description with copilot
- Add Attributed TextField that is editable
