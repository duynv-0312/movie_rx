//
//  BaseViewController.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 26/04/2024.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        
    }
    
    func next(ctrl: UIViewController) {
        navigationController?.pushViewController(ctrl, animated: true)
    }
    
    func back() {
        navigationController?.popViewController(animated: true)
    }
    
    func backToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func backToView(ctrl: UIViewController) {
        navigationController?.pushViewController(ctrl, animated: true)
    }
}
