//
//  MovieDetailDataSourse.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 05/01/21.
//

import UIKit

class MovieDetailDataSourse: NSObject {
    var cellTypes = [CellType]()
}

extension MovieDetailDataSourse: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = cellTypes[indexPath.row]
        switch cellType {
        case .header(let poster):
            return self.tableView(tableView, posterCellForRowAt: indexPath, poster: poster)
        case .synopsis(let catagory):
            return self.tableView(tableView, summaryCellForRowAt: indexPath, catagory: catagory)
        case .footerNote(let footer):
            return self.tableView(tableView, footerCellForRowAt: indexPath, footer: footer)
        }
    }
    
    func tableView(_ tableView: UITableView, posterCellForRowAt indexPath: IndexPath, poster: Poster) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! PosterTableViewCell
        cell.poster = poster
        return cell
    }
    
    func tableView(_ tableView: UITableView, summaryCellForRowAt indexPath: IndexPath, catagory: Catagory) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! SummaryTableViewCell
        cell.catagory = catagory
        return cell
    }
    
    func tableView(_ tableView: UITableView, footerCellForRowAt indexPath: IndexPath, footer: Footer) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") as! FooterTableViewCell
        cell.footer = footer
        return cell
    }
}
