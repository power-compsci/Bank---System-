# 🏦 ContaBank - Bank System in ![GitHub stars](https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white)


## 1. 📜 Introduction
<div align="justify">
  This project simulates a bank system in which users can create accounts, log in, check their balance, make deposits, transfer money and pay bills, while an admin account can list and remove accounts. I built it to practice core programming concepts such as structs, arrays, functions, control flow and user input handling.
  All data is stored in an in-memory array of <code>ContaBank</code> structs, so it is lost every time the program is closed.
</div>

## 2. ⚙️ Functions
- Menu
  - Main menu shows options from 1 to 3 and lets the user register or login an existing account.
  <img width="207" height="103" alt="Screenshot 2026-10-17 161908" src="https://github.com/user-attachments/assets/51e97d17-963d-4377-a08e-662d5cb11ed6" />

  - Admin's menu lets him list accounts and remove accounts.
  <img width="208" height="105" alt="image" src="https://github.com/user-attachments/assets/3cc7b78a-f362-4537-85cb-14b603704150" />

  - After registering a new account -> login with ID and password -> user's menu interface is shown
  <img width="353" height="400" alt="image" src="https://github.com/user-attachments/assets/90ca63e5-1438-4c45-ad7b-e3596a33eafc" />

- Code function to find admin's account
  -  After logging in, this function checks if it's an admin or not. It compares if the ID and password stored in the struct ContaBank corresponds to the admin's credentials.
```swift
func loginConta(contas: inout [ContaBank]) {
    print("Fazer login:")
    print("- Número: ")
    let num = Int(readLine()!)!
    print("- Senha: ")
    let senha = Int(readLine()!)!

    var contaEncontrada = false
    var isAdmin = false
    var nomeTitular: String? = nil
    var pos = 0
    // For each account in the accounts array, checks whether the number and password match
    for conta in contas {
        if conta.numero == num && conta.senha == senha {
            contaEncontrada = true
            nomeTitular = conta.titular
            // Checking whether the account is an admin
            if conta.isAdmin {
                isAdmin = true
            }
            break
        } else {
            pos += 1
        }
    }
    if contaEncontrada == false {
        print("Conta não encontrada, tente novamente!")
    } else {
        print("Bem-vindo \(nomeTitular ?? "") do número \(String(describing: num))")
        if isAdmin {
            menuContaAdmin(contas: &contas)
        } else {
            menuContaUsuario(posUsuario: pos, contas: &contas)
        }
    }
}
```
## 3. 

