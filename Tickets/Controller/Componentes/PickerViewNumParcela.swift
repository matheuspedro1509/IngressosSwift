//
//  PickerViewNumParcela.swift
//  Tickets
//
//  Created by Nutela on 25/02/18.
//  Copyright © 2018 Matheus S. All rights reserved.
//

import UIKit

protocol PickerViewNumeroDeParcela {
    func parcelaSelecionada(numParcela: String)
}

class PickerViewNumParcela: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate : PickerViewNumeroDeParcela?

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)x"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil{
            delegate?.parcelaSelecionada(numParcela: "\(row + 1)")
        }
    }
    
}
