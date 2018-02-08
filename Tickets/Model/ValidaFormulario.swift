//
//  ValidaFormulario.swift
//  Tickets
//
//  Created by Nutela on 08/02/18.
//  Copyright © 2018 Matheus S. All rights reserved.
//

import UIKit
import CPF_CNPJ_Validator


enum TipoTextField: Int {
    case nomeCompleto = 1
    case email = 2
    case cpf = 3
    case cep = 4
    case endereco = 5
    case bairro = 6
    case numeroCartao = 7
    case mesVencimento = 8
    case AnoVencimento = 9
    case CodSeguranca = 10
}

class ValidaFormulario: NSObject {

    func verificaTextField(textFields : Array<UITextField>) -> Bool{
        for textField in textFields {
            if textField.text == "" {
                return false
            }
        }
        return true
    }
    
    func exibeNotificacao(titulo: String, mensagem: String) -> UIAlertController {
        let notificacao = UIAlertController.init(title: titulo, message: mensagem, preferredStyle: .alert)
        let botao = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        notificacao.addAction(botao)
        
        return notificacao
    }
    
    func verificaTextFieldsValidos(textFields: Array<UITextField>) -> Bool {
        var dicionarioTextField : Dictionary<TipoTextField , UITextField> = [ : ]
        
        for textField in textFields {
            if let tiposTextField = TipoTextField(rawValue: textField.tag){
                dicionarioTextField[tiposTextField] = textField
            }
        }
        guard let cpf = dicionarioTextField [.cpf] , BooleanValidator().validate(cpf: cpf.text!)  else{ return false}
        return true
    }
}
