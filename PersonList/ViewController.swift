//
//  ViewController.swift
//  PersonList
//
//  Created by guntex01 on 5/22/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        persons = fakeData()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addPerson(){
        let vc = CreatePersonViewController()
        vc.passData = { [weak self] data in
            guard let strongSelf = self else { return }
            strongSelf.persons.append(data)
            strongSelf.tableView.reloadData()
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.person = persons[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action, view, completion ) in
            print ("Edit")
            let vc = CreatePersonViewController()
            vc.personCurront = self.persons[indexPath.row]
            vc.passData = { [weak self] data in
                guard let strongSelf = self else {return}
                strongSelf.persons[indexPath.row] = data
                strongSelf.tableView.reloadData()
                }
            self.navigationController?.pushViewController(vc, animated: true)
            }
            
        let delete = UIContextualAction(style: .destructive, title: "Delete") {(action, view, completion) in
            self.persons.remove(at: indexPath.row)
            tableView.reloadData()
            }
        edit.backgroundColor = .blue
        delete.backgroundColor = .red
        let configration = UISwipeActionsConfiguration(actions: [edit, delete])
        
        return configration
        
        
    }
}

