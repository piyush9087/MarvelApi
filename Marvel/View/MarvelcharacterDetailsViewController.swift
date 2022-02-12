//
//  MarvelcharacterDetailsViewController.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 08/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import UIKit

class MarvelcharacterDetailsViewController: UIViewController {
    
    @IBOutlet weak var characterDescTextView: UITextView!
    @IBOutlet weak var characterImageView: CharacterImageView!
    
    var characterDataReceive:CharacterModel?
    var viewModel = CharacterDetailsViewModel()
    var alertView = AlertView()
    var indicator:UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
        setActivityIndicator()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.title = characterDataReceive?.name
        self.navigationController?.navigationBar.prefersLargeTitles = false
        loadCharacterDetails()
    }
    
    // fetch Characters Details from server
    func loadCharacterDetails() {
        indicator?.startAnimating()
        if NetworkConnectionMgr().isConnectedToNetwork() {
            let timeStamp = Date().generateTimeStamp()
            let hash = String().generateMd5HashValue(timestamp:timeStamp)
            let request = CharacterRequest(hash:hash,ts:timeStamp)
            viewModel.fetchMarvelCharacterDetails(marvelCharacterRequest:request,characterId:characterDataReceive?.id ?? 0)
        }
        else {
            indicator?.stopAnimating()
            //AlertView().showAlertView(alertTitle:"Alert", alertMsg:"No Internet Connection", view:self)
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

// MARK: Implemented CharacterDetailsViewModelDelegate Protocol
extension MarvelcharacterDetailsViewController:CharacterDetailsViewModelDelegate {
    
    func didReceiveCharacterDetails(dataResponse:CharacterModel?) {
        indicator?.stopAnimating()
        if let characterDetailResponse = dataResponse {
            setValues(characterDet:characterDetailResponse)
        }
    }
    
    func didFailWithError(msg:String) {
        indicator?.stopAnimating()
        AlertView().showAlertView(alertTitle:"Alert", alertMsg:msg, view:self)
    }
    
    func setValues(characterDet:CharacterModel) {
        let imageUrl = URL(string:(characterDet.thumbnail.path + "." + characterDet.thumbnail.imageExtension))
        if let imageUrl = imageUrl {
            characterImageView.loadImage(fromURL:imageUrl, placeHolderImage:"no_image")
        }
        characterDescTextView.text = characterDet.description
    }
}

// MARK: Implemented AlertDelegate Protocol
extension MarvelcharacterDetailsViewController:AlertDelegate {
    
    func tryAgain(controller: UIViewController) {
        loadCharacterDetails()
    }
}
