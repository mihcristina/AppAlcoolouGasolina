//
//  HomeVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Michelli Cristina de Paulo Lima on 04/12/22.
//

import UIKit

class HomeVC: UIViewController {

    var screen: HomeScreen?

    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }

}

extension HomeVC: HomeScreenDelegate {

    func tappedStartButton() {
        let vc = CalculatorVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}
