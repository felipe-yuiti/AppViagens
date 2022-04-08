//
//  DetalheViewController.swift
//  AppViagens
//
//  Created by Felipe Yuiti on 05/04/22.
//

import UIKit

class DetalheViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var viagemDiariaLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    
    var viagem: Viagem?
    
    class func instanciar(_ viagem: Viagem) -> DetalheViewController{
        let detalhesViewController  = DetalheViewController(nibName: String(describing: self), bundle: nil)
        detalhesViewController.viagem = viagem
        return detalhesViewController
    }
    
    //MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
    }
    
    func configuraView() {
        
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        viagemDiariaLabel.text = "R$\(viagem?.preco ?? 0)"
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)");
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        
        precoSemDescontoLabel.attributedText = atributoString
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes
        {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            
            viagemDiariaLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes)"
        }
    }

    //MARK: - Actions
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
