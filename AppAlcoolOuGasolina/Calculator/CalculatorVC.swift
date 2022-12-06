//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Michelli Cristina de Paulo Lima on 04/12/22.
//

import UIKit

class CalculatorVC: UIViewController {

    var screen: CalculatorScreen?
    var alert: Alert?

    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }

    override func viewDidLoad() {
        alert = Alert(controller: self)
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        screen?.delegate(delegate: self)
    }

    func validateTextField() -> Bool {

        guard let ethanolPrice = screen?.ethanolPriceTextField.text else { return false }
        guard let gasPrice = screen?.gasPriceTextField.text else { return false }

        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valores do álcool e de gasolina")
            return false
        } else if ethanolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor do Álcool")
            return false
        } else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor da Gasolina")
            return false
        }

        return true
    }
}

extension CalculatorVC: CalculatorScreenDelegate {

    func tappedCalculateButton() {

        if validateTextField() {

            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal

            let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            let gasPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0

            let vc: ResultVC?
            if ethanolPrice / gasPrice > 0.7 {
                vc = ResultVC(bestFuel: .gas)
            } else {
                vc = ResultVC(bestFuel: .ethanol)
            }

            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)

        }

    }

    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }

}
