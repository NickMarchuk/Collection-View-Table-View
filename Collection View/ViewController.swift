//
//  ViewController.swift
//  Collection View
//
//  Created by Nick M on 12/14/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UITableViewDataSource, UICollectionViewDelegate, UITableViewDelegate {

    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var middleCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    let topData = ["🐶","🐱","🐭","🐽","🐰","🐸","🐵","🐷","🐮","🐯","🐹"]
    let middleData = ["🦊","🐔","🐼","🐻‍❄️","🐻","🐤","🦁","🦉","🐴","🐝","🦋","🐞","🐬"]
    let bottomData = ["🍓","🍏","🍉","🍈","🍒","🫐","🥝","🍋","🥥","🍍","🍇","🍎"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        middleCollectionView.dataSource = self
        middleCollectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
// MARK: - Collection View DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == topCollectionView{
            
            return topData.count
            
        }else if collectionView == middleCollectionView{
            
            return middleData.count
            
        }
        
        return middleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == topCollectionView{
            
            let topCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCollectionViewCell
            
            topCell.topBackgroundView.layer.cornerRadius = 12
            
            topCell.topBackgroundView.layer.borderWidth = 1
            
            topCell.topBackgroundView.layer.borderColor = UIColor.systemGray.cgColor
            
            topCell.topLable.text = topData[indexPath.row]
 
            topCell.topLable.font = UIFont(name: ".AppleSystemUIFont", size: 80)
            
            return topCell
            
        }else {
            
            let midleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiddleCell", for: indexPath) as! MidleCollectionViewCell
            
            midleCell.midleBackgroundView.layer.cornerRadius = 8
            
            midleCell.midleBackgroundView.layer.borderWidth = 1
            
            midleCell.midleBackgroundView.layer.borderColor = UIColor.systemGray.cgColor

            midleCell.midleLable.text = middleData[indexPath.row]
            
            midleCell.midleLable.font = UIFont(name: ".AppleSystemUIFont", size: 60)
            
            return midleCell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == topCollectionView{
            
            infoAlertWithOkButton(title: "Title: \(topData[indexPath.row])", message: "Message: \(topData[indexPath.row])")
            
        }else{
            
            infoAlertWithOkButton(title: "Title: \(middleData[indexPath.row])", message: "Message: \(middleData[indexPath.row])")
            
        }
        
        
    }

// MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bottomData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableViewCell
        
        cell.textLabel?.text = bottomData[indexPath.row]
        
        cell.textLabel?.font = UIFont(name: ".AppleSystemUIFont", size: 80)
        
        cell.textLabel?.textAlignment = .center
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        infoAlertWithOkButton(title: "Title: \(bottomData[indexPath.row])", message: "Message: \(bottomData[indexPath.row])")
        
    }

// MARK: - Alert
    func infoAlertWithOkButton(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default) { (alertAction) in }
        
        alertController.addAction(okButton)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
}

