// Student: Makoto Ushizaki
// Class: 1G
// First semester of 2026

import Foundation

struct ContaBank {
    let numero: Int
    let titular: String
    let senha: Int
    var saldo: Double
    let isAdmin: Bool
}

// Create hardcoded admin account (and insert it at the first position of contas)
func criarAdmin(contas: inout [ContaBank]) {
    let numAd = 666666
    let senhaAd = 1982
    let titularAd = "SuperAdmin"
    let saldoAd = 0.0
    let isAdminAd = true
    contas.append(ContaBank(numero: numAd, titular: titularAd, senha: senhaAd, saldo: saldoAd, isAdmin: isAdminAd))
}
// MENU
func menuPrincipal() -> Int {
    print("\n===| Menu Principal |===")
    print("1 - Cadastrar nova conta")
    print("2 - Fazer login")
    print("3 - Sair do programa")
    print("Escolha uma opção: ") 
    let opcao = Int(readLine()!)!
    return opcao 
}
func menuAdminPrincipal() -> Int {
    print("\n===| Menu ADMIN |===")
    print("1 - Listar todas as contas")
    print("2 - Remover conta")
    print("3 - Logout")
    print("Escolha uma opção: ") 
    let escolha = Int(readLine()!)!
    return escolha
}
func menuUsuarioPrincipal() -> Int {
    print("===| MENU USUARIO |===")
    print("1 - Ver saldos/dados")
    print("2 - Depositar")
    print("3 - Transferir")
    print("4 - Logout")
    print("5 - Funcionalidade extra: pagamento de boleto")
    print("Escolha uma opção: ")
    let escolha = Int(readLine()!)!
    return escolha
}
// Registers a new account and returns the created ContaBank
func cadastroConta() -> ContaBank {
    print("Iniciando cadastro de nova conta:")
    print("- Novo número: ")
    let num = Int(readLine()!)!
    print("- Nome do titular: ")
    let titular = readLine()!
    print("- Senha nova: ")
    let senha = Int(readLine()!)!
    print("- Saldo inicial: ")
    let saldo = Double(readLine()!)!
    return ContaBank(numero: num, titular: titular, senha: senha, saldo: saldo, isAdmin: false)
}
// Account login; checks whether the user exists and whether they are an admin or not
// If the user exists, calls the user menu or the admin menu function
// If it does not exist, prints that the account was not found
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
    // For each account in the accounts array, checks whether the number and password match the account's values
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

// Admin account menu
func menuContaAdmin(contas: inout [ContaBank]) {

    
    let contaAdmin = contas[0]
    print("Saldo do admin: \(contaAdmin.saldo)")
    while true {
        let escolha = menuAdminPrincipal()
        print("A opção selecionada foi a \(escolha)")
        switch escolha {
            case 1:
                print("Listar todas as contas: ")
                print("=========================")
                var _: ContaBank? = nil
                for conta in contas {
                    print("Nome: \(conta.titular)")
                    print("Número: \(conta.numero)") 
                    print("Saldo: \(conta.saldo)")
                    print("=========================")
                }
            case 2:
                print("Informe o número da conta para remover: ")
                let numConta = Int(readLine()!)!
                if numConta == 666666 {
                    print("Esta conta não pode ser removida pois pertence ao Admin!")
                } else {
                    var pos = 0
                    for conta in contas {
                        if numConta == conta.numero {
                            print("Removendo conta número \(conta.numero)")
                            contas.remove(at: pos)
                            print("Esta conta foi removida")
                        } else {
                            pos = pos + 1
                        }
                    }
                    
                }
            case 3:
                print("Logout do admin")
                return
            
            default:
                print("Opção inválida!")
        }   
                
        
    }
}

    

// User account menu
func menuContaUsuario(posUsuario: Int, contas: inout [ContaBank]) {
    
    while true {
        let escolha = menuUsuarioPrincipal()
        print("A opção selecionada foi a \(escolha)")
        switch escolha {
            case 1: 
                print("=========================")
                print("Ver saldos e dados")
                print("Nome: \(contas[posUsuario].titular)")
                print("Número: \(contas[posUsuario].numero)") 
                print("Saldo: \(contas[posUsuario].saldo)")
                print("=========================")
            case 2:
                print("Adicionar saldo na \(contas[posUsuario].numero)")
                print("Informar valor para depositar: ")
                let deposito = Double(readLine()!)!
                contas[posUsuario].saldo += deposito
                print("Saldo final: \(contas[posUsuario].saldo)")
            case 3:
                print("Enviar dinheiro para outra conta")
                print("Informar o número da conta destino: ")
                let numDestino = Int(readLine()!)!
                var posDestino = 0
                // Looks up the transfer's destination account within the accounts array
                for conta in contas {
                    if numDestino == conta.numero {
                        print("Conta destino encontrada do titular \(conta.titular)")
                        print("Informar o valor ao ser transferido: ")
                        let valorTransf = Double(readLine()!)!
                        // Transfer transaction: subtracts from the source account and adds to the destination account's balance
                        contas[posUsuario].saldo -= valorTransf
                        contas[posDestino].saldo += valorTransf
                        print("Transferência realizada com sucesso!")
                    } else {
                        posDestino += 1
                    }
                }
                
            case 4:
                print("Logout do usuário")
                return
            // Extra feature, bill payment 
            case 5:
                print("===| Pagamento de boleto |===")
                print("Informe o valor a pagar: ")
                let pagBoleto = Double(readLine()!)!
                // Payment transaction: subtracts the bill amount from the source account
                contas[posUsuario].saldo -= pagBoleto
                print("Pagamento R$ \(pagBoleto) realizado com sucesso!")
            
            default:
                print("Opção inválida!") 
        }
    }
}


// MAIN
// Array of ContaBank
var contas: [ContaBank] = []

// Create the admin at the first position
criarAdmin(contas: &contas)

while true {
    let opcao = menuPrincipal()
    print("A opção escolhida foi: \(opcao)")
    
    switch opcao {
        case 1:
            let novaConta = cadastroConta()
            print("A nova conta de número \(novaConta.numero) do titular \(novaConta.titular) foi criada com sucesso!")
            contas.append(novaConta)
        case 2:
            loginConta(contas: &contas)
            
        case 3:
            print("Finalizando programa!")
            exit(0)
        
        default:
            print("Opção inválida!")
    }
}
