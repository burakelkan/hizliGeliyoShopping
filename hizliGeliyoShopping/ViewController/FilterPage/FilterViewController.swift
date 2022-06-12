//
//  FilterViewController.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import UIKit
//HizliGeliyo:- Protocol
protocol FilterViewControllerDelegate {
    func didUpdateFilter(filter: String)
}
class FilterViewController: NavigationBaseViewController {
//HizliGeliyo:- Delegate Function
    let categories = ["Women's Clothing","Jewelery","Electronics","Men's Clothing"]
    var tableView: UITableView!
    var currentFilter = ""
    var delegate: FilterViewControllerDelegate!
//HizliGeliyo:- Filtre Button Ayarları
    let filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Filtrele", for: .normal)
        button.layer.cornerRadius = 28
        button.layer.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureFilterButton()
    }
    @objc func filterButtonAction(){
        if currentFilter == "" {
            let alert = UIAlertController(title: "Hızlı Geliyo", message: "Lütfen kategori seçimi yapınız..", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            Logger.log(text: alert.message ?? "")
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        else {
            delegate.didUpdateFilter(filter: currentFilter)
            dismiss(animated: true, completion: nil)
        }
    }
    func configureTableView(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 80))
        header.backgroundColor =  #colorLiteral(red: 0.9978141189, green: 0.7873669267, blue: 0, alpha: 1)
        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.font = UIFont(name: "Helvetica", size: 22)
        headerLabel.text = "Kategoriler"
        headerLabel.textAlignment = .center
        header.addSubview(headerLabel)
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = header
        
        view.addSubview(tableView)
    }
    func configureFilterButton(){
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterButton)
        NSLayoutConstraint.activate([
            filterButton.heightAnchor.constraint(equalToConstant: 56),
            filterButton.widthAnchor.constraint(equalToConstant:251),
            filterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -26)
        ])
        filterButton.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
    }
}
//HizliGeliyo:- FilterViewController Verileri yazdırma
extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentFilter = categories[indexPath.row]
    }
}
extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = categories[indexPath.row]
        cell?.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell?.textLabel?.textColor =  #colorLiteral(red: 0.1930363774, green: 0.2082411349, blue: 0.1979520917, alpha: 1)
        return cell!
    }
}
