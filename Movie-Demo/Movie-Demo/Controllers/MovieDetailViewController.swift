//
//  MovieDetailViewController.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 29/12/20.
//

import UIKit

struct Poster {
    var posterUrl: String
    var title, year: String
}
struct Catagory {
    var catoagry: String
    var rating: String
    var duration: String
    var summary: String
    var score: String
    var reviews: String
    var popularity: String
}
struct Footer {
    var director, writer, actor: String
}

enum CellType {
    case header(poster: Poster)
    case synopsis(catagory: Catagory)
    case footerNote(footer: Footer)
}

class MovieDetailViewController: UIViewController {
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    var movieId: String = ""
    var dataSourse: MovieDetailDataSourse?
    var presenter: MovieDetailTestMockProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewLoaded()
        setUpView()
        fetchMovieDetails()
    }
}

extension MovieDetailViewController {
    private func setUpView() {
        dataSourse = MovieDetailDataSourse()
        tableView.dataSource = dataSourse
        tableView.delegate = dataSourse
    }
    
    private func fetchMovieDetails() {
        presenter?.onFetchData()
        activityIndicator.startAnimating()
        ServiceManager.shared.getMovieDetail(id: movieId) { [weak self] (result) in
            guard let weakSelf = self else {return}
            weakSelf.activityIndicator.stopAnimating()
            switch result {
            case .success(let detail): weakSelf.setUpDataSourse(modal: detail)
            case .failure(let error): weakSelf.setUpErrorUpdate(error: error)
            }
            
        }
    }
    
    private func setUpDataSourse(modal: MovieDetailModal) {
        var cellTypes = [CellType]()
        let posterUrl = modal.poster ?? ""
        let title = modal.title ?? ""
        let year = modal.year ?? ""
        let poster = Poster(posterUrl: posterUrl, title: title, year: year)
        cellTypes.append(.header(poster: poster))
        
        let duration = modal.runtime ?? ""
        let summary = modal.plot ?? ""
        let rating = modal.imdbRating ?? ""
        let score = modal.metascore ?? ""
        let reviews = modal.metascore ?? ""
        let popularity = modal.metascore ?? ""
        let catagory = Catagory(catoagry: "Catagory", rating: rating, duration: duration, summary: summary, score: score, reviews: reviews, popularity: popularity)
        cellTypes.append(.synopsis(catagory: catagory))
        
        let director = modal.director ?? ""
        let actors = modal.actors ?? ""
        let writer = modal.writer ?? ""
        let footer = Footer(director: director, writer: writer, actor: actors)
        cellTypes.append(.footerNote(footer: footer))
        dataSourse?.cellTypes.append(contentsOf: cellTypes)
        tableView.reloadData()
    }
    
    private func setUpErrorUpdate(error: NetworkError) {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        
        let (title, description) = error.networkHandler
        let string = title + "\n" + description
        label.text = string
        tableView.backgroundView = label
        tableView.reloadData()
    }
}
