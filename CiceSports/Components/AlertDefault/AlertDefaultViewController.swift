//
//  AlertDefaultViewController.swift
//  CiceSports
//
//  Created by CICE on 01/06/2021.
//

import UIKit

@objc protocol AlertDefaultViewControllerDelegate: class {
    @objc optional func defultPrimaryButtonPressed(type: DefaultAlertType)
    @objc optional func defaultSecondaryButtonPressed(type: DefaultAlertType)
}

class AlertDefaultViewController: UIViewController {
    
    weak var delegate: AlertDefaultViewControllerDelegate?
    var viewModel: AlertDefaultViewModel?
    var type: DefaultAlertType?
    
    @IBOutlet weak var secondaryButton: UIButton!
    @IBOutlet weak var primaryButton: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var constrainPBToBottomSuperView: NSLayoutConstraint!
    
    @IBAction func primaryButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.defultPrimaryButtonPressed?(type: self.type ?? .none)
        }
    }
    
    @IBAction func secondaryButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.defaultSecondaryButtonPressed?(type: self.type ?? .none)
        }
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        switch viewModel?.type {
        case .confirmationNavigation:
            self.labelTitle.text = viewModel?.confirmationTitle
            self.labelMessage.text = viewModel?.confirmationMessage
            self.primaryButton.setTitle(viewModel?.confirmationPrimaryButton, for: .normal)
            self.secondaryButton.isHidden = true
            self.constrainPBToBottomSuperView.constant = 20
        default:
            self.labelTitle.text = ""
            self.labelMessage.text = ""
            self.primaryButton.setTitle("", for: .normal)
        }
        self.type = viewModel?.type
    }

}
