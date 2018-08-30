//
//  ViewController.swift
//  MagicCarpet
//
//  Created by Steven Schwedt on 7/16/18.
//  Copyright © 2018 Steven Schwedt. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var arrival: UILabel!
    @IBAction func request(_ sender: Any) {
        fetchURL(url: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchURL(url: String) {
        Alamofire.request(url).responseJSON { (response) in
            if let dataDict :Dictionary = response.value as? [String: Any] {
                if let picTitle = dataDict["title"] as? String {
                    self.arrival.text = picTitle
                }
            }
        }
    }
    
//        if let urlToServer = URL.init(string: url) {
//            let task = URLSession.shared.dataTask(with: urlToServer, completionHandler: { (data, response, error) in
//                if error != nil || data == nil {
////                    handle error !
//                } else {
//                    if let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) {
//                        if jsonObject is [Any] {
//                            print("Array: \(jsonObject)")
//                        } else if jsonObject is [String:Any]{
//                            var dictData :Dictionary = jsonObject as! [String: Any]
//                            let title = dictData["title"] as? String
//                            if let titleString = title {
//                                print(titleString)
//                                DispatchQueue.main.async {
//                                    self.arrival.text = title
//                                    print(self.arrival)
//                                }
//                            }
//                        }
//                    }
//                }
//            })
//            task.resume()
//        }
//    }
}

