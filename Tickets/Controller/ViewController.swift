//
//  ViewController.swift
//  Tickets
//
//  Created by Nutela on 06/02/18.
//  Copyright © 2018 Matheus S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet var textFields: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imgBanner.layer.cornerRadius = 10
        self.imgBanner.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botaoComprar(_ sender: UIButton) {
        let textFieldPreenchidos = ValidaFormulario().verificaTextField(textFields: textFields)
        
        if (textFieldPreenchidos){
            let alerta = ValidaFormulario().exibeNotificacao(titulo: "Parabens", mensagem: "Compra realizada com sucesso")
            present(alerta, animated: true, completion: nil)
        }else{
            let alerta = ValidaFormulario().exibeNotificacao(titulo: "Atenção", mensagem: "Preencha todos os campos corretamente")
            present(alerta, animated: true, completion: nil)
        }
    }
    
}

