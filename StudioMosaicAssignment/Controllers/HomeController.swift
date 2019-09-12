//
//  ViewController.swift
//  StudioMosaicAssignment
//
//  Created by alice singh on 09/09/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

class HomeController: UIViewController {
    
    var interactor: HomeBusinessLogic?
    var viewModels: [NewsViewModel] = []
    
    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = UISearchBar(placeholder: "Find more")
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = true
        tableView.keyboardDismissMode = .onDrag
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HomeCell.self)
        return tableView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        makeModules()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        interactor?.viewDidLoad()
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor.flatWhite
        self.view.addSubview(tableView)
        self.navigationItem.title = "News Feed"
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func makeModules() {
        let homeiteractor = HomeIterator()
        homeiteractor.controller = self
        
        self.interactor = homeiteractor
    }
}

extension HomeController: HomeDisplayLogic {
    func renderViewModels(_ viewModels: [NewsViewModel]) {
        self.viewModels = viewModels
        self.tableView.reloadData()
    }
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell  = tableView.dequeueReusableCell(indexPath)
        let viewModel = viewModels[indexPath.row]
        cell.setupData(viewModel)
        return cell
    }
}

extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModels[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let url = model.url {
            UIApplication.shared.open(url, options: [:]) { value in
            }
        }
    }
}
