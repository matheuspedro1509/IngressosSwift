//
//  LocalizacaoConsultaApi.swift
//  Tickets
//
//  Created by Nutela on 15/02/18.
//  Copyright © 2018 Matheus S. All rights reserved.
//

import UIKit
import Alamofire

class LocalizacaoConsultaApi: NSObject {
    
    func consultaViaCepApi(cep:String, sucesso : @escaping(_ localizacao : Localizacao) -> Void, falha: @escaping(_ erro: Error) -> Void ){
        Alamofire.request("https://viacep.com.br/ws/\(cep)/json/", method: .get).validate().responseJSON { (response) in
            switch response.result{
            case .success:
                
                if let resultado =  response.result.value as? Dictionary<String,String>{
                    let localizacao = Localizacao.init(resultado)
                    sucesso(localizacao)
                }
                break
            case .failure:
                falha(response.result.error!)
                break
            }
        }
    }
}
