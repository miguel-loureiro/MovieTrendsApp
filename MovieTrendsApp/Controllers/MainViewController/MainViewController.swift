//
//  MainViewController.swift
//  MovieTrendsApp
//
//  Created by António Loureiro on 26/12/2023.
//

import UIKit

class MainViewController: UIViewController {

    // IBOutlets:
    @IBOutlet weak var tableView: UITableView!

    // ViewModel:
    var viewModel: MainViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }

    func configView() {

        self.title = "Main View"
        self.view.backgroundColor = .systemRed

        setupTableView()
    }

    /// Completion handler version
    /*override func viewDidAppear(_ animated: Bool) {
     viewModel.fetchData()
     }*/

    /// Async Await version
    override func viewDidAppear(_ animated: Bool) {
        
        Task {
            await viewModel.fetchData()
        }
    }
}
