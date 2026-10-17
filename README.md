# 🏦 ContaBank - Bank System in ![GitHub stars](https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white)


## 1. 📜 Introduction
<div align="justify">
  ContaBank is a command-line bank system that simulates the everyday operations of a bank account. Users can create an account, log in, check their balance, make deposits, transfer money and pay bills, while a special admin account can list and remove accounts.

I built this project to practice core programming concepts such as structs, arrays, functions, control flow and user input handling. All data is stored in an in-memory array of ContaBank structs, so it is lost every time the program is closed.
</div>

## 2. ⚙️ How it works
### Menus
When the program starts, the **main menu** offers three options: register a new account, log in to an existing one, or exit.

  <img width="207" height="103" alt="Screenshot 2026-10-17 161908" src="https://github.com/user-attachments/assets/51e97d17-963d-4377-a08e-662d5cb11ed6" />

Admin's menu lets him list accounts and remove accounts.
  
  <img width="208" height="105" alt="image" src="https://github.com/user-attachments/assets/3cc7b78a-f362-4537-85cb-14b603704150" />

After registering an account and logging in with its number and password, the **user menu** is shown.
  <img width="353" height="400" alt="image" src="https://github.com/user-attachments/assets/90ca63e5-1438-4c45-ad7b-e3596a33eafc" />

### Login and admin detection
  -  After the user enters an account number and password, the `loginConta` function searches the accounts array for a match. When it finds one, it checks the `isAdmin` field of the `ContaBank` struct to decide which menu to open: the admin menu or the user menu.
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
### Administrator features
- **List accounts:** goes through the `contas` array and prints each account's `titular`, `numero` and `saldo`.
  
  <img width="215" height="398" alt="image" src="https://github.com/user-attachments/assets/dcd2c84e-65c9-43c1-8465-cfcf3119a73b" />

- **Remove account:** asks for the account number and removes the matching account from the array. The admin account itself cannot be removed.
  
  <img width="305" height="182" alt="image" src="https://github.com/user-attachments/assets/48fc4830-0d22-410e-838a-b58aa8940f43" />

## 3. ▶️ Compile & Run

> [!NOTE]
> **Prerequisite:** Swift installed on your machine (macOS, Linux or Windows). This project was developed in VSCode.

**Compile:**
```bash
swiftc main.swift -o contabank
```

**Run:**
```bash
./contabank
```

## 4. 🚀 Possible improvements

- Validate user input and handle errors without using `!`.
- Prevent negative balances and duplicate account numbers.
- Persist data in a file (JSON) or a database.
- Store passwords securely (hashing).
- Record transaction history (statement).

## 5. 📩 Contact

- **Name:** Makoto Ushizaki
- **Email:** 10769688@mackenzista.com.br
- **LinkedIn:** [makoto-ushizaki](https://www.linkedin.com/in/makoto-ushizaki-96a670403)
- **GitHub:** [@mackcoder](https://github.com/power-compsci)
