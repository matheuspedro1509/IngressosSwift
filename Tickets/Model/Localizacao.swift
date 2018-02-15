//
//  Localizacao.swift
//  Tickets
//
//  Created by Nutela on 15/02/18.
//  Copyright © 2018 Matheus S. All rights reserved.
//

import UIKit

class Localizacao: NSObject {

    var logradouro = ""
    var bairro = ""
    var cidade = ""
    var uf = ""
    
    
    init(_ dicionario : Dictionary<String,String>){
        logradouro = dicionario["logradouro"] ?? ""
        bairro = dicionario["bairro"] ?? ""
        cidade = dicionario["localidade"] ?? ""
        uf = dicionario["uf"] ?? ""
    }
}
