//
//  MainTableViewController.swift
//  UIComponents
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import UIKit

class MainTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.reloadData()
        }

    }

    private var rowCount: Int {
        get {
            return Int.random(in: 1...5)
        }
    }
}

// MARK: - UITableViewDelegate
extension MainTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("currentIndex: ", indexPath.row)

        let cell = tableView.cellForRow(at: indexPath)
        print("cell backgroundColor: ", cell?.backgroundColor?.description)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Int.random(in: 50...150)) //UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
}

// MARK: - UITableViewDataSource
extension MainTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCellIdentifier", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        cell.backgroundColor = UIColor.random
        return cell
    }
}
