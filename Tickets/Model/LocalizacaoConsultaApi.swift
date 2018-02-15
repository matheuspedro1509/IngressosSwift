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
    
    func consultaViaCepApi(cep:String){
        Alamofire.request("https://viacep.com.br/ws/04101300/json/", method: .get).validate().responseJSON { (response) in
            switch response.result{
            case .success:
                
                if let resultado =  response.result as? Dictionary<String,String>{
                    
                }
                break
            case .failure:
                
                break
            }
        }
    }
}
