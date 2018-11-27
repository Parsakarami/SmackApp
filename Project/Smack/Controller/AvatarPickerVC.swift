//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by Parsa on 11/26/18.
//  Copyright © 2018 Parsa. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    //IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    //Variables
    var avatarType : AvatarType = AvatarType.Fruit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell{
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        else{
            return AvatarCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .Fruit {
        UserDataService.instance.SetAvatarName(avatarName: "fruit\(indexPath.item + 1)")
        }else if avatarType == .Animal{
        UserDataService.instance.SetAvatarName(avatarName: "animal\(indexPath.item + 1)")
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentTypeChange(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0{
            avatarType = AvatarType.Fruit
        }else if segmentControl.selectedSegmentIndex == 1 {
            avatarType = AvatarType.Animal
        }
        collectionView.reloadData()
    }
}
