//
//  PosterTableViewCell.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 30/12/20.
//

import UIKit
import Nuke

class PosterTableViewCell: UITableViewCell {
    
    @IBOutlet private var backgroundImage: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var yearLabel: UILabel!
    @IBOutlet private var btn: UIButton!
    var poster: Poster? {
        didSet {
            setUpCell()
        }
    }
    
    func setUpCell() {
        if let url = URL(string: poster?.posterUrl ?? "") {
            Nuke.loadImage(with: url, into: backgroundImage)
        } else {return}
        
        titleLabel.text = poster?.title ?? ""
        yearLabel.text = poster?.year ?? ""
    }

}
