//
//  PickerViewAno.swift
//  Tickets
//
//  Created by Nutela on 25/02/18.
//  Copyright © 2018 Matheus S. All rights reserved.
//

import UIKit

protocol PickerViewAnoSelecionado {
    func anoSelecionado(ano : String)
}
class PickerViewAno: NSObject , UIPickerViewDataSource, UIPickerViewDelegate{
    
    var delegate:PickerViewAnoSelecionado?
    let listaDeAnos = ["2018", "2019", "2020", "2021" , "2022"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listaDeAnos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listaDeAnos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil{
            delegate?.anoSelecionado(ano: listaDeAnos[row])
        }
    }

}
