//
//  MarvelCharacterListViewController.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 08/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import UIKit


class MarvelCharacterListViewController: UIViewController {

    @IBOutlet weak var marvelCharacterTableview: UITableView!
    
    var viewModel = CharacterViewModel()
    var alertView = AlertView()
    
    var characterDataArray:[CharacterModel]?
    var indicator:UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        configureDelegates()
        setActivityIndicator()
        loadCharacterList()
    }
    
    // fetch Characters List from server
    func loadCharacterList() {
        indicator?.startAnimating()
        if NetworkConnectionMgr().isConnectedToNetwork() {
            let timeStamp = Date().generateTimeStamp()
            let hash = String().generateMd5HashValue(timestamp:timeStamp)
            let request = CharacterRequest(hash:hash,ts:timeStamp)
            viewModel.fetchMarvelCharacters(marvelCharacterRequest:request)
        }
        else {
            indicator?.stopAnimating()
            AlertView().showAlertViewWithReload(view:self)
        }
    }
    
    // Configure Delegates Related to All Protocol
    func configureDelegates() {
        viewModel.delegate = self
        alertView.delegate = self
    }
    
    // Configure Progress Bar
    func setActivityIndicator() {
        indicator = ActivityIndicatorView.customIndicator(at:self.view.center)
        self.view.addSubview(indicator!)
    }
}

// MARK:  Implemented AlertDelegate Protocol
extension MarvelCharacterListViewController:AlertDelegate {
    
    func tryAgain(controller: UIViewController) {
        loadCharacterList()
    }
}

// MARK: Implemented CharacterViewModelDelegate Protocol
extension MarvelCharacterListViewController:CharacterViewModelDelegate {
    
    func didReceiveResponse(dataResponse:[CharacterModel]?) {
        indicator?.stopAnimating()
        characterDataArray = dataResponse
        marvelCharacterTableview.reloadData()
    }
    
    func didFailWithError(msg:String) {
        indicator?.stopAnimating()
        AlertView().showAlertView(alertTitle:"Alert", alertMsg:msg, view:self)
    }
}

// MARK: Implemented UITableView Related Protocol
extension MarvelCharacterListViewController:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return characterDataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:CellIdentifiers.characterCell) as! CharacterTableViewCell
        let character = self.characterDataArray?[indexPath.section]
        if let localCharacter = character {
            cell.cellConfiguration(character:localCharacter)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at:indexPath, animated:true)
        let characterDetail = self.characterDataArray?[indexPath.section]
        let characterDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier:StoryBoardIdentifiers.characterDetailsVC) as! MarvelcharacterDetailsViewController
        characterDetailsViewController.characterDataReceive = characterDetail
        self.navigationController?.pushViewController(characterDetailsViewController, animated:true)
    }
}

