//
//  MovieHeader.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 02/05/2024.
//

import UIKit
import Localize_Swift
import Reusable

final class MovieHeader: UITableViewHeaderFooterView, NibReusable {

    @IBOutlet private weak var containerVIew: UIView!
    @IBOutlet private weak var headerTitleLabel: UILabel!
    @IBOutlet private weak var seeMoreButton: UIButton!
    var showMoreTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configHeaderView()
    }
    
    private func configHeaderView() {
        seeMoreButton.setTitle("home.seemore".localized(), for: .normal)
    }
    
    func configView(title: String) {
        headerTitleLabel.text = title
    }
    
    @IBAction func tappedSeeMoe(_ sender: Any) {
        showMoreTapped?()
    }
}
