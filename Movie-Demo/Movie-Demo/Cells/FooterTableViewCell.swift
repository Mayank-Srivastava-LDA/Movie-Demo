//
//  FooterTableViewCell.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 30/12/20.
//

import UIKit

class FooterTableViewCell: UITableViewCell {
    
    @IBOutlet private var directorLabel: UILabel!
    @IBOutlet private var actorsLabel: UILabel!
    @IBOutlet private var writerLabel: UILabel!
    var footer: Footer? {
        didSet {
            setUpCell()
        }
    }

    func setUpCell() {
        directorLabel.attributedText = getAttributedString(title: "Director", description: (footer?.director ?? ""))
        
        writerLabel.attributedText = getAttributedString(title: "Writer", description: (footer?.writer ?? ""))
        
        actorsLabel.attributedText = getAttributedString(title: "Actors", description: (footer?.actor ?? ""))
    }
    
    private func getAttributedString(title: String, description: String) -> NSAttributedString {
    
        let mutableAttributedString = NSMutableAttributedString(string: title + ":  ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17.0)])
        
        let attributedString = NSAttributedString(string: description)
        mutableAttributedString.append(attributedString)
        
        return mutableAttributedString
    }
}
