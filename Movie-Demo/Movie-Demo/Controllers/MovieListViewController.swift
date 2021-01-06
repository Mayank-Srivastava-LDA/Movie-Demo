//
//  MovieListViewController.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 29/12/20.
//

import UIKit
import Nuke

class MovieListViewController: UIViewController {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var collectionView: UICollectionView!
    
    private var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
        fetchMovieList()
    }
    
    private func setUpScreen() {
        collectionView.isHidden = true
    }
    
    private func fetchMovieList() {
        activityIndicator.startAnimating()
        ServiceManager.shared.getMovieList { [weak self] (result) in
            guard let weakSelf = self else {return}
            switch result {
            case .success(let movieInfo) where Int(movieInfo.movies?.count ?? 0) > 0 :
                let movieList = movieInfo.movies ?? []
                weakSelf.movies.append(contentsOf: movieList)
                weakSelf.updateView()
            case .success:
                weakSelf.updateWithNoData()
            case .failure(let error):
                weakSelf.updateWithError(error: error)
            }
            weakSelf.activityIndicator.stopAnimating()
        }
        
    }
    
    private func updateView() {
        collectionView.isHidden = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    private func updateWithNoData() {
        collectionView.isHidden = false
        collectionView.reloadData()
    }
    
    private func updateWithError(error: NetworkError) {
        collectionView.isHidden = false
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else {return}
        let movie = movies[indexPath.item]
        let viewController = segue.destination as! MovieDetailViewController
        viewController.movieId = movie.imdbID ?? ""
    }
}

extension MovieListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let img = cell.viewWithTag(100) as! UIImageView
        let lbl = cell.viewWithTag(101) as! UILabel
        let movie = movies[indexPath.item]
        if let url = URL(string: movie.poster ?? "") {
            img.isHidden = false
            Nuke.loadImage(with: url, into: img)
        } else {
            img.isHidden = true
        }
        lbl.text = movie.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width/2 - 10, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: nil)
    }
}
