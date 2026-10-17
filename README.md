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
- Administrator
  - Lists accounts by searching through the array 'contas' and gets the information 'titular', 'numero' and 'saldo'. These are struct identifiers meant to find the right information.
  <img width="215" height="398" alt="image" src="https://github.com/user-attachments/assets/dcd2c84e-65c9-43c1-8465-cfcf3119a73b" />

  - Removes accounts by requesting the account's ID, calls function remove based on the given ID.
  <img width="305" height="182" alt="image" src="https://github.com/user-attachments/assets/48fc4830-0d22-410e-838a-b58aa8940f43" />

- User
  - Deposit -> asks the amount, adds to the user's bank balance in its array position and uses 'saldo' as an identifier.
  <img width="352" height="219" alt="image" src="https://github.com/user-attachments/assets/4f90143e-724b-4f36-af44-c666e5499d73" />

  - Transfer -> send an amount to another registered account, comparing if the ID is correlated to the destination's ID and using 'numero' and 'saldo' as an identifier.
  <img width="353" height="260" alt="image" src="https://github.com/user-attachments/assets/44c55642-5584-4dee-9e4a-202cbe602e6f" />

## 3. ▶️ Compile & Execution 
> [!NOTE]
   > **Prerequisites -> installed swift (macOS, Linux or Windows)**
- Platform: VSCode

**Compile:**
```bash
swiftc main.swift -o contabank
```

**Run:**
```bash
./contabank
```
## 4. 🚀 Possible improvements
* Validate user input and handle errors without using `!`.
* Prevent negative balances and duplicate account numbers.
* Persist data in a file (JSON) or a database.
* Store passwords securely (hashing).
* Record transaction history (statement).

## 5. 📩 Contact

- **Name**: Naoto Ushizaki
- **Email**: 10437445@mackenzista.com.br
- **Linkedin**: www.linkedin.com/in/naoto-ushizaki-30b94a172
- **GitHub**: [@mackcoder](https://github.com/mackcoder)
