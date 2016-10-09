//
//  ViewController.swift
//  TestXC
//
//  Created by daniel martinez gonzalez on 6/10/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ViewController: UIViewController
{

    
    @IBOutlet weak var ImageIcon: UIImageView!
    @IBOutlet weak var FirstText: UILabel!
    
    let realm = try! Realm()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool)
    {
        self.navigationController?.navigationBar.hidden = false
        let QL = realm.objects(Language.self)
        
        if QL.count > 0
        {
            LoadDataInView()
        }
        else
        {
            self.AddLanguages()
            NSLog("Llenandola")
        }
    }
    
    @IBAction func SettingPress(sender: AnyObject)
    {
        let MyCart = self.storyboard?.instantiateViewControllerWithIdentifier("settingView") as? SettingViewController
            
        self.navigationController?.pushViewController(MyCart!, animated: true)

    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    
    }

    func Setting_Press(sender: UIButton!)
    {
        
        
    }
    
    func LoadDataInView()
    {
       
        let realm = try! Realm()
        let language = realm.objects(Language.self)
        
        let i = NSUserDefaults.standardUserDefaults().integerForKey("Indice")
        self.FirstText.text = language[i].text
        
    }
    
    func AddLanguages()
    {
        let url : NSString = NSBundle.mainBundle().pathForResource("Languajes", ofType: "json")! as NSString
        let data : NSData = try! NSData(contentsOfFile: url as String, options: NSDataReadingOptions.DataReadingMapped)
        
        do
        {
            let object : NSArray = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! NSArray
            
            for i in 0  ..< object.count
            {
                
                let Dict : NSDictionary = object.objectAtIndex(i) as! NSDictionary
                let oldID = i
                let oldName = Dict["name"] as! String
                let oldText = Dict["text"] as! String
                
                let language = Language()
                language.id = oldID
                language.name = oldName
                language.text = oldText
                
                try! realm.write
                {
                        realm.add(language , update: true)
                }
                
                
            }
            LoadDataInView()
            
        }
        catch
        {
            // Handle Error
        }
    }

    
    
}

