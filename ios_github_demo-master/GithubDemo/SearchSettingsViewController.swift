//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Jeffrey Shao on 2/27/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var value: UILabel!
    
    weak var delegate: SettingsPresentingViewControllerDelegate?
    
    weak var searchSettings: GithubRepoSearchSettings?
    var settings = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = Float((searchSettings?.minStars)!)
        settings = Int(slider.value)
        value.text = "\(Int(slider.value))"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onChange(_ sender: AnyObject) {
        value.text = "\(Int(slider.value))"
        settings = Int(slider.value)
        
        searchSettings?.minStars = settings
        
    }

    @IBAction func saveButtonTapped(_ sender: AnyObject) {
        self.delegate?.didSaveSettings(settings: searchSettings!)
        self.dismiss(animated: true)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        self.delegate?.didCancelSettings()
        self.dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}
