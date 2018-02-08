//
//  ValidaFormulario.swift
//  Tickets
//
//  Created by Nutela on 08/02/18.
//  Copyright © 2018 Matheus S. All rights reserved.
//

import UIKit

class ValidaFormulario: NSObject {

    func verificaTextField(textFields : Array<UITextField>) -> Bool{
        for textFields in textFields {
            if textFields.text == "" {
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
}
