//
//  ViewController.swift
//  Tickets
//
//  Created by Nutela on 06/02/18.
//  Copyright © 2018 Matheus S. All rights reserved.
//

import UIKit



class ViewController: UIViewController, PickerViewSelecionado , PickerViewAnoSelecionado{

    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet var textFields: [UITextField]!
    var pickerMes = PickerViewMes()
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    var pickerAno = PickerViewAno()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imgBanner.layer.cornerRadius = 10
        self.imgBanner.layer.masksToBounds = true
 
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarTela(notification:)), name: .UIKeyboardWillShow, object: nil)
        
        pickerMes.delegate = self
        pickerAno.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func aumentarTela(notification: Notification){
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 750)
    }
    
    func buscaTextField(tipoTextField: TipoTextField, completion: (_ textFieldSolicitado: UITextField)-> Void){
        for textField in textFields{
            if let textFieldAtual =  TipoTextField(rawValue : textField.tag){
                if textFieldAtual == tipoTextField{
                    completion(textField)
                }
            }
        }
    }

    @IBAction func botaoComprar(_ sender: UIButton) {
        let textFieldPreenchidos = ValidaFormulario().verificaTextField(textFields: textFields)
        let textFieldValidos = ValidaFormulario().verificaTextFieldsValidos(textFields: textFields)
        
        if (textFieldPreenchidos && textFieldValidos){
            let alerta = ValidaFormulario().exibeNotificacao(titulo: "Parabens", mensagem: "Compra realizada com sucesso")
            present(alerta, animated: true, completion: nil)
        }else{
            let alerta = ValidaFormulario().exibeNotificacao(titulo: "Atenção", mensagem: "Preencha todos os campos corretamente")
            present(alerta, animated: true, completion: nil)
        }
    }
   
    @IBAction func textFieldCep(_ sender: UITextField) {
    
        LocalizacaoConsultaApi().consultaViaCepApi(cep: sender.text!, sucesso: { (localizacao) in
            self.buscaTextField(tipoTextField: .endereco, completion: { (textFieldEndereco) in
                textFieldEndereco.text =  localizacao.logradouro
            })
            self.buscaTextField(tipoTextField: .bairro, completion: { (textFieldBairro) in
                textFieldBairro.text = localizacao.bairro
            })
        }) { (error) in
            print(error)
        }
    }
    
    @IBAction func textFieldEmFoco(_ sender: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = pickerMes
        pickerView.dataSource = pickerMes
        sender.inputView = pickerView
        
    }
    
    @IBAction func textFieldAno(_ sender: UITextField) {
        let pickerView = UIPickerView()
        pickerView.delegate = pickerAno
        pickerView.dataSource = pickerAno
        sender.inputView = pickerView
    }
    
    
        //implementando os delegates
    func mesSelecionado(mes: String) {
        self.buscaTextField(tipoTextField: .mesVencimento) { (textFieldMes) in
            textFieldMes.text = mes
        }
    }
    
    func anoSelecionado(ano: String) {
        self.buscaTextField(tipoTextField: .AnoVencimento) { (textFieldAno) in
            textFieldAno.text = ano
        }
    }
    
    
}

