//
//  SettingViewController.swift
//  TestXC
//
//  Created by daniel martinez gonzalez on 6/10/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class SettingViewController: UIViewController , UITableViewDelegate , UITableViewDataSource
{
    
    
    @IBOutlet weak var ViewLoad: UIView!
    @IBOutlet weak var TableSelect: UITableView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ViewLoad.hidden = true
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
        
    }
    
    //MARK: UITableView Delegates and DataSource

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Select Language"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let realm = try! Realm()
        let loans = realm.objects(Language.self)
        return loans.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath)
        
        let realm = try! Realm()
        let language = realm.objects(Language.self)
        
        cell.textLabel?.text = language[indexPath.row].name
        
        return cell
    }
    
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        ViewLoad.hidden = false
        self.navigationController?.navigationBar.hidden = true
        
        
        // LOSE TIME API CALL
        DownloadNewData(indexPath.row)
        //ReturnView(indexPath.row)
        //
        
    }
    
    func DownloadNewData(ind : Int)
    {
        
        // Simple NSURL API CALL
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let request = NSURLRequest(URL: NSURL(string: "http://api.kivaws.org/v1/loans/search.json?status=fundraising")!)
        
        let task: NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data
            {
                
                var result:AnyObject
                
                do
                {
                    result = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as! NSDictionary
                    
                    let ArrLoans : NSArray = result["loans"] as! NSArray
                    
                    for i in 0  ..< ArrLoans.count
                    {
                        let Dict : NSDictionary = ArrLoans[i] as! NSDictionary
                        
                        
                        var id : Int = 0
                        
                        if Dict["id"] != nil
                        {
                            id = Dict["id"] as! Int
                        }
                        print ("\(id)")
                    }
                    
                    self.ReturnView(ind)
                    
                }
                catch
                {
                    print("ERROR API CALL")
                }
            }
        }
        task.resume()
    }

    func ReturnView (ind : Int)
    {
        NSUserDefaults.standardUserDefaults().setInteger(ind , forKey: "Indice")
        NSUserDefaults().synchronize()
        
        dispatch_async(dispatch_get_main_queue())
        {
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
}

